Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3E03239
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 19:10:18 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id nc14so18761857ejc.4
        for <asahi@lists.linux.dev>; Mon, 05 Sep 2022 12:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=R22dyG0yqcuhYb9YD9cYalho8rvzbosoNRaxUmrXNSU=;
        b=VBhrJH426IPPB0Alau62UZZryc6Mi8bDJNT72dFyop/+n3ishXd5jhozrDodyzAQne
         uGpnu3a5FS02mgYQULUfRL5ZtQjw/xomrosSs+RhPD9MIU3Dw0PqjewlawTPKSvLWw+j
         3goMg04q/6Sc1M08aCYPWjkhB4WBl2fbvumciwxFZsAoMxIE5nz+3bbLMoLJIFWxobQP
         0ckdXuWisvg1QPNi7EWJf9deHTgCZKMMfL1KwZexl+Eb4bcmbzwFgEWDWrGIFIIfAAzG
         GXKB7jXQmq7AzmNkdPOSQmGUisbovaHTAgo0OiuTkuPmhvlvBcYeaWrZMGgxNw/9O3eo
         Xcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=R22dyG0yqcuhYb9YD9cYalho8rvzbosoNRaxUmrXNSU=;
        b=UBk+oVZAR/z8v0AYTXFL9YjD7Yeo4fSQwfj8Z0F7qRXWXTGqpzZE+y+R7HlbrUKAWM
         af/2QGKWP7oOD1sX90Iwz2/7m8O+lSEHx2QrvWdaV7iRAcMZrvA53qBzAeUcqrx8dojH
         AhB46DXtwawT2wHmjBxa0vWuMU37u5ofF2dw8k28zG2zfCCJ0HCwX+SaQ5xFc7PplVF1
         dS3Q/XnrU5+Y4hxi8qPurEa3nnRRlBi2qV1nZgsfA5sf0wEVp3kY3gTRceYhKhmz7joN
         oXssKuBI0igDx3wAMv1IO0IiujdoPDBBL3M6uNyHkGjkMUfmHj0Q3MOaJpAB8qmmTS9k
         OXrQ==
X-Gm-Message-State: ACgBeo2nRv0ae7CzqZQZ6Ij1w0uhD7ew89j9LaZ32p4AlXP01nFENDdT
	huNye8lbqk2icxWrfZeCVWBPt9D/Mod+81GxSXFNSA==
X-Google-Smtp-Source: AA6agR51Gz8yHkbQoGBNHqvtBQu6detP0ZUT0cLmLi6LZ322J95iaEXCADFjTwZknsq3JisTHUa6t8e8EIAKHJF6Cl4=
X-Received: by 2002:a17:907:7242:b0:741:770b:dfc6 with SMTP id
 ds2-20020a170907724200b00741770bdfc6mr27954518ejc.203.1662405016470; Mon, 05
 Sep 2022 12:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk> <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk> <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk> <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
 <YxYWdDUBNOV+DaU0@shell.armlinux.org.uk> <FD0C690B-DFA6-4CF0-8C54-8D829F0ABE2B@cutebit.org>
 <57c02bdd-4f98-40f7-22a9-4f39508159e8@marcan.st> <YxYgL+MAJ7oUmLQd@shell.armlinux.org.uk>
In-Reply-To: <YxYgL+MAJ7oUmLQd@shell.armlinux.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Sep 2022 21:10:04 +0200
Message-ID: <CACRpkdYEQGobV30EDVd_ZYJ=PYE9nqyKhNT_W9xEjM3Grwrb5g@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Hector Martin <marcan@marcan.st>, =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 5, 2022 at 6:13 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:

> I suggest that I try resubmitting the series with IRQ support dropped,
> and with the %p4ch support in it and we'll see what happens.

You can add my
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
on the result, and the code should go in when Hector & you are
happy with it. I surely trust you to fix the final polish.

I don't mind the IRQ patch either, but I understand it's a bit
annoying if you can't test it on anything.

Yours,
Linus Walleij
