Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642054;
	b=cSD+TiLHQKb2fsSk49yXIoVSZ/hkm9PracZr19D0Rdim6a56vWBgoXY2RCeVhtecfJgv
	 382qbXA6vIXVXDj9LAHJEBi2kzKgRIk0DoLJDdyBRd+4HIKV0hu/FixKL5cx2pG8sSMfM
	 owWyrNXqwjK+0UvVGWXWdS8jkBE2QHgSG6CsYHI9YE5cQnS0+gH2j52lXZ8w2+ULSTeDR
	 RKkqT668zkTCo45cxB722tRrtUiJg2eOPtUdEQ/jXJO4HycBs/ui6FCpP60QDKGp/Kkel
	 Efjeb40PsjYIE6WXDXl0A9eTPf0smrzWOS6ieJLZB2J3wRR+7Rf3bw+wwJUAEzvnHyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642054;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=NevCsYRoVE/uYVY7bGao5XTDdSbkYJQuYLT2djYZ0sg=;
	b=IIyx/Nfn+dkwVWbmxbqBIuZj7Ea/deuq3fBkVJZ7/K4rf21kVrPukvy9UVbQYn56scsV
	 IpOWxlZOmfT0+f8ddDHICRTXSIqZpybYHSpZJocBgFclPZ054KYQgr4+/wGwYYDGivTOx
	 eScdmKsXuG7r3SFuCEcSM1KCBrvX1NI/qn7Cy/jzZLuMDbflQ2a8dIo4opAALbbcO0BE3
	 OcebfsL5/s2Tk+b+ZSWjYi2jwbaD29vyxkMsv8KmBe3O+ZT7u3/QuPqgQMrrxCnR29Zer
	 aegsobyr3Yj0ZyylczBcOVCevtmpLjubMeEu/SuDOq9anwH2KXD+mBRIlvqwAU2rKuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=KccUIHZ+;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3D7606A332
	for <asahi@lists.linux.dev>; Wed, 25 Nov 2026 21:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F3D7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=KccUIHZ+
Received: by chaosmail.tech (Postfix) id 7A9051CA01C;
	Wed, 25 Nov 2026 13:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795612320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NevCsYRoVE/uYVY7bGao5XTDdSbkYJQuYLT2djYZ0sg=;
	b=KccUIHZ+vsE8isgLK2ahZg3A8gsJICxT3+OKEkFkMAowKmo9UfmIkskfdYQmgbAJWA080R
	4olhT3SVy60wU7V3dV8plSRxr3hJEWFfj/bL+C73qosBVuDp0XeOweXP6BN08OOHWhVGuf
	BRBKjvZFwNjOlkSwMn7EXQg33plqWxI=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 25 Nov 2026 14:11:49 +0100
Subject: [PATCH v3 5/5] phy: apple: atc: Split generation-specific code
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
Message-Id: <20261125-t8122-phy-v3-5-196e20b3537e@chaosmail.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795612315; l=109238;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=1SLqp/LPWn09xXIRKNtCjF8EPQDNxrDnJZP5brCr47w=;
 b=Imuui3bwLvzW43rsDXdBTVCNY6Xa5kI7u4saZBGYwwABnyDEfBXnD5cNYieAfKhIUqeJODCZ4
 Fl/Emv74DaoDFAM90+Q/syl52/fqw0Vj0MgvzyZfNWeNWKCu/GuDIEB
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

atc.c is getting pretty big, split out the hardware generation-specific
code into separate files.

Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/phy/apple/Makefile    |    2 +-
 drivers/phy/apple/atc-t8103.c |  273 +++++++++
 drivers/phy/apple/atc-t8122.c |  713 +++++++++++++++++++++++
 drivers/phy/apple/atc.c       | 1286 +----------------------------------------
 drivers/phy/apple/atc.h       |  340 +++++++++++
 5 files changed, 1333 insertions(+), 1281 deletions(-)

diff --git a/drivers/phy/apple/Makefile b/drivers/phy/apple/Makefile
index e02836a63df3..068cb5c9e6a4 100644
--- a/drivers/phy/apple/Makefile
+++ b/drivers/phy/apple/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
 
 obj-$(CONFIG_PHY_APPLE_ATC)		+= phy-apple-atc.o
