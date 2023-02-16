Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3455663
	for <asahi@lists.linux.dev>; Thu, 16 Feb 2023 14:12:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 249FB1042;
	Thu, 16 Feb 2023 06:13:28 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0A7143F703;
	Thu, 16 Feb 2023 06:12:43 -0800 (PST)
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
Subject: [PATCH 0/2] arm_pmu: fix fallout from context handling rewrite
Date: Thu, 16 Feb 2023 14:12:37 +0000
Message-Id: <20230216141240.3833272-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Janne reports [1] that perf has been broken on Apple M1 as of commit:

  bd27568117664b8b ("perf: Rewrite core context handling")

This is due to changes to pmu::filter_match() and
arm_pmu::filter_match(), which have been renamed and had their polarity
inverted, but the conversion was inconsistent, and so in some cases we
return the opposite result relative to what we had intended. This
results in consistently losing events on Apple M1.

That commit also (silently) removed the filtering of CHAIN events, which
is undesireable.

These patches fix and simplify the CPU filtering, and replace the CHAIN
event filtering with early rejection of CHAIN events, which is much
simpler.

Thanks,
Mark

[1] https://lore.kernel.org/asahi/20230215-arm_pmu_m1_regression-v1-1-f5a266577c8d@jannau.net/

Mark Rutland (2):
  arm_pmu: fix event CPU filtering
  arm64: perf: reject CHAIN events at creation time

 arch/arm64/kernel/perf_event.c | 15 ++++++++-------
 drivers/perf/arm_pmu.c         |  8 +-------
 include/linux/perf/arm_pmu.h   |  1 -
 3 files changed, 9 insertions(+), 15 deletions(-)

-- 
2.30.2

