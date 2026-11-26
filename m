Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795651349;
	b=bXpeQzodupRrvIdgGC4rRha7LVTpBBmLMwnuUNTSRvREDw5cUUQm8Hj9OVU12hlQD8C3
	 0iM6Y08OJPB/9QrCnE6ePCuMKkhGDHwJzU6OL0RLZcNxob1aPaMyRRF9JmhCczd10L0d6
	 WxFKYzNd1mc82I/ce5ZNXH5QdeuXaL9P/MHVegvK1z2TSFd0/5pOqDQ7dwDQX09wb7gsX
	 wud5Qota/YMdfk4jGfnLDLo+ourW7pCC+21xYF1FAEuecywvcA/ksD2v7gpOmZnqMRVIg
	 /wm4prGfaPaGO7WQobAUH066VsAsAf1Iw7vz5R+mUyyzqyaJNBZaef3V6slrkgnlvYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795651349;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I/EixjgbYCmvAu40Ca3l/UxP84HaWV2V7/oHxjSD+IU=;
	b=j3wqTzMQAtzIJMCkX4VZrov5rxxSmxtLOyOsLPA3HKE3faFzd22ePKyvAnpLlq/FmsZf
	 43CmeVWTh/BZxJ3DnjQ3ICdO1uoGsZKrsyvvQnmkeOW15AdGcaokVVxsS8gnrD922ngVQ
	 v2w3To9sKOzgSFUwDxQDwsWVnzxu0Uo+mYcODASbGK+eD5r0Q7FSaD4grJ3eFNiBiCLlV
	 t5OkyglEed6NoE7IsXQSHyzAFFzMRX9moDG9m0NZATbXdAO7Z1lv+yTYAXLpW/gd/BuL4
	 rxwRvSaA3LuIQ7Vhk7OfxwKCvCc13IsfDhc2PHfAOUIBmHMblC/hrAmludMpuFkBKdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=S8ICm4WG;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T21hNhVp;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E02606A31E
	for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 00:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E02606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=S8ICm4WG;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T21hNhVp
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C4AD57A0564
	for <asahi@lists.linux.dev>; Wed, 25 Nov 2026 19:02:27 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 25 Nov 2026 19:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1795651346; x=1795737746; bh=I/EixjgbYC
	mvAu40Ca3l/UxP84HaWV2V7/oHxjSD+IU=; b=S8ICm4WGdaryIEQYvmDBQmpCZI
	oSWKEP3MFoSFnPun0Mv1x4R1nkXYHZU5NBYeJ45eNbvhADV2Gf5icxxpqWC3yMXw
	RNtZ94ydyYUDSkr7faB7tqUTi+XhIuAFH35tq2CjDBVOxxGklA3ZC8yLDskUwHeW
	fZzYQZANEwaXLoxy4ukmQ1stnoeWIqmTHF+uSyalq+EU50utthgnZi8X13B44maJ
	BqPMyL9VYVFkEKpiMZ2hCLO7AiJTB7NJLe75/rCX6xqyEik9fstv6XfpbR8mOG5k
	S51b2yNkIy/X7G0SimjMHuahPYZLE3ffaWfi4j1kLKdYMCNVVAWv3JnLVoIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795651346; x=1795737746; bh=I/EixjgbYCmvAu40Ca3l/UxP84HaWV2V7/o
	HxjSD+IU=; b=T21hNhVp9Bc6X848OkDfVu3gIZAp6jYa+3NL689lQNIISKPhY2S
	UXiVlJIlQdXj/59o11+kYlXtCda5G+VZXJDy9kRVpF1lIYSWQgFI+UEqAxoy/xPK
	dFJcc+HpaV8XGKiobpwUEZPkW6EYFMAwRuxe8bRu+Aaaa0xm85SNo7Ac9Pd7h2kx
	CiwzPBIhzbjvIGcgk0VU1VHxmFFDwyIhioxtYwD/8lu4if2qWaXdN6ftbaDtxD1h
	GemVeMifKKuUcPOUdBOO1QZPX9zu2qlCUC8nNIjqvg3Q6YFKQE0f1Nf5A4l2dyS0
	cSRE4foS/eGfNNY681gungdRU7yQbEy0GXg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795651346; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=; rt=PGFzYWhpQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm2:rsa-sha256:UBPjDCn2TISH0DOv5Vi0X2bBhBDha+igfsiRMWlK7ooknao
	avITW9zlBDba5qmb+2VrXkziea1JmG9SUS3fTULAmtr46BfII896Lgv0LvdV4FHL
	2jbAm5O4p44T4njvN4cPKQQg32AtXMV8//62xHHXic8iIseEVwI1q5kQd1RbaQLp
	vxW2s0sak05vBGyo2yq8+ZSLbP2Mlhk33RL9LHdCImM4dKadYAOY6wOEoogImaHs
	Lm7+jBkmqVKQc51xQ6QsFA7CLVhHDJTGda5KKMf34WNYgG8FXDT6fIB94zVP8NXb
	Ni6aZUj7QPjhBKOA9UZr9X7UAEG21yws/mIV2xg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tDoPFIFCjv4ScTxj5CcwBl065SRM6O2pki3t/d++sC4=:i0IZr4PdUawSFYOTTZ1/Xh8M6PKNHuLC5AguMyxB5qc=;
