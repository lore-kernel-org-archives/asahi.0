Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A564A24
	for <asahi@lists.linux.dev>; Tue,  6 Sep 2022 13:39:33 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 1C1F85C015A;
	Tue,  6 Sep 2022 09:39:32 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Tue, 06 Sep 2022 09:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1662471572; x=1662557972; bh=d3
	HdEUqOxRr2NiqMbqhCIYCoCrUQqQyaV7J3bTAdtKQ=; b=srbEmYpKatpJZaqV+u
	EFOsbgo7m2H/U8VWxATh+56Yut4FnULRHAAxEWYKjbWvkDwI9/PkdFPV7sImol/v
	SiF0APg8HpeutY6HX0NEL40SUOZTpDU01fFWNDZunzpyQOD030nV4sjtziblw0B9
	tlA+Q+OegM1YuaZisrMnjn6gqj930t/XB7KzVC4VFKGjnZFSqMmgkEZHdyjY6VBS
	3gd4d95nxsTRwY+u2lqcQHDeFD3pIEz5kvlZGg4jMb8OQQNcmaFy5Swi5VyfzIi5
	EBgGRHlhYPWGOECzQYngj7kkpY7MxKG9Z83Kr7lhE83isBKJErxsV3scJEU21Y7E
	duag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1662471572; x=1662557972; bh=d3HdEUqOxRr2NiqMbqhCIYCoCrUQ
	qQyaV7J3bTAdtKQ=; b=AVeNnzBS2wOwJ8jOObc8OzW9MrE6rIpFOOEZudovSkIg
	gXyp523yoJlctVcPCuC0jxNGyUGKyKskj0SxVZtGvgn8YK9BwI6aXuLEIi97echU
	4LxN5ih9IdSgsxigVApgk+EIu1mdXh0oph+ID7ptdJnbwz2szKsvXpeb1BlVZwGL
	pQvHBPSaSM6i8MTsYHPfsHwlRUc8c2xT4kQokfkWNSCq6M8sUfUMqqmPBzCSafvZ
	z4g9Wlr+/d1JSYxSpkf7B4nFV9ptPWU/s07PzJ5ET/jzSeixSv3coKRAzpWtoiJu
	YhKoJAIYsh+z+uG+WsbIxJPjiy7RKLbMAas+RN6XeQ==
X-ME-Sender: <xms:kk0XY4LOzPgtMTvlKqACchgNEFQm91YkDoudwpR8hIjSAmTsI40zcQ>
    <xme:kk0XY4LVilRS99ISsh7NlSJZJU_p5xxzATkJXoe5GgZD7FpbZLLkN5sy0N2zixqoV
    R291fItZnNtTHnf7T8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelkedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufhv
    vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
    grthhtvghrnhepleevgfegffehvedtieevhfekheeftedtjeetudevieehveevieelgffh
    ieevieeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:kk0XY4sMKELIgCnJnG6KJOAoy6toy0qrwrq8X04HJu7EbtfuMaqctQ>
    <xmx:kk0XY1alWYXnwYjshCKzrURRYMwjj2vwRWhmghVrRLGELGBPWvK5Yw>
    <xmx:kk0XY_ZtQo18xKyhXM_sZMHg1hBD9E308rf5u03m0l9kzA5eTsiMlg>
    <xmx:lE0XY1sdm1gr4cGAzqgYFHeHCNGWprrLbE-xfAuiQhAEliTDT7Z76A>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CAC2BA6007C; Tue,  6 Sep 2022 09:39:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <99fb8d30-a75d-4709-a4e7-47d2f700ffb8@www.fastmail.com>
In-Reply-To: <E1oVYUX-005CmY-Mr@rmk-PC.armlinux.org.uk>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUX-005CmY-Mr@rmk-PC.armlinux.org.uk>
Date: Tue, 06 Sep 2022 15:39:10 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Arnd Bergmann" <arnd@arndb.de>, "Lee Jones" <lee@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
Cc: "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, asahi@lists.linux.dev,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, devicetree@vger.kernel.org,
 "Hector Martin" <marcan@marcan.st>, "Jonathan Corbet" <corbet@lwn.net>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Petr Mladek" <pmladek@suse.com>,
 "Rasmus Villemoes" <linux@rasmusvillemoes.dk>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Sergey Senozhatsky" <senozhatsky@chromium.org>,
 "Steven Rostedt" <rostedt@goodmis.org>
Subject: Re: [PATCH 5/7] platform/apple: Add new Apple Mac SMC driver
Content-Type: text/plain

On Tue, Sep 6, 2022, at 15:19, Russell King wrote:
> From: Hector Martin <marcan@marcan.st>
>
> This driver implements support for the SMC (System Management
> Controller) in Apple Macs. In contrast to the existing applesmc driver,
> it uses pluggable backends that allow it to support different SMC
> implementations, and uses the MFD subsystem to expose the core SMC
> functionality so that specific features (gpio, hwmon, battery, etc.) can
> be implemented by separate drivers in their respective downstream
> subsystems.
>
> The initial RTKit backend adds support for Apple Silicon Macs (M1 et
> al). We hope a backend for T2 Macs will be written in the future
> (since those are not supported by applesmc), and eventually an x86
> backend would allow us to fully deprecate applesmc in favor of this
> driver.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Sven Peter <sven@svenpeter.dev>
