Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642056;
	b=w7CBKikgzPAUG+foa9db0gxRgzBUiexWyivrnw4MLHOF+zrs6+SFbdl4NrnBYY5sW2OM
	 6ZW7ZuuIZTa3OkDRfkfGs22URA0RJ5qAUi8yV6FWfMzmP+5zUgIfXmds9pFzzADbYmgry
	 7ZgnYy3LZp0lntWkjHocTCfPVzlr8kV/uukeSIk0dvh4EcfExCIJoEFfptdg4mOm19Aeq
	 xoHXC16ZDOEdCM0Uv7BEZu61foyxT0p+uaCo5SNkns/yJXbnm5SFWFG5FvMJKtyMxxVdL
	 fZ6anOsba+bopmMo6bJKtnZCaxTuJUQcUzWPV6RU4Xu9kspjvmA9Ek/WR8SXxUSNJcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642056;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=YmbzwZKRvRxYx+VmssSx42FZsSfbHc66HYRRaRPOaIU=;
	b=v4wqQU3bQgykKbgsAKIXlL+solf/WQVgS3IxYfbDVryjNh8wzTGRWKJjM2xejdYV/4Ut
	 +J+pnwRmFrmohsobfZctLdhgv/cdp7jfeiMQ9XbXryxpd30y0fgazPcG3X5ryQEH5rLYm
	 oCVdDdWdab/J5fSoRbm9HdHlntfvTU2CVzUCuawFK7tggjFj5DfRuWDZ57gWmyWxEp9vr
	 PFzovoFS/iU3zUWFW+FICvxEMZgKaWiH+B2+S9WArcLZBSqQc2Tf5o6BMC+e5jb+AJeXz
	 iwiH87SHYE5EqBqSjHbRuopt5LW3weiHQQce1O8GsApBVSZKs03LwI8or00PohEzCbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b="ZN1/V1Df";
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BFF606A334
	for <asahi@lists.linux.dev>; Wed, 25 Nov 2026 21:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84BFF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=ZN1/V1Df
Received: by chaosmail.tech (Postfix) id A598E1CA01A;
	Wed, 25 Nov 2026 13:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795612319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YmbzwZKRvRxYx+VmssSx42FZsSfbHc66HYRRaRPOaIU=;
	b=ZN1/V1DfMYLFVrhXWZeSZ6Jhx6S3PPeWlw6EBGPnSP5fyDA2MBSCcucR6VtMwJQhyRU4S4
	0r42KYkdyuu0urOJdDA6mdJORe6dYipJY3vYbYt8ekQMTXCYAyIAJk/9HIzOVNW6acXsOE
	JglS8tMpEy84x7FHP2ICNB85B9eQfxY=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 25 Nov 2026 14:11:48 +0100
Subject: [PATCH v3 4/5] phy: apple: atc: Add T8122 DisplayPort support
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
Message-Id: <20261125-t8122-phy-v3-4-196e20b3537e@chaosmail.tech>
References: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
In-Reply-To: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Ramzi Abdiche <abdicheramzi@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795612315; l=33050;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=qS7dy3G8ht/D2NpsEiASec6I80+nh6LdzXnYorYZWEE=;
 b=qQ2CD0yLhXyRVzCRKvuL/xP6OQqaQeajNG5+wjP6WNHPNitj8dxTQHQlmVHP0jzKEkP0igMZp
 BDqiSVF7N9KA12BxZQawz/KGzBAWBahJAptVrgWsLZIrrFhMuQ7HFm+
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Ramzi Abdiche <abdicheramzi@gmail.com>

Add DisplayPort AUX and lane setup for T8122-family PHYs.
Select clock and lane settings by link rate and stop active
lanes before orientation changes.

