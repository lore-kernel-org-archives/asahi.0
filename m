Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55B68BE1
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 16:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9865AC43147
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667924729;
	bh=G5C8vewa6rwRjTQumguODaoFHIR0XcRiyJloc2k0v58=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YDvCNfZAE++VSoSMXo4tFfRN+M7Squ9lo1fAKdJ6Sc3BofusKDvrVPwfNeRwrh3J1
	 xGcNsTn2HEF6arClGp4F2hDprqj2KyvNFQpk7mi+6axr/bbbAdBqh7tDSkk7y8uExr
	 R7SLLKeI5TarnucAc0XKQ4+WKbqDAmdCEB0YIkHGJVmcuVmQ9sqpGvtfiRpdmy3nbM
	 MFBFH4ZVi+v22MYHLfOZUFqvSswpasrp5DntthEkcjERWfAtFKMnjXRVX/WqTeEw8D
	 9quoVRVLvMJ77tchhcWNmbn/qhfNmwnk0202ZSjjXEkP5F3yb11dqm8Z0AhH1g4tgQ
	 Yco5taEowexqg==
Received: by mail-lj1-f171.google.com with SMTP id x21so21870407ljg.10
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 08:25:29 -0800 (PST)
X-Gm-Message-State: ACrzQf1boC2m+axnhypT/fG9uaqyCafzgE2CeApE/9wobrrBjcdDh/24
	5hrnw/S17ugqZYh3vDjmL9PqFxbD5ZrYacth4A==
X-Google-Smtp-Source: AMsMyM4iXpsQim/WrEqsQekIVlLAJVyM1LSjKUemsBwuFcfOC9oe0pnOfouA+Sw6MXCdIgQeUs5R9dLsb5ojWInStbo=
X-Received: by 2002:a2e:9a85:0:b0:275:1343:df71 with SMTP id
 p5-20020a2e9a85000000b002751343df71mr7268096lji.215.1667924727546; Tue, 08
 Nov 2022 08:25:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221103133900.1473855-1-thierry.reding@gmail.com>
 <20221103133900.1473855-3-thierry.reding@gmail.com> <20221107193035.GA1394942-robh@kernel.org>
 <Y2popxNd2uIdXmlf@orome>
In-Reply-To: <Y2popxNd2uIdXmlf@orome>
From: Rob Herring <robh@kernel.org>
Date: Tue, 8 Nov 2022 10:25:18 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ6XS7UZiEdjb2pyq_LmOLWBGcWHKsntTgjVFRi=4JMXw@mail.gmail.com>
Message-ID: <CAL_JsqJ6XS7UZiEdjb2pyq_LmOLWBGcWHKsntTgjVFRi=4JMXw@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] of: Stop DMA translation at last DMA parent
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	Krishna Reddy <vdumpa@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Janne Grunau <j@jannau.net>, 
	Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org, 
	iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 8, 2022 at 8:33 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Mon, Nov 07, 2022 at 01:30:35PM -0600, Rob Herring wrote:
> > On Thu, Nov 03, 2022 at 02:38:57PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > DMA parent devices can define separate DMA busses via the "dma-ranges"
> > > and "#address-cells" and "#size-cells" properties. If the DMA bus has
> > > different cell counts than its parent, this can cause the translation
> > > of DMA address to fails (e.g. truncation from 2 to 1 address cells).
> >
> > My assumption in this case was that the parent cell sizes should be
> > increased to 2 cells. That tends to be what people want to do anyways
> > (64-bit everywhere on 64-bit CPUs).
> >
> > > Avoid this by stopping to search for DMA parents when a parent without
> > > a "dma-ranges" property is encountered. Also, since it is the DMA parent
> > > that defines the DMA bus, use the bus' cell counts instead of its parent
> > > cell counts.
> >
> > We treat no 'dma-ranges' as equivalent to 'dma-ranges;'. IIRC, the spec
> > even says that because I hit that case.
> >
> > Is this going to work for 'dma-device' with something like this?:
> >
> >   bus@0 {
> >     dma-ranges = <...>;
> >     child-bus@... {
> >       dma-device@... {
> >       };
> >     };
> >   };
> >
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > > Changes in v10:
> > > - new patch to avoid address truncation when traversing a bus hierarchy
> > >   with mismatching #address-cells properties
> > >
> > > Example from Tegra194 (redacted for clarity):
> > >
> > >     reserved-memory {
> > >             #address-cells = <2>;
> > >             #size-cells = <2>;
> > >             ranges;
> > >
> > >             framebuffer@0,0 {
> > >                     compatible = "framebuffer";
> > >                     reg = <0x2 0x57320000 0x0 0x00800000>;
> > >                     iommu-addresses = <&dc0 0x2 0x57320000 0x0 0x00800000>;
> > >             };
> > >     };
> > >
> > >     bus@0 {
> > >             /* truncation happens here */
> > >             #address-cells = <1>;
> > >             #size-cells = <1>;
> > >             ranges = <0x0 0x0 0x0 0x40000000>;
> > >
> > >             mc: memory-controller@2c00000 {
> > >                     #address-cells = <2>;
> > >                     #size-cells = <2>;
> >
> > I think this is wrong. The parent should have more or equal number of
> > cells.
>
> I was half suspecting that. The reason why I hesitated is that I recall
> having the opposite discussion a while ago when we were adding bus@0 to
> 64-bit Tegra devices. We had at some point (probably around Tegra114 or
> Tegra124, 32-bit ARM chips that support LPAE) started to set #address-
> cells = <2> precisely because the CPU could address more than 32-bit
> addresses. We then did the same thing transitioning to 64-bit ARM. When
> we then started discussing bus@0, someone (might have been you) had
> argued that all these peripherals could be addressed with a single cell
> so there'd be no need for #address-cells = <2>, so then we went with
> that.

I may have not thinking about the DMA side of things.

> Reverting back to #address-cells = <2> is now going to cause quite a bit
> of churn, but I guess if it's the right thing, so be it.
>
> Another possible alternative would be to move the memory-controller node
> from the bus@0 to the top-level. Not sure if that's any better.

I stumbled upon 'ibm,#dma-address-cells' and 'ibm,#dma-size-cells'
while reviewing this. Those seem to be for the same purpose AFAICT. We
could consider adding those (w/o 'ibm') to handle this situation.

Rob
