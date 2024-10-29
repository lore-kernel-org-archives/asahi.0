Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA075219E0
	for <asahi@lists.linux.dev>; Tue, 29 Oct 2024 04:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730176346; cv=none; b=JkDgFOypKtKBNJnpNuSqlgdbL740xoWreVOyvZbXur3PMG7mQesuiwV3OSbFNKlgIXI3/KG5L3gn1OlQTwi0KNfiPgAyjRpomIK3vrZ0a8H1F8LIeS2ky+idj/tgxmQsRMaRlkwo7RWb7iEubLUmidMMpgelJVepo6A7bE6kGWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730176346; c=relaxed/simple;
	bh=aO8uDyoVIJ+rjs24vHA2Q/NXTrLMOAzfuJwcz0aW0eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXAnfZsELhamXbrjpf69XYqV0BkqHeIUCeguiMtpQCSOptaQ0rNaO8L9iTXDUZXreL0YP6Arx+nH2K37PX7FGux8lqqqmxBqYKgZSSqAZs9yV/m08UfobR/KbcUiLbRCRdoDRZp1h/KX0J3EAH29MqoLLvmon30k5+r3LJo+UkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IZ9NxuI/; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IZ9NxuI/"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c9c28c1ecbso6721445a12.0
        for <asahi@lists.linux.dev>; Mon, 28 Oct 2024 21:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730176342; x=1730781142; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AHisBmZIqD1WUehKAZeuNl2Ng/Be5LL7FzX7jrmjtp8=;
        b=IZ9NxuI/cTnKv/aNGXo7ih8FuX3rFT/MDQNo272AbKGOHoofiSHeY2j/X6yvHbXfAT
         5FvjNhsDSVtLhVNS77GGpF0H6qJ5ng8auRg6zmvxT07wnybt5G40PABeCZBhCey49okF
         J3EK8oVVq3yY5EveaI47/unzyUkW2/3h5ZZbAoBYKz8RRYfAiGwKJiYEAaDIPlvVJnyU
         VnRoCy/LFxEaLmQ8pJR+woKkk/K7mnw3wtBEqpTjX+rBNJYj7RIGQufJ8XhgvXL+ur6A
         stPtmYmRa4w/cTmIs+7xtA2KUcjuPpDMJ3DHXV196PMKqW9umMLhv5P7fcUiQollsAAN
         dYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730176342; x=1730781142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AHisBmZIqD1WUehKAZeuNl2Ng/Be5LL7FzX7jrmjtp8=;
        b=hhxrKMhp3DabHpZVBblXk3VHH6L2YKOojg5Wk1X239b1jV8KSduLoX8XjHUaPgXdeC
         0HGZMAHFZP28nxkNACAHZi3Mfqw+/B1QpkcIHv1FLG7YmtUf/y3ZjkF5uetOSl/eZbNk
         l+v66WdS1nhFeHt5bT5hUXQzgDz8W3tsL/+aFOqB8HE9eszu6D0XpNwMInjzyLJsC+ZD
         wWMPYH//EwwMvz1ILjtY0QZVnwXot46+6euUnz1lmXbb9xunpIMjQjhHOHXFZl5jjMag
         9amyZcFQ8ODkjtSmjbZrTMp5uNs2WcXkgInICys4kYZu+ZdpyJblPErn3xs2I+R8euee
         wJsA==
X-Forwarded-Encrypted: i=1; AJvYcCUVuYth+WAdlN/V7CtkmKAIKFQh3rXbqtGDnAoPFJIfv/FVuka78wzub1C6uRNf+BPsEQ5HNw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw5FpxVXwAfqLoXYNz40yBQE0v9K31BWmYdlKVyxyvHeFCf0s1
	PDQyUMfleouQgBGYhmrycBOAvZjbyWI41yMcuUnGzMFPMMOAHN1E90nFYO42Mtb4H7GH9VelTew
	MDooe1nCF2qOrsuwBYtRFsJT1APblLdTNvbYSNQ==
X-Google-Smtp-Source: AGHT+IHzkmHoYo6cKXrFc/0+tIh7l37zDtVXatuK6B3EpCnpdm/aSH2ajez5kV1ntfYzteClcenNsxJosNovfo+IRyw=
X-Received: by 2002:a05:6402:34d4:b0:5c9:8a06:3420 with SMTP id
 4fb4d7f45d1cf-5cbbf94eba0mr8534163a12.35.1730176342059; Mon, 28 Oct 2024
 21:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240826115940.3233167-1-sughosh.ganu@linaro.org>
 <20240826115940.3233167-6-sughosh.ganu@linaro.org> <ZyAAJsnV4uz2Btwy@robin> <CADg8p94MnjnPQ4Y8_OeQYfwk9W7L8vu+J1tHPcX079D87PzFDg@mail.gmail.com>
In-Reply-To: <CADg8p94MnjnPQ4Y8_OeQYfwk9W7L8vu+J1tHPcX079D87PzFDg@mail.gmail.com>
From: Sughosh Ganu <sughosh.ganu@linaro.org>
Date: Tue, 29 Oct 2024 10:02:10 +0530
Message-ID: <CADg8p97LDnBBDpaWG-f_Qw303BYzZp3VkNeGU93xOZ2aOWsC3g@mail.gmail.com>
Subject: Re: [PATCH v4 05/27] lmb: make LMB memory map persistent and global
To: Janne Grunau <janne@jannau.net>
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
	Marek Vasut <marex@denx.de>, Mark Kettenis <mark.kettenis@xs4all.nl>, 
	Michal Simek <michal.simek@amd.com>, Patrick DELAUNAY <patrick.delaunay@foss.st.com>, 
	Patrice CHOTARD <patrice.chotard@foss.st.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Oct 2024 at 09:19, Sughosh Ganu <sughosh.ganu@linaro.org> wrote:
