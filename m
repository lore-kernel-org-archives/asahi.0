Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8C945FFA4
	for <asahi@lists.linux.dev>; Wed,  5 Aug 2026 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932717; cv=none; b=fb930dmIxhGiujzrYqCxpjVVQz/MYm5opv3uWr7VJt0+LntWf4hkdmV47XsUp11Ccg9ewBV/Pov+7BSdxK3mn8g7KOYgAOj2YglVD7jvvtOSeQNBSAA7KeC0Taq9nLeYDegPA5+CoMbRRzRG51CkOnzqXxUA47S2DBbFONfS+Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932717; c=relaxed/simple;
	bh=A6sMvxKPGI/8mmjnNL2yS3nWmEBxAp3DoU3t55F/RZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFxXN0PGTTJn+nsBOPRi1Q/KKzpEw03ctvNCFa6RYgjhjVFL7/NvchyjrX1VXtGgWjdxY0kspOVg3ySAIZckfiUdI8cI+cC9cP4G+hrWTQVwf8r0NWMRz0tCgbcwC/VWFMWqFRGuCIG9GHCWzQPTSxEXFLPfNQBiiqcLXOiVMVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=HfBCZ169; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VDm8M7vJ; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="HfBCZ169";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VDm8M7vJ"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 161611D00158;
	Wed,  5 Aug 2026 08:25:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 05 Aug 2026 08:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785932714; x=1786019114; bh=xe1xqqb4wm
	RB4xAVMC4TARIzqxvEi2azDVBZf3BShBc=; b=HfBCZ169EGSh7GJPkVU1i+k2xF
	ozD8t2oeSHhjlVqDRHgJlJvYTFWsNGcunbUeUkfHH3wmNuNFedNukEX+1AVDnHPA
	bgYRTfasSqpX96SjTTzdWiSCRFRmr0z/M1F1t+lp383q3pwTr8xQBBBs/AlFV30C
	Y7uhRbZa6Ovm5gRX3v56dXydCVu2TJbQdM0HCGhfP11pKeyg+zqyX3yoH8z1URD7
	3PsCLxufXe3Zwz6sC0r3dbFCM7ysAribvpOa2K4yXzrhzto9al3+53PTTTbSEpko
	+u94RjKffMz4VkMAssOtNBglA2NLY7mt6YAKyKbf2cus6mynzrnVeXSkM4Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785932714; x=1786019114; bh=xe1xqqb4wmRB4xAVMC4TARIzqxvEi2azDVB
	Zf3BShBc=; b=VDm8M7vJ0wOt6lOdQYmH2WEExyLVScwW37ZcrZdLjrXO74dfroJ
	V54erN0kVRUxwaZb1l7B8ckxXV8x/lEZBqHppNTubzwLv3tXt5OaB0a5M/sgURKZ
	ORlrJs4Jeziy8A3KZ2uUb9Ck2l1p6MX2VENufe/CsT1PKIdopHUB7DLT5WY2PwQn
	LGfmcz/+L96vV27YTEnNAteGQoQK3yX2lx464ZmBWb028oi3z2AQBgP0UgzJgiNL
	kTjUmhKHxiMKDWhoo4NPqCcnK6Gb6yCygPbvvTx2qBYcG0tzMu+xuZJett5vkutu
	PsNmMwKtFA7Z0XyKL+c00d5VwpQMNct7+CQ==
X-ME-Sender: <xms:qitzaoDvXp70Km6zjdtH5ysQ0nFL8Nh-4Mg0-sIiI5sicgSs1O0OTQ>
    <xme:qitzag54A9ZdbwWqDCeBjXulnhiKhz1-gCBa8HECcSa904EnENJvfzFLWTSX3gN2D
    iTcOhB116b1caTX6gfLhI53UcZw2tdA2MH6r07F6AEx1u6s1-Ctsnk>
