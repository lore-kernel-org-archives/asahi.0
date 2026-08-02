Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6367C3955F9
	for <asahi@lists.linux.dev>; Sun,  2 Aug 2026 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785662351; cv=none; b=eiJ1Jx2mBNcCsutCPPO78HIj+gPt/O27uX01vLBRIF25vEaM6A6XxwCDxhsGVeiD/llEw1UACnOG+fgu1FaIGDKrt8SfZP+6r+agXQuC+wJPdcFzGvwy03Q6s7Z9DGjEw5+LA1Bf/ozj2MXddV68G5bVOIQ7GVHekYyinfe0kUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785662351; c=relaxed/simple;
	bh=5Arqzfev1YUAGg8yMQC2vovq/wBiufkQ44jDNNmByfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ew9rjzvsjAk2FkkUFKQ9uGYjXsMJq1OuyBSdIQYD3WMYDmJKxK4hY8AeXkEeKJpdezD6NLZFdtouv7CAaioCjy4iNppPaExbsUnl6ZNUcysMp7HGvIK75hka+nixGZi0YrYy+vUydzwARp/4uWVRcYBIihjigJkxeiCyBfBjkK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=VvUxUaY7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ALErArKO; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="VvUxUaY7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ALErArKO"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6905B1400155;
	Sun,  2 Aug 2026 05:19:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 02 Aug 2026 05:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785662347; x=1785748747; bh=Ko76THsfnX
	Z043OG9zh/F8AdTxAYTWWKZfq1z6rekAY=; b=VvUxUaY724cssEc/xuev07u9L0
	Xs0MjyrQSrzaxdz2mhPLEe8doVKtUX8OKQ7IFYSRduiYBVyOhFcWoNYeiADM7099
	HdDKUpzZNWNzs3WghBPUl6EKSiRqU/Klv8QkNoWB6BpfQtTP/eNXfLv13bURM2e9
	y10Tclqb8YBJgSfDT3Q5s7eaZxS/jTAa6lic9upPFb3QYsKziDhriTiPYiFl8lfo
	EGoShX9KU+8LkH/E5Lan0/SbNFUPTxKaAclv/KwzgX4tyMSkWcdYDhJ5o7sCnlRj
	pWVjEPuToGj53BjYo0jBeqIevVikGYTiJodtrSfHRVWki/w1GM6Kj17ZYnbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785662347; x=1785748747; bh=Ko76THsfnXZ043OG9zh/F8AdTxAYTWWKZfq
	1z6rekAY=; b=ALErArKORJUpxgnYIQpxQJwFuHBp8WBubOJYhvwxJcivE096fIV
	2VneqUvYjJTao6gy8TBOJ45TW5sE4Clq/CLrzjCEsktDQDR/O7i2MYFDARqQ7/Mo
	VIG5pzqsUN86hMBACfRg+QyQ1EQ8ZymZgJPlfApblTlIR8G2aGEsdo5NsStn0oT1
	IePvjUFmgxYrpNPMgliYrsZqV5HqTx4CyyNYjcFQ7i5YWRtJqusxvCUFCm6I96UK
	oYs3qwK4Ha6XJuVwss7D1Zx7oo3+SqQGUCaLua1+KxDUT8L7fszgCo98ZEqb0Azn
	pF8ObsNHMPSIJer9ydeaaJYEafrNtaWMipQ==
X-ME-Sender: <xms:igtvak5biAlTSpUvtzLPZU0O1OJpucMbiCw3DfRB0Jy68g5woSZlhA>
    <xme:igtvasRyabOKD86Mz-1Vtm3BnLy2DvRPe9FvOUGNx2UkU7QSexKRpJZM8MB6TgUlb
    5jSJOXCs8QoWEWR0x2sgtPvW-tWTNEAw5UK8SC7A6bhFg3kJnHQNn4>
