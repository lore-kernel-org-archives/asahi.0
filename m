Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E333B6AD6
	for <asahi@lists.linux.dev>; Thu,  1 Sep 2022 18:04:26 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id h22so14091994qtu.2
        for <asahi@lists.linux.dev>; Thu, 01 Sep 2022 11:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Zv8zSKFq6bzQqKXYqWy0Qx4amMNXqj8LcRMKjpftT8k=;
        b=KUOKej5nPOeGXo5nEfUAHYOLs5eyvNYlpPTgCZVwvX1z47fwyYmBooIcwdClVmNz/v
         BRlsK21Dt9FO/arMv4k1bBH9kpHYhGlhCYiHWwSs7zcTWAS1o68a1rng8ufeVyq64mCt
         p546eMwZIIcOP8bw44GqQ79ZHCkKG3OtwLGvXJ8UJulq9EvJ/SlNLAoghw4QreA9qeju
         3+z4Yxdu9AcK3lIk8lLUAEA0Ts0X4QHz8YrmEABFlwU8pmOnUzx5OVD4tlF8JlFdgDWG
         G+M+vJxEIoIdPawxcqf3xok6F/M0ttOpxReuVfdwkBWLnB/drLA8iRY22Wj87RvL3w+E
         jGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Zv8zSKFq6bzQqKXYqWy0Qx4amMNXqj8LcRMKjpftT8k=;
        b=JEe0OizL0HKelzm2v3SumHBTjIaMwRqpvaHeM1O1XwvQhdcRdEASZi8MbaVmqE/xpC
         myLDcget7bYSNbYQzlB9w4kqAg0TvNcinGNR2BTMNtASBsbJiJIVyv4nn9u9WJkf5SSQ
         a+2by2PvmD50NPrjVC9/e9D2MU8Sw+op6v/0RuNS3LxYJ8DyB9vgFZclKqJi9XQaOJlx
         rz0NnMjUCersGc2jRRofg6S18CZrqGAwMgzhHADHF0DN7tYyUZjMHcnZTDyldhFQ6eKZ
         8Mvw7jrCgJ1yuezapKd7vQD7CcJbTVkUaqHUjESL+IUB/1rTpAHjJlHFTyxnecuvfZ5c
         vvlA==
X-Gm-Message-State: ACgBeo23o3WcNLemorVTOFnlutImJ2ydRWN7gksqQMJ994ojSLaWe9cU
	EwXRKyVueIvVGri3qlq5TauHHV9uMDbjmO3HqRg=
X-Google-Smtp-Source: AA6agR62i/7z5gszNPxCHM2tUNT7IR0EnqVb391hZCNAMeUz4tSPO3zPDqa/NtagcRnkiNQJGORyj3nl76pLbZ0BL1M=
X-Received: by 2002:ac8:7f92:0:b0:344:8cd8:59a1 with SMTP id
 z18-20020ac87f92000000b003448cd859a1mr25497299qtj.384.1662055465702; Thu, 01
 Sep 2022 11:04:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Sep 2022 21:03:49 +0300
Message-ID: <CAHp75VfW7uj=+vwGRLsUJEjF-bQLL2EdVNfAnF6iDUqryksC+w@mail.gmail.com>
Subject: Re: [PATCH 6/6] gpio: macsmc: Add IRQ support
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 5:18 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> Add IRQ support to the macsmc driver. This patch has updates from Joey
> Gouly and Russell King.

...

> +       u16 type = event >> 16;
> +       u8 offset = (event >> 8) & 0xff;

The ' & 0xff' part is redundant.

...

> +       return (ret == 0) ? NOTIFY_OK : NOTIFY_DONE;

Parentheses and ' == 0' parts are redundant. You may swap ternary operands.

...

> +static void macsmc_gpio_irq_enable(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> +
> +       gpiochip_enable_irq(gc, irqd_to_hwirq(d));
> +       set_bit(irqd_to_hwirq(d), smcgp->irq_enable_shadow);

You may use temporary variable for hwirq

  irq_hw_number_t hwirq = irdq_to_hwirq(d);

> +}
> +
> +static void macsmc_gpio_irq_disable(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> +
> +       clear_bit(irqd_to_hwirq(d), smcgp->irq_enable_shadow);
> +       gpiochip_disable_irq(gc, irqd_to_hwirq(d));

Ditto.

> +}
> +
> +static int macsmc_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);

> +       int offset = irqd_to_hwirq(d);

As above.


> +       u32 mode;

> +       if (!test_bit(offset, smcgp->irq_supported))
> +               return -EINVAL;

We have a valid mask for IRQs. Can it be used here instead?

> +       switch (type & IRQ_TYPE_SENSE_MASK) {
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               mode = IRQ_MODE_HIGH;
> +               break;
> +       case IRQ_TYPE_LEVEL_LOW:
> +               mode = IRQ_MODE_LOW;
> +               break;
> +       case IRQ_TYPE_EDGE_RISING:
> +               mode = IRQ_MODE_RISING;
> +               break;
> +       case IRQ_TYPE_EDGE_FALLING:
> +               mode = IRQ_MODE_FALLING;
> +               break;
> +       case IRQ_TYPE_EDGE_BOTH:
> +               mode = IRQ_MODE_BOTH;
> +               break;
> +       default:
> +               return -EINVAL;
>         }
>
> +       smcgp->irq_mode_shadow[offset] = mode;

Usually we want to have handle_bad_irq() handler by default and in
->set_type() we lock a handler depending on the flags. Why is this not
the case in this driver?

>         return 0;
>  }

...

> +static void macsmc_gpio_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);

> +       smc_key key = macsmc_gpio_key(irqd_to_hwirq(d));
> +       int offset = irqd_to_hwirq(d);

As above.

> +       bool val;
> +
> +       if (smcgp->irq_mode_shadow[offset] != smcgp->irq_mode[offset]) {
> +               u32 cmd = CMD_IRQ_MODE | smcgp->irq_mode_shadow[offset];
> +               if (apple_smc_write_u32(smcgp->smc, key, cmd) < 0)
> +                       dev_err(smcgp->dev, "GPIO IRQ config failed for %p4ch = 0x%x\n", &key, cmd);
> +               else
> +                       smcgp->irq_mode_shadow[offset] = smcgp->irq_mode[offset];
> +       }
> +
> +       val = test_bit(offset, smcgp->irq_enable_shadow);
> +       if (test_bit(offset, smcgp->irq_enable) != val) {
> +               if (apple_smc_write_u32(smcgp->smc, key, CMD_IRQ_ENABLE | val) < 0)
> +                       dev_err(smcgp->dev, "GPIO IRQ en/disable failed for %p4ch\n", &key);
> +               else
> +                       change_bit(offset, smcgp->irq_enable);
> +       }
> +
> +       mutex_unlock(&smcgp->irq_mutex);
> +}

--
With Best Regards,
Andy Shevchenko