Signed-off-by: Ramzi Abdiche <abdicheramzi@gmail.com>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/phy/apple/atc.c | 637 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 612 insertions(+), 25 deletions(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index 68fc93a88f41..5c0688339353 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -431,6 +431,129 @@ enum atcphy_lane_mode {
 #define LN_LDOCLK_EN_BIG_OV BIT(14)
 #define LN_LDOCLK_EN_BIG BIT(15)
 
+/* T8122 DisplayPort registers; power bit names inferred from the sequences */
+#define ACIOPHY_CFG1 0x000c
+#define ACIOPHY_SLEEP_CTRL_T8122 0x010c
+#define ACIOPHY_TX_SLEEP_BIG(lane) BIT(lane)
+#define ACIOPHY_TX_SLEEP_BIG_OV(lane) BIT(2 + (lane))
+#define ACIOPHY_TX_SLEEP_SMALL(lane) BIT(4 + (lane))
+#define ACIOPHY_TX_SLEEP_SMALL_OV(lane) BIT(6 + (lane))
+#define ACIOPHY_TX_CLAMP(lane) BIT(8 + (lane))
+#define ACIOPHY_TX_CLAMP_OV(lane) BIT(10 + (lane))
+#define ACIOPHY_RXTX_SLEEP_BIG(lane) BIT(lane)
+#define ACIOPHY_RXTX_SLEEP_BIG_OV(lane) BIT(2 + (lane))
+#define ACIOPHY_RXTX_SLEEP_SMALL(lane) BIT(4 + (lane))
+#define ACIOPHY_RXTX_SLEEP_SMALL_OV(lane) BIT(6 + (lane))
+#define ACIOPHY_RX_SLEEP_BIG(lane) BIT(6 + (lane))
+#define ACIOPHY_RX_SLEEP_BIG_OV(lane) BIT(8 + (lane))
+#define ACIOPHY_RX_SLEEP_SMALL(lane) BIT(10 + (lane))
+#define ACIOPHY_RX_SLEEP_SMALL_OV(lane) BIT(12 + (lane))
+#define ACIOPHY_RX_CLAMP(lane) BIT(14 + (lane))
+#define ACIOPHY_RX_CLAMP_OV(lane) BIT(16 + (lane))
+
+#define AUSPLL_BGR_T8122 0x2218
+#define AUSPLL_FREQ_CFG_T8122 0x2234
+#define AUSPLL_CLKOUT_MASTER_PCLK_DRVR_EN_T8122 BIT(3)
+#define ACIOPHY_DP_PCLK_STAT_T8122 0x7034
+
+#define LN_AUSPMA_TX_TOP_EQ1 0x0050
+#define LN_AUSPMA_TX_TOP_EQ17 0x00d0
+#define LN_AUSPMA_TX_TOP_EQ18 0x00d4
+#define LN_AUSPMA_RX_TOP_EQ1 0x0210
+#define LN_AUSPMA_RX_TOP_EQ17 0x0244
+#define LN_AUSPMA_RX_TOP_EQ18 0x0248
+#define LN_EQ_SWING GENMASK(3, 0)
+#define LN_EQ_SWING_LSB GENMASK(15, 14)
+#define LN_EQ_SWING_OV BIT(28)
+#define LN_EQ_AUTO_CTRL_DP BIT(20)
+/* Deemphasis and override bits; individual fields unknown */
+#define LN_EQ_DEEMPH_FIELDS GENMASK(18, 0)
+
+#define LN_AUSPMA_TX_SHM_MAIN2 0x0004
+#define LN_MAIN2_BYTECLK_SYNC_SEL BIT(24)
+#define LN_MAIN2_BYTECLK_SYNC_SEL_OV BIT(25)
+#define LN_MAIN2_BYTECLK_SYNC_EN BIT(28)
+#define LN_MAIN2_BYTECLK_SYNC_EN_OV BIT(29)
+#define LN_AUSPMA_TX_SHM_MAIN4 0x000c
+#define LN_MAIN4_DIV2_4_EN GENMASK(25, 24)
+#define LN_MAIN4_DIV2_4_EN_OV BIT(26)
+#define LN_AUSPMA_TX_SHM_MAIN5 0x0010
+#define LN_MAIN5_CLK_EN BIT(9)
+#define LN_MAIN5_CLK_EN_OV BIT(10)
+#define LN_AUSPMA_TX_SHM_CLKMON1 0x001c
+#define LN_CLKMON1_HIZ BIT(22)
+#define LN_CLKMON1_HIZ_OV BIT(23)
+#define LN_AUSPMA_TX_SHM_LDOCLK1 0x0044
+#define LN_LDOCLK1_VREG_ADJ GENMASK(10, 6)
+#define LN_LDOCLK1_VREF_EN BIT(12)
+#define LN_LDOCLK1_VREF_FILTER_BOOST (GENMASK(18, 17) | GENMASK(15, 14))
+#define LN_LDOCLK1_BYPASS_SMALL BIT(20)
+#define LN_LDOCLK1_BYPASS_BIG BIT(22)
+#define LN_LDOCLK1_EN_SMALL BIT(24)
+#define LN_LDOCLK1_EN_BIG BIT(26)
+
+#define LN_AUSPMA_RX_TOP_TXMODE 0x0160
+#define LN_AUSPMA_RX_TOP_AFE1 0x01d4
+#define LN_AFE1_DIV20_RESET_N_OV BIT(0)
+#define LN_AFE1_DIV20_RESET_N BIT(1)
+#define LN_AUSPMA_RX_TOP_DCO1 0x01dc
+#define LN_DCO1_LPBKIN_RECOVERED_DATA GENMASK(16, 15)
+
+#define LN_AUSPMA_RX_SHM_CTLE2 0x0030
+#define LN_CTLE2_TX_CLK_EN BIT(10)
+#define LN_CTLE2_TX_CLK_EN_OV BIT(11)
+#define LN_AUSPMA_RX_SHM_DFE101 0x0064
+#define LN_DFE101_DFEH1FB_EN BIT(2)
+#define LN_DFE101_DFEH1FB_EN_OV BIT(3)
+#define LN_DFE101_DTVREG_ADJUST_FIELDS GENMASK(15, 10)
+#define LN_AUSPMA_RX_SHM_DFE111 0x0068
+#define LN_DFE111_DTVREG_BIG_EN BIT(5)
+#define LN_DFE111_DTVREG_BIG_EN_OV BIT(6)
+#define LN_DFE111_DTVREG_SMALL_EN BIT(7)
+#define LN_DFE111_DTVREG_SMALL_EN_OV BIT(8)
+#define LN_AUSPMA_RX_SHM_DFE121 0x006c
+#define LN_DFE121_TX_BYTECLK_SYNC_CLR BIT(9)
+#define LN_DFE121_TX_BYTECLK_SYNC_CLR_OV BIT(10)
+#define LN_DFE121_TX_BYTECLK_SYNC_EN BIT(11)
+#define LN_DFE121_TX_HRCLK_SEL BIT(13)
+#define LN_DFE121_TX_HRCLK_SEL_OV BIT(14)
+#define LN_DFE121_TX_PBIAS_EN BIT(15)
+#define LN_DFE121_TX_PBIAS_EN_OV BIT(16)
+#define LN_AUSPMA_RX_SHM_SAVOS161 0x00a4
+#define LN_SAVOS161_RXTERM_EN BIT(0)
+#define LN_SAVOS161_RXTERM_EN_OV BIT(1)
+#define LN_AUSPMA_RX_SHM_TERM191 0x00a8
+#define LN_TERM191_TX_TEST_EN BIT(15)
+#define LN_TERM191_TX_TEST_EN_OV BIT(16)
+#define LN_TERM191_TX_EN BIT(17)
+#define LN_TERM191_TX_EN_OV BIT(18)
+#define LN_TERM191_TX_DIV2_EN GENMASK(20, 19)
+#define LN_TERM191_TX_DIV2_EN_OV BIT(21)
+#define LN_TERM191_TX_DIV2_RST BIT(22)
+#define LN_TERM191_TX_DIV2_RST_OV BIT(23)
+#define LN_AUSPMA_RX_SHM_VREF221 0x00d4
+/* Adjust, filter and enable overrides; individual fields unknown */
+#define LN_VREF221_INIT_FIELDS (GENMASK(20, 16) | GENMASK(12, 7))
+#define LN_VREF221_BIAS_FIELDS GENMASK(15, 13)
+#define LN_VREF221_EN BIT(16)
+#define LN_VREF221_FILTER_ADJUST GENMASK(19, 18)
+#define LN_AUSPMA_RX_SHM_VREF231 0x00d8
+#define LN_VREF231_BOOST_CTRL GENMASK(1, 0)
+#define LN_VREF231_BOOST_CTRL_OV BIT(2)
+#define LN_AUSPMA_RX_SHM_VREG1 0x00dc
+#define LN_VREG1_DTVREG_POWER_MODE GENMASK(4, 3)
+
+/* T8122 AUX registers (core window) */
+#define AUX_TOP_CTRL 0x16000
+#define AUX_TOP_PWRDN BIT(0)
+#define AUX_SHM_PWR 0x16400
+#define AUX_SLEEP_SML_OV BIT(0)
+#define AUX_SLEEP_SML BIT(1)
+#define AUX_SLEEP_BIG_OV BIT(2)
+#define AUX_SLEEP_BIG BIT(3)
+#define AUX_CLAMP_OV BIT(8)
+#define AUX_CLAMP BIT(9)
+
 /* LPDPTX registers */
 #define LPDPTX_AUX_CFG_BLK_AUX_CTRL 0x0000
 #define LPDPTX_BLK_AUX_CTRL_PWRDN BIT(4)
@@ -524,6 +647,9 @@ enum atcphy_dp_link_rate {
 	ATCPHY_DP_LINK_RATE_HBR3,
 };
 
+#define ATCPHY_DP_LINK_RATE_IDLE		(-1)
+#define ATCPHY_DP_LINK_RATE_PENDING	(-2)
+
 /**
  * enum atcphy_pipehandler_state - States of the PIPE mux interface ("pipehandler")
  * @ATCPHY_PIPEHANDLER_STATE_DUMMY: "Dummy PHY" (disables USB3, USB2 only)
@@ -600,6 +726,10 @@ struct atcphy_hw {
 	int (*wait_rcal1_done)(struct apple_atcphy *atcphy, enum atcphy_mode mode);
 	void (*configure_lane_pmafsm)(struct apple_atcphy *atcphy,
 				      const struct atcphy_mode_configuration *mode_cfg);
+	void (*dp_enable_aux)(struct apple_atcphy *atcphy);
+	void (*dp_disable_aux)(struct apple_atcphy *atcphy);
+	int (*dp_set_rate)(struct apple_atcphy *atcphy, enum atcphy_dp_link_rate lr);
+	int (*dp_stop)(struct apple_atcphy *atcphy);
 	int aciophy_lane_mode;
 	int aciophy_crossbar;
 	bool need_dp_tunables;
@@ -618,7 +748,8 @@ struct atcphy_hw {
  * @hw: Hardware version specific data
  * @mode: Current PHY operating mode
  * @swap_lanes: True if lanes must be swapped due to cable orientation
- * @dp_link_rate: DisplayPort link rate
+ * @dp_link_rate: DisplayPort link rate index, ATCPHY_DP_LINK_RATE_IDLE, or
+ *               ATCPHY_DP_LINK_RATE_PENDING when cleanup is still needed
  * @pipehandler_up: True if the PIPE mux ("pipehandler") is set to USB3 or USB4 mode
  * @regs: Memory-mapped registers
  * @regs.core: Core registers
@@ -880,6 +1011,28 @@ static const struct atcphy_dp_link_rate_configuration dp_lr_config[] = {
 	},
 };
 
+static const struct {
+	u8 vclk_op_divn;
+	bool vclk_pre_divn;
+} dp_lr_config_t8122[] = {
+	[ATCPHY_DP_LINK_RATE_RBR] = {
+		.vclk_op_divn = 1,
+		.vclk_pre_divn = false,
+	},
+	[ATCPHY_DP_LINK_RATE_HBR] = {
+		.vclk_op_divn = 1,
+		.vclk_pre_divn = false,
+	},
+	[ATCPHY_DP_LINK_RATE_HBR2] = {
+		.vclk_op_divn = 1,
+		.vclk_pre_divn = true,
+	},
+	[ATCPHY_DP_LINK_RATE_HBR3] = {
+		.vclk_op_divn = 1,
+		.vclk_pre_divn = true,
+	},
+};
+
 static inline void mask32(void __iomem *reg, u32 mask, u32 set)
 {
 	u32 value = readl(reg);
@@ -914,6 +1067,12 @@ static inline void core_clear32(struct apple_atcphy *atcphy, u32 reg, u32 clear)
 	core_mask32(atcphy, reg, clear, 0);
 }
 
+static void __iomem *atcphy_lane_reg(struct apple_atcphy *atcphy,
+				  unsigned int lane, u32 lane0_reg)
+{
+	return atcphy->regs.core + lane0_reg + lane * (LN1_AUSPMA_RX_TOP - LN0_AUSPMA_RX_TOP);
+}
+
 static const struct atcphy_mode_configuration *atcphy_get_mode_config(struct apple_atcphy *atcphy,
 								      enum atcphy_mode mode)
 {
@@ -1376,7 +1535,391 @@ static void atcphy_configure_lanes(struct apple_atcphy *atcphy, enum atcphy_mode
 
 }
 
-static void atcphy_enable_dp_aux(struct apple_atcphy *atcphy)
+static int atcphy_dp_poll(struct apple_atcphy *atcphy, u32 reg, u32 mask, u32 expected)
+{
+	u32 value;
+	int ret;
+
+	lockdep_assert_held(&atcphy->lock);
+	ret = readl_poll_timeout_atomic(atcphy->regs.core + reg, value,
+					(value & mask) == expected, 1, 1000);
+	if (ret)
+		dev_err(atcphy->dev, "DP timeout reg=%#x mask=%#x want=%#x got=%#x\n",
+			reg, mask, expected, value);
+	return ret;
+}
+
+static int atcphy_auspll_set_command(struct apple_atcphy *atcphy, u32 command, bool request)
+{
+	core_mask32(atcphy, AUSPLL_APB_CMD_OVERRIDE,
+		    AUSPLL_APB_CMD_OVERRIDE_REQ | AUSPLL_APB_CMD_OVERRIDE_CMD |
+		    AUSPLL_APB_CMD_OVERRIDE_UNK28,
+		    FIELD_PREP(AUSPLL_APB_CMD_OVERRIDE_CMD, command) |
+		    AUSPLL_APB_CMD_OVERRIDE_UNK28 | (request ? AUSPLL_APB_CMD_OVERRIDE_REQ : 0));
+	return atcphy_dp_poll(atcphy, AUSPLL_APB_CMD_OVERRIDE, AUSPLL_APB_CMD_OVERRIDE_ACK,
+			     request ? AUSPLL_APB_CMD_OVERRIDE_ACK : 0);
+}
+
+static int atcphy_dp_start_pll_t8122(struct apple_atcphy *atcphy,
+				  enum atcphy_dp_link_rate lr)
+{
+	const struct atcphy_dp_link_rate_configuration *cfg = &dp_lr_config[lr];
+	int ret;
+
+	core_clear32(atcphy, AUSPLL_FREQ_CFG_T8122, AUSPLL_FREQ_REFCLK);
+	core_mask32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		    DPTX_PCLK1_SELECT | DPTX_PCLK2_SELECT | DPRX_PCLK_SELECT,
+		    FIELD_PREP(DPTX_PCLK1_SELECT, 1) | FIELD_PREP(DPTX_PCLK2_SELECT, 1) |
+		    FIELD_PREP(DPRX_PCLK_SELECT, 1));
+	core_mask32(atcphy, AUSPLL_FREQ_DESC_A, U32_MAX,
+		    FIELD_PREP(AUSPLL_FD_FREQ_COUNT_TARGET, cfg->freqinit_count_target) |
+		    FIELD_PREP(AUSPLL_FD_KI_MAN, 8) | FIELD_PREP(AUSPLL_FD_KI_EXP, 3) |
+		    FIELD_PREP(AUSPLL_FD_KP_MAN, 8) | FIELD_PREP(AUSPLL_FD_KP_EXP, 7));
+	core_mask32(atcphy, AUSPLL_FREQ_DESC_B, U32_MAX,
+		    FIELD_PREP(AUSPLL_FD_FBDIVN_FRAC_DEN, cfg->fbdivn_frac_den) |
+		    FIELD_PREP(AUSPLL_FD_FBDIVN_FRAC_NUM, cfg->fbdivn_frac_num));
+	core_mask32(atcphy, AUSPLL_FREQ_DESC_C, U32_MAX,
+		    FIELD_PREP(AUSPLL_FD_PCLK_DIV_SEL, cfg->pclk_div_sel) |
+		    FIELD_PREP(AUSPLL_FD_LFSDM_DIV, 1) |
+		    FIELD_PREP(AUSPLL_FD_LFCLK_CTRL, cfg->lfclk_ctrl) |
+		    FIELD_PREP(AUSPLL_FD_VCLK_OP_DIVN, dp_lr_config_t8122[lr].vclk_op_divn) |
+		    (dp_lr_config_t8122[lr].vclk_pre_divn ? AUSPLL_FD_VCLK_PRE_DIVN : 0));
+	core_mask32(atcphy, AUSPLL_CLKOUT_DIV, AUSPLL_CLKOUT_PLLA_REFBUFCLK_DI,
+		    FIELD_PREP(AUSPLL_CLKOUT_PLLA_REFBUFCLK_DI, 7));
+	core_set32(atcphy, AUSPLL_BGR_T8122, AUSPLL_BGR_CTRL_AVAIL);
+	core_set32(atcphy, AUSPLL_CLKOUT_MASTER, AUSPLL_CLKOUT_MASTER_PCLK_DRVR_EN_T8122);
+	ret = atcphy_auspll_set_command(atcphy, 0, true);
+	if (ret)
+		return ret;
+	ret = atcphy_dp_poll(atcphy, ACIOPHY_DP_PCLK_STAT_T8122, ACIOPHY_AUSPLL_LOCK,
+			     ACIOPHY_AUSPLL_LOCK);
+	if (ret)
+		return ret;
+	return atcphy_auspll_set_command(atcphy, 0x2800, false);
+}
+
+static void atcphy_dp_power_on_tx_t8122(struct apple_atcphy *atcphy, unsigned int lane)
+{
+	core_set32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_SLEEP_SMALL(lane));
+	core_set32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_SLEEP_SMALL_OV(lane));
+	udelay(1);
+	core_set32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_SLEEP_BIG(lane));
+	core_set32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_SLEEP_BIG_OV(lane));
+	udelay(1);
+	core_clear32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_CLAMP(lane));
+	core_set32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_CLAMP_OV(lane));
+	udelay(1);
+}
+
+static void atcphy_dp_power_on_rxtx_t8122(struct apple_atcphy *atcphy, unsigned int lane)
+{
+	core_set32(atcphy, ACIOPHY_CFG1, ACIOPHY_RXTX_SLEEP_SMALL(lane));
+	core_set32(atcphy, ACIOPHY_CFG1, ACIOPHY_RXTX_SLEEP_SMALL_OV(lane));
+	udelay(1);
+	core_set32(atcphy, ACIOPHY_CFG1, ACIOPHY_RXTX_SLEEP_BIG(lane));
+	core_set32(atcphy, ACIOPHY_CFG1, ACIOPHY_RXTX_SLEEP_BIG_OV(lane));
+	udelay(1);
+	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_SLEEP_SMALL(lane));
+	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_SLEEP_SMALL_OV(lane));
+	udelay(1);
+	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_SLEEP_BIG(lane));
+	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_SLEEP_BIG_OV(lane));
+	udelay(1);
+	core_clear32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_CLAMP(lane));
+	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_CLAMP_OV(lane));
+	udelay(1);
+}
+
+static void atcphy_dp_configure_tx_t8122(struct apple_atcphy *atcphy, unsigned int lane,
+					 const struct atcphy_dp_link_rate_configuration *cfg)
+{
+	void __iomem *shm = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_TX_SHM);
+	void __iomem *top = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_TX_TOP);
+
+	atcphy_dp_power_on_tx_t8122(atcphy, lane);
+	/* Fixed LDO initialization value, not a calibration tunable. */
+	mask32(shm + LN_AUSPMA_TX_SHM_LDOCLK1, U32_MAX, 0x0aafb800);
+	udelay(1);
+	set32(shm + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_EN_SMALL);
+	udelay(1);
+	set32(shm + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_EN_BIG);
+	udelay(1);
+	mask32(shm + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_VREG_ADJ,
+	       FIELD_PREP(LN_LDOCLK1_VREG_ADJ, 12));
+	udelay(1);
+	clear32(shm + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_VREF_FILTER_BOOST);
+	udelay(1);
+	set32(top + LN_AUSPMA_TX_TOP_EQ17, LN_EQ_AUTO_CTRL_DP);
+	clear32(top + LN_AUSPMA_TX_TOP_EQ1, LN_EQ_SWING | LN_EQ_SWING_LSB);
+	set32(top + LN_AUSPMA_TX_TOP_EQ18, LN_EQ_SWING_OV);
+	mask32(top + LN_AUSPMA_TX_TOP_EQ17, LN_EQ_DEEMPH_FIELDS, 1);
+	if (cfg->txa_ldoclk_bypass) {
+		set32(shm + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_BYPASS_SMALL);
+		udelay(1);
+		set32(shm + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_BYPASS_BIG);
+		udelay(1);
+	}
+	mask32(shm + LN_AUSPMA_TX_SHM_MAIN2,
+	       LN_MAIN2_BYTECLK_SYNC_SEL | LN_MAIN2_BYTECLK_SYNC_SEL_OV,
+	       LN_MAIN2_BYTECLK_SYNC_SEL_OV);
+	set32(shm + LN_AUSPMA_TX_SHM_MAIN2, LN_MAIN2_BYTECLK_SYNC_EN | LN_MAIN2_BYTECLK_SYNC_EN_OV);
+	mask32(shm + LN_AUSPMA_TX_SHM_MAIN4, LN_MAIN4_DIV2_4_EN | LN_MAIN4_DIV2_4_EN_OV,
+	       FIELD_PREP(LN_MAIN4_DIV2_4_EN, cfg->txa_div2_en) | LN_MAIN4_DIV2_4_EN_OV);
+	set32(shm + LN_AUSPMA_TX_SHM_MAIN5, LN_MAIN5_CLK_EN | LN_MAIN5_CLK_EN_OV);
+	mask32(shm + LN_AUSPMA_TX_SHM_CLKMON1, LN_CLKMON1_HIZ | LN_CLKMON1_HIZ_OV,
+	       LN_CLKMON1_HIZ_OV);
+}
+
+static void atcphy_dp_configure_rxtx_t8122(struct apple_atcphy *atcphy, unsigned int lane,
+					   const struct atcphy_dp_link_rate_configuration *cfg)
+{
+	void __iomem *shm = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_RX_SHM);
+	void __iomem *top = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_RX_TOP);
+
+	set32(top + LN_AUSPMA_RX_TOP_TXMODE, LN_RX_TXMODE);
+	set32(top + LN_AUSPMA_RX_TOP_DCO1, LN_DCO1_LPBKIN_RECOVERED_DATA);
+	mask32(shm + LN_AUSPMA_RX_SHM_SAVOS161, LN_SAVOS161_RXTERM_EN | LN_SAVOS161_RXTERM_EN_OV,
+	       LN_SAVOS161_RXTERM_EN_OV);
+	mask32(shm + LN_AUSPMA_RX_SHM_TERM191, LN_TERM191_TX_TEST_EN | LN_TERM191_TX_TEST_EN_OV,
+	       LN_TERM191_TX_TEST_EN_OV);
+	mask32(shm + LN_AUSPMA_RX_SHM_DFE121, LN_DFE121_TX_PBIAS_EN | LN_DFE121_TX_PBIAS_EN_OV,
+	       LN_DFE121_TX_PBIAS_EN_OV);
+	mask32(shm + LN_AUSPMA_RX_SHM_VREF221, LN_VREF221_INIT_FIELDS, 0x121180);
+	mask32(shm + LN_AUSPMA_RX_SHM_DFE101, LN_DFE101_DTVREG_ADJUST_FIELDS, 0xb800);
+	mask32(shm + LN_AUSPMA_RX_SHM_VREF231,
+	       LN_VREF231_BOOST_CTRL | LN_VREF231_BOOST_CTRL_OV,
+	       LN_VREF231_BOOST_CTRL_OV);
+	clear32(shm + LN_AUSPMA_RX_SHM_VREG1, LN_VREG1_DTVREG_POWER_MODE);
+	mask32(shm + LN_AUSPMA_RX_SHM_VREF221, LN_VREF221_BIAS_FIELDS, 0xc000);
+	udelay(1);
+	atcphy_dp_power_on_rxtx_t8122(atcphy, lane);
+	set32(shm + LN_AUSPMA_RX_SHM_DFE121, LN_DFE121_TX_BYTECLK_SYNC_EN);
+	mask32(top + LN_AUSPMA_RX_TOP_AFE1, LN_AFE1_DIV20_RESET_N | LN_AFE1_DIV20_RESET_N_OV,
+	       LN_AFE1_DIV20_RESET_N_OV);
+	udelay(1);
+	set32(top + LN_AUSPMA_RX_TOP_AFE1, LN_AFE1_DIV20_RESET_N);
+	mask32(shm + LN_AUSPMA_RX_SHM_DFE121,
+	       LN_DFE121_TX_BYTECLK_SYNC_CLR | LN_DFE121_TX_BYTECLK_SYNC_CLR_OV,
+	       LN_DFE121_TX_BYTECLK_SYNC_CLR_OV);
+	udelay(1);
+	mask32(shm + LN_AUSPMA_RX_SHM_VREF221, LN_VREF221_EN | LN_VREF221_FILTER_ADJUST,
+	       LN_VREF221_EN | FIELD_PREP(LN_VREF221_FILTER_ADJUST, 1));
+	mask32(shm + LN_AUSPMA_RX_SHM_VREF231, LN_VREF231_BOOST_CTRL,
+	       FIELD_PREP(LN_VREF231_BOOST_CTRL, 1));
+	udelay(1);
+	clear32(shm + LN_AUSPMA_RX_SHM_VREF221, LN_VREF221_FILTER_ADJUST);
+	udelay(1);
+	set32(shm + LN_AUSPMA_RX_SHM_DFE111,
+	      LN_DFE111_DTVREG_SMALL_EN | LN_DFE111_DTVREG_SMALL_EN_OV);
+	udelay(1);
+	set32(shm + LN_AUSPMA_RX_SHM_DFE111, LN_DFE111_DTVREG_BIG_EN | LN_DFE111_DTVREG_BIG_EN_OV);
+	udelay(1);
+	mask32(shm + LN_AUSPMA_RX_SHM_VREF231, LN_VREF231_BOOST_CTRL,
+	       FIELD_PREP(LN_VREF231_BOOST_CTRL, 3));
+	udelay(1);
+	mask32(shm + LN_AUSPMA_RX_SHM_VREF231, LN_VREF231_BOOST_CTRL,
+	       FIELD_PREP(LN_VREF231_BOOST_CTRL, 2));
+	udelay(1);
+	clear32(shm + LN_AUSPMA_RX_SHM_VREF231, LN_VREF231_BOOST_CTRL);
+	udelay(1);
+	set32(shm + LN_AUSPMA_RX_SHM_TERM191, LN_TERM191_TX_EN | LN_TERM191_TX_EN_OV);
+	udelay(1);
+	mask32(shm + LN_AUSPMA_RX_SHM_DFE121, LN_DFE121_TX_HRCLK_SEL | LN_DFE121_TX_HRCLK_SEL_OV,
+	       LN_DFE121_TX_HRCLK_SEL_OV);
+	clear32(top + LN_AUSPMA_RX_TOP_EQ1, LN_EQ_SWING | LN_EQ_SWING_LSB);
+	set32(top + LN_AUSPMA_RX_TOP_EQ18, LN_EQ_SWING_OV);
+	mask32(top + LN_AUSPMA_RX_TOP_EQ17, LN_EQ_DEEMPH_FIELDS, 0x1f81);
+	mask32(shm + LN_AUSPMA_RX_SHM_TERM191, LN_TERM191_TX_DIV2_EN | LN_TERM191_TX_DIV2_EN_OV,
+	       FIELD_PREP(LN_TERM191_TX_DIV2_EN, cfg->txa_div2_en) | LN_TERM191_TX_DIV2_EN_OV);
+	mask32(shm + LN_AUSPMA_RX_SHM_TERM191, LN_TERM191_TX_DIV2_RST | LN_TERM191_TX_DIV2_RST_OV,
+	       LN_TERM191_TX_DIV2_RST_OV);
+	udelay(1);
+	set32(shm + LN_AUSPMA_RX_SHM_CTLE2, LN_CTLE2_TX_CLK_EN | LN_CTLE2_TX_CLK_EN_OV);
+	udelay(1);
+}
+
+static void atcphy_dp_stop_lane_t8122(struct apple_atcphy *atcphy, unsigned int lane)
+{
+	void __iomem *tx = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_TX_SHM);
+	void __iomem *rx = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_RX_SHM);
+	void __iomem *top = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_RX_TOP);
+
+	set32(tx + LN_AUSPMA_TX_SHM_CLKMON1, LN_CLKMON1_HIZ | LN_CLKMON1_HIZ_OV);
+	mask32(tx + LN_AUSPMA_TX_SHM_MAIN5, LN_MAIN5_CLK_EN | LN_MAIN5_CLK_EN_OV,
+	       LN_MAIN5_CLK_EN_OV);
+	mask32(tx + LN_AUSPMA_TX_SHM_MAIN2, LN_MAIN2_BYTECLK_SYNC_EN | LN_MAIN2_BYTECLK_SYNC_EN_OV,
+	       LN_MAIN2_BYTECLK_SYNC_EN_OV);
+	udelay(1);
+	clear32(tx + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_BYPASS_SMALL);
+	udelay(1);
+	clear32(tx + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_BYPASS_BIG);
+	udelay(1);
+	clear32(tx + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_EN_BIG);
+	udelay(1);
+	clear32(tx + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_EN_SMALL);
+	udelay(1);
+	clear32(tx + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_VREF_EN);
+	core_set32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_CLAMP(lane));
+	udelay(1);
+	core_clear32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_SLEEP_BIG(lane));
+	udelay(1);
+	core_clear32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_SLEEP_SMALL(lane));
+	udelay(1);
+
+	mask32(rx + LN_AUSPMA_RX_SHM_CTLE2, LN_CTLE2_TX_CLK_EN | LN_CTLE2_TX_CLK_EN_OV,
+	       LN_CTLE2_TX_CLK_EN_OV);
+	udelay(1);
+	set32(rx + LN_AUSPMA_RX_SHM_TERM191, LN_TERM191_TX_DIV2_RST | LN_TERM191_TX_DIV2_RST_OV);
+	udelay(1);
+	mask32(rx + LN_AUSPMA_RX_SHM_TERM191, LN_TERM191_TX_EN | LN_TERM191_TX_EN_OV,
+	       LN_TERM191_TX_EN_OV);
+	mask32(rx + LN_AUSPMA_RX_SHM_DFE111, LN_DFE111_DTVREG_BIG_EN | LN_DFE111_DTVREG_BIG_EN_OV,
+	       LN_DFE111_DTVREG_BIG_EN_OV);
+	udelay(1);
+	mask32(rx + LN_AUSPMA_RX_SHM_DFE111,
+	       LN_DFE111_DTVREG_SMALL_EN | LN_DFE111_DTVREG_SMALL_EN_OV,
+	       LN_DFE111_DTVREG_SMALL_EN_OV);
+	udelay(1);
+	clear32(rx + LN_AUSPMA_RX_SHM_VREF221, LN_VREF221_EN);
+	udelay(1);
+	set32(rx + LN_AUSPMA_RX_SHM_DFE121,
+	      LN_DFE121_TX_BYTECLK_SYNC_CLR | LN_DFE121_TX_BYTECLK_SYNC_CLR_OV);
+	mask32(top + LN_AUSPMA_RX_TOP_AFE1, LN_AFE1_DIV20_RESET_N | LN_AFE1_DIV20_RESET_N_OV,
+	       LN_AFE1_DIV20_RESET_N_OV);
+	clear32(rx + LN_AUSPMA_RX_SHM_DFE121, LN_DFE121_TX_BYTECLK_SYNC_EN);
+	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_CLAMP(lane));
+	udelay(1);
+	core_clear32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_SLEEP_BIG(lane));
+	udelay(1);
+	core_clear32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_SLEEP_SMALL(lane));
+	udelay(1);
+	core_clear32(atcphy, ACIOPHY_CFG1, ACIOPHY_RXTX_SLEEP_BIG(lane));
+	udelay(1);
+	core_clear32(atcphy, ACIOPHY_CFG1, ACIOPHY_RXTX_SLEEP_SMALL(lane));
+	udelay(1);
+}
+
+static int atcphy_dp_start_link_t8122(struct apple_atcphy *atcphy, u8 pmas,
+				   enum atcphy_dp_link_rate lr)
+{
+	const struct atcphy_dp_link_rate_configuration *cfg = &dp_lr_config[lr];
+	int ret;
+
+	lockdep_assert_held(&atcphy->lock);
+	if (!pmas || pmas > 3)
+		return -EINVAL;
+	ret = atcphy_dp_start_pll_t8122(atcphy, lr);
+	if (ret)
+		return ret;
+	/* Set both feedback overrides before releasing the shared lane reset. */
+	for (unsigned int lane = 0; lane < 2; lane++) {
+		void __iomem *shm = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_RX_SHM);
+
+		if (pmas & BIT(lane))
+			mask32(shm + LN_AUSPMA_RX_SHM_DFE101,
+			       LN_DFE101_DFEH1FB_EN | LN_DFE101_DFEH1FB_EN_OV,
+			       LN_DFE101_DFEH1FB_EN_OV);
+	}
+	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		   DPTXPHY_PMA_LANE_RESET_N | DPTXPHY_PMA_LANE_RESET_N_OV);
+	udelay(1);
+	for (unsigned int lane = 0; lane < 2; lane++) {
+		if (!(pmas & BIT(lane)))
+			continue;
+		atcphy_dp_configure_tx_t8122(atcphy, lane, cfg);
+		atcphy_dp_configure_rxtx_t8122(atcphy, lane, cfg);
+	}
+	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DP_PMA_BYTECLK_RESET);
+	return 0;
+}
+
+static int atcphy_dp_stop_link_t8122(struct apple_atcphy *atcphy)
+{
+	const struct atcphy_mode_configuration *cfg;
+	int ret;
+
+	lockdep_assert_held(&atcphy->lock);
+	if (atcphy->dp_link_rate == ATCPHY_DP_LINK_RATE_IDLE)
+		return 0;
+	cfg = atcphy_get_mode_config(atcphy, atcphy->mode);
+	atcphy->dp_link_rate = ATCPHY_DP_LINK_RATE_PENDING;
+	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DP_PMA_BYTECLK_RESET);
+	for (unsigned int lane = 0; lane < 2; lane++) {
+		if (cfg->dp_lane[lane])
+			atcphy_dp_stop_lane_t8122(atcphy, lane);
+	}
+	core_mask32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		    DPTXPHY_PMA_LANE_RESET_N | DPTXPHY_PMA_LANE_RESET_N_OV,
+		    DPTXPHY_PMA_LANE_RESET_N_OV);
+	ret = atcphy_auspll_set_command(atcphy, 0, true);
+	if (ret)
+		return ret;
+	ret = atcphy_auspll_set_command(atcphy, 3, false);
+	if (ret)
+		return ret;
+	ret = atcphy_dp_poll(atcphy, ACIOPHY_DP_PCLK_STAT_T8122, ACIOPHY_AUSPLL_LOCK, 0);
+	if (ret)
+		return ret;
+	core_clear32(atcphy, AUSPLL_CLKOUT_MASTER, AUSPLL_CLKOUT_MASTER_PCLK_DRVR_EN_T8122);
+	atcphy->dp_link_rate = ATCPHY_DP_LINK_RATE_IDLE;
+	return 0;
+}
+
+static int atcphy_dp_set_rate_t8122(struct apple_atcphy *atcphy, enum atcphy_dp_link_rate lr)
+{
+	const struct atcphy_mode_configuration *cfg;
+	u8 pmas;
+	int ret;
+
+	guard(mutex)(&atcphy->lock);
+	if (!atcphy_modes[atcphy->mode].enable_dp_aux)
+		return -ENOLINK;
+	cfg = atcphy_get_mode_config(atcphy, atcphy->mode);
+	pmas = cfg->dp_lane[0] | (cfg->dp_lane[1] << 1);
+	if (!pmas)
+		return -EINVAL;
+	if (atcphy->dp_link_rate == lr)
+		return 0;
+	ret = atcphy_dp_stop_link_t8122(atcphy);
+	if (ret)
+		return ret;
+	atcphy->dp_link_rate = ATCPHY_DP_LINK_RATE_PENDING;
+	ret = atcphy_dp_start_link_t8122(atcphy, pmas, lr);
+	if (ret) {
+		atcphy_dp_stop_link_t8122(atcphy);
+		return ret;
+	}
+	atcphy->dp_link_rate = lr;
+	return 0;
+}
+
+static void atcphy_enable_dp_aux_t8122(struct apple_atcphy *atcphy)
+{
+	core_set32(atcphy, AUX_SHM_PWR, AUX_SLEEP_SML_OV | AUX_SLEEP_SML);
+	udelay(1);
+	core_set32(atcphy, AUX_SHM_PWR, AUX_SLEEP_BIG_OV | AUX_SLEEP_BIG);
+	udelay(1);
+	core_mask32(atcphy, AUX_SHM_PWR, AUX_CLAMP_OV | AUX_CLAMP,
+		    AUX_CLAMP_OV);
+	udelay(1);
+	core_clear32(atcphy, AUX_TOP_CTRL, AUX_TOP_PWRDN);
+	udelay(1);
+	atcphy->dp_link_rate = ATCPHY_DP_LINK_RATE_IDLE;
+}
+
+static void atcphy_disable_dp_aux_t8122(struct apple_atcphy *atcphy)
+{
+	core_set32(atcphy, AUX_TOP_CTRL, AUX_TOP_PWRDN);
+	udelay(1);
+	core_set32(atcphy, AUX_SHM_PWR, AUX_CLAMP);
+	udelay(1);
+	core_clear32(atcphy, AUX_SHM_PWR, AUX_SLEEP_BIG);
+	udelay(1);
+	core_clear32(atcphy, AUX_SHM_PWR, AUX_SLEEP_SML);
+	udelay(1);
+}
+
+static void atcphy_enable_dp_aux_t8103(struct apple_atcphy *atcphy)
 {
 	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTXPHY_PMA_LANE_RESET_N);
 	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTXPHY_PMA_LANE_RESET_N_OV);
