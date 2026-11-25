Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612326;
	b=t6sy7YPd13TxLo9vqTtIEkoryMeRQIoLDE1Nc8mudwwvRDtSPPjSdqOME2c2ppmFHWSs
	 Ng8tcZZAR/tRA6VU9lzFGSDsiWFTcjVVIoZAdIvr58BcpUOVH4TvZF/6IuGph08V1wGbc
	 v/L8Uf/u9rI5FiEFtIORcPQZCdSfo4uaK5NF6ebTpAjA1tMlSCEu82z6kcebEd9+qKWMZ
	 l4BirQ6gRH0yIWpAeM80vtpJJ1oIjxwp2LMaEUdpK18D6cm6/XrwR7swMxTfjd/fqNMjl
	 80+7JxL3dIVJ40/DLMjYfPmxlxP5kVne8cH33/00+HAXsOiy43KDaKxBbULyQh3DRKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612326;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=K7tjEIo+LG8kBheOtNPmxz3aLdVmkv/Cch8TSIp9EC0=;
	b=hIKu7GRIrpYY1Ffbfof4pxsL27hwZTcl8hdQnpwDO6YToUNS8imKMID6ryok4QT1rycC
	 v5wFm1squmCtrcNvFNPBRwhhZa2d4lucOz/Za6FeFjfzcC4uQ4VeTR5jNeJLl24KQz3Wy
	 x6lFvzRjs0zuYAU60QkpxLLrn2h75gqCaxyr/sQJsLolAElQyoDHTWWFDsCNIfHRMy8hZ
	 vlZQbxh7r9V0cQUF9r3O8dwOmIRuekNjoljwGSEfUFnpnh+YcrdF7ssnLW0l9gAe92nr2
	 BuWzp5sHCMbGERK9XxVIBq9P1S+uST73kzHXKhkLyBbYMBG9yr/jDSTvgYwBlokgMrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=RFbWkLyU;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF40606A32D
	for <asahi@lists.linux.dev>; Wed, 25 Nov 2026 13:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF40606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=RFbWkLyU
Received: by chaosmail.tech (Postfix) id D04E31CA00E;
	Wed, 25 Nov 2026 13:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795612318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K7tjEIo+LG8kBheOtNPmxz3aLdVmkv/Cch8TSIp9EC0=;
	b=RFbWkLyUFKtZRTXbDz01Ql5KnlLzpfmW/SUU2l+UsZ2SWcxXHdkIbVy2EyuIr9SSK3Ajr9
	PHC8F55fF3ublcuV/18STG3qGeZ6Wmr66/9IQQS6AT+lCnrknoXbWSqGO5RSrmRVzWAyCR
	ty/pqTaSFr+4nCFbQgxNhEKpiciqqns=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 25 Nov 2026 14:11:47 +0100
