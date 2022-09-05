Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC727E
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 13:27:59 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id s11so11340359edd.13
        for <asahi@lists.linux.dev>; Mon, 05 Sep 2022 06:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=o5uz0+1b+tleOdgt/bBRFfYVa92RsetSFS3/8UmSb1s=;
        b=UYWNNhxvg2FOWmWpQ4B14rCyaWA23b8L3uc/MSGed2VHlQ8oUu/4HzXk6LKbEI1hou
         RTE9y2uRJI6womglJ6OLpkm2bYBjRW+FYj6a5Dw390nQS4ugCcgwm6SQhj0togfrRY2f
         FzfHcQCI1f+KtvwEW2QwHnrvf62E2H4c7RMFF/GJo8etM6xthQi8fvutQYco7Hj73gZh
         03/J9DvJ5l5eEGvc2KMfK9qzmJzdpOV8BB59AXnBmAN59Lf3ff+rtplHq2zFhM6E7VAR
         x8sU5MX0Onx9VYe6jBiKXfrDcuLYudxo6aFw8+myt5Ze1S4dQcV/iEHn1bQotwkHB5q8
         Jt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=o5uz0+1b+tleOdgt/bBRFfYVa92RsetSFS3/8UmSb1s=;
        b=RbK2krHFKbsXqx3Y8trjzaTQxa99GNUjEcSArukmdPy0q1337DMwfVA13TBbtG0WGb
         yHOF6MGGnyBWH9hYsrw1sXP54hKztmocGUGlg8dkSAYHHi+/oVcdJ4z0Gl8TLLh6Re2d
         nyCAH4OZ3cHAo0A4EmYUeMENBEofcBePUNAD0ALTkPFJ4xTJw6HO8JfRtvBZkEwaOOqS
         66IYliTMwIZWExHqujQ31e+eRwGLKYE4irWYQnuMj15V2MKUIVZ8HjIvO3MksqiXrK4X
         NQT7vKPsbxPwAS+cfuTWs+i6dhpwabrm5/UZK6ZKq8xyMdWFxueV50SCRLtiDIG0geAG
         uRxQ==
X-Gm-Message-State: ACgBeo2nsmAxHIB7KNln+miuxBw+kJzqSCLZWlrkZvJGnQXUjHRMiRfa
	clHJBpg/GKig8EfhwpEUnMTptAhVzSn3a1JflIHh5g==
X-Google-Smtp-Source: AA6agR6Eduh0IyGZQF+98euSNKv0laUXFWepcREMm5/ZEmrOk321e5GLw7GwtQA9c+o1mV/WxQi/wM36lDXPV4wbm7g=
X-Received: by 2002:a05:6402:2691:b0:43d:ba10:854b with SMTP id
 w17-20020a056402269100b0043dba10854bmr41806434edd.158.1662384477440; Mon, 05
 Sep 2022 06:27:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
 <CACRpkdaR9rBdPC_OBKx5e+=EtbR-Jn3GzrvGRYHMJmXwRxPhyg@mail.gmail.com> <YxXv5vL6XrlkK+K0@shell.armlinux.org.uk>
In-Reply-To: <YxXv5vL6XrlkK+K0@shell.armlinux.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Sep 2022 15:27:45 +0200
Message-ID: <CACRpkdacRUxaGmdx4hqD4X=hJ6wv-qr_udxkdS0WYXBkM08eeA@mail.gmail.com>
Subject: Re: [PATCH 6/6] gpio: macsmc: Add IRQ support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 5, 2022 at 2:47 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Fri, Sep 02, 2022 at 03:21:31PM +0200, Linus Walleij wrote:

> > > +       local_irq_save(flags);
> > > +       ret = generic_handle_domain_irq(smcgp->gc.irq.domain, offset);
> > > +       local_irq_restore(flags);
> >
> > Isn't irq_bus_lock/unlock protecting us here already?
> > (I might be getting it wrong...)
>
> Hmm, where does irq_bus_lock get called? Given this function is called
> while running a blocking notifier chain, interrupts will not be
> disabled on entry to this function. I haven't found a place in the maze
> of irq handling code that generic_handle_domain_irq() would end up using
> the bus lock/unlock functions - and if they did, with the above IRQ
> saving, the kernel would WARN() about calling mutex_lock() with IRQs
> disabled. So it doesn't.

