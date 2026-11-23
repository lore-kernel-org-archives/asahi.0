Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434533;
	b=J9dE6uGpx1t+I3J81f0SXxozHHmIHZgkcsqqw3qZYMyEslarEXE4wMFicx8UJYN71Qpk
	 +128wOwQh5UN9j+/Y84sEHQUrx5+qLfprHxkkzxA26/RyB4eKydiupLTR8h2YUGxOwq7U
	 X2gI8NESikQKTLH3cx++4+XTa4aU08RYvb6zarj1oOfRB53sbi35gTTrWDRhrrpA9TztC
	 Zv21v7VXIvI2392z3WLHSQ960g7ysyS5b+mas4petDRP8mEZqW9lw0sM2LAn5ExvGc6Ov
	 dCIKMOIXY6mGH2BpISTGcpwhEyJTEXliueIimVkH7vZKAcnGfzeH1tf5SefUYhdFTzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434533;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=yS1PD/mSABpPWdi3YyNUmeRXH9kC13Aa88IyEkHWUUQ=;
	b=jtENAWo+4D8t5iaNle9rSMPsjSFEmS/WsGW082kqDcPQfzeFe8rcIPJMRomyTd4GByky
	 CIwINl3CxLAe0RoPFo2p6dOWGRE76pyNGiE9v+NaKFuR+t+i1/5GM8e0cxgfevGXbroaX
	 AX+83zW00+3sIWINEQ2ydm9vqFnmQ2IBjfNlRgEoKb9WIk1avQLVWQOqx6UFhjg4M7Gjg
	 jQPsznESdLF9P8PNMaJ5T/rsLEYAtqPRu+dLQNgDy2Qf/lULIKByDMjOa/VqC9utkJmgi
	 8YJX/w4yWDy65skeTYx8X+i3GOGVpCc4rUdGo6N7ps+H6Odni9il4zWfYleMS7dHbQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YSUEm629;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348AF606A31A;
	Mon, 23 Nov 2026 11:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YSUEm629
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998071F000C6;
	Mon, 23 Nov 2026 11:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795434532;
	bh=yS1PD/mSABpPWdi3YyNUmeRXH9kC13Aa88IyEkHWUUQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YSUEm629l0Rj0StN6eLcY46vHBFNH0sjwk6KP63wPLbmzH8kP0ZcxcJ90P3pTYoEB
	 fSFWmK7Hh0joa0fuNkQpbgMpvLwS0b9FtVjAJr2xd9r0yo8saFLiH7dfXp0JlLtdil
	 di5tRf0DYF1+IIayORijUFbyaacfUL8EJx8cD+pasD2HUqOP7q7R416BtEH/QgkzOV
	 oyj9Uy9vwolSJu0Ofi8voLlqdkoGcerXBa4uxph5gJ+t0uIGVdwbpS+XIGTtOCfHAe
	 /pfj1GWZemAeKhb+GKCtOj9V6kLtlOd/QNM8bsookyRT5A0dIH71NXnyPTypLRNT56
	 pAht8xncEF+1A==
Message-ID: <ccb79f6a-6a44-46a0-9ad0-7a59e1a50567@kernel.org>
Date: Mon, 23 Nov 2026 12:46:24 +0100
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] phy: apple: atc: Split generation-specific code
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, Janne Grunau <j@jannau.net>,
 Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
 <20261122-t8122-phy-v2-5-8d5c8fdf31ba@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261122-t8122-phy-v2-5-8d5c8fdf31ba@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22.11.26 13:28, Sasha Finkelstein wrote:
> atc.c is getting pretty big, split out the hardware generation-specific
> code into separate files.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>   drivers/phy/apple/Makefile    |    2 +-
>   drivers/phy/apple/atc-t8103.c |  215 ++++++
>   drivers/phy/apple/atc-t8122.c |  588 +++++++++++++++
>   drivers/phy/apple/atc.c       | 1582 +----------------------------------------
>   drivers/phy/apple/atc.h       |  806 +++++++++++++++++++++
>   5 files changed, 1616 insertions(+), 1577 deletions(-)
> 

[...]

