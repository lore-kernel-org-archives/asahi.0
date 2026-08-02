Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169CB489888
	for <asahi@lists.linux.dev>; Sun,  2 Aug 2026 12:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785672270; cv=none; b=j44wCzH1P4wP8EFIjiyMT46fjy3QsQ4nWIWbJ8UfWwA7Krh26Vi5ectrS4M9W2bHuCoz/13JuIqZqUJPddEYDNI9Fz4k+B4UHMLqQdbjVAqdNh/XaAjX7wziE3pu3sNH8TdrRlYFm9jrFndM4tAQcIZcwll/o5siFt1ZGBM3S0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785672270; c=relaxed/simple;
	bh=xQU1nZSNI7QOnrC5LQhdvxGKNbrGHOk/+3XF925rnbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVKPiIyRa6OU8TYFQV1WkeFvEqlwHnOFoV7dZQpDJ/XVZ3jdxLXraZKfpaMN8gdktkPtPevpmULve2qDcoPgk3U4bLFho8hgcVEypxkpxdRuOQeDILCRL7+Y2D4gjOxmAby3KVx9vHcChH5PuCaHijYF+yyxFEAKoBVjT9+ii5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=e+Y6HvHN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e0VbjcQl; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="e+Y6HvHN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e0VbjcQl"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2151D7A00BF;
	Sun,  2 Aug 2026 08:04:26 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 02 Aug 2026 08:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785672265; x=1785758665; bh=diYLNcpuMh
	zhOnrSzPugSW34yjNtPve7bWx2bHG36KQ=; b=e+Y6HvHNtIbE2kgBXrqD+hN0xg
	330YZ5tUPiXH+LvszEjxLgypYrprY5aohBKK39QsXSDONS/YWI2qzJgm+9bQHFK7
	8UogiLB1QTCyUWb4HnizAY/rGwFegwpBI1NdI9cm+P9qLeAuyCgotN49p+fgwRuE
	FhGNByxKXVuuet4eB+8mnEo2abqIFrv5bL4XmEswUaxxl3vxfRA6JXQ2YWE3Bj70
	M8pXtnan5MRhETYNWHDEXXEcX64rZCdwLJ5yc3JgxOoKSu6wf4CmQBcG7iBtU9ns
	LCh/OASEMcWjjj6+8/YihQKO10hgDwfIeVnqTExitaBPH3ugwBafK0o9o0Vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785672265; x=1785758665; bh=diYLNcpuMhzhOnrSzPugSW34yjNtPve7bWx
	2bHG36KQ=; b=e0VbjcQlmsK4IztIYRq7u6+llVSDL5Hgkl71Pfb2MwqH3OlomXV
	UjoGpr0DYhxTth5VkmQ7KYTkOURjJMgy3iOgtuIMpIPYP5b2qDqFaQ+FmgA4Rrau
	50Ikg6eWB5swoIlxzyjP53UiFI+VIW1CVmKnMIIULVC5wxZgrDFXEJ76EiDTtbwg
	LOl63Tr8InUw527JLXUmRkjcSTVvXSi4NGypiHj68ABbSIaWtauQ5UXea3sbX9LO
	ybPwK53IaD2yDhpfxEz/rmYa+XI1YHoxRYmipayu89WmDm2LLvoxzhlBA0UauRES
	SiUeUptT3SyxRTJfBUkZh+wJ/165BHQDEFQ==
X-ME-Sender: <xms:STJvamoF3GU0WTDZstmxP2hIaI6LnACl3sE9pyQwAaBJOa3qGw0UKA>
    <xme:STJvarAIrkcJ6d04ZmjvuX1RzWIxdjtq704zYHGJmwNa3KwW-0n8QI-eii8fxYyuP
    l-X2jF8wtgAFsASlJpPiZtFrM3u7sjlLjeipPyNREJLAdq3-dFkFdU>
