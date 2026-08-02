Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE95E10785
	for <asahi@lists.linux.dev>; Sun,  2 Aug 2026 11:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785669538; cv=none; b=srpRNC15ZVcanjT5OOS/tTWKsmPFJqvrEAYTTmBqfML2O4Yo9K+4MMKKumanQCfeCrBo4VtswVAQ8YxTHWF9IfGZ5iI+xljZWfTtt8Lh41SW8xp+ljKdPpTCYVih5cPcGXzXDOiS1hjHvfjc9yPVOkaMAOglhrXMrXk/MTPh3Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785669538; c=relaxed/simple;
	bh=ORdmWQQ/abT6swmDCA1ZJ9Sk73YOBwpnF75U8BuMjnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raT0Zf5AljvZXufhbzb7BKQiBVTZXZwd7QSMpejmbXcvC5MNiIs0zsNNt6cn5jmj6Kj7XxNcNxbqTN72ht74lutUinzqs/ptMB4A0T/CZcTx95nGEz8qFXqWbhU1XGQcaD5CxKSsMKGHPYGaeQz7hGXKNeW1U5EzKEmMyaXobhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=NpEMCYdZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lioA2m/b; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="NpEMCYdZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lioA2m/b"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CB92D1400146;
	Sun,  2 Aug 2026 07:18:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sun, 02 Aug 2026 07:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785669535; x=1785755935; bh=N4T6zPehO+
	hI7YbHINYC2+U0zW4QCef9+KZUmysYs/8=; b=NpEMCYdZ3TwLII8uIWNO3NVF66
	v93X+iyxv/foIC9YU9OpHPk5MvpIbhqYJ6sKNSvevP+dVz1OA8OVBWEpW4NASOVK
	L0WluxiNBUuVnpe0Hlv5tkKXZHjxuJbk6QvG+vddKnkYuHie+DrxIrg9JjtYv7C9
	jfFQOIcyb1tpkBDCsTIyGJvlCf1MYfgTknKfYCixIExneM09beIlLSY4hwX+Vp7v
	B7Wdi9hyPn4frLhIhrxRoNWOfFMdQDH23Q9Q5GXCkD1IiiebgXX5Wk3WGse1brQw
	vl5NvnFSWypr2LoU0e8x17IVBJKbEj2TByav84JLCIDUUtTwPI32IWexG/qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785669535; x=1785755935; bh=N4T6zPehO+hI7YbHINYC2+U0zW4QCef9+KZ
	UmysYs/8=; b=lioA2m/bKb5+GjOZSDN9Rv2zU3a8t+UrEkm/3RmATDeROtjdHjw
	kIrY4oBzUyWi9YqBu7BpwXIGLuwMt72DmkGYzZoS0JKqaO6x65MQhKROiYvmDjHa
	qHOGPgeLHpEl0YwzHlUBmhPi8XdmwDfqAy69oQRiIIWcci+pAsT154ywLOL1ZY1n
	sYW/ukkOzmGGgt7HNqGKEsZJ6hOQmA6WXg8fudXDGjUV5eQeZyzL4Ag/DHPkAiLy
	Fnjioj2aUtsTz2OhElF3qY94XP8eJMN0xT5rOvRr59YGRRNdNygELx8Z0JiGKsu0
	+XnufqXQVrVqzwgC7j0x0mQikNgCy2MLXUw==
X-ME-Sender: <xms:nydvaiQ5XJtzIoM9aJPUAogQuO5cAHpBpNEdwYSKg5y6MpmIbBE68g>
    <xme:nydvauIqNTmvfipe7juMBWCDSREuWWp1viIxtDPdsw7foyA_zrkxccD9Fi0w3uNok
    5QnU-pnX0LwpSm8trwem_lLPzD7X3VkHuk7c4jbZ3Jyl4qux0ZRl6tX>
X-ME-Received: <xmr:nydvasFvciE3mysf7ol8vAARDH-SXjwnDj7JykX24mn7GqZRyn4phKPCQDfniwH9DVS5YbDWwrOsWa4O_npUkrOUcZFRaMiJ_4g>
X-ME-Proxy-Cause: dmFkZTEIJqUgXfrT4dZfY/1nXl2Cq2Tg8N0SAszZYsNsi6GiUd4/g++Jzh0qgz53mD7Rcx
    WNKEAcUDCRAy+XdLBH27TnEUyNog2Xgk1/XTMThjE6+ZJ2taccpk3BXF9AbVOOtE7uJD2n
    qqUU+8F5iK0Orgq3k6WyZREq+ZnaStzQOVhQyOHzdcSpB+Aj1/M4o96/9Ej45kRv1JQRHS
    vPc//RUrZpMqt2txL/kq47OZkQITVYwOr7EvllAoWn3bk4FUxbbkYMA15zmShzz+ora1dr
    ow7v8J604Njl8UDZzrWm8Tt/4kDG7O27E5m9PCMvN2N2fqbqiRJeERhZgsg9vH0qZ5HbK4
    1nN9fK4fnxB1EOoggd5mf1AvawFey4ZT9RYuKNXLnQ3G8jTM9nubqz1TKOxKYvq1ga8wR7
    Ca3r4bKnLM70KSUKo7JL5JYjC8b8t82+fEBpGm8CNzyecM5sHQpVvvaRuMpMmVzyUqE2dx
    28Uoz6SQyEKLUIYSlhqFEjnzfZC5Hm0ob1Wj/bD8zPteV3QxzBIcePgChn1fbcws1dQvce
    Z/Dqerh8cAexUE+8K2JV3aX7DLUq7MlwKY3+3hyoz2B0fET5ic85OQ3EfWk1wD8IJ+PRte
    qG+qMBVaFJAOVCzrE01W8orCg+dCeHIzutEnQF7gdWvtrXezj/Kt6G6CRE6g