>
> On Tue, 29 Oct 2024 at 02:50, Janne Grunau <janne@jannau.net> wrote:
> >
> > On Mon, Aug 26, 2024 at 05:29:18PM +0530, Sughosh Ganu wrote:
> > > The current LMB API's for allocating and reserving memory use a
> > > per-caller based memory view. Memory allocated by a caller can then be
> > > overwritten by another caller. Make these allocations and reservations
> > > persistent using the alloced list data structure.
> > >
> > > Two alloced lists are declared -- one for the available(free) memory,
> > > and one for the used memory. Once full, the list can then be extended
> > > at runtime.
> > >
> > > Signed-off-by: Sughosh Ganu <sughosh.ganu@linaro.org>
> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > [sjg: Optimise the logic to add a region in lmb_add_region_flags()]
> > > [sjg: Use a stack to store pointer of lmb struct when running lmb tests]
> > > ---
> > > Changes since V3:
> > > * Fix checkpatch warnings of spaces between function name and
> > >   open parantheses.
> > > * s/uint64_t/u64 as suggested by checkpatch.
> > > * Remove unneccessary parantheses in lmb.c as suggested by checkpatch.
> > > * Fix alignment in test/cmd/bdinfo.c as suggested by checkpatch.
> >
> > [...]
> >
> > >  drivers/iommu/apple_dart.c           |   8 +-
> >
> > [...]
> >
> > > diff --git a/drivers/iommu/apple_dart.c b/drivers/iommu/apple_dart.c
> > > index 9327dea1e3..611ac7cd6d 100644
> > > --- a/drivers/iommu/apple_dart.c
> > > +++ b/drivers/iommu/apple_dart.c
> > > @@ -70,7 +70,6 @@
> > >
> > >  struct apple_dart_priv {
> > >       void *base;
> > > -     struct lmb lmb;
> > >       u64 *l1, *l2;
> > >       int bypass, shift;
> > >
> > > @@ -124,7 +123,7 @@ static dma_addr_t apple_dart_map(struct udevice *dev, void *addr, size_t size)
> > >       off = (phys_addr_t)addr - paddr;
> > >       psize = ALIGN(size + off, DART_PAGE_SIZE);
> > >
> > > -     dva = lmb_alloc(&priv->lmb, psize, DART_PAGE_SIZE);
> > > +     dva = lmb_alloc(psize, DART_PAGE_SIZE);
> > >
> > >       idx = dva / DART_PAGE_SIZE;
> > >       for (i = 0; i < psize / DART_PAGE_SIZE; i++) {
> > > @@ -160,7 +159,7 @@ static void apple_dart_unmap(struct udevice *dev, dma_addr_t addr, size_t size)
> > >                          (unsigned long)&priv->l2[idx + i]);
> > >       priv->flush_tlb(priv);
> > >
> > > -     lmb_free(&priv->lmb, dva, psize);
> > > +     lmb_free(dva, psize);
> > >  }
> > >
> > >  static struct iommu_ops apple_dart_ops = {
> > > @@ -213,8 +212,7 @@ static int apple_dart_probe(struct udevice *dev)
> > >       priv->dvabase = DART_PAGE_SIZE;
> > >       priv->dvaend = SZ_4G - DART_PAGE_SIZE;
> > >
> > > -     lmb_init(&priv->lmb);
> > > -     lmb_add(&priv->lmb, priv->dvabase, priv->dvaend - priv->dvabase);
> > > +     lmb_add(priv->dvabase, priv->dvaend - priv->dvabase);
> >
> > no. This breaks everything. apple_dart is an iommu and used struct lmb
> > to manage the IO virtual address space. This has nothing to do
> > with system memory.
> > Depending on the allocation strategy this will cause all sorts of
> > problems since the IO and the physical memory address space does not
> > overlap on apple silicon devices. IOVA is for many devices only 32-bit
> > but physical memory starts at 0x10_0000_0000 or 0x100_0000_0000.
> > Every device has its own iommu / IOVA space so sharing the space between
> > all of them is another problem. I'd assume only theoretical due to the
> > limited driver support and memory use in u-boot.
> >
> > My current plan to fix this is to resurrect the old lmb code under a
> > different name.
>
> Firstly, apologies for breaking the driver. Looking at the code, it
> looks like the driver works with a dva address range in the first 4GB.
> I think what the driver expects is fairly straightforward, with a
> top-down allocation scheme. I have sent a patch [1] which replaces the
> LMB calls with a call to the allocation function. Can you please check
> if this works on the board? Looking at how the driver is obtaining the
> dva addresses, I think this logic should suffice. Thanks.
>
> -sughosh
>
> [1] - https://patchwork.ozlabs.org/project/uboot/patch/20241029033915.423211-1-sughosh.ganu@linaro.org/

This would not work as it does not consider freeing of the va
addresses. So there might be a need for a parallel lmb instance for
this.

-sughosh

>
>
> -sughosh
>
> >
> > Not sure about the same change in sandbox_iommu but I guess it could be
> > ok as there is no sandbox.
> >
> > Janne
