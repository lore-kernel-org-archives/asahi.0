Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2B07E
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 13:21:51 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id cb8so6142894qtb.0
        for <asahi@lists.linux.dev>; Mon, 05 Sep 2022 06:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=tRVO25AcCcbSeZW/Fy4DwIgCZUwPpZ+5FJPg/p61Qg0=;
        b=Nes/Mg2wXfdFvd7AZumPHtZsU2I8sbHfQphfdXYmzjv6f9hQUd/1h3Agnvuh9NVwWp
         UPVhQGc08SO9jJd2a6GlmqJ4+9GtSmsa6EzSPO6SdN0fvlJDCSwSMhFW57tglel0hGMI
         P158xTd8k5CiBy6v1oMdb5sCIUVvwDeUWXPAH6PBBRlAKxMIP+3NMV7pAG8dRDFzwHzK
         dASvf0jaoGrydYS8AAUJg7VsEh7erKQgtUzxVdoEpL5cwiXhowUuV1rY9670y8kR1nqH
         4BW0nForbuUh1ObCNulHVB8LIYISBM7+0hvFAJqbkutOSleRNZQKcnjnyW5Yyj7Yi/ju
         SK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=tRVO25AcCcbSeZW/Fy4DwIgCZUwPpZ+5FJPg/p61Qg0=;
        b=uG1ALEZYuVjpRgBelYWWoBIeCPgkxruZs/96Xf5J+tLZSBBrrdgalXGf3R4XP0ieJB
         iyV3YrtLW0fUs53EF8R/3L9EwvQWo1HJ54geL1Z7wTZAggsK5RHi+PLSGqrRUymfK7RZ
         mdSnIbPOSp1OSqY/8zPCBWen21gsKpvSZePXqoZrLPvBfEfrHJa0EmhMbFNMlrybjdOp
         vbV736nNvUR9qI4FPMAHhwffQui8lwU8AEt26FhEVbRjWFLb8Hc3qsi3la/R/Et1/6Rw
         ViffvIVXjbbfLB4PF7v6cd8Qp+cKS0ajz3lGcrTRfvraqKLvvgwP0C5WEwInFUOA/Ozr
         odOA==
X-Gm-Message-State: ACgBeo1b1Rz2xm8NOJ5DQHK7s856vKyo9qRbmSwS1qSgR1PU5+5Bdumz
	hzE47nnyrmxbcikk9j8EArtoWewWsZYpwTEusR4=
X-Google-Smtp-Source: AA6agR5WC9BIvyhF37182/SlXTa2ogTIjrHQEXlHRBYbwVP4xYmsR20rLV75XEOC4tjrsXaYitpjnwospoQni6JysHk=
X-Received: by 2002:a05:622a:40a:b0:343:77ba:727f with SMTP id
 n10-20020a05622a040a00b0034377ba727fmr39864351qtx.481.1662384110603; Mon, 05
 Sep 2022 06:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
 <CAHp75VfW7uj=+vwGRLsUJEjF-bQLL2EdVNfAnF6iDUqryksC+w@mail.gmail.com>
 <YxXjimYiR+cxasgE@shell.armlinux.org.uk> <CAHp75VeDGCp8J6wnmCqGpV++vs2Zur9Mfp71Dk8dVXcuHFnCrQ@mail.gmail.com>
In-Reply-To: <CAHp75VeDGCp8J6wnmCqGpV++vs2Zur9Mfp71Dk8dVXcuHFnCrQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 16:21:14 +0300
Message-ID: <CAHp75VeGb9oG_MDgE-K=aHPrURw9ZPnhRdcpoGGQnURptmdNnA@mail.gmail.com>
Subject: Re: [PATCH 6/6] gpio: macsmc: Add IRQ support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 5, 2022 at 4:04 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Sep 5, 2022 at 2:54 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Thu, Sep 01, 2022 at 09:03:49PM +0300, Andy Shevchenko wrote:
> > > On Thu, Sep 1, 2022 at 5:18 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:
>
> ...
>
> > > Usually we want to have handle_bad_irq() handler by default and in
> > > ->set_type() we lock a handler depending on the flags. Why is this not
> > > the case in this driver?
> >
> > "lock a handler" ? I guess you mean select a handler.
>
> Yes, I was a bit confused by API naming (irq_set_handler_locked() was it).
>
> > I don't see a reason why we couldn't switch between handle_bad_irq()
> > and handle_simple_irq(). I would guess (I don't know the implementation
> > details of the Apple platform) that the SMC forwards a message when the
> > IRQ happens, but I'm guessing that this is well tested on the platform
> > with the simple flow handler.
>
> I have had a real case where it makes quite a difference:
> eb441337c714 ("gpio: pca953x: Set IRQ type when handle Intel Galileo Gen 2")
>
> The missed ->irq_set_type() call shows a bug in the IRQ flow in the
> code. This became visible due to the switch to handle_bad_irq() and
> was hidden with other default handlers. After this I ask people to use
> the default handler to be a "bad" one.
>
> > Changing it to something else would need
> > discussion with the Asahi Linux folk.
>
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
