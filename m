Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BCA5663
	for <asahi@lists.linux.dev>; Thu, 16 Feb 2023 14:12:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D2AF1682;
	Thu, 16 Feb 2023 06:13:32 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51DCA3F703;
	Thu, 16 Feb 2023 06:12:48 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: asahi@lists.linux.dev,
	ecurtin@redhat.com,
	j@jannau.net,
	lina@asahilina.net,
	linux-kernel@vger.kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	ravi.bangoria@amd.com,
	will@kernel.org
Subject: [PATCH 2/2] arm64: perf: reject CHAIN events at creation time
Date: Thu, 16 Feb 2023 14:12:39 +0000
Message-Id: <20230216141240.3833272-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230216141240.3833272-1-mark.rutland@arm.com>
References: <20230216141240.3833272-1-mark.rutland@arm.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently it's possible for a user to open CHAIN events arbitrarily,
which we previously tried to rule out in commit:

  ca2b497253ad01c8 ("arm64: perf: Reject stand-alone CHAIN events for PMUv3")

Which allowed the events to be opened, but prevented them from being
scheduled by by using an arm_pmu::filter_match hook to reject the
relevant events.

The CHAIN event filtering in the arm_pmu::filter_match hook was silently
removed in commit:

  bd27568117664b8b ("perf: Rewrite core context handling")

As a result, it's now possible for users to open CHAIN events, and for
these to be installed arbitrarily.

Fix this by rejecting CHAIN events at creation time. This avoids the
creation of events which will never count, and doesn't require using the
dynamic filtering.

Attempting to open a CHAIN event (0x1e) will now be rejected:

| # ./perf stat -e armv8_pmuv3/config=0x1e/ ls
| perf
|
|  Performance counter stats for 'ls':
|
|    <not supported>      armv8_pmuv3/config=0x1e/
|
|        0.002197470 seconds time elapsed
|
|        0.000000000 seconds user
|        0.002294000 seconds sys

Other events (e.g. CPU_CYCLES / 0x11) will open as usual:

| # ./perf stat -e armv8_pmuv3/config=0x11/ ls
| perf
|
|  Performance counter stats for 'ls':
|
|            2538761      armv8_pmuv3/config=0x11/
|
|        0.002227330 seconds time elapsed
|
|        0.002369000 seconds user
|        0.000000000 seconds sys

Fixes: bd27568117664b8b ("perf: Rewrite core context handling")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/perf_event.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
index 3e43538f6b72..dde06c0f97f3 100644
--- a/arch/arm64/kernel/perf_event.c
+++ b/arch/arm64/kernel/perf_event.c
@@ -1063,6 +1063,14 @@ static int __armv8_pmuv3_map_event(struct perf_event *event,
 				       &armv8_pmuv3_perf_cache_map,
 				       ARMV8_PMU_EVTYPE_EVENT);
 
+	/*
+	 * CHAIN events only work when paired with an adjacent counter, and it
+	 * never makes sense for a user to open one in isolation, as they'll be
+	 * rotated arbitrarily.
+	 */
+	if (hw_event_id == ARMV8_PMUV3_PERFCTR_CHAIN)
+		return -EINVAL;
+
 	if (armv8pmu_event_is_64bit(event))
 		event->hw.flags |= ARMPMU_EVT_64BIT;
 
-- 
2.30.2

