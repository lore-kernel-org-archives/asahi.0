Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13071869
	for <asahi@lists.linux.dev>; Fri,  2 Sep 2022 13:21:45 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id cu2so3953030ejb.0
        for <asahi@lists.linux.dev>; Fri, 02 Sep 2022 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=9kjykBLX/2XOZBPDkYx1NLn0xeEFvOvh/J7JeDhgExk=;
        b=QtEycjEFT3kKXeccaCJV0EQelglBaWCaK0Agc13Ll/Mwm3/7GgXSrcqm7BV4Bts38z
         YLYnfSB3UWwe6Ns3pce0JmGSgJ/zPbpAd2jea45sk/KwZn/BGEWYyFBZlsRmWetnlIuh
         DpU2xAn+3okijON0TKQs1IzQV/22ODfAxFQAB6t9aoLpBh+5aqKEVM8pBXFNOsJLsl8L
         8Pm9XMNd5C5CxYjq6GPvhE6cp8PQ31gLI5aozoc09Z0xJ1RjymHF8E29Y3Hq6Bd2CJdJ
         CWATn/aGANinKbqle2HktZq4wwX2eU10/zyHFb7uhJ0IlQ7aWQ/8ukTHU+mEOqk3x+G6
         +I4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9kjykBLX/2XOZBPDkYx1NLn0xeEFvOvh/J7JeDhgExk=;
        b=VETGWLZ6yO/TxJlkzZbTgDs3wE7QVMHf3jlJrMnolBDRk4ofQFRnO0uBoI1TFkpSYA
         iVvcPuUJ5Zc2ubvQendAEpGeTdZ6RzPMdqxvZIcrPw8cvbjQ85bdoI/1umagVty64sqQ
         6hsM7BjlbeO39zThkR5FW9CFhj/H3sCJXb1XHSP8MqmM43TMI2ejZ9uHeC/uJj4Tz41B
         F+7HRjITdt+Vgr1pBwUDAztrcH+y6ipFvg0/PEMgNpFAenlVkOF8tMY4n1D8HTxedWck
         OZfVpKVoe16BT3YKqIRku4ed91VkYevyxkipTe4fSMI8GvSh4xR2RxldZCIo/di+LeFi
         2log==
X-Gm-Message-State: ACgBeo26Dx4nAY0OOfGdf4MA660ZUaQ3HDwM/CFT/P6t1OMCXew7kV1i
	61jQ6XZqnFRmoBIIiDI3a2Qxad6mpGxnbMouJgFiDw==
X-Google-Smtp-Source: AA6agR4r/6CP+Iq7CHiLZ9hhf/V6Z3w5iDTDeeWViqSHhU+3njvpPWP1PCbfjr1cC7FuHD8BEjYEh9+YQJaNJZW84iA=
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr21492292ejc.208.1662124903916; Fri, 02
 Sep 2022 06:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 2 Sep 2022 15:21:31 +0200
Message-ID: <CACRpkdaR9rBdPC_OBKx5e+=EtbR-Jn3GzrvGRYHMJmXwRxPhyg@mail.gmail.com>
Subject: Re: [PATCH 6/6] gpio: macsmc: Add IRQ support
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 3:54 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:

> From: Hector Martin <marcan@marcan.st>
>
> Add IRQ support to the macsmc driver. This patch has updates from Joey
> Gouly and Russell King.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Overall looks very good, again some detailed remarks from Andy
should be addressed, apart from that you need to add:

select GPIOLIB_IRQCHIP

to the Kconfig entry for the driver, or else the compile robots are
going to hit some configuration that doesn't compile.

> +       struct mutex irq_mutex;
> +       DECLARE_BITMAP(irq_supported, MAX_GPIO);

If you can use the .init_valid_mask from struct gpio_irq_chip
instead, it will allocate this mask dynamically for the irqchip.
(Further comment below.)

> +       DECLARE_BITMAP(irq_enable_shadow, MAX_GPIO);

Please rename irq_unmasked_shadow as it is tracking
this and not what the irqchip core calls enabled/disabled.

> +       DECLARE_BITMAP(irq_enable, MAX_GPIO);

I think this state should be possible to set/get from the irqchip
core. !irqd_irq_masked(d) on the descriptor, correct me if I'm wrong.

> +       u32 irq_mode_shadow[MAX_GPIO];
> +       u32 irq_mode[MAX_GPIO];
>
>         int first_index;
>  };
> @@ -161,6 +172,7 @@ static int macsmc_gpio_init_valid_mask(struct gpio_chip *gc,
>         for (i = 0; i < count; i++) {
>                 smc_key key;
>                 int gpio_nr;
> +               u32 val;
>                 int ret = apple_smc_get_key_by_index(smcgp->smc, smcgp->first_index + i, &key);
>
>                 if (ret < 0)
> @@ -176,11 +188,143 @@ static int macsmc_gpio_init_valid_mask(struct gpio_chip *gc,
>                 }
>
>                 set_bit(gpio_nr, valid_mask);
> +
> +               /* Check for IRQ support */
> +               ret = apple_smc_rw_u32(smcgp->smc, key, CMD_IRQ_MODE, &val);
> +               if (!ret)
> +                       set_bit(gpio_nr, smcgp->irq_supported);
> +       }
> +
> +       return 0;
> +}

