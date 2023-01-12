Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940D6746A
	for <asahi@lists.linux.dev>; Thu, 12 Jan 2023 13:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366CBC433D2;
	Thu, 12 Jan 2023 13:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673530484;
	bh=j0YIDz5bHF2dFE2r4pGCMvZWfbTDEfD2sZPAljVVdPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oVh35eywb5oK7iIixDKPwxnygS6i9OfZxaRlgXZVZSaUI2xBUtrtHDIUB350VJI1c
	 JK8EQ9nzK1wAVVCzb5Au21M7c+h9dTyP23XudUduDXGrppEhSIDJp/WGoB5uLyFd9W
	 57K2iAQni9rcMi60meEtbkPnvxgIczX1aXRmp7I7L2GZAbLGkkAETYSDwJLFDmBIjC
	 nfTIUiC9euE0vKEvft7Mu4mgCqgqDxlTvI6Pa7kXTCZ0RGOgRlpOVXJprKzRaChlzJ
	 DgfIdidyjphtq0P40ueCY+WmQXLY4xRo9s0zzepVrezR5J69gSc8mIIWqX0BAx3aHE
	 5rfJGq222ZZGQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1pFxjG-0001vA-Mi; Thu, 12 Jan 2023 14:34:51 +0100
Date: Thu, 12 Jan 2023 14:34:50 +0100
From: Johan Hovold <johan@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Johan Hovold <johan+linaro@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] genirq/irqdomain/msi: Add
 irq_domain_alloc_irqs_affinity() wrapper
Message-ID: <Y8AMejEy59W87YC5@hovoldconsulting.com>
References: <20221213140844.15470-1-johan+linaro@kernel.org>
 <20221213140844.15470-3-johan+linaro@kernel.org>
 <87358ggayt.ffs@tglx>
 <Y8AKKVs9vAFR+F6H@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8AKKVs9vAFR+F6H@hovoldconsulting.com>

On Thu, Jan 12, 2023 at 02:24:58PM +0100, Johan Hovold wrote:
> On Wed, Jan 11, 2023 at 07:52:42PM +0100, Thomas Gleixner wrote:
> > On Tue, Dec 13 2022 at 15:08, Johan Hovold wrote:
> > > The full __irq_domain_alloc_irqs() interface was initially only intended
> > > for some legacy (x86) use cases while most callers should use the
> > > irq_domain_alloc_irqs() wrapper.
> > >
> > > Add a matching irq_domain_alloc_irqs_affinity() wrapper that can be used
> > > when an affinity hint needs to be provided and use it for MSI
> > > allocations.
> > 
> > I definitely like the irqchip cleanup, but this one is core code and
> > having the extra wrapper is not really buying us much.
> 
> Fair enough. If you don't expect there to be any further users then
> perhaps it's not worth it even if it arguably makes the call site a bit
> more readable (e.g. by dropping the base and realloc arguments).

And having this wrapper would also limit the use of the full (internal)
helper to places that actually need the realloc parameter (e.g. making
those stand out more).

Johan
