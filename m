Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D2932C85
	for <asahi@lists.linux.dev>; Sun,  1 Sep 2024 03:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725162169; cv=none; b=rWDkA/zxuiCjKNb3UUs5EijjolHBxbO+oSD3lmkhb4DCYl2zfVuZ/xhW8sR+6w22LFePprCtNqLUtlzLZMwHDWTY7gQOFPAhR72zt0c0AqaxytTKYpaOP5Mv7QbCVjGfKrrYD366JPTB6Zbtq45kk7K1HudEm4aFYnIet0UeE/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725162169; c=relaxed/simple;
	bh=NO2N9/KhoJcrA+Vj6BknOwBwT+s8n97n7WgqObtyrfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kx26tA4y4vqZqpwo3vXkHFE52hiTPuVg97EQg4WrAEVv8Bgr1sT095c7GvjRS+W4chXyLFINEbddFnXMFgC68eiSzLo24pAD9xH7il/eaF/j4+t9aPBWIHVIumZOoI4HDsJKfigzY6djL/FbyHphlsBfGeK6gExYEfMHxsj+CbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0KLdmAb; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0KLdmAb"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-714226888dfso2563239b3a.1
        for <asahi@lists.linux.dev>; Sat, 31 Aug 2024 20:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725162167; x=1725766967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8P/VLH/bkCVi0Kmx8/pRYs60oDjzwE57I92YjRqe88o=;
        b=j0KLdmAb3KkK5kLqAdtxx2S7RZbtFDL5/6MU3kYUpZ4BFtI2/5MV6Fhm6YRvvlYIme
         V5r3tgvDRk21qTB4D809Z7oK4kHiQxfbajnbF7D3d/gSWM+I6fj6pvc52A1ziJbUaOYZ
         tI0JJlpasY/hf2uqiDFdm0ucsXBNH0SNSa7kj8UTfVkyOCfBYZUnXi2wPoNiV7T2FewF
         E1jRCZ4KkTR/DV9svxfDlJ4WCQPMSdlJpaiHRs9dj2HYDLo+xR6pNLlptuQZQ5RG5gvj
         JD+HuE+dc1CWrVyMgNQbh3bDMAXjmlF1LXFZRzbafec+JzDM1/z4w9f2l/cZoTbjsohi
         FA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725162167; x=1725766967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8P/VLH/bkCVi0Kmx8/pRYs60oDjzwE57I92YjRqe88o=;
        b=I+VMUzhYewxNvTDzSnugD8O8AAcRPcF+WK1b24gtt3TfDfYVA/FFF8QFgKCeKMnPxb
         rNj0YD+Yz6ICWscC5zFS6+qElqTW7xQGS1rHyqYkO+sK2zaDbBxy5iHG5/xOsGwLCne8
         FRrxlgDVFEo4aYnRzf3KICnU7KXKNozOL2gMyIk1vdTFxUZkQFhdmu3n57T0YooQRtxr
         gM3+zA0vmRppmmIQKKEmQZI98aU10n44a407QNEVkf8X7kwyt8XboOBxF7dDicMJNw0N
         3ZWzTMdr6alrM3v5WAZuO8TQvx1dwnVxZbKwa2vyA3vp8IKvhOpA/wzosrjLg/3XUyxD
         RxXg==
X-Forwarded-Encrypted: i=1; AJvYcCWp71jedvVd8uyKh2A+19LnX86zFm4Ubu4Ln3rEcZSnwuftJTemkYt5bgQWPXiL24vSnv9EZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwGDONz82OHlf9tPoe3Ml91qIkiLOCBI+0GERGQy06ECpJ1J6r
	kqdEqg0H7/mAc5gHkHnegy6bdC7H/QhHlvFRfqxFYFMqby5j+PWR
X-Google-Smtp-Source: AGHT+IFhht1qKXBiPs9HIAzfuSOxGKr51cNM8GUgWfxyXslOI4NWrGfhD0H/m6YtWxDBqqE9Ki9wQA==
X-Received: by 2002:a05:6a00:928d:b0:706:5cd9:655d with SMTP id d2e1a72fcca58-715dfc3a4f1mr12316514b3a.22.1725162167046;
        Sat, 31 Aug 2024 20:42:47 -0700 (PDT)
Received: from localhost.localdomain ([49.130.72.113])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-715e55771ccsm4826767b3a.43.2024.08.31.20.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 20:42:46 -0700 (PDT)
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
	konrad.dybcio@somainline.org,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 3/4] irqchip/apple-aic: Add a new "Global fast IPIs only" feature level
Date: Sun,  1 Sep 2024 11:40:06 +0800
Message-ID: <20240901034143.12731-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901034143.12731-1-towinchenmi@gmail.com>
References: <20240901034143.12731-1-towinchenmi@gmail.com>
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

Reviewed-by: Sven Peter <sven@svenpeter.dev>
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

