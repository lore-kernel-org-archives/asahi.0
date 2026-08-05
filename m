Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E283E00A5
	for <asahi@lists.linux.dev>; Wed,  5 Aug 2026 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933766; cv=none; b=gUbHG/yYXvInC+hepsPSL9Kq66XgO7BOQeInpQQ+uXtrDPh2yl/mReQopuU2X7iiwCh0D8RUhJLVcwRIkX03+4RlUgWYB6hYk1LLCBJUPXHcZO+KCnkxZ2ASHPj6nnUE5Dsvj3CwSWL6Shz2PR2rSPW0kQg2UvBFlvKoAJH3OUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933766; c=relaxed/simple;
	bh=IZMtOFZuYSKtQzPQdge3XKfgp/SvIMitV0NDmiNAwH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrVL27l1l/Hxf66R7qs76f2i0Gm3FMXTJGPtjkKGtkYlKxPMmHwNjkIGzyVunr1U2wIgDkb1AwpH4ycGb9KpyhWVgNjK6L2Gt8N0WC1LuD6BzzBF1gvF8Z9s7SWjFO7kJ0YU+LYfvmntJ107hGOB1Uqxlop+teSzG6+xup+gwVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=Wn609wNw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E5MYhjxr; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="Wn609wNw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E5MYhjxr"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0DD9B7A00FA;
	Wed,  5 Aug 2026 08:42:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 05 Aug 2026 08:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785933763; x=1786020163; bh=oZnOz+lFli
	wxu36iteUFdBeqSrMjklljgmmUuQxHg8w=; b=Wn609wNwYrrmQbTpcDynhSDStY
	gGIhqdFZVKXCXL4GHJPWXdoYt3hpiRki5LG7bzAgO1atUSbw0+oFrYCqUc4ttBRK
	vKbleun23vO614LjvE/OR60CzgLWEz5u2MNRWd43ib7uH/YT96EGXByxtlT30pK2
	SoZylNZvAgi8QuTCxYEp+jIcTZDyPY71dGOI1EWk+Ef2MsgUgOUSasD8Y9C4M2v6
	XiFNDIUcaP7ZH9nGz/pCEH/dHXu4VESgx945h1zEgXtfasSmiarqXU9pCa5Xq9F+
	PDpgg13lYsV4tOO8zKqSTea2l0ZBrIqyzxoKRQDwUVHyObdIt85XoMCWn/sQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785933763; x=1786020163; bh=oZnOz+lFliwxu36iteUFdBeqSrMjklljgmm
	UuQxHg8w=; b=E5MYhjxrUcVK2oAkqObxw498r1vOURfzBEIp/WH1s3ANcntTDuN
	29RM/xx6pYpyfTrn9VXgl/1rsncTahVBRF4u1KWJITF3ZPKtEeYyiuRYDu9kGZGT
	C0wt1/CrZ2GlfVEV1S+3yhFf4WCMSPqW9scm6cnLk4e6hD2tn8aWECUWv8u0jxac
	7XzfkveUUKNRANVr4qmVu8TKSHh+l5Q0LMWRbGHAh8uFHQdDWiLw7dtwXKeJ59fg
	xQqdkV3hk2oSTFOTZycyIR5F6XG7pkN1+3haO77WVMBmR2/9JivP7cAwtf3x5FAg
	E/yoZWgdH1HCNYeWrIjb/EcCuvaSK3uJpQQ==
X-ME-Sender: <xms:wy9zapadcEE91w-5QNdsCipzADSyEWIuOebks72M9kjL6yXavvCp9Q>
    <xme:wy9zamxbOrcWZNlzMMUTuJPuNCztcPkSmgBJc68b3kj_oa0xXiUmIbY7NcBsyV47u
    qu6frIsGlyiavfpJZf1DxKGdFdfj_gLE0RJVfxJKshhssbW_H84mlQ0>