Ah I get it now, the notification mechanism goes entirely orthogonal
to the irqchip, that's what got me confused. You're right, keep this.

> > That callback will only be used by edge triggered IRQs but
> > I guess that would realistically be all we support anyway?
> > (See comment below on .set_type)
>
> I would imagine it depends on how the SMC GPIO interrupt works -
> whether the ACK is ACK as we know it in Linux (x86 PIC) or whether
> it's ACK as in a notification to the SMC that we have finished
> handling the interrupt and it can send us the next interrupt.
>
> I suspect we don't know that level of detail of the platform, so
> given that this is what the Asahi kernel does, that's the best we
> have.

OK

> > > +static int macsmc_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> > > +{
> > > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > > +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> > > +       int offset = irqd_to_hwirq(d);
> > > +       u32 mode;
> > > +
> > > +       if (!test_bit(offset, smcgp->irq_supported))
> > > +               return -EINVAL;
> > > +
> > > +       switch (type & IRQ_TYPE_SENSE_MASK) {
> > > +       case IRQ_TYPE_LEVEL_HIGH:
> > > +               mode = IRQ_MODE_HIGH;
> > > +               break;
> > > +       case IRQ_TYPE_LEVEL_LOW:
> > > +               mode = IRQ_MODE_LOW;
> > > +               break;
> > > +       case IRQ_TYPE_EDGE_RISING:
> > > +               mode = IRQ_MODE_RISING;
> > > +               break;
> > > +       case IRQ_TYPE_EDGE_FALLING:
> > > +               mode = IRQ_MODE_FALLING;
> > > +               break;
> > > +       case IRQ_TYPE_EDGE_BOTH:
> > > +               mode = IRQ_MODE_BOTH;
> > > +               break;
> > > +       default:
> > > +               return -EINVAL;
> >
> > I don't know how level IRQs would work on this essentially
> > message-passing process context interrupt. Maybe I am getting
> > it all wrong, but for level the line should be held low/high until
> > the IRQ is serviced, it would be possible to test if this actually
> > works by *not* servicing an IRQ and see if the SMC then sends
> > another message notifier for the same IRQ.
>
> If level IRQs are not supported, then it's strange that the Asahi
> folk have been able to reverse engineer the CMD_IRQ_MODE codes for
> these states.
>
> Maybe the SMC issues another message for a level IRQ after it receives
> a CMD_IRQ_ACK message if the level interrupt is still asserted?
(...)
> > > +       gpio_irq_chip_set_chip(&smcgp->gc.irq, &macsmc_gpio_irqchip);
> > > +       smcgp->gc.irq.parent_handler = NULL;
> > > +       smcgp->gc.irq.num_parents = 0;
> > > +       smcgp->gc.irq.parents = NULL;
> > > +       smcgp->gc.irq.default_type = IRQ_TYPE_NONE;
> > > +       smcgp->gc.irq.handler = handle_simple_irq;
> >
> > I would consider setting this to handle_edge_irq() and implement
> > .irq_ack(). I might be wrong.
>
> I don't think that's suitable, because then we'll be calling irq_ack()
> before the handler has run - and we won't be notifying the SMC that
> the interrupt has been masked. So it could send another notification
> for the same IRQ while it's still being handled. Then there's the
> question about level IRQs as well.
>
> I think, given that I don't know how the SMC works (presumably the
> Asahi folk have a bit more of an idea, but that will be based on
> reverse engineering effort) that I am not going to modify this driver's
> behaviour drastically by changing the flow handler to the edge flow
> handler from the simple flow. To me, that could well be a disaster
> for this driver. That would be something for the Asahi folk to look
> at.

Fair enough. From my end this will be fine to merge after you considered
the things brought up and it is certainly not necessary to have any
"perfect" solution, to me it is clear that what we need to do is enable the
target so that people can use it and then we/Asahi can comb through it
and reexamine things like this once the whole system is usable as a whole.

I've seen that Konrad has even started using the M1 infrastructure
to kickstart a few iPhone/iPad devices, so given how much hardware this
is (in absolute units) I think it's pretty important we get to usable ASAP.

Yours,
Linus Walleij
