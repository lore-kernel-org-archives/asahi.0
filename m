Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C843202
	for <asahi@lists.linux.dev>; Thu,  1 Sep 2022 19:26:53 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id l5so14274039qtv.4
        for <asahi@lists.linux.dev>; Thu, 01 Sep 2022 12:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=GwpDrpLxHphzM2y1BmvfF0fkc6vmYO6P4//roMJ5Xlo=;
        b=GYhX1Vl/+JSq6BUxkOtP8ctOOINt6dbz71dV61BRJOuNshjDKMTdVSG9Cda7fi6F4m
         H6jGdvVTWZFUkLtNzDb36YP1CfqmrISJmDnnrUGtXpT4YH7hWhltMLInrpt+Pl3OTWSL
         4viVxDZunpDDNZ0PBpunoni02DkX91yozOuuKeLWpA28RGqTaj/4JqKlu7IeUf3N0cnJ
         gUeV3fDALaleWZ9x+v4mzjx83djmMIO8QIvWleon+KY6kniszhuhHRR0w7fx4M5cU/TD
         j7ZZFYnMlhsGfj7KvgzAPwrv0hbUeIp2H+9PztZbCcGwazqbRCBVrmoBpf8bpHkkzje9
         6bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=GwpDrpLxHphzM2y1BmvfF0fkc6vmYO6P4//roMJ5Xlo=;
        b=XuoDZqUYLKHAAOFBLVf1F7bSdfL0Fojm7DLf1BZXDc33lSHb9OXLSrI1fT6ezqrSwz
         u7YAlVZjHzwnr3V5fXZV9rLgJDLVfrx17vwzgPfR/x1T3Ut6pXDHEe9GU5VAPGyregiz
         UB6AIZKkND6i1sUGAFmchDWxdF8QjSdFw8UNTkgXM9tNoXxC/fq0Sp+J/+X4Dbp7ilXd
         2lZthCncJcOsoKgBMmjmZTJVT0TXhVMomutT8XKSABo0PXdUxfoz5HLq9cNTZyu+PGRy
         65kV6ypO6tEla5qc1hAtehnTaxdqwvVMn+97m0RaW222/IUkh5QvBjRPZ5OnT1DF3VAO
         9eWw==
X-Gm-Message-State: ACgBeo16pLKwBi5GPrsmd7i4TXaFA22a6JlIHW+KYyGOiJGSxOX9tQ7E
	GZGg1GUBzdumf434C4V0PWGWJeMQqQK6A24CTZk=
X-Google-Smtp-Source: AA6agR50jQ30lfgMirgOaQB2+evO/PjdGtaha4+mW/zYPZaVoLc8nSkoHPVHYr+HqAT4LMRSE0IJpeYK5hBfL8sUnuM=
X-Received: by 2002:ac8:7f92:0:b0:344:8cd8:59a1 with SMTP id
 z18-20020ac87f92000000b003448cd859a1mr25829693qtj.384.1662060412032; Thu, 01
 Sep 2022 12:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Sep 2022 22:26:15 +0300
Message-ID: <CAHp75Ve1ackTCOAkVar00OyDW-+BOPbRmsJRH3-z1bdNaukC+Q@mail.gmail.com>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
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
> This driver implements support for the SMC (System Management
> Controller) in Apple Macs. In contrast to the existing applesmc driver,
> it uses pluggable backends that allow it to support different SMC
> implementations, and uses the MFD subsystem to expose the core SMC
> functionality so that specific features (gpio, hwmon, battery, etc.) can
> be implemented by separate drivers in their respective downstream
> subsystems.
>
> The initial RTKit backend adds support for Apple Silicon Macs (M1 et
> al). We hope a backend for T2 Macs will be written in the future
> (since those are not supported by applesmc), and eventually an x86
> backend would allow us to fully deprecate applesmc in favor of this
> driver.

...

>  drivers/platform/Kconfig           |   2 +
>  drivers/platform/Makefile          |   1 +
>  drivers/platform/apple/Kconfig     |  49 ++++
>  drivers/platform/apple/Makefile    |  11 +

Are you going to collect the code from, e.g., PDx86 which supports
some apple devices here?

...


> +EXPORT_SYMBOL(apple_smc_read);

Can you from day 1 make it a namespaced variant? Ditto for the rest of
the exported stuff.

...

> +#include <asm/unaligned.h>

