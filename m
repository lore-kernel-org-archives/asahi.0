Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD772561
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 14:51:14 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id c6so4168684qvn.6
        for <asahi@lists.linux.dev>; Mon, 05 Sep 2022 07:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=iyTWUBiH4KvR7pcKXS2jPADeIeoeEXr3QQvuHDkri7U=;
        b=d/MoG+AXkcmyInH51BA8iEehVDmRIfMMWN8w0fhSfmZ0zhOUKSdhev4PCHtUZAetzK
         Mhu48meRhI3mhARmOCQiOO9TZNxJiqpsP365fSP+9CTO3XwBHl3JTz6euXZQojYMJ6BT
         yS9W/vCxuEpQHSNo+cBeyR2h6p2FDhaHzKgOVYfbqJaq/2UUKJgCDsmZXHfB0Ykry2J1
         MZMRcuYq3FVbWf4x9kF73RrmzBR772zfBBqtuVB4DP2evGP7tYBAKeL0E/oaf+I/P9ZS
         C7LDehO/Rm1daP5JBpaGycRfUsdt6OXJKT+w7ZgUlwuUSikxRZWUZrvf+GTCIuEyVIar
         nS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=iyTWUBiH4KvR7pcKXS2jPADeIeoeEXr3QQvuHDkri7U=;
        b=7Mx5srnJvtxk4vxGbH6wVNpMQ2vA3c8Q8srjNI7DTKtfphwWudSGu0u+4SF9i/xzRu
         pF+ytLEP1vKWkFK2aT+PAH/H1En0PHIBFtLyFL3JsTKeq4QuwDlmMD88TIT64pufA24z
         vKR88dMnUCCZwHBQy3Dp8GcNfrxnCUfh6HkyCNP7w5rK3Xjr3PWa/T/MfHBG/uLZkU5E
         iG6KCSm+fRul52ZvrjV4FJ9g0BiIDDq4cS7XwFJYxMAGcaywGWJ1cs4s1SXjzxQxc157
         1fzWgvuB/USVyhEjQ8hSkQjWDh4Dl6mDJQDscQ5wobrA4Mend+XZm731e3dTcTJoV6Gm
         TkBg==
X-Gm-Message-State: ACgBeo2pNgZR9IcQ/B97byTfizZWqpWP5UHuQGO7ZCDDPcIYsOh0ZVv1
	B3+eusWMMy0bCDt7hgdk2uf0RT441O/cow8QPsk=
X-Google-Smtp-Source: AA6agR6JYjzY5gmBrhsug4WwP1RtoTU/ZC7d4148p42CCnEcxUqFT3FMueTBtOVrGNADgeSFtQ+mTvKvJQFz4jWjaC0=
X-Received: by 2002:a05:6214:19cf:b0:4a9:4241:2399 with SMTP id
 j15-20020a05621419cf00b004a942412399mr1963529qvc.64.1662389473434; Mon, 05
 Sep 2022 07:51:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk> <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk> <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk> <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk> <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk> <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
 <YxYBJcRGCOlcSZH8@shell.armlinux.org.uk>
In-Reply-To: <YxYBJcRGCOlcSZH8@shell.armlinux.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 17:50:37 +0300
Message-ID: <CAHp75VcLJ4ZuMFUw23PDJEDUNYfvzitXSaE5aWvxE9-u3TAVoA@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 5, 2022 at 5:01 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Mon, Sep 05, 2022 at 04:16:27PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 4:10 PM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > On Mon, Sep 05, 2022 at 01:32:29PM +0300, Andy Shevchenko wrote:

...

> > > Let me say again: I am not changing this. That's for Asahi people to
> > > do if they wish. I am the just middle-man here.
> >
> > While I agree on technical aspects, this mythical "they" is
> > frustrating me. They haven't participated in this discussion (yet?) so
> > they do not care, why should we (as a community of upstream)?
>
> That's strange. I wonder. If they don't exist, then I wonder how Linus
> is running Linux on aarch64 apple hardware. Maybe it's not me with a
> problem here?

You mentioned them several times in the thread and no response from them.

> Hector has been promising to get involved in this discussion for a few
> days now, his latest comment on IRC yesterday:

IRC is not an email discussion and if he is not alone in the team, who
else can answer the queries?

But it's good that there is an interest from their side.

> 16:23 <@marcan> I'm going to allocate tuesday to playing the merge game (rmk:
>                 haven't forgotten about you either, IRQs today, but I'll get to
>                 it before tuesday):
>
> So he is aware that he needs to respond - but like any central project
> lead developer, he's probably exceedingly busy with other issues.

> So, how about you stop insisting on changes until Hector can respond
> to some of the questions raised; as I've said many times, you are
> asking for stuff to be changed that is quite clearly in the realm of
> decisions that the Asahi developer(s) have taken, and I have no right
> to change them without reference to them - because I do not know this
> platform well enough to make the decisions you're asking of me.
>
> I'm not going to say that again; I'm going to start ignoring you if
> you persist in demanding that I make these kinds of decisions, because
> *you* leave me no other option but to do that... because *you* just
> don't seem to be willing to accept that I need others to be involved
> in these decisions.

If I spoke like this for all contributions, from our side to the
upstream, I would become a crazy guy, because upstream almost always
insists on some changes here and there in the patches which are longer
than a couple of dozens of LoCs and more than a single in a series.
It's normal practice to follow the latest available APIs in the
kernel. Nevertheless, I told *you*, that technically I have no more
issues. Let's wait for the technical response from them.

-- 
With Best Regards,
Andy Shevchenko