X-ME-Sender: <xms:EncHa062zR-iiOGuMhpSaO-os_I1CwJCNpUTmCTrxoGmd_yvqPwjfA>
    <xme:EncHa7H6yEBzpIZTFmPuVVKsdsG6rymeBmh4Q_Lq6p4Js997A6ae-O0LkDLdw_iPC
    yXRwNXISNDEgpdlk2jVviuuXlPC5YCLY65Htpq4E9eRPbfrBUpCgKcz>
X-ME-Received: <xmr:EncHa21LZN8n0T2LKGUZ4eQq_RH_qM1QAp-4GMeGNcZq6p2Tp0QWVOCy1cRLcazdHfpd-7Ag9Rf2ABfeZ0DKo_ci0eOOi56eU90>
X-ME-Proxy-Cause: dmFkZTEVSM8ASemFC/jfZGcg+XGGEZ73WqXseEzCSjHInIleoACRQL39zw1S3aZK2lMqtX
    vZt6n+0xZNOOfcA9tSoqQ5g/B/DDAgKftESrjPFKJxGig4U9Q7p+3VV+xac/O4+EmQ5YP2
    OhGbcF3LQwPiGWvYMTpNcY0Yz63uXKxjxf3ZMaevwX7/z4RftBEJJkCMam45fOqJ1/IY1D
    pFFf4xhCSJNKu4IzPKrJqYvDkrQksQ75kkO3yjlWbC/0yJzbtpyGIzVi+dJStdZpMP+6RQ
    1vo8pZDpACjnoc/b57D0U4DXgURO7fDka8SMXeAn5BzpbjgGEkXTzXhHffj3Ly138tDEnn
    GuC/Qwwyj5dc8p4xbE2MMqRW1wknQpSSoAwNy39lZFrJbHZB6L3erWLRqIVzRoc2ccdyw3
    9xF83V/YrBzzQV4YMGcLPXUT84AkZ3WYbWmhyl2YsVsvcqAMUDG0VjdW2v2jdNnlLyLc2b
    gSJlKms/jV5o/ANGzSU7DoeNcpYhSvtc8SitQFyadnWCjI47HoG1UP9NZY1eZcwO5pxDmO
    JoGK4VUNRangtCDHcjC0ZOdtxNtyT4H9F/iLwyQ3Esk8EgRZFwwKWpGsGPMYhNOgtVgJyc
    4rH1UQvrKAzkx2b+ikjoMkeuWoqQJdLEIppeelAhD9Zmsy0/RfQgQ+P44hag
X-ME-Proxy: <xmx:EncHa4pKEuYSQSiqE3RYlG-FTVfXmkFggfwT4FxoJOiJQYJ4Ti5GXA>
    <xmx:EncHazNMdarQ2Tp0HG-UeTIU_Ilr3Q5N7TJ1E9hWEWgR7_Zk6s8aUA>
    <xmx:EncHa6XDS7Ak4mymMTEoPPwVNAeWup2MvwoIneLb27S2t115JnZuDw>
    <xmx:EncHa2sc4NZf9obmUJfl6KWM91mMFzWQ_bYxU-EGFeHMRpVdl7P4kA>
    <xmx:EncHa_r8u-03JrlxEAbzgwT-JtAjxJeJtp9hcIwFFoTyMc7CogWy-qqO>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 19:02:25 -0500 (EST)
