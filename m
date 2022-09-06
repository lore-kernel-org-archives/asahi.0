Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FE77E
	for <asahi@lists.linux.dev>; Tue,  6 Sep 2022 17:01:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 4AA0B4195A;
	Tue,  6 Sep 2022 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1662483660; bh=lGUQ2yTJ9XJbKZKm2DQO637Q3W+GRczGxOgamRjh/ns=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To;
	b=Mv0pnE3G87fxXxUwPdNLORDS0t/I1vEOTWJTERQMT6dOff9WKYvo02XGcjMy2xtIP
	 m1y+47H1d3EZiDMjV6pLyUeanyfnf3zTIelouvrIuX4X6QpfmjFvpILuX6VK21BU5V
	 rNb+qTQJ8Q619r/x0b0rQBppzBTsBoYhqidlZXJOMI1eWwk6L+qSFBizAJ15UGOaSq
	 qHKrgQTC/ggzNUzTkQmXWEA7C6GIpW7OzbJimUGi4n29ysB/+ODW9vVj+ViTkOJeD2
	 CHih/nt2HvmqtSd9MxEY0BhOd2H1KUgJdqXH2w+UQGbKF06VkhK62wWotbLY860LJi
	 Cu1ilYRR/0khQ==
Message-ID: <91466e41-d3f7-0993-9082-80f94e53f375@marcan.st>
Date: Wed, 7 Sep 2022 02:00:53 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: es-ES
To: Rob Herring <robh@kernel.org>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Mark Kettenis <mark.kettenis@xs4all.nl>, krzysztof.kozlowski@linaro.org,
 arnd@arndb.de, lee@kernel.org, linus.walleij@linaro.org,
 alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org
References: <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
 <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
 <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
 <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl>
 <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
 <20220906161049.GC534217-robh@kernel.org>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
In-Reply-To: <20220906161049.GC534217-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/09/2022 01.10, Rob Herring wrote:
>> So at this point, I think it would make sense if I post a v2 with all
>> the updates so far (sorry, given the long drawn out discussions on
>> this, I've lost track of what changes have been made to the code, so
>> I won't include a detailed change log.)
> 
> As I said elsewhere, sub-nodes is probably the right choice here. I 
> think they need compatible strings in the child nodes, and addressing 
> has to be sorted out which it seems may also break OpenBSD.

So addressing only makes sense for GPIO, out of the nodes we have so far
- that's the only thing with two discrete instances whose access can be
entirely described by a single base key name, and which are otherwise
compatible.

Everything else is pretty much single-instance, and talks to multiple
keys, so there isn't one single "address" key that would make semantic
sense to use as the node address. There are some indexed keys, but at a
deeper level (e.g. multiple battery cells part of the charge control
subsystem, multiple Type C ports as part of the AC/power input
subsystem, etc.). And in those cases, these subdevices are mostly
homogeneous and we would never need multiple nodes for them at the DT
level, they'd just be implicitly handled by those drivers.

GPIO is quite special in that 1) it only has a single key type (which is
overloaded using advanced features to provide, effectively,
sub-registers to control all the GPIO features per pin), 2) a single key
represents a single pin, 3) keys are numbered in a reasoanble way, and
4) there are two prefixes for two discrete GPIO controllers. For pretty
much everything else SMC does, we just have a bag of keys with no real
rhyme nor reason from the point of view of an "address space".

Given that, how would this work? Is it legal/reasonable for only the
gpio nodes to have addressing/reg properties, and everything else to
just have a node name with no concept of address? Does it even make
sense to special case gpio in this way, vs. just having something like
gpio {} / gpio-sec {} (if we ever even need gpio-sec, which is an open
question)?

- Hector
