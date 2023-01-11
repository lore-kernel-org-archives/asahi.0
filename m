Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CDD29A9
	for <asahi@lists.linux.dev>; Wed, 11 Jan 2023 18:52:44 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1673463163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ttuLldY4Pi3UmGhGAJKRPa4PS1VhLCj3NNSYMZ/cf5Q=;
	b=nzxu0gLLYJTkf5ZiYW7CY3jrR+VCSVh6N5vxmZ9rsR4ceES6/lgAGKfxrfGMcSdJnlyt8V
	aZJeT4/VttZv7XCuVq2yPKuaySzqvxhKLzvmzMyjCvp+DympFCmiWMKH4mmkbZ2krVYX5t
	AXNMMfdm/kpsJLPphJRyX/XxPv9CVfmrrTxH+sMIEYXKsyEVcbgly/Aj3pI3c4TMAahrsn
	5GK+B1ho41Bs2Py2puxOzIldZnXInlsrgvoDkfkIeiJ5VCavBIOtJ4Zuw/scA2F4O6aXX/
	Cgse8tUhNfbM5N019bCNiM4fHvQn0c5FELqHMRQi1UVL6Z/98pF+tWsS4k10TQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1673463163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ttuLldY4Pi3UmGhGAJKRPa4PS1VhLCj3NNSYMZ/cf5Q=;
	b=oF8+oX6j+iTKCzfG74NyYUi7q4vrceplUWYR/1y8bamslXWgKovdcFT8XGTmOcT91KmO0O
	uzG5BN+06p0xJFBw==
To: Johan Hovold <johan+linaro@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, Johan Hovold
 <johan+linaro@kernel.org>
Subject: Re: [PATCH 2/2] genirq/irqdomain/msi: Add
 irq_domain_alloc_irqs_affinity() wrapper
In-Reply-To: <20221213140844.15470-3-johan+linaro@kernel.org>
References: <20221213140844.15470-1-johan+linaro@kernel.org>
 <20221213140844.15470-3-johan+linaro@kernel.org>
Date: Wed, 11 Jan 2023 19:52:42 +0100
Message-ID: <87358ggayt.ffs@tglx>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Dec 13 2022 at 15:08, Johan Hovold wrote:
> The full __irq_domain_alloc_irqs() interface was initially only intended
> for some legacy (x86) use cases while most callers should use the
> irq_domain_alloc_irqs() wrapper.
>
> Add a matching irq_domain_alloc_irqs_affinity() wrapper that can be used
> when an affinity hint needs to be provided and use it for MSI
> allocations.

I definitely like the irqchip cleanup, but this one is core code and
having the extra wrapper is not really buying us much.

Thanks,

        tglx