-phy-apple-atc-y			:= atc.o
+phy-apple-atc-y			:= atc.o atc-t8103.o atc-t8122.o
diff --git a/drivers/phy/apple/atc-t8103.c b/drivers/phy/apple/atc-t8103.c
new file mode 100644
index 000000000000..6dfebff5ee16
--- /dev/null
+++ b/drivers/phy/apple/atc-t8103.c
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+
+#include <linux/iopoll.h>
+#include <linux/types.h>
+
+#include "atc.h"
+
+#define CIO3PLL_CLK_CTRL 0x2a00
+#define CIO3PLL_CLK_PCLK_EN BIT(1)
+#define CIO3PLL_CLK_REFCLK_EN BIT(5)
+
+#define ACIOPHY_SLEEP_CTRL 0x1b0
+#define ACIOPHY_SLEEP_CTRL_TX_BIG_OV GENMASK(3, 2)
+#define ACIOPHY_SLEEP_CTRL_TX_SMALL_OV GENMASK(7, 6)
+#define ACIOPHY_SLEEP_CTRL_TX_CLAMP_OV GENMASK(11, 10)
+
+#define ACIOPHY_TOP_BIST_PHY_CFG0 0xa8
+#define ACIOPHY_TOP_BIST_PHY_CFG0_LN0_RESET_N BIT(0)
+
+#define ACIOPHY_TOP_BIST_PHY_CFG1 0xac
+#define ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN GENMASK(13, 10)
+
+#define ACIOPHY_TOP_BIST_OV_CFG 0x8c
+#define ACIOPHY_TOP_BIST_OV_CFG_LN0_RESET_N_OV BIT(13)
+#define ACIOPHY_TOP_BIST_OV_CFG_LN0_PWR_DOWN_OV BIT(25)
+
+#define ACIOPHY_TOP_PHY_STAT 0x9c
+#define ACIOPHY_TOP_PHY_STAT_LN0_UNK0 BIT(0)
+#define ACIOPHY_TOP_PHY_STAT_LN0_UNK23 BIT(23)
+
+#define ACIOPHY_TOP_BIST_READ_CTRL 0x90
+#define ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE BIT(2)
+
+#define ACIOPHY_TOP_BIST_CIOPHY_CFG1 0x84
+#define ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN BIT(27)
+#define ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN BIT(28)
+
+#define ACIOPHY_PLL_COMMON_CTRL 0x1028
+#define ACIOPHY_PLL_WAIT_FOR_CMN_READY_BEFORE_RESET_EXIT BIT(24)
+
+#define LPDPTX_AUX_CFG_BLK_AUX_LDO_CTRL 0x0008
+
+#define LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG0 0x0204
+#define LPDPTX_CFG_PMA_AUX_SEL_LF_DATA BIT(15)
+
+#define LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG1 0x0208
+#define LPDPTX_CFG_PMA_PHYS_ADJ GENMASK(22, 20)
+#define LPDPTX_CFG_PMA_PHYS_ADJ_OV BIT(19)
+
+#define LPDPTX_AUX_CONTROL 0x4000
+#define LPDPTX_AUX_PWN_DOWN 0x10
+#define LPDPTX_AUX_CLAMP_EN 0x04
+#define LPDPTX_SLEEP_B_BIG_IN 0x02
+#define LPDPTX_SLEEP_B_SML_IN 0x01
+#define LPDPTX_TXTERM_CODEMSB 0x400
+#define LPDPTX_TXTERM_CODE GENMASK(9, 5)
+
+#define LPDPTX_AUX_CFG_BLK_AUX_MARGIN 0x000c
+#define LPDPTX_MARGIN_RCAL_RXOFFSET_EN BIT(5)
+#define LPDPTX_AUX_MARGIN_RCAL_TXSWING GENMASK(10, 6)
+
+#define LPDPTX_AUX_CFG_BLK_AUX_CTRL 0x0000
+#define LPDPTX_BLK_AUX_CTRL_PWRDN BIT(4)
+#define LPDPTX_BLK_AUX_RXOFFSET GENMASK(25, 22)
+
+#define LN_AUSPMA_RX_TOP_PMAFSM 0x0010
+#define LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV BIT(0)
+#define LN_AUSPMA_RX_TOP_PMAFSM_PCS_REQ BIT(9)
+
+#define ACIOPHY_CROSSBAR_T8103 0x4c
+
+#define ACIOPHY_LANE_MODE_T8103 0x48
+
+static void atcphy_configure_pipehandler_usb3_host_t8103(struct apple_atcphy *atcphy)
+{
+	int ret;
+	u32 reg;
+
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
+static void atcphy_enable_dp_aux_t8103(struct apple_atcphy *atcphy)
+{
+	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTXPHY_PMA_LANE_RESET_N);
+	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTXPHY_PMA_LANE_RESET_N_OV);
+
+	core_mask32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPRX_PCLK_SELECT,
+		    FIELD_PREP(DPRX_PCLK_SELECT, 1));
+	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPRX_PCLK_ENABLE);
+
+	core_mask32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTX_PCLK1_SELECT,
+		    FIELD_PREP(DPTX_PCLK1_SELECT, 1));
+	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTX_PCLK1_ENABLE);
+
+	core_mask32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTX_PCLK2_SELECT,
+		    FIELD_PREP(DPTX_PCLK2_SELECT, 1));
+	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTX_PCLK2_ENABLE);
+
+	core_set32(atcphy, ACIOPHY_PLL_COMMON_CTRL,
+		   ACIOPHY_PLL_WAIT_FOR_CMN_READY_BEFORE_RESET_EXIT);
+
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_CLAMP_EN);
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_SLEEP_B_SML_IN);
+	udelay(10);
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_SLEEP_B_BIG_IN);
+	udelay(10);
+	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_CLAMP_EN);
+	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_PWN_DOWN);
+	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_TXTERM_CODEMSB);
+	mask32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_TXTERM_CODE,
+	       FIELD_PREP(LPDPTX_TXTERM_CODE, 0x16));
+
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_LDO_CTRL, 0x1c00);
+	mask32(atcphy->regs.lpdptx + LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG1, LPDPTX_CFG_PMA_PHYS_ADJ,
+	       FIELD_PREP(LPDPTX_CFG_PMA_PHYS_ADJ, 5));
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG1,
+	      LPDPTX_CFG_PMA_PHYS_ADJ_OV);
+
+	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_MARGIN,
+		LPDPTX_MARGIN_RCAL_RXOFFSET_EN);
+
+	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_CTRL, LPDPTX_BLK_AUX_CTRL_PWRDN);
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG0,
+	      LPDPTX_CFG_PMA_AUX_SEL_LF_DATA);
+	mask32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_CTRL, LPDPTX_BLK_AUX_RXOFFSET,
+	       FIELD_PREP(LPDPTX_BLK_AUX_RXOFFSET, 3));
+
+	mask32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_MARGIN, LPDPTX_AUX_MARGIN_RCAL_TXSWING,
+	       FIELD_PREP(LPDPTX_AUX_MARGIN_RCAL_TXSWING, 12));
+
+	atcphy->dp_link_rate = ATCPHY_DP_LINK_RATE_IDLE;
+}
+
+static void atcphy_disable_dp_aux_t8103(struct apple_atcphy *atcphy)
+{
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_PWN_DOWN);
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_CTRL, LPDPTX_BLK_AUX_CTRL_PWRDN);
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_CLAMP_EN);
+	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_SLEEP_B_SML_IN);
+	udelay(10);
+	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_SLEEP_B_BIG_IN);
+	udelay(10);
+
+	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTXPHY_PMA_LANE_RESET_N);
+	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPRX_PCLK_ENABLE);
+	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTX_PCLK1_ENABLE);
+	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTX_PCLK2_ENABLE);
+}
+
+static void atcphy_configure_post_tunable_t8103(struct apple_atcphy *atcphy, enum atcphy_mode _mode)
+{
+	core_set32(atcphy, AUSPLL_FSM_CTRL, 0x1fe000);
+	core_set32(atcphy, AUSPLL_APB_CMD_OVERRIDE, AUSPLL_APB_CMD_OVERRIDE_UNK28);
+
+	set32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL_OV);
+	udelay(10);
+	set32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_BIG_OV);
+	udelay(10);
+	set32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_CLAMP_OV);
+	udelay(10);
+
+	mask32(atcphy->regs.core + ACIOPHY_SLEEP_CTRL, ACIOPHY_SLEEP_CTRL_TX_SMALL_OV,
+	       FIELD_PREP(ACIOPHY_SLEEP_CTRL_TX_SMALL_OV, 3));
+	udelay(10);
+	mask32(atcphy->regs.core + ACIOPHY_SLEEP_CTRL, ACIOPHY_SLEEP_CTRL_TX_BIG_OV,
+	       FIELD_PREP(ACIOPHY_SLEEP_CTRL_TX_BIG_OV, 3));
+	udelay(10);
+	mask32(atcphy->regs.core + ACIOPHY_SLEEP_CTRL, ACIOPHY_SLEEP_CTRL_TX_CLAMP_OV,
+	       FIELD_PREP(ACIOPHY_SLEEP_CTRL_TX_CLAMP_OV, 3));
+	udelay(10);
+
+	mask32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_RX_BIG_OV,
+	       FIELD_PREP(ACIOPHY_CFG0_RX_BIG_OV, 3));
+	udelay(10);
+	mask32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_RX_SMALL_OV,
+	       FIELD_PREP(ACIOPHY_CFG0_RX_SMALL_OV, 3));
+	udelay(10);
+	mask32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_RX_CLAMP_OV,
+	       FIELD_PREP(ACIOPHY_CFG0_RX_CLAMP_OV, 3));
+	udelay(10);
+}
+
+static void atcphy_enable_cio3pll_clk_t8103(struct apple_atcphy *atcphy)
+{
+	core_set32(atcphy, CIO3PLL_CLK_CTRL, CIO3PLL_CLK_PCLK_EN);
+	core_set32(atcphy, CIO3PLL_CLK_CTRL, CIO3PLL_CLK_REFCLK_EN);
+}
+
+static void
+atcphy_configure_lane_pmafsm_t8103(struct apple_atcphy *atcphy,
+				   const struct atcphy_mode_configuration *mode_cfg)
+{
+	if (mode_cfg->dp_lane[0]) {
+		core_set32(atcphy, LN0_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
+			   LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV);
+		udelay(10);
+		core_clear32(atcphy, LN0_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
+			     LN_AUSPMA_RX_TOP_PMAFSM_PCS_REQ);
+	} else {
+		core_clear32(atcphy, LN0_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
+			     LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV);
+		udelay(10);
+	}
+
+	if (mode_cfg->dp_lane[1]) {
+		core_set32(atcphy, LN1_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
+			   LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV);
+		udelay(10);
+		core_clear32(atcphy, LN1_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
+			     LN_AUSPMA_RX_TOP_PMAFSM_PCS_REQ);
+	} else {
+		core_clear32(atcphy, LN1_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
+			     LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV);
+		udelay(10);
+	}
+}
+
+const struct atcphy_hw atcphy_hw_t8103 = {
+	.need_dp_tunables = true,
+	.aciophy_lane_mode = ACIOPHY_LANE_MODE_T8103,
+	.aciophy_crossbar = ACIOPHY_CROSSBAR_T8103,
+	.configure_post_tunable = atcphy_configure_post_tunable_t8103,
+	.configure_pipehandler_usb3_host = atcphy_configure_pipehandler_usb3_host_t8103,
+	.enable_cio3pll_clk = atcphy_enable_cio3pll_clk_t8103,
+	.configure_lane_pmafsm = atcphy_configure_lane_pmafsm_t8103,
+	.dp_enable_aux = atcphy_enable_dp_aux_t8103,
+	.dp_disable_aux = atcphy_disable_dp_aux_t8103,
+};
diff --git a/drivers/phy/apple/atc-t8122.c b/drivers/phy/apple/atc-t8122.c
new file mode 100644
index 000000000000..be18e651d770
--- /dev/null
+++ b/drivers/phy/apple/atc-t8122.c
@@ -0,0 +1,713 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+
+#include <linux/iopoll.h>
+#include <linux/types.h>
+
+#include "atc.h"
+
+#define AUS_COMMON_SHIM_BLK_BIAS_REG 0x0a00
+#define AUS_COMMON_SHIM_BLK_BIAS_REG_BGBIAS_OV BIT(1)
+
+#define AUS_COMMON_DIG_RCAL1 0x804
+#define AUS_COMMON_DIG_RCAL1_ALL_CODES_DONE BIT(0)
+
+#define ATCPHY_EVT_USB2_CTL 0x0
+#define ATCPHY_EVT_USB2_CTL_EVT_EN 0x1
+#define ATCPHY_EVT_USB2_CTL_LOAD_CNT 0x8
+
+#define ACIOPHY_BIST_MAC_USBPHY_STATUS2 0x17080
+#define ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2 BIT(7)
+
+#define ACIOPHY_BIST_CFG1 0x17000
+#define ACIOPHY_BIST_CFG1_CLOCK_EN BIT(0)
+#define ACIOPHY_BIST_CFG1_USB_EN BIT(2)
+
+#define ACIOPHY_BIST_CFG2 0x17004
+#define ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE BIT(2)
+
+#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV1 0x17088
+#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PIPE_RESET_N_OV 0x100000
+#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV GENMASK(26, 25)
+
+#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV2 0x1708c
+#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_RESET_N_OV 0x200
+#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_PWR_DOWN_OV 0x20
+
+/* LPDPTX registers */
+#define LN_AUSPMA_TX_TOP_EQ1 0x0050
+#define LN_AUSPMA_TX_TOP_EQ17 0x00d0
+#define LN_AUSPMA_TX_TOP_EQ18 0x00d4
+#define LN_AUSPMA_RX_TOP_EQ1 0x0210
+#define LN_AUSPMA_RX_TOP_EQ17 0x0244
+#define LN_AUSPMA_RX_TOP_EQ18 0x0248
+
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
+
+#define LN_AUSPMA_TX_SHM_MAIN4 0x000c
+#define LN_MAIN4_DIV2_4_EN GENMASK(25, 24)
+#define LN_MAIN4_DIV2_4_EN_OV BIT(26)
+
+#define LN_AUSPMA_TX_SHM_MAIN5 0x0010
+#define LN_MAIN5_CLK_EN BIT(9)
+#define LN_MAIN5_CLK_EN_OV BIT(10)
+
+#define LN_AUSPMA_TX_SHM_CLKMON1 0x001c
+#define LN_CLKMON1_HIZ BIT(22)
+#define LN_CLKMON1_HIZ_OV BIT(23)
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
+
+#define LN_AUSPMA_RX_SHM_DFE101 0x0064
+#define LN_DFE101_DFEH1FB_EN BIT(2)
+#define LN_DFE101_DFEH1FB_EN_OV BIT(3)
+#define LN_DFE101_DTVREG_ADJUST_FIELDS GENMASK(15, 10)
+
+#define LN_AUSPMA_RX_SHM_DFE111 0x0068
+#define LN_DFE111_DTVREG_BIG_EN BIT(5)
+#define LN_DFE111_DTVREG_BIG_EN_OV BIT(6)
+#define LN_DFE111_DTVREG_SMALL_EN BIT(7)
+#define LN_DFE111_DTVREG_SMALL_EN_OV BIT(8)
+
+#define LN_AUSPMA_RX_SHM_DFE121 0x006c
+#define LN_DFE121_TX_BYTECLK_SYNC_CLR BIT(9)
+#define LN_DFE121_TX_BYTECLK_SYNC_CLR_OV BIT(10)
+#define LN_DFE121_TX_BYTECLK_SYNC_EN BIT(11)
+#define LN_DFE121_TX_HRCLK_SEL BIT(13)
+#define LN_DFE121_TX_HRCLK_SEL_OV BIT(14)
+#define LN_DFE121_TX_PBIAS_EN BIT(15)
+#define LN_DFE121_TX_PBIAS_EN_OV BIT(16)
+
+#define LN_AUSPMA_RX_SHM_SAVOS161 0x00a4
+#define LN_SAVOS161_RXTERM_EN BIT(0)
+#define LN_SAVOS161_RXTERM_EN_OV BIT(1)
+
+#define LN_AUSPMA_RX_SHM_TERM191 0x00a8
+#define LN_TERM191_TX_TEST_EN BIT(15)
+#define LN_TERM191_TX_TEST_EN_OV BIT(16)
+#define LN_TERM191_TX_EN BIT(17)
+#define LN_TERM191_TX_EN_OV BIT(18)
+#define LN_TERM191_TX_DIV2_EN GENMASK(20, 19)
+#define LN_TERM191_TX_DIV2_EN_OV BIT(21)
+#define LN_TERM191_TX_DIV2_RST BIT(22)
+#define LN_TERM191_TX_DIV2_RST_OV BIT(23)
+
+#define LN_AUSPMA_RX_SHM_VREF221 0x00d4
+/* Adjust, filter and enable overrides; individual fields unknown */
+#define LN_VREF221_INIT_FIELDS (GENMASK(20, 16) | GENMASK(12, 7))
+#define LN_VREF221_BIAS_FIELDS GENMASK(15, 13)
+#define LN_VREF221_EN BIT(16)
+#define LN_VREF221_FILTER_ADJUST GENMASK(19, 18)
+
+#define LN_AUSPMA_RX_SHM_VREF231 0x00d8
+#define LN_VREF231_BOOST_CTRL GENMASK(1, 0)
+#define LN_VREF231_BOOST_CTRL_OV BIT(2)
+
+#define LN_AUSPMA_RX_SHM_VREG1 0x00dc
+#define LN_VREG1_DTVREG_POWER_MODE GENMASK(4, 3)
+
+#define LN_AUSPMA_TX_SHM_LDOCLK1 0x0044
+#define LN_LDOCLK1_VREG_ADJ GENMASK(10, 6)
+#define LN_LDOCLK1_VREF_EN BIT(12)
+#define LN_LDOCLK1_VREF_FILTER_BOOST (GENMASK(18, 17) | GENMASK(15, 14))
+#define LN_LDOCLK1_BYPASS_SMALL BIT(20)
+#define LN_LDOCLK1_BYPASS_BIG BIT(22)
+#define LN_LDOCLK1_EN_SMALL BIT(24)
+#define LN_LDOCLK1_EN_BIG BIT(26)
+
+#define ACIOPHY_CROSSBAR_T8122 0x64
+
+#define ACIOPHY_LANE_MODE_T8122 0x60
+
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
+	const struct atcphy_dp_link_rate_configuration *cfg = &atcphy_dp_lr_config[lr];
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
+	const struct atcphy_dp_link_rate_configuration *cfg = &atcphy_dp_lr_config[lr];
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
+static void atcphy_configure_usb2_evt_ctl_t8122(struct apple_atcphy *atcphy)
+{
+	core_set32(atcphy, ATCPHY_EVT_USB2_CTL, ATCPHY_EVT_USB2_CTL_LOAD_CNT |
+		ATCPHY_EVT_USB2_CTL_EVT_EN);
+	udelay(10);
+}
+
+static void atcphy_power_on_common_t8122(struct apple_atcphy *atcphy)
+{
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
+static void atcphy_configure_post_tunable_t8122(struct apple_atcphy *atcphy, enum atcphy_mode mode)
+{
+	if (atcphy_modes[mode].pipehandler_state == ATCPHY_PIPEHANDLER_STATE_USB3 ||
+	    (atcphy->hw->dp_enable_aux && atcphy_modes[mode].enable_dp_aux))
+		atcphy_power_on_common_t8122(atcphy);
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
+const struct atcphy_hw atcphy_hw_t8122 = {
+	.need_dp_tunables = false,
+	.aciophy_lane_mode = ACIOPHY_LANE_MODE_T8122,
+	.aciophy_crossbar = ACIOPHY_CROSSBAR_T8122,
+	.configure_post_tunable = atcphy_configure_post_tunable_t8122,
+	.configure_pipehandler_usb3_host = atcphy_configure_pipehandler_usb3_host_t8122,
+	.configure_usb2_evt_ctl = atcphy_configure_usb2_evt_ctl_t8122,
+	.wait_rcal1_done = atcphy_wait_rcal1_done_t8122,
+	.dp_enable_aux = atcphy_enable_dp_aux_t8122,
+	.dp_disable_aux = atcphy_disable_dp_aux_t8122,
+	.dp_set_rate = atcphy_dp_set_rate_t8122,
+	.dp_stop = atcphy_dp_stop_link_t8122,
+};
diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index 5c0688339353..534319a4afb7 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -44,36 +44,7 @@
 #include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_tbt.h>
 
-#define AUSPLL_FSM_CTRL 0x1014
-
-#define AUSPLL_APB_CMD_OVERRIDE 0x2000
-#define AUSPLL_APB_CMD_OVERRIDE_REQ BIT(0)
-#define AUSPLL_APB_CMD_OVERRIDE_ACK BIT(1)
-#define AUSPLL_APB_CMD_OVERRIDE_UNK28 BIT(28)
-#define AUSPLL_APB_CMD_OVERRIDE_CMD GENMASK(27, 3)
-
-#define AUSPLL_FREQ_DESC_A 0x2080
-#define AUSPLL_FD_FREQ_COUNT_TARGET GENMASK(9, 0)
-#define AUSPLL_FD_FBDIVN_HALF BIT(10)
-#define AUSPLL_FD_REV_DIVN GENMASK(13, 11)
-#define AUSPLL_FD_KI_MAN GENMASK(17, 14)
-#define AUSPLL_FD_KI_EXP GENMASK(21, 18)
-#define AUSPLL_FD_KP_MAN GENMASK(25, 22)
-#define AUSPLL_FD_KP_EXP GENMASK(29, 26)
-#define AUSPLL_FD_KPKI_SCALE_HBW GENMASK(31, 30)
-
-#define AUSPLL_FREQ_DESC_B 0x2084
-#define AUSPLL_FD_FBDIVN_FRAC_DEN GENMASK(13, 0)
-#define AUSPLL_FD_FBDIVN_FRAC_NUM GENMASK(27, 14)
-
-#define AUSPLL_FREQ_DESC_C 0x2088
-#define AUSPLL_FD_SDM_SSC_STEP GENMASK(7, 0)
-#define AUSPLL_FD_SDM_SSC_EN BIT(8)
-#define AUSPLL_FD_PCLK_DIV_SEL GENMASK(13, 9)
-#define AUSPLL_FD_LFSDM_DIV GENMASK(15, 14)
-#define AUSPLL_FD_LFCLK_CTRL GENMASK(19, 16)
-#define AUSPLL_FD_VCLK_OP_DIVN GENMASK(21, 20)
-#define AUSPLL_FD_VCLK_PRE_DIVN BIT(22)
+#include "atc.h"
 
 #define AUSPLL_DCO_EFUSE_SPARE 0x222c
 #define AUSPLL_RODCO_ENCAP_EFUSE GENMASK(10, 9)
@@ -82,43 +53,19 @@
 #define AUSPLL_FRACN_CAN 0x22a4
 #define AUSPLL_DLL_START_CAPCODE GENMASK(18, 17)
 
-#define AUSPLL_CLKOUT_MASTER 0x2200
-#define AUSPLL_CLKOUT_MASTER_PCLK_DRVR_EN BIT(2)
-#define AUSPLL_CLKOUT_MASTER_PCLK2_DRVR_EN BIT(4)
-#define AUSPLL_CLKOUT_MASTER_REFBUFCLK_DRVR_EN BIT(6)
-
-#define AUSPLL_CLKOUT_DIV 0x2208
-#define AUSPLL_CLKOUT_PLLA_REFBUFCLK_DI GENMASK(20, 16)
-
-#define AUSPLL_BGR 0x2214
-#define AUSPLL_BGR_CTRL_AVAIL BIT(0)
-
 #define AUSPLL_CLKOUT_DTC_VREG 0x2220
 #define AUSPLL_DTC_VREG_ADJUST GENMASK(16, 14)
 #define AUSPLL_DTC_VREG_BYPASS BIT(7)
 
-#define AUSPLL_FREQ_CFG 0x2224
-#define AUSPLL_FREQ_REFCLK GENMASK(1, 0)
-
-#define AUS_COMMON_SHIM_BLK_BIAS_REG 0x0a00
-#define AUS_COMMON_SHIM_BLK_BIAS_REG_BGBIAS_OV BIT(1)
-
 #define AUS_COMMON_SHIM_BLK_VREG 0x0a04
 #define AUS_VREG_TRIM GENMASK(6, 2)
 
-#define AUS_COMMON_DIG_RCAL1 0x804
-#define AUS_COMMON_DIG_RCAL1_ALL_CODES_DONE BIT(0)
-
 #define AUS_UNK_A20 0x0a20
 #define AUS_UNK_A20_TX_CAL_CODE GENMASK(23, 20)
 
 #define ACIOPHY_CMN_SHM_STS_REG0 0x0a74
 #define ACIOPHY_CMN_SHM_STS_REG0_CMD_READY BIT(0)
 
-#define CIO3PLL_CLK_CTRL 0x2a00
-#define CIO3PLL_CLK_PCLK_EN BIT(1)
-#define CIO3PLL_CLK_REFCLK_EN BIT(5)
-
 #define CIO3PLL_DCO_NCTRL 0x2a38
 #define CIO3PLL_DCO_COARSEBIN_EFUSE0 GENMASK(6, 0)
 #define CIO3PLL_DCO_COARSEBIN_EFUSE1 GENMASK(23, 17)
@@ -129,23 +76,6 @@
 #define CIO3PLL_DTC_VREG 0x2a20
 #define CIO3PLL_DTC_VREG_ADJUST GENMASK(16, 14)
 
-#define ATCPHY_EVT_USB2_CTL 0x0
-#define ATCPHY_EVT_USB2_CTL_EVT_EN 0x1
-#define ATCPHY_EVT_USB2_CTL_LOAD_CNT 0x8
-
-#define ACIOPHY_CFG0 0x08
-#define ACIOPHY_CFG0_COMMON_BIG BIT(0)
-#define ACIOPHY_CFG0_COMMON_BIG_OV BIT(1)
-#define ACIOPHY_CFG0_COMMON_SMALL BIT(2)
-#define ACIOPHY_CFG0_COMMON_SMALL_OV BIT(3)
-#define ACIOPHY_CFG0_COMMON_CLAMP BIT(4)
-#define ACIOPHY_CFG0_COMMON_CLAMP_OV BIT(5)
-#define ACIOPHY_CFG0_RX_SMALL_OV GENMASK(9, 8)
-#define ACIOPHY_CFG0_RX_BIG_OV GENMASK(13, 12)
-#define ACIOPHY_CFG0_RX_CLAMP_OV GENMASK(17, 16)
-
-#define ACIOPHY_CROSSBAR_T8103 0x4c
-#define ACIOPHY_CROSSBAR_T8122 0x64
 #define ACIOPHY_CROSSBAR_PROTOCOL GENMASK(4, 0)
 #define ACIOPHY_CROSSBAR_PROTOCOL_USB4 0x0
 #define ACIOPHY_CROSSBAR_PROTOCOL_USB4_SWAPPED 0x1
@@ -160,68 +90,13 @@
 #define ACIOPHY_CROSSBAR_DP_SINGLE_PMA_UNK008 0x008
 #define ACIOPHY_CROSSBAR_DP_BOTH_PMA BIT(17)
 
-#define ACIOPHY_LANE_MODE_T8103 0x48
-#define ACIOPHY_LANE_MODE_T8122 0x60
 #define ACIOPHY_LANE_MODE_RX0 GENMASK(2, 0)
 #define ACIOPHY_LANE_MODE_TX0 GENMASK(5, 3)
 #define ACIOPHY_LANE_MODE_RX1 GENMASK(8, 6)
 #define ACIOPHY_LANE_MODE_TX1 GENMASK(11, 9)
 
-enum atcphy_lane_mode {
-	ACIOPHY_LANE_MODE_USB4 = 0,
-	ACIOPHY_LANE_MODE_USB3 = 1,
-	ACIOPHY_LANE_MODE_DP = 2,
-	ACIOPHY_LANE_MODE_OFF = 3,
-};
-
-#define ACIOPHY_TOP_BIST_CIOPHY_CFG1 0x84
-#define ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN BIT(27)
-#define ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN BIT(28)
-
-#define ACIOPHY_TOP_BIST_OV_CFG 0x8c
-#define ACIOPHY_TOP_BIST_OV_CFG_LN0_RESET_N_OV BIT(13)
-#define ACIOPHY_TOP_BIST_OV_CFG_LN0_PWR_DOWN_OV BIT(25)
-
-#define ACIOPHY_TOP_BIST_READ_CTRL 0x90
-#define ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE BIT(2)
-
-#define ACIOPHY_TOP_PHY_STAT 0x9c
-#define ACIOPHY_TOP_PHY_STAT_LN0_UNK0 BIT(0)
-#define ACIOPHY_TOP_PHY_STAT_LN0_UNK23 BIT(23)
-
-#define ACIOPHY_TOP_BIST_PHY_CFG0 0xa8
-#define ACIOPHY_TOP_BIST_PHY_CFG0_LN0_RESET_N BIT(0)
-
-#define ACIOPHY_TOP_BIST_PHY_CFG1 0xac
-#define ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN GENMASK(13, 10)
-
-#define ACIOPHY_BIST_CFG1 0x17000
-#define ACIOPHY_BIST_CFG1_CLOCK_EN BIT(0)
-#define ACIOPHY_BIST_CFG1_USB_EN BIT(2)
-
-#define ACIOPHY_BIST_CFG2 0x17004
-#define ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE BIT(2)
-
-#define ACIOPHY_BIST_MAC_USBPHY_STATUS2 0x17080
-#define ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2 BIT(7)
-
-#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV1 0x17088
-#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PIPE_RESET_N_OV 0x100000
-#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV GENMASK(26, 25)
-
-#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV2 0x1708c
-#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_RESET_N_OV 0x200
-#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_PWR_DOWN_OV 0x20
-
-#define ACIOPHY_SLEEP_CTRL 0x1b0
-#define ACIOPHY_SLEEP_CTRL_TX_BIG_OV GENMASK(3, 2)
-#define ACIOPHY_SLEEP_CTRL_TX_SMALL_OV GENMASK(7, 6)
-#define ACIOPHY_SLEEP_CTRL_TX_CLAMP_OV GENMASK(11, 10)
-
 #define ACIOPHY_PLL_PCTL_FSM_CTRL1 0x1014
 #define ACIOPHY_PLL_APB_REQ_OV_SEL GENMASK(21, 13)
-#define ACIOPHY_PLL_COMMON_CTRL 0x1028
-#define ACIOPHY_PLL_WAIT_FOR_CMN_READY_BEFORE_RESET_EXIT BIT(24)
 
 #define ATCPHY_POWER_CTRL 0x20000
 #define ATCPHY_POWER_STAT 0x20004
@@ -235,40 +110,6 @@ enum atcphy_lane_mode {
 #define ATCPHY_MISC_RESET_N BIT(0)
 #define ATCPHY_MISC_LANE_SWAP BIT(2)
 
-#define ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0 0x7000
-#define DP_PMA_BYTECLK_RESET BIT(0)
-#define DP_MAC_DIV20_CLK_SEL BIT(1)
-#define DPTXPHY_PMA_LANE_RESET_N BIT(2)
-#define DPTXPHY_PMA_LANE_RESET_N_OV BIT(3)
-#define DPTX_PCLK1_SELECT GENMASK(6, 4)
-#define DPTX_PCLK2_SELECT GENMASK(9, 7)
-#define DPRX_PCLK_SELECT GENMASK(12, 10)
-#define DPTX_PCLK1_ENABLE BIT(13)
-#define DPTX_PCLK2_ENABLE BIT(14)
-#define DPRX_PCLK_ENABLE BIT(15)
-
-#define ACIOPHY_DP_PCLK_STAT 0x7044
-#define ACIOPHY_AUSPLL_LOCK BIT(3)
-
-#define LN0_AUSPMA_RX_TOP 0x9000
-#define LN0_AUSPMA_RX_EQ 0xA000
-#define LN0_AUSPMA_RX_SHM 0xB000
-#define LN0_AUSPMA_TX_TOP 0xC000
-#define LN0_AUSPMA_TX_SHM 0xD000
-
-#define LN1_AUSPMA_RX_TOP 0x10000
-#define LN1_AUSPMA_RX_EQ 0x11000
-#define LN1_AUSPMA_RX_SHM 0x12000
-#define LN1_AUSPMA_TX_TOP 0x13000
-#define LN1_AUSPMA_TX_SHM 0x14000
-
-#define LN_AUSPMA_RX_TOP_PMAFSM 0x0010
-#define LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV BIT(0)
-#define LN_AUSPMA_RX_TOP_PMAFSM_PCS_REQ BIT(9)
-
-#define LN_AUSPMA_RX_TOP_TJ_CFG_RX_TXMODE 0x00F0
-#define LN_RX_TXMODE BIT(0)
-
 #define LN_AUSPMA_RX_SHM_TJ_RXA_CTLE_CTRL0 0x00
 #define LN_TX_CLK_EN BIT(20)
 #define LN_TX_CLK_EN_OV BIT(21)
@@ -431,155 +272,6 @@ enum atcphy_lane_mode {
 #define LN_LDOCLK_EN_BIG_OV BIT(14)
 #define LN_LDOCLK_EN_BIG BIT(15)
 
-/* T8122 DisplayPort registers; power bit names inferred from the sequences */
-#define ACIOPHY_CFG1 0x000c
-#define ACIOPHY_SLEEP_CTRL_T8122 0x010c
-#define ACIOPHY_TX_SLEEP_BIG(lane) BIT(lane)
-#define ACIOPHY_TX_SLEEP_BIG_OV(lane) BIT(2 + (lane))
-#define ACIOPHY_TX_SLEEP_SMALL(lane) BIT(4 + (lane))
-#define ACIOPHY_TX_SLEEP_SMALL_OV(lane) BIT(6 + (lane))
-#define ACIOPHY_TX_CLAMP(lane) BIT(8 + (lane))
-#define ACIOPHY_TX_CLAMP_OV(lane) BIT(10 + (lane))
-#define ACIOPHY_RXTX_SLEEP_BIG(lane) BIT(lane)
-#define ACIOPHY_RXTX_SLEEP_BIG_OV(lane) BIT(2 + (lane))
-#define ACIOPHY_RXTX_SLEEP_SMALL(lane) BIT(4 + (lane))
-#define ACIOPHY_RXTX_SLEEP_SMALL_OV(lane) BIT(6 + (lane))
-#define ACIOPHY_RX_SLEEP_BIG(lane) BIT(6 + (lane))
-#define ACIOPHY_RX_SLEEP_BIG_OV(lane) BIT(8 + (lane))
-#define ACIOPHY_RX_SLEEP_SMALL(lane) BIT(10 + (lane))
-#define ACIOPHY_RX_SLEEP_SMALL_OV(lane) BIT(12 + (lane))
-#define ACIOPHY_RX_CLAMP(lane) BIT(14 + (lane))
-#define ACIOPHY_RX_CLAMP_OV(lane) BIT(16 + (lane))
-
-#define AUSPLL_BGR_T8122 0x2218
-#define AUSPLL_FREQ_CFG_T8122 0x2234
-#define AUSPLL_CLKOUT_MASTER_PCLK_DRVR_EN_T8122 BIT(3)
-#define ACIOPHY_DP_PCLK_STAT_T8122 0x7034
-
-#define LN_AUSPMA_TX_TOP_EQ1 0x0050
-#define LN_AUSPMA_TX_TOP_EQ17 0x00d0
-#define LN_AUSPMA_TX_TOP_EQ18 0x00d4
-#define LN_AUSPMA_RX_TOP_EQ1 0x0210
-#define LN_AUSPMA_RX_TOP_EQ17 0x0244
-#define LN_AUSPMA_RX_TOP_EQ18 0x0248
-#define LN_EQ_SWING GENMASK(3, 0)
-#define LN_EQ_SWING_LSB GENMASK(15, 14)
-#define LN_EQ_SWING_OV BIT(28)
-#define LN_EQ_AUTO_CTRL_DP BIT(20)
-/* Deemphasis and override bits; individual fields unknown */
-#define LN_EQ_DEEMPH_FIELDS GENMASK(18, 0)
-
-#define LN_AUSPMA_TX_SHM_MAIN2 0x0004
-#define LN_MAIN2_BYTECLK_SYNC_SEL BIT(24)
-#define LN_MAIN2_BYTECLK_SYNC_SEL_OV BIT(25)
-#define LN_MAIN2_BYTECLK_SYNC_EN BIT(28)
-#define LN_MAIN2_BYTECLK_SYNC_EN_OV BIT(29)
-#define LN_AUSPMA_TX_SHM_MAIN4 0x000c
-#define LN_MAIN4_DIV2_4_EN GENMASK(25, 24)
-#define LN_MAIN4_DIV2_4_EN_OV BIT(26)
-#define LN_AUSPMA_TX_SHM_MAIN5 0x0010
-#define LN_MAIN5_CLK_EN BIT(9)
-#define LN_MAIN5_CLK_EN_OV BIT(10)
-#define LN_AUSPMA_TX_SHM_CLKMON1 0x001c
-#define LN_CLKMON1_HIZ BIT(22)
-#define LN_CLKMON1_HIZ_OV BIT(23)
-#define LN_AUSPMA_TX_SHM_LDOCLK1 0x0044
-#define LN_LDOCLK1_VREG_ADJ GENMASK(10, 6)
-#define LN_LDOCLK1_VREF_EN BIT(12)
-#define LN_LDOCLK1_VREF_FILTER_BOOST (GENMASK(18, 17) | GENMASK(15, 14))
-#define LN_LDOCLK1_BYPASS_SMALL BIT(20)
-#define LN_LDOCLK1_BYPASS_BIG BIT(22)
-#define LN_LDOCLK1_EN_SMALL BIT(24)
-#define LN_LDOCLK1_EN_BIG BIT(26)
-
-#define LN_AUSPMA_RX_TOP_TXMODE 0x0160
-#define LN_AUSPMA_RX_TOP_AFE1 0x01d4
-#define LN_AFE1_DIV20_RESET_N_OV BIT(0)
-#define LN_AFE1_DIV20_RESET_N BIT(1)
-#define LN_AUSPMA_RX_TOP_DCO1 0x01dc
-#define LN_DCO1_LPBKIN_RECOVERED_DATA GENMASK(16, 15)
-
-#define LN_AUSPMA_RX_SHM_CTLE2 0x0030
-#define LN_CTLE2_TX_CLK_EN BIT(10)
-#define LN_CTLE2_TX_CLK_EN_OV BIT(11)
-#define LN_AUSPMA_RX_SHM_DFE101 0x0064
-#define LN_DFE101_DFEH1FB_EN BIT(2)
-#define LN_DFE101_DFEH1FB_EN_OV BIT(3)
-#define LN_DFE101_DTVREG_ADJUST_FIELDS GENMASK(15, 10)
-#define LN_AUSPMA_RX_SHM_DFE111 0x0068
-#define LN_DFE111_DTVREG_BIG_EN BIT(5)
-#define LN_DFE111_DTVREG_BIG_EN_OV BIT(6)
-#define LN_DFE111_DTVREG_SMALL_EN BIT(7)
-#define LN_DFE111_DTVREG_SMALL_EN_OV BIT(8)
-#define LN_AUSPMA_RX_SHM_DFE121 0x006c
-#define LN_DFE121_TX_BYTECLK_SYNC_CLR BIT(9)
-#define LN_DFE121_TX_BYTECLK_SYNC_CLR_OV BIT(10)
-#define LN_DFE121_TX_BYTECLK_SYNC_EN BIT(11)
-#define LN_DFE121_TX_HRCLK_SEL BIT(13)
-#define LN_DFE121_TX_HRCLK_SEL_OV BIT(14)
-#define LN_DFE121_TX_PBIAS_EN BIT(15)
-#define LN_DFE121_TX_PBIAS_EN_OV BIT(16)
-#define LN_AUSPMA_RX_SHM_SAVOS161 0x00a4
-#define LN_SAVOS161_RXTERM_EN BIT(0)
-#define LN_SAVOS161_RXTERM_EN_OV BIT(1)
-#define LN_AUSPMA_RX_SHM_TERM191 0x00a8
-#define LN_TERM191_TX_TEST_EN BIT(15)
-#define LN_TERM191_TX_TEST_EN_OV BIT(16)
-#define LN_TERM191_TX_EN BIT(17)
-#define LN_TERM191_TX_EN_OV BIT(18)
-#define LN_TERM191_TX_DIV2_EN GENMASK(20, 19)
-#define LN_TERM191_TX_DIV2_EN_OV BIT(21)
-#define LN_TERM191_TX_DIV2_RST BIT(22)
-#define LN_TERM191_TX_DIV2_RST_OV BIT(23)
-#define LN_AUSPMA_RX_SHM_VREF221 0x00d4
-/* Adjust, filter and enable overrides; individual fields unknown */
-#define LN_VREF221_INIT_FIELDS (GENMASK(20, 16) | GENMASK(12, 7))
-#define LN_VREF221_BIAS_FIELDS GENMASK(15, 13)
-#define LN_VREF221_EN BIT(16)
-#define LN_VREF221_FILTER_ADJUST GENMASK(19, 18)
-#define LN_AUSPMA_RX_SHM_VREF231 0x00d8
-#define LN_VREF231_BOOST_CTRL GENMASK(1, 0)
-#define LN_VREF231_BOOST_CTRL_OV BIT(2)
-#define LN_AUSPMA_RX_SHM_VREG1 0x00dc
-#define LN_VREG1_DTVREG_POWER_MODE GENMASK(4, 3)
-
-/* T8122 AUX registers (core window) */
-#define AUX_TOP_CTRL 0x16000
-#define AUX_TOP_PWRDN BIT(0)
-#define AUX_SHM_PWR 0x16400
-#define AUX_SLEEP_SML_OV BIT(0)
-#define AUX_SLEEP_SML BIT(1)
-#define AUX_SLEEP_BIG_OV BIT(2)
-#define AUX_SLEEP_BIG BIT(3)
-#define AUX_CLAMP_OV BIT(8)
-#define AUX_CLAMP BIT(9)
-
-/* LPDPTX registers */
-#define LPDPTX_AUX_CFG_BLK_AUX_CTRL 0x0000
-#define LPDPTX_BLK_AUX_CTRL_PWRDN BIT(4)
-#define LPDPTX_BLK_AUX_RXOFFSET GENMASK(25, 22)
-
-#define LPDPTX_AUX_CFG_BLK_AUX_LDO_CTRL 0x0008
-
-#define LPDPTX_AUX_CFG_BLK_AUX_MARGIN 0x000c
-#define LPDPTX_MARGIN_RCAL_RXOFFSET_EN BIT(5)
-#define LPDPTX_AUX_MARGIN_RCAL_TXSWING GENMASK(10, 6)
-
-#define LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG0 0x0204
-#define LPDPTX_CFG_PMA_AUX_SEL_LF_DATA BIT(15)
-
-#define LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG1 0x0208
-#define LPDPTX_CFG_PMA_PHYS_ADJ GENMASK(22, 20)
-#define LPDPTX_CFG_PMA_PHYS_ADJ_OV BIT(19)
-
-#define LPDPTX_AUX_CONTROL 0x4000
-#define LPDPTX_AUX_PWN_DOWN 0x10
-#define LPDPTX_AUX_CLAMP_EN 0x04
-#define LPDPTX_SLEEP_B_BIG_IN 0x02
-#define LPDPTX_SLEEP_B_SML_IN 0x01
-#define LPDPTX_TXTERM_CODEMSB 0x400
-#define LPDPTX_TXTERM_CODE GENMASK(9, 5)
-
 /* pipehandler registers */
 #define PIPEHANDLER_OVERRIDE 0x00
 #define PIPEHANDLER_OVERRIDE_RXVALID BIT(0)
@@ -640,183 +332,7 @@ enum atcphy_lane_mode {
 #define USB2PHY_MISCTUNE_APBCLK_GATE_OFF BIT(29)
 #define USB2PHY_MISCTUNE_REFCLK_GATE_OFF BIT(30)
 
-enum atcphy_dp_link_rate {
-	ATCPHY_DP_LINK_RATE_RBR,
-	ATCPHY_DP_LINK_RATE_HBR,
-	ATCPHY_DP_LINK_RATE_HBR2,
-	ATCPHY_DP_LINK_RATE_HBR3,
-};
-
-#define ATCPHY_DP_LINK_RATE_IDLE		(-1)
-#define ATCPHY_DP_LINK_RATE_PENDING	(-2)
-
-/**
- * enum atcphy_pipehandler_state - States of the PIPE mux interface ("pipehandler")
- * @ATCPHY_PIPEHANDLER_STATE_DUMMY: "Dummy PHY" (disables USB3, USB2 only)
- * @ATCPHY_PIPEHANDLER_STATE_USB3: USB3 directly connected to the Type-C port
- * @ATCPHY_PIPEHANDLER_STATE_USB4: USB3 tunneled via USB4/Thunderbolt
- *
- * DWC3's USB3 PIPE interface is connected to a multiplexer inside this PHY
- * which can switch between a dummy state (which effectively disables any USB3
- * support and falls back to USB2 only operation via the separate ULPI interface),
- * a USB3 state (for regular USB3 or USB3+DisplayPort operation) and a USB4 state
- * (for USB3 tunneled via USB4/Thunderbolt).
- */
-enum atcphy_pipehandler_state {
-	ATCPHY_PIPEHANDLER_STATE_DUMMY,
-	ATCPHY_PIPEHANDLER_STATE_USB3,
-	ATCPHY_PIPEHANDLER_STATE_USB4,
-};
-
-/**
- * enum atcphy_mode - Operating modes of the PHY
- * @APPLE_ATCPHY_MODE_OFF: all PHYs powered off
- * @APPLE_ATCPHY_MODE_USB2: Nothing on the four SS lanes (i.e. USB2 only on D-/+)
- * @APPLE_ATCPHY_MODE_USB3: USB3 on two lanes, nothing on the other two
- * @APPLE_ATCPHY_MODE_USB3_DP: USB3 on two lanes and DisplayPort on the other two
- * @APPLE_ATCPHY_MODE_TBT: Thunderbolt on all lanes
- * @APPLE_ATCPHY_MODE_USB4: USB4 on all lanes
- * @APPLE_ATCPHY_MODE_DP: DisplayPort on all lanes
- */
-enum atcphy_mode {
-	APPLE_ATCPHY_MODE_OFF,
-	APPLE_ATCPHY_MODE_USB2,
-	APPLE_ATCPHY_MODE_USB3,
-	APPLE_ATCPHY_MODE_USB3_DP,
-	APPLE_ATCPHY_MODE_TBT,
-	APPLE_ATCPHY_MODE_USB4,
-	APPLE_ATCPHY_MODE_DP,
-};
-
-enum atcphy_lane {
-	APPLE_ATCPHY_LANE_0,
-	APPLE_ATCPHY_LANE_1,
-};
-
-/* Link rate configuration, field names are taken from XNU debug output or register names */
-struct atcphy_dp_link_rate_configuration {
-	u16 freqinit_count_target;
-	u16 fbdivn_frac_den;
-	u16 fbdivn_frac_num;
-	u16 pclk_div_sel;
-	u8 lfclk_ctrl;
-	u8 vclk_op_divn;
-	bool plla_clkout_vreg_bypass;
-	bool txa_ldoclk_bypass;
-	bool txa_div2_en;
-};
-
-/* Crossbar and lane configuration */
-struct atcphy_mode_configuration {
-	u32 crossbar;
-	u32 crossbar_dp_single_pma;
-	bool crossbar_dp_both_pma;
-	enum atcphy_lane_mode lane_mode[2];
-	bool dp_lane[2];
-	bool set_swap;
-};
-
-struct apple_atcphy;
-
-struct atcphy_hw {
-	void (*configure_post_tunable)(struct apple_atcphy *atcphy, enum atcphy_mode mode);
-	void (*configure_pipehandler_usb3_host)(struct apple_atcphy *atcphy);
-	void (*configure_usb2_evt_ctl)(struct apple_atcphy *atcphy);
-	void (*enable_cio3pll_clk)(struct apple_atcphy *atcphy);
-	int (*wait_rcal1_done)(struct apple_atcphy *atcphy, enum atcphy_mode mode);
-	void (*configure_lane_pmafsm)(struct apple_atcphy *atcphy,
-				      const struct atcphy_mode_configuration *mode_cfg);
-	void (*dp_enable_aux)(struct apple_atcphy *atcphy);
-	void (*dp_disable_aux)(struct apple_atcphy *atcphy);
-	int (*dp_set_rate)(struct apple_atcphy *atcphy, enum atcphy_dp_link_rate lr);
-	int (*dp_stop)(struct apple_atcphy *atcphy);
-	int aciophy_lane_mode;
-	int aciophy_crossbar;
-	bool need_dp_tunables;
-};
-
-/**
- * struct apple_atcphy - Apple Type-C PHY device struct
- * @np: Device node pointer
- * @dev: Device pointer
- * @tunables: Firmware-provided tunable parameters
- * @tunables.axi2af: AXI to AF interface tunables
- * @tunables.common: Common tunables for all lanes
- * @tunables.lane_usb3: USB3 lane-specific tunables
- * @tunables.lane_dp: DisplayPort lane-specific tunables
- * @tunables.lane_usb4: USB4 lane-specific tunables
- * @hw: Hardware version specific data
- * @mode: Current PHY operating mode
- * @swap_lanes: True if lanes must be swapped due to cable orientation
- * @dp_link_rate: DisplayPort link rate index, ATCPHY_DP_LINK_RATE_IDLE, or
- *               ATCPHY_DP_LINK_RATE_PENDING when cleanup is still needed
- * @pipehandler_up: True if the PIPE mux ("pipehandler") is set to USB3 or USB4 mode
- * @regs: Memory-mapped registers
- * @regs.core: Core registers
- * @regs.axi2af: AXI to Apple Fabric interface registers
- * @regs.usb2phy: USB2 PHY registers
- * @regs.pipehandler: USB3 PIPE interface ("pipehandler") registers
- * @regs.lpdptx: DisplayPort registers
- * @res: Resources for memory-mapped registers, used to verify that tunables aren't out of bounds
- * @res.core: Core register resource
- * @res.axi2af: AXI to Apple Fabric interface resource
- * @phys: PHY instances
- * @phys.usb2: USB2 PHY instance
- * @phys.usb3: USB3 PHY instance
- * @phys.dp: DisplayPort PHY instance
- * @phy_provider: PHY provider instance
- * @rcdev: Reset controller device
- * @lock: Mutex for synchronizing register access across PHY, Type-C switch/mux and reset controller
- */
-struct apple_atcphy {
-	struct device_node *np;
-	struct device *dev;
-
-	struct {
-		struct apple_tunable *axi2af;
-		struct apple_tunable *common[2];
-		struct apple_tunable *lane_usb3[2];
-		struct apple_tunable *lane_dp[2];
-		struct apple_tunable *lane_usb4[2];
-	} tunables;
-
-	const struct atcphy_hw *hw;
-	enum atcphy_mode mode;
-	int dp_link_rate;
-	bool swap_lanes;
-	bool pipehandler_up;
-
-	struct {
-		void __iomem *core;
-		void __iomem *axi2af;
-		void __iomem *usb2phy;
-		void __iomem *pipehandler;
-		void __iomem *lpdptx;
-	} regs;
-
-	struct {
-		struct resource *core;
-		struct resource *axi2af;
-	} res;
-
-	struct {
-		struct phy *usb2;
-		struct phy *usb3;
-		struct phy *dp;
-	} phys;
-	struct phy_provider *phy_provider;
-
-	struct reset_controller_dev rcdev;
-
-	struct mutex lock;
-};
-
-static const struct {
-	const struct atcphy_mode_configuration normal;
-	const struct atcphy_mode_configuration swapped;
-	bool enable_dp_aux;
-	enum atcphy_pipehandler_state pipehandler_state;
-} atcphy_modes[] = {
+const struct atcphy_mode_info atcphy_modes[] = {
 	[APPLE_ATCPHY_MODE_OFF] = {
 		.normal = {
 			.crossbar = ACIOPHY_CROSSBAR_PROTOCOL_USB3,
@@ -964,7 +480,7 @@ static const struct {
 	},
 };
 
-static const struct atcphy_dp_link_rate_configuration dp_lr_config[] = {
+const struct atcphy_dp_link_rate_configuration atcphy_dp_lr_config[] = {
 	[ATCPHY_DP_LINK_RATE_RBR] = {
 		.freqinit_count_target = 0x21c,
 		.fbdivn_frac_den = 0x0,
@@ -1011,77 +527,6 @@ static const struct atcphy_dp_link_rate_configuration dp_lr_config[] = {
 	},
 };
 
-static const struct {
-	u8 vclk_op_divn;
-	bool vclk_pre_divn;
-} dp_lr_config_t8122[] = {
-	[ATCPHY_DP_LINK_RATE_RBR] = {
-		.vclk_op_divn = 1,
-		.vclk_pre_divn = false,
-	},
-	[ATCPHY_DP_LINK_RATE_HBR] = {
-		.vclk_op_divn = 1,
-		.vclk_pre_divn = false,
-	},
-	[ATCPHY_DP_LINK_RATE_HBR2] = {
-		.vclk_op_divn = 1,
-		.vclk_pre_divn = true,
-	},
-	[ATCPHY_DP_LINK_RATE_HBR3] = {
-		.vclk_op_divn = 1,
-		.vclk_pre_divn = true,
-	},
-};
-
-static inline void mask32(void __iomem *reg, u32 mask, u32 set)
-{
-	u32 value = readl(reg);
-
-	value &= ~mask;
-	value |= set;
-	writel(value, reg);
-}
-
-static inline void core_mask32(struct apple_atcphy *atcphy, u32 reg, u32 mask, u32 set)
-{
-	mask32(atcphy->regs.core + reg, mask, set);
-}
-
-static inline void set32(void __iomem *reg, u32 set)
-{
-	mask32(reg, 0, set);
-}
-
-static inline void core_set32(struct apple_atcphy *atcphy, u32 reg, u32 set)
-{
-	core_mask32(atcphy, reg, 0, set);
-}
-
-static inline void clear32(void __iomem *reg, u32 clear)
-{
-	mask32(reg, clear, 0);
-}
-
-static inline void core_clear32(struct apple_atcphy *atcphy, u32 reg, u32 clear)
-{
-	core_mask32(atcphy, reg, clear, 0);
-}
-
-static void __iomem *atcphy_lane_reg(struct apple_atcphy *atcphy,
-				  unsigned int lane, u32 lane0_reg)
-{
-	return atcphy->regs.core + lane0_reg + lane * (LN1_AUSPMA_RX_TOP - LN0_AUSPMA_RX_TOP);
-}
-
-static const struct atcphy_mode_configuration *atcphy_get_mode_config(struct apple_atcphy *atcphy,
-								      enum atcphy_mode mode)
-{
-	if (atcphy->swap_lanes)
-		return &atcphy_modes[mode].swapped;
-	else
-		return &atcphy_modes[mode].normal;
-}
-
 static void atcphy_apply_tunables(struct apple_atcphy *atcphy, enum atcphy_mode mode)
 {
 	const int lane0 = atcphy->swap_lanes ? 1 : 0;
@@ -1193,7 +638,7 @@ static void atcphy_pipehandler_set_mux(struct apple_atcphy *atcphy, u32 data, u3
 	udelay(10);
 }
 
-static void atcphy_clear_nonselected_phy_reset(struct apple_atcphy *atcphy)
+void atcphy_clear_nonselected_phy_reset(struct apple_atcphy *atcphy)
 {
 	/* Clear reset for non-selected USB3 PHY (?) */
 	mask32(atcphy->regs.pipehandler + PIPEHANDLER_NONSELECTED_OVERRIDE,
@@ -1202,128 +647,6 @@ static void atcphy_clear_nonselected_phy_reset(struct apple_atcphy *atcphy)
 		PIPEHANDLER_NATIVE_RESET);
 }
 
-static void atcphy_configure_pipehandler_usb3_host_t8122(struct apple_atcphy *atcphy)
-{
-	int ret;
-	u32 reg;
-
-	core_set32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_CLOCK_EN);
-	/* This should be a mask, but unsure what bits should be cleared */
-	writel(ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PIPE_RESET_N_OV |
-	       FIELD_PREP(ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV, 2),
-	       atcphy->regs.core + ACIOPHY_BIST_MAC_USBPHY_CFG_OV1);
-	/* This should be a mask, but unsure what bits should be cleared */
-	writel(ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_RESET_N_OV |
-	       ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_PWR_DOWN_OV,
-	       atcphy->regs.core + ACIOPHY_BIST_MAC_USBPHY_CFG_OV2);
-	core_set32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
-	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_BIST_CFG1, reg,
-				 (reg & ACIOPHY_BIST_CFG1_USB_EN), 10, 10000);
-	if (ret)
-		dev_warn(atcphy->dev,
-			 "Timed out waiting for ACIOPHY_BIST_CFG1_USB_EN\n");
-	core_clear32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
-	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_BIST_MAC_USBPHY_STATUS2, reg,
-				 !(reg & ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2),
-				 10, 10000);
-	if (ret)
-		dev_warn(atcphy->dev,
-			 "Timed out waiting for ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2\n");
-
-	core_set32(atcphy, ACIOPHY_BIST_CFG2, ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE);
-	udelay(10);
-	core_clear32(atcphy, ACIOPHY_BIST_CFG2, ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE);
-	core_mask32(atcphy, ACIOPHY_BIST_MAC_USBPHY_CFG_OV1,
-		    ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV,
-		    FIELD_PREP(ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV, 3));
-
-	/* there is a read and write of ACIOPHY_BIST_MAC_USBPHY_CFG_OV2 here with same values */
-	udelay(10);
-	core_set32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
-	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_BIST_CFG1, reg,
-				 (reg & ACIOPHY_BIST_CFG1_USB_EN), 10, 10000);
-	if (ret)
-		dev_warn(atcphy->dev,
-			 "Timed out waiting for ACIOPHY_BIST_CFG1_USB_EN 2nd toggle\n");
-	core_clear32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
-	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_BIST_MAC_USBPHY_STATUS2, reg,
-				 !(reg & ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2),
-				 10, 10000);
-	if (ret)
-		dev_warn(atcphy->dev,
-			 "Timed out waiting for ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2 2nd time\n");
-	core_set32(atcphy, ACIOPHY_BIST_CFG2, ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE);
-	udelay(10);
-	core_clear32(atcphy, ACIOPHY_BIST_CFG2, ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE);
-
-	atcphy_clear_nonselected_phy_reset(atcphy);
-
-	core_clear32(atcphy, ACIOPHY_BIST_MAC_USBPHY_CFG_OV2,
-		     ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_RESET_N_OV |
-		     ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_PWR_DOWN_OV);
-	core_set32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
-	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_BIST_CFG1, reg,
-				 (reg & ACIOPHY_BIST_CFG1_USB_EN), 10, 10000);
-	if (ret)
-		dev_warn(atcphy->dev,
-			 "Timed out waiting for ACIOPHY_BIST_CFG1_USB_EN 3rd toggle\n");
-	core_clear32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
-	core_clear32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_CLOCK_EN);
-}
-
-static void atcphy_configure_pipehandler_usb3_host_t8103(struct apple_atcphy *atcphy)
-{
-	int ret;
-	u32 reg;
-
-	core_set32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG0,
-		   ACIOPHY_TOP_BIST_PHY_CFG0_LN0_RESET_N);
-	core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG, ACIOPHY_TOP_BIST_OV_CFG_LN0_RESET_N_OV);
-	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
-				 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
-	if (ret)
-		dev_warn(atcphy->dev,
-			 "Timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
-
-	core_set32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
-		   ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
-	core_clear32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
-		     ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
-
-	core_mask32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG1,
-		    ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN,
-		    FIELD_PREP(ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN, 3));
-
-	core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG,
-		   ACIOPHY_TOP_BIST_OV_CFG_LN0_PWR_DOWN_OV);
-	core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
-		   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
-	core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
-		   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
-	writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_CIOPHY_CFG1);
-
-	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
-				 (reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK0), 10, 10000);
-	if (ret)
-		dev_warn(atcphy->dev,
-			 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK0\n");
-
-	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
-				 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
-	if (ret)
-		dev_warn(atcphy->dev,
-			 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
-
-	atcphy_clear_nonselected_phy_reset(atcphy);
-
-	/* More BIST stuff (?) */
-	writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_OV_CFG);
-	core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
-		   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
-	core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
-		   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
-}
-
 static int atcphy_configure_pipehandler_usb3(struct apple_atcphy *atcphy, bool host)
 {
 	int ret;
@@ -1474,35 +797,6 @@ static void atcphy_setup_pipehandler(struct apple_atcphy *atcphy)
 				   PIPEHANDLER_MUX_CTRL_CLK_DUMMY);
 }
 
