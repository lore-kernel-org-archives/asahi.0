Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503CEEA0
	for <asahi@lists.linux.dev>; Wed, 25 May 2022 07:39:05 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id u30so34621656lfm.9
        for <asahi@lists.linux.dev>; Wed, 25 May 2022 00:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OhxVZ2LgCynbOv8tKdPmgIQ5QMN9FYlxj9ofmtk1cEQ=;
        b=BusphhT/woejAOYPCsjC+kFvsur8tfYlVNmICYZFvWjI2nRwkSo8dt8ksra7q0NOd2
         F2XoPdCK71Sh63oMTdXJbgH0vex0srZ8GZooJbuL4QE6F6H686ITPspK63oA7f41An96
         aJNXt5laS0Q3uVRyflNR3xDFnkazok0tLDnIuXiPdemGsB9ZgFi2AQ60awsp910pXJKa
         cG5zDUXTf0gS3fCH1iO7nQb9tyTJTiwWUcWT16xS8L9KFEq6eiQ0xYe50/QVxQKKEvpD
         jgrzabue50suQigiUrKmOJIKGi3kqjLTR0kQb8biOfhSE895j9dFOwB6vwqNoUxgOPN2
         +3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OhxVZ2LgCynbOv8tKdPmgIQ5QMN9FYlxj9ofmtk1cEQ=;
        b=Atxbmt0SchXnjLDFcIsQEyk7uToJO0as9uAa6BzSdOiyCBpvf6pEMQUpI3ZmbHcAoK
         PU3tyxiyDQegktcoOlUiQ9qyYa6AYmBiaMhQWncGzBqfn/HOmk4OIUhY7g0l2YMkFrIr
         EQ4WtcQWEn34wTgx/w3/59EudHEPZJkbCiitxgl19mXhQTuJmXR3x6zBV6C/FDXtMX6W
         slePBMzwnctrm0tHKqxeYG7ejjcV4LGwf6EQ93oHG+qrUCMHmbpYa3XXzuc8HBT8rZs6
         p968Gl1IC/SlQ7fqkjhZPCcTjEQ7bEPo0xQC3gHbo8XN6Vvg7fkSyeSiD9Rf6C0sHodD
         U1bg==
X-Gm-Message-State: AOAM531yRYb8l5aCz50i2ChsACSQXiDzaQ/9mOof9f0xeAdLegTATkH/
	BRSKi9PvkjQ4VAnNu+RjKcHbKf8ulHjLSg05SVUJ/Q==
X-Google-Smtp-Source: ABdhPJz23Uln5bDGjeo+lBSYUJgYAKBLIPMwtjZvY1/UtzgpzGOOdu8QqyJN2S4UocIDBPV/zlcKmA5xIoUCnqJsaUo=
X-Received: by 2002:a05:6512:16aa:b0:443:bf59:5a4d with SMTP id
 bu42-20020a05651216aa00b00443bf595a4dmr22852562lfb.622.1653464343312; Wed, 25
 May 2022 00:39:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220524142206.18833-1-marcan@marcan.st>
In-Reply-To: <20220524142206.18833-1-marcan@marcan.st>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 May 2022 09:38:51 +0200
Message-ID: <CACRpkdZX19VaEy64-64UNWafM-wF_=h9w8Qiq4xFFhsa6sahaQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: apple: Use a raw spinlock for the regmap
To: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, May 24, 2022 at 4:22 PM Hector Martin <marcan@marcan.st> wrote:

> The irqchip ops are called with a raw spinlock held, so the subsequent
> regmap usage cannot use a plain spinlock.
>
> spi-hid-apple-of spi0.0: spihid_apple_of_probe:74
>
> =============================
> [ BUG: Invalid wait context ]
> 5.18.0-asahi-00176-g0fa3ab03bdea #1337 Not tainted
> -----------------------------
> kworker/u20:3/86 is trying to lock:
> ffff8000166b5018 (pinctrl_apple_gpio:462:(&regmap_config)->lock){....}-{3:3}, at: regmap_lock_spinlock+0x18/0x30
> other info that might help us debug this:
> context-{5:5}
> 7 locks held by kworker/u20:3/86:
>  #0: ffff800017725d48 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1c8/0x670
>  #1: ffff80001e33bdd0 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1c8/0x670
>  #2: ffff800017d629a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x30/0x17c
>  #3: ffff80002414e618 (&ctlr->add_lock){+.+.}-{4:4}, at: spi_add_device+0x40/0x80
>  #4: ffff800024116990 (&dev->mutex){....}-{4:4}, at: __device_attach+0x30/0x17c
>  #5: ffff800022d4be58 (request_class){+.+.}-{4:4}, at: __setup_irq+0xa8/0x720
>  #6: ffff800022d4bcc8 (lock_class){....}-{2:2}, at: __setup_irq+0xcc/0x720
>
> Fixes: a0f160ffcb83 ("pinctrl: add pinctrl/GPIO driver for Apple SoCs")
> Signed-off-by: Hector Martin <marcan@marcan.st>

Patch applied!

Yours,
Linus Walleij
