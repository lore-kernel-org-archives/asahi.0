Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDB97B
	for <asahi@lists.linux.dev>; Wed, 23 Nov 2022 02:24:39 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id c7so12273836iof.13
        for <asahi@lists.linux.dev>; Tue, 22 Nov 2022 18:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eevd4QeJklojoebeEJhPyzscEB6NPDv0+cfMGWenyh4=;
        b=wpRn0h6MtPSP8QWRZMLEPdtPkCRbG13EVX213TMmj0PMwHO+x6qxdatfnsFwvsGSbH
         hnsHvSCZRKcJGhna3cB/X4LWwUjiafWSXHX1n6HAz15QlEexx4QvdIa4ZtyUO4j/DFRo
         2+eh/TpuRQPbv7NuuW91lg8QvEWmecGSOIrNYVI15GmGeWVlKUjmapS34d2K3PQ41/YW
         3r9Kpi6JUxAyBHYh6qIuYQINBlHgX06tJdKeasSFI3xf1TcIHNjZab7SZ56m1DnDDxbQ
         jchMh+m5IXa4dd1lwsT1d8+7u/8jQ7sanE8RpHX8FKgJCW66+cA6aL4wi3tpJ+8fuCyS
         ZseA==
X-Gm-Message-State: ANoB5pnuoWvLYZtcAzTWlf0FeLzxwHL8Jq0pl+tLZ9QPuKqT4A2skrWO
	7ckVVpkfcf5IqYoyewO7DA==
X-Google-Smtp-Source: AA0mqf7lj2Lu5JHM8TL6FPv94tgfEkhK5BGNxYguTEj/89B2m84NjyyM19FUmLCPy+Dla6xj9S3UMA==
X-Received: by 2002:a02:9f8a:0:b0:363:db63:a796 with SMTP id a10-20020a029f8a000000b00363db63a796mr12367480jam.250.1669170278161;
        Tue, 22 Nov 2022 18:24:38 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f89-20020a0284e2000000b00363f8e0ab41sm5848805jai.152.2022.11.22.18.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 18:24:37 -0800 (PST)
Received: (nullmailer pid 1017012 invoked by uid 1000);
	Wed, 23 Nov 2022 02:24:38 -0000
Date: Tue, 22 Nov 2022 20:24:38 -0600
From: Rob Herring <robh@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 2/4] pwm: Add Apple PWM controller
Message-ID: <20221123022438.GA1006695-robh@kernel.org>
References: <20221121174228.93670-1-fnkl.kernel@gmail.com>
 <20221121174228.93670-3-fnkl.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121174228.93670-3-fnkl.kernel@gmail.com>

On Mon, Nov 21, 2022 at 08:42:26PM +0300, Sasha Finkelstein wrote:
> Adds the Apple PWM controller driver.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Acked-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/pwm/Kconfig     |  12 ++++
>  drivers/pwm/Makefile    |   1 +
>  drivers/pwm/pwm-apple.c | 127 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 140 insertions(+)
>  create mode 100644 drivers/pwm/pwm-apple.c
> 
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 60d13a949bc5..c3be11468414 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -51,6 +51,18 @@ config PWM_AB8500
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called pwm-ab8500.
>  
> +config PWM_APPLE
> +	tristate "Apple SoC PWM support"
> +	depends on ARCH_APPLE || COMPILE_TEST
> +	help
> +	  Generic PWM framework driver for PWM controller present on
> +	  Apple SoCs
> +
> +	  Say Y here if you have an ARM Apple laptop, otherwise say N
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called pwm-apple.
> +
>  config PWM_ATMEL
>  	tristate "Atmel PWM support"
>  	depends on ARCH_AT91 || COMPILE_TEST
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> index 7bf1a29f02b8..19899b912e00 100644
> --- a/drivers/pwm/Makefile
> +++ b/drivers/pwm/Makefile
> @@ -2,6 +2,7 @@
>  obj-$(CONFIG_PWM)		+= core.o
>  obj-$(CONFIG_PWM_SYSFS)		+= sysfs.o
>  obj-$(CONFIG_PWM_AB8500)	+= pwm-ab8500.o
> +obj-$(CONFIG_PWM_APPLE)		+= pwm-apple.o
>  obj-$(CONFIG_PWM_ATMEL)		+= pwm-atmel.o
>  obj-$(CONFIG_PWM_ATMEL_HLCDC_PWM)	+= pwm-atmel-hlcdc.o
>  obj-$(CONFIG_PWM_ATMEL_TCB)	+= pwm-atmel-tcb.o
> diff --git a/drivers/pwm/pwm-apple.c b/drivers/pwm/pwm-apple.c
> new file mode 100644
> index 000000000000..b0c3f86fd578
> --- /dev/null
> +++ b/drivers/pwm/pwm-apple.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT

