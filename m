Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357162F23
	for <asahi@lists.linux.dev>; Thu, 10 Nov 2022 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4waZGx1mhb2Gs8t6eRuJtt5huDkfAYnK6l5OrzVQpGs=; b=QIPUQPn21qj05SNWVVWDur4+Dd
	ZUGh8x+b+DfptieL83j7BWHiNLCWYmiaV9bsJ7Doy/288YLpBakQaPfHa6dQc3AJmT1MzmJ7p8ge7
	9UgLeWbxSiJnnGSfltqy+AY4TxLGqkyFTTD6OkO6U1iJcSNAx9WKXeiC+VlNYSPJgEcSZdt3RWL8H
	kt2EI2fUCQoeB09IRnB8mMtMgD0A6GcqWRNV0KWoIqyEB1qMZ+Aa3g3GUhZkPTR4VepcM4VeVnAQc
	O9hph9+RFgwbh0+O0/CGAqw7mUE00Pwo9CH0EuQmTHcD0kzCNb6B2fryhWBNvsGm3cQ2XVap9nFyu
	sImwz9nQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35206)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ot8m6-0005kM-Dw; Thu, 10 Nov 2022 14:43:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ot8m3-0006j6-GN; Thu, 10 Nov 2022 14:43:23 +0000
Date: Thu, 10 Nov 2022 14:43:23 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
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
Subject: Re: [PATCH v3 3/7] dt-bindings: mfd: add binding for Apple Mac
 System Management Controller
Message-ID: <Y20OCwon76reUkK/@shell.armlinux.org.uk>
References: <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
 <531d88b8-75db-1d8f-1384-b8d05594e7b3@linaro.org>
 <Y2rWp4wasbflS/0y@shell.armlinux.org.uk>
 <20221109221723.GA2948356-robh@kernel.org>
 <Y2zlA8RpOqD/7TrM@shell.armlinux.org.uk>
 <bb77e12a-b218-461b-6aa8-10f2b9a67347@linaro.org>
 <Y20HOW8t3wfFott1@shell.armlinux.org.uk>
 <403f372a-6fd1-b5b6-cfd9-b15147bf1caf@linaro.org>
 <Y20Je7quui2iohNR@shell.armlinux.org.uk>
 <392bec2d-c4aa-f87d-5250-c62760f808e2@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <392bec2d-c4aa-f87d-5250-c62760f808e2@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Nov 10, 2022 at 03:36:17PM +0100, Krzysztof Kozlowski wrote:
> On 10/11/2022 15:23, Russell King (Oracle) wrote:
> >>>
> >>> Make up your bloody minds and stop pissing me about. This is why I've
> >>> given up trying to get this in.
> >>
> >> I don't think it is constructive to discuss this with you anymore.
> >>
> >>>
> >>> Getting a consistent message would be nice, but it seems impossible.
> >>>
> >>
> > 
> > In which case you CLEARLY didn't read the cover message to that two
> > patch series.
> 
> I have every day 100-200 new patches, so not every cover letter gets
> enough attention. Your did not say this is part of MFD, just mentioned
> some build dependency.
> 
> Anyway, job of submitter is to make the patch and its context readable
> to the reviewers.
> 
> There is literally nothing about including in parent MFD node in DT.
> Just take a look:
> 
> https://lore.kernel.org/all/Y1q5jW8ff0aUdjPd@shell.armlinux.org.uk/
> 
> Or maybe you refer to this:
> "previously posted before the last merge window."
> Yes, so I will go through hundreds of emails from a week or months to
> satisfy you?
> 
> "this driver is dependent on the
> Apple SMC driver in order to be buildable and usable."
> 
> The only hint... it's about driver, not MFD. Make it obvious for
> readers, not obvious for you.
> 
> "It is expected
> that this Apple SMC driver will be merged via Lee's MFD tree."
> 
> Maybe there is dependency, maybe not, who the heck knows.

Everything that needed to be said was said in the cover message.

I'm not going to bother continuing with this thread because there is
nothing more to be said. This is getting utterly idiotic.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
