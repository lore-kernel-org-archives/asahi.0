Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41AD45A2A9
	for <asahi@lists.linux.dev>; Wed,  5 Aug 2026 12:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932401; cv=none; b=fN/Cu/wOv5DqWC9tOn6ooJl2YZxZ+KJ70/R78KGFyAgrmh8huaj/kdLYSKEeMcbiiTTGGDzfOIR27W7kOOvR1Ol0PoEPhjkmeMEnzveHvFkqsWwW6VUziTVmN2VCOYR8U8AbQzS+WfTd7cjlFkktt060ePS6/YAUuM1Xcgge8DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932401; c=relaxed/simple;
	bh=n6AInd2UM5Fz/RyODQePkESbPRe229VYW34pSvzW73k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fODbx/Bufk+aPAU1az5u67qEXZrXKrMYh2UiPWtKI/T0fiY8pdmZ/wSkM82UgP0DFzIx7LTgtm3qE3E1e3kBpgMayf9C9GFeT1RmS9NKGOjDqIS4CFbPe+0nTPsF2R2mS5Y1NQOqTfb7jTOoqvmzF3N50uVKGa+lnMCBgdMqy8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=BL2iZNnZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Wc9mHTV8; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="BL2iZNnZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Wc9mHTV8"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id AD3ED1D00169;
	Wed,  5 Aug 2026 08:19:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 05 Aug 2026 08:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785932398; x=1786018798; bh=4Lak8rgV4T
	BA9As436yfX+HrOfQqXF+XbAta7p0a8HE=; b=BL2iZNnZbiYMJb05UD42YfF9C0
	sVUJVTAffXnzIXSp07QQ4H6YaSnm5/PPR8np0OjQ8vGHrvr5/dza6Hophvp2kUsO
	1HehX/r/RH1NHisTpI4yRXpQUbCSufw3MrEXTfInTcFWo3v5odYzy0d5fxsL0t9N
	ZfBzx0QAxVLGtVuxTejV0fF8UxapSQzK8An1BkqU3B5Yx7bfRBjAknMEGknt417c
	YS0I90NLBdUdZMHybaqJsnqsK6asKB72OVWQDcDHGHTr/b9XjobWsJu+U74tBhNs
	41+K4yZJ8w+hMI0wNPPbjJ1yMZzi7iemz0miFSa2m2jM+Mp2LmYyq5GQlMdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785932398; x=1786018798; bh=4Lak8rgV4TBA9As436yfX+HrOfQqXF+XbAt
	a7p0a8HE=; b=Wc9mHTV8RTA6rlj11SYSKx0vebIjjrO0TbBmSNVdQUc+Grj7mEf
	6RxVzBbmkA15iVex4s6LzVLLSgAQF5fItjdBEiI5zk7gxtc+Se47vkrs59OUXHVd
	MnrtlabS7rmENpRuPpJx0rukCytKncVvUxIVdy1aL1wr3KQDc6lAzyk8BeXGhpGk
	deb8oaz1DxlPL3G7DdDWek7UdBb4QTezGvgLYvo/mD2KGr1HeCRnUgSaPo/VeklD
	t5DKSVIXlAsT3hEYQ/vJVOS29FvTLvtj6l3Fo6gss2G4Nq6rnnZplnMcNP28lI9a
	McBbXf39Nwydt+p8E8HCWq5J7mbBgNyasZQ==
X-ME-Sender: <xms:bipzajLxEDZu-eM6UGT6samPD9k-uH0w4p0LLhmjrqMa-yAtc1MLsA>
    <xme:bipzatgcbEbJ1ibnxtZ5qxbun1h4oEfjwQuAodhw8TC0X4VoG71reAVYQ-BgNJlS1
    b_p_t999wjc-AyRRzITp4i6As-1G1aHaoJq4fu-MA3P7VCUlgCs3s3K>
X-ME-Received: <xmr:bipzan95AoJXyfXjS5VOjThoG8944gVNiSN0er5cKgVSnvHmDr9VuSjhIy5oLfNDvfyrU4Quc1sf1P0gTpXoD0d22epczuGmRxM>
X-ME-Proxy-Cause: dmFkZTFGl6m1+z/PGwm1fKYbGgZqV0gceTmb6U6AhknIfhtlGQ7S5oNeKJD8/Pxi0pzdx9
    2jMj0eowvjvKIK/03wsZpu64u0/p2tfyWJZPfTpsU+XQOmB19NlB0EAuYY3xsrvj6KXtl8
    LmlKpJG62gQn6BN22lJCJjMor2+U/WeuhQ2osHRPR/M7v4qcPXPCOqLxryuQEHsrJSx9Ys
    94xfDsTa+1ghXKPorx2iBXoz3HnlHZyjr6bkCJUNftns5yfzJ0G2IKlaChkU2xIeP6W9oi
    FN5OJI113y3Of9XTxHyN3y632/VTr/wfedT+2erMGAD1uwRGNLaFCf0tud93hVEesUEDSP
    ooeU0cGFQPME/+Zg7IGLmpLDGgLzmUpjsvl+YqtdU94VilP/n0m5Z6zQoz4QSM+EHb8U/E
    oOnLiXxum0g8oiKuvcYbLb7ElMNGu9jT49sV7tu+5kJfcATMVAACGLy53A15nwkWkbXcjZ
    KLDuJ03kHg9XMr0oxwwYoBzR14sfy2h61MpjktDhwvWxXJZ2jjVtHS9nfoSPAqGavllssA
    LtJYYiX3FBwjQOm4I+dIPNOmbrsTcsMdkMXXhJLjv/YCEEtrDdkJ/HFJXl+8+B5XZIMOgD
    AwXoHBl3+fwCZP8dUfRKN1xorIjlBYn9yI+S4dRmYHqy3c9xDJb7751vttNQ
