Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD282561
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 15:01:31 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id w18so6432697qki.8
        for <asahi@lists.linux.dev>; Mon, 05 Sep 2022 08:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=pZWC1H0WRkhRCjv9BDpPVFJARK9SyE80gpwJCZgud4M=;
        b=BBGj82V2TczLpiRO5dd4Tiqb87w52xNP5e4u5Gr2j3otvBMR9DqfP6GwayIBpTpvri
         V1MO1eQ6/H1RSegcPxFfgJfRnMchoT2OosFXudFcjFecO5QGzYlW7SNLS6Fiyg50qi0N
         hq/6ZqE8oXM5R6h+meBzDusU8a1hzXCzL1jhX20lzIBuuIqMzTvwedNCBRu10fLVQbLj
         NN4Keee3qpZ/0bkD4JY+S/fQ21Zh53nfsv9u7osGBDGZNfh0VQoAujyBnmOLRH5sulms
         JyCm4DN9syy950Poe70aGOPoRqauzTE3hJuzHEmKAxLR9gNj/3Ggs+kCPDoDijxTNPbt
         mscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=pZWC1H0WRkhRCjv9BDpPVFJARK9SyE80gpwJCZgud4M=;
        b=7uQCtu2Xp8PgbuHzS9hBwTh5YItamrPV9YzOMGf12LlQ1eZcOg7l4HJBmnr1MAQyfY
         gSYX2BKDfxSF7VwYfOTXE+Vc2MBQSKbYY0rZw3lx5Tdx10gHedMJoegYZrnrlFv0OZov
         vZJb4Of1nAXTw8W6UzMXaTpQ4660aOAt/gIAFD5TGFGHtIj7N3UqjJXh1gM9RBapxSUB
         aySd37aPmaIYUwoRVKhljsJHge7sf6Wnxr2fui1yHsce1xrTYezh4ei3msmKnxRa61G7
         t3bvFL9TPpJc3/zM1k7e46y7sTfv5gr3L3NXHJnFudpfGluVHK/VOjgh0msm2vq/Lq2k
         UOHw==
X-Gm-Message-State: ACgBeo24uS7q1UVUxLTAMhRWa44RRIs8FyRg3I+zEGne6Te+SA4Ax9JG
	Ma6Y4VS6gG/l36EOqwUkoyiL8fLr4ILiSGCp+As=
X-Google-Smtp-Source: AA6agR62F2MQpI3xuf0uJbOxKJR8qhHj40PD/Xifr6TPFOael1V1jBsitUPEMphr+JiDSmUzty4eFWgSTO8li5KUncM=
X-Received: by 2002:a05:620a:410e:b0:6bc:5cdc:88ec with SMTP id
 j14-20020a05620a410e00b006bc5cdc88ecmr33097183qko.734.1662390090769; Mon, 05
 Sep 2022 08:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
 <CAHp75Ve1ackTCOAkVar00OyDW-+BOPbRmsJRH3-z1bdNaukC+Q@mail.gmail.com> <7f20d473-7bbc-b0b3-3daf-dfc935ca3151@marcan.st>
In-Reply-To: <7f20d473-7bbc-b0b3-3daf-dfc935ca3151@marcan.st>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 18:00:54 +0300
Message-ID: <CAHp75Vd3O35mHEqA-iR=Fm47y1R2dPu_Jk7wcutvSmUxf6zpCg@mail.gmail.com>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
To: Hector Martin <marcan@marcan.st>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 5, 2022 at 5:45 PM Hector Martin <marcan@marcan.st> wrote:
> On 02/09/2022 04.26, Andy Shevchenko wrote:

...

> Andy, no offense, but you drive-by everything I try to upstream (or
> author in this case) and half of your suggestions are wrong and I have
> to waste my time explaining why, and most of the rest are negligible
> style nitpicks. Every now and then you point out some useful kernel
> function that I didn't know about, but your signal to noise rate is
> terrible. Please put some effort into your reviews. It feels like you're
> on some kind of quest to review as much code as possible, without the
> slightest care for quality.

Okay, if I ever review your code in the future, I'll try my best.

-- 
With Best Regards,
Andy Shevchenko
