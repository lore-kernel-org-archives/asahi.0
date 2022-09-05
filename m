Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A212561
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 14:43:24 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id a22so6218258qtw.10
        for <asahi@lists.linux.dev>; Mon, 05 Sep 2022 07:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7v5FOOLdYwdsxSG69jSBYyu9WWlJmRm14US74QjJnDs=;
        b=iobyYV4YHb+9WxY4ehI5eM3twNy2598O1GpSbSRuDv9F234PY1Tl6I1t8OCoWUeSOW
         WUGW06ZOKMRMgu0kigvUpCzCw13umaW7qIiXbrMrxbBeVqFtWf6dwKq1qPxUobzt0ym/
         SbsDOU0DXDZc5m/CF70JVWv7C75WLR796SyLIHbwhB/NVXy1mwyq1mFia/TRgfqMkjfB
         zU3wHEaxMQsMhZ++LgZ2D7pi9d4dLVR/34U5plZ62ZI96s6JNepu+GabdRoFf3MTXWJq
         i7f/5jIcnVdJ8ycDxX+l72A1zjSv09sHEutiSJzGgEJHtriL3OD0KW4feqvh30IDZ7FU
         7aQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7v5FOOLdYwdsxSG69jSBYyu9WWlJmRm14US74QjJnDs=;
        b=Db8H6cRVtf3YfgP9q/2EMeHSnrrZIa2nDrb195jO35sWA5QfujSVNnG1TqlMQ2kGdc
         SWUhYYpp/+HYHazUhstb40lnTg8Lhb+E8JffpF49x+FlFKtE3taLzRUzZdPbUMDSDlrF
         Kix2ZGmHHejLbUPkEf3oX9ZsqXKM2Ml+mCmvLMBk3DUAYRFg8zrxHA/IjEthNT9Ieia6
         ZK9hBHU2IB7vknBFM6avjQr3MX7QPgp468CZ+ZS5IsUDxGnml8C/H7Ct/b3yFrVVyB8T
         MvQhN/pSNyHtcJWrQydLDuLlhJTfCrFQYsNyY7R7J+gNZ/9EwdyGybOTaP0VqwtDthHW
         BE4g==
X-Gm-Message-State: ACgBeo3EnLu1l5RYL1logyBt/CPOkzyik3KOoYApzRdQNw/tE03mNXD/
	VHKGPi9vRRSkQ4kyWtEBFx4qwcpi+zW1n37x3HgwDMnToWg=
X-Google-Smtp-Source: AA6agR5gIIBAC5RARGKi4D/n28ff3ZYzSHL8AHcEcioACVL0822fiOKz55Y4VaTkO2LUwHLdMVsU5l7raus1LFqlw48=
X-Received: by 2002:ac8:7f92:0:b0:344:8cd8:59a1 with SMTP id
 z18-20020ac87f92000000b003448cd859a1mr40695434qtj.384.1662389003092; Mon, 05
 Sep 2022 07:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk> <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk> <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk> <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk> <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
 <YxYBJcRGCOlcSZH8@shell.armlinux.org.uk> <YxYBeMz8nIIA+1P/@shell.armlinux.org.uk>
In-Reply-To: <YxYBeMz8nIIA+1P/@shell.armlinux.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 17:42:46 +0300
Message-ID: <CAHp75VdYevopN673hqg7Tau4Fouythq7OAeDDJP4C4fh7KgYyw@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 5, 2022 at 5:02 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Mon, Sep 05, 2022 at 03:01:09PM +0100, Russell King (Oracle) wrote:

...

> Oh, and another thing. Your behaviour on this is making me regret
> trying to get involved in improving the upstream support for this
> platform.

Taking into account that technical aspects quite likely are not the
cause, what did you expect to be different?

-- 
With Best Regards,
Andy Shevchenko
