Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9073783DE
	for <asahi@lists.linux.dev>; Mon, 23 Feb 2026 20:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771879391; cv=none; b=pCpcXe4en9RFTUKkdYlJ2nN4IBCPuvOje0WZA+UCqJVu+zjhZlK58Cyk6dZkBMCcSIGCkMsoiNoE3fIzqtXw4tItTVVhoJC7c2O4aA+4OKvqwz7seybcOSn7BWRDzkImPzdZbgydtitxyWKN0FvvxM5UmnrRXx7vUZSdCzu970I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771879391; c=relaxed/simple;
	bh=aKoo4YBq/Uqj0VSrCmwqEjNlbhSMYNVcm3Wkdx9ZwzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1MkdU+Y5XPx9xzyVqtynx7V4pEVpy03rm5Yu2bgbknp02mtz2uIH2l4frCnRjLy1cX4AEjdbIHRE8aoCgRjqP29fp2S/LqJqkkc9Cyz6ZS6fMP1MX80kc6yRIhNJl/Fk7tmkTN38pNzdDOBA3UF8K9QUOZo38+E8W8Ypuk37Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=HanKCE7Z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=V4tYoExd; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="HanKCE7Z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="V4tYoExd"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AA5A37A011F;
	Mon, 23 Feb 2026 15:43:09 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Mon, 23 Feb 2026 15:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1771879389;
	 x=1771965789; bh=K/ry9TdyV+ze9XDoqNcLR1E/YucQKPR47HThywrceSA=; b=
	HanKCE7ZiuN3LM1gc9gWZECZhnHBFT8iP/z98aRYy/0cscslewa1f09LMHZg+QNT
	n28LFsTFqDSKXVY9wi8i8Dqnuf6woe8fi8PVD5H5PqcrtAD25XCfUuUmrqjN4jSX
	ZI42LALffU27k1UZduOpx4V89m34kXKmoYbK08m0g4mrCb3HH0u3o2c8uLCQBfYE
	gP6F97l6vtDmLqcDw2cjGEIIiSVY316fCJ7GyaizeKlQghVNlERF/MR4kMYFw1Au
	tT5pK/m67W1LfMhN4j4IoJ0lzISiMxAyxBG6xBjsTe3HqFYz2rXbSEddpC7OrTf/
	m0FB5VffzhMGTTS1/f5Xaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771879389; x=
	1771965789; bh=K/ry9TdyV+ze9XDoqNcLR1E/YucQKPR47HThywrceSA=; b=V
	4tYoExdzcDQdJAi5vDsXV+nTqHvK7YMRr+DFHbnyourwG5GahQVUnMWPUANGx+m6
	hTcmXV32n+0gmaqsvCZNnDycwoNrIV9UDrKwAr+dlNZMb1LfJxKmyYgVFIkVvqWY
	bAP9v7WX2vfzikud1irP/JC3GZJwmsVPk7Eea2/FkVrTNRP7yqVBtWbXGYVtZb/Y
	xgqPMC5RNMDjTTP6e87btB04S1kA5eaxb8ucLh9ELUfIZJQHoFo9OHoERo2yU5Z6
	yZWhjDdCJF2h57iX8bi52Wq9Kuf1kyEIMnMRM4eqArGTV4kvihmuE4ydp0LGrv2W
	yEruYVb5N6Sie5Sah4BNQ==
X-ME-Sender: <xms:3bucaRKWNRlJd8u5IszglECon5rlq1U1TsFVHcbsoSm5RuI9m4xmsQ>
    <xme:3bucaY98bpIIP3v4Zii79GW-lTbayy9dxsrS2uusQrkwbCW7LT_BwMK5KhaoL5KHw
    vPsyP28Fj66lVk6OWo5kp9kZD7pYXe5KDbjHVFMo4EBnmEvgABCM-A>
X-ME-Received: <xmr:3bucaVG8GDv9YACVUteJzzUzTSZFoAvFYVnwyXsErA4U_pWPU05TEMzM3Y1vKzOJdEdpBSuHEaF401i0LjVZEaKGGSOTrnr0pYfB4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeekvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvhgvnheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvrghlse
    hgohhmphgrrdguvghvpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidr
    uggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:3bucab4xE25XzBv6H2ZxSVRt9U5Wm6ZBV7N5Z_dGEIy8wQ-nCVbDlA>
    <xmx:3bucaWZ4jwJlEm19twN3AH8_9HOuq9RMy1ApqRBImPz2F_2Fk_5W9w>
    <xmx:3bucaRi5SJq374UZ6BqCdtTr9q7z9cRUPzt_mZkuU5DZAncuW4J7hQ>
    <xmx:3bucaQdt-0LRYVn7TGWKm1ARXgO098vZTr06WmX-N-EWAd4dFGa8KQ>
    <xmx:3bucaXV0yc65rTancv7_u86fUmnaqOS5qVuRKyaXQniVlmrkrTi9xjtz>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Feb 2026 15:43:08 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Mon, 23 Feb 2026 21:42:47 +0100