X-ME-Received: <xmr:STJvanf0FwCx8aGX89RjvmMRY3XdoNs4gk_37R6J70KQQqz54LzaaZ-ByuOuLtDFFm5AXG-uFL0iw0FQwsACPHYykfT6erLL8M4>
X-ME-Proxy-Cause: dmFkZTEiKmrs7fdu65ym0jX4JJQFjtNQ6hXZJ0Jtt/Rk/bPBswk3iTpFAUIutkrEJscMjj
    BUqyKJlhwcLuKJd03Kdns9+RbDuhxa/CR+v0Ki8US6eFBw+GSy5YrfGZC9oMW8KauZoj5w
    w9jN8ug5QROr8pjLJGIwzm3tRwGpjxUBsIb1BXHsupRHtvux5BEI7B1WG202Gx31vH8Sis
    wDI1GhgNO342AqClQLz0S9zs0kruz0dFnIac4auixXtX0ewmbwKNUo762NnDdBwkOwidG2
    qhBo+cLJKDDH5l1832Eocrg8bV1iNcSfPadb6bPw3z5nNkjC/PyhV6ajUA602JHOfQzEhY
    lZbwihZ9UHn3OEDHoT1rE7RvCEet6LSR25nyMS9cKNXcRJMypoGUXKdWJC5+uGx0uAvGnb
    IqVgI1m655G/mDbhkRx2natn31IZ78vAumr8WZDJ/KyOdE+akPUen4QB1qy+uDf6F2L6ls
    ChfbWkwp4/Y6XzgVmB2vxuG4Nk4l2f/375kAJuxCw+POKF43DnWleSMrmtvr7NqFQsRkY6
    An/4dLy9cLj62HEbktvYDnczpBCMyCkLIXUBlBrlAaHt5iFhSe/uhXn4cBpeHk6UEsD4Wa
    Zf6ByPhpj43f8MaH62DPl28dwXODf9KtgJkkJ+368BJI1TlRSKSAqiuH54Bw
X-ME-Proxy: <xmx:STJvajug94QKzru-wGhAgrcxyzdJI7QIF40SgDUty1jsgI4MXXn8YQ>
    <xmx:STJvauhFspDkuniToK81RibbX8c2f0cZpTysNm0ftAfWQ2B6Akb6fA>
    <xmx:STJvart_QHZ9pZYpvc_hfR_nsOePC1ppIpPZVSJwFAJB0t6bsCogHQ>
    <xmx:STJvap9HirCpQhzjQCiwRt8FlCXGT1FSuj8ekron8Qqmgry89fmtog>
    <xmx:STJvapN9BFU1EwE2dpxxc--ElWhxRT7DLMZ8etqI_W09uquoM4kbrhtu>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 08:04:24 -0400 (EDT)
Date: Sun, 2 Aug 2026 14:04:23 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alba Mendez <me@alba.sh>
Subject: Re: [PATCH v2 6/7] spmi: apple: use IRQ for RX FIFO if possible
Message-ID: <20260802120423.GH806854@robin.jannau.net>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-6-f43e5f10e583@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-t603x-spmi-v2-6-f43e5f10e583@chaosmail.tech>