X-ME-Received: <xmr:qitzan3TLot6am5fXNt1LzGTva60mVsuthY0YszbJ4TtyFi7LZDsgQeftnwwoSPJaNwLoNWgdNlNK4_2wEYr3kzNZF2Z_QrOKGE>
X-ME-Proxy-Cause: dmFkZTFGl6m1+z/PGwm1fKYbGgZqV0gceTmb6U6AhknIfhtlGQ7S5oNeKJD8/Pxi0pzdx9
    2jMj0eowvjvKIK/03wsZpu64u0/p2tfyWJZPfTpsU+XQOmB19NlB0EAuYY3xsrvj6KXtl8
    LmlKpJG62gQn6BN22lJCJjMor2+U/WeuhQ2osHRPR/M7v4qcPXPCOqLxryuQEHsrJSx9Ys
    94xfDsTa+1ghXKPorx2iBXoz3HnlHZyjr6bkCJUNftns5yfzJ0G2IKlaChkU2xIeP6W9oi
    FN5OJI113y3Of9XTxHyN3y632/VTr/wfedT+2erMGAD1uwRGNLaFCf0tud93hVEesUEDQl
    j6u9ZVX8frv0PI9dtPUilUpfQZpou5sI8ilF3okhJ/llmPZPwoBTsHFUkA/xmGbAz0T4QM
    ClxOVZXjNu2SO4iRJLgO48AombdCMNiEaIO0IhiEsMFaIGKV4aPpmqgfMHvdXktWFWZTKx
    ylHZW1Ic9fCEGEbm9oPHmmhXMdq/DHn6+W82spNatJoCTQ8SIpeD479GCL0MEYjZ7ePBQq
    q7Eu9BFRLtTRQQdXsqoOs/4ZQU2oOEVWRmMLV6VbVxdHu97MJxkpzdXPV6Bbg90K1AO3ZI
    racxcGRO1rXqokEzXuydtgQfQT3fpFic6WkoOqK2gHxXnCWe9hhcnLmGcuIA
X-ME-Proxy: <xmx:qitzasn5mxc_CzRRoanNTNkHWPQB5pzNSc4e07J7whemG8JztTVTeg>
    <xmx:qitzal77CVz87gWB5e9f8yt9G3SrgKlxZWNT81DDC_YCk0ZsIMU_XA>
    <xmx:qitzavnGaHST3kfV6SHGYj48HV2Z5N6mu7Tf_THNq1RlxgbFz_Ewzw>
    <xmx:qitzagVR2oiULlyL_TMFPSmI36QEh4gS5DFz0UEY5DwVw56hRCwfEw>
    <xmx:qitzalmIobHBEjbm8KgdKMIa8IgzJ2Ua_xrVDYAYZEScvLf-MHt-SVkG>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 08:25:13 -0400 (EDT)
Date: Wed, 5 Aug 2026 14:25:12 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alba Mendez <me@alba.sh>
Subject: Re: [PATCH v4 5/6] spmi: apple: lock around FIFOs
Message-ID: <20260805122512.GE832571@robin.jannau.net>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
 <20260805-t603x-spmi-v4-5-c15a12d9a7d1@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805-t603x-spmi-v4-5-c15a12d9a7d1@chaosmail.tech>

On Wed, Aug 05, 2026 at 12:11:15PM +0200, Sasha Finkelstein wrote:
> From: Alba Mendez <me@alba.sh>
> 
> The driver was missing locking around register interactions

Missing '.' a the end of the sentence.
 
> Signed-off-by: Alba Mendez <me@alba.sh>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/spmi/spmi-apple-controller.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
> index 49827e51e93e..c3bc1f6d5741 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -16,6 +16,7 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/spmi.h>
>  
> @@ -39,6 +40,7 @@
>  
>  struct apple_spmi {
>  	void __iomem *regs;
> +	struct mutex fifo_lock;
>  	bool prev_fail;
>  };
>  
> @@ -79,6 +81,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	size_t i = 0, j;
>  	int ret;
>  
> +	guard(mutex)(&spmi->fifo_lock);
> +
>  	if (spmi->prev_fail) {
>  		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_RSP_REG);
>  		spmi->prev_fail = false;
> @@ -195,6 +199,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	spmi = spmi_controller_get_drvdata(ctrl);
> +	mutex_init(&spmi->fifo_lock);
>  
>  	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(spmi->regs))

Reviewed-by: Janne Grunau <j@jannau.net>

Janne