X-ME-Received: <xmr:wy9zaoMWfN7nNH4txDNj4JIbuK6_FHpg0_9jgeWEfcS8Sl8cgW2yZ-7ZIEWVj1yIb7vFDu3sbvxCJJhmhyhdb38BOAO3crsR9V8>
X-ME-Proxy-Cause: dmFkZTGkxG5+bKB3SVvwZgoKpuZnwcY2RZfLPeIdWuIJyD7KFmMJ6s4R3VeZ77i5duGXQO
    EsOQWVqvA5irAxo5NC3Xj9nfTYjVxuidQN+egJFsdfIEgbKqHRKPBKbm8ES547UdZ6tW4S
    dGoPag4hF4kbmWxjThIh/nTsj33/2K4Uf/bRACCwfRXDB4GyNz5wtpvkmE3q//F6xZSidB
    kJo/xlmOTiqfKf9MLD8mSJay4zOHvlx4vCEIFcjZtji4+1Eeqp9/Ezq5XJETp2oCZyL/ko
    /rJy17Fos2/Vao9ng1D4ervMsHtSMfqVlj+vfrFwK4u7k5i1KLHiC4dJxKTKUdTTVF6MTG
    zOkTHiF0DJ9hTZJBsyLxVHZcbBl/qLMAiE0OYErDdz0U0qgDBdVzLRjYffRz1v37/74uOW
    ZnJB6MaerpnHOXrTn67r87SuS1KbIgIS3ZkHFzSEAtiSsmqVabYjJpdXQrQYSumdyj89ex
    0Ewf+3vk+KecCo2D8VWfchxKNxPG0SsQPfMEJEaETCtnx88csMcNtA1zz3TlfUXnu4zsVc
    Z8frn5Ok71wPCUOtZ8J4kmpMo1WuOIFBBu10KrPV5lwlTMsIbhUThFjfM2Ig9nFWlr66jO
    ML6YXAu8rOPGLpJNCgxGO7lEJbiJ+7TFsg6ELv7qK2tHY8BRcbta5ziViv4A
X-ME-Proxy: <xmx:wy9zalfnQPd3qGvncxghiLSUgPgcyOhB1wVxpn32Ca4B0-6fSBgQaw>
    <xmx:wy9zatS0mOUCYL5UZZObJEDo7hfosVGHwXBpi-N8HG-Ocfu1oAetWg>
    <xmx:wy9zajfClY2GG0mH1c4o76KWC0Ygo_y_u81Md9NNBTpd-jNviycFpA>
    <xmx:wy9zamv-4gu5Slx6nTWSVesn8DLQhnwtyBIqbUYPliS9-pGJb9dg_A>
    <xmx:wy9zah93Ixw5VhaLlJlbXp9_aYuAm0dq5WyRTIPdzRSkWaQUFDP9jF8x>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 08:42:43 -0400 (EDT)
Date: Wed, 5 Aug 2026 14:42:42 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alba Mendez <me@alba.sh>
Subject: Re: [PATCH v4 6/6] spmi: apple: Add interrupt functionality
Message-ID: <20260805124242.GF832571@robin.jannau.net>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
 <20260805-t603x-spmi-v4-6-c15a12d9a7d1@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805-t603x-spmi-v4-6-c15a12d9a7d1@chaosmail.tech>

On Wed, Aug 05, 2026 at 12:11:16PM +0200, Sasha Finkelstein wrote:
> From: Alba Mendez <me@alba.sh>
> 
> Add support for interrupts sent by slave devices and use IRQ for
> RX FIFO if possible, as that IRQ fires as soon as the reply is
> available, which is usually takes a few us instead of the 10ms sleep
> interval for polling

same as for the other changes, better check all of them because I
probably missed that before.

