Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D81B1869
	for <asahi@lists.linux.dev>; Fri,  2 Sep 2022 14:54:02 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id mn13so1589284qvb.4
        for <asahi@lists.linux.dev>; Fri, 02 Sep 2022 07:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Z1FoDByrTZWQf8xOYstthBmZfghp9AbTB8bp4TVFvqE=;
        b=djvHEyvX0810i2C3OIadD3Ac8GkGncpPI4h8WBwIdY4Vb03BTtsCtckMvnaaBaKW9n
         XDejN62TR44iwMD4cKwRX29G07/UMNhFgdkinB7ol9dX0D/2N5Z/xORtTQ1lgua9rsz0
         7TFP1scrofVPDw70Uj+3pQ1/g+aIsXunmk3uIYMz1IZTRJA7mIjNiQ2Zbi6MmhcK4fAL
         Es/TKW2U/eiv35DLHz7nHPZMgx1GTy3+0tHSPK7VvsvmN/DuuZ/JlorO5EXhS0jLLCiY
         I4mTk3Ss86rJML9us41OPdmcTN30isCF2PnoxU4QXzAHMcWPTu/hnHTSd6hkap83WWGh
         AWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Z1FoDByrTZWQf8xOYstthBmZfghp9AbTB8bp4TVFvqE=;
        b=so8q2lXiNbrHreEHEBxmeZqWZBeYSuw+g9yiq1voRkLPVMWaaYKsJCVMDEl8fWCk95
         xn7NA5exnsHKUumkaxlXor+uaKJ4+4YUJ8CpqPkDydzqKcpyJ/XFOaIURoIfZWODZDe1
         UnwoLEbmG6iW2N4k0B6z5FYD650dLw7VMAaeyg3EzRK2sq/YgrqeGbqgShM5N3G4/KFS
         +XAQVEpc1yib9q794NW8x+7G1OVMmarnG605cpv4ZsvQOXr0FLCexwGgtstZAW45AVl+
         NZ8c0xGGeDsm6SLZ4yOoEkJEZKCgdJbqus7DSS0fGdYFMjWmem8a6R9nQLwVKHp0WjDA
         hz7Q==
X-Gm-Message-State: ACgBeo1ZpeNJjXlWucr5eeOSLuuje/9312mETWehhSG4+LOq6iXiEt2j
	eT7nbfdKmEFztyPyO+ygfLsMvPIRF8e1CRMPZJTZNQL91Qk=
X-Google-Smtp-Source: AA6agR7Wuy9szq8bHjZpsQQxogigYXgKA8UiUmgZN03dfUBr82HV3q1iyIocqv5H4Nb0EiZuwrSHjR6MCBxDmDydC1k=
X-Received: by 2002:a05:6214:c8f:b0:499:21eb:ba3b with SMTP id
 r15-20020a0562140c8f00b0049921ebba3bmr10744195qvr.97.1662130441457; Fri, 02
 Sep 2022 07:54:01 -0700 (PDT)
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
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk>
In-Reply-To: <YxIXPSZlEBcKYulW@shell.armlinux.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Sep 2022 17:53:25 +0300
Message-ID: <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 5:46 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Fri, Sep 02, 2022 at 04:39:16PM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 2, 2022 at 2:33 PM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > On Fri, Sep 02, 2022 at 01:37:14PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Sep 2, 2022 at 1:05 PM Russell King (Oracle)
> > > > <linux@armlinux.org.uk> wrote:
> > > > > On Thu, Sep 01, 2022 at 09:55:23PM +0300, Andy Shevchenko wrote:
> > > > > > > +static int macsmc_gpio_nr(smc_key key)
> > > > > > > +{
> > > > > > > +       int low = hex_to_bin(key & 0xff);
> > > > > > > +       int high = hex_to_bin((key >> 8) & 0xff);
> > > > > > > +
> > > > > > > +       if (low < 0 || high < 0)
> > > > > > > +               return -1;
> > > > > > > +
> > > > > > > +       return low | (high << 4);
> > > > > > > +}
> > > > > >
> > > > > > NIH hex2bin().
> > > > >
> > > > > Is using hex2bin really better?
> > > >
> > > > Yes.
> > > >
> > > > > static int macsmc_gpio_nr(smc_key key)
> > > > > {
> > > > >         char k[2];
> > > > >         u8 result;
> > > > >         int ret;
> > > > >
> > > > >         k[0] = key;
> > > > >         k[1] = key >> 8;
> > > > >
> > > > >         ret = hex2bin(&result, k, 2);
> > > > >         if (ret < 0)
> > > > >                 return ret;
> > > > >
> > > > >         return result;
> > > > > }
> > > > >
> > > > > This looks to me like it consumes more CPU cycles - because we have to
> > > > > write each "character" to the stack, then call a function, only to then
> > > > > call the hex_to_bin() function. One can't just pass "key" into hex2bin
> > > > > because that will bring with it endian issues.
> > > >
> > > > With one detail missed, why do you need all that if you can use
> > > > byteorder helpers()? What's the stack? Just replace this entire
> > > > function with the respectful calls to hex2bin().
> > >
> > > Sorry, I don't understand what you're suggesting, because it doesn't
> > > make sense to me. The byteorder helpers do not give a char array, which
> > > is what hex2bin() wants, so we end up with something like:
> > >
> > >         __le16 foo = cpu_to_le16(key);
> > >         u8 result;
> > >
> > >         ret = hex2bin(&result, (char *)&foo, 1);
> > >         if (ret < 0)
> > >                 return ret;
> > >
> > >         return result;
> > >
> > > This to me looks like yucky code, It still results in "foo" having to
> > > be on the stack, because the out-of-line hex2bin() requires a pointer
> > > to be passed as the second argument.
> > >
> > > Maybe you could provide an example of what you're thinking of, because
> > > I'm at a loss to understand what you're thinking this should look like.
> >
> > So, let's look into the real callers to see, oh wait, it's a single caller!
> > Why can't you simply do
> >
> >          ret = hex2bin(&result, (char *)&cpu_to_le16(key), 1);
> >          if (ret < 0)
> >                  return ret;
> >
> > in-place there?
>
> This is not legal C.

I acknowledged this, sorry.

> Please can we back up this discussion, and start
> over with legal C suggestions. Thanks.

Suggestion was given as well, let's create a helper used by apple
stuff and later on we will consider the separate submission for the
(new) specifier. Would it work for you?

-- 
With Best Regards,
Andy Shevchenko
