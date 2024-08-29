Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52323191F72
	for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929536; cv=none; b=dNHz5TD5EwBzOQggo9CQKH45PVRUVaev+162a6uG7oVTJjZnBpia9xAdQShIJzKKYOL5wvhbtuILgrx4X2rlqgt4X5wWWauUQ/oI7+37D9b7XuoduRvedRFBbsk6CmM0FKoJpLntOnsWttVbBpxzuh1kkpZaKAOCQsu4rQpztD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929536; c=relaxed/simple;
	bh=GsymrVXVYO+dO7YPnEgbp7GbzajeB94SocfoMFoRvQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uN+WTL7nGIoHGUafQjfQHHLnD0kOheJfEzsbOJ/rmWvxgo3e8IPTk5k1CUAVuIv80pGyIL2XNdzpkeUgKsv9uF29JgGqu3/HR4uH5NE8rVMffnDk+rfE/KlRosg5NySiUEaqiExs+0uWl7WlDbrTa24P0l8kZWqbjyQOXTa05+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7k1esRY; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7k1esRY"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-39d311d8091so1490605ab.3
        for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724929534; x=1725534334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IMpDPXDzGDzNLDUQoG0T+dbS2HtKvxhLaW4H3a0SWA=;
        b=k7k1esRYX+Vv+GTA/GukDDtoCtxJw2cHklSbNAR8oqwOIh9VIw9tSay2JXZEuAPnaw
         Cap8OG/plIJaDEplo9PSGR1f4FixwRHH56eXReudgT+LmjcOt5NuQCLPdZilkd/A5/UA
         90FELhCo9NTp2y9dSrHVvauCKnPox5okEc7tv14WvV8483S++tyaX+Fd0XjnepLpK4Ul
         ayBSIfyjxYr0ms1Dyu+/Po36viNgOfE/gIH3Guh2EtF4U+XJ1831FFCL++NPAS9puTvw
         1yk9fgx/7y5POmwgIuy4nyAaXqLGG0G26mUyCOHsFJUT2lDtcZHR3voxbu+FSOP8+/FC
         LRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724929534; x=1725534334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IMpDPXDzGDzNLDUQoG0T+dbS2HtKvxhLaW4H3a0SWA=;
        b=L3NJcLCh6jePd1emTuvSSDaO+3CGgeOOT6CtWAHmdtx386xgyicWtYyjRo+XeopFHI
         40R689Uz8diKTUdZYbmSuZfeILkvGP+RaM8JnPRRwpApXppaeaWD8Lq2wkpBeTNQ5Yfq
         3FKL2jaZ6C7oMpOk36FDxM8rTNmgnD362A8sUt4x2c8Bpizt2w5gSFKNWFy9d9vCAq/J
         HT0/EuYKi3Raj5G8JhXqhA609RfXYAiuXPJMDkim/gUNTXxhCiQUoIhdpMs/IbiT0Mwr
         3i0nPinnCLyD+gUWoI0dIpnSLCqI55PNN+meFo0Z8APgKFLcUN/EGBgFhNxo0YI/Svdm
         oQqw==
X-Forwarded-Encrypted: i=1; AJvYcCUM6CUmIoltf1WLLXzb/6a/0ByCMPP3kM5Si5atKzJpNzAjhAATwfpxtjygwsqS+I/CECLYOA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs1jM7a82N/E9b3cLjkqHV2TgoAqMjzlLEX+tvQV/RT96W7uJL
	cPa1jtNEzhd0ReBNa0dnjz2Fkj0o+z95kFwKX2UgRzku4lm+gEvh
X-Google-Smtp-Source: AGHT+IFYAL99M0w1KDBpEHhep4dtC4BZqLVTkjCxoeojjokRbvlVxXXPnm1VO8JCrwFH6dbpOIGYzQ==
X-Received: by 2002:a05:6e02:4b2:b0:39d:4c8a:370d with SMTP id e9e14a558f8ab-39f37837f5fmr24973345ab.18.1724929534467;
        Thu, 29 Aug 2024 04:05:34 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-715e5576cc7sm906671b3a.32.2024.08.29.04.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 04:05:34 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND 3/3] irqchip/apple-aic: Add a new "Global fast IPIs only" feature level