Subject: [PATCH v3 3/5] phy: apple: atc: Add initial M3 series support
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-t8122-phy-v3-3-196e20b3537e@chaosmail.tech>
References: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
In-Reply-To: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795612315; l=25294;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=iKYSPR7cpjcu7J8UNsIr9FVj2BJ3MFiObiuQXT60sXM=;
 b=rFJPMg2qHopWcA/cVrtoc2MvWp4KSKYMBFOHCrHIIYdKX6U+XjHNiBuUeN+seGVzugnyMpkCA
 dysQJYDPs4bAq9EUnFN2Ak3k04nEQdNyME8qPRCoFJeY5PDLwVM/WTG
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Adds initial support for the new t8122 phy. USB/TB only for now, DP
will fail to negotiate

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/phy/apple/atc.c | 449 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 347 insertions(+), 102 deletions(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index 45f1280a6faa..68fc93a88f41 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -100,9 +100,15 @@
 #define AUSPLL_FREQ_CFG 0x2224
 #define AUSPLL_FREQ_REFCLK GENMASK(1, 0)
 
+#define AUS_COMMON_SHIM_BLK_BIAS_REG 0x0a00
+#define AUS_COMMON_SHIM_BLK_BIAS_REG_BGBIAS_OV BIT(1)
+
 #define AUS_COMMON_SHIM_BLK_VREG 0x0a04
 #define AUS_VREG_TRIM GENMASK(6, 2)
 
+#define AUS_COMMON_DIG_RCAL1 0x804
+#define AUS_COMMON_DIG_RCAL1_ALL_CODES_DONE BIT(0)
+
 #define AUS_UNK_A20 0x0a20
 #define AUS_UNK_A20_TX_CAL_CODE GENMASK(23, 20)
 
@@ -123,15 +129,23 @@
 #define CIO3PLL_DTC_VREG 0x2a20
 #define CIO3PLL_DTC_VREG_ADJUST GENMASK(16, 14)
 
+#define ATCPHY_EVT_USB2_CTL 0x0
+#define ATCPHY_EVT_USB2_CTL_EVT_EN 0x1
+#define ATCPHY_EVT_USB2_CTL_LOAD_CNT 0x8
+
 #define ACIOPHY_CFG0 0x08
+#define ACIOPHY_CFG0_COMMON_BIG BIT(0)
 #define ACIOPHY_CFG0_COMMON_BIG_OV BIT(1)
+#define ACIOPHY_CFG0_COMMON_SMALL BIT(2)
 #define ACIOPHY_CFG0_COMMON_SMALL_OV BIT(3)
+#define ACIOPHY_CFG0_COMMON_CLAMP BIT(4)
 #define ACIOPHY_CFG0_COMMON_CLAMP_OV BIT(5)
 #define ACIOPHY_CFG0_RX_SMALL_OV GENMASK(9, 8)
 #define ACIOPHY_CFG0_RX_BIG_OV GENMASK(13, 12)
 #define ACIOPHY_CFG0_RX_CLAMP_OV GENMASK(17, 16)
 
-#define ACIOPHY_CROSSBAR 0x4c
+#define ACIOPHY_CROSSBAR_T8103 0x4c
+#define ACIOPHY_CROSSBAR_T8122 0x64
 #define ACIOPHY_CROSSBAR_PROTOCOL GENMASK(4, 0)
 #define ACIOPHY_CROSSBAR_PROTOCOL_USB4 0x0
 #define ACIOPHY_CROSSBAR_PROTOCOL_USB4_SWAPPED 0x1
@@ -146,7 +160,8 @@
 #define ACIOPHY_CROSSBAR_DP_SINGLE_PMA_UNK008 0x008
 #define ACIOPHY_CROSSBAR_DP_BOTH_PMA BIT(17)
 
-#define ACIOPHY_LANE_MODE 0x48
+#define ACIOPHY_LANE_MODE_T8103 0x48
+#define ACIOPHY_LANE_MODE_T8122 0x60
 #define ACIOPHY_LANE_MODE_RX0 GENMASK(2, 0)
 #define ACIOPHY_LANE_MODE_TX0 GENMASK(5, 3)
 #define ACIOPHY_LANE_MODE_RX1 GENMASK(8, 6)
@@ -180,6 +195,24 @@ enum atcphy_lane_mode {
 #define ACIOPHY_TOP_BIST_PHY_CFG1 0xac
 #define ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN GENMASK(13, 10)
 
+#define ACIOPHY_BIST_CFG1 0x17000
+#define ACIOPHY_BIST_CFG1_CLOCK_EN BIT(0)
+#define ACIOPHY_BIST_CFG1_USB_EN BIT(2)
+
+#define ACIOPHY_BIST_CFG2 0x17004
+#define ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE BIT(2)
+
+#define ACIOPHY_BIST_MAC_USBPHY_STATUS2 0x17080
+#define ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2 BIT(7)
+
+#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV1 0x17088
+#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PIPE_RESET_N_OV 0x100000
+#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV GENMASK(26, 25)
+
+#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV2 0x1708c
+#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_RESET_N_OV 0x200
+#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_PWR_DOWN_OV 0x20
+
 #define ACIOPHY_SLEEP_CTRL 0x1b0
 #define ACIOPHY_SLEEP_CTRL_TX_BIG_OV GENMASK(3, 2)
 #define ACIOPHY_SLEEP_CTRL_TX_SMALL_OV GENMASK(7, 6)
@@ -463,6 +496,7 @@ enum atcphy_lane_mode {
 
 /* USB2 PHY regs */
 #define USB2PHY_USBCTL 0x00
+#define USB2PHY_USBCTL_USB_MODE 0x7
 #define USB2PHY_USBCTL_RUN 2
 #define USB2PHY_USBCTL_ISOLATION 4
 
@@ -556,6 +590,21 @@ struct atcphy_mode_configuration {
 	bool set_swap;
 };
 
+struct apple_atcphy;
+
+struct atcphy_hw {
+	void (*configure_post_tunable)(struct apple_atcphy *atcphy, enum atcphy_mode mode);
+	void (*configure_pipehandler_usb3_host)(struct apple_atcphy *atcphy);
+	void (*configure_usb2_evt_ctl)(struct apple_atcphy *atcphy);
+	void (*enable_cio3pll_clk)(struct apple_atcphy *atcphy);
+	int (*wait_rcal1_done)(struct apple_atcphy *atcphy, enum atcphy_mode mode);
+	void (*configure_lane_pmafsm)(struct apple_atcphy *atcphy,
+				      const struct atcphy_mode_configuration *mode_cfg);
+	int aciophy_lane_mode;
+	int aciophy_crossbar;
+	bool need_dp_tunables;
+};
+
 /**
  * struct apple_atcphy - Apple Type-C PHY device struct
  * @np: Device node pointer
@@ -566,6 +615,7 @@ struct atcphy_mode_configuration {
  * @tunables.lane_usb3: USB3 lane-specific tunables
  * @tunables.lane_dp: DisplayPort lane-specific tunables
  * @tunables.lane_usb4: USB4 lane-specific tunables
+ * @hw: Hardware version specific data
  * @mode: Current PHY operating mode
  * @swap_lanes: True if lanes must be swapped due to cable orientation
  * @dp_link_rate: DisplayPort link rate
@@ -599,9 +649,10 @@ struct apple_atcphy {
 		struct apple_tunable *lane_usb4[2];
 	} tunables;
 
+	const struct atcphy_hw *hw;
 	enum atcphy_mode mode;
-	bool swap_lanes;
 	int dp_link_rate;
+	bool swap_lanes;
 	bool pipehandler_up;
 
 	struct {
@@ -983,11 +1034,141 @@ static void atcphy_pipehandler_set_mux(struct apple_atcphy *atcphy, u32 data, u3
 	udelay(10);
 }
 
-static int atcphy_configure_pipehandler_usb3(struct apple_atcphy *atcphy, bool host)
+static void atcphy_clear_nonselected_phy_reset(struct apple_atcphy *atcphy)
+{
+	/* Clear reset for non-selected USB3 PHY (?) */
+	mask32(atcphy->regs.pipehandler + PIPEHANDLER_NONSELECTED_OVERRIDE,
+	       PIPEHANDLER_NATIVE_POWER_DOWN, FIELD_PREP(PIPEHANDLER_NATIVE_POWER_DOWN, 3));
+	clear32(atcphy->regs.pipehandler + PIPEHANDLER_NONSELECTED_OVERRIDE,
+		PIPEHANDLER_NATIVE_RESET);
+}
+
+static void atcphy_configure_pipehandler_usb3_host_t8122(struct apple_atcphy *atcphy)
+{
+	int ret;
+	u32 reg;
+
+	core_set32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_CLOCK_EN);
+	/* This should be a mask, but unsure what bits should be cleared */
+	writel(ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PIPE_RESET_N_OV |
+	       FIELD_PREP(ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV, 2),
+	       atcphy->regs.core + ACIOPHY_BIST_MAC_USBPHY_CFG_OV1);
+	/* This should be a mask, but unsure what bits should be cleared */
+	writel(ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_RESET_N_OV |
+	       ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_PWR_DOWN_OV,
+	       atcphy->regs.core + ACIOPHY_BIST_MAC_USBPHY_CFG_OV2);
+	core_set32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
+	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_BIST_CFG1, reg,
+				 (reg & ACIOPHY_BIST_CFG1_USB_EN), 10, 10000);
+	if (ret)
+		dev_warn(atcphy->dev,
+			 "Timed out waiting for ACIOPHY_BIST_CFG1_USB_EN\n");
+	core_clear32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
+	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_BIST_MAC_USBPHY_STATUS2, reg,
+				 !(reg & ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2),
+				 10, 10000);
+	if (ret)
+		dev_warn(atcphy->dev,
+			 "Timed out waiting for ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2\n");
+
+	core_set32(atcphy, ACIOPHY_BIST_CFG2, ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE);
+	udelay(10);
+	core_clear32(atcphy, ACIOPHY_BIST_CFG2, ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE);
+	core_mask32(atcphy, ACIOPHY_BIST_MAC_USBPHY_CFG_OV1,
+		    ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV,
+		    FIELD_PREP(ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV, 3));
+
+	/* there is a read and write of ACIOPHY_BIST_MAC_USBPHY_CFG_OV2 here with same values */
+	udelay(10);
+	core_set32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
+	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_BIST_CFG1, reg,
+				 (reg & ACIOPHY_BIST_CFG1_USB_EN), 10, 10000);
+	if (ret)
+		dev_warn(atcphy->dev,
+			 "Timed out waiting for ACIOPHY_BIST_CFG1_USB_EN 2nd toggle\n");
+	core_clear32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
+	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_BIST_MAC_USBPHY_STATUS2, reg,
+				 !(reg & ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2),
+				 10, 10000);
+	if (ret)
+		dev_warn(atcphy->dev,
+			 "Timed out waiting for ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2 2nd time\n");
+	core_set32(atcphy, ACIOPHY_BIST_CFG2, ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE);
+	udelay(10);
+	core_clear32(atcphy, ACIOPHY_BIST_CFG2, ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE);
+
+	atcphy_clear_nonselected_phy_reset(atcphy);
+
+	core_clear32(atcphy, ACIOPHY_BIST_MAC_USBPHY_CFG_OV2,
+		     ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_RESET_N_OV |
+		     ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_PWR_DOWN_OV);
+	core_set32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
+	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_BIST_CFG1, reg,
+				 (reg & ACIOPHY_BIST_CFG1_USB_EN), 10, 10000);
+	if (ret)
+		dev_warn(atcphy->dev,
+			 "Timed out waiting for ACIOPHY_BIST_CFG1_USB_EN 3rd toggle\n");
+	core_clear32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
+	core_clear32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_CLOCK_EN);
+}
+
+static void atcphy_configure_pipehandler_usb3_host_t8103(struct apple_atcphy *atcphy)
 {
 	int ret;
 	u32 reg;
 
+	core_set32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG0,
+		   ACIOPHY_TOP_BIST_PHY_CFG0_LN0_RESET_N);
+	core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG, ACIOPHY_TOP_BIST_OV_CFG_LN0_RESET_N_OV);
+	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
+				 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
+	if (ret)
+		dev_warn(atcphy->dev,
+			 "Timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
+
+	core_set32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
+		   ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
+	core_clear32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
+		     ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
+
+	core_mask32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG1,
+		    ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN,
+		    FIELD_PREP(ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN, 3));
+
+	core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG,
+		   ACIOPHY_TOP_BIST_OV_CFG_LN0_PWR_DOWN_OV);
+	core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
+		   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
+	core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
+		   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
+	writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_CIOPHY_CFG1);
+
+	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
+				 (reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK0), 10, 10000);
+	if (ret)
+		dev_warn(atcphy->dev,
+			 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK0\n");
+
+	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
+				 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
+	if (ret)
+		dev_warn(atcphy->dev,
+			 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
+
+	atcphy_clear_nonselected_phy_reset(atcphy);
+
+	/* More BIST stuff (?) */
+	writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_OV_CFG);
+	core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
+		   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
+	core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
+		   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
+}
+
+static int atcphy_configure_pipehandler_usb3(struct apple_atcphy *atcphy, bool host)
+{
+	int ret;
+
 	ret = atcphy_pipehandler_check(atcphy);
 	if (ret)
 		return ret;
@@ -1012,56 +1193,7 @@ static int atcphy_configure_pipehandler_usb3(struct apple_atcphy *atcphy, bool h
 		}
 
 		/* BIST dance */
-		core_set32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG0,
-			   ACIOPHY_TOP_BIST_PHY_CFG0_LN0_RESET_N);
-		core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG, ACIOPHY_TOP_BIST_OV_CFG_LN0_RESET_N_OV);
-		ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
-					 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
-		if (ret)
-			dev_warn(atcphy->dev,
-				 "Timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
-
-		core_set32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
-			   ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
-		core_clear32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
-			     ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
-
-		core_mask32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG1,
-			    ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN,
-			    FIELD_PREP(ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN, 3));
-
-		core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG,
-			   ACIOPHY_TOP_BIST_OV_CFG_LN0_PWR_DOWN_OV);
-		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
-			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
-		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
-			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
-		writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_CIOPHY_CFG1);
-
-		ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
-					 (reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK0), 10, 10000);
-		if (ret)
-			dev_warn(atcphy->dev,
-				 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK0\n");
-
-		ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
-					 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
-		if (ret)
-			dev_warn(atcphy->dev,
-				 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
-
-		/* Clear reset for non-selected USB3 PHY (?) */
-		mask32(atcphy->regs.pipehandler + PIPEHANDLER_NONSELECTED_OVERRIDE,
-		       PIPEHANDLER_NATIVE_POWER_DOWN, FIELD_PREP(PIPEHANDLER_NATIVE_POWER_DOWN, 3));
-		clear32(atcphy->regs.pipehandler + PIPEHANDLER_NONSELECTED_OVERRIDE,
-			PIPEHANDLER_NATIVE_RESET);
-
-		/* More BIST stuff (?) */
-		writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_OV_CFG);
-		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
-			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
-		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
-			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
+		atcphy->hw->configure_pipehandler_usb3_host(atcphy);
 	}
 
 	/* Configure PIPE mux to USB3 PHY */
