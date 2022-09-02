Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6710670E
	for <asahi@lists.linux.dev>; Fri,  2 Sep 2022 15:44:13 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id y15so1708998qvn.2
        for <asahi@lists.linux.dev>; Fri, 02 Sep 2022 08:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UgXKmXP3qAbjyGzd1JMU499QoF1XyZdD7xyoHrTdAkY=;
        b=ASxyuBrzGDXI+pkP7OqzqL7mMx9ZSCcQp9GN1bS09N6xZSsVwOTZOUv+QIIGL4l0+n
         anBhdaehwBP3bF+DY/LIB+MRQC82oUWv9607v4fWBFP8KDMNDUHesmd7U5OEVJPphOEn
         lab0XreUOYhJOV5sBP7OBLO5wTma4K677BiQB6OtpK7brbss2A3G1FIIPg+yo2A8xPJ+
         YBbjwl2dHsj1ccLQPvVwO1GbPXf/yZKgQVSDhXD40EZaxYD29dI45qBdijHGje0Ung+t
         sA19OPe767TnGzUBUIk8OWGNynLio4giXK1CaTUM3NkiV6cOs38D/LmT7gAaAxJ5Muou
         5cGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UgXKmXP3qAbjyGzd1JMU499QoF1XyZdD7xyoHrTdAkY=;
        b=dVxgLopucgXJS5fv2LX/Lwju0+u8hOoDBo/ZsGVVB4ws+jCQe4EK/K3ifZFLx4HbOH
         wHgMQS39X5BMjS5mkrVNY+5v08BMgo7RyPupHO/8tEvrDoubJ07tUB77DSyd2XUBxklB
         /6xfoV2iNbktaw6e+BcO/Z2Qt2Tc8pyO7MpiOcdD7E2kK38stHXAaW2xYYwrv/LDgSmA
         /Fua/EfhVqcdvWuwEbKe9fZ4Anfcd5oeLOZHGjUt+GQgbJRpuB23vbYSdt9PvHDDvvV7
         /hCmRaOC7cAmbD4OelzYIjhrfpmd7WzJwlaVm18rsoVjICgY/KEoAImpmRW90Ld2dZwu
         wLHQ==
X-Gm-Message-State: ACgBeo1sjAwwk+Rsb1zSgGQ04JtgZSh1kfoLCSdBZCilq6tiavo1jb6J
	9wBIXzoamErkyduW4TftV9Noi8LAuKFOEiTBPNg=
X-Google-Smtp-Source: AA6agR6MgeeHESF3KCL7tIuwnR5HEJl0wIhvyQVHmi5qO68ghFAcdXDaH+lE+aTpvVN3Ax95GN4S6RaJ/+wMxkT5PFQ=
X-Received: by 2002:a05:6214:c26:b0:499:19f1:1a73 with SMTP id
 a6-20020a0562140c2600b0049919f11a73mr13991772qvd.48.1662133452758; Fri, 02
 Sep 2022 08:44:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk> <CAHp75VeO3gxypRTUc9Subvh+NZ7X4_RR=eFUZpPNwBeWk+_ipg@mail.gmail.com>
 <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk> <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk> <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk>
