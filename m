Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410204416
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 15:44:16 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1662392653; bh=NLba8lc0pkWgzOMx+tSiHBynnT+i06gpNWGJ9Hu70rk=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=Fu5vMmgmziBcdAAiyJsUApSm/ErshYXUGYAYZwh9qY8mwKhKgycj4EE1RRsPwvZCB
	 jqlR4O2XGJmOvZPYYzJk1eafdXa5/vqbzfMxMlePc2icQJSuuLBptNTki3ZqdBX4ZI
	 rz/y24yxIy0BKKN3AFnbB/QHBUaBHIoF+UbN5Mrk=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
In-Reply-To: <YxYWdDUBNOV+DaU0@shell.armlinux.org.uk>
Date: Mon, 5 Sep 2022 17:44:09 +0200
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 asahi@lists.linux.dev,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Hector Martin <marcan@marcan.st>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Sven Peter <sven@svenpeter.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FD0C690B-DFA6-4CF0-8C54-8D829F0ABE2B@cutebit.org>
References: <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk>
 <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk>
 <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk>
 <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk>
 <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk>
 <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
 <YxYWdDUBNOV+DaU0@shell.armlinux.org.uk>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>


> On 5. 9. 2022, at 17:32, Russell King (Oracle) <linux@armlinux.org.uk> =
wrote:

> I still need a resolution between you and Hector over the smc_key
> issue - specifically, do I pick up the patch that adds support for
> %p4ch, or do we re-architect the smc_key thing and also in doing so
> get rid of the need for your "endian conversion" thing.

Idea about the %p4ch thing: We will leave the keys true
to their nature (i.e. 32-bit integer), and at least initially
for the prints we will employ macros

#define SMC_KEYFMT =E2=80=9C%c%c%c%c=E2=80=9D
#define SMC_KEYFMT_VAL(val) (val)>>24,(val)>>16,(val)>>8,(val)

used like

printk(=E2=80=9Cblah blah=E2=80=9D SMC_KEYFMT =E2=80=9C blah\n=E2=80=9D, =
SMC_KEYFMT_VAL(key));

This has the nice property that it is pretty much like the specifier,
and later can be easily replaced with the real thing.

--
Martin

