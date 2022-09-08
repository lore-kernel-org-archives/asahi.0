Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED0D7C
	for <asahi@lists.linux.dev>; Thu,  8 Sep 2022 08:03:35 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id 6E94F26EFE3; Thu,  8 Sep 2022 10:03:27 +0200 (CEST)
Date: Thu, 8 Sep 2022 10:03:27 +0200
From: Janne Grunau <j@jannau.net>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
	devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 7/7] arm64: dts: apple: Add SMC node to t8103/t6001
 devicetrees
Message-ID: <20220908080327.GF10102@jannau.net>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUi-005Cmk-0R@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1oVYUi-005Cmk-0R@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)

On 2022-09-06 14:20:00 +0100, Russell King wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  arch/arm64/boot/dts/apple/t8103.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

nit: the commit message mentions t600x but the commit doesn't contain it 
since the t600x devicetrees are not upstream yet. Please fix if you send 
another version. I plan to send the t600x devicetrees later today but I 
don't think it's worth to create a dependency between the series. Let's 
submit the t600x macsmc bits separately later.

Janne

