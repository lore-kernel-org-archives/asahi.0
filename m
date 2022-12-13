Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C677F33FF
	for <asahi@lists.linux.dev>; Tue, 13 Dec 2022 14:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82776C433F0;
	Tue, 13 Dec 2022 14:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670940521;
	bh=ZhS1+Jlq3PtbDqoFD6tZt00rbsFDNMR0cDrwPMM46IU=;
	h=From:To:Cc:Subject:Date:From;
	b=o5JPbh7RIfNUgRAwbMU1AkQ+gPqagF91VvU4yE+e2MCAPxBOXwA/PdyXxq2qtOycq
	 svx6xe4s/pD8Dx42oAxi2Rz9GR41biHEuk7wVf5kfBwFg7M5wkaqnJyI1c96z+1f7K
	 CdmKZQrlvDWqqcHonGcNqkOYmDlAnEc7X45AejsE/iMtZOyV6UfxMCYEZEkPPyNCpA
	 8JKx5Eg2g1FnqyAlHC9joBIm6GRwgeMmTuGK/leaU9Ck2/FwrVG51kLZhYw9LAy+j6
	 vrwdGqTV4eWB/4+sXPtEJSfLpdgZCcguFDmHj8ijGKFQcV528i2/7N+lLRW43bNP9E
	 tM3ZcuUrF3RzA==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1p55xz-00042J-9t; Tue, 13 Dec 2022 15:09:07 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] irqchip/genirq/msi: Use irq_domain_alloc_irqs()
Date: Tue, 13 Dec 2022 15:08:42 +0100
Message-Id: <20221213140844.15470-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.37.4
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When reworking the irqdomain locking I noticed that we had quite a few
users of the __irq_domain_alloc_irqs() interface which was initially
only intended for some legacy x86 use cases.

This first patch updates the irqchip driver so that the
irq_domain_alloc_irqs() wrapper is instead used consistently.

The second patch adds a matching irq_domain_alloc_irqs_affinity() helper
which can be used when an affinity hint needs to be provided and updates
the sole user.

With this update to gpiolib:

	https://lore.kernel.org/lkml/20221213135227.14398-1-johan+linaro@kernel.org

the only remaining users of the full interface (with preallocated
descriptors) are the two original calls in x86/io_apic and the later
added one for IPI.

Johan


Johan Hovold (2):
  irqchip: Use irq_domain_alloc_irqs()
  genirq/irqdomain/msi: Add irq_domain_alloc_irqs_affinity() wrapper

 drivers/irqchip/irq-apple-aic.c     |  5 ++---
 drivers/irqchip/irq-armada-370-xp.c |  4 ++--
 drivers/irqchip/irq-bcm2836.c       |  6 ++----
 drivers/irqchip/irq-gic-v3.c        |  5 ++---
 drivers/irqchip/irq-gic-v4.c        | 10 ++++------
 drivers/irqchip/irq-gic.c           |  5 ++---
 include/linux/irqdomain.h           | 15 +++++++++++++++
 kernel/irq/msi.c                    |  6 +++---
 8 files changed, 32 insertions(+), 24 deletions(-)

-- 
2.37.4