> diff --git a/drivers/phy/apple/atc.h b/drivers/phy/apple/atc.h
> new file mode 100644
> index 000000000000..d6a608c67769
> --- /dev/null
> +++ b/drivers/phy/apple/atc.h
> @@ -0,0 +1,806 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> +
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +
> +#ifndef __ATC_H__
> +#define __ATC_H__
> +
> +#define AUSPLL_FSM_CTRL 0x1014
> +
> +#define AUSPLL_APB_CMD_OVERRIDE 0x2000
> +#define AUSPLL_APB_CMD_OVERRIDE_REQ BIT(0)
> +#define AUSPLL_APB_CMD_OVERRIDE_ACK BIT(1)
> +#define AUSPLL_APB_CMD_OVERRIDE_UNK28 BIT(28)
> +#define AUSPLL_APB_CMD_OVERRIDE_CMD GENMASK(27, 3)
> +
> +#define AUSPLL_FREQ_DESC_A 0x2080
> +#define AUSPLL_FD_FREQ_COUNT_TARGET GENMASK(9, 0)
> +#define AUSPLL_FD_FBDIVN_HALF BIT(10)
> +#define AUSPLL_FD_REV_DIVN GENMASK(13, 11)
> +#define AUSPLL_FD_KI_MAN GENMASK(17, 14)
> +#define AUSPLL_FD_KI_EXP GENMASK(21, 18)
> +#define AUSPLL_FD_KP_MAN GENMASK(25, 22)
> +#define AUSPLL_FD_KP_EXP GENMASK(29, 26)
> +#define AUSPLL_FD_KPKI_SCALE_HBW GENMASK(31, 30)
> +
> +#define AUSPLL_FREQ_DESC_B 0x2084
> +#define AUSPLL_FD_FBDIVN_FRAC_DEN GENMASK(13, 0)
> +#define AUSPLL_FD_FBDIVN_FRAC_NUM GENMASK(27, 14)
> +
> +#define AUSPLL_FREQ_DESC_C 0x2088
> +#define AUSPLL_FD_SDM_SSC_STEP GENMASK(7, 0)
> +#define AUSPLL_FD_SDM_SSC_EN BIT(8)
> +#define AUSPLL_FD_PCLK_DIV_SEL GENMASK(13, 9)
> +#define AUSPLL_FD_LFSDM_DIV GENMASK(15, 14)
> +#define AUSPLL_FD_LFCLK_CTRL GENMASK(19, 16)
> +#define AUSPLL_FD_VCLK_OP_DIVN GENMASK(21, 20)
> +#define AUSPLL_FD_VCLK_PRE_DIVN BIT(22)
> +
> +#define AUSPLL_DCO_EFUSE_SPARE 0x222c
> +#define AUSPLL_RODCO_ENCAP_EFUSE GENMASK(10, 9)
> +#define AUSPLL_RODCO_BIAS_ADJUST_EFUSE GENMASK(14, 12)
> +
> +#define AUSPLL_FRACN_CAN 0x22a4
> +#define AUSPLL_DLL_START_CAPCODE GENMASK(18, 17)
> +
> +#define AUSPLL_CLKOUT_MASTER 0x2200
> +#define AUSPLL_CLKOUT_MASTER_PCLK_DRVR_EN BIT(2)
> +#define AUSPLL_CLKOUT_MASTER_PCLK2_DRVR_EN BIT(4)
> +#define AUSPLL_CLKOUT_MASTER_REFBUFCLK_DRVR_EN BIT(6)
> +
> +#define AUSPLL_CLKOUT_DIV 0x2208
> +#define AUSPLL_CLKOUT_PLLA_REFBUFCLK_DI GENMASK(20, 16)
> +
> +#define AUSPLL_BGR 0x2214
> +#define AUSPLL_BGR_CTRL_AVAIL BIT(0)
> +
> +#define AUSPLL_CLKOUT_DTC_VREG 0x2220
> +#define AUSPLL_DTC_VREG_ADJUST GENMASK(16, 14)
> +#define AUSPLL_DTC_VREG_BYPASS BIT(7)
> +
> +#define AUSPLL_FREQ_CFG 0x2224
> +#define AUSPLL_FREQ_REFCLK GENMASK(1, 0)
> +
> +#define AUS_COMMON_SHIM_BLK_BIAS_REG 0x0a00
> +#define AUS_COMMON_SHIM_BLK_BIAS_REG_BGBIAS_OV BIT(1)
> +
> +#define AUS_COMMON_SHIM_BLK_VREG 0x0a04
> +#define AUS_VREG_TRIM GENMASK(6, 2)
> +
> +#define AUS_COMMON_DIG_RCAL1 0x804
> +#define AUS_COMMON_DIG_RCAL1_ALL_CODES_DONE BIT(0)
> +
> +#define AUS_UNK_A20 0x0a20
> +#define AUS_UNK_A20_TX_CAL_CODE GENMASK(23, 20)
> +
> +#define ACIOPHY_CMN_SHM_STS_REG0 0x0a74
> +#define ACIOPHY_CMN_SHM_STS_REG0_CMD_READY BIT(0)
> +
> +#define CIO3PLL_CLK_CTRL 0x2a00
> +#define CIO3PLL_CLK_PCLK_EN BIT(1)
> +#define CIO3PLL_CLK_REFCLK_EN BIT(5)
> +
> +#define CIO3PLL_DCO_NCTRL 0x2a38
> +#define CIO3PLL_DCO_COARSEBIN_EFUSE0 GENMASK(6, 0)
> +#define CIO3PLL_DCO_COARSEBIN_EFUSE1 GENMASK(23, 17)
> +
> +#define CIO3PLL_FRACN_CAN 0x2aa4
> +#define CIO3PLL_DLL_CAL_START_CAPCODE GENMASK(18, 17)
> +
> +#define CIO3PLL_DTC_VREG 0x2a20
> +#define CIO3PLL_DTC_VREG_ADJUST GENMASK(16, 14)
> +
> +#define ATCPHY_EVT_USB2_CTL 0x0
> +#define ATCPHY_EVT_USB2_CTL_EVT_EN 0x1
> +#define ATCPHY_EVT_USB2_CTL_LOAD_CNT 0x8
> +
> +#define ACIOPHY_CFG0 0x08
> +#define ACIOPHY_CFG0_COMMON_BIG BIT(0)
> +#define ACIOPHY_CFG0_COMMON_BIG_OV BIT(1)
> +#define ACIOPHY_CFG0_COMMON_SMALL BIT(2)
> +#define ACIOPHY_CFG0_COMMON_SMALL_OV BIT(3)
> +#define ACIOPHY_CFG0_COMMON_CLAMP BIT(4)
> +#define ACIOPHY_CFG0_COMMON_CLAMP_OV BIT(5)
> +#define ACIOPHY_CFG0_RX_SMALL_OV GENMASK(9, 8)
> +#define ACIOPHY_CFG0_RX_BIG_OV GENMASK(13, 12)
> +#define ACIOPHY_CFG0_RX_CLAMP_OV GENMASK(17, 16)
> +
> +#define ACIOPHY_CROSSBAR_PROTOCOL GENMASK(4, 0)
> +#define ACIOPHY_CROSSBAR_PROTOCOL_USB4 0x0
> +#define ACIOPHY_CROSSBAR_PROTOCOL_USB4_SWAPPED 0x1
> +#define ACIOPHY_CROSSBAR_PROTOCOL_USB3 0xa
> +#define ACIOPHY_CROSSBAR_PROTOCOL_USB3_SWAPPED 0xb
> +#define ACIOPHY_CROSSBAR_PROTOCOL_USB3_DP 0x10
> +#define ACIOPHY_CROSSBAR_PROTOCOL_USB3_DP_SWAPPED 0x11
> +#define ACIOPHY_CROSSBAR_PROTOCOL_DP 0x14
> +#define ACIOPHY_CROSSBAR_DP_SINGLE_PMA GENMASK(16, 5)
> +#define ACIOPHY_CROSSBAR_DP_SINGLE_PMA_NONE 0x0000
> +#define ACIOPHY_CROSSBAR_DP_SINGLE_PMA_UNK100 0x100
> +#define ACIOPHY_CROSSBAR_DP_SINGLE_PMA_UNK008 0x008
> +#define ACIOPHY_CROSSBAR_DP_BOTH_PMA BIT(17)
> +
> +#define ACIOPHY_LANE_MODE_RX0 GENMASK(2, 0)
> +#define ACIOPHY_LANE_MODE_TX0 GENMASK(5, 3)
> +#define ACIOPHY_LANE_MODE_RX1 GENMASK(8, 6)
> +#define ACIOPHY_LANE_MODE_TX1 GENMASK(11, 9)
> +
> +enum atcphy_lane_mode {
> +	ACIOPHY_LANE_MODE_USB4 = 0,
> +	ACIOPHY_LANE_MODE_USB3 = 1,
> +	ACIOPHY_LANE_MODE_DP = 2,
> +	ACIOPHY_LANE_MODE_OFF = 3,
> +};
> +
> +#define ACIOPHY_TOP_BIST_CIOPHY_CFG1 0x84
> +#define ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN BIT(27)
> +#define ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN BIT(28)
> +
> +#define ACIOPHY_TOP_BIST_OV_CFG 0x8c
> +#define ACIOPHY_TOP_BIST_OV_CFG_LN0_RESET_N_OV BIT(13)
> +#define ACIOPHY_TOP_BIST_OV_CFG_LN0_PWR_DOWN_OV BIT(25)
> +
> +#define ACIOPHY_TOP_BIST_READ_CTRL 0x90
> +#define ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE BIT(2)
> +
> +#define ACIOPHY_TOP_PHY_STAT 0x9c
> +#define ACIOPHY_TOP_PHY_STAT_LN0_UNK0 BIT(0)
> +#define ACIOPHY_TOP_PHY_STAT_LN0_UNK23 BIT(23)
> +
> +#define ACIOPHY_TOP_BIST_PHY_CFG0 0xa8
> +#define ACIOPHY_TOP_BIST_PHY_CFG0_LN0_RESET_N BIT(0)
> +
> +#define ACIOPHY_TOP_BIST_PHY_CFG1 0xac
> +#define ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN GENMASK(13, 10)
> +
> +#define ACIOPHY_BIST_CFG1 0x17000
> +#define ACIOPHY_BIST_CFG1_CLOCK_EN BIT(0)
> +#define ACIOPHY_BIST_CFG1_USB_EN BIT(2)
> +
> +#define ACIOPHY_BIST_CFG2 0x17004
> +#define ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE BIT(2)
> +
> +#define ACIOPHY_BIST_MAC_USBPHY_STATUS2 0x17080
> +#define ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2 BIT(7)
> +
> +#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV1 0x17088
> +#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PIPE_RESET_N_OV 0x100000
> +#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV GENMASK(26, 25)
> +
> +#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV2 0x1708c
> +#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_RESET_N_OV 0x200
> +#define ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_PWR_DOWN_OV 0x20
> +
> +#define ACIOPHY_SLEEP_CTRL 0x1b0
> +#define ACIOPHY_SLEEP_CTRL_TX_BIG_OV GENMASK(3, 2)
> +#define ACIOPHY_SLEEP_CTRL_TX_SMALL_OV GENMASK(7, 6)
> +#define ACIOPHY_SLEEP_CTRL_TX_CLAMP_OV GENMASK(11, 10)
> +
> +#define ACIOPHY_PLL_PCTL_FSM_CTRL1 0x1014
> +#define ACIOPHY_PLL_APB_REQ_OV_SEL GENMASK(21, 13)
> +#define ACIOPHY_PLL_COMMON_CTRL 0x1028
> +#define ACIOPHY_PLL_WAIT_FOR_CMN_READY_BEFORE_RESET_EXIT BIT(24)
> +
> +#define ATCPHY_POWER_CTRL 0x20000
> +#define ATCPHY_POWER_STAT 0x20004
> +#define ATCPHY_POWER_SLEEP_SMALL BIT(0)
> +#define ATCPHY_POWER_SLEEP_BIG BIT(1)
> +#define ATCPHY_POWER_CLAMP_EN BIT(2)
> +#define ATCPHY_POWER_APB_RESET_N BIT(3)
> +#define ATCPHY_POWER_PHY_RESET_N BIT(4)
> +
> +#define ATCPHY_MISC 0x20008
> +#define ATCPHY_MISC_RESET_N BIT(0)
> +#define ATCPHY_MISC_LANE_SWAP BIT(2)
> +
> +#define ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0 0x7000
> +#define DP_PMA_BYTECLK_RESET BIT(0)
> +#define DP_MAC_DIV20_CLK_SEL BIT(1)
> +#define DPTXPHY_PMA_LANE_RESET_N BIT(2)
> +#define DPTXPHY_PMA_LANE_RESET_N_OV BIT(3)
> +#define DPTX_PCLK1_SELECT GENMASK(6, 4)
> +#define DPTX_PCLK2_SELECT GENMASK(9, 7)
> +#define DPRX_PCLK_SELECT GENMASK(12, 10)
> +#define DPTX_PCLK1_ENABLE BIT(13)
> +#define DPTX_PCLK2_ENABLE BIT(14)
> +#define DPRX_PCLK_ENABLE BIT(15)
> +
> +#define ACIOPHY_DP_PCLK_STAT 0x7044
> +#define ACIOPHY_AUSPLL_LOCK BIT(3)
> +
> +#define LN0_AUSPMA_RX_TOP 0x9000
> +#define LN0_AUSPMA_RX_EQ 0xA000
> +#define LN0_AUSPMA_RX_SHM 0xB000
> +#define LN0_AUSPMA_TX_TOP 0xC000
> +#define LN0_AUSPMA_TX_SHM 0xD000
> +
> +#define LN1_AUSPMA_RX_TOP 0x10000
> +#define LN1_AUSPMA_RX_EQ 0x11000
> +#define LN1_AUSPMA_RX_SHM 0x12000
> +#define LN1_AUSPMA_TX_TOP 0x13000
> +#define LN1_AUSPMA_TX_SHM 0x14000
> +
> +#define LN_AUSPMA_RX_TOP_PMAFSM 0x0010
> +#define LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV BIT(0)
> +#define LN_AUSPMA_RX_TOP_PMAFSM_PCS_REQ BIT(9)
> +
> +#define LN_AUSPMA_RX_TOP_TJ_CFG_RX_TXMODE 0x00F0
> +#define LN_RX_TXMODE BIT(0)
> +
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_CTLE_CTRL0 0x00
> +#define LN_TX_CLK_EN BIT(20)
> +#define LN_TX_CLK_EN_OV BIT(21)
> +
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_AFE_CTRL1 0x04
> +#define LN_RX_DIV20_RESET_N_OV BIT(29)
> +#define LN_RX_DIV20_RESET_N BIT(30)
> +
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL2 0x08
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL3 0x0C
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL4 0x10
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL5 0x14
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL6 0x18
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL7 0x1C
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL8 0x20
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL9 0x24
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL10 0x28
> +#define LN_DTVREG_ADJUST GENMASK(31, 27)
> +
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL11 0x2C
> +#define LN_DTVREG_BIG_EN BIT(23)
> +#define LN_DTVREG_BIG_EN_OV BIT(24)
> +#define LN_DTVREG_SML_EN BIT(25)
> +#define LN_DTVREG_SML_EN_OV BIT(26)
> +
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12 0x30
> +#define LN_TX_BYTECLK_RESET_SYNC_CLR BIT(22)
> +#define LN_TX_BYTECLK_RESET_SYNC_CLR_OV BIT(23)
> +#define LN_TX_BYTECLK_RESET_SYNC_EN BIT(24)
> +#define LN_TX_BYTECLK_RESET_SYNC_EN_OV BIT(25)
> +#define LN_TX_HRCLK_SEL BIT(28)
> +#define LN_TX_HRCLK_SEL_OV BIT(29)
> +#define LN_TX_PBIAS_EN BIT(30)
> +#define LN_TX_PBIAS_EN_OV BIT(31)
> +
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13 0x34
> +#define LN_TX_PRE_EN BIT(0)
> +#define LN_TX_PRE_EN_OV BIT(1)
> +#define LN_TX_PST1_EN BIT(2)
> +#define LN_TX_PST1_EN_OV BIT(3)
> +#define LN_DTVREG_ADJUST_OV BIT(15)
> +
> +#define LN_AUSPMA_RX_SHM_TJ_UNK_CTRL14A 0x38
> +#define LN_AUSPMA_RX_SHM_TJ_UNK_CTRL14B 0x3C
> +#define LN_AUSPMA_RX_SHM_TJ_UNK_CTRL15A 0x40
> +#define LN_AUSPMA_RX_SHM_TJ_UNK_CTRL15B 0x44
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16 0x48
> +#define LN_RXTERM_EN BIT(21)
> +#define LN_RXTERM_EN_OV BIT(22)
> +#define LN_RXTERM_PULLUP_LEAK_EN BIT(23)
> +#define LN_RXTERM_PULLUP_LEAK_EN_OV BIT(24)
> +#define LN_TX_CAL_CODE GENMASK(29, 25)
> +#define LN_TX_CAL_CODE_OV BIT(30)
> +
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17 0x4C
> +#define LN_TX_MARGIN GENMASK(19, 15)
> +#define LN_TX_MARGIN_OV BIT(20)
> +#define LN_TX_MARGIN_LSB BIT(21)
> +#define LN_TX_MARGIN_LSB_OV BIT(22)
> +#define LN_TX_MARGIN_P1 GENMASK(26, 23)
> +#define LN_TX_MARGIN_P1_OV BIT(27)
> +#define LN_TX_MARGIN_P1_LSB GENMASK(29, 28)
> +#define LN_TX_MARGIN_P1_LSB_OV BIT(30)
> +
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18 0x50
> +#define LN_TX_P1_CODE GENMASK(3, 0)
> +#define LN_TX_P1_CODE_OV BIT(4)
> +#define LN_TX_P1_LSB_CODE GENMASK(6, 5)
> +#define LN_TX_P1_LSB_CODE_OV BIT(7)
> +#define LN_TX_MARGIN_PRE GENMASK(10, 8)
> +#define LN_TX_MARGIN_PRE_OV BIT(11)
> +#define LN_TX_MARGIN_PRE_LSB GENMASK(13, 12)
> +#define LN_TX_MARGIN_PRE_LSB_OV BIT(14)
> +#define LN_TX_PRE_LSB_CODE GENMASK(16, 15)
> +#define LN_TX_PRE_LSB_CODE_OV BIT(17)
> +#define LN_TX_PRE_CODE GENMASK(21, 18)
> +#define LN_TX_PRE_CODE_OV BIT(22)
> +
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19 0x54
> +#define LN_TX_TEST_EN BIT(21)
> +#define LN_TX_TEST_EN_OV BIT(22)
> +#define LN_TX_EN BIT(23)
> +#define LN_TX_EN_OV BIT(24)
> +#define LN_TX_CLK_DLY_CTRL_TAPGEN GENMASK(27, 25)
> +#define LN_TX_CLK_DIV2_EN BIT(28)
> +#define LN_TX_CLK_DIV2_EN_OV BIT(29)
> +#define LN_TX_CLK_DIV2_RST BIT(30)
> +#define LN_TX_CLK_DIV2_RST_OV BIT(31)
> +
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL20 0x58
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL21 0x5C
> +#define LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22 0x60
> +#define LN_VREF_ADJUST_GRAY GENMASK(11, 7)
> +#define LN_VREF_ADJUST_GRAY_OV BIT(12)
> +#define LN_VREF_BIAS_SEL GENMASK(14, 13)
> +#define LN_VREF_BIAS_SEL_OV BIT(15)
> +#define LN_VREF_BOOST_EN BIT(16)
> +#define LN_VREF_BOOST_EN_OV BIT(17)
> +#define LN_VREF_EN BIT(18)
> +#define LN_VREF_EN_OV BIT(19)
> +#define LN_VREF_LPBKIN_DATA GENMASK(29, 28)
> +#define LN_VREF_TEST_RXLPBKDT_EN BIT(30)
> +#define LN_VREF_TEST_RXLPBKDT_EN_OV BIT(31)
> +
> +#define LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0 0x00
> +#define LN_BYTECLK_RESET_SYNC_EN_OV BIT(2)
> +#define LN_BYTECLK_RESET_SYNC_EN BIT(3)
> +#define LN_BYTECLK_RESET_SYNC_CLR_OV BIT(4)
> +#define LN_BYTECLK_RESET_SYNC_CLR BIT(5)
> +#define LN_BYTECLK_RESET_SYNC_SEL_OV BIT(6)
> +
> +#define LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1 0x04
> +#define LN_TXA_DIV2_EN_OV BIT(8)
> +#define LN_TXA_DIV2_EN BIT(9)
> +#define LN_TXA_DIV2_RESET_OV BIT(10)
> +#define LN_TXA_DIV2_RESET BIT(11)
> +#define LN_TXA_CLK_EN_OV BIT(22)
> +#define LN_TXA_CLK_EN BIT(23)
> +
> +#define LN_AUSPMA_TX_SHM_TXA_IMP_REG0 0x08
> +#define LN_TXA_CAL_CTRL_OV BIT(0)
> +#define LN_TXA_CAL_CTRL GENMASK(18, 1)
> +#define LN_TXA_CAL_CTRL_BASE_OV BIT(19)
> +#define LN_TXA_CAL_CTRL_BASE GENMASK(23, 20)
> +#define LN_TXA_HIZ_OV BIT(29)
> +#define LN_TXA_HIZ BIT(30)
> +
> +#define LN_AUSPMA_TX_SHM_TXA_IMP_REG1 0x0C
> +#define LN_AUSPMA_TX_SHM_TXA_IMP_REG2 0x10
> +#define LN_TXA_MARGIN_OV BIT(0)
> +#define LN_TXA_MARGIN GENMASK(18, 1)
> +#define LN_TXA_MARGIN_2R_OV BIT(19)
> +#define LN_TXA_MARGIN_2R BIT(20)
> +
> +#define LN_AUSPMA_TX_SHM_TXA_IMP_REG3 0x14
> +#define LN_TXA_MARGIN_POST_OV BIT(0)
> +#define LN_TXA_MARGIN_POST GENMASK(10, 1)
> +#define LN_TXA_MARGIN_POST_2R_OV BIT(11)
> +#define LN_TXA_MARGIN_POST_2R BIT(12)
> +#define LN_TXA_MARGIN_POST_4R_OV BIT(13)
> +#define LN_TXA_MARGIN_POST_4R BIT(14)
> +#define LN_TXA_MARGIN_PRE_OV BIT(15)
> +#define LN_TXA_MARGIN_PRE GENMASK(21, 16)
> +#define LN_TXA_MARGIN_PRE_2R_OV BIT(22)
> +#define LN_TXA_MARGIN_PRE_2R BIT(23)
> +#define LN_TXA_MARGIN_PRE_4R_OV BIT(24)
> +#define LN_TXA_MARGIN_PRE_4R BIT(25)
> +
> +#define LN_AUSPMA_TX_SHM_TXA_UNK_REG0 0x18
> +#define LN_AUSPMA_TX_SHM_TXA_UNK_REG1 0x1C
> +#define LN_AUSPMA_TX_SHM_TXA_UNK_REG2 0x20
> +
> +#define LN_AUSPMA_TX_SHM_TXA_LDOCLK 0x24
> +#define LN_LDOCLK_BYPASS_SML_OV BIT(8)
> +#define LN_LDOCLK_BYPASS_SML BIT(9)
> +#define LN_LDOCLK_BYPASS_BIG_OV BIT(10)
> +#define LN_LDOCLK_BYPASS_BIG BIT(11)
> +#define LN_LDOCLK_EN_SML_OV BIT(12)
> +#define LN_LDOCLK_EN_SML BIT(13)
> +#define LN_LDOCLK_EN_BIG_OV BIT(14)
> +#define LN_LDOCLK_EN_BIG BIT(15)
> +
> +#define LN_AUSPMA_TX_TOP_EQ1 0x0050
> +#define LN_AUSPMA_TX_TOP_EQ17 0x00d0
> +#define LN_AUSPMA_TX_TOP_EQ18 0x00d4
> +#define LN_AUSPMA_RX_TOP_EQ1 0x0210
> +#define LN_AUSPMA_RX_TOP_EQ17 0x0244
> +#define LN_AUSPMA_RX_TOP_EQ18 0x0248
> +#define LN_EQ_SWING GENMASK(3, 0)
> +#define LN_EQ_SWING_LSB GENMASK(15, 14)
> +#define LN_EQ_SWING_OV BIT(28)
> +#define LN_EQ_AUTO_CTRL_DP BIT(20)
> +/* Deemphasis and override bits; individual fields unknown */
> +#define LN_EQ_DEEMPH_FIELDS GENMASK(18, 0)
> +
> +#define LN_AUSPMA_TX_SHM_MAIN2 0x0004
> +#define LN_MAIN2_BYTECLK_SYNC_SEL BIT(24)
> +#define LN_MAIN2_BYTECLK_SYNC_SEL_OV BIT(25)
> +#define LN_MAIN2_BYTECLK_SYNC_EN BIT(28)
> +#define LN_MAIN2_BYTECLK_SYNC_EN_OV BIT(29)
> +#define LN_AUSPMA_TX_SHM_MAIN4 0x000c
> +#define LN_MAIN4_DIV2_4_EN GENMASK(25, 24)
> +#define LN_MAIN4_DIV2_4_EN_OV BIT(26)
> +#define LN_AUSPMA_TX_SHM_MAIN5 0x0010
> +#define LN_MAIN5_CLK_EN BIT(9)
> +#define LN_MAIN5_CLK_EN_OV BIT(10)
> +#define LN_AUSPMA_TX_SHM_CLKMON1 0x001c
> +#define LN_CLKMON1_HIZ BIT(22)
> +#define LN_CLKMON1_HIZ_OV BIT(23)
> +#define LN_AUSPMA_TX_SHM_LDOCLK1 0x0044
> +#define LN_LDOCLK1_VREG_ADJ GENMASK(10, 6)
> +#define LN_LDOCLK1_VREF_EN BIT(12)
> +#define LN_LDOCLK1_VREF_FILTER_BOOST (GENMASK(18, 17) | GENMASK(15, 14))
> +#define LN_LDOCLK1_BYPASS_SMALL BIT(20)
> +#define LN_LDOCLK1_BYPASS_BIG BIT(22)
> +#define LN_LDOCLK1_EN_SMALL BIT(24)
> +#define LN_LDOCLK1_EN_BIG BIT(26)
> +
> +#define LN_AUSPMA_RX_TOP_TXMODE 0x0160
> +#define LN_AUSPMA_RX_TOP_AFE1 0x01d4
> +#define LN_AFE1_DIV20_RESET_N_OV BIT(0)
> +#define LN_AFE1_DIV20_RESET_N BIT(1)
> +#define LN_AUSPMA_RX_TOP_DCO1 0x01dc
> +#define LN_DCO1_LPBKIN_RECOVERED_DATA GENMASK(16, 15)
> +
> +#define LN_AUSPMA_RX_SHM_CTLE2 0x0030
> +#define LN_CTLE2_TX_CLK_EN BIT(10)
> +#define LN_CTLE2_TX_CLK_EN_OV BIT(11)
> +#define LN_AUSPMA_RX_SHM_DFE101 0x0064
> +#define LN_DFE101_DFEH1FB_EN BIT(2)
> +#define LN_DFE101_DFEH1FB_EN_OV BIT(3)
> +#define LN_DFE101_DTVREG_ADJUST_FIELDS GENMASK(15, 10)
> +#define LN_AUSPMA_RX_SHM_DFE111 0x0068
> +#define LN_DFE111_DTVREG_BIG_EN BIT(5)
> +#define LN_DFE111_DTVREG_BIG_EN_OV BIT(6)
> +#define LN_DFE111_DTVREG_SMALL_EN BIT(7)
> +#define LN_DFE111_DTVREG_SMALL_EN_OV BIT(8)
> +#define LN_AUSPMA_RX_SHM_DFE121 0x006c
> +#define LN_DFE121_TX_BYTECLK_SYNC_CLR BIT(9)
> +#define LN_DFE121_TX_BYTECLK_SYNC_CLR_OV BIT(10)
> +#define LN_DFE121_TX_BYTECLK_SYNC_EN BIT(11)
> +#define LN_DFE121_TX_HRCLK_SEL BIT(13)
> +#define LN_DFE121_TX_HRCLK_SEL_OV BIT(14)
> +#define LN_DFE121_TX_PBIAS_EN BIT(15)
> +#define LN_DFE121_TX_PBIAS_EN_OV BIT(16)
> +#define LN_AUSPMA_RX_SHM_SAVOS161 0x00a4
> +#define LN_SAVOS161_RXTERM_EN BIT(0)
> +#define LN_SAVOS161_RXTERM_EN_OV BIT(1)
> +#define LN_AUSPMA_RX_SHM_TERM191 0x00a8
> +#define LN_TERM191_TX_TEST_EN BIT(15)
> +#define LN_TERM191_TX_TEST_EN_OV BIT(16)
> +#define LN_TERM191_TX_EN BIT(17)
> +#define LN_TERM191_TX_EN_OV BIT(18)
> +#define LN_TERM191_TX_DIV2_EN GENMASK(20, 19)
> +#define LN_TERM191_TX_DIV2_EN_OV BIT(21)
> +#define LN_TERM191_TX_DIV2_RST BIT(22)
> +#define LN_TERM191_TX_DIV2_RST_OV BIT(23)
> +#define LN_AUSPMA_RX_SHM_VREF221 0x00d4
> +/* Adjust, filter and enable overrides; individual fields unknown */
> +#define LN_VREF221_INIT_FIELDS (GENMASK(20, 16) | GENMASK(12, 7))
> +#define LN_VREF221_BIAS_FIELDS GENMASK(15, 13)
> +#define LN_VREF221_EN BIT(16)
> +#define LN_VREF221_FILTER_ADJUST GENMASK(19, 18)
> +#define LN_AUSPMA_RX_SHM_VREF231 0x00d8
> +#define LN_VREF231_BOOST_CTRL GENMASK(1, 0)
> +#define LN_VREF231_BOOST_CTRL_OV BIT(2)
> +#define LN_AUSPMA_RX_SHM_VREG1 0x00dc
> +#define LN_VREG1_DTVREG_POWER_MODE GENMASK(4, 3)
> +
> +/* LPDPTX registers */
> +#define LPDPTX_AUX_CFG_BLK_AUX_CTRL 0x0000
> +#define LPDPTX_BLK_AUX_CTRL_PWRDN BIT(4)
> +#define LPDPTX_BLK_AUX_RXOFFSET GENMASK(25, 22)
> +
> +#define LPDPTX_AUX_CFG_BLK_AUX_LDO_CTRL 0x0008
> +
> +#define LPDPTX_AUX_CFG_BLK_AUX_MARGIN 0x000c
> +#define LPDPTX_MARGIN_RCAL_RXOFFSET_EN BIT(5)
> +#define LPDPTX_AUX_MARGIN_RCAL_TXSWING GENMASK(10, 6)
> +
> +#define LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG0 0x0204
> +#define LPDPTX_CFG_PMA_AUX_SEL_LF_DATA BIT(15)
> +
> +#define LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG1 0x0208
> +#define LPDPTX_CFG_PMA_PHYS_ADJ GENMASK(22, 20)
> +#define LPDPTX_CFG_PMA_PHYS_ADJ_OV BIT(19)
> +
> +#define LPDPTX_AUX_CONTROL 0x4000
> +#define LPDPTX_AUX_PWN_DOWN 0x10
> +#define LPDPTX_AUX_CLAMP_EN 0x04
> +#define LPDPTX_SLEEP_B_BIG_IN 0x02
> +#define LPDPTX_SLEEP_B_SML_IN 0x01
> +#define LPDPTX_TXTERM_CODEMSB 0x400
> +#define LPDPTX_TXTERM_CODE GENMASK(9, 5)
> +
> +/* pipehandler registers */
> +#define PIPEHANDLER_OVERRIDE 0x00
> +#define PIPEHANDLER_OVERRIDE_RXVALID BIT(0)
> +#define PIPEHANDLER_OVERRIDE_RXDETECT BIT(2)
> +
> +#define PIPEHANDLER_OVERRIDE_VALUES 0x04
> +#define PIPEHANDLER_OVERRIDE_VAL_RXDETECT0 BIT(1)
> +#define PIPEHANDLER_OVERRIDE_VAL_RXDETECT1 BIT(2)
> +#define PIPEHANDLER_OVERRIDE_VAL_PHY_STATUS BIT(4)
> +
> +#define PIPEHANDLER_MUX_CTRL 0x0c
> +#define PIPEHANDLER_MUX_CTRL_CLK GENMASK(5, 3)
> +#define PIPEHANDLER_MUX_CTRL_DATA GENMASK(2, 0)
> +#define PIPEHANDLER_MUX_CTRL_CLK_OFF 0
> +#define PIPEHANDLER_MUX_CTRL_CLK_USB3 1
> +#define PIPEHANDLER_MUX_CTRL_CLK_USB4 2
> +#define PIPEHANDLER_MUX_CTRL_CLK_DUMMY 4
> +
> +#define PIPEHANDLER_MUX_CTRL_DATA_USB3 0
> +#define PIPEHANDLER_MUX_CTRL_DATA_USB4 1
> +#define PIPEHANDLER_MUX_CTRL_DATA_DUMMY 2
> +
> +#define PIPEHANDLER_LOCK_REQ 0x10
> +#define PIPEHANDLER_LOCK_ACK 0x14
> +#define PIPEHANDLER_LOCK_EN BIT(0)
> +
> +#define PIPEHANDLER_AON_GEN 0x1C
> +#define PIPEHANDLER_AON_GEN_DWC3_FORCE_CLAMP_EN BIT(4)
> +#define PIPEHANDLER_AON_GEN_DWC3_RESET_N BIT(0)
> +
> +#define PIPEHANDLER_NONSELECTED_OVERRIDE 0x20
> +#define PIPEHANDLER_NATIVE_RESET BIT(12)
> +#define PIPEHANDLER_DUMMY_PHY_EN BIT(15)
> +#define PIPEHANDLER_NATIVE_POWER_DOWN GENMASK(3, 0)
> +
> +#define PIPEHANDLER_LOCK_ACK_TIMEOUT_US 1000
> +
> +/* USB2 PHY regs */
> +#define USB2PHY_USBCTL 0x00
> +#define USB2PHY_USBCTL_USB_MODE 0x7
> +#define USB2PHY_USBCTL_RUN 2
> +#define USB2PHY_USBCTL_ISOLATION 4
> +
> +#define USB2PHY_CTL 0x04
> +#define USB2PHY_CTL_RESET BIT(0)
> +#define USB2PHY_CTL_PORT_RESET BIT(1)
> +#define USB2PHY_CTL_APB_RESET_N BIT(2)
> +#define USB2PHY_CTL_SIDDQ BIT(3)
> +
> +#define USB2PHY_SIG 0x08
> +#define USB2PHY_SIG_VBUSDET_FORCE_VAL BIT(0)
> +#define USB2PHY_SIG_VBUSDET_FORCE_EN BIT(1)
> +#define USB2PHY_SIG_VBUSVLDEXT_FORCE_VAL BIT(2)
> +#define USB2PHY_SIG_VBUSVLDEXT_FORCE_EN BIT(3)
> +#define USB2PHY_SIG_HOST (7 << 12)
> +
> +#define USB2PHY_MISCTUNE 0x1c
> +#define USB2PHY_MISCTUNE_APBCLK_GATE_OFF BIT(29)
> +#define USB2PHY_MISCTUNE_REFCLK_GATE_OFF BIT(30)

Splitting this already looks much better imho. I think we should be able 
to move many of these register #defines into either of the atc*.c files 
as well.

With that:

Reviewed-by: Sven Peter <sven@kernel.org>


Sven

