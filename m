Received: from sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69AB2F4E
	for <asahi@lists.linux.dev>; Wed,  7 Sep 2022 09:39:25 +0000 (UTC)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
	by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id e57b84d2;
	Wed, 7 Sep 2022 11:39:16 +0200 (CEST)
Date: Wed, 7 Sep 2022 11:39:16 +0200 (CEST)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Hector Martin <marcan@marcan.st>
Cc: robh@kernel.org, linux@armlinux.org.uk,
	krzysztof.kozlowski@linaro.org, arnd@arndb.de, lee@kernel.org,
	linus.walleij@linaro.org, alyssa@rosenzweig.io,
	asahi@lists.linux.dev, brgl@bgdev.pl,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, sven@svenpeter.dev,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <39c32c75-207c-3807-0c97-8a6bd9555b5e@marcan.st> (message from
	Hector Martin on Wed, 7 Sep 2022 03:38:09 +0900)
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
References: <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
 <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
 <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
 <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl>
 <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
 <20220906161049.GC534217-robh@kernel.org>
 <91466e41-d3f7-0993-9082-80f94e53f375@marcan.st>
 <20220906173535.GA734389-robh@kernel.org> <39c32c75-207c-3807-0c97-8a6bd9555b5e@marcan.st>
Message-ID: <d3ced597b1c472c9@bloch.sibelius.xs4all.nl>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> Date: Wed, 7 Sep 2022 03:38:09 +0900
> From: Hector Martin <marcan@marcan.st>
> 
> On 07/09/2022 02.35, Rob Herring wrote:
> 
> > If only those 2 nodes, then I really don't care so much and gpio-sec 
> > would be fine. It's 1 node in 1 binding.
> 
> I think it might make sense to just go with this then. If Apple ever
> introduces yet another GPIO sub-controller we can just add another one,
> and honestly I don't think that's very likely, given they don't even use
> any of the GPIOs from the second one from the AP yet. I don't see SMC
> growing a big list of GPIO controllers any time soon, such that we
> regret doing it this way. And then the node-name can just map to a given
> key prefix statically in the driver, and thus we don't even need a
> property for that (gpio would be gP?? and gpio-sec gp?? right now).

We could also use a compatible property to map the key prefix.  For
example we could have "apple,smc-gpio-primary" map to gP??  and
"apple,smc-gpio-secondary" map to gp??.  Then we can keep the generic
"gpio" name for both GPIO nodes.  And if Apple introduces yet another
GPIO sub-controller we just have to invent a new compatible for it.
Probably the cleanest solution if Rob still thinks it is better for
these nodes to have a compatible property anyway.