X-ME-Proxy: <xmx:bipzaqN0txxLDcl7jTuOlatmQQpWh6PjvjZk9UlI7TtyZ1LdYPWYgQ>
    <xmx:bipzajAmFYbU5RDPU8gmeEqmHHeNKqppE56jv0baOz55WXMZ0IFrHw>
    <xmx:bipzamOuOvkeqvFWUrss1jnzoukGkxpN2U-qps04d81cvfm2yJg05g>
    <xmx:bipzaicV2-3J0NisSg6tfeiZCMi5EKl94JW4FfJRQnmMKtg_k8hnmw>
    <xmx:bipzapuH3B1ubUh1MGFlnSFEBRdwIZQYdR5aIGpE4U2TYG0mERXAvO_p>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 08:19:57 -0400 (EDT)
Date: Wed, 5 Aug 2026 14:19:56 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alba Mendez <me@alba.sh>
Subject: Re: [PATCH v4 4/6] spmi: apple: Implement remaining commands
Message-ID: <20260805121956.GD832571@robin.jannau.net>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
 <20260805-t603x-spmi-v4-4-c15a12d9a7d1@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805-t603x-spmi-v4-4-c15a12d9a7d1@chaosmail.tech>

On Wed, Aug 05, 2026 at 12:11:14PM +0200, Sasha Finkelstein wrote:
> From: Alba Mendez <me@alba.sh>
> 
> Add support for zero write and power management commands

missing dot at the end of the sentence.

> Signed-off-by: Alba Mendez <me@alba.sh>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/spmi/spmi-apple-controller.c | 114 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------
>  1 file changed, 68 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
> index 7ebf899edf17..49827e51e93e 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -46,9 +46,9 @@ struct apple_spmi {
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
> @@ -69,14 +69,14 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
>  	return 0;
>  }
>  
> -static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> -			 u16 saddr, u8 *buf, size_t len)
> +static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +			 u16 param, const u8 *buf, size_t len, u8 *ibuf, size_t ilen)

Instead of two sets of not very distinctive variable names ("buf"/"len",
"ibuf"/ilen") please use just buf/len and a boolean to indicate whether
the command is a read or write if you insists of routing all commands
through a single function. This can be simply added as first condition
in the "while" iterating over the write/read buffers.

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
>  	if (spmi->prev_fail) {
> @@ -86,6 +86,14 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
>  
> +	while (i < len) {
> +		j = min_t(size_t, sizeof(spmi_cmd), len - i);
> +		spmi_cmd = 0;
> +		memcpy(&spmi_cmd, buf + i, j);
> +		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> +		i += j;
> +	}
> +
>  	ret = apple_spmi_wait_rx_not_empty(ctrl);
>  	if (ret)
>  		return ret;
> @@ -93,7 +101,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	reply = readl(spmi->regs + SPMI_RSP_REG);
>  
>  	/* Read SPMI data reply */
> -	while (len_read < len) {
> +	while (len_read < ilen) {
>  		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
>  			spmi->prev_fail = true;
>  			dev_err_ratelimited(&ctrl->dev,
> @@ -101,11 +109,9 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  			return -EIO;
>  		}
>  		rsp = readl(spmi->regs + SPMI_RSP_REG);
> -		i = 0;
> -		while ((len_read < len) && (i < 4)) {
> -			buf[len_read++] = ((0xff << (8 * i)) & rsp) >> (8 * i);
> -			i += 1;
> -		}
> +		i = min_t(size_t, sizeof(spmi_cmd), ilen - len_read);
> +		memcpy(ibuf + len_read, &rsp, i);
> +		len_read += i;
>  	}
>  
>  	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
> @@ -113,54 +119,69 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  		spmi->prev_fail = true;
>  	}
>  
> -	if (~FIELD_GET(SPMI_REPLY_FRAME_PARITY_STATUS, reply) & ((1 << len) - 1)) {
> +	if (!ilen && !FIELD_GET(SPMI_REPLY_ACK, reply)) {
> +		dev_err(&ctrl->dev, "command not acknowledged\n");
> +		return -EIO;
> +	}
> +	if (~FIELD_GET(SPMI_REPLY_FRAME_PARITY_STATUS, reply) & ((1 << ilen) - 1)) {
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
> -	if (spmi->prev_fail) {
> -		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_RSP_REG);
> -		spmi->prev_fail = false;
> -	}
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
> -	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
> -		dev_warn(&ctrl->dev, "FIFO has extra data\n");
> -		spmi->prev_fail = true;
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
> +	return -EINVAL;
> +}
>  
> -	if (!FIELD_GET(SPMI_REPLY_ACK, reply)) {
> -		dev_err(&ctrl->dev, "command not acknowledged\n");
> -		return -EIO;
> +static int spmi_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
> +{
> +	switch (opc) {
> +	case SPMI_CMD_RESET:
> +	case SPMI_CMD_SLEEP:
> +	case SPMI_CMD_SHUTDOWN:
> +	case SPMI_CMD_WAKEUP:
> +		return spmi_raw_cmd_ack(ctrl, opc, sid, 0, NULL, 0);
>  	}
> -	return 0;
> +	return -EINVAL;
>  }
>  
>  static int apple_spmi_probe(struct platform_device *pdev)
> @@ -183,6 +204,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
>  
>  	ctrl->read_cmd = spmi_read_cmd;
>  	ctrl->write_cmd = spmi_write_cmd;
> +	ctrl->cmd = spmi_cmd;
>  
>  	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
>  	if (ret)

looks good otherwise

Janne