@@ -1425,10 +1968,10 @@ static void atcphy_enable_dp_aux(struct apple_atcphy *atcphy)
 	mask32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_MARGIN, LPDPTX_AUX_MARGIN_RCAL_TXSWING,
 	       FIELD_PREP(LPDPTX_AUX_MARGIN_RCAL_TXSWING, 12));
 
-	atcphy->dp_link_rate = -1;
+	atcphy->dp_link_rate = ATCPHY_DP_LINK_RATE_IDLE;
 }
 
-static void atcphy_disable_dp_aux(struct apple_atcphy *atcphy)
+static void atcphy_disable_dp_aux_t8103(struct apple_atcphy *atcphy)
 {
 	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_PWN_DOWN);
 	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_CTRL, LPDPTX_BLK_AUX_CTRL_PWRDN);
@@ -1444,6 +1987,20 @@ static void atcphy_disable_dp_aux(struct apple_atcphy *atcphy)
 	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTX_PCLK2_ENABLE);
 }
 
+static void atcphy_dp_enable_aux(struct apple_atcphy *atcphy)
+{
+	if (atcphy->hw->dp_enable_aux)
+		atcphy->hw->dp_enable_aux(atcphy);
+	else
+		dev_warn_once(atcphy->dev, "DisplayPort AUX initialization is not implemented\n");
+}
+
+static void atcphy_dp_disable_aux(struct apple_atcphy *atcphy)
+{
+	if (atcphy->hw->dp_disable_aux)
+		atcphy->hw->dp_disable_aux(atcphy);
+}
+
 static int atcphy_dp_configure_lane(struct apple_atcphy *atcphy, enum atcphy_lane lane,
 				    const struct atcphy_dp_link_rate_configuration *cfg)
 {
@@ -1452,20 +2009,11 @@ static int atcphy_dp_configure_lane(struct apple_atcphy *atcphy, enum atcphy_lan
 
 	lockdep_assert_held(&atcphy->lock);
 
-	switch (lane) {
-	case APPLE_ATCPHY_LANE_0:
-		tx_shm = atcphy->regs.core + LN0_AUSPMA_TX_SHM;
-		rx_shm = atcphy->regs.core + LN0_AUSPMA_RX_SHM;
-		rx_top = atcphy->regs.core + LN0_AUSPMA_RX_TOP;
-		break;
-	case APPLE_ATCPHY_LANE_1:
-		tx_shm = atcphy->regs.core + LN1_AUSPMA_TX_SHM;
-		rx_shm = atcphy->regs.core + LN1_AUSPMA_RX_SHM;
-		rx_top = atcphy->regs.core + LN1_AUSPMA_RX_TOP;
-		break;
-	default:
+	if ((unsigned int)lane > APPLE_ATCPHY_LANE_1)
 		return -EINVAL;
-	}
+	tx_shm = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_TX_SHM);
+	rx_shm = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_RX_SHM);
+	rx_top = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_RX_TOP);
 
 	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK, LN_LDOCLK_EN_SML);
 	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK, LN_LDOCLK_EN_SML_OV);