X-ME-Received: <xmr:igtvavsWomI7M2dJruCkBlYusOOlwrH8GYl9CB8plyMlHe-lkZX56-YwV_p5SLfq0ychjlre2sXaE70fQZedLgHkrHEETA-eM-Q>
X-ME-Proxy-Cause: dmFkZTEr8HrNx3Cr5ni6UAa7SmNpYhsyawGdrEF8NEKNgj/AOO9YDh3BTzAEdJ7Jch1tnW
    Qp4K4U3EN0sA/l40npR75Xu2RxqowGvJy08sH0BiJy1S3MBM8gsm/pJmrPtuyrFxSSEvtD
    wwashyBPQ/kP8+Z5TrmoQqsMLmFT2oOI1AYZ59KOxQv432TtjAh7QhK0BoKrNhUM/jyWOu
    TsyOfXGKPXaC9gfJLyauN0sR+3prLnDoPVx/rXeJ1Mq43MR7E4Grdzr6No7SuXb+jkwRAz
    JIxQJvVh+MRaUGm/ZLJpF8or/p/OxLYBDOAGd6YPag0MN+ZHTmP3vnXOSUAjzeg0sjqjon
    BDLeCF6JN0Jtd4GmdBS0kmeWNFqPzclsQaNVmLr4GU3lxD3+N+0+xtjiXmTUg6ErQ/cg4g
    ARAXdztQUihmTfGQ0pi0VqQSioFSEbDlixQNkpZ8O82p9+qpqy3wmAqo87vvr0c1Pwvu44
    fD+YsDxGrWjFgbBPXmJT1cBatyhbAt3OoIjjuyuuuxTl9UWDA3CSdiAdnIiMK5/MPyRSJT
    NTe6hDVvHXOfwqgMRy7+zMj6myo03mejOzAu0hBH+7XbRwmyVdAwGDKjWBU1y1ZrALoQNt
    xoRlD3nbkbRQJz8G8fDdjq0tOxH7HPBPKE0S5PH3lOk3REBR6RDH+kOMxpLA
X-ME-Proxy: <xmx:igtvam_qet7EeQoQzhjG3hM11t7o5lqh9nN8fNfD5-mGunsqkbtxpg>
    <xmx:igtvagyWMyJ7sDkP16FnbUMknMvS7yVcz747MrwIaNGVnBNdvsx5pg>
    <xmx:igtvag_3f7FWSpJuimNZvvvF96eDWBkXtFws8G874znD01R680ovdg>
    <xmx:igtvamOONclzGS6P_V-7opz2Fig2FK6Hbt4EXiP2LgNlplXy5E0pXg>
    <xmx:iwtvapdikZr1oYW0x6nULWS0Q77Y9-tBuuxXsQY7exJtL2eRLmAbEe-b>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 05:19:06 -0400 (EDT)
Date: Sun, 2 Aug 2026 11:19:05 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alba Mendez <me@alba.sh>
Subject: Re: [PATCH v2 2/7] spmi: apple: Validate FIFO state
Message-ID: <20260802091905.GD806854@robin.jannau.net>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-2-f43e5f10e583@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-t603x-spmi-v2-2-f43e5f10e583@chaosmail.tech>

On Tue, Jul 28, 2026 at 11:28:08AM +0200, Sasha Finkelstein wrote:
> From: Alba Mendez <me@alba.sh>
> 
> Check for data before reading the body of a reply, and check for
> end of data afterwards.
> 
> Signed-off-by: Alba Mendez <me@alba.sh>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/spmi/spmi-apple-controller.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
> index 376cf682c43e..b4f442d0b4ad 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -78,6 +78,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  
>  	/* Read SPMI data reply */
>  	while (len_read < len) {
> +		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
> +			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");

this looks like it maybe should use dev_err_ratelimited()

> +			return -EIO;
> +		}
>  		rsp = readl(spmi->regs + SPMI_RSP_REG);
>  		i = 0;
>  		while ((len_read < len) && (i < 4)) {
> @@ -86,6 +90,9 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  		}
>  	}
>  
> +	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
> +		dev_warn(&ctrl->dev, "FIFO has extra data\n");

would it make sense to flush the fifo here to avoid issues on the next
command? I would assume if we don't flush this condition will trigger
for every following command.

> +
>  	return 0;
>  }
>  
> @@ -115,6 +122,9 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	/* Discard */
>  	readl(spmi->regs + SPMI_RSP_REG);
>  
> +	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
> +		dev_warn(&ctrl->dev, "FIFO has extra data\n");

same here

> +
>  	return 0;
>  }

Janne