@@ -1183,33 +1315,10 @@ static void atcphy_setup_pipehandler(struct apple_atcphy *atcphy)
 				   PIPEHANDLER_MUX_CTRL_CLK_DUMMY);
 }
 
-static void atcphy_configure_lanes(struct apple_atcphy *atcphy, enum atcphy_mode mode)
+static void
+atcphy_configure_lane_pmafsm_t8103(struct apple_atcphy *atcphy,
+				   const struct atcphy_mode_configuration *mode_cfg)
 {
-	const struct atcphy_mode_configuration *mode_cfg = atcphy_get_mode_config(atcphy, mode);
-
-	core_mask32(atcphy, ACIOPHY_LANE_MODE, ACIOPHY_LANE_MODE_RX0,
-		    FIELD_PREP(ACIOPHY_LANE_MODE_RX0, mode_cfg->lane_mode[0]));
-	core_mask32(atcphy, ACIOPHY_LANE_MODE, ACIOPHY_LANE_MODE_TX0,
-		    FIELD_PREP(ACIOPHY_LANE_MODE_TX0, mode_cfg->lane_mode[0]));
-	core_mask32(atcphy, ACIOPHY_LANE_MODE, ACIOPHY_LANE_MODE_RX1,
-		    FIELD_PREP(ACIOPHY_LANE_MODE_RX1, mode_cfg->lane_mode[1]));
-	core_mask32(atcphy, ACIOPHY_LANE_MODE, ACIOPHY_LANE_MODE_TX1,
-		    FIELD_PREP(ACIOPHY_LANE_MODE_TX1, mode_cfg->lane_mode[1]));
-	core_mask32(atcphy, ACIOPHY_CROSSBAR, ACIOPHY_CROSSBAR_PROTOCOL,
-		    FIELD_PREP(ACIOPHY_CROSSBAR_PROTOCOL, mode_cfg->crossbar));
-
-	if (mode_cfg->set_swap)
-		core_set32(atcphy, ATCPHY_MISC, ATCPHY_MISC_LANE_SWAP);
-	else
-		core_clear32(atcphy, ATCPHY_MISC, ATCPHY_MISC_LANE_SWAP);
-
-	core_mask32(atcphy, ACIOPHY_CROSSBAR, ACIOPHY_CROSSBAR_DP_SINGLE_PMA,
-		    FIELD_PREP(ACIOPHY_CROSSBAR_DP_SINGLE_PMA, mode_cfg->crossbar_dp_single_pma));
-	if (mode_cfg->crossbar_dp_both_pma)
-		core_set32(atcphy, ACIOPHY_CROSSBAR, ACIOPHY_CROSSBAR_DP_BOTH_PMA);
-	else
-		core_clear32(atcphy, ACIOPHY_CROSSBAR, ACIOPHY_CROSSBAR_DP_BOTH_PMA);
-
 	if (mode_cfg->dp_lane[0]) {
 		core_set32(atcphy, LN0_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
 			   LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV);
@@ -1235,6 +1344,38 @@ static void atcphy_configure_lanes(struct apple_atcphy *atcphy, enum atcphy_mode
 	}
 }
 
+static void atcphy_configure_lanes(struct apple_atcphy *atcphy, enum atcphy_mode mode)
+{
+	const struct atcphy_mode_configuration *mode_cfg = atcphy_get_mode_config(atcphy, mode);
+
+	core_mask32(atcphy, atcphy->hw->aciophy_lane_mode, ACIOPHY_LANE_MODE_RX0,
+		    FIELD_PREP(ACIOPHY_LANE_MODE_RX0, mode_cfg->lane_mode[0]));
+	core_mask32(atcphy, atcphy->hw->aciophy_lane_mode, ACIOPHY_LANE_MODE_TX0,
+		    FIELD_PREP(ACIOPHY_LANE_MODE_TX0, mode_cfg->lane_mode[0]));
+	core_mask32(atcphy, atcphy->hw->aciophy_lane_mode, ACIOPHY_LANE_MODE_RX1,
+		    FIELD_PREP(ACIOPHY_LANE_MODE_RX1, mode_cfg->lane_mode[1]));
+	core_mask32(atcphy, atcphy->hw->aciophy_lane_mode, ACIOPHY_LANE_MODE_TX1,
+		    FIELD_PREP(ACIOPHY_LANE_MODE_TX1, mode_cfg->lane_mode[1]));
+	core_mask32(atcphy, atcphy->hw->aciophy_crossbar, ACIOPHY_CROSSBAR_PROTOCOL,
+		    FIELD_PREP(ACIOPHY_CROSSBAR_PROTOCOL, mode_cfg->crossbar));
+
+	if (mode_cfg->set_swap)
+		core_set32(atcphy, ATCPHY_MISC, ATCPHY_MISC_LANE_SWAP);
+	else
+		core_clear32(atcphy, ATCPHY_MISC, ATCPHY_MISC_LANE_SWAP);
+
+	core_mask32(atcphy, atcphy->hw->aciophy_crossbar, ACIOPHY_CROSSBAR_DP_SINGLE_PMA,
+		    FIELD_PREP(ACIOPHY_CROSSBAR_DP_SINGLE_PMA, mode_cfg->crossbar_dp_single_pma));
+	if (mode_cfg->crossbar_dp_both_pma)
+		core_set32(atcphy, atcphy->hw->aciophy_crossbar, ACIOPHY_CROSSBAR_DP_BOTH_PMA);
+	else
+		core_clear32(atcphy, atcphy->hw->aciophy_crossbar, ACIOPHY_CROSSBAR_DP_BOTH_PMA);
+
+	if (atcphy->hw->configure_lane_pmafsm)
+		atcphy->hw->configure_lane_pmafsm(atcphy, mode_cfg);
+
+}
+
 static void atcphy_enable_dp_aux(struct apple_atcphy *atcphy)
 {
 	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTXPHY_PMA_LANE_RESET_N);
@@ -1639,7 +1780,8 @@ static int atcphy_dp_configure(struct apple_atcphy *atcphy, enum atcphy_dp_link_
 static void atcphy_usb2_power_off(struct apple_atcphy *atcphy)
 {
 	/* Disable the PHY, this clears USB2PHY_USBCTL_RUN */
-	writel(USB2PHY_USBCTL_ISOLATION, atcphy->regs.usb2phy + USB2PHY_USBCTL);
+	mask32(atcphy->regs.usb2phy + USB2PHY_USBCTL, USB2PHY_USBCTL_USB_MODE,
+	       USB2PHY_USBCTL_ISOLATION);
 	udelay(10);
 
 	/* Switch the PHY to low power mode */
@@ -1689,6 +1831,13 @@ static int atcphy_power_off(struct apple_atcphy *atcphy)
 	return 0;
 }
 
+static void atcphy_configure_usb2_evt_ctl_t8122(struct apple_atcphy *atcphy)
+{
+	core_set32(atcphy, ATCPHY_EVT_USB2_CTL, ATCPHY_EVT_USB2_CTL_LOAD_CNT |
+		ATCPHY_EVT_USB2_CTL_EVT_EN);
+	udelay(10);
+}
+
 static void atcphy_usb2_power_on(struct apple_atcphy *atcphy)
 {
 	set32(atcphy->regs.usb2phy + USB2PHY_SIG,
@@ -1705,6 +1854,10 @@ static void atcphy_usb2_power_on(struct apple_atcphy *atcphy)
 	udelay(10);
 	clear32(atcphy->regs.usb2phy + USB2PHY_CTL, USB2PHY_CTL_PORT_RESET);
 	udelay(10);
+
+	if (atcphy->hw->configure_usb2_evt_ctl)
+		atcphy->hw->configure_usb2_evt_ctl(atcphy);
+
 	set32(atcphy->regs.usb2phy + USB2PHY_CTL, USB2PHY_CTL_APB_RESET_N);
 	udelay(10);
 	clear32(atcphy->regs.usb2phy + USB2PHY_MISCTUNE, USB2PHY_MISCTUNE_APBCLK_GATE_OFF);
@@ -1745,24 +1898,8 @@ static int atcphy_power_on(struct apple_atcphy *atcphy)
 	return 0;
 }
 
-static int atcphy_configure(struct apple_atcphy *atcphy, enum atcphy_mode mode)
+static void atcphy_configure_post_tunable_t8103(struct apple_atcphy *atcphy, enum atcphy_mode _mode)
 {
-	int ret = 0;
-
-	lockdep_assert_held(&atcphy->lock);
-
-	if (mode == APPLE_ATCPHY_MODE_OFF) {
-		ret = atcphy_power_off(atcphy);
-		atcphy->mode = mode;
-		return ret;
-	}
-
-	ret = atcphy_power_on(atcphy);
-	if (ret)
-		return ret;
-
-	atcphy_apply_tunables(atcphy, mode);
-
 	core_set32(atcphy, AUSPLL_FSM_CTRL, 0x1fe000);
 	core_set32(atcphy, AUSPLL_APB_CMD_OVERRIDE, AUSPLL_APB_CMD_OVERRIDE_UNK28);
 
@@ -1792,18 +1929,93 @@ static int atcphy_configure(struct apple_atcphy *atcphy, enum atcphy_mode mode)
 	mask32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_RX_CLAMP_OV,
 	       FIELD_PREP(ACIOPHY_CFG0_RX_CLAMP_OV, 3));
 	udelay(10);
+}
+
+static void atcphy_configure_post_tunable_t8122(struct apple_atcphy *atcphy, enum atcphy_mode mode)
+{
+	if (atcphy_modes[mode].pipehandler_state != ATCPHY_PIPEHANDLER_STATE_USB3)
+		return;
+	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL);
+	udelay(10);
+	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL_OV);
+	udelay(10);
+	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_BIG);
+	udelay(10);
+	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_BIG_OV);
+	udelay(10);
+	core_clear32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_CLAMP);
+	udelay(10);
+	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_CLAMP_OV);
+	udelay(10);
+	core_set32(atcphy, AUS_COMMON_SHIM_BLK_BIAS_REG, AUS_COMMON_SHIM_BLK_BIAS_REG_BGBIAS_OV);
+	udelay(10);
+}
+
+static void atcphy_enable_cio3pll_clk_t8103(struct apple_atcphy *atcphy)
+{
+	core_set32(atcphy, CIO3PLL_CLK_CTRL, CIO3PLL_CLK_PCLK_EN);
+	core_set32(atcphy, CIO3PLL_CLK_CTRL, CIO3PLL_CLK_REFCLK_EN);
+}
+
+static int atcphy_wait_rcal1_done_t8122(struct apple_atcphy *atcphy, enum atcphy_mode mode)
+{
+	int ret = 0;
+	u32 reg;
+
+	if (atcphy_modes[mode].pipehandler_state == ATCPHY_PIPEHANDLER_STATE_USB3) {
+		ret = readl_poll_timeout(atcphy->regs.core + AUS_COMMON_DIG_RCAL1, reg,
+					 (reg & AUS_COMMON_DIG_RCAL1_ALL_CODES_DONE), 10, 100000);
+		if (ret) {
+			atcphy_power_off(atcphy);
+			dev_err(atcphy->dev, "Failed to wait for RCAL1 done\n");
+			return ret;
+		}
+	}
+	return ret;
+}
+
+static int atcphy_configure(struct apple_atcphy *atcphy, enum atcphy_mode mode)
+{
+	int ret = 0;
+
+	lockdep_assert_held(&atcphy->lock);
+
+	if (mode == APPLE_ATCPHY_MODE_OFF) {
+		ret = atcphy_power_off(atcphy);
+		atcphy->mode = mode;
+		return ret;
+	}
+
+	ret = atcphy_power_on(atcphy);
+	if (ret)
+		return ret;
+
+	atcphy_apply_tunables(atcphy, mode);
+	atcphy->hw->configure_post_tunable(atcphy, mode);
 
 	/* Setup AUX channel if DP altmode is requested */
 	if (atcphy_modes[mode].enable_dp_aux)
 		atcphy_enable_dp_aux(atcphy);
 
 	/* Enable clocks and configure lanes */
-	core_set32(atcphy, CIO3PLL_CLK_CTRL, CIO3PLL_CLK_PCLK_EN);
-	core_set32(atcphy, CIO3PLL_CLK_CTRL, CIO3PLL_CLK_REFCLK_EN);
+	if (atcphy->hw->enable_cio3pll_clk)
+		atcphy->hw->enable_cio3pll_clk(atcphy);
+
 	atcphy_configure_lanes(atcphy, mode);
 
 	/* Take the USB3 PHY out of reset */
 	core_set32(atcphy, ATCPHY_POWER_CTRL, ATCPHY_POWER_PHY_RESET_N);
+	/*
+	 * NOTE: Not what macos does, it takes the phy out of reset right before writing to
+	 * ACIOPHY_CFG0_COMMON_SMALL does lane configuration with phy out of reset, and the poll is
+	 * right after AUS_COMMON_SHIM_BLK_BIAS_REG write. Does not seem to matter, but if something
+	 * does not work, consider re-ordering things to macos order.
+	 */
+	if (atcphy->hw->wait_rcal1_done) {
+		ret = atcphy->hw->wait_rcal1_done(atcphy, mode);
+		if (ret)
+			return ret;
+	}
 
 	atcphy->mode = mode;
 
@@ -2201,6 +2413,7 @@ static int atcphy_probe_mux(struct apple_atcphy *atcphy)
 
 static int atcphy_load_tunables(struct apple_atcphy *atcphy)
 {
+	size_t tunable_count;
 	struct {
 		const char *dt_name;
 		struct apple_tunable **tunable;
@@ -2216,8 +2429,15 @@ static int atcphy_load_tunables(struct apple_atcphy *atcphy)
 		{ "apple,tunable-lane0-dp", &atcphy->tunables.lane_dp[0], atcphy->res.core },
 		{ "apple,tunable-lane1-dp", &atcphy->tunables.lane_dp[1], atcphy->res.core },
 	};
+	if (!atcphy->hw->need_dp_tunables) {
+		tunable_count = ARRAY_SIZE(tunables) - 2;
+		atcphy->tunables.lane_dp[0] = NULL;
+		atcphy->tunables.lane_dp[1] = NULL;
+	} else {
+		tunable_count = ARRAY_SIZE(tunables);
+	}
 
-	for (int i = 0; i < ARRAY_SIZE(tunables); i++) {
+	for (size_t i = 0; i < tunable_count; i++) {
 		*tunables[i].tunable = devm_apple_tunable_parse(
 			atcphy->dev, atcphy->np, tunables[i].dt_name, tunables[i].res);
 		if (IS_ERR(*tunables[i].tunable)) {
@@ -2301,6 +2521,10 @@ static int atcphy_probe(struct platform_device *pdev)
 	if (!atcphy)
 		return -ENOMEM;
 
+	atcphy->hw = of_device_get_match_data(&pdev->dev);
+	if (!atcphy->hw)
+		return -EINVAL;
+
 	atcphy->dev = dev;
 	atcphy->np = dev->of_node;
 	mutex_init(&atcphy->lock);
@@ -2319,8 +2543,29 @@ static int atcphy_probe(struct platform_device *pdev)
 	return atcphy_probe_finalize(atcphy);
 }
 
+static const struct atcphy_hw atcphy_hw_t8103 = {
+	.need_dp_tunables = true,
+	.aciophy_lane_mode = ACIOPHY_LANE_MODE_T8103,
+	.aciophy_crossbar = ACIOPHY_CROSSBAR_T8103,
+	.configure_post_tunable = atcphy_configure_post_tunable_t8103,
+	.configure_pipehandler_usb3_host = atcphy_configure_pipehandler_usb3_host_t8103,
+	.enable_cio3pll_clk = atcphy_enable_cio3pll_clk_t8103,
+	.configure_lane_pmafsm = atcphy_configure_lane_pmafsm_t8103,
+};
+
+static const struct atcphy_hw atcphy_hw_t8122 = {
+	.need_dp_tunables = false,
+	.aciophy_lane_mode = ACIOPHY_LANE_MODE_T8122,
+	.aciophy_crossbar = ACIOPHY_CROSSBAR_T8122,
+	.configure_post_tunable = atcphy_configure_post_tunable_t8122,
+	.configure_pipehandler_usb3_host = atcphy_configure_pipehandler_usb3_host_t8122,
+	.configure_usb2_evt_ctl = atcphy_configure_usb2_evt_ctl_t8122,
+	.wait_rcal1_done = atcphy_wait_rcal1_done_t8122,
+};
+
 static const struct of_device_id atcphy_match[] = {
-	{ .compatible = "apple,t8103-atcphy" },
+	{ .compatible = "apple,t8103-atcphy", .data = &atcphy_hw_t8103 },
+	{ .compatible = "apple,t8122-atcphy", .data = &atcphy_hw_t8122 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, atcphy_match);

-- 
2.56.1

