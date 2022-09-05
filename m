Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D2A7E
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 13:17:04 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id j1so6369577qvv.8
        for <asahi@lists.linux.dev>; Mon, 05 Sep 2022 06:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=NlE6AanfqGfcKbgEmtLqkGJmZOunkjR9Q3eahuiuxMU=;
        b=D0W69AKc7L/tUbEQRd7/BKzzp95z9zlLiyFLZ6F9vdcnNlXP3KyIvMngklvB1PqnuC
         AZdt5Bq/IEHGknkg7QKKDzoCMq3RMC3vfmYKM04RCe1LQNiSTGsL0p6c9ZeYpGcQUiuD
         5kEYePWjwQFByT1LHBAW+UsSGgO5p4ZqCzyU9aS5/gd68445oQS0b27Fjb8DLohU9b1n
         yNwV6xx6nRxP9Z+8E//Z/a8DcllkVWHbf/MZGvOCUP6HUy+xmR9r/dmen7qP9D+74xTs
         IJuR278X2Q8L047d9KZXj57JTOUuGm6zow1O4roIHPN+Rc9xRrDXk+mxqRMJMRqVe4JQ
         4YYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=NlE6AanfqGfcKbgEmtLqkGJmZOunkjR9Q3eahuiuxMU=;
        b=7crs2NbtP2Y5Sn+QcfkSjzRReyzWG/pMezqdBKr1K88MXNmWd8DjeziGfp2wxAZ0qG
         kAM2+JpoXsYGY5KKy87H6kBzQi6uW0qKP2+O1SXQXLVjyEn1EROHnR6ek/a62NQHXmOX
         Ay2J5Ihu4BCIqOYnqUbKwFk5c+iUi8uFr3IiK9kNC5ALGfTJnhvwjbyw/d++ocZMQYfn
         s9GzEY6XiZi7q8dcLuLtf82L1Z3gZX0oGVs3ELShJ+WkLp4jyWYvq3O6nq8Uj/wLg5kp
         dSd5SGvShPfj7FBEu3lfneQtINN0EuMp4svpoYAVVwMoZdukXPC2ffrwCd+6UGrolRup
         zUGQ==
X-Gm-Message-State: ACgBeo35cvfU3+ufygD/XBeTH86KFdlHsIHG1D/hDvQrvqQ8y+QEqM0L
	288gZGVgk7ye0q8gyernfnNHS+nx5ZD9gUdbq9c=
X-Google-Smtp-Source: AA6agR4Pvtm8q8Fc626MULHCblOFgk4eor+fMFKPZ1Z6Wp0NfiQ/zw5cAa4H1Nx5ANEpVJQ/p7eC+TRMpTmqn8T+/H4=
X-Received: by 2002:a0c:e24b:0:b0:4a1:d41b:e280 with SMTP id
 x11-20020a0ce24b000000b004a1d41be280mr5955701qvl.11.1662383823460; Mon, 05
 Sep 2022 06:17:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk> <CAHp75VeO3gxypRTUc9Subvh+NZ7X4_RR=eFUZpPNwBeWk+_ipg@mail.gmail.com>
 <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk> <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk> <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk> <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk> <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk>
In-Reply-To: <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 16:16:27 +0300
Message-ID: <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 5, 2022 at 4:10 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Mon, Sep 05, 2022 at 01:32:29PM +0300, Andy Shevchenko wrote:

...

> Let me say again: I am not changing this. That's for Asahi people to
> do if they wish. I am the just middle-man here.

While I agree on technical aspects, this mythical "they" is
frustrating me. They haven't participated in this discussion (yet?) so
they do not care, why should we (as a community of upstream)?

P.S. Do you have a platform to test all these?

-- 
With Best Regards,
Andy Shevchenko
