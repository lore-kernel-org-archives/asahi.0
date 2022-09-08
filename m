Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE547C
	for <asahi@lists.linux.dev>; Thu,  8 Sep 2022 12:58:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 71F224203C;
	Thu,  8 Sep 2022 12:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1662641916; bh=zeHOsB0TSFlOr6aFeT6NoDM0Tho7siXQTei+7aiod60=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To;
	b=hIJd98pBC6LPrLJ00DKZbmA+PdszOc7W8+Qyd9BOXKUodbaMv2AQg3XWHD6MSvCX6
	 MaiW1zNw+DL4f//RYJawSBh9eAU+ehbhOJUxOqlkwKrYjuYuW0NF0wna9kKroyjM0a
	 9KJSTFTroNihQr4m4G50sQAu3e96AvxkzbNuUMA27BNA+mF5hAFGoNtg26IPHtuYHa
	 +M8BYv6ySUju90CRtdSLfO50yDqj3L+naq0isFWOZvrrlnmAvGs6a/GRpRG9KtrNyo
	 EUgVQyCksOnm2neSruWr5HT+3nilhBbq5KVENP01YMomFpmuCW+xXDIDFEl3R0Vt5t
	 8MmWB1uUabJlA==
Message-ID: <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
Date: Thu, 8 Sep 2022 21:58:30 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: es-ES
To: Lee Jones <lee@kernel.org>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk> <YxnK3LeyfacKssLT@google.com>
 <45ed0a37-60ac-3a06-92d1-6b30e18261ff@marcan.st>
 <YxngtlhRLTVBw+iW@google.com>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
In-Reply-To: <YxngtlhRLTVBw+iW@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/09/2022 21.31, Lee Jones wrote:
> On Thu, 08 Sep 2022, Hector Martin wrote:
>> But it's not exactly your
>> typical MFD device (it's not even a separate chip, it's part of the main
>> SoC), so I'm not sure if it really belongs in mfd/ from an
>> organizational standpoint?
> 
> There is a strong argument for all SoCs to be classed as (massive)
> MFDs.  However seeing as they represent more of a whole platform,
> rather than an add-on chip, we have had the sense to represent them
> differently.  Some such submissions I have made explicit requests to be
> moved form drivers/mfd *into* drivers/platform in the past.
> 
> Most SoCs are solely represented in DT, omitting the requirement for
> subsequent device registration.  Have you considered this?  If so, why
> does this not suit your use-case?

This driver and a subset of its sub-drivers are intended to generalize
(via different backends, but no changes to sub-drivers) to legacy and T2
Mac platforms, eventually superseding applesmc (which is in hwmon/
because it started out as that, but has now grown random features and is
quite a mess). Those are are Intel/UEFI machines and not DT platforms,
and on those the SMC is actually a separate chip in some form (much like
an EC).

> The long and the short of it is; if you wish to treat this device, or
> at least a section of it, as a type of MFD, then please draft that
> part of it as an MFD driver, residing in drivers/mfd.  If it's "not
> really an MFD", then find another way to represent the conglomeration
> please.
> 
> If the MFD route is the best, then you can register each of the
> devices, including the *-core from drivers/mfd.  Grep for "cross-ec"
> as a relatively recently good example.

I think cros-ec is similar enough, yeah. As long as you don't mind
having the core codebase in mfd/ (4 files: core, rtkit backend, and
future T2 and legacy backends) we can do that.

- Hector
