Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AF73AE6F3
	for <asahi@lists.linux.dev>; Sun, 23 Aug 2026 19:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514614; cv=none; b=PyBjX+ToEhiV1LJ01ddGMsHFowlbSk3s1rnhOoCHpMxPUwmq7jVD+d3Y/85qZ4jbv+WCXJiywiVLd5dBNDKRrSN3JCXKB6+H2p/Qai211hZKS6NeyFDNwnQq/0eAUbbrVicYeq+3MQEz4cJfjPs8zeQGSsegHwD4d01RFA/AHNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514614; c=relaxed/simple;
	bh=rX+v7xxXwzLAYpmhtlb2z6doTB3XCvraR4aE3uvDS2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dj/BMI38OL8Vq+karp2upWVk23LriuhpSI7mP4+QLwADZKmrLPjpUBwXa8n6xQyTTn8Wgfd8Zc4no73fCQAUcvLd0Y1XP6sO9dx4/PjR2ojC33C3US49xhtX1ym0vUY0kV7AvbGa9tv1T4FzDXlbP3ENPsqjZnW7BiDVHyPc9nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=VZfZauhO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=guCDXltv; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="VZfZauhO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="guCDXltv"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id CE575EC01A5;
	Sun, 23 Aug 2026 15:50:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 23 Aug 2026 15:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1787514609; x=1787601009; bh=pQKnZDxeoh
	OW6VM9kosMPFjb8ePOTXj9OU7E2dBPW+s=; b=VZfZauhOQaHcDD8Lq8LM/pmZRd
	nVazpJ3BCIwRX/Qs6S7KcQ2+vHU9whE6khErzX15mJvKhJNNDR1kHXsnbaIuSr63
	ufMFACxLFA/pGpgb/d0g82CSsnF4C/RYjv2EzPVOLMB2A8kLR4zLLm/wPo54XWV4
	qMqpqTjV3O5x9bXwqHH32eoJOvK8ugiMSQRaTZZrusq9zRJOu7mP+ZdfEvljP0Be
	Z44uCmxynw8U0WxlexsqOw7KHQJC/rnvfhm3H/+h7jNlopWnWIokyxLxeWHswC1s
	j/OM+c6eX8hNxGLzOWFAKPd/33OvACno6Gr5Ama9/JolSXdIjONy5534plNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787514609; x=1787601009; bh=pQKnZDxeohOW6VM9kosMPFjb8ePOTXj9OU7
	E2dBPW+s=; b=guCDXltvLKP7vB0PN4d07t+niTl0JA3Qfc7bREgejZ2KZi7KtC9
	A411G8OJSSoKNah1UOk9uqu48gieBEyy7BwhG40emz1OamaGD/I+zICMh3s1GrXs
	TpDnD737hgaIA7dvmUzG+oPpphL/yV3Ni3SWEJewRk+EKUm+pYtskg0GgvzVzLp9
	ZbOVlsEr3sFXzUD8N5sfMFYx/H9quBr/iwf44FVzQ0YlldFeMUapV3BLylRX3Dhj
	CnnfoMOw9axJRseXi2UmW27pULYWbbVEol37pvxauFlox64mPH10RR3c6r1usBO+
	GBffrMDlgKr8J/0KJh34FTm4qUkdW3kakmg==
X-ME-Sender: <xms:8E6LagQGo4DwS3TBlmbpTE42HpdjKzh9ymQ0Ah0MnwzAVXQHhWyTzA>
    <xme:8E6LaiW7_CKQJRYKjeGpimug3E8_JVZcEegpCj08ztaaWkVawy_qv4XpoZgn5T4VB
    oY7_dEO850_dDmiDMT0WLOFuN9ZsmHUnc3w52meOArWDxM1ly5UNDo>
X-ME-Received: <xmr:8E6Laq9su9Idxv2ABaAxtsxKU71lXplROg2C2JtLbkuCVpqdO8liyuyILsYhPwFQ_JD_6sbBjQ_2x0iSbecH57V_5T_ik_aXExA>
X-ME-Proxy-Cause: dmFkZTEgrk7A58agCDVcNKxfDluB8i4Efx5YmwwxBhKTud2OzRsywHdKffRyobKFKCEKCN
    sFUvmCo4CAyvgWf8Bhyvpt1YqjWK0/zcxoheKuyfThaV90hW6k4ZwLacDrMYlDkYiyNLIH
    JG8iJMtaEI9BE9iq0OnlzxBqW6RC89CZ6zkqicfRmy26QD0sBvT+orAIi6LQJ/VOsMdZaK
    k8mjSks0botyaotjJUIYa1tv1VudpwFM1ueAKcPDNZTnyZbacbxa3+muVRw+J+Ut/nR9Th
    hMxbEidqEtF7AeZ80LvKooHB4sGQ0PeUrfDqXi8IMk0oXfUah52Ah7YzF0p1upWm0ZbOZF
    PcGUpKXYmSm/t3EUE9UPI6snQUdMyiLFe3bXljxhLBx1wum8yHUD+b6gP7Me4egyhjvmvE
    XxjzrW27GaV569oHAqf5U41kIBrB5gwo1EZVQexNzlvIAjd+0AvfBED1odPK+G41dP8tut
    VH1DL69/eYg/xuFZUkC0hYcOkFQ/ahxQPpyZeWuZZhJ4QrYzONfJ3Fjbk0nG1/XxDU7ZoQ
    w9tVPfeZ0ijoneq/kV+dwKh1za6hURDCdyGmB2RaTHrq7njqcy9EDGGWFMWtzIVUqwN6I7
    DJl4p5QPkPE1CkVS7kNu7TBitX44daVRMiTK2nroH5xrJK7xMT25llwNqUgQ
