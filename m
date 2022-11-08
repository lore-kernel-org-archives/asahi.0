Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA37A464
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 22:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cCKHxPK11Q1jukKuWDcpKP+n2x8r5Bmc1C1fASXO8NQ=; b=EU0HS7ZSrrjOMX8APCRZwMm6WL
	D8irO/yPwhMriOwK6AlOa/byzotS3WboDQ+XnuvJj43Ueswc7R0wKRFtbqYX64n9dnWcqZyHnmfq/
	5EoQegbzK9uurHr9gQ5SJIBey94pJ4gzQ/nNwP0SnNHBwdCxArlNgkARgknSYEsPZWH8/AO+xhaQ5
	PFduDLegjqsp4ejFbTCK3en04HfLxq0KTjoRskd38CCMKV6sT7w85uaBfVutlN+rTv0ugEuObQLRV
	yDWUWkFmtn4xx/MNODHb7TYYyB/CtlkadWqniPmY4LquuVMvnTPWbUpP66u4orCZ+BDznbeamFs4k
	m9Cn2Cow==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35180)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1osWmm-0003nG-HU; Tue, 08 Nov 2022 22:09:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1osWmf-00055o-W6; Tue, 08 Nov 2022 22:09:30 +0000
Date: Tue, 8 Nov 2022 22:09:29 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	asahi@lists.linux.dev, devicetree@vger.kernel.org,
	Hector Martin <marcan@marcan.st>, Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v3 6/7] dt-bindings: gpio: add binding for the GPIO block
 for Apple Mac SMC
Message-ID: <Y2rTmS/gEdtU66b0@shell.armlinux.org.uk>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXi-002mwL-UB@rmk-PC.armlinux.org.uk>
 <3d51c0e2-1e59-5767-4be1-5754ca8dc902@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d51c0e2-1e59-5767-4be1-5754ca8dc902@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Nov 08, 2022 at 09:56:40PM +0100, Krzysztof Kozlowski wrote:
> On 08/11/2022 17:33, Russell King (Oracle) wrote:
> > Add the DT binding for the Apple Mac System Management Controller GPIOs.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../bindings/gpio/apple,smc-gpio.yaml         | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> > new file mode 100644
> > index 000000000000..1a415b78760b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> > @@ -0,0 +1,37 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
> 
> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).

Oh ffs. DT bindings are utterly impossible to get correct.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