X-ME-Proxy: <xmx:nydvar2aetf5jBkfMKFJnmDn-PH-oDcmcNqhUDhdYTrA5JcHd-FN9A>
    <xmx:nydvakK7XwspzVrck6oORFYyhS9Cu-VQ_biibNLfQ153OF7kFg2USA>
    <xmx:nydvag1TgsQxdCaaXD6WTvIRhvkDSONlPkIYKAJ0Af_Pd0GKa99D3g>
    <xmx:nydvaontBBKTUToN-iX3rUyX4_WQQmbUEbV2UZ3tejRB6n5atYTy5w>
    <xmx:nydvah3_GG9DeYOMQMCjhHW9qDnkMaEjBHJ8XJ8VQzkPjzgjssnfPUSP>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 07:18:54 -0400 (EDT)
Date: Sun, 2 Aug 2026 13:18:53 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alba Mendez <me@alba.sh>
Subject: Re: [PATCH v2 4/7] spmi: apple: Implement remaining commands
Message-ID: <20260802111853.GF806854@robin.jannau.net>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-4-f43e5f10e583@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-t603x-spmi-v2-4-f43e5f10e583@chaosmail.tech>

On Tue, Jul 28, 2026 at 11:28:10AM +0200, Sasha Finkelstein wrote:
> From: Alba Mendez <me@alba.sh>
> 
> Add support for zero write and power management commands
> 
> Signed-off-by: Alba Mendez <me@alba.sh>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/spmi/spmi-apple-controller.c | 106 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------
>  1 file changed, 68 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
> index 4678a9e5270a..aed18b7df15c 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -41,9 +41,9 @@ struct apple_spmi {
>  	readl_poll_timeout((spmi)->regs + (reg), (val), (cond), \
>  			   REG_POLL_INTERVAL_US, REG_POLL_TIMEOUT_US)
>  
> -static inline u32 apple_spmi_pack_cmd(u8 opc, u8 sid, u16 saddr, size_t len)
> +static inline u32 apple_spmi_pack_cmd(u8 opc, u8 sid, u16 param)
>  {
> -	return opc | sid << 8 | saddr << 16 | (len - 1) | (1 << 15);
> +	return opc | sid << 8 | (u32)param << 16 | (1 << 15);
>  }
>  
>  /* Wait for Rx FIFO to have something */
> @@ -63,18 +63,27 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
>  	return 0;
>  }
>  
> -static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> -			 u16 saddr, u8 *buf, size_t len)
> +static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +			 u16 param, const u8 *buf, size_t len, u8 *ibuf, size_t ilen)
>  {
>  	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
> -	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
> +	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, param);
>  	u32 reply, rsp;
>  	size_t len_read = 0;
> -	u8 i;
> +	size_t i = 0, j;
>  	int ret;
>  
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
>  
> +	while (i < len) {
> +		j = 0;
> +		spmi_cmd = 0;
> +		while ((j < 4) & (i < len))
> +			spmi_cmd |= buf[i++] << (j++ * 8);

		spmi_cmd = 0;
		size_t bytes = min_t(size_t, 4, len - i);
		memcpy(&spmi_cmd, buf + i, bytes);
		i += bytes;

Is easier to read and it's extremely unlikely that this driver will ever
be used on big-endian system.

> +
> +		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> +	}
> +
>  	ret = apple_spmi_wait_rx_not_empty(ctrl);
>  	if (ret)
>  		return ret;
> @@ -82,15 +91,15 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	reply = readl(spmi->regs + SPMI_RSP_REG);
>  
>  	/* Read SPMI data reply */
> -	while (len_read < len) {
> +	while (len_read < ilen) {
>  		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
>  			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
>  			return -EIO;
>  		}
>  		rsp = readl(spmi->regs + SPMI_RSP_REG);
>  		i = 0;
> -		while ((len_read < len) && (i < 4)) {
> -			buf[len_read++] = ((0xff << (8 * i)) & rsp) >> (8 * i);
> +		while ((len_read < ilen) && (i < 4)) {
> +			ibuf[len_read++] = ((0xffU << (8 * i)) & rsp) >> (8 * i);

This could be rewritten with memcpy as well

>  			i += 1;
>  		}
>  	}
> @@ -98,47 +107,67 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,

>  	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
>  		dev_warn(&ctrl->dev, "FIFO has extra data\n");
>  
> -	if ((~reply >> SPMI_REPLY_FRAME_PARITY_OFFSET) & ((1 << len) - 1)) {
> +	if (!ilen && !(reply & SPMI_REPLY_ACK)) {
> +		dev_err(&ctrl->dev, "command not acknowledged\n");
> +		return -EIO;
> +	}
> +	if ((~reply >> SPMI_REPLY_FRAME_PARITY_OFFSET) & ((1 << ilen) - 1)) {

Is the parity check useful for write commands? I'm not sure if packing
all command processing into a single function is a good idea for code
readability. The diff is annoying to read.

>  		dev_err(&ctrl->dev, "some frames failed parity check\n");
>  		return -EIO;
>  	}
>  	return 0;
>  }
>  
> -static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> -			  u16 saddr, const u8 *buf, size_t len)
> +/* Send a raw command with 1..16 input data frames */
> +static int spmi_raw_cmd_input(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +			 u16 param, u8 *buf, size_t len)
>  {
> -	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
> -	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
> -	u32 reply;
> -	size_t i = 0, j;
> -	int ret;
> -
> -	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> +	return spmi_raw_cmd(ctrl, opc, sid, param, NULL, 0, buf, len);
> +}
>  
> -	while (i < len) {
> -		j = 0;
> -		spmi_cmd = 0;
> -		while ((j < 4) & (i < len))
> -			spmi_cmd |= buf[i++] << (j++ * 8);
> +/* Send a raw command with (optional) body and an input ACK */
> +static int spmi_raw_cmd_ack(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +			  u16 param, const u8 *buf, size_t len)
> +{
> +	return spmi_raw_cmd(ctrl, opc, sid, param, buf, len, NULL, 0);
> +}
>  
> -		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> +static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +			 u16 saddr, u8 *buf, size_t len)
> +{
> +	switch (opc) {
> +	case SPMI_CMD_EXT_READ:
> +	case SPMI_CMD_EXT_READL:
> +		return spmi_raw_cmd_input(ctrl, opc | (len - 1), sid, saddr, buf, len);
> +	case SPMI_CMD_READ:
> +		return spmi_raw_cmd_input(ctrl, opc | saddr, sid, saddr, buf, len);
>  	}
> +	return -EINVAL;
> +}
>  
> -	ret = apple_spmi_wait_rx_not_empty(ctrl);
> -	if (ret)
> -		return ret;
> -
> -	reply = readl(spmi->regs + SPMI_RSP_REG);
> -
> -	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
> -		dev_warn(&ctrl->dev, "FIFO has extra data\n");
> -
> -	if (!(reply & SPMI_REPLY_ACK)) {
> -		dev_err(&ctrl->dev, "command not acknowledged\n");
> -		return -EIO;
> +static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +			  u16 saddr, const u8 *buf, size_t len)
> +{
> +	switch (opc) {
> +	case SPMI_CMD_WRITE:
> +		return spmi_raw_cmd_ack(ctrl, opc | saddr, sid, buf[0] << 8 | saddr, NULL, 0);
> +	case SPMI_CMD_ZERO_WRITE:
> +		return spmi_raw_cmd_ack(ctrl, opc | buf[0], sid, buf[0] << 8 | saddr, NULL, 0);
> +	case SPMI_CMD_EXT_WRITE:
> +	case SPMI_CMD_EXT_WRITEL:
> +		return spmi_raw_cmd_ack(ctrl, opc | (len - 1), sid, saddr, buf, len);
>  	}
> -	return 0;
> +	return -EINVAL;
> +}
> +
> +static int spmi_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
> +{
> +	if (
> +		opc == SPMI_CMD_RESET || opc == SPMI_CMD_SLEEP ||
> +		opc == SPMI_CMD_SHUTDOWN || opc == SPMI_CMD_WAKEUP
> +	)

no! a switch like for read/write would be nicer to read but this
formatting is just no.

> +		return spmi_raw_cmd_ack(ctrl, opc, sid, 0, NULL, 0);
> +	return -EINVAL;
>  }
>  
>  static int apple_spmi_probe(struct platform_device *pdev)
> @@ -161,6 +190,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
>  
>  	ctrl->read_cmd = spmi_read_cmd;
>  	ctrl->write_cmd = spmi_write_cmd;
> +	ctrl->cmd = spmi_cmd;
>  
>  	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
>  	if (ret)

Janne
