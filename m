Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153BA1869
	for <asahi@lists.linux.dev>; Fri,  2 Sep 2022 13:39:53 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id e28so1465628qts.1
        for <asahi@lists.linux.dev>; Fri, 02 Sep 2022 06:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=6ejWKhNX3z+mJeAp0vohms4StWQ+ex5tKICo/SaWryk=;
        b=kSwA17VpbhWllmbIwG2SF+JSBHQYUlWfVjNTHklJsfTr1zc5UxpkXYm+cD5XZnKNIC
         lGbVayXtBZHyWNkR8Ajomc7c1IbD8webInQZ04rnoTXGTw0xdb7c/ig8tfJTYAMLt0cx
         ibe87KpvnyAygSi67QiRVgTjSUuQAw7vqIWifIbfQZ6vJaUNkksZCvCy5q1fy7q+Ys00
         27OA47Og+NdQrYjv8IYLofMBeRpKjy84y8Mr4oexJra2O3HMdoNE9pJrcpxEC3PxGGC7
         EAcfLmOp5MXfd+wFCQBW3BFS2VK6lyY9gQOA57teZloD+pWWh+iQbUgWe6na+zhuZKoV
         7cJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6ejWKhNX3z+mJeAp0vohms4StWQ+ex5tKICo/SaWryk=;
        b=wYPs/wRzl3WoOSOxhLemjRbae2I32DiDOAs2w5ITByYFBBK8xJCP5gRJFl6QVXLIJs
         lqrlsSMT3S0aBAGxvDhixOnXN5yT4iQOF2qY13G+vizuHGozaefZjzG82yHq+aq/WHo9
         MqV4mEh4qmDAQPbZUUxZQ1LWu61nqDPO/JIfw7irKQ+/5zcY9VwWCLXr8Yc5KXRcfQ+A
         sTTypbKNooNV+RJwGn/jRjLklPznWWDy63zRnbF/Kx2DuHx6y8SJ1xk1H6AiNzKOeEis
         8GlPb8+SO3kKUVnm524F2/3rZ9nv09PGttyD4ZPIIb95jRFXnUtMcLFGpK1FYGvHOjJy
         9KAA==
X-Gm-Message-State: ACgBeo2JMpKh36WGze7SaMPHI7vhrFW8b8BqcNRAEOBwGmTbrj+rvkdt
	0FDHPASRkpnACagOBg9oydKfsMqC+dQDdmbxb/I=
X-Google-Smtp-Source: AA6agR4UMfgaIkG2vGC2aly7nyNTuJKjT8PVOEv/c5wpoMmCkLfZKnsuheo1q1QgXeiZatP0AjQUB2zVifFAsos8OTE=
X-Received: by 2002:a05:622a:40a:b0:343:77ba:727f with SMTP id
 n10-20020a05622a040a00b0034377ba727fmr28567765qtx.481.1662125992956; Fri, 02
 Sep 2022 06:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk> <CAHp75VeO3gxypRTUc9Subvh+NZ7X4_RR=eFUZpPNwBeWk+_ipg@mail.gmail.com>
 <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk>
In-Reply-To: <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Sep 2022 16:39:16 +0300
Message-ID: <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 2:33 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Fri, Sep 02, 2022 at 01:37:14PM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 2, 2022 at 1:05 PM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > On Thu, Sep 01, 2022 at 09:55:23PM +0300, Andy Shevchenko wrote:
> > > > > +static int macsmc_gpio_nr(smc_key key)
> > > > > +{
> > > > > +       int low = hex_to_bin(key & 0xff);
> > > > > +       int high = hex_to_bin((key >> 8) & 0xff);
> > > > > +
> > > > > +       if (low < 0 || high < 0)
> > > > > +               return -1;
> > > > > +
> > > > > +       return low | (high << 4);
> > > > > +}
> > > >
> > > > NIH hex2bin().
> > >
> > > Is using hex2bin really better?
> >
> > Yes.
> >
> > > static int macsmc_gpio_nr(smc_key key)
> > > {
> > >         char k[2];
> > >         u8 result;
> > >         int ret;
> > >
> > >         k[0] = key;
> > >         k[1] = key >> 8;
> > >
> > >         ret = hex2bin(&result, k, 2);
> > >         if (ret < 0)
> > >                 return ret;
> > >
> > >         return result;
> > > }
> > >
> > > This looks to me like it consumes more CPU cycles - because we have to
> > > write each "character" to the stack, then call a function, only to then
> > > call the hex_to_bin() function. One can't just pass "key" into hex2bin
> > > because that will bring with it endian issues.
> >
> > With one detail missed, why do you need all that if you can use
> > byteorder helpers()? What's the stack? Just replace this entire
> > function with the respectful calls to hex2bin().
>
> Sorry, I don't understand what you're suggesting, because it doesn't
> make sense to me. The byteorder helpers do not give a char array, which
> is what hex2bin() wants, so we end up with something like:
>
>         __le16 foo = cpu_to_le16(key);
>         u8 result;
>
>         ret = hex2bin(&result, (char *)&foo, 1);
>         if (ret < 0)
>                 return ret;
>
>         return result;
>
> This to me looks like yucky code, It still results in "foo" having to
> be on the stack, because the out-of-line hex2bin() requires a pointer
> to be passed as the second argument.
>
> Maybe you could provide an example of what you're thinking of, because
> I'm at a loss to understand what you're thinking this should look like.

So, let's look into the real callers to see, oh wait, it's a single caller!
Why can't you simply do

         ret = hex2bin(&result, (char *)&cpu_to_le16(key), 1);
         if (ret < 0)
                 return ret;

in-place there?

-- 
With Best Regards,
Andy Shevchenko