This  gets initialized from the struct gpio_chip .init_valid_mask, but
struct gpio_irq_chip has its own callback with the same name, which
is preferred to be used for this, check if you can use that instead, it
makes the use more obvious.

> +static int macsmc_gpio_event(struct notifier_block *nb, unsigned long event, void *data)
> +{
> +       struct macsmc_gpio *smcgp = container_of(nb, struct macsmc_gpio, nb);
> +       u16 type = event >> 16;
> +       u8 offset = (event >> 8) & 0xff;
> +       smc_key key = macsmc_gpio_key(offset);
> +       unsigned long flags;
> +        int ret;
> +
> +       if (type != SMC_EV_GPIO)
> +               return NOTIFY_DONE;
> +
> +       if (offset > MAX_GPIO) {
> +               dev_err(smcgp->dev, "GPIO event index %d out of range\n", offset);
> +               return NOTIFY_BAD;
> +       }
> +
> +       local_irq_save(flags);
> +       ret = generic_handle_domain_irq(smcgp->gc.irq.domain, offset);
> +       local_irq_restore(flags);

Isn't irq_bus_lock/unlock protecting us here already?
(I might be getting it wrong...)

Since this is coming from a notifier and not an IRQ or threaded
IRQ I actually am a bit puzzled on how to handle it... you probably
know it better than me, maybe ask Marc Z if anything is
unclear.

> +       if (apple_smc_write_u32(smcgp->smc, key, CMD_IRQ_ACK | 1) < 0)
> +               dev_err(smcgp->dev, "GPIO IRQ ack failed for %p4ch\n", &key);

isn't this one of those cases where we should implement the
irqchip callback .irq_ack() specifically for this?

That callback will only be used by edge triggered IRQs but
I guess that would realistically be all we support anyway?
(See comment below on .set_type)

> +static void macsmc_gpio_irq_enable(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> +
> +       gpiochip_enable_irq(gc, irqd_to_hwirq(d));
> +       set_bit(irqd_to_hwirq(d), smcgp->irq_enable_shadow);
> +}
> +
> +static void macsmc_gpio_irq_disable(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> +
> +       clear_bit(irqd_to_hwirq(d), smcgp->irq_enable_shadow);
> +       gpiochip_disable_irq(gc, irqd_to_hwirq(d));
> +}

I would rename these unmask/mask to match the callback
hooks they are implementing, since there are irqchips
callbacks with these names I get a but confused.

> +static int macsmc_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> +       int offset = irqd_to_hwirq(d);
> +       u32 mode;
> +
> +       if (!test_bit(offset, smcgp->irq_supported))
> +               return -EINVAL;
> +
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

I don't know how level IRQs would work on this essentially
message-passing process context interrupt. Maybe I am getting
it all wrong, but for level the line should be held low/high until
the IRQ is serviced, it would be possible to test if this actually
works by *not* servicing an IRQ and see if the SMC then sends
another message notifier for the same IRQ.

I strongly suspect that actually only edges are supported, but
there might be semantics I don't understand here.

>         }
>
> +       smcgp->irq_mode_shadow[offset] = mode;

Hm yeah I guess this shadow mode is necessary for the sync
to work.

>         return 0;
>  }
>
> +static void macsmc_gpio_irq_bus_lock(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> +
> +       mutex_lock(&smcgp->irq_mutex);
> +}
> +
> +static void macsmc_gpio_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> +       smc_key key = macsmc_gpio_key(irqd_to_hwirq(d));
> +       int offset = irqd_to_hwirq(d);
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

So what you want to know for each line is (correct me if I'm wrong):
- Is it enabled (unmasked) or not?
- Did it get changed enabled->disabled, disabled->enabled since
  macsmc_gpio_irq_bus_lock()?

Doesn't the irqchip core track the first part of this for you?
irqd_irq_masked(d) should tell you the same thing as
irq_enable, just inverted.

irq_enable_shadow is a bit tricker, I guess you might need that since
the irqchip doesn't track state changes.

>  static int macsmc_gpio_probe(struct platform_device *pdev)
>  {
>         struct macsmc_gpio *smcgp;
> @@ -221,6 +365,18 @@ static int macsmc_gpio_probe(struct platform_device *pdev)
>         smcgp->gc.base = -1;
>         smcgp->gc.parent = &pdev->dev;
>
> +       gpio_irq_chip_set_chip(&smcgp->gc.irq, &macsmc_gpio_irqchip);
> +       smcgp->gc.irq.parent_handler = NULL;
> +       smcgp->gc.irq.num_parents = 0;
> +       smcgp->gc.irq.parents = NULL;
> +       smcgp->gc.irq.default_type = IRQ_TYPE_NONE;
> +       smcgp->gc.irq.handler = handle_simple_irq;

I would consider setting this to handle_edge_irq() and implement
.irq_ack(). I might be wrong.

But overall since this IRQ is driven by a notifier I feel a bit lost.

Yours,
Linus Walleij
