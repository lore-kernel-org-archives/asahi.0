Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F582F2F
	for <asahi@lists.linux.dev>; Tue,  6 Sep 2022 18:38:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 517F841F12;
	Tue,  6 Sep 2022 18:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1662489496; bh=7Cacof0XymbmecKgM3gMsHDYnVb8qJgvsVIujiO7CR8=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To;
	b=a9fRbQ2YgUa+LiyX8/bc1TbPO8zGx2TK2+8SGDQhbJ6wbzlNf+wIDNHjc49143Eap
	 P1+ow8dSsJvGIwjHHLeOsWTAGVMCUJ2vSfNUCKgzwm3BuEtsbs98c8WbsD4cfmeT4Z
	 DeLOzyRkcT/O/kgRZvCrdiwJ3/60cALLeeIpnMhfhLKySLSSLYXyVvBxSVCVMNAuH+
	 JX3xXyfu31e3tInA4wnDlNRnQTM0N3o89c7vYYXP7ws1B0MGWnoxXwK9pt39xmTJLS
	 +S3aYsDQXb+LbxDfvwSuNUAXRiSS+l8D7FtWxPSIUqkQbjuQ7+PHZstCxlOyLLUcl9
	 WscGqHdi3RdLg==
Message-ID: <39c32c75-207c-3807-0c97-8a6bd9555b5e@marcan.st>
Date: Wed, 7 Sep 2022 03:38:09 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: es-ES
To: Rob Herring <robh@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, krzysztof.kozlowski@linaro.org,
 arnd@arndb.de, lee@kernel.org, linus.walleij@linaro.org,
 alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org
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
 <20220906173535.GA734389-robh@kernel.org>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
In-Reply-To: <20220906173535.GA734389-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/09/2022 02.35, Rob Herring wrote:
> On Wed, Sep 07, 2022 at 02:00:53AM +0900, Hector Martin wrote:
>> On 07/09/2022 01.10, Rob Herring wrote:
>>>> So at this point, I think it would make sense if I post a v2 with all
>>>> the updates so far (sorry, given the long drawn out discussions on
>>>> this, I've lost track of what changes have been made to the code, so
>>>> I won't include a detailed change log.)
>>>
>>> As I said elsewhere, sub-nodes is probably the right choice here. I 
>>> think they need compatible strings in the child nodes, and addressing 
>>> has to be sorted out which it seems may also break OpenBSD.
>>
>> So addressing only makes sense for GPIO, out of the nodes we have so far
>> - that's the only thing with two discrete instances whose access can be
>> entirely described by a single base key name, and which are otherwise
>> compatible.
>>
>> Everything else is pretty much single-instance, and talks to multiple
>> keys, so there isn't one single "address" key that would make semantic
>> sense to use as the node address. 
> 
> Unit-addresses are just the first address in 'reg'. So multiple 
> addresses or not doesn't really matter.

Okay, but we're obviously not going to list every single SMC key used by
any given node in the device tree (that'd be a giant mess, other than
for hwmon which is a story for another time), and it doesn't make sense
to pick an arbitrary one as the reg address and then ignore it in the
driver.

>> There are some indexed keys, but at a
>> deeper level (e.g. multiple battery cells part of the charge control
>> subsystem, multiple Type C ports as part of the AC/power input
>> subsystem, etc.). And in those cases, these subdevices are mostly
>> homogeneous and we would never need multiple nodes for them at the DT
>> level, they'd just be implicitly handled by those drivers.
> 
> Type-C will be fun depending on how much of the muxing/altmode 
> details have to get exposed. 

As sven mentioned that will be fun, but thankfully not part of this
binding (SMC only cares for power supply purposes, and since our direct
driver already exposes power config info in Linux (or should, and we can
improve that), I don't particularly have plans to expose the SMC Type-C
data other than perhaps something in the existing power supply driver to
indicate which port is the currently chosen power input.

> If only those 2 nodes, then I really don't care so much and gpio-sec 
> would be fine. It's 1 node in 1 binding.

I think it might make sense to just go with this then. If Apple ever
introduces yet another GPIO sub-controller we can just add another one,
and honestly I don't think that's very likely, given they don't even use
any of the GPIOs from the second one from the AP yet. I don't see SMC
growing a big list of GPIO controllers any time soon, such that we
regret doing it this way. And then the node-name can just map to a given
key prefix statically in the driver, and thus we don't even need a
property for that (gpio would be gP?? and gpio-sec gp?? right now).

- Hector