Usually we put asm/* after linux/*.

Missed bits.h.

> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/soc/apple/rtkit.h>

...

> +       smc->msg_id = (smc->msg_id + 1) & 0xf;

% 16 will tell much cleaner of the purpose, no?

...

> +       while (smc->atomic_pending) {
> +               ret = apple_rtkit_poll(smc->rtk);
> +               if (ret < 0) {
> +                       dev_err(smc->dev, "RTKit poll failed (%llx)", msg);
> +                       return ret;
> +               }
> +               udelay(100);
> +       }

Something from iopoll.h to be utilised?

...

> +       if (FIELD_GET(SMC_ID, smc->cmd_ret) != smc->msg_id) {
> +               dev_err(smc->dev, "Command sequence mismatch (expected %d, got %d)\n",
> +                       smc->msg_id, (unsigned int)FIELD_GET(SMC_ID, smc->cmd_ret));

Why casting?

> +               return -EIO;
> +       }

...

> +       result = FIELD_GET(SMC_RESULT, smc->cmd_ret);
> +       if (result != 0)
> +               return -result;

And this is in Linux error numbering space?!

...

> +       smc->msg_id = (smc->msg_id + 1) & 0xf;

See above. Perhaps you need a macro / inline helper for this to avoid dups.

...

> +       do {
> +               if (wait_for_completion_timeout(&smc->cmd_done,
> +                                               msecs_to_jiffies(SMC_RECV_TIMEOUT)) == 0) {
> +                       dev_err(smc->dev, "Command timed out (%llx)", msg);
> +                       return -ETIMEDOUT;
> +               }
> +               if (FIELD_GET(SMC_ID, smc->cmd_ret) == smc->msg_id)
> +                       break;

> +               dev_err(smc->dev, "Command sequence mismatch (expected %d, got %d)\n",
> +                       smc->msg_id, (unsigned int)FIELD_GET(SMC_ID, smc->cmd_ret));

Guaranteed to flood the logs...

> +       } while(1);

...with such a conditional.

...

> +       result = FIELD_GET(SMC_RESULT, smc->cmd_ret);
> +       if (result != 0)
> +               return -result;

Linux error numbering space?

...

> +       if (size <= 4)
> +               memcpy(buf, &rdata, size);
> +       else
> +               memcpy_fromio(buf, smc->shmem.iomem, size);

This is unclear why plain memcpy() for the small size and what are the
side effects of the memory. Maybe you wanted memremap() instead of
ioremap() to begin with?

...

> +       *key = swab32(*key);

swab32s()

...

> +       if (res.end < res.start || !resource_contains(smc->sram, &res)) {

Is it a reimplementation of something like resource_intersect() and Co?

> +               dev_err(smc->dev,
> +                       "RTKit buffer request outside SRAM region: %pR", &res);
> +               return -EFAULT;
> +       }

...

> +       bfr->iomem = smc->sram_base + (res.start - smc->sram->start);

Isn't it better to write as

  res.start + (base - start)

?

...

> +               if (smc->atomic_pending) {
> +                       smc->atomic_pending = false;
> +               } else {
> +                       complete(&smc->cmd_done);
> +               }

Redundant {} in both cases.

...

> +       smc->sram = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");

> +       if (!smc->sram)
> +               return dev_err_probe(dev, EIO,
> +                                    "No SRAM region");

Dup, the below does this message for you.

> +       smc->sram_base = devm_ioremap_resource(dev, smc->sram);
> +       if (IS_ERR(smc->sram_base))
> +               return dev_err_probe(dev, PTR_ERR(smc->sram_base),
> +                                    "Failed to map SRAM region");

Don't we have devm_platform_ioremap_resource_byname() ?

...

> +       ret = apple_rtkit_wake(smc->rtk);
> +       if (ret != 0)

Drop all these ' != 0'

> +               return dev_err_probe(dev, ret,
> +                                    "Failed to wake up SMC");

Why not on one line?

...

> +static const struct of_device_id apple_smc_rtkit_of_match[] = {
> +       { .compatible = "apple,smc" },

> +       {},

No comma for the terminator entry.

> +};

...

> +static struct platform_driver apple_smc_rtkit_driver = {
> +       .driver = {
> +               .name = "macsmc-rtkit",

> +               .owner = THIS_MODULE,

Unneeded dup.

> +               .of_match_table = apple_smc_rtkit_of_match,
> +       },
> +       .probe = apple_smc_rtkit_probe,
> +       .remove = apple_smc_rtkit_remove,
> +};

...

> +typedef u32 smc_key;

Why?!

...

> +#define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])

If s is a byte buffer, the above is NIH get_unaligned_be32(). Or in
case of alignment be32_to_cpu() with respective type (__be32) to be
used.

...

> +static inline int apple_smc_read_flag(struct apple_smc *smc, smc_key key)
> +{
> +       u8 val;
> +       int ret = apple_smc_read_u8(smc, key, &val);

Split assignment and definition.

> +       if (ret < 0)
> +               return ret;
> +       return val ? 1 : 0;
> +}

...

> +#define apple_smc_write_flag apple_smc_write_u8

Why is it needed?

-- 
With Best Regards,
Andy Shevchenko
