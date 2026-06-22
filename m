Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D22F312803
	for <asahi@lists.linux.dev>; Mon, 22 Jun 2026 06:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782109970; cv=none; b=cc9i3FLh8yKWAdDC7zqUxYzqmw+Ctf+443IhxHpDlilfxwd/EpARka5Gic035KhE7qjNavBpItxuXd0DZOGBKSpQ0i/FfQMgKEbxc+mjm6aRXjMphhEf6FGko2mXaOv4yubpGPuSf8VGQ/zNgz4UprQRlJ5QbYuHP/BB7n6fwoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782109970; c=relaxed/simple;
	bh=Ph98BNagAcpCcvg/wK/HIOmbMcupdkvzuVrC0WftzD8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i78pxYMMMvEtDKL6eiHW/xFY9DJEiIMc68j7FX2UKmynmR42qVmGpa5g7LtlmL2Xb32xSLdj0vYUSSrcGFWQ49B49IuKC1hRfjYusmQKE4iO5FbBj5k0kSF1h0XiAL5TwULH/VsbvN1R9Xi+2JRUff2uByoFq2OPTZygh3YZUjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=anxSwA3F; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="anxSwA3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Vb
	Fb/6GVKTHYyuv2TspUzd+JHLzdcZvRKyaUrUAD6xA=; b=anxSwA3F/e+LEI4hE7
	rN0jVqIhPUHAUBFDAE26uQ5HJv88/tHlwH+WEopHXhMYgV8ZEmH+bklyqmLxwS4U
	pG1TOhkgbk252wEWP4sZTvKjOqJ+erx46trWbDAjBJVMMHV8je6MrmGRyt7uqGwI
	WYZAmuXhAnr3FHudt0Hdzz618=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCnHhnU1jhqLVXCFA--.6100S2;
	Mon, 22 Jun 2026 14:31:50 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: sven@kernel.org,
	j@jannau.net,
	neal@gompa.dev,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] cpufreq: apple-soc: Add missing OPP table cleanup on init failure
Date: Mon, 22 Jun 2026 14:31:48 +0800
Message-Id: <20260622063148.751787-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnHhnU1jhqLVXCFA--.6100S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Wr4xZrWfXF18tw47GF4kWFg_yoW8JF1rpF
	W5Way5Cr95tFs2qws8AF40g3W7tw1Du3y2g3W7Gwsavw1DZF1Fqa4kGFyj9F95CrZ5JF43
	Aryrtay7Za18JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piyE_tUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxhaTAmo41tYS+QAA34

apple_soc_cpufreq_init() adds the OPP table with
dev_pm_opp_of_add_table(), but some later error
paths can return without removing it.

Add the missing dev_pm_opp_of_remove_table() call
to clean up the OPP table on init failure.

Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 9396034167e5..4dae968e84df 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -260,7 +260,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 	ret = apple_soc_cpufreq_find_cluster(policy, &reg_base, &info);
 	if (ret) {
 		dev_err(cpu_dev, "%s: failed to get cluster info: %d\n", __func__, ret);
-		return ret;
+		goto out_remove_table;
 	}
 
 	ret = dev_pm_opp_set_sharing_cpus(cpu_dev, policy->cpus);
@@ -326,6 +326,8 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 	dev_pm_opp_remove_all_dynamic(cpu_dev);
 out_iounmap:
 	iounmap(reg_base);
+out_remove_table:
+	dev_pm_opp_of_remove_table(cpu_dev);
 	return ret;
 }
 
-- 
2.25.1