-static void
-atcphy_configure_lane_pmafsm_t8103(struct apple_atcphy *atcphy,
-				   const struct atcphy_mode_configuration *mode_cfg)
-{
-	if (mode_cfg->dp_lane[0]) {
-		core_set32(atcphy, LN0_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
-			   LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV);
-		udelay(10);
-		core_clear32(atcphy, LN0_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
-			     LN_AUSPMA_RX_TOP_PMAFSM_PCS_REQ);
-	} else {
-		core_clear32(atcphy, LN0_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
-			     LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV);
-		udelay(10);
-	}
-
-	if (mode_cfg->dp_lane[1]) {
-		core_set32(atcphy, LN1_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
-			   LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV);
-		udelay(10);
-		core_clear32(atcphy, LN1_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
-			     LN_AUSPMA_RX_TOP_PMAFSM_PCS_REQ);
-	} else {
-		core_clear32(atcphy, LN1_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
-			     LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV);
-		udelay(10);
-	}
-}
-
 static void atcphy_configure_lanes(struct apple_atcphy *atcphy, enum atcphy_mode mode)
 {
 	const struct atcphy_mode_configuration *mode_cfg = atcphy_get_mode_config(atcphy, mode);
@@ -1535,458 +829,6 @@ static void atcphy_configure_lanes(struct apple_atcphy *atcphy, enum atcphy_mode
 
 }
 
-static int atcphy_dp_poll(struct apple_atcphy *atcphy, u32 reg, u32 mask, u32 expected)
-{
-	u32 value;
-	int ret;
-
-	lockdep_assert_held(&atcphy->lock);
-	ret = readl_poll_timeout_atomic(atcphy->regs.core + reg, value,
-					(value & mask) == expected, 1, 1000);
-	if (ret)
-		dev_err(atcphy->dev, "DP timeout reg=%#x mask=%#x want=%#x got=%#x\n",
-			reg, mask, expected, value);
-	return ret;
-}
-
-static int atcphy_auspll_set_command(struct apple_atcphy *atcphy, u32 command, bool request)
-{
-	core_mask32(atcphy, AUSPLL_APB_CMD_OVERRIDE,
-		    AUSPLL_APB_CMD_OVERRIDE_REQ | AUSPLL_APB_CMD_OVERRIDE_CMD |
-		    AUSPLL_APB_CMD_OVERRIDE_UNK28,
-		    FIELD_PREP(AUSPLL_APB_CMD_OVERRIDE_CMD, command) |
-		    AUSPLL_APB_CMD_OVERRIDE_UNK28 | (request ? AUSPLL_APB_CMD_OVERRIDE_REQ : 0));
-	return atcphy_dp_poll(atcphy, AUSPLL_APB_CMD_OVERRIDE, AUSPLL_APB_CMD_OVERRIDE_ACK,
-			     request ? AUSPLL_APB_CMD_OVERRIDE_ACK : 0);
-}
-
-static int atcphy_dp_start_pll_t8122(struct apple_atcphy *atcphy,
-				  enum atcphy_dp_link_rate lr)
-{
-	const struct atcphy_dp_link_rate_configuration *cfg = &dp_lr_config[lr];
-	int ret;
-
-	core_clear32(atcphy, AUSPLL_FREQ_CFG_T8122, AUSPLL_FREQ_REFCLK);
-	core_mask32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
-		    DPTX_PCLK1_SELECT | DPTX_PCLK2_SELECT | DPRX_PCLK_SELECT,
-		    FIELD_PREP(DPTX_PCLK1_SELECT, 1) | FIELD_PREP(DPTX_PCLK2_SELECT, 1) |
-		    FIELD_PREP(DPRX_PCLK_SELECT, 1));
-	core_mask32(atcphy, AUSPLL_FREQ_DESC_A, U32_MAX,
-		    FIELD_PREP(AUSPLL_FD_FREQ_COUNT_TARGET, cfg->freqinit_count_target) |
-		    FIELD_PREP(AUSPLL_FD_KI_MAN, 8) | FIELD_PREP(AUSPLL_FD_KI_EXP, 3) |
-		    FIELD_PREP(AUSPLL_FD_KP_MAN, 8) | FIELD_PREP(AUSPLL_FD_KP_EXP, 7));
-	core_mask32(atcphy, AUSPLL_FREQ_DESC_B, U32_MAX,
-		    FIELD_PREP(AUSPLL_FD_FBDIVN_FRAC_DEN, cfg->fbdivn_frac_den) |
-		    FIELD_PREP(AUSPLL_FD_FBDIVN_FRAC_NUM, cfg->fbdivn_frac_num));
-	core_mask32(atcphy, AUSPLL_FREQ_DESC_C, U32_MAX,
-		    FIELD_PREP(AUSPLL_FD_PCLK_DIV_SEL, cfg->pclk_div_sel) |
-		    FIELD_PREP(AUSPLL_FD_LFSDM_DIV, 1) |
-		    FIELD_PREP(AUSPLL_FD_LFCLK_CTRL, cfg->lfclk_ctrl) |
-		    FIELD_PREP(AUSPLL_FD_VCLK_OP_DIVN, dp_lr_config_t8122[lr].vclk_op_divn) |
-		    (dp_lr_config_t8122[lr].vclk_pre_divn ? AUSPLL_FD_VCLK_PRE_DIVN : 0));
-	core_mask32(atcphy, AUSPLL_CLKOUT_DIV, AUSPLL_CLKOUT_PLLA_REFBUFCLK_DI,
-		    FIELD_PREP(AUSPLL_CLKOUT_PLLA_REFBUFCLK_DI, 7));
-	core_set32(atcphy, AUSPLL_BGR_T8122, AUSPLL_BGR_CTRL_AVAIL);
-	core_set32(atcphy, AUSPLL_CLKOUT_MASTER, AUSPLL_CLKOUT_MASTER_PCLK_DRVR_EN_T8122);
-	ret = atcphy_auspll_set_command(atcphy, 0, true);
-	if (ret)
-		return ret;
-	ret = atcphy_dp_poll(atcphy, ACIOPHY_DP_PCLK_STAT_T8122, ACIOPHY_AUSPLL_LOCK,
-			     ACIOPHY_AUSPLL_LOCK);
-	if (ret)
-		return ret;
-	return atcphy_auspll_set_command(atcphy, 0x2800, false);
-}
-
-static void atcphy_dp_power_on_tx_t8122(struct apple_atcphy *atcphy, unsigned int lane)
-{
-	core_set32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_SLEEP_SMALL(lane));
-	core_set32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_SLEEP_SMALL_OV(lane));
-	udelay(1);
-	core_set32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_SLEEP_BIG(lane));
-	core_set32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_SLEEP_BIG_OV(lane));
-	udelay(1);
-	core_clear32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_CLAMP(lane));
-	core_set32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_CLAMP_OV(lane));
-	udelay(1);
-}
-
-static void atcphy_dp_power_on_rxtx_t8122(struct apple_atcphy *atcphy, unsigned int lane)
-{
-	core_set32(atcphy, ACIOPHY_CFG1, ACIOPHY_RXTX_SLEEP_SMALL(lane));
-	core_set32(atcphy, ACIOPHY_CFG1, ACIOPHY_RXTX_SLEEP_SMALL_OV(lane));
-	udelay(1);
-	core_set32(atcphy, ACIOPHY_CFG1, ACIOPHY_RXTX_SLEEP_BIG(lane));
-	core_set32(atcphy, ACIOPHY_CFG1, ACIOPHY_RXTX_SLEEP_BIG_OV(lane));
-	udelay(1);
-	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_SLEEP_SMALL(lane));
-	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_SLEEP_SMALL_OV(lane));
-	udelay(1);
-	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_SLEEP_BIG(lane));
-	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_SLEEP_BIG_OV(lane));
-	udelay(1);
-	core_clear32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_CLAMP(lane));
-	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_CLAMP_OV(lane));
-	udelay(1);
-}
-
-static void atcphy_dp_configure_tx_t8122(struct apple_atcphy *atcphy, unsigned int lane,
-					 const struct atcphy_dp_link_rate_configuration *cfg)
-{
-	void __iomem *shm = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_TX_SHM);
-	void __iomem *top = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_TX_TOP);
-
-	atcphy_dp_power_on_tx_t8122(atcphy, lane);
-	/* Fixed LDO initialization value, not a calibration tunable. */
-	mask32(shm + LN_AUSPMA_TX_SHM_LDOCLK1, U32_MAX, 0x0aafb800);
-	udelay(1);
-	set32(shm + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_EN_SMALL);
-	udelay(1);
-	set32(shm + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_EN_BIG);
-	udelay(1);
-	mask32(shm + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_VREG_ADJ,
-	       FIELD_PREP(LN_LDOCLK1_VREG_ADJ, 12));
-	udelay(1);
-	clear32(shm + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_VREF_FILTER_BOOST);
-	udelay(1);
-	set32(top + LN_AUSPMA_TX_TOP_EQ17, LN_EQ_AUTO_CTRL_DP);
-	clear32(top + LN_AUSPMA_TX_TOP_EQ1, LN_EQ_SWING | LN_EQ_SWING_LSB);
-	set32(top + LN_AUSPMA_TX_TOP_EQ18, LN_EQ_SWING_OV);
-	mask32(top + LN_AUSPMA_TX_TOP_EQ17, LN_EQ_DEEMPH_FIELDS, 1);
-	if (cfg->txa_ldoclk_bypass) {
-		set32(shm + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_BYPASS_SMALL);
-		udelay(1);
-		set32(shm + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_BYPASS_BIG);
-		udelay(1);
-	}
-	mask32(shm + LN_AUSPMA_TX_SHM_MAIN2,
-	       LN_MAIN2_BYTECLK_SYNC_SEL | LN_MAIN2_BYTECLK_SYNC_SEL_OV,
-	       LN_MAIN2_BYTECLK_SYNC_SEL_OV);
-	set32(shm + LN_AUSPMA_TX_SHM_MAIN2, LN_MAIN2_BYTECLK_SYNC_EN | LN_MAIN2_BYTECLK_SYNC_EN_OV);
-	mask32(shm + LN_AUSPMA_TX_SHM_MAIN4, LN_MAIN4_DIV2_4_EN | LN_MAIN4_DIV2_4_EN_OV,
-	       FIELD_PREP(LN_MAIN4_DIV2_4_EN, cfg->txa_div2_en) | LN_MAIN4_DIV2_4_EN_OV);
-	set32(shm + LN_AUSPMA_TX_SHM_MAIN5, LN_MAIN5_CLK_EN | LN_MAIN5_CLK_EN_OV);
-	mask32(shm + LN_AUSPMA_TX_SHM_CLKMON1, LN_CLKMON1_HIZ | LN_CLKMON1_HIZ_OV,
-	       LN_CLKMON1_HIZ_OV);
-}
-
-static void atcphy_dp_configure_rxtx_t8122(struct apple_atcphy *atcphy, unsigned int lane,
-					   const struct atcphy_dp_link_rate_configuration *cfg)
-{
-	void __iomem *shm = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_RX_SHM);
-	void __iomem *top = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_RX_TOP);
-
-	set32(top + LN_AUSPMA_RX_TOP_TXMODE, LN_RX_TXMODE);
-	set32(top + LN_AUSPMA_RX_TOP_DCO1, LN_DCO1_LPBKIN_RECOVERED_DATA);
-	mask32(shm + LN_AUSPMA_RX_SHM_SAVOS161, LN_SAVOS161_RXTERM_EN | LN_SAVOS161_RXTERM_EN_OV,
-	       LN_SAVOS161_RXTERM_EN_OV);
-	mask32(shm + LN_AUSPMA_RX_SHM_TERM191, LN_TERM191_TX_TEST_EN | LN_TERM191_TX_TEST_EN_OV,
-	       LN_TERM191_TX_TEST_EN_OV);
-	mask32(shm + LN_AUSPMA_RX_SHM_DFE121, LN_DFE121_TX_PBIAS_EN | LN_DFE121_TX_PBIAS_EN_OV,
-	       LN_DFE121_TX_PBIAS_EN_OV);
-	mask32(shm + LN_AUSPMA_RX_SHM_VREF221, LN_VREF221_INIT_FIELDS, 0x121180);
-	mask32(shm + LN_AUSPMA_RX_SHM_DFE101, LN_DFE101_DTVREG_ADJUST_FIELDS, 0xb800);
-	mask32(shm + LN_AUSPMA_RX_SHM_VREF231,
-	       LN_VREF231_BOOST_CTRL | LN_VREF231_BOOST_CTRL_OV,
-	       LN_VREF231_BOOST_CTRL_OV);
-	clear32(shm + LN_AUSPMA_RX_SHM_VREG1, LN_VREG1_DTVREG_POWER_MODE);
-	mask32(shm + LN_AUSPMA_RX_SHM_VREF221, LN_VREF221_BIAS_FIELDS, 0xc000);
-	udelay(1);
-	atcphy_dp_power_on_rxtx_t8122(atcphy, lane);
-	set32(shm + LN_AUSPMA_RX_SHM_DFE121, LN_DFE121_TX_BYTECLK_SYNC_EN);
-	mask32(top + LN_AUSPMA_RX_TOP_AFE1, LN_AFE1_DIV20_RESET_N | LN_AFE1_DIV20_RESET_N_OV,
-	       LN_AFE1_DIV20_RESET_N_OV);
-	udelay(1);
-	set32(top + LN_AUSPMA_RX_TOP_AFE1, LN_AFE1_DIV20_RESET_N);
-	mask32(shm + LN_AUSPMA_RX_SHM_DFE121,
-	       LN_DFE121_TX_BYTECLK_SYNC_CLR | LN_DFE121_TX_BYTECLK_SYNC_CLR_OV,
-	       LN_DFE121_TX_BYTECLK_SYNC_CLR_OV);
-	udelay(1);
-	mask32(shm + LN_AUSPMA_RX_SHM_VREF221, LN_VREF221_EN | LN_VREF221_FILTER_ADJUST,
-	       LN_VREF221_EN | FIELD_PREP(LN_VREF221_FILTER_ADJUST, 1));
-	mask32(shm + LN_AUSPMA_RX_SHM_VREF231, LN_VREF231_BOOST_CTRL,
-	       FIELD_PREP(LN_VREF231_BOOST_CTRL, 1));
-	udelay(1);
-	clear32(shm + LN_AUSPMA_RX_SHM_VREF221, LN_VREF221_FILTER_ADJUST);
-	udelay(1);
-	set32(shm + LN_AUSPMA_RX_SHM_DFE111,
-	      LN_DFE111_DTVREG_SMALL_EN | LN_DFE111_DTVREG_SMALL_EN_OV);
-	udelay(1);
-	set32(shm + LN_AUSPMA_RX_SHM_DFE111, LN_DFE111_DTVREG_BIG_EN | LN_DFE111_DTVREG_BIG_EN_OV);
-	udelay(1);
-	mask32(shm + LN_AUSPMA_RX_SHM_VREF231, LN_VREF231_BOOST_CTRL,
-	       FIELD_PREP(LN_VREF231_BOOST_CTRL, 3));
-	udelay(1);
-	mask32(shm + LN_AUSPMA_RX_SHM_VREF231, LN_VREF231_BOOST_CTRL,
-	       FIELD_PREP(LN_VREF231_BOOST_CTRL, 2));
-	udelay(1);
-	clear32(shm + LN_AUSPMA_RX_SHM_VREF231, LN_VREF231_BOOST_CTRL);
-	udelay(1);
-	set32(shm + LN_AUSPMA_RX_SHM_TERM191, LN_TERM191_TX_EN | LN_TERM191_TX_EN_OV);
-	udelay(1);
-	mask32(shm + LN_AUSPMA_RX_SHM_DFE121, LN_DFE121_TX_HRCLK_SEL | LN_DFE121_TX_HRCLK_SEL_OV,
-	       LN_DFE121_TX_HRCLK_SEL_OV);
-	clear32(top + LN_AUSPMA_RX_TOP_EQ1, LN_EQ_SWING | LN_EQ_SWING_LSB);
-	set32(top + LN_AUSPMA_RX_TOP_EQ18, LN_EQ_SWING_OV);
-	mask32(top + LN_AUSPMA_RX_TOP_EQ17, LN_EQ_DEEMPH_FIELDS, 0x1f81);
-	mask32(shm + LN_AUSPMA_RX_SHM_TERM191, LN_TERM191_TX_DIV2_EN | LN_TERM191_TX_DIV2_EN_OV,
-	       FIELD_PREP(LN_TERM191_TX_DIV2_EN, cfg->txa_div2_en) | LN_TERM191_TX_DIV2_EN_OV);
-	mask32(shm + LN_AUSPMA_RX_SHM_TERM191, LN_TERM191_TX_DIV2_RST | LN_TERM191_TX_DIV2_RST_OV,
-	       LN_TERM191_TX_DIV2_RST_OV);
-	udelay(1);
-	set32(shm + LN_AUSPMA_RX_SHM_CTLE2, LN_CTLE2_TX_CLK_EN | LN_CTLE2_TX_CLK_EN_OV);
-	udelay(1);
-}
-
-static void atcphy_dp_stop_lane_t8122(struct apple_atcphy *atcphy, unsigned int lane)
-{
-	void __iomem *tx = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_TX_SHM);
-	void __iomem *rx = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_RX_SHM);
-	void __iomem *top = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_RX_TOP);
-
-	set32(tx + LN_AUSPMA_TX_SHM_CLKMON1, LN_CLKMON1_HIZ | LN_CLKMON1_HIZ_OV);
-	mask32(tx + LN_AUSPMA_TX_SHM_MAIN5, LN_MAIN5_CLK_EN | LN_MAIN5_CLK_EN_OV,
-	       LN_MAIN5_CLK_EN_OV);
-	mask32(tx + LN_AUSPMA_TX_SHM_MAIN2, LN_MAIN2_BYTECLK_SYNC_EN | LN_MAIN2_BYTECLK_SYNC_EN_OV,
-	       LN_MAIN2_BYTECLK_SYNC_EN_OV);
-	udelay(1);
-	clear32(tx + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_BYPASS_SMALL);
-	udelay(1);
-	clear32(tx + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_BYPASS_BIG);
-	udelay(1);
-	clear32(tx + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_EN_BIG);
-	udelay(1);
-	clear32(tx + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_EN_SMALL);
-	udelay(1);
-	clear32(tx + LN_AUSPMA_TX_SHM_LDOCLK1, LN_LDOCLK1_VREF_EN);
-	core_set32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_CLAMP(lane));
-	udelay(1);
-	core_clear32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_SLEEP_BIG(lane));
-	udelay(1);
-	core_clear32(atcphy, ACIOPHY_SLEEP_CTRL_T8122, ACIOPHY_TX_SLEEP_SMALL(lane));
-	udelay(1);
-
-	mask32(rx + LN_AUSPMA_RX_SHM_CTLE2, LN_CTLE2_TX_CLK_EN | LN_CTLE2_TX_CLK_EN_OV,
-	       LN_CTLE2_TX_CLK_EN_OV);
-	udelay(1);
-	set32(rx + LN_AUSPMA_RX_SHM_TERM191, LN_TERM191_TX_DIV2_RST | LN_TERM191_TX_DIV2_RST_OV);
-	udelay(1);
-	mask32(rx + LN_AUSPMA_RX_SHM_TERM191, LN_TERM191_TX_EN | LN_TERM191_TX_EN_OV,
-	       LN_TERM191_TX_EN_OV);
-	mask32(rx + LN_AUSPMA_RX_SHM_DFE111, LN_DFE111_DTVREG_BIG_EN | LN_DFE111_DTVREG_BIG_EN_OV,
-	       LN_DFE111_DTVREG_BIG_EN_OV);
-	udelay(1);
-	mask32(rx + LN_AUSPMA_RX_SHM_DFE111,
-	       LN_DFE111_DTVREG_SMALL_EN | LN_DFE111_DTVREG_SMALL_EN_OV,
-	       LN_DFE111_DTVREG_SMALL_EN_OV);
-	udelay(1);
-	clear32(rx + LN_AUSPMA_RX_SHM_VREF221, LN_VREF221_EN);
-	udelay(1);
-	set32(rx + LN_AUSPMA_RX_SHM_DFE121,
-	      LN_DFE121_TX_BYTECLK_SYNC_CLR | LN_DFE121_TX_BYTECLK_SYNC_CLR_OV);
-	mask32(top + LN_AUSPMA_RX_TOP_AFE1, LN_AFE1_DIV20_RESET_N | LN_AFE1_DIV20_RESET_N_OV,
-	       LN_AFE1_DIV20_RESET_N_OV);
-	clear32(rx + LN_AUSPMA_RX_SHM_DFE121, LN_DFE121_TX_BYTECLK_SYNC_EN);
-	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_CLAMP(lane));
-	udelay(1);
-	core_clear32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_SLEEP_BIG(lane));
-	udelay(1);
-	core_clear32(atcphy, ACIOPHY_CFG0, ACIOPHY_RX_SLEEP_SMALL(lane));
-	udelay(1);
-	core_clear32(atcphy, ACIOPHY_CFG1, ACIOPHY_RXTX_SLEEP_BIG(lane));
-	udelay(1);
-	core_clear32(atcphy, ACIOPHY_CFG1, ACIOPHY_RXTX_SLEEP_SMALL(lane));
-	udelay(1);
-}
-
-static int atcphy_dp_start_link_t8122(struct apple_atcphy *atcphy, u8 pmas,
-				   enum atcphy_dp_link_rate lr)
-{
-	const struct atcphy_dp_link_rate_configuration *cfg = &dp_lr_config[lr];
-	int ret;
-
-	lockdep_assert_held(&atcphy->lock);
-	if (!pmas || pmas > 3)
-		return -EINVAL;
-	ret = atcphy_dp_start_pll_t8122(atcphy, lr);
-	if (ret)
-		return ret;
-	/* Set both feedback overrides before releasing the shared lane reset. */
-	for (unsigned int lane = 0; lane < 2; lane++) {
-		void __iomem *shm = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_RX_SHM);
-
-		if (pmas & BIT(lane))
-			mask32(shm + LN_AUSPMA_RX_SHM_DFE101,
-			       LN_DFE101_DFEH1FB_EN | LN_DFE101_DFEH1FB_EN_OV,
-			       LN_DFE101_DFEH1FB_EN_OV);
-	}
-	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
-		   DPTXPHY_PMA_LANE_RESET_N | DPTXPHY_PMA_LANE_RESET_N_OV);
-	udelay(1);
-	for (unsigned int lane = 0; lane < 2; lane++) {
-		if (!(pmas & BIT(lane)))
-			continue;
-		atcphy_dp_configure_tx_t8122(atcphy, lane, cfg);
-		atcphy_dp_configure_rxtx_t8122(atcphy, lane, cfg);
-	}
-	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DP_PMA_BYTECLK_RESET);
-	return 0;
-}
-
-static int atcphy_dp_stop_link_t8122(struct apple_atcphy *atcphy)
-{
-	const struct atcphy_mode_configuration *cfg;
-	int ret;
-
-	lockdep_assert_held(&atcphy->lock);
-	if (atcphy->dp_link_rate == ATCPHY_DP_LINK_RATE_IDLE)
-		return 0;
-	cfg = atcphy_get_mode_config(atcphy, atcphy->mode);
-	atcphy->dp_link_rate = ATCPHY_DP_LINK_RATE_PENDING;
-	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DP_PMA_BYTECLK_RESET);
-	for (unsigned int lane = 0; lane < 2; lane++) {
-		if (cfg->dp_lane[lane])
-			atcphy_dp_stop_lane_t8122(atcphy, lane);
-	}
-	core_mask32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
-		    DPTXPHY_PMA_LANE_RESET_N | DPTXPHY_PMA_LANE_RESET_N_OV,
-		    DPTXPHY_PMA_LANE_RESET_N_OV);
-	ret = atcphy_auspll_set_command(atcphy, 0, true);
-	if (ret)
-		return ret;
-	ret = atcphy_auspll_set_command(atcphy, 3, false);
-	if (ret)
-		return ret;
-	ret = atcphy_dp_poll(atcphy, ACIOPHY_DP_PCLK_STAT_T8122, ACIOPHY_AUSPLL_LOCK, 0);
-	if (ret)
-		return ret;
-	core_clear32(atcphy, AUSPLL_CLKOUT_MASTER, AUSPLL_CLKOUT_MASTER_PCLK_DRVR_EN_T8122);
-	atcphy->dp_link_rate = ATCPHY_DP_LINK_RATE_IDLE;
-	return 0;
-}
-
-static int atcphy_dp_set_rate_t8122(struct apple_atcphy *atcphy, enum atcphy_dp_link_rate lr)
-{
-	const struct atcphy_mode_configuration *cfg;
-	u8 pmas;
-	int ret;
-
-	guard(mutex)(&atcphy->lock);
-	if (!atcphy_modes[atcphy->mode].enable_dp_aux)
-		return -ENOLINK;
-	cfg = atcphy_get_mode_config(atcphy, atcphy->mode);
-	pmas = cfg->dp_lane[0] | (cfg->dp_lane[1] << 1);
-	if (!pmas)
-		return -EINVAL;
-	if (atcphy->dp_link_rate == lr)
-		return 0;
-	ret = atcphy_dp_stop_link_t8122(atcphy);
-	if (ret)
-		return ret;
-	atcphy->dp_link_rate = ATCPHY_DP_LINK_RATE_PENDING;
-	ret = atcphy_dp_start_link_t8122(atcphy, pmas, lr);
-	if (ret) {
-		atcphy_dp_stop_link_t8122(atcphy);
-		return ret;
-	}
-	atcphy->dp_link_rate = lr;
-	return 0;
-}
-
-static void atcphy_enable_dp_aux_t8122(struct apple_atcphy *atcphy)
-{
-	core_set32(atcphy, AUX_SHM_PWR, AUX_SLEEP_SML_OV | AUX_SLEEP_SML);
-	udelay(1);
-	core_set32(atcphy, AUX_SHM_PWR, AUX_SLEEP_BIG_OV | AUX_SLEEP_BIG);
-	udelay(1);
-	core_mask32(atcphy, AUX_SHM_PWR, AUX_CLAMP_OV | AUX_CLAMP,
-		    AUX_CLAMP_OV);
-	udelay(1);
-	core_clear32(atcphy, AUX_TOP_CTRL, AUX_TOP_PWRDN);
-	udelay(1);
-	atcphy->dp_link_rate = ATCPHY_DP_LINK_RATE_IDLE;
-}
-
-static void atcphy_disable_dp_aux_t8122(struct apple_atcphy *atcphy)
-{
-	core_set32(atcphy, AUX_TOP_CTRL, AUX_TOP_PWRDN);
-	udelay(1);
-	core_set32(atcphy, AUX_SHM_PWR, AUX_CLAMP);
-	udelay(1);
-	core_clear32(atcphy, AUX_SHM_PWR, AUX_SLEEP_BIG);
-	udelay(1);
-	core_clear32(atcphy, AUX_SHM_PWR, AUX_SLEEP_SML);
-	udelay(1);
-}
-
-static void atcphy_enable_dp_aux_t8103(struct apple_atcphy *atcphy)
-{
-	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTXPHY_PMA_LANE_RESET_N);
-	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTXPHY_PMA_LANE_RESET_N_OV);
-
-	core_mask32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPRX_PCLK_SELECT,
-		    FIELD_PREP(DPRX_PCLK_SELECT, 1));
-	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPRX_PCLK_ENABLE);
-
-	core_mask32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTX_PCLK1_SELECT,
-		    FIELD_PREP(DPTX_PCLK1_SELECT, 1));
-	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTX_PCLK1_ENABLE);
-
-	core_mask32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTX_PCLK2_SELECT,
-		    FIELD_PREP(DPTX_PCLK2_SELECT, 1));
-	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTX_PCLK2_ENABLE);
-
-	core_set32(atcphy, ACIOPHY_PLL_COMMON_CTRL,
-		   ACIOPHY_PLL_WAIT_FOR_CMN_READY_BEFORE_RESET_EXIT);
-
-	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_CLAMP_EN);
-	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_SLEEP_B_SML_IN);
-	udelay(10);
-	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_SLEEP_B_BIG_IN);
-	udelay(10);
-	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_CLAMP_EN);
-	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_PWN_DOWN);
-	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_TXTERM_CODEMSB);
-	mask32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_TXTERM_CODE,
-	       FIELD_PREP(LPDPTX_TXTERM_CODE, 0x16));
-
-	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_LDO_CTRL, 0x1c00);
-	mask32(atcphy->regs.lpdptx + LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG1, LPDPTX_CFG_PMA_PHYS_ADJ,
-	       FIELD_PREP(LPDPTX_CFG_PMA_PHYS_ADJ, 5));
-	set32(atcphy->regs.lpdptx + LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG1,
-	      LPDPTX_CFG_PMA_PHYS_ADJ_OV);
-
-	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_MARGIN,
-		LPDPTX_MARGIN_RCAL_RXOFFSET_EN);
-
-	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_CTRL, LPDPTX_BLK_AUX_CTRL_PWRDN);
-	set32(atcphy->regs.lpdptx + LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG0,
-	      LPDPTX_CFG_PMA_AUX_SEL_LF_DATA);
-	mask32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_CTRL, LPDPTX_BLK_AUX_RXOFFSET,
-	       FIELD_PREP(LPDPTX_BLK_AUX_RXOFFSET, 3));
-
-	mask32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_MARGIN, LPDPTX_AUX_MARGIN_RCAL_TXSWING,
-	       FIELD_PREP(LPDPTX_AUX_MARGIN_RCAL_TXSWING, 12));
-
-	atcphy->dp_link_rate = ATCPHY_DP_LINK_RATE_IDLE;
-}
-
-static void atcphy_disable_dp_aux_t8103(struct apple_atcphy *atcphy)
-{
-	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_PWN_DOWN);
-	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_CTRL, LPDPTX_BLK_AUX_CTRL_PWRDN);
-	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_CLAMP_EN);
-	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_SLEEP_B_SML_IN);
-	udelay(10);
-	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_SLEEP_B_BIG_IN);
-	udelay(10);
-
-	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTXPHY_PMA_LANE_RESET_N);
-	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPRX_PCLK_ENABLE);
-	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTX_PCLK1_ENABLE);
-	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0, DPTX_PCLK2_ENABLE);
-}
-
 static void atcphy_dp_enable_aux(struct apple_atcphy *atcphy)
 {
 	if (atcphy->hw->dp_enable_aux)
@@ -2009,8 +851,6 @@ static int atcphy_dp_configure_lane(struct apple_atcphy *atcphy, enum atcphy_lan
 
 	lockdep_assert_held(&atcphy->lock);
 
-	if ((unsigned int)lane > APPLE_ATCPHY_LANE_1)
-		return -EINVAL;
 	tx_shm = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_TX_SHM);
 	rx_shm = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_RX_SHM);
 	rx_top = atcphy_lane_reg(atcphy, lane, LN0_AUSPMA_RX_TOP);