Date: Thu, 26 Nov 2026 01:02:24 +0100
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] phy: apple: atc: Add initial M3 series support
Message-ID: <20261126000224.GD372978@robin.jannau.net>
References: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
 <20261125-t8122-phy-v3-3-196e20b3537e@chaosmail.tech>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125-t8122-phy-v3-3-196e20b3537e@chaosmail.tech>

On Wed, Nov 25, 2026 at 02:11:47PM +0100, Sasha Finkelstein wrote:
> Adds initial support for the new t8122 phy. USB/TB only for now, DP
> will fail to negotiate
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/phy/apple/atc.c | 449 +++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 347 insertions(+), 102 deletions(-)
> 
> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index 45f1280a6faa..68fc93a88f41 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
> @@ -100,9 +100,15 @@
>  #define AUSPLL_FREQ_CFG 0x2224
>  #define AUSPLL_FREQ_REFCLK GENMASK(1, 0)
>  
> +#define AUS_COMMON_SHIM_BLK_BIAS_REG 0x0a00
> +#define AUS_COMMON_SHIM_BLK_BIAS_REG_BGBIAS_OV BIT(1)
> +
>  #define AUS_COMMON_SHIM_BLK_VREG 0x0a04
>  #define AUS_VREG_TRIM GENMASK(6, 2)
>  
> +#define AUS_COMMON_DIG_RCAL1 0x804
> +#define AUS_COMMON_DIG_RCAL1_ALL_CODES_DONE BIT(0)
> +
>  #define AUS_UNK_A20 0x0a20
>  #define AUS_UNK_A20_TX_CAL_CODE GENMASK(23, 20)
>  
> @@ -123,15 +129,23 @@
>  #define CIO3PLL_DTC_VREG 0x2a20
>  #define CIO3PLL_DTC_VREG_ADJUST GENMASK(16, 14)
>  
> +#define ATCPHY_EVT_USB2_CTL 0x0
> +#define ATCPHY_EVT_USB2_CTL_EVT_EN 0x1
> +#define ATCPHY_EVT_USB2_CTL_LOAD_CNT 0x8
> +
>  #define ACIOPHY_CFG0 0x08
> +#define ACIOPHY_CFG0_COMMON_BIG BIT(0)
>  #define ACIOPHY_CFG0_COMMON_BIG_OV BIT(1)
> +#define ACIOPHY_CFG0_COMMON_SMALL BIT(2)
>  #define ACIOPHY_CFG0_COMMON_SMALL_OV BIT(3)
> +#define ACIOPHY_CFG0_COMMON_CLAMP BIT(4)
>  #define ACIOPHY_CFG0_COMMON_CLAMP_OV BIT(5)
>  #define ACIOPHY_CFG0_RX_SMALL_OV GENMASK(9, 8)
>  #define ACIOPHY_CFG0_RX_BIG_OV GENMASK(13, 12)
>  #define ACIOPHY_CFG0_RX_CLAMP_OV GENMASK(17, 16)
>  
> -#define ACIOPHY_CROSSBAR 0x4c
> +#define ACIOPHY_CROSSBAR_T8103 0x4c
> +#define ACIOPHY_CROSSBAR_T8122 0x64
>  #define ACIOPHY_CROSSBAR_PROTOCOL GENMASK(4, 0)
>  #define ACIOPHY_CROSSBAR_PROTOCOL_USB4 0x0
>  #define ACIOPHY_CROSSBAR_PROTOCOL_USB4_SWAPPED 0x1
> @@ -146,7 +160,8 @@
>  #define ACIOPHY_CROSSBAR_DP_SINGLE_PMA_UNK008 0x008
>  #define ACIOPHY_CROSSBAR_DP_BOTH_PMA BIT(17)
>  
> -#define ACIOPHY_LANE_MODE 0x48
> +#define ACIOPHY_LANE_MODE_T8103 0x48
> +#define ACIOPHY_LANE_MODE_T8122 0x60
>  #define ACIOPHY_LANE_MODE_RX0 GENMASK(2, 0)
>  #define ACIOPHY_LANE_MODE_TX0 GENMASK(5, 3)
>  #define ACIOPHY_LANE_MODE_RX1 GENMASK(8, 6)
> @@ -180,6 +195,24 @@ enum atcphy_lane_mode {
>  #define ACIOPHY_TOP_BIST_PHY_CFG1 0xac
>  #define ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN GENMASK(13, 10)
>  
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
>  #define ACIOPHY_SLEEP_CTRL 0x1b0
>  #define ACIOPHY_SLEEP_CTRL_TX_BIG_OV GENMASK(3, 2)
>  #define ACIOPHY_SLEEP_CTRL_TX_SMALL_OV GENMASK(7, 6)
> @@ -463,6 +496,7 @@ enum atcphy_lane_mode {
>  
>  /* USB2 PHY regs */
>  #define USB2PHY_USBCTL 0x00
> +#define USB2PHY_USBCTL_USB_MODE 0x7
>  #define USB2PHY_USBCTL_RUN 2
>  #define USB2PHY_USBCTL_ISOLATION 4
>  
> @@ -556,6 +590,21 @@ struct atcphy_mode_configuration {
>  	bool set_swap;
>  };
>  
> +struct apple_atcphy;
> +
> +struct atcphy_hw {
> +	void (*configure_post_tunable)(struct apple_atcphy *atcphy, enum atcphy_mode mode);
> +	void (*configure_pipehandler_usb3_host)(struct apple_atcphy *atcphy);
> +	void (*configure_usb2_evt_ctl)(struct apple_atcphy *atcphy);
> +	void (*enable_cio3pll_clk)(struct apple_atcphy *atcphy);
> +	int (*wait_rcal1_done)(struct apple_atcphy *atcphy, enum atcphy_mode mode);
> +	void (*configure_lane_pmafsm)(struct apple_atcphy *atcphy,
> +				      const struct atcphy_mode_configuration *mode_cfg);
> +	int aciophy_lane_mode;
> +	int aciophy_crossbar;
> +	bool need_dp_tunables;
> +};
> +
>  /**
>   * struct apple_atcphy - Apple Type-C PHY device struct
>   * @np: Device node pointer
> @@ -566,6 +615,7 @@ struct atcphy_mode_configuration {
>   * @tunables.lane_usb3: USB3 lane-specific tunables
>   * @tunables.lane_dp: DisplayPort lane-specific tunables
>   * @tunables.lane_usb4: USB4 lane-specific tunables
> + * @hw: Hardware version specific data
>   * @mode: Current PHY operating mode
>   * @swap_lanes: True if lanes must be swapped due to cable orientation
>   * @dp_link_rate: DisplayPort link rate
> @@ -599,9 +649,10 @@ struct apple_atcphy {
>  		struct apple_tunable *lane_usb4[2];
>  	} tunables;
>  
> +	const struct atcphy_hw *hw;
>  	enum atcphy_mode mode;
> -	bool swap_lanes;
>  	int dp_link_rate;
> +	bool swap_lanes;
>  	bool pipehandler_up;
>  
>  	struct {
> @@ -983,11 +1034,141 @@ static void atcphy_pipehandler_set_mux(struct apple_atcphy *atcphy, u32 data, u3
>  	udelay(10);
>  }
>  
> -static int atcphy_configure_pipehandler_usb3(struct apple_atcphy *atcphy, bool host)
> +static void atcphy_clear_nonselected_phy_reset(struct apple_atcphy *atcphy)
> +{
> +	/* Clear reset for non-selected USB3 PHY (?) */
> +	mask32(atcphy->regs.pipehandler + PIPEHANDLER_NONSELECTED_OVERRIDE,
> +	       PIPEHANDLER_NATIVE_POWER_DOWN, FIELD_PREP(PIPEHANDLER_NATIVE_POWER_DOWN, 3));
> +	clear32(atcphy->regs.pipehandler + PIPEHANDLER_NONSELECTED_OVERRIDE,
> +		PIPEHANDLER_NATIVE_RESET);
> +}
> +
> +static void atcphy_configure_pipehandler_usb3_host_t8122(struct apple_atcphy *atcphy)
> +{
> +	int ret;
> +	u32 reg;
> +
> +	core_set32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_CLOCK_EN);
> +	/* This should be a mask, but unsure what bits should be cleared */
> +	writel(ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PIPE_RESET_N_OV |
> +	       FIELD_PREP(ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV, 2),
> +	       atcphy->regs.core + ACIOPHY_BIST_MAC_USBPHY_CFG_OV1);
> +	/* This should be a mask, but unsure what bits should be cleared */
> +	writel(ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_RESET_N_OV |
> +	       ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_PWR_DOWN_OV,
> +	       atcphy->regs.core + ACIOPHY_BIST_MAC_USBPHY_CFG_OV2);
> +	core_set32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
> +	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_BIST_CFG1, reg,
> +				 (reg & ACIOPHY_BIST_CFG1_USB_EN), 10, 10000);
> +	if (ret)
> +		dev_warn(atcphy->dev,
> +			 "Timed out waiting for ACIOPHY_BIST_CFG1_USB_EN\n");
> +	core_clear32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
> +	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_BIST_MAC_USBPHY_STATUS2, reg,
> +				 !(reg & ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2),
> +				 10, 10000);
> +	if (ret)
> +		dev_warn(atcphy->dev,
> +			 "Timed out waiting for ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2\n");
> +
> +	core_set32(atcphy, ACIOPHY_BIST_CFG2, ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE);
> +	udelay(10);
> +	core_clear32(atcphy, ACIOPHY_BIST_CFG2, ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE);
> +	core_mask32(atcphy, ACIOPHY_BIST_MAC_USBPHY_CFG_OV1,
> +		    ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV,
> +		    FIELD_PREP(ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV, 3));
> +
> +	/* there is a read and write of ACIOPHY_BIST_MAC_USBPHY_CFG_OV2 here with same values */
> +	udelay(10);
> +	core_set32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
> +	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_BIST_CFG1, reg,
> +				 (reg & ACIOPHY_BIST_CFG1_USB_EN), 10, 10000);
> +	if (ret)
> +		dev_warn(atcphy->dev,
> +			 "Timed out waiting for ACIOPHY_BIST_CFG1_USB_EN 2nd toggle\n");
> +	core_clear32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
> +	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_BIST_MAC_USBPHY_STATUS2, reg,
> +				 !(reg & ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2),
> +				 10, 10000);
> +	if (ret)
> +		dev_warn(atcphy->dev,
> +			 "Timed out waiting for ACIOPHY_BIST_MAC_USBPHY_STATUS2_LN0_PHY_STATUS2 2nd time\n");
> +	core_set32(atcphy, ACIOPHY_BIST_CFG2, ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE);
> +	udelay(10);
> +	core_clear32(atcphy, ACIOPHY_BIST_CFG2, ACIOPHY_BIST_CFG2_LN0_PHY_STATUS_RE);
> +
> +	atcphy_clear_nonselected_phy_reset(atcphy);
> +
> +	core_clear32(atcphy, ACIOPHY_BIST_MAC_USBPHY_CFG_OV2,
> +		     ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_RESET_N_OV |
> +		     ACIOPHY_BIST_MAC_USBPHY_CFG_OV2_LN0_PWR_DOWN_OV);
> +	core_set32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
> +	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_BIST_CFG1, reg,
> +				 (reg & ACIOPHY_BIST_CFG1_USB_EN), 10, 10000);
> +	if (ret)
> +		dev_warn(atcphy->dev,
> +			 "Timed out waiting for ACIOPHY_BIST_CFG1_USB_EN 3rd toggle\n");
> +	core_clear32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_USB_EN);
> +	core_clear32(atcphy, ACIOPHY_BIST_CFG1, ACIOPHY_BIST_CFG1_CLOCK_EN);
> +}
> +
> +static void atcphy_configure_pipehandler_usb3_host_t8103(struct apple_atcphy *atcphy)
>  {
>  	int ret;
>  	u32 reg;
>  
> +	core_set32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG0,
> +		   ACIOPHY_TOP_BIST_PHY_CFG0_LN0_RESET_N);
> +	core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG, ACIOPHY_TOP_BIST_OV_CFG_LN0_RESET_N_OV);
> +	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
> +				 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
> +	if (ret)
> +		dev_warn(atcphy->dev,
> +			 "Timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
> +
> +	core_set32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
> +		   ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
> +	core_clear32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
> +		     ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
> +
> +	core_mask32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG1,
> +		    ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN,
> +		    FIELD_PREP(ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN, 3));
> +
> +	core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG,
> +		   ACIOPHY_TOP_BIST_OV_CFG_LN0_PWR_DOWN_OV);
> +	core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
> +		   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
> +	core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
> +		   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
> +	writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_CIOPHY_CFG1);
> +
> +	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
> +				 (reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK0), 10, 10000);
> +	if (ret)
> +		dev_warn(atcphy->dev,
> +			 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK0\n");
> +
> +	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
> +				 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
> +	if (ret)
> +		dev_warn(atcphy->dev,
> +			 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
> +
> +	atcphy_clear_nonselected_phy_reset(atcphy);
> +
> +	/* More BIST stuff (?) */
> +	writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_OV_CFG);
> +	core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
> +		   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
> +	core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
> +		   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
> +}
> +
> +static int atcphy_configure_pipehandler_usb3(struct apple_atcphy *atcphy, bool host)
> +{
> +	int ret;
> +
>  	ret = atcphy_pipehandler_check(atcphy);
>  	if (ret)
>  		return ret;
> @@ -1012,56 +1193,7 @@ static int atcphy_configure_pipehandler_usb3(struct apple_atcphy *atcphy, bool h
>  		}
>  
>  		/* BIST dance */
> -		core_set32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG0,
> -			   ACIOPHY_TOP_BIST_PHY_CFG0_LN0_RESET_N);
> -		core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG, ACIOPHY_TOP_BIST_OV_CFG_LN0_RESET_N_OV);
> -		ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
> -					 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
> -		if (ret)
> -			dev_warn(atcphy->dev,
> -				 "Timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
> -
> -		core_set32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
> -			   ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
> -		core_clear32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
> -			     ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
> -
> -		core_mask32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG1,
> -			    ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN,
> -			    FIELD_PREP(ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN, 3));
> -
> -		core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG,
> -			   ACIOPHY_TOP_BIST_OV_CFG_LN0_PWR_DOWN_OV);
> -		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
> -			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
> -		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
> -			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
> -		writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_CIOPHY_CFG1);
> -
> -		ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
> -					 (reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK0), 10, 10000);
> -		if (ret)
> -			dev_warn(atcphy->dev,
> -				 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK0\n");
> -
> -		ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
> -					 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
> -		if (ret)
> -			dev_warn(atcphy->dev,
> -				 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
> -
> -		/* Clear reset for non-selected USB3 PHY (?) */
> -		mask32(atcphy->regs.pipehandler + PIPEHANDLER_NONSELECTED_OVERRIDE,
> -		       PIPEHANDLER_NATIVE_POWER_DOWN, FIELD_PREP(PIPEHANDLER_NATIVE_POWER_DOWN, 3));
> -		clear32(atcphy->regs.pipehandler + PIPEHANDLER_NONSELECTED_OVERRIDE,
> -			PIPEHANDLER_NATIVE_RESET);
> -
> -		/* More BIST stuff (?) */
> -		writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_OV_CFG);
> -		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
> -			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
> -		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
> -			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
> +		atcphy->hw->configure_pipehandler_usb3_host(atcphy);
>  	}
>  
>  	/* Configure PIPE mux to USB3 PHY */
> @@ -1183,33 +1315,10 @@ static void atcphy_setup_pipehandler(struct apple_atcphy *atcphy)
>  				   PIPEHANDLER_MUX_CTRL_CLK_DUMMY);
>  }
>  
> -static void atcphy_configure_lanes(struct apple_atcphy *atcphy, enum atcphy_mode mode)
> +static void
> +atcphy_configure_lane_pmafsm_t8103(struct apple_atcphy *atcphy,
> +				   const struct atcphy_mode_configuration *mode_cfg)

Since atcphy_configure_lane_pmafsm_t8103() is called through a function
pointer the diff would be a more readable if the previous
atcphy_configure_lanes() would be split

Janne