> Signed-off-by: Alba Mendez <me@alba.sh>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/spmi/Kconfig                 |   3 +-
>  drivers/spmi/spmi-apple-controller.c | 254 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 255 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
> index a80cf4047b86..7243863a09b4 100644
> --- a/drivers/spmi/Kconfig
> +++ b/drivers/spmi/Kconfig
> @@ -13,7 +13,8 @@ if SPMI
>  
>  config SPMI_APPLE
>  	tristate "Apple SoC SPMI Controller platform driver"
> -	depends on ARCH_APPLE || COMPILE_TEST
> +	select IRQ_DOMAIN_HIERARCHY
> +	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)
>  	help
>  	  If you say yes to this option, support will be included for the
>  	  SPMI controller present on many Apple SoCs, including the
> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
> index c3bc1f6d5741..7e86d7983fb4 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -13,11 +13,17 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
> +#include <linux/completion.h>
> +#include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqdomain.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> +#include <linux/spinlock.h>
>  #include <linux/spmi.h>
>  
>  /* SPMI Controller Registers */
> @@ -26,6 +32,13 @@
>  #define SPMI_RSP_REG 0x8
>  #define SPMI_ACT_REG 0xa4
>  
> +#define SPMI_IRQ_MASK_BASE 0x20
> +#define SPMI_IRQ_ACK_BASE 0x60
> +#define SPMI_NUM_PERIPHERAL_IRQS 256
> +#define SPMI_NUM_IRQS (SPMI_NUM_PERIPHERAL_IRQS + 32)
> +
> +#define SPMI_IRQ_NOTIFY 256
> +
>  /* SPMI_RSP_REG reply word */
>  #define SPMI_REPLY_FRAME_PARITY_STATUS GENMASK(31, 16)
>  #define SPMI_REPLY_ACK BIT(15)
> @@ -41,6 +54,12 @@
>  struct apple_spmi {
>  	void __iomem *regs;
>  	struct mutex fifo_lock;
> +	struct completion fifo_rx;
> +	struct irq_domain *irqd;
> +	raw_spinlock_t irq_mask_lock;
> +	DECLARE_BITMAP(irq_mask_cache, SPMI_NUM_PERIPHERAL_IRQS);
> +	int irq;
> +	bool notify_irq;
>  	bool prev_fail;
>  };
>  
> @@ -48,6 +67,56 @@ struct apple_spmi {
>  	readl_poll_timeout((spmi)->regs + (reg), (val), (cond), \
>  			   REG_POLL_INTERVAL_US, REG_POLL_TIMEOUT_US)
>  
> +static void apple_spmi_irq_ack_raw(struct apple_spmi *spmi, u32 irq)
> +{
> +	u32 __iomem *reg = spmi->regs + SPMI_IRQ_ACK_BASE + (irq / 32) * 4;
> +
> +	writel(BIT(irq % 32), reg);
> +}
> +
> +static void apple_spmi_irq_mask_raw(struct apple_spmi *spmi, u32 irq)
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
> +static void apple_spmi_irq_ack(struct irq_data *d)
> +{
> +	struct apple_spmi *spmi = irq_data_get_irq_chip_data(d);
> +
> +	apple_spmi_irq_ack_raw(spmi, d->hwirq);
> +}
> +
> +static void apple_spmi_irq_mask(struct irq_data *d)
> +{
> +	struct apple_spmi *spmi = irq_data_get_irq_chip_data(d);
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&spmi->irq_mask_lock, flags);
> +	apple_spmi_irq_mask_raw(spmi, d->hwirq);
> +	clear_bit(d->hwirq, spmi->irq_mask_cache);
> +	raw_spin_unlock_irqrestore(&spmi->irq_mask_lock, flags);
> +}
> +
> +static void apple_spmi_irq_unmask(struct irq_data *d)
> +{
> +	struct apple_spmi *spmi = irq_data_get_irq_chip_data(d);
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&spmi->irq_mask_lock, flags);
> +	set_bit(d->hwirq, spmi->irq_mask_cache);
> +	apple_spmi_irq_unmask_raw(spmi, d->hwirq);
> +	raw_spin_unlock_irqrestore(&spmi->irq_mask_lock, flags);
> +}
> +
>  static inline u32 apple_spmi_pack_cmd(u8 opc, u8 sid, u16 param)
>  {
>  	return opc | sid << 8 | (u32)param << 16 | (1 << 15);
> @@ -60,7 +129,19 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
>  	int ret;
>  	u32 status;
>  
> -	ret = poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_RX_FIFO_EMPTY));
> +	if (spmi->notify_irq) {
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
>  		spmi->prev_fail = true;
>  		dev_err(&ctrl->dev,
> @@ -85,8 +166,10 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  
>  	if (spmi->prev_fail) {
>  		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_RSP_REG);
> +		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_NOTIFY);
>  		spmi->prev_fail = false;
>  	}
> +	reinit_completion(&spmi->fifo_rx);
>  
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
>  
> @@ -188,6 +271,164 @@ static int spmi_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
>  	return -EINVAL;
>  }
>  
> +static int apple_spmi_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +	/* all interrupts have MSI semantics */
> +	return type == IRQ_TYPE_EDGE_RISING ? 0 : -EINVAL;
> +}
> +
> +static struct irq_chip apple_spmi_irq_chip = {
> +	.name = "apple_spmi",
> +	.irq_mask = apple_spmi_irq_mask,
> +	.irq_unmask = apple_spmi_irq_unmask,
> +	.irq_ack = apple_spmi_irq_ack,
> +	.irq_set_type = apple_spmi_irq_set_type,
> +	.flags = IRQCHIP_ONESHOT_SAFE,
> +};
> +
> +static int apple_spmi_irq_domain_map(struct irq_domain *irqd,
> +					unsigned int irq, irq_hw_number_t hw)
> +{
> +	irq_domain_set_info(irqd, irq, hw, &apple_spmi_irq_chip, irqd->host_data,
> +				handle_edge_irq, NULL, NULL);
> +	return 0;
> +}
> +
> +static int apple_spmi_irq_domain_translate(struct irq_domain *irqd,
> +					struct irq_fwspec *fwspec,
> +					unsigned long *hwirq,
> +					unsigned int *type)
> +{
> +	u32 *args = fwspec->param;
> +
> +	if (fwspec->param_count != 2)
> +		return -EINVAL;
> +
> +	if (args[0] >= SPMI_NUM_PERIPHERAL_IRQS)
> +		return -EINVAL;
> +	*hwirq = args[0];
> +	*type = args[1] & IRQ_TYPE_SENSE_MASK;
> +	return 0;
> +}
> +
> +static int apple_spmi_irq_domain_alloc(struct irq_domain *irqd, unsigned int virq,
> +				unsigned int nr_irqs, void *arg)
> +{
> +	unsigned int type = IRQ_TYPE_NONE;
> +	struct irq_fwspec *fwspec = arg;
> +	irq_hw_number_t hwirq;
> +	int i, ret;
> +
> +	ret = apple_spmi_irq_domain_translate(irqd, fwspec, &hwirq, &type);
> +	if (ret)
> +		return ret;
> +
> +	if (hwirq + nr_irqs > SPMI_NUM_PERIPHERAL_IRQS)
> +		return -EINVAL;
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		ret = apple_spmi_irq_domain_map(irqd, virq + i, hwirq + i);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void apple_spmi_irq_domain_free(struct irq_domain *irqd, unsigned int virq,
> +				unsigned int nr_irqs)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		struct irq_data *d = irq_domain_get_irq_data(irqd, virq + i);
> +
> +		irq_set_handler(virq + i, NULL);
> +		irq_domain_reset_irq_data(d);
> +	}
> +}
> +
> +static const struct irq_domain_ops apple_spmi_irq_domain_ops = {
> +	.translate	= apple_spmi_irq_domain_translate,
> +	.alloc		= apple_spmi_irq_domain_alloc,
> +	.free		= apple_spmi_irq_domain_free,
> +};
> +
> +static void apple_spmi_irq_handler(struct irq_desc *desc)
> +{
> +	struct apple_spmi *spmi = irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	bool handled = false;
> +	unsigned long val, offset, bit;
> +
> +	chained_irq_enter(chip, desc);
> +	val = readl(spmi->regs + SPMI_IRQ_ACK_BASE + (SPMI_IRQ_NOTIFY / 32) * 4);
> +	if (val & BIT(SPMI_IRQ_NOTIFY % 32)) {
> +		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_NOTIFY);
> +		complete(&spmi->fifo_rx);
> +		handled = true;
> +	}
> +
> +	for (offset = 0; offset < SPMI_NUM_PERIPHERAL_IRQS / 8; offset += sizeof(val)) {
> +		val = readq(spmi->regs + SPMI_IRQ_ACK_BASE + offset);
> +		/**
> +		 * because of other masters in the bus, we're going to get a multitude of
> +		 * interrupts we're not interested in. irq_resolve_mapping isn't very
> +		 * optimized for the nonexistent path, so instead we mask with (a locally
> +		 * cached version of) the IRQ mask
> +		 */
> +		val &= spmi->irq_mask_cache[offset / sizeof(val)];
> +		for_each_set_bit(bit, &val, 64) {
> +			generic_handle_domain_irq(spmi->irqd, offset * 8 + bit);
> +			handled = true;
> +			val &= ~BIT(bit);

this is no longer necessary

> +		}
> +	}
> +	if (!handled)
> +		handle_bad_irq(desc);
> +	chained_irq_exit(chip, desc);
> +}
> +
> +static void remove_chained_handler(void *data)
> +{
> +	unsigned int irq = (unsigned int)(uintptr_t)data;
> +
> +	irq_set_chained_handler_and_data(irq, NULL, NULL);
> +}
> +
> +static int apple_spmi_init_irq(struct platform_device *pdev,
> +			  struct apple_spmi *spmi, int irq)
> +{
> +	int ret;
> +	struct irq_domain_info info = {
> +		.fwnode		= pdev->dev.fwnode,
> +		.hwirq_max	= ~0U,
> +		.ops		= &apple_spmi_irq_domain_ops,
> +		.host_data	= spmi,
> +	};
> +
> +	raw_spin_lock_init(&spmi->irq_mask_lock);
> +
> +	for (size_t offset = 0; offset < SPMI_NUM_IRQS / 8; offset += 4) {
> +		writel(0, spmi->regs + SPMI_IRQ_MASK_BASE + offset);
> +		writel(U32_MAX, spmi->regs + SPMI_IRQ_ACK_BASE + offset);
> +	}
> +
> +	spmi->irqd = devm_irq_domain_instantiate(&pdev->dev, &info);
> +	if (IS_ERR(spmi->irqd))
> +		return PTR_ERR(spmi->irqd);
> +
> +	spmi->notify_irq = true;
> +	ret = devm_add_action(&pdev->dev, remove_chained_handler, (void *)(uintptr_t)spmi->irq);
> +	if (ret)
> +		return ret;
> +
> +	irq_set_chained_handler_and_data(spmi->irq, apple_spmi_irq_handler, spmi);
> +	apple_spmi_irq_unmask_raw(spmi, SPMI_IRQ_NOTIFY);

logically I'd set spmi->notify_irq only after unmasking it, not that it
matters as the spmi controller isn't registered yet.

> +
> +	return 0;
> +}
> +
>  static int apple_spmi_probe(struct platform_device *pdev)
>  {
>  	struct apple_spmi *spmi;
> @@ -200,6 +441,8 @@ static int apple_spmi_probe(struct platform_device *pdev)
>  
>  	spmi = spmi_controller_get_drvdata(ctrl);
>  	mutex_init(&spmi->fifo_lock);
> +	init_completion(&spmi->fifo_rx);
> +	platform_set_drvdata(pdev, spmi);
>  
>  	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(spmi->regs))
> @@ -211,6 +454,15 @@ static int apple_spmi_probe(struct platform_device *pdev)
>  	ctrl->write_cmd = spmi_write_cmd;
>  	ctrl->cmd = spmi_cmd;
>  
> +	spmi->irq = platform_get_irq_optional(pdev, 0);
> +	if (spmi->irq < 0 && spmi->irq != -ENXIO)
> +		return spmi->irq;
> +	if (spmi->irq >= 0) {
> +		ret = apple_spmi_init_irq(pdev, spmi, spmi->irq);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret,

Reviewed-by: Janne Grunau <j@jannau.net>

thanks, this looks better than the initial version.

Janne