@@ -2236,7 +1076,7 @@ static int atcphy_dp_configure(struct apple_atcphy *atcphy, enum atcphy_dp_link_
 
 	guard(mutex)(&atcphy->lock);
 	mode_cfg = atcphy_get_mode_config(atcphy, atcphy->mode);
-	cfg = &dp_lr_config[lr];
+	cfg = &atcphy_dp_lr_config[lr];
 
 	if (atcphy->dp_link_rate == lr)
 		return 0;
@@ -2347,7 +1187,7 @@ static void atcphy_usb2_power_off(struct apple_atcphy *atcphy)
 	set32(atcphy->regs.usb2phy + USB2PHY_MISCTUNE, USB2PHY_MISCTUNE_REFCLK_GATE_OFF);
 }
 
-static int atcphy_power_off(struct apple_atcphy *atcphy)
+int atcphy_power_off(struct apple_atcphy *atcphy)
 {
 	u32 reg;
 	int ret;
@@ -2379,13 +1219,6 @@ static int atcphy_power_off(struct apple_atcphy *atcphy)
 	return 0;
 }
 
-static void atcphy_configure_usb2_evt_ctl_t8122(struct apple_atcphy *atcphy)
-{
-	core_set32(atcphy, ATCPHY_EVT_USB2_CTL, ATCPHY_EVT_USB2_CTL_LOAD_CNT |
-		ATCPHY_EVT_USB2_CTL_EVT_EN);
-	udelay(10);
-}
-
 static void atcphy_usb2_power_on(struct apple_atcphy *atcphy)
 {
 	set32(atcphy->regs.usb2phy + USB2PHY_SIG,
@@ -2446,87 +1279,6 @@ static int atcphy_power_on(struct apple_atcphy *atcphy)
 	return 0;
 }
 
-static void atcphy_configure_post_tunable_t8103(struct apple_atcphy *atcphy, enum atcphy_mode _mode)
-{
-	core_set32(atcphy, AUSPLL_FSM_CTRL, 0x1fe000);
-	core_set32(atcphy, AUSPLL_APB_CMD_OVERRIDE, AUSPLL_APB_CMD_OVERRIDE_UNK28);
-
-	set32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL_OV);
-	udelay(10);
-	set32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_BIG_OV);
-	udelay(10);
-	set32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_CLAMP_OV);
-	udelay(10);
-
-	mask32(atcphy->regs.core + ACIOPHY_SLEEP_CTRL, ACIOPHY_SLEEP_CTRL_TX_SMALL_OV,
-	       FIELD_PREP(ACIOPHY_SLEEP_CTRL_TX_SMALL_OV, 3));
-	udelay(10);
-	mask32(atcphy->regs.core + ACIOPHY_SLEEP_CTRL, ACIOPHY_SLEEP_CTRL_TX_BIG_OV,
-	       FIELD_PREP(ACIOPHY_SLEEP_CTRL_TX_BIG_OV, 3));
-	udelay(10);
-	mask32(atcphy->regs.core + ACIOPHY_SLEEP_CTRL, ACIOPHY_SLEEP_CTRL_TX_CLAMP_OV,
-	       FIELD_PREP(ACIOPHY_SLEEP_CTRL_TX_CLAMP_OV, 3));
-	udelay(10);
-
-	mask32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_RX_BIG_OV,
-	       FIELD_PREP(ACIOPHY_CFG0_RX_BIG_OV, 3));
-	udelay(10);
-	mask32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_RX_SMALL_OV,
-	       FIELD_PREP(ACIOPHY_CFG0_RX_SMALL_OV, 3));
-	udelay(10);
-	mask32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_RX_CLAMP_OV,
-	       FIELD_PREP(ACIOPHY_CFG0_RX_CLAMP_OV, 3));
-	udelay(10);
-}
-
-static void atcphy_power_on_common_t8122(struct apple_atcphy *atcphy)
-{
-	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL);
-	udelay(10);
-	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL_OV);
-	udelay(10);
-	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_BIG);
-	udelay(10);
-	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_BIG_OV);
-	udelay(10);
-	core_clear32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_CLAMP);
-	udelay(10);
-	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_CLAMP_OV);
-	udelay(10);
-	core_set32(atcphy, AUS_COMMON_SHIM_BLK_BIAS_REG, AUS_COMMON_SHIM_BLK_BIAS_REG_BGBIAS_OV);
-	udelay(10);
-}
-
-static void atcphy_configure_post_tunable_t8122(struct apple_atcphy *atcphy, enum atcphy_mode mode)
-{
-	if (atcphy_modes[mode].pipehandler_state == ATCPHY_PIPEHANDLER_STATE_USB3 ||
-	    (atcphy->hw->dp_enable_aux && atcphy_modes[mode].enable_dp_aux))
-		atcphy_power_on_common_t8122(atcphy);
-}
-
-static void atcphy_enable_cio3pll_clk_t8103(struct apple_atcphy *atcphy)
-{
-	core_set32(atcphy, CIO3PLL_CLK_CTRL, CIO3PLL_CLK_PCLK_EN);
-	core_set32(atcphy, CIO3PLL_CLK_CTRL, CIO3PLL_CLK_REFCLK_EN);
-}
-
-static int atcphy_wait_rcal1_done_t8122(struct apple_atcphy *atcphy, enum atcphy_mode mode)
-{
-	int ret = 0;
-	u32 reg;
-
-	if (atcphy_modes[mode].pipehandler_state == ATCPHY_PIPEHANDLER_STATE_USB3) {
-		ret = readl_poll_timeout(atcphy->regs.core + AUS_COMMON_DIG_RCAL1, reg,
-					 (reg & AUS_COMMON_DIG_RCAL1_ALL_CODES_DONE), 10, 100000);
-		if (ret) {
-			atcphy_power_off(atcphy);
-			dev_err(atcphy->dev, "Failed to wait for RCAL1 done\n");
-			return ret;
-		}
-	}
-	return ret;
-}
-
 static int atcphy_configure(struct apple_atcphy *atcphy, enum atcphy_mode mode)
 {
 	int ret = 0;
@@ -3124,32 +1876,6 @@ static int atcphy_probe(struct platform_device *pdev)
 	return atcphy_probe_finalize(atcphy);
 }
 