In-Reply-To: <YxIifddpeJRCuImc@shell.armlinux.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Sep 2022 18:43:36 +0300
Message-ID: <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 6:34 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Fri, Sep 02, 2022 at 05:53:25PM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 2, 2022 at 5:46 PM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > On Fri, Sep 02, 2022 at 04:39:16PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Sep 2, 2022 at 2:33 PM Russell King (Oracle)
> > > > <linux@armlinux.org.uk> wrote:
> > > > > On Fri, Sep 02, 2022 at 01:37:14PM +0300, Andy Shevchenko wrote:
> > > > > > On Fri, Sep 2, 2022 at 1:05 PM Russell King (Oracle)
> > > > > > <linux@armlinux.org.uk> wrote:
> > > > > > > On Thu, Sep 01, 2022 at 09:55:23PM +0300, Andy Shevchenko wrote:
> > > > > > > > > +static int macsmc_gpio_nr(smc_key key)
> > > > > > > > > +{
> > > > > > > > > +       int low = hex_to_bin(key & 0xff);
> > > > > > > > > +       int high = hex_to_bin((key >> 8) & 0xff);
> > > > > > > > > +
> > > > > > > > > +       if (low < 0 || high < 0)
> > > > > > > > > +               return -1;
> > > > > > > > > +
> > > > > > > > > +       return low | (high << 4);
> > > > > > > > > +}
> > > > > > > >
> > > > > > > > NIH hex2bin().
> > > > > > >
> > > > > > > Is using hex2bin really better?
> > > > > >
> > > > > > Yes.
> > > > > >
> > > > > > > static int macsmc_gpio_nr(smc_key key)
> > > > > > > {
> > > > > > >         char k[2];
> > > > > > >         u8 result;
> > > > > > >         int ret;
> > > > > > >
> > > > > > >         k[0] = key;
> > > > > > >         k[1] = key >> 8;
> > > > > > >
> > > > > > >         ret = hex2bin(&result, k, 2);
> > > > > > >         if (ret < 0)
> > > > > > >                 return ret;
> > > > > > >
> > > > > > >         return result;
> > > > > > > }
> > > > > > >
> > > > > > > This looks to me like it consumes more CPU cycles - because we have to
> > > > > > > write each "character" to the stack, then call a function, only to then
> > > > > > > call the hex_to_bin() function. One can't just pass "key" into hex2bin
> > > > > > > because that will bring with it endian issues.
> > > > > >
> > > > > > With one detail missed, why do you need all that if you can use
> > > > > > byteorder helpers()? What's the stack? Just replace this entire
> > > > > > function with the respectful calls to hex2bin().
> > > > >
> > > > > Sorry, I don't understand what you're suggesting, because it doesn't
> > > > > make sense to me. The byteorder helpers do not give a char array, which
> > > > > is what hex2bin() wants, so we end up with something like:
> > > > >
> > > > >         __le16 foo = cpu_to_le16(key);
> > > > >         u8 result;
> > > > >
> > > > >         ret = hex2bin(&result, (char *)&foo, 1);
> > > > >         if (ret < 0)
> > > > >                 return ret;
> > > > >
> > > > >         return result;
> > > > >
> > > > > This to me looks like yucky code, It still results in "foo" having to
> > > > > be on the stack, because the out-of-line hex2bin() requires a pointer
> > > > > to be passed as the second argument.
> > > > >
> > > > > Maybe you could provide an example of what you're thinking of, because
> > > > > I'm at a loss to understand what you're thinking this should look like.
> > > >
> > > > So, let's look into the real callers to see, oh wait, it's a single caller!
> > > > Why can't you simply do
> > > >
> > > >          ret = hex2bin(&result, (char *)&cpu_to_le16(key), 1);
> > > >          if (ret < 0)
> > > >                  return ret;
> > > >
> > > > in-place there?
> > >
> > > This is not legal C.
> >
> > I acknowledged this, sorry.
> >
> > > Please can we back up this discussion, and start
> > > over with legal C suggestions. Thanks.
> >
> > Suggestion was given as well, let's create a helper used by apple
> > stuff and later on we will consider the separate submission for the
> > (new) specifier. Would it work for you?
>
> This sub-thread isn't about the %p4ch specifier. It's about a
> reasonable implementation of macsmc_gpio_nr().
>
> Extracting from the context above, the original code was:
>
> static int macsmc_gpio_nr(smc_key key)
> {
>        int low = hex_to_bin(key & 0xff);
>        int high = hex_to_bin((key >> 8) & 0xff);
>
>        if (low < 0 || high < 0)
>                return -1;
>
>        return low | (high << 4);
> }
>
> I suggested:
>
> static int macsmc_gpio_nr(smc_key key)
> {
>          char k[2];
>          u8 result;
>          int ret;
>
>          k[0] = key;
>          k[1] = key >> 8;
>
>          ret = hex2bin(&result, k, 2);
>          if (ret < 0)
>                  return ret;
>
>          return result;
> }
>
> You didn't like that, so I then suggested:
>
> static int macsmc_gpio_nr(smc_key key)
> {
>          __le16 foo = cpu_to_le16(key);
>          u8 result;
>          int ret;
>
>          ret = hex2bin(&result, (char *)&foo, 1);
>          if (ret < 0)
>                  return ret;
>
>          return result;
> }
>
> which you also didn't like,

...based on the wrong suggestion below. That said, the above is fine to me.

> and then you suggested something that isn't
> legal C. So, I then asked you to backup this discussion...
>
> As I've made a number of suggestions, and you've essentially rejected
> them all, I still need to know what you would find acceptable for this,
> because I'm out of ideas.


-- 
With Best Regards,
Andy Shevchenko
