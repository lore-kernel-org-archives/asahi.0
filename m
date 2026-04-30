Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9236C39B488
	for <asahi@lists.linux.dev>; Thu, 30 Apr 2026 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777566792; cv=none; b=JVA+x7HMCiDQm8MZGU9H/BacGHkfVZcbpR3C/MwhrC5m9mXY2XuKSnlSrbYPAb2xXksQkM5h4/NMXo0fHRljmCJuM7oSVvfHPRff0UFL0KlG5K4+lUkQd3OT8DfHVe9bApM+wJuQPfiGrJGwSIE/Hg1j6L5C81kB9RORTwIoWKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777566792; c=relaxed/simple;
	bh=37S/jeR+9UamGrjseRsSa49ojUjfRLdHxo7rQfBghLs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KuodLPz/59ehA2h7yeEUv5ZcxD+B7+4kOLIAOsMx+cMsZjeCMN9kBF+Jt4fqL00MKyNjVxkDJDjXbvhOL0/THREyeF5hBMNEO1kp7HhFNsG+BPyx1RzguNMc2GqO+7dmTtW5iLYr4KDPtQzLHvuJUrGjwDnun5rdrxGvonhsa64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mm+i5imG; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mm+i5imG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=a2
	gixQBQxDx3b8t9YQ5XreDqRrVjp7DmMKI0uRw8O2g=; b=mm+i5imGdGyC9Y+zBx
	C6B0yWpDd1P21sVo8VA7rdsqzt3a9KLAbtAqY63t0BUW5NOcA+StbAO5Z9wiID4X
	/4hZDnqzvvl/wdl1QYS23RXWh7ukpmfCaEFXtukVKet73x1YlfrRg10BNSLLSDiI
	3CIt+8bNF3UROOkyUKtw+tVNo=
Received: from zhb.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgA3t7MPhPNpY8phBw--.45309S3;
	Fri, 01 May 2026 00:32:19 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: ray.huang@amd.com,
	mario.limonciello@amd.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	sven@kernel.org,
	j@jannau.net
Cc: perry.yuan@amd.com,
	kprateek.nayak@amd.com,
	neal@gompa.dev,
	linux-pm@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 1/2] cpufreq/amd-pstate: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:32:12 +0800
Message-Id: <20260430163213.44695-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430163213.44695-1-18255117159@163.com>
References: <20260430163213.44695-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgA3t7MPhPNpY8phBw--.45309S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr48KF4xKF45JFW5tw4rAFb_yoW5Aw4DpF
	W5CF4Iyr4Yqa1DtF43Ga1UWr1FqF1qkw4DJanIq397W3W5A3yUXa4vyw1UW34UZFyqgw15
	uayUXFW3Ga1Sv3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRa9akUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xR9IWnzhBSRRgAA3+

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/cpufreq/amd-pstate.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index 453084c67327..1037d1722263 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -246,12 +246,10 @@ static int msr_update_perf(struct cpufreq_policy *policy, u8 min_perf,
 
 	value = prev = READ_ONCE(cpudata->cppc_req_cached);
 
-	value &= ~(AMD_CPPC_MAX_PERF_MASK | AMD_CPPC_MIN_PERF_MASK |
-		   AMD_CPPC_DES_PERF_MASK | AMD_CPPC_EPP_PERF_MASK);
-	value |= FIELD_PREP(AMD_CPPC_MAX_PERF_MASK, max_perf);
-	value |= FIELD_PREP(AMD_CPPC_DES_PERF_MASK, des_perf);
-	value |= FIELD_PREP(AMD_CPPC_MIN_PERF_MASK, min_perf);
-	value |= FIELD_PREP(AMD_CPPC_EPP_PERF_MASK, epp);
+	FIELD_MODIFY(AMD_CPPC_MAX_PERF_MASK, &value, max_perf);
+	FIELD_MODIFY(AMD_CPPC_DES_PERF_MASK, &value, des_perf);
+	FIELD_MODIFY(AMD_CPPC_MIN_PERF_MASK, &value, min_perf);
+	FIELD_MODIFY(AMD_CPPC_EPP_PERF_MASK, &value, epp);
 
 	if (trace_amd_pstate_epp_perf_enabled()) {
 		union perf_cached perf = READ_ONCE(cpudata->perf);
@@ -300,8 +298,7 @@ static int msr_set_epp(struct cpufreq_policy *policy, u8 epp)
 	int ret;
 
 	value = prev = READ_ONCE(cpudata->cppc_req_cached);
-	value &= ~AMD_CPPC_EPP_PERF_MASK;
-	value |= FIELD_PREP(AMD_CPPC_EPP_PERF_MASK, epp);
+	FIELD_MODIFY(AMD_CPPC_EPP_PERF_MASK, &value, epp);
 
 	if (trace_amd_pstate_epp_perf_enabled()) {
 		union perf_cached perf = cpudata->perf;
@@ -441,8 +438,7 @@ static int shmem_set_epp(struct cpufreq_policy *policy, u8 epp)
 	}
 
 	value = READ_ONCE(cpudata->cppc_req_cached);
-	value &= ~AMD_CPPC_EPP_PERF_MASK;
-	value |= FIELD_PREP(AMD_CPPC_EPP_PERF_MASK, epp);
+	FIELD_MODIFY(AMD_CPPC_EPP_PERF_MASK, &value, epp);
 	WRITE_ONCE(cpudata->cppc_req_cached, value);
 
 	return ret;
@@ -575,12 +571,10 @@ static int shmem_update_perf(struct cpufreq_policy *policy, u8 min_perf,
 
 	value = prev = READ_ONCE(cpudata->cppc_req_cached);
 
-	value &= ~(AMD_CPPC_MAX_PERF_MASK | AMD_CPPC_MIN_PERF_MASK |
-		   AMD_CPPC_DES_PERF_MASK | AMD_CPPC_EPP_PERF_MASK);
-	value |= FIELD_PREP(AMD_CPPC_MAX_PERF_MASK, max_perf);
-	value |= FIELD_PREP(AMD_CPPC_DES_PERF_MASK, des_perf);
-	value |= FIELD_PREP(AMD_CPPC_MIN_PERF_MASK, min_perf);
-	value |= FIELD_PREP(AMD_CPPC_EPP_PERF_MASK, epp);
+	FIELD_MODIFY(AMD_CPPC_MAX_PERF_MASK, &value, max_perf);
+	FIELD_MODIFY(AMD_CPPC_DES_PERF_MASK, &value, des_perf);
+	FIELD_MODIFY(AMD_CPPC_MIN_PERF_MASK, &value, min_perf);
+	FIELD_MODIFY(AMD_CPPC_EPP_PERF_MASK, &value, epp);
 
 	if (trace_amd_pstate_epp_perf_enabled()) {
 		union perf_cached perf = READ_ONCE(cpudata->perf);
-- 
2.34.1