@@ -1804,7 +2352,7 @@ static int atcphy_power_off(struct apple_atcphy *atcphy)
 	u32 reg;
 	int ret;
 
-	atcphy_disable_dp_aux(atcphy);
+	atcphy_dp_disable_aux(atcphy);
 
 	/* Enable all reset lines */
 	core_clear32(atcphy, ATCPHY_POWER_CTRL, ATCPHY_POWER_PHY_RESET_N);
@@ -1931,10 +2479,8 @@ static void atcphy_configure_post_tunable_t8103(struct apple_atcphy *atcphy, enu
 	udelay(10);
 }
 
-static void atcphy_configure_post_tunable_t8122(struct apple_atcphy *atcphy, enum atcphy_mode mode)
+static void atcphy_power_on_common_t8122(struct apple_atcphy *atcphy)
 {
-	if (atcphy_modes[mode].pipehandler_state != ATCPHY_PIPEHANDLER_STATE_USB3)
-		return;
 	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL);
 	udelay(10);
 	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL_OV);
@@ -1951,6 +2497,13 @@ static void atcphy_configure_post_tunable_t8122(struct apple_atcphy *atcphy, enu
 	udelay(10);
 }
 
+static void atcphy_configure_post_tunable_t8122(struct apple_atcphy *atcphy, enum atcphy_mode mode)
+{
+	if (atcphy_modes[mode].pipehandler_state == ATCPHY_PIPEHANDLER_STATE_USB3 ||
+	    (atcphy->hw->dp_enable_aux && atcphy_modes[mode].enable_dp_aux))
+		atcphy_power_on_common_t8122(atcphy);
+}
+
 static void atcphy_enable_cio3pll_clk_t8103(struct apple_atcphy *atcphy)
 {
 	core_set32(atcphy, CIO3PLL_CLK_CTRL, CIO3PLL_CLK_PCLK_EN);
@@ -1979,6 +2532,11 @@ static int atcphy_configure(struct apple_atcphy *atcphy, enum atcphy_mode mode)
 	int ret = 0;
 
 	lockdep_assert_held(&atcphy->lock);
+	if (atcphy->hw->dp_stop) {
+		ret = atcphy->hw->dp_stop(atcphy);
+		if (ret)
+			return ret;
+	}
 
 	if (mode == APPLE_ATCPHY_MODE_OFF) {
 		ret = atcphy_power_off(atcphy);
@@ -1995,7 +2553,7 @@ static int atcphy_configure(struct apple_atcphy *atcphy, enum atcphy_mode mode)
 
 	/* Setup AUX channel if DP altmode is requested */
 	if (atcphy_modes[mode].enable_dp_aux)
-		atcphy_enable_dp_aux(atcphy);
+		atcphy_dp_enable_aux(atcphy);
 
 	/* Enable clocks and configure lanes */
 	if (atcphy->hw->enable_cio3pll_clk)
@@ -2141,6 +2699,10 @@ static int atcphy_dpphy_configure(struct phy *phy, union phy_configure_opts *opt
 		return -EINVAL;
 
 	if (opts->set_rate) {
+		if (!atcphy->hw->dp_enable_aux) {
+			dev_warn(atcphy->dev, "DisplayPort lane setup is not implemented\n");
+			return -EOPNOTSUPP;
+		}
 		switch (opts->link_rate) {
 		case 1620:
 			link_rate = ATCPHY_DP_LINK_RATE_RBR;
@@ -2155,12 +2717,18 @@ static int atcphy_dpphy_configure(struct phy *phy, union phy_configure_opts *opt
 			link_rate = ATCPHY_DP_LINK_RATE_HBR3;
 			break;
 		case 0:
+			if (atcphy->hw->dp_stop) {
+				guard(mutex)(&atcphy->lock);
+				return atcphy->hw->dp_stop(atcphy);
+			}
 			return 0;
 		default:
 			dev_err(atcphy->dev, "Unsupported link rate: %d\n", opts->link_rate);
 			return -EINVAL;
 		}
 
+		if (atcphy->hw->dp_set_rate)
+			return atcphy->hw->dp_set_rate(atcphy, link_rate);
 		return atcphy_dp_configure(atcphy, link_rate);
 	}
 
@@ -2283,19 +2851,31 @@ static int atcphy_probe_rcdev(struct apple_atcphy *atcphy)
 static int atcphy_sw_set(struct typec_switch_dev *sw, enum typec_orientation orientation)
 {
 	struct apple_atcphy *atcphy = typec_switch_get_drvdata(sw);
+	bool swap_lanes;
+	int ret;
 
 	guard(mutex)(&atcphy->lock);
 
 	switch (orientation) {
 	case TYPEC_ORIENTATION_NONE:
-		break;
+		return 0;
 	case TYPEC_ORIENTATION_NORMAL:
-		atcphy->swap_lanes = false;
+		swap_lanes = false;
 		break;
 	case TYPEC_ORIENTATION_REVERSE:
-		atcphy->swap_lanes = true;
+		swap_lanes = true;
 		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Cleanup needs the old lane configuration until shutdown succeeds. */
+	if (swap_lanes != atcphy->swap_lanes && atcphy->hw->dp_stop) {
+		ret = atcphy->hw->dp_stop(atcphy);
+		if (ret)
+			return ret;
 	}
+	atcphy->swap_lanes = swap_lanes;
 
 	return 0;
 }
@@ -2538,6 +3118,7 @@ static int atcphy_probe(struct platform_device *pdev)
 		return ret;
 
 	atcphy->mode = APPLE_ATCPHY_MODE_OFF;
+	atcphy->dp_link_rate = ATCPHY_DP_LINK_RATE_IDLE;
 	atcphy->pipehandler_up = false;
 
 	return atcphy_probe_finalize(atcphy);
@@ -2551,6 +3132,8 @@ static const struct atcphy_hw atcphy_hw_t8103 = {
 	.configure_pipehandler_usb3_host = atcphy_configure_pipehandler_usb3_host_t8103,
 	.enable_cio3pll_clk = atcphy_enable_cio3pll_clk_t8103,
 	.configure_lane_pmafsm = atcphy_configure_lane_pmafsm_t8103,
+	.dp_enable_aux = atcphy_enable_dp_aux_t8103,
+	.dp_disable_aux = atcphy_disable_dp_aux_t8103,
 };
 
 static const struct atcphy_hw atcphy_hw_t8122 = {
@@ -2561,6 +3144,10 @@ static const struct atcphy_hw atcphy_hw_t8122 = {
 	.configure_pipehandler_usb3_host = atcphy_configure_pipehandler_usb3_host_t8122,
 	.configure_usb2_evt_ctl = atcphy_configure_usb2_evt_ctl_t8122,
 	.wait_rcal1_done = atcphy_wait_rcal1_done_t8122,
+	.dp_enable_aux = atcphy_enable_dp_aux_t8122,
+	.dp_disable_aux = atcphy_disable_dp_aux_t8122,
+	.dp_set_rate = atcphy_dp_set_rate_t8122,
+	.dp_stop = atcphy_dp_stop_link_t8122,
 };
 
 static const struct of_device_id atcphy_match[] = {

-- 
2.56.1

