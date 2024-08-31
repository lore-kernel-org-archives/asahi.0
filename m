Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFA41531D0
	for <asahi@lists.linux.dev>; Sat, 31 Aug 2024 05:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725083845; cv=none; b=pBfK28LlkRA51pSgvgeEWhK0UepjmpNc1nepByalZqExePV50EfxsId/NfSpDMnf3KSKn8ze+0zPMSAmVdCjeoTzerAfW5VyNZH/0M2s8iuLxOiCc4wUxwe1GErZTxu82Eg/wAfQebir98jYvCc1IaZMjU6FiluRFBk69Dha4wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725083845; c=relaxed/simple;
	bh=AiAs+f0DOwqb3mqumMEKWPoSTet5sVEF8qBpc+MVTOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fKI73o6NoDKsoBOb5XLc5SiXtmNvIqL79y5IUdyaYK3vD2jUZysp8fNRG5Ejpd1auovyZ41YozYEw27myf6qwu7air9VbNbMhOuoI5yoN1FYTB8q7SmOeVHGsjVStzk/FyF7YEOdS42KQCo1LgyV3e4YXwe5aQ1JCnEiwzMHFpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOtPh9hh; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOtPh9hh"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7163489149eso1656403a12.1
        for <asahi@lists.linux.dev>; Fri, 30 Aug 2024 22:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725083843; x=1725688643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wrsQB/6kr7Ma/wyHDMG36Gt57JsM43DlFH99Cporu0=;
        b=EOtPh9hhRhjb1GouX1v69QGMYDnWHYZMZs6uTH3BBNFqZhXg1kCMLjNAZ7wWTrWU5Y
         6TirUKmSXlY1pCsvPgHXcsFcndPwcg742cZ7RgWr5X8O7M7LXJ45FyOS2z3EhGHGm/P5
         WBfnKWbirvmbZwUpttBgrv6KUxezMRGYUGu+dq1SZUS8KUOS8bN3x7GwMlCIYxt0JZ6H
         5TaR5qji3RiEDz1OlNzz2u90w+GOh7DXW7UXmGzcys+nPaZ72ut0pvNNJllSN+k/n0w2
         2ezpfGJpRqCDqw8IIrqoWaZhOAsCuHdg2xFRqZzThUReeU1u/RAwS3vAKrOrxOmmpoMx
         r8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725083843; x=1725688643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wrsQB/6kr7Ma/wyHDMG36Gt57JsM43DlFH99Cporu0=;
        b=Ym2EYUOQp2iN/4oLwER/rAIttQaF9WyFHx2ap3fbVa7IOWIbUUvwKa+JR8ECS6jgo1
         W15LWGPgvvfYPowTcesPY1uXJd7jYJ4YGvl7UKPcMEm+RqMktNoZ3K3RHvzkWQx9gWgr
         V0lkJUPl/bwjaC0QYqUVaHGD+yX0Ywd0AAkDaJseWRElGqmbsDgRkmocPteuLqPbwQCz
         TocwM3/OW3csEXVesU9SoerxLMry6uUuko2RtzRP5hr9wahikXRTz22XarDJDRDqaVtu
         a3mdHQWm4ZKYNY1MfGr0rWBFR4XDOHJQu/SE+uv0LofBmTYCrvc/twh6VqiOm6b5nOn7
         huLw==
X-Forwarded-Encrypted: i=1; AJvYcCWCDifDtpIfLkUc8Q5HZjvZJJwjsV5ErmufAepVZglVOrA5LhpzfP9wa6qHqGShgzySsAKp/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzB6HXRFCBfvGrR+2I1xdDsGL/G8AYBF3JXjJBqNcWND7wtinmu
	mX4k8xDjfFGgp9AEhaFqn8wrQahYEzlj328J6s+jsT87MJsz5tmd
X-Google-Smtp-Source: AGHT+IHdDgp5kIe/Uz9eKdMkNiesjGU6gPSz8C0iguDZ2YnuDqyASfy0yI9S6X6wUtplLyyhUB+OQg==
X-Received: by 2002:a05:6a20:e68c:b0:1c4:8291:e94e with SMTP id adf61e73a8af0-1cece047a11mr2504621637.45.1725083843358;
        Fri, 30 Aug 2024 22:57:23 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2053aa8cb4asm12027045ad.271.2024.08.30.22.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 22:57:23 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	konrad.dybcio@somainline.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 3/4] irqchip/apple-aic: Add a new "Global fast IPIs only" feature level
Date: Sat, 31 Aug 2024 13:48:18 +0800
Message-ID: <20240831055605.3542-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240831055605.3542-1-towinchenmi@gmail.com>
References: <20240831055605.3542-1-towinchenmi@gmail.com>
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
 drivers/irqchip/irq-apple-aic.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index 8d81d5fb3c50..01a3c79054f5 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -235,6 +235,8 @@ enum fiq_hwirq {
 };
 
 static DEFINE_STATIC_KEY_TRUE(use_fast_ipi);
+/* True if SYS_IMP_APL_IPI_RR_LOCAL_EL1 exists for local fast IPIs (M1+) */
+static DEFINE_STATIC_KEY_TRUE(use_local_fast_ipi);
 
 struct aic_info {
 	int version;
@@ -252,6 +254,7 @@ struct aic_info {
 
 	/* Features */
 	bool fast_ipi;
+	bool local_fast_ipi;
 };
 
 static const struct aic_info aic1_info __initconst = {
@@ -270,17 +273,32 @@ static const struct aic_info aic1_fipi_info __initconst = {
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
 
 	.irq_cfg	= AIC2_IRQ_CFG,
 
 	.fast_ipi	= true,
+	.local_fast_ipi = true,
 };
 
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
@@ -750,7 +768,8 @@ static void aic_ipi_send_fast(int cpu)
 	u64 cluster = MPIDR_CLUSTER(mpidr);
 	u64 idx = MPIDR_CPU(mpidr);
 
-	if (MPIDR_CLUSTER(my_mpidr) == cluster)
+	if (static_branch_likely(&use_local_fast_ipi) &&
+	    MPIDR_CLUSTER(my_mpidr) == cluster)
 		write_sysreg_s(FIELD_PREP(IPI_RR_CPU, idx),
 			       SYS_IMP_APL_IPI_RR_LOCAL_EL1);
 	else
@@ -990,6 +1009,9 @@ static int __init aic_of_ic_init(struct device_node *node, struct device_node *p
 	if (!irqc->info.fast_ipi)
 		static_branch_disable(&use_fast_ipi);
 
+	if (!irqc->info.local_fast_ipi)
+		static_branch_disable(&use_local_fast_ipi);
+
 	irqc->info.die_stride = off - start_off;
 
 	irqc->hw_domain = irq_domain_create_tree(of_node_to_fwnode(node),
-- 
2.46.0

