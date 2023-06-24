Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFC446BC
	for <asahi@lists.linux.dev>; Sat, 24 Jun 2023 17:04:37 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1a98cf01151so1573118fac.2
        for <asahi@lists.linux.dev>; Sat, 24 Jun 2023 10:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687626277; x=1690218277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWUPx4B2kJGgvXIs8RsYy9lugFh6tACB+WFQIYwQ1k4=;
        b=HfhRZyJntgt7ZplVH+oygh2aWCnSej/VFnQqIVzSEx2yHFW1Sq8kwSt5QCBvEpd+D6
         l0vU8p+dW+5wQ2dIB7ya6qBQl5KfzJTT8LcsUpCbhdYctez/i3iLML+Xsy6qNQCFzUha
         srnu1TbFu4agfd4R/BWSLM4qA2EW7R4jeEOvtLgU50gL7rK22QDPbh1iBk7qS10uvICy
         QEk3/jnwSw6KCyftcjdxb35mQmi2ZMsqfRkiFMZpdR4bt3TG8IPCcNcbgqM0e82hymNB
         /SJ/+4IM3DRz1qcGBxZ4WvOm4f23H3EWresIIFB7hb0MImeKg3MQUAuHojnCk4eliHNQ
         jTbA==
X-Gm-Message-State: AC+VfDyqnR2ZQvE6hYprfQXAhpvvPszTl2JjyQpThePiTp2di950f3Ef
	nUX2VrRiyvMhvtE6KeyIFo0=
X-Google-Smtp-Source: ACHHUZ5PzhhFFcHozjXeG4hw1Mj/ZmNTVeYk4Nr3y2QM5U89zI6IZpJ6mD2EcsgWm+8oxfZeytffWg==
X-Received: by 2002:a05:6808:3096:b0:396:12cb:1349 with SMTP id bl22-20020a056808309600b0039612cb1349mr28031552oib.38.1687626276865;
        Sat, 24 Jun 2023 10:04:36 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b00553d27ab0e0sm1447457pga.69.2023.06.24.10.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 10:04:35 -0700 (PDT)
Date: Sun, 25 Jun 2023 02:04:33 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: apple: Initialize pcie->nvecs before using it
Message-ID: <20230624170433.GE2636347@rocinante>
References: <20230311133453.63246-1-sven@svenpeter.dev>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311133453.63246-1-sven@svenpeter.dev>

Hello,

> apple_pcie_setup_port computes ilog2(pcie->nvecs) to setup the number of
> MSIs available for each port. It is however called before apple_msi_init
> which actually initializes pcie->nvecs.
> Luckily, pcie->nvecs is part of kzalloc-ed structure and thus
> initialized as zero. ilog2(0) happens to be 0xffffffff which then just
> configures more MSIs in hardware than we actually have. This doesn't
> break anything because we never hand out those vectors.
> Let's swap the order of the two calls so that we use the correctly
> initialized value.

Applied to controller/apple, thank you!

[1/1] PCI: apple: Initialize pcie->nvecs before use
      https://git.kernel.org/pci/pci/c/328a16477027

	Krzysztof
