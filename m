Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447FC7EA
	for <asahi@lists.linux.dev>; Wed,  4 Jan 2023 10:22:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 8896A41DF4;
	Wed,  4 Jan 2023 10:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1672827731; bh=C65Y880SV1Tdts/rGaPJHJDfQ8ugZxGMUgNTK5mzFGs=;
	h=From:To:Cc:Subject:Date;
	b=dHYMK6WAEPqelJLF5YEYu1B0EEsAKD+W5xwP4bMwOSs8erzoVRN8IC1dKJllMa+vF
	 ude2NFLUUFa3jLATefD+0kxumhCMEhXtt8PRJKVpw6Q/EZoeTxlKSiYx6RuOBkLXEf
	 jAw5f9VXpRQR2gf/TUJnC0PeOcsf9UIMs2/MaERTdIZiFcORo+8kueO1EwoufihK+X
	 ELMG7mUMCiss0uHxxIk6EaLzgB6QCmNnVtV3QGeGZtqiYYf5+udtRpyBpqW6O/0G87
	 kZ+QuU10TV15lyCStlDtn7OkT0vajJCWUVSM8aiLoqm0/oyaeYwrhWhaA1PR3wct//
	 4v5EyVadU1jsA==
From: Hector Martin <marcan@marcan.st>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: apple-soc: Switch to the lowest frequency on suspend
Date: Wed,  4 Jan 2023 19:21:49 +0900
Message-Id: <20230104102149.16263-1-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without this, the CPUs are left in a random pstate. Since we don't
support deep idle yet (which powers down the CPUs), this results in
significantly increased idle power consumption in suspend.

Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index d1801281cdd9..1b4e6c701860 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -280,6 +280,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 	policy->cpuinfo.transition_latency = transition_latency;
 	policy->dvfs_possible_from_any_cpu = true;
 	policy->fast_switch_possible = true;
+	policy->suspend_freq = freq_table[0].frequency;
 
 	if (policy_has_boost_freq(policy)) {
 		ret = cpufreq_enable_boost_support();
@@ -329,6 +330,7 @@ static struct cpufreq_driver apple_soc_cpufreq_driver = {
 	.fast_switch	= apple_soc_cpufreq_fast_switch,
 	.register_em	= cpufreq_register_em_with_opp,
 	.attr		= apple_soc_cpufreq_hw_attr,
+	.suspend	= cpufreq_generic_suspend,
 };
 
 static int __init apple_soc_cpufreq_module_init(void)
-- 
2.35.1

