Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C662D18F2D6
	for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923646; cv=none; b=qP6hG+gdQsFn91ZtDcVbuclEcc6LFpauGdWAC8dD8tACdTIPdLJIW54LC3RibcpWWFguTocIm/UnYSWS2BtmHIqsipTES9p0EhOzjSuaMj7cyOV45nDJxZIm8DHEaKWU5UaqUoQxD3HjtQX+AXP0uEXLUC3yhKIoefxWZAS+6og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923646; c=relaxed/simple;
	bh=F8sxoW9XyGEiKGmU0+ncsNzA7kTIPGiGyUdz0ED2O5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZTYwcZRNxe+ENms/XUtQ4dHOnZPazcKc5cLpQCuKRnD3Fa6yzHDs1Z+fQe7jyYT24sU42ovKTdk8wFXOTAZbQZUFrAgfL3CRLfUIX7N8tT0fOOU7LQZDxv6Gl0lqdC3fgjW1gxolQUxR4Tlx8j+i5jfzFzc2cA9c3VkcQPuSFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ej4mJuRk; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ej4mJuRk"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-201fbd0d7c2so4110245ad.0
        for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724923644; x=1725528444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ouhe0enBFjJUZqCtUzq8PmMdBjKDokZmZ4h8nJcgYbU=;
        b=Ej4mJuRk5QF63E7EszVZgxCui/v+ZUzbUqrDdigsOYfd40DYtT3ZM/dZHGZ8wGVaSG
         AOFocU8LqSu2THfDuiMkoBWeg34JsO9XjXQ/MadG51A0s5DAYwueSIDVWGyZgG/DrUxt
         o/e7ptB4M99Mx+F28ymewhdqCJt6SWwZ0QrqJz8WT5JHPNEearvAhwHtLknnBUG2gklV
         YhxNL9SQWVjtNHgGhcSzu8tBbas2lV5IWf0+nj8sw352ban+3PbkiKb0peqpBmPgZN2Z
         QoA2VWZY9Z4A59sz0LruWPrErjVt4hbnPtR9/esQF0UCnlb4/oEJmhn+HhWVrjvUVmC2
         DMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724923644; x=1725528444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ouhe0enBFjJUZqCtUzq8PmMdBjKDokZmZ4h8nJcgYbU=;
        b=SWIPRnDyvSQ31U33O9H8yxFDJxgOUhJvXAxNHqDgqOMyN5ZJb2yMfjVtUfeyrQtGI3
         zgSW4ZZKoEPx8X9ngd/L1L+g52MQUdYL9wLtgQOdyF3imBRo2raE391IoC/2SJ4L+KPf
         sfgvKjkomHFUY7+p7prwr6FBDmsXNsl/9BSqbuaBHl60Sr/kj60Ue/f+zfIx3iQesoNA
         zyjj/SUSgy9W3XE6GXybysb/0qbE0TvSev3frjotDvN0UxdG49tgQALqTjNlgzS1Umja
         awLj5aUyY148G9+mZvG1nKlYp3ezNmk7/zBswQvI6haBOCRt0j4fv9VEBG0b5lqnasnB
         LIzg==
X-Forwarded-Encrypted: i=1; AJvYcCVbtxeKKlXY6RPITDckG6xAcMKQDAAejGxLbBFQUkwEEY+UO8lwVgcHM89sYqQbyGMq/UrZ6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWcXfoOUTe/sml3ddozRwZz5ih07NylfEsRU6WoJpfg7HGrMTm
	FFDzEsiwu05vbRLMCyERpTQBv1GwZReHiGiZ1MvrgS6NJeQ3sFRz
X-Google-Smtp-Source: AGHT+IFrjUhQikLTv2qTwmStFWCrqusJSIZnC40sneETVUkJPqzLcvKuQheZLvCXJHwrdHmRDZZe5w==
X-Received: by 2002:a17:902:d584:b0:203:a0b4:3e28 with SMTP id d9443c01a7336-2050c377592mr23038675ad.27.1724923644039;
        Thu, 29 Aug 2024 02:27:24 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20515552b6dsm7469245ad.249.2024.08.29.02.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:27:23 -0700 (PDT)
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
Subject: [PATCH 3/3] irqchip/apple-aic: Add a new "Global fast IPIs only" feature level
Date: Thu, 29 Aug 2024 17:03:13 +0800
Message-ID: <20240829092610.89731-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829092610.89731-1-towinchenmi@gmail.com>
References: <20240829092610.89731-1-towinchenmi@gmail.com>
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
index 626aaeafa96c..9248ecff42a3 100644
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
+		MPIDR_CLUSTER(my_mpidr) == cluster)
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