On Tue, Jul 28, 2026 at 11:28:12AM +0200, Sasha Finkelstein wrote:
> From: Alba Mendez <me@alba.sh>
> 
> The IRQ fires as soon as the reply is available, which is usually takes
> a few us instead of the 10ms sleep interval for polling
> 
> Signed-off-by: Alba Mendez <me@alba.sh>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/spmi/spmi-apple-controller.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
> index 2cd4ed1803d4..109c5d2c735d 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -11,6 +11,8 @@
>   *		spmi-pmic-arb.c Copyright (c) 2021, The Linux Foundation.
>   */
>  
> +#include <linux/completion.h>
> +#include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> @@ -23,6 +25,12 @@
>  #define SPMI_CMD_REG 0x4
>  #define SPMI_RSP_REG 0x8
>  
> +#define SPMI_IRQ_MASK_BASE 0x20
> +#define SPMI_IRQ_ACK_BASE 0x60
> +#define SPMI_IRQ_USER_SIZE 0x20
> +
> +#define SPMI_IRQ_FIFO_RX 0
> +
>  /* SPMI_RSP_REG reply word */
>  #define SPMI_REPLY_FRAME_PARITY_OFFSET 16
>  #define SPMI_REPLY_ACK BIT(15)
> @@ -37,6 +45,8 @@
>  struct apple_spmi {
>  	void __iomem *regs;
>  	struct mutex fifo_lock;
> +	bool fifo_rx_irq;
> +	struct completion fifo_rx;

please reorder the fields to avoid a hole in the struct

>  };
>  
>  #define poll_reg(spmi, reg, val, cond) \
> @@ -55,7 +65,19 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
>  	int ret;
>  	u32 status;
>  
> -	ret = poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_RX_FIFO_EMPTY));
> +	if (spmi->fifo_rx_irq) {
> +		ret = wait_for_completion_timeout(&spmi->fifo_rx,
> +			usecs_to_jiffies(REG_POLL_TIMEOUT_US));
> +		if (!ret)
> +			ret = -ETIMEDOUT;
> +		else if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)
> +			ret = -EIO;
> +		else
> +			ret = 0;
> +	} else {
> +		ret = poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_RX_FIFO_EMPTY));
> +	}
> +
>  	if (ret) {
>  		dev_err(&ctrl->dev,
>  			"failed to wait for RX FIFO not empty\n");
> @@ -77,6 +99,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  
>  	mutex_lock(&spmi->fifo_lock);
>  
> +	reinit_completion(&spmi->fifo_rx);
> +
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
>  
>  	while (i < len) {
> @@ -181,10 +205,68 @@ static int spmi_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
>  	return -EINVAL;
>  }
>  
> +static void apple_spmi_irq_ack_raw(struct apple_spmi *spmi, u32 irq)
> +{
> +	u32 __iomem *reg = spmi->regs + SPMI_IRQ_ACK_BASE + (irq / 32) * 4;
> +
> +	writel(BIT(irq % 32), reg);
> +}
> +
q> +static void apple_spmi_irq_mask_raw(struct apple_spmi *spmi, u32 irq)
> +{
> +	u32 __iomem *reg = spmi->regs + SPMI_IRQ_MASK_BASE + (irq / 32) * 4;
> +
> +	writel(readl(reg) & ~BIT(irq % 32), reg);
> +}
> +
> +static void apple_spmi_irq_unmask_raw(struct apple_spmi *spmi, u32 irq)
> +{
> +	u32 __iomem *reg = spmi->regs + SPMI_IRQ_MASK_BASE + (irq / 32) * 4;
> +
> +	writel(readl(reg) | BIT(irq % 32), reg);
> +}
> +
> +static irqreturn_t apple_spmi_irq_handler(int irq, void *dev_id)
> +{
> +	struct apple_spmi *spmi = dev_id;
> +	bool handled = false;
> +	u32 val;
> +
> +	val = readl(spmi->regs + SPMI_IRQ_ACK_BASE + SPMI_IRQ_USER_SIZE);
> +	if (val & BIT(SPMI_IRQ_FIFO_RX)) {
> +		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_USER_SIZE * 8 + SPMI_IRQ_FIFO_RX);
> +		complete(&spmi->fifo_rx);
> +		handled = true;
> +	}
> +
> +	return handled ? IRQ_HANDLED : IRQ_NONE;
> +}
> +
> +static int apple_spmi_init_irq(struct platform_device *pdev,
> +			  struct apple_spmi *spmi, int irq)
> +{
> +	int ret;
> +
> +	for (size_t offset = 0; offset < SPMI_IRQ_USER_SIZE + 4; offset += 4) {
> +		writel(0, spmi->regs + SPMI_IRQ_MASK_BASE + offset);
> +		writel(U32_MAX, spmi->regs + SPMI_IRQ_ACK_BASE + offset);
> +	}
> +
> +	spmi->fifo_rx_irq = true;
> +	apple_spmi_irq_unmask_raw(spmi, SPMI_IRQ_USER_SIZE * 8 + SPMI_IRQ_FIFO_RX);

can we use

#define SPMI_NUM_PERIPHERAL_IRQS	256
#define SPMI_NUM_IRQS			(SPMI_NUM_PERIPHERAL_IRQS + 32)

#define SPMI_IRQ_FIFO_RX		256

and get rid of SPMI_IRQ_USER_SIZE?

Janne
