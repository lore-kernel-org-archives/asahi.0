Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477E333C6
	for <asahi@lists.linux.dev>; Thu,  8 Sep 2022 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=N1TrM7TbvW4pn1BGGWDOrYT43Tz4PeQhBJcHN6NEPZo=; b=t0cis0RtsabCUAQD0/556FaEXb
	/Y5PIXTg4fPBLDK4Nd1zu9jZjHyZCf2xVGeGJMWPy0SZJ3FbyLkWnfRHmE/yBkgATZhPxJCBKDb18
	Dd8uUVtcWFpbIuhKesY55pkxbNoqxln4mRqPGQuMyha9K0acIpc7nI+yTN/Y3pOn8+WWUqwXAFsNU
	EPh6dvoPSjKtcctEmP35dFDb0Z27OSJLj39NQWbjAdHOGiW9JL+UvYjPHk/dpSNrQiV6h6dDiIhNN
	6eTqn9ndo6ELOgJc1OySUxNwVwYnW40h7riiWCwfOd4gCw2BkIH6Gp7hKIqjZdr8eN3QKXQoFrqLI
	NApesA6Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34204)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oWISt-0006cE-FH; Thu, 08 Sep 2022 15:25:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oWISo-00028R-RL; Thu, 08 Sep 2022 15:25:06 +0100
Date: Thu, 8 Sep 2022 15:25:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Subject: Re: [PATCH 2/7] dt-bindings: gpio: add binding for the GPIO block
 for Apple Mac SMC
Message-ID: <Yxn7QqBQ7d4rd81+@shell.armlinux.org.uk>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUI-005CmB-84@rmk-PC.armlinux.org.uk>
 <39b08217-b939-d188-12ce-ce6006282e1e@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39b08217-b939-d188-12ce-ce6006282e1e@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Sep 08, 2022 at 02:17:54PM +0200, Krzysztof Kozlowski wrote:
> On 06/09/2022 15:19, Russell King (Oracle) wrote:
> > Add the DT binding for the Apple Mac System Management Controller GPIOs.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../devicetree/bindings/gpio/gpio-macsmc.yaml | 28 +++++++++++++++++++
> >  .../devicetree/bindings/mfd/apple,smc.yaml    |  4 +++
> >  2 files changed, 32 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> > new file mode 100644
> > index 000000000000..ee620fe50ca8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> > @@ -0,0 +1,28 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Apple Mac System Management Controller GPIO
> > +
> > +maintainers:
> > +  - Hector Martin <marcan@marcan.st>
> > +
> > +description:
> > +  This describes the binding for the Apple Mac System Management Controller
> > +  GPIO block.
> > +
> > +properties:
> > +  gpio-controller: true
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    smc_gpio: gpio {
> > +      gpio-controller;
> > +      #gpio-cells = <2>;
> > +    };
> > diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > index 168f237c2962..47e3cd58bf19 100644
> > --- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > @@ -37,6 +37,10 @@ title: Apple Mac System Management Controller
> >      description:
> >        A phandle to the mailbox channel
> >  
> > +patternProperties:
> > +  gpio:
> 
> This is not a pattern. Should be in properties.
> 
> Please run `make dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).

I did. It didn't warn for me. Yes, I had updated it immediately prior.
Yes I had installed the lint package.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