Date: Thu, 29 Aug 2024 19:02:17 +0800
Message-ID: <20240829110436.46052-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829110436.46052-1-towinchenmi@gmail.com>
References: <20240829110436.46052-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting with the A11 (T8015) SoC, Apple began using arm64 sysregs for
fast IPIs. However, on A11, there is no such things as "Local" fast IPIs,
as the SYS_IMP_APL_IPI_RR_LOCAL_EL1 register does not seem to exist.

Add a new feature level, used by the compatible "apple,t8015-aic",
controlled by a static branch key named use_local_fast_ipi. When
use_fast_ipi is true and use_local_fast_ipi is false, fast IPIs are used
but all IPIs goes through the register SYS_IMP_APL_IPI_RR_GLOBAL_EL1, as
"global" IPIs.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/irqchip/irq-apple-aic.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index 626aaeafa96c..1640074af2e1 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -236,6 +236,8 @@ enum fiq_hwirq {
 
 /* True if UNCORE/UNCORE2 and Sn_... IPI registers are present and used (A11+) */
 static DEFINE_STATIC_KEY_TRUE(use_fast_ipi);
+/* True if SYS_IMP_APL_IPI_RR_LOCAL_EL1 exists (M1+) */
+static DEFINE_STATIC_KEY_TRUE(use_local_fast_ipi);
 
 struct aic_info {
 	int version;
@@ -253,6 +255,7 @@ struct aic_info {
 
 	/* Features */
 	bool fast_ipi;
+	bool local_fast_ipi;
 };
 
 static const struct aic_info aic1_info __initconst = {
@@ -271,6 +274,16 @@ static const struct aic_info aic1_fipi_info __initconst = {
 	.fast_ipi	= true,
 };
 
+static const struct aic_info aic1_local_fipi_info __initconst = {
+	.version	= 1,
+
+	.event		= AIC_EVENT,
+	.target_cpu	= AIC_TARGET_CPU,
+
+	.fast_ipi	= true,
+	.local_fast_ipi = true,
+};
+
 static const struct aic_info aic2_info __initconst = {
 	.version	= 2,
 
@@ -282,6 +295,10 @@ static const struct aic_info aic2_info __initconst = {
 static const struct of_device_id aic_info_match[] = {
 	{
 		.compatible = "apple,t8103-aic",
+		.data = &aic1_local_fipi_info,
+	},
+	{
+		.compatible = "apple,t8015-aic",
 		.data = &aic1_fipi_info,
 	},
 	{
@@ -748,7 +765,8 @@ static void aic_ipi_send_fast(int cpu)
 	u64 cluster = MPIDR_CLUSTER(mpidr);
 	u64 idx = MPIDR_CPU(mpidr);
 
-	if (MPIDR_CLUSTER(my_mpidr) == cluster)
+	if (static_branch_likely(&use_local_fast_ipi) &&
+	    MPIDR_CLUSTER(my_mpidr) == cluster)
 		write_sysreg_s(FIELD_PREP(IPI_RR_CPU, idx),
 			       SYS_IMP_APL_IPI_RR_LOCAL_EL1);
 	else
@@ -992,6 +1010,11 @@ static int __init aic_of_ic_init(struct device_node *node, struct device_node *p
 	else
 		static_branch_disable(&use_fast_ipi);
 
+	if (irqc->info.local_fast_ipi)
+		static_branch_enable(&use_local_fast_ipi);
+	else
+		static_branch_disable(&use_local_fast_ipi);
+
 	irqc->info.die_stride = off - start_off;
 
 	irqc->hw_domain = irq_domain_create_tree(of_node_to_fwnode(node),
-- 
2.46.0

