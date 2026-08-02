Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA79939DBCC
	for <asahi@lists.linux.dev>; Sun,  2 Aug 2026 13:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785676064; cv=none; b=QI1LS/8Cj5m1mpgXK5bSEIUyuV8DrmNUOWweV7umGblF3/rnIxZgf6ZeGyl3t07C0vFPNNWkVBSxTjE/drHKh3kbNKYn4nNWskCOz3kTzAEP9t0B1BokkD8vmtd/H61SKT+RUbACiCTjOfzcV97GGMDMkDazDyAoplcvPGqkFB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785676064; c=relaxed/simple;
	bh=Yf4fAt5XDyzb8tifellPz3y8Tlb9wGN57DiBSTGt7QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4tZuKFfSwJBzyRpspLKRVhE7/Xeh+swCysBYWRHaySuvx55cpIC3PIgHYLyOLBgAEuO8Yf6qSAzwhsLfJTcV73eOqWjBIxCkWZDBhi/H7+Uzw6phcMaQtsZAsVp9WykRhbEhLuU9Hur/poTQdXg/AZ1Dm3P2XqGRlMSgLE+0kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=GSPYKlDP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OrJnOwc2; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="GSPYKlDP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OrJnOwc2"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id C2FC41D000B6;
	Sun,  2 Aug 2026 09:07:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 02 Aug 2026 09:07:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785676060; x=1785762460; bh=Hahms3yldK
	OkWTFLp/+wKMoZn0atlREwoTWSL5YtU0g=; b=GSPYKlDPQ/rALF+az/iKEZcb/P
	nZlGWoUo3Skb3dF4cuS8F0lcLFFbdqNDB/Uje7kR8lT2Cejjfy2B0f2lfRi0fjt5
	zHykUpeSsoS7ZRJ/TdaRy6CKBZuP0c2aJJ4s2OQm9v4RqnAm8od4aaM64pAHcpXv
	nXQO6OVSQx6d6hHjFAzxKZdUEJ6J/xjd1TKpcagGfGW8nNlq+9WcKi3ep5d3mOnO
	r5GT5MqT+AFxvX9nyIYKaPZZCIMV+ECiYXfv/lJHwZLHfZi5mbQ9ydACuZMsY26x
	s6VsgAXmq+uuFCJRlA2ikZbH/ReUFfVPWSGNM0iT9ddow5QVOkIL8advhoXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785676060; x=1785762460; bh=Hahms3yldKOkWTFLp/+wKMoZn0atlREwoTW
	SL5YtU0g=; b=OrJnOwc2XAY8Q4A+h7wN0do6SifUiN3GLg8S38RbzZLhT1Adeuy
	2lRJaKTw1z6NhmyYOlkfLjfBrDZXrrO1pJIkH6z+ye2O1m7xxI/CNWn3VHoiNyFy
	EPhrTBJSU5VBJn0D7pslpLHM+MWdG2zas5JLdm9PqD692lodSeY02OPVtADDcg7t
	xrlKj3be8pLFKi62aL47kU9xny8kWZcWfg1RDLLimBsqsGceaxhK/FJ84Isyn4a6
	1NmTSk825AbEErLkdd8gpLUy3I13jRCIzRTmgGw7awrOhJflrHdhWkNJq1n5PfLc
	STLBRoBk6zJXhiA8AqqsoLCXbKjPHMY84uA==
X-ME-Sender: <xms:G0FvaoSAMqyThlXg70RAYWuIk6FS9Vn5-woyrxrLF5q2vagaPqpoeg>
    <xme:G0FvasLOEfVrh4NW8bxzU_SF-30H1e4SiB9TgkRWo4y8g3D_v25VyRfGTgGD-WsNS
    rgYKdfje0Tu8cDE4SGzMSTwcxng7o_b-aM1DyOYKF086YZGxynhPDg>
X-ME-Received: <xmr:G0FvaiF2H6wQCXW0MDuPijubhrEIarWzIkfuAGEb6btZDE8HmtaaU6mTrq6-C9mbIaLciJCmfcafkfPQ5N7DymVid23U5wAtNeg>
X-ME-Proxy-Cause: dmFkZTGRptFzAe674taAifhe2SZpN3XqmCoEUW/CYHNtqMMFWpbCOWQ2Hu21zkhtN+Bl0V
    A97rHeChrE4bk+9WfJBbqLsuVElNpY6I+EP04EYbnN3cuROOLkGqyD4bwodEUIq7ULqLBl
    uCh2XSiyha0lPAaV4kIwQjP98E/OVRz4BYu+CeyWFzrdmspReHFfmZj+S+UfT9TBAU/WOb
    AXfdpNRqXZcxr/NgKEz0NpD0C2Rt1lrCVUrdVuGFWldcGOCQbJ2Wxdw09h5cHqqhkbbpvy
    wk1I2y9OU2bH07VFjeZxgB5zUfzy20R8aQRwHs498L00KSdAFff7bCzzVkOeH1nS/vYZMo
    vcsTlrjZvUN+BMt8L7NVgGGwcpJQirOEpFVL8DQuwBXtObMZlHPCNjWsu+pRFYOmGZtQ5s
    mqkdE7L5tjEdcvSQqWitLUkaUKem5GJPnJdjTcw0ENzxqz9QYJ8BKVlVd6TNwZVF0dYY6V
    ia2+VotCSYtVL4p/looqV5KpGi1AIkhBLhPSY0++f/nk142TiuJanSKu+2gRoGtFopfz8/
    6HOApvCpkzE2YAOiqTn3CNpvk8eGQeE20v4MSPsfPmTMyMqDZou6CFopkQ3QmELCfOjRrn
    iBwvCNKDa5jEMSBAyLg893oFnv9nqhpfqcE5OVzyVF9toUmR9FZ7dcB26p9Q