Kernel code is generally GPL-2.0 only. No other PWM driver is MIT 
licensed. So why this one.

Mixing licenses is a problem because few people look at the licenses 
when copying code around.

> +/*
> + * Driver for the Apple SoC PWM controller
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/pwm.h>
> +
> +#define PWM_CONTROL     0x00
> +#define PWM_ON_CYCLES   0x1c
> +#define PWM_OFF_CYCLES  0x18
> +
> +#define CTRL_ENABLE        BIT(0)
> +#define CTRL_MODE          BIT(2)
> +#define CTRL_UPDATE        BIT(5)
> +#define CTRL_TRIGGER       BIT(9)
> +#define CTRL_INVERT        BIT(10)
> +#define CTRL_OUTPUT_ENABLE BIT(14)
> +
> +struct apple_pwm {
> +	struct pwm_chip chip;
> +	void __iomem *base;
> +	u64 clkrate;
> +};
> +
> +static int apple_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			   const struct pwm_state *state)
> +{
> +	struct apple_pwm *fpwm;
> +	u64 on_cycles, off_cycles;
> +
> +	fpwm = container_of(chip, struct apple_pwm, chip);
> +	if (state->enabled) {
> +		on_cycles = mul_u64_u64_div_u64(fpwm->clkrate,
> +						state->duty_cycle, NSEC_PER_SEC);
> +		off_cycles = mul_u64_u64_div_u64(fpwm->clkrate,
> +						 state->period, NSEC_PER_SEC) - on_cycles;
> +		writel(on_cycles, fpwm->base + PWM_ON_CYCLES);
> +		writel(off_cycles, fpwm->base + PWM_OFF_CYCLES);
> +		writel(CTRL_ENABLE | CTRL_OUTPUT_ENABLE | CTRL_UPDATE,
> +		       fpwm->base + PWM_CONTROL);
> +	} else {
> +		writel(0, fpwm->base + PWM_CONTROL);
> +	}
> +	return 0;
> +}
> +
> +static void apple_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> +			   struct pwm_state *state)
> +{
> +	struct apple_pwm *fpwm;
> +	u32 on_cycles, off_cycles, ctrl;
> +
> +	fpwm = container_of(chip, struct apple_pwm, chip);
> +
> +	ctrl = readl(fpwm->base + PWM_CONTROL);
> +	on_cycles = readl(fpwm->base + PWM_ON_CYCLES);
> +	off_cycles = readl(fpwm->base + PWM_OFF_CYCLES);
> +
> +	state->enabled = (ctrl & CTRL_ENABLE) && (ctrl & CTRL_OUTPUT_ENABLE);
> +	state->polarity = PWM_POLARITY_NORMAL;
> +	state->duty_cycle = div_u64(on_cycles, fpwm->clkrate) * NSEC_PER_SEC;
> +	state->period = div_u64(off_cycles + on_cycles, fpwm->clkrate) * NSEC_PER_SEC;
> +}
> +
> +static const struct pwm_ops apple_pwm_ops = {
> +	.apply = apple_pwm_apply,
> +	.get_state = apple_pwm_get_state,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int apple_pwm_probe(struct platform_device *pdev)
> +{
> +	struct apple_pwm *pwm;
> +	struct clk *clk;
> +	int ret;
> +
> +	pwm = devm_kzalloc(&pdev->dev, sizeof(*pwm), GFP_KERNEL);
> +	if (!pwm)
> +		return -ENOMEM;
> +
> +	pwm->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pwm->base))
> +		return PTR_ERR(pwm->base);
> +
> +	platform_set_drvdata(pdev, pwm);
> +
> +	clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	pwm->clkrate = clk_get_rate(clk);
> +	pwm->chip.dev = &pdev->dev;
> +	pwm->chip.npwm = 1;
> +	pwm->chip.ops = &apple_pwm_ops;
> +
> +	ret = devm_pwmchip_add(&pdev->dev, &pwm->chip);

This symbol is EXPORT_SYMBOL_GPL. So how can this module be MIT 
licensed?

> +	return ret;
> +}
> +
> +static const struct of_device_id apple_pwm_of_match[] = {
> +	{ .compatible = "apple,s5l-fpwm" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, apple_pwm_of_match);
> +
> +static struct platform_driver apple_pwm_driver = {
> +	.probe = apple_pwm_probe,
> +	.driver = {
> +		.name = "apple-pwm",
> +		.owner = THIS_MODULE,

This line should be dropped.

> +		.of_match_table = apple_pwm_of_match,
> +	},
> +};
> +module_platform_driver(apple_pwm_driver);
> +
> +MODULE_DESCRIPTION("Apple SoC PWM driver");
> +MODULE_LICENSE("Dual MIT/GPL");
> -- 
> 2.38.1
> 
> 