Subject: [PATCH v3 2/2] irqchip/apple-aic: Add support for
 "apple,t8122-aic3"
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-irq-apple-aic3-v3-2-2b7328076b8d@jannau.net>
References: <20260223-irq-apple-aic3-v3-0-2b7328076b8d@jannau.net>
In-Reply-To: <20260223-irq-apple-aic3-v3-0-2b7328076b8d@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3142; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=aKoo4YBq/Uqj0VSrCmwqEjNlbhSMYNVcm3Wkdx9ZwzM=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsw5u6++u/HcT86ss0Xtt7mB6l6/l/qxTXV8qxilNGckK
 3W4/nvSUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCLimgz/89527d7cOOOUXAX3
 599Lqhs2SX3dZNM1t6CLb6/y7k+FUYwMa75tKih7urXlSvPrjY2sWlMbRDtSC35eP/jd59/vjk8
 RPAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Introduce support for the new AICv3 hardware block in t8122 and t603x
SoCs. AICv3 is similar to AICv2 but has an increased IRQ config offset.
These MMIO offsets are coded as properties of the "aic,3" node in
Apple's device tree. The actual offsets are the same for all SoCs
starting from M3 through at least M5. So do not bother to follow suit
but use AICv3 specific defines in the driver.
The compatible string is SoC specific so future SoCs with AICv3 and
different offsets would just use their own compatible string as base and
add their new offsets.

Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/irqchip/irq-apple-aic.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index 2b24c82bb0df5b8e81be97a97d6c87e220f9fc06..4a3141d9f91416abe90ee37cb3f3d8ecd0c3673e 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -134,8 +134,12 @@
 
 #define AIC2_IRQ_CFG		0x2000
 
+/* AIC v3 registers (MMIO) */
+#define AIC3_IRQ_CFG		0x10000
+
 /*
  * AIC2 registers are laid out like this, starting at AIC2_IRQ_CFG:
+ * AIC3 registers use the same layout but start at AIC3_IRQ_CFG:
  *
  * Repeat for each die:
  *   IRQ_CFG: u32 * MAX_IRQS
@@ -293,6 +297,15 @@ static const struct aic_info aic2_info __initconst = {
 	.local_fast_ipi = true,
 };
 
+static const struct aic_info aic3_info __initconst = {
+	.version	= 3,
+
+	.irq_cfg	= AIC3_IRQ_CFG,
+
+	.fast_ipi	= true,
+	.local_fast_ipi = true,
+};
+
 static const struct of_device_id aic_info_match[] = {
 	{
 		.compatible = "apple,t8103-aic",
@@ -310,6 +323,10 @@ static const struct of_device_id aic_info_match[] = {
 		.compatible = "apple,aic2",
 		.data = &aic2_info,
 	},
+	{
+		.compatible = "apple,t8122-aic3",
+		.data = &aic3_info,
+	},
 	{}
 };
 
@@ -620,7 +637,7 @@ static int aic_irq_domain_map(struct irq_domain *id, unsigned int irq,
 	u32 type = FIELD_GET(AIC_EVENT_TYPE, hw);
 	struct irq_chip *chip = &aic_chip;
 
-	if (ic->info.version == 2)
+	if (ic->info.version == 2 || ic->info.version == 3)
 		chip = &aic2_chip;
 
 	if (type == AIC_EVENT_TYPE_IRQ) {
@@ -991,7 +1008,7 @@ static int __init aic_of_ic_init(struct device_node *node, struct device_node *p
 
 		break;
 	}
-	case 2: {
+	case 2 ... 3: {
 		u32 info1, info3;
 
 		info1 = aic_ic_read(irqc, AIC2_INFO1);
@@ -1065,7 +1082,7 @@ static int __init aic_of_ic_init(struct device_node *node, struct device_node *p
 		off += irqc->info.die_stride;
 	}
 
-	if (irqc->info.version == 2) {
+	if (irqc->info.version == 2 || irqc->info.version == 3) {
 		u32 config = aic_ic_read(irqc, AIC2_CONFIG);
 
 		config |= AIC2_CONFIG_ENABLE;
@@ -1116,3 +1133,4 @@ static int __init aic_of_ic_init(struct device_node *node, struct device_node *p
 
 IRQCHIP_DECLARE(apple_aic, "apple,aic", aic_of_ic_init);
 IRQCHIP_DECLARE(apple_aic2, "apple,aic2", aic_of_ic_init);
+IRQCHIP_DECLARE(apple_aic3, "apple,t8122-aic3", aic_of_ic_init);

-- 
2.53.0

