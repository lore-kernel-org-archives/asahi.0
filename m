Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CA86125
	for <asahi@lists.linux.dev>; Mon,  5 Dec 2022 17:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF8AC43148
	for <asahi@lists.linux.dev>; Mon,  5 Dec 2022 17:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670259606;
	bh=n1tNuBxJl22jRV6QaxMEbZMS84zoN2ML70kUJauH5W8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cYrpcAW6X7bZJmUk4REzq31fe5g1ks4ZXnxngkPmCgWzb81XUjyBfR9YhvK4ado9S
	 9eEVOIHBt53gNS5aC1CZKBLtdkHgIRPz4tPxibk1wS5Tq0q9rCLokr42tqH+QUnyLU
	 DCrtmFM1QUmRfUQeq1n/u/GCYvEke1OHTrwXIbr4znzrx9Swoybys2neS3dAU/Rds4
	 7VoJQQW1B6K2qndyYWRk/MzA/wc4emCdOVnFW/GOF/cWlr9kCkVPJkeQQ+NUoQeXiv
	 DLTjH2GqCc44zMXzdWWYXxWBMrQ+IojnQjTxqrkeJpP+e9PWofCZLpxEdvd/DLkiVs
	 GaEz1d9v3J/gg==
Received: by mail-vk1-f178.google.com with SMTP id r3so971961vkq.13
        for <asahi@lists.linux.dev>; Mon, 05 Dec 2022 09:00:06 -0800 (PST)
X-Gm-Message-State: ANoB5pli4prOBAIkPwTlkffnIE/iBbCB1X02+DAmRbOXHrDx95q4O+bY
	UY/Pw1mz+CKAvweu4jP1uMnWGixDFID+QKwukA==
X-Google-Smtp-Source: AA0mqf7cT6MONVFTUtdo3Q9sJ7pbfQxVT3ByTs0BM06UEq5l9z+p6SfDRPcgGT9jaeApv/S7UUb/fu3WDMvBdZQxS3I=
X-Received: by 2002:a1f:9110:0:b0:3bc:fc56:597 with SMTP id
 t16-20020a1f9110000000b003bcfc560597mr15575139vkd.14.1670259605174; Mon, 05
 Dec 2022 09:00:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221117185424.2359687-1-thierry.reding@gmail.com> <Y4oOg5nSBPBieArv@orome>
In-Reply-To: <Y4oOg5nSBPBieArv@orome>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 5 Dec 2022 10:59:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLLz5hRVrNw0QaQiv2Xyq4ueFkMLZnxncF6JkbCgZWhNA@mail.gmail.com>
Message-ID: <CAL_JsqLLz5hRVrNw0QaQiv2Xyq4ueFkMLZnxncF6JkbCgZWhNA@mail.gmail.com>
Subject: Re: [PATCH v12 0/4] iommu: Support mappings/reservations in
 reserved-memory regions
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	Krishna Reddy <vdumpa@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Janne Grunau <j@jannau.net>, 
	Sameer Pujar <spujar@nvidia.com>, Lucas Stach <l.stach@pengutronix.de>, devicetree@vger.kernel.org, 
	iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 2, 2022 at 8:41 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Thu, Nov 17, 2022 at 07:54:20PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Hi,
> >
> > This version is a minor update to the previous v11, which can be found
> > here:
> >
> >   https://lore.kernel.org/all/20221111161806.630527-1-thierry.reding@gmail.com/
> >
> > The only change here is that the #dma-{address,size}-cells is dropped.
> > It turns out to be much simpler to just update #{address,size}-cells to
> > what they should be rather than add extra complexity for the DMA work-
> > around. There's a minor update to the DT binding so that it can now
> > properly validate cases where we have both reg and iommu-addresses
> > properties.
> >
> > An example is included in the DT bindings, but here is an extract of
> > what I've used to test this:
> >
> >         reserved-memory {
> >                 #address-cells = <2>;
> >                 #size-cells = <2>;
> >                 ranges;
> >
> >                 /*
> >                  * Creates an identity mapping for the framebuffer that
> >                  * the firmware has setup to scan out a bootsplash from.
> >                  */
> >                 fb: framebuffer@92cb2000 {
> >                         reg = <0x0 0x92cb2000 0x0 0x00800000>;
> >                         iommu-addresses = <&dc0 0x0 0x92cb2000 0x0 0x00800000>;
> >                 };
> >
> >                 /*
> >                  * Creates a reservation in the IOVA space to prevent
> >                  * any buffers from being mapped to that region. Note
> >                  * that on Tegra the range is actually quite different
> >                  * from this, but it would conflict with the display
> >                  * driver that I tested this against, so this is just
> >                  * a dummy region for testing.
> >                  */
> >                 adsp: reservation-adsp {
> >                         iommu-addresses = <&dc0 0x0 0x90000000 0x0 0x00010000>;
> >                 };
> >         };
> >
> >         host1x@50000000 {
> >                 dc@54200000 {
> >                         memory-region = <&fb>, <&adsp>;
> >                 };
> >         };
> >
> > This is abbreviated a little to focus on the essentials. Note also that
> > the ADSP reservation is not actually used on this device and the driver
> > for this doesn't exist yet, but I wanted to include this variant for
> > testing, because we'll want to use these bindings for the reservation
> > use-case as well at some point.
> >
> > I've also been able to make use of this binding and the IOMMU code in
> > conjunction with the simple-framebuffer driver to hand over a display
> > configuration set up by UEFI to the Linux kernel.
> >
> > Janne has confirmed[0] this to be suitable for indirect mappings as
> > well, though these patches don't implement that feature yet. Potential
> > extensions to this have been discussed but are not yet included at this
> > time to not further complicate things.
> >
> > Thierry
> >
> > [0]: https://lore.kernel.org/all/20220909144504.GA4024@jannau.net/
> >
> > Thierry Reding (4):
> >   of: Introduce of_translate_dma_region()
> >   dt-bindings: reserved-memory: Document iommu-addresses
> >   iommu: Implement of_iommu_get_resv_regions()
> >   iommu: dma: Use of_iommu_get_resv_regions()
> >
> >  .../reserved-memory/reserved-memory.yaml      | 89 +++++++++++++++++-
> >  drivers/iommu/dma-iommu.c                     |  3 +
> >  drivers/iommu/of_iommu.c                      | 94 +++++++++++++++++++
> >  drivers/of/address.c                          | 41 ++++++++
> >  include/linux/of_address.h                    |  2 +
> >  include/linux/of_iommu.h                      |  8 ++
> >  6 files changed, 233 insertions(+), 4 deletions(-)
>
> Joerg, Rob,
>
> Is there anything left to do on the series? It'd be great to get some
> feedback from Robin on patch 3 since he had some concerns about how the
> reservation type was getting determined. All those should now be
> addressed and I think overall this is ready to go.
>
> Rob, you've given a Reviewed-by on all the DT-related parts, does that
> mean you're okay with this going through Joerg's tree?

Yes. Okay with and what I'm expecting.

Rob