X-ME-Proxy: <xmx:8E6Laq0RglNLJUS8M7oBoAB3bwqZ4Z6C-2bCnZsqHcgpyvuox5AR5A>
    <xmx:8E6LancJ9EIBYVPcOisEWNhOB4i43xgWxfeglfz1K-BBTF8_JoKoNg>
    <xmx:8E6LapCR41oWBXbNDsFgq-cAlDsov___sf5DhW6f5UPzbhHCOxLNyQ>
    <xmx:8E6Lam9-01NBZiS6Y9r7gWfc9ey2GJcGtvqQOv5z8098NlmqwSnj6g>
    <xmx:8U6Laruj9DN9mm4zjg8UOMRpgH4lJrT19_MbtFw5OkN0MGUCz_v865xz>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Aug 2026 15:50:07 -0400 (EDT)
Date: Sun, 23 Aug 2026 21:50:05 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alyssa Milburn <amilburn@zall.org>
Subject: Re: [PATCH v5 2/3] usb: typec: tipd: Factor out i2c specifics
Message-ID: <20260823195005.GA773834@robin.jannau.net>
References: <20260821-tipd-ace3-v5-0-3244ed3bdc3f@chaosmail.tech>
 <20260821-tipd-ace3-v5-2-3244ed3bdc3f@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821-tipd-ace3-v5-2-3244ed3bdc3f@chaosmail.tech>

On Fri, Aug 21, 2026 at 10:26:20AM +0200, Sasha Finkelstein wrote:
> From: Alyssa Milburn <amilburn@zall.org>
> 
> Make the core driver more bus-agnostic to prepare for SPMI variants of
> the tipd chip
> 
> Signed-off-by: Alyssa Milburn <amilburn@zall.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/usb/typec/tipd/Kconfig    |   8 +++--
>  drivers/usb/typec/tipd/Makefile   |  11 ++++---
>  drivers/usb/typec/tipd/core.c     | 230 ++++++++++++++++++++++++-----------------------------------------------------------------------------------------------------------------------
>  drivers/usb/typec/tipd/i2c.c      | 106 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/typec/tipd/tps6598x.h | 123 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 280 insertions(+), 198 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 522f56742aa9..36fccd45858b 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -2085,33 +1950,14 @@ static const struct tipd_data tps25750_data = {
>  	.connect = tps6598x_connect,
>  };
>  
> -static const struct of_device_id tps6598x_of_match[] = {
> -	{ .compatible = "ti,tps6598x", &tps6598x_data},
> -	{ .compatible = "ti,tps66993", &tps66993_data},
> -	{ .compatible = "apple,cd321x", &cd321x_data},
> -	{ .compatible = "ti,tps25750", &tps25750_data},
> -	{}
> -};
> -MODULE_DEVICE_TABLE(of, tps6598x_of_match);
> -
> -static const struct i2c_device_id tps6598x_id[] = {
> -	{ .name = "tps6598x", .driver_data = (kernel_ulong_t)&tps6598x_data },
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(i2c, tps6598x_id);
> -
> -static struct i2c_driver tps6598x_i2c_driver = {
> -	.driver = {
> -		.name = "tps6598x",
> -		.pm = &tps6598x_pm_ops,
> -		.of_match_table = tps6598x_of_match,
> -	},
> -	.probe = tps6598x_probe,
> -	.remove = tps6598x_remove,
> -	.id_table = tps6598x_id,
> +const struct tipd_data *tipd_hw_variants[] = {
> +	[TIPD_VARIANT_CD321X] = &tipd_cd321x_data,
> +	[TIPD_VARIANT_TPS6598X] = &tipd_tps6598x_data,
> +	[TIPD_VARIANT_TPS66993] = &tipd_tps6598x_data,

this should be &tipd_tps66993_data

Janne