-static const struct atcphy_hw atcphy_hw_t8103 = {
-	.need_dp_tunables = true,
-	.aciophy_lane_mode = ACIOPHY_LANE_MODE_T8103,
-	.aciophy_crossbar = ACIOPHY_CROSSBAR_T8103,
-	.configure_post_tunable = atcphy_configure_post_tunable_t8103,
-	.configure_pipehandler_usb3_host = atcphy_configure_pipehandler_usb3_host_t8103,
-	.enable_cio3pll_clk = atcphy_enable_cio3pll_clk_t8103,
-	.configure_lane_pmafsm = atcphy_configure_lane_pmafsm_t8103,
-	.dp_enable_aux = atcphy_enable_dp_aux_t8103,
-	.dp_disable_aux = atcphy_disable_dp_aux_t8103,
-};
-
-static const struct atcphy_hw atcphy_hw_t8122 = {
-	.need_dp_tunables = false,
-	.aciophy_lane_mode = ACIOPHY_LANE_MODE_T8122,
-	.aciophy_crossbar = ACIOPHY_CROSSBAR_T8122,
-	.configure_post_tunable = atcphy_configure_post_tunable_t8122,
-	.configure_pipehandler_usb3_host = atcphy_configure_pipehandler_usb3_host_t8122,
-	.configure_usb2_evt_ctl = atcphy_configure_usb2_evt_ctl_t8122,
-	.wait_rcal1_done = atcphy_wait_rcal1_done_t8122,
-	.dp_enable_aux = atcphy_enable_dp_aux_t8122,
-	.dp_disable_aux = atcphy_disable_dp_aux_t8122,
-	.dp_set_rate = atcphy_dp_set_rate_t8122,
-	.dp_stop = atcphy_dp_stop_link_t8122,
-};
-
 static const struct of_device_id atcphy_match[] = {
 	{ .compatible = "apple,t8103-atcphy", .data = &atcphy_hw_t8103 },
 	{ .compatible = "apple,t8122-atcphy", .data = &atcphy_hw_t8122 },
diff --git a/drivers/phy/apple/atc.h b/drivers/phy/apple/atc.h
new file mode 100644
index 000000000000..e8bda29553e2
--- /dev/null
+++ b/drivers/phy/apple/atc.h
@@ -0,0 +1,340 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+
+#include <linux/bitfield.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+
+#ifndef __ATC_H__
+#define __ATC_H__
+
+enum atcphy_lane_mode {
+	ACIOPHY_LANE_MODE_USB4 = 0,
+	ACIOPHY_LANE_MODE_USB3 = 1,
+	ACIOPHY_LANE_MODE_DP = 2,
+	ACIOPHY_LANE_MODE_OFF = 3,
+};
+
+enum atcphy_dp_link_rate {
+	ATCPHY_DP_LINK_RATE_RBR,
+	ATCPHY_DP_LINK_RATE_HBR,
+	ATCPHY_DP_LINK_RATE_HBR2,
+	ATCPHY_DP_LINK_RATE_HBR3,
+};
+
+#define AUSPLL_FSM_CTRL 0x1014
+
+#define ACIOPHY_DP_PCLK_STAT 0x7044
+#define ACIOPHY_AUSPLL_LOCK BIT(3)
+
+#define ACIOPHY_CFG0 0x08
+#define ACIOPHY_CFG0_COMMON_BIG BIT(0)
+#define ACIOPHY_CFG0_COMMON_BIG_OV BIT(1)
+#define ACIOPHY_CFG0_COMMON_SMALL BIT(2)
+#define ACIOPHY_CFG0_COMMON_SMALL_OV BIT(3)
+#define ACIOPHY_CFG0_COMMON_CLAMP BIT(4)
+#define ACIOPHY_CFG0_COMMON_CLAMP_OV BIT(5)
+#define ACIOPHY_CFG0_RX_SMALL_OV GENMASK(9, 8)
+#define ACIOPHY_CFG0_RX_BIG_OV GENMASK(13, 12)
+#define ACIOPHY_CFG0_RX_CLAMP_OV GENMASK(17, 16)
+
+#define AUSPLL_BGR 0x2214
+#define AUSPLL_BGR_CTRL_AVAIL BIT(0)
+
+#define AUSPLL_FREQ_CFG 0x2224
+#define AUSPLL_FREQ_REFCLK GENMASK(1, 0)
+
+#define AUSPLL_APB_CMD_OVERRIDE 0x2000
+#define AUSPLL_APB_CMD_OVERRIDE_REQ BIT(0)
+#define AUSPLL_APB_CMD_OVERRIDE_ACK BIT(1)
+#define AUSPLL_APB_CMD_OVERRIDE_UNK28 BIT(28)
+#define AUSPLL_APB_CMD_OVERRIDE_CMD GENMASK(27, 3)
+
+#define AUSPLL_CLKOUT_DIV 0x2208
+#define AUSPLL_CLKOUT_PLLA_REFBUFCLK_DI GENMASK(20, 16)
+
+#define AUSPLL_CLKOUT_MASTER 0x2200
+#define AUSPLL_CLKOUT_MASTER_PCLK_DRVR_EN BIT(2)
+#define AUSPLL_CLKOUT_MASTER_PCLK2_DRVR_EN BIT(4)
+#define AUSPLL_CLKOUT_MASTER_REFBUFCLK_DRVR_EN BIT(6)
+
+#define AUSPLL_FREQ_DESC_A 0x2080
+#define AUSPLL_FD_FREQ_COUNT_TARGET GENMASK(9, 0)
+#define AUSPLL_FD_FBDIVN_HALF BIT(10)
+#define AUSPLL_FD_REV_DIVN GENMASK(13, 11)
+#define AUSPLL_FD_KI_MAN GENMASK(17, 14)
+#define AUSPLL_FD_KI_EXP GENMASK(21, 18)
+#define AUSPLL_FD_KP_MAN GENMASK(25, 22)
+#define AUSPLL_FD_KP_EXP GENMASK(29, 26)
+#define AUSPLL_FD_KPKI_SCALE_HBW GENMASK(31, 30)
+
+#define AUSPLL_FREQ_DESC_B 0x2084
+#define AUSPLL_FD_FBDIVN_FRAC_DEN GENMASK(13, 0)
+#define AUSPLL_FD_FBDIVN_FRAC_NUM GENMASK(27, 14)
+
+#define AUSPLL_FREQ_DESC_C 0x2088
+#define AUSPLL_FD_SDM_SSC_STEP GENMASK(7, 0)
+#define AUSPLL_FD_SDM_SSC_EN BIT(8)
+#define AUSPLL_FD_PCLK_DIV_SEL GENMASK(13, 9)
+#define AUSPLL_FD_LFSDM_DIV GENMASK(15, 14)
+#define AUSPLL_FD_LFCLK_CTRL GENMASK(19, 16)
+#define AUSPLL_FD_VCLK_OP_DIVN GENMASK(21, 20)
+#define AUSPLL_FD_VCLK_PRE_DIVN BIT(22)
+
+#define ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0 0x7000
+#define DP_PMA_BYTECLK_RESET BIT(0)
+#define DP_MAC_DIV20_CLK_SEL BIT(1)
+#define DPTXPHY_PMA_LANE_RESET_N BIT(2)
+#define DPTXPHY_PMA_LANE_RESET_N_OV BIT(3)
+#define DPTX_PCLK1_SELECT GENMASK(6, 4)
+#define DPTX_PCLK2_SELECT GENMASK(9, 7)
+#define DPRX_PCLK_SELECT GENMASK(12, 10)
+#define DPTX_PCLK1_ENABLE BIT(13)
+#define DPTX_PCLK2_ENABLE BIT(14)
+#define DPRX_PCLK_ENABLE BIT(15)
+
+#define LN_AUSPMA_RX_TOP_TJ_CFG_RX_TXMODE 0x00F0
+#define LN_RX_TXMODE BIT(0)
+
+#define LN0_AUSPMA_RX_TOP 0x9000
+#define LN0_AUSPMA_RX_EQ 0xA000
+#define LN0_AUSPMA_RX_SHM 0xB000
+#define LN0_AUSPMA_TX_TOP 0xC000
+#define LN0_AUSPMA_TX_SHM 0xD000
+
+#define LN1_AUSPMA_RX_TOP 0x10000
+#define LN1_AUSPMA_RX_EQ 0x11000
+#define LN1_AUSPMA_RX_SHM 0x12000
+#define LN1_AUSPMA_TX_TOP 0x13000
+#define LN1_AUSPMA_TX_SHM 0x14000
+
+#define ATCPHY_DP_LINK_RATE_IDLE		(-1)
+#define ATCPHY_DP_LINK_RATE_PENDING	(-2)
+
+/**
+ * enum atcphy_pipehandler_state - States of the PIPE mux interface ("pipehandler")
+ * @ATCPHY_PIPEHANDLER_STATE_DUMMY: "Dummy PHY" (disables USB3, USB2 only)
+ * @ATCPHY_PIPEHANDLER_STATE_USB3: USB3 directly connected to the Type-C port
+ * @ATCPHY_PIPEHANDLER_STATE_USB4: USB3 tunneled via USB4/Thunderbolt
+ *
+ * DWC3's USB3 PIPE interface is connected to a multiplexer inside this PHY
+ * which can switch between a dummy state (which effectively disables any USB3
+ * support and falls back to USB2 only operation via the separate ULPI interface),
+ * a USB3 state (for regular USB3 or USB3+DisplayPort operation) and a USB4 state
+ * (for USB3 tunneled via USB4/Thunderbolt).
+ */
+enum atcphy_pipehandler_state {
+	ATCPHY_PIPEHANDLER_STATE_DUMMY,
+	ATCPHY_PIPEHANDLER_STATE_USB3,
+	ATCPHY_PIPEHANDLER_STATE_USB4,
+};
+
+/**
+ * enum atcphy_mode - Operating modes of the PHY
+ * @APPLE_ATCPHY_MODE_OFF: all PHYs powered off
+ * @APPLE_ATCPHY_MODE_USB2: Nothing on the four SS lanes (i.e. USB2 only on D-/+)
+ * @APPLE_ATCPHY_MODE_USB3: USB3 on two lanes, nothing on the other two
+ * @APPLE_ATCPHY_MODE_USB3_DP: USB3 on two lanes and DisplayPort on the other two
+ * @APPLE_ATCPHY_MODE_TBT: Thunderbolt on all lanes
+ * @APPLE_ATCPHY_MODE_USB4: USB4 on all lanes
+ * @APPLE_ATCPHY_MODE_DP: DisplayPort on all lanes
+ */
+enum atcphy_mode {
+	APPLE_ATCPHY_MODE_OFF,
+	APPLE_ATCPHY_MODE_USB2,
+	APPLE_ATCPHY_MODE_USB3,
+	APPLE_ATCPHY_MODE_USB3_DP,
+	APPLE_ATCPHY_MODE_TBT,
+	APPLE_ATCPHY_MODE_USB4,
+	APPLE_ATCPHY_MODE_DP,
+};
+
+enum atcphy_lane {
+	APPLE_ATCPHY_LANE_0,
+	APPLE_ATCPHY_LANE_1,
+};
+
+/* Link rate configuration, field names are taken from XNU debug output or register names */
+struct atcphy_dp_link_rate_configuration {
+	u16 freqinit_count_target;
+	u16 fbdivn_frac_den;
+	u16 fbdivn_frac_num;
+	u16 pclk_div_sel;
+	u8 lfclk_ctrl;
+	u8 vclk_op_divn;
+	bool plla_clkout_vreg_bypass;
+	bool txa_ldoclk_bypass;
+	bool txa_div2_en;
+};
+
+/* Crossbar and lane configuration */
+struct atcphy_mode_configuration {
+	u32 crossbar;
+	u32 crossbar_dp_single_pma;
+	bool crossbar_dp_both_pma;
+	enum atcphy_lane_mode lane_mode[2];
+	bool dp_lane[2];
+	bool set_swap;
+};
+
+struct atcphy_mode_info {
+	const struct atcphy_mode_configuration normal;
+	const struct atcphy_mode_configuration swapped;
+	bool enable_dp_aux;
+	enum atcphy_pipehandler_state pipehandler_state;
+};
+
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
+	void (*dp_enable_aux)(struct apple_atcphy *atcphy);
+	void (*dp_disable_aux)(struct apple_atcphy *atcphy);
+	int (*dp_set_rate)(struct apple_atcphy *atcphy, enum atcphy_dp_link_rate lr);
+	int (*dp_stop)(struct apple_atcphy *atcphy);
+	int aciophy_lane_mode;
+	int aciophy_crossbar;
+	bool need_dp_tunables;
+};
+
+/**
+ * struct apple_atcphy - Apple Type-C PHY device struct
+ * @np: Device node pointer
+ * @dev: Device pointer
+ * @tunables: Firmware-provided tunable parameters
+ * @tunables.axi2af: AXI to AF interface tunables
+ * @tunables.common: Common tunables for all lanes
+ * @tunables.lane_usb3: USB3 lane-specific tunables
+ * @tunables.lane_dp: DisplayPort lane-specific tunables
+ * @tunables.lane_usb4: USB4 lane-specific tunables
+ * @hw: Hardware version specific data
+ * @mode: Current PHY operating mode
+ * @swap_lanes: True if lanes must be swapped due to cable orientation
+ * @dp_link_rate: DisplayPort link rate index, ATCPHY_DP_LINK_RATE_IDLE, or
+ *               ATCPHY_DP_LINK_RATE_PENDING when cleanup is still needed
+ * @pipehandler_up: True if the PIPE mux ("pipehandler") is set to USB3 or USB4 mode
+ * @regs: Memory-mapped registers
+ * @regs.core: Core registers
+ * @regs.axi2af: AXI to Apple Fabric interface registers
+ * @regs.usb2phy: USB2 PHY registers
+ * @regs.pipehandler: USB3 PIPE interface ("pipehandler") registers
+ * @regs.lpdptx: DisplayPort registers
+ * @res: Resources for memory-mapped registers, used to verify that tunables aren't out of bounds
+ * @res.core: Core register resource
+ * @res.axi2af: AXI to Apple Fabric interface resource
+ * @phys: PHY instances
+ * @phys.usb2: USB2 PHY instance
+ * @phys.usb3: USB3 PHY instance
+ * @phys.dp: DisplayPort PHY instance
+ * @phy_provider: PHY provider instance
+ * @rcdev: Reset controller device
+ * @lock: Mutex for synchronizing register access across PHY, Type-C switch/mux and reset controller
+ */
+struct apple_atcphy {
+	struct device_node *np;
+	struct device *dev;
+
+	struct {
+		struct apple_tunable *axi2af;
+		struct apple_tunable *common[2];
+		struct apple_tunable *lane_usb3[2];
+		struct apple_tunable *lane_dp[2];
+		struct apple_tunable *lane_usb4[2];
+	} tunables;
+
+	const struct atcphy_hw *hw;
+	enum atcphy_mode mode;
+	int dp_link_rate;
+	bool swap_lanes;
+	bool pipehandler_up;
+
+	struct {
+		void __iomem *core;
+		void __iomem *axi2af;
+		void __iomem *usb2phy;
+		void __iomem *pipehandler;
+		void __iomem *lpdptx;
+	} regs;
+
+	struct {
+		struct resource *core;
+		struct resource *axi2af;
+	} res;
+
+	struct {
+		struct phy *usb2;
+		struct phy *usb3;
+		struct phy *dp;
+	} phys;
+	struct phy_provider *phy_provider;
+
+	struct reset_controller_dev rcdev;
+
+	struct mutex lock;
+};
+
+static inline void mask32(void __iomem *reg, u32 mask, u32 set)
+{
+	u32 value = readl(reg);
+
+	value &= ~mask;
+	value |= set;
+	writel(value, reg);
+}
+
+static inline void core_mask32(struct apple_atcphy *atcphy, u32 reg, u32 mask, u32 set)
+{
+	mask32(atcphy->regs.core + reg, mask, set);
+}
+
+static inline void set32(void __iomem *reg, u32 set)
+{
+	mask32(reg, 0, set);
+}
+
+static inline void core_set32(struct apple_atcphy *atcphy, u32 reg, u32 set)
+{
+	core_mask32(atcphy, reg, 0, set);
+}
+
+static inline void clear32(void __iomem *reg, u32 clear)
+{
+	mask32(reg, clear, 0);
+}
+
+static inline void core_clear32(struct apple_atcphy *atcphy, u32 reg, u32 clear)
+{
+	core_mask32(atcphy, reg, clear, 0);
+}
+
+static inline void __iomem *atcphy_lane_reg(struct apple_atcphy *atcphy,
+				  unsigned int lane, u32 lane0_reg)
+{
+	return atcphy->regs.core + lane0_reg + lane * (LN1_AUSPMA_RX_TOP - LN0_AUSPMA_RX_TOP);
+}
+
+extern const struct atcphy_hw atcphy_hw_t8103;
+extern const struct atcphy_hw atcphy_hw_t8122;
+extern const struct atcphy_mode_info atcphy_modes[];
+extern const struct atcphy_dp_link_rate_configuration atcphy_dp_lr_config[];
+
+static inline
+const struct atcphy_mode_configuration *atcphy_get_mode_config(struct apple_atcphy *atcphy,
+							       enum atcphy_mode mode)
+{
+	if (atcphy->swap_lanes)
+		return &atcphy_modes[mode].swapped;
+	else
+		return &atcphy_modes[mode].normal;
+}
+
+void atcphy_clear_nonselected_phy_reset(struct apple_atcphy *atcphy);
+int atcphy_power_off(struct apple_atcphy *atcphy);
+
+#endif

-- 
2.56.1