X-ME-Proxy: <xmx:G0Fvap2RYHe3WA6sB_BJgsTIXFANYzEGpSrbFagVj0lnEBMDBoGykg>
    <xmx:G0FvaqIYl5IiTMZQdD_1Oc3MdD_IcL0U2jIhz5w4qnTrOukb3c3fIw>
    <xmx:G0Fvau1UeWlcBbcHOwb0NVLH1Gm7MmHKVH0LNNSbbwwZBxSX5I2IBA>
    <xmx:G0Fvaun5XzW1p52jaIGzq6Whh_rNB7XQAmYH_VpEjyKryEBSZZXGsw>
    <xmx:HEFvan2BHlHVohB6skNxHW8iTiO14Clcrh8cJxPUIYTwyKYbjyRUk6Nn>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 09:07:39 -0400 (EDT)
Date: Sun, 2 Aug 2026 15:07:38 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alba Mendez <me@alba.sh>
Subject: Re: [PATCH v2 7/7] spmi: apple: interrupt controller functionality
Message-ID: <20260802130738.GI806854@robin.jannau.net>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-7-f43e5f10e583@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-t603x-spmi-v2-7-f43e5f10e583@chaosmail.tech>

On Tue, Jul 28, 2026 at 11:28:13AM +0200, Sasha Finkelstein wrote:
> From: Alba Mendez <me@alba.sh>
> 
> Add support for interrupts sent by slave devices.
> 
> Signed-off-by: Alba Mendez <me@alba.sh>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/spmi/Kconfig                 |   3 ++-
>  drivers/spmi/spmi-apple-controller.c | 149 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 150 insertions(+), 2 deletions(-)
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
> index 109c5d2c735d..8f6a0d560da8 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -15,9 +15,12 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> +#include <linux/spinlock.h>
>  #include <linux/spmi.h>
>  
>  /* SPMI Controller Registers */
> @@ -47,6 +50,9 @@ struct apple_spmi {
>  	struct mutex fifo_lock;
>  	bool fifo_rx_irq;
>  	struct completion fifo_rx;
> +	struct irq_domain *irqd;
> +	raw_spinlock_t irq_mask_lock;
> +	u64 irq_mask_cache[SPMI_IRQ_USER_SIZE / sizeof(u64)];

this could be a bitmap to avoid the manual bit manipulations

>  };
>  
>  #define poll_reg(spmi, reg, val, cond) \
> @@ -226,11 +232,123 @@ static void apple_spmi_irq_unmask_raw(struct apple_spmi *spmi, u32 irq)
>  	writel(readl(reg) | BIT(irq % 32), reg);
>  }
>  
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
> +	spmi->irq_mask_cache[d->hwirq / 64] &= ~BIT_ULL(d->hwirq % 64);
> +	raw_spin_unlock_irqrestore(&spmi->irq_mask_lock, flags);
> +}
> +
> +static void apple_spmi_irq_unmask(struct irq_data *d)
> +{
> +	struct apple_spmi *spmi = irq_data_get_irq_chip_data(d);
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&spmi->irq_mask_lock, flags);
> +	apple_spmi_irq_unmask_raw(spmi, d->hwirq);
> +	spmi->irq_mask_cache[d->hwirq / 64] |= BIT_ULL(d->hwirq % 64);
> +	raw_spin_unlock_irqrestore(&spmi->irq_mask_lock, flags);
> +}
> +
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
> +	if (args[0] >= SPMI_IRQ_USER_SIZE * 8)
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
> +	if (hwirq + nr_irqs > SPMI_IRQ_USER_SIZE * 8)
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
>  static irqreturn_t apple_spmi_irq_handler(int irq, void *dev_id)
>  {
>  	struct apple_spmi *spmi = dev_id;
>  	bool handled = false;
> -	u32 val;
> +	u64 val, offset, bit;

use unsigned long for bitmap compat, rest may remain as is since the
driver now depends on 64BIT
>  
>  	val = readl(spmi->regs + SPMI_IRQ_ACK_BASE + SPMI_IRQ_USER_SIZE);
>  	if (val & BIT(SPMI_IRQ_FIFO_RX)) {
> @@ -239,6 +357,23 @@ static irqreturn_t apple_spmi_irq_handler(int irq, void *dev_id)
>  		handled = true;
>  	}
>  
> +	for (offset = 0; offset < SPMI_IRQ_USER_SIZE; offset += sizeof(val)) {
> +		val = readq(spmi->regs + SPMI_IRQ_ACK_BASE + offset);
> +		/**
> +		 * because of other masters in the bus, we're going to get a multitude of
> +		 * interrupts we're not interested in. irq_resolve_mapping isn't very
> +		 * optimized for the nonexistent path, so instead we mask with (a locally
> +		 * cached version of) the IRQ mask
> +		 */

I don't understand the comment. Interrupt bits in SPMI_IRQ_ACK_BASE..
are set although the SPMI controller has masked them?

> +		val &= spmi->irq_mask_cache[offset / sizeof(val)];
> +		while (val) {
> +			bit = __builtin_ctzll(val);

this can be
		for_each_set_bit(bit, val, 64) {

> +			generic_handle_domain_irq(spmi->irqd, offset * 8 + bit);
> +			handled = true;
> +			val &= ~BIT(bit);
> +		}
> +	}

I think this loops needs to be wrapped in chained_irq_enter() and chained_irq_exit()

Janne
