Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8360B1FCF63
	for <asahi@lists.linux.dev>; Tue, 29 Oct 2024 06:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730184375; cv=none; b=b4tc0eXhdMMRpmbvTiKkyQGbNQax7G2CTDWvGLeD+Ula2niT4loTuEGGGpyvD9nNROw20/jwiig0TClTK/6KmjBtbQpgTPlbEhiuHX9tkNJ4/5Vtbweg1QsOFnLBHWFkbaqkhp+uh2bo8cqObe32qHnEFR/+maFw6WlM6IopKlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730184375; c=relaxed/simple;
	bh=2d5kQBNrZGqKrjxfOOerSL2pudrhZ1tzSz8ArRu12As=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLav1t6RCdkWDGEa7eNL3YdGhXUw3LIGFMbCx7QUuLVWmx+p0BVA6FF/7SIZvkyDw47KP5B3RrIPeZOS0Cpro59IKWmzJbYjWKAGA8Zv9v7MpFsG3FipD4xf+TPBWRPsR77ISA/KNNLAhf0CzaWtI9xd6GA+8TnuwYu450hi0p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uhAqJWB7; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uhAqJWB7"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c984352742so5602161a12.1
        for <asahi@lists.linux.dev>; Mon, 28 Oct 2024 23:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730184371; x=1730789171; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LEuIOWA3pPCeu1W3FRuJxi63HcQIsZ+xeIctC2qVXkk=;
        b=uhAqJWB7Zm0el2p8jg/R+Ey7qRmFb01LtqhX43ZtG7nX6AGmbphbHPBsAQDGIJqf27
         bRQfwnwKeVRE9JpdMts4+VlyP6iTmLa8OV+Jbys4FCIHrFYw1YPyqoDtFC/tqaF3HnY1
         Ei5T/JTbhojsOnavaQPmnwEZ47w+BpI5evkSqKQmMP2PFIUXoD9oA79ghmyG3gHkfB4s
         Uyr5e+QJqxJX2XTEDCT5TtG+4kLpaz5817buTJZGk+5VHgmOtRKyP/W4tAMY+Op9H6si
         XzIHoWzSqaRyKExoCj9ygfmxojUjCin/Ef/+pSdtWu4NSWjmKMxE8Ag5XTgPwO+qpHrm
         zdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730184371; x=1730789171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEuIOWA3pPCeu1W3FRuJxi63HcQIsZ+xeIctC2qVXkk=;
        b=Beq1p1gIP32L4IPEXSce7uocCEBe1HZ6D0FHtcP9FkTasYhaukUnYmS7RZZ83AckyM
         sMcubdje7sGBIVa4pS664HVr/5eaLLuOge0izhfBz2SqFHpivpk/ZMq+vonGW5viA8+v
         bLTfGAU32AKP4XONmSjn7NdDawfTX3jl2W6jv4/oCEEjEa83yiJEwTiDcGC3n27w5zz7
         Pb6DQAIJ46hKd8hsrGqGwRxSFYh8xqqKVVFWOoinJf2n8Apb/1KGnpdOV1UzAimCY54Q
         3gbEUoO78x2HVuus0N4scWUjx5uAZbpeJEsys7MbcUg42EbJIfR717yxXrBU508TE5RK
         QzTw==
X-Forwarded-Encrypted: i=1; AJvYcCX/aKjJ58IkFGwaGf9pSVrnsLlurOoEe5uGf89Wb2YWBl9Ey7RhMAhNOg8H4R5hlV1RPFU6Yg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/BwtH52DlTWSOpgsVS7WHGfG3pVDWjQgD6zE/W1saaT9jUHt2
	dE0Yx0HjXAyFp1iLf/Xndx3c3k+WAv1VV4Rh/fa2t8MaruackZ60LudbM8LyPhdpEuELzuFqtKA
	GYth70w9us8IkL04qUoA+WRhVfvgJScy9EJRooA==
X-Google-Smtp-Source: AGHT+IF698VlXh2uTjKsf1BK4AQYi5HFwQUolTY4YovJA+qJrCb6o0jyfo2NllYwKudXrXw6QBx6VRsxb0DsAqYd3UI=
X-Received: by 2002:a05:6402:51d4:b0:5cb:acfa:621d with SMTP id
 4fb4d7f45d1cf-5cbbf876aa1mr7050312a12.3.1730184370762; Mon, 28 Oct 2024
 23:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240826115940.3233167-1-sughosh.ganu@linaro.org>
 <20240826115940.3233167-6-sughosh.ganu@linaro.org> <ZyAAJsnV4uz2Btwy@robin>
 <CADg8p94MnjnPQ4Y8_OeQYfwk9W7L8vu+J1tHPcX079D87PzFDg@mail.gmail.com> <CADg8p97LDnBBDpaWG-f_Qw303BYzZp3VkNeGU93xOZ2aOWsC3g@mail.gmail.com>
In-Reply-To: <CADg8p97LDnBBDpaWG-f_Qw303BYzZp3VkNeGU93xOZ2aOWsC3g@mail.gmail.com>
From: Sughosh Ganu <sughosh.ganu@linaro.org>
Date: Tue, 29 Oct 2024 12:15:59 +0530
Message-ID: <CADg8p94fqK5rpcWtrMiTJh+X4z8t_HsdC_iYh_R9Da0U9BEa4A@mail.gmail.com>
Subject: Re: [PATCH v4 05/27] lmb: make LMB memory map persistent and global
To: Janne Grunau <janne@jannau.net>
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
	Marek Vasut <marex@denx.de>, Mark Kettenis <mark.kettenis@xs4all.nl>, 
	Michal Simek <michal.simek@amd.com>, Patrick DELAUNAY <patrick.delaunay@foss.st.com>, 
	Patrice CHOTARD <patrice.chotard@foss.st.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Oct 2024 at 10:02, Sughosh Ganu <sughosh.ganu@linaro.org> wrote:
>
> On Tue, 29 Oct 2024 at 09:19, Sughosh Ganu <sughosh.ganu@linaro.org> wrote:
> >
> > On Tue, 29 Oct 2024 at 02:50, Janne Grunau <janne@jannau.net> wrote:
> > >
> > > On Mon, Aug 26, 2024 at 05:29:18PM +0530, Sughosh Ganu wrote:
> > > > The current LMB API's for allocating and reserving memory use a
> > > > per-caller based memory view. Memory allocated by a caller can then be
> > > > overwritten by another caller. Make these allocations and reservations
> > > > persistent using the alloced list data structure.
> > > >
> > > > Two alloced lists are declared -- one for the available(free) memory,
> > > > and one for the used memory. Once full, the list can then be extended
> > > > at runtime.
> > > >
> > > > Signed-off-by: Sughosh Ganu <sughosh.ganu@linaro.org>
> > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > [sjg: Optimise the logic to add a region in lmb_add_region_flags()]
> > > > [sjg: Use a stack to store pointer of lmb struct when running lmb tests]
> > > > ---
> > > > Changes since V3:
> > > > * Fix checkpatch warnings of spaces between function name and
> > > >   open parantheses.
> > > > * s/uint64_t/u64 as suggested by checkpatch.
> > > > * Remove unneccessary parantheses in lmb.c as suggested by checkpatch.
> > > > * Fix alignment in test/cmd/bdinfo.c as suggested by checkpatch.
> > >
> > > [...]
> > >
> > > >  drivers/iommu/apple_dart.c           |   8 +-
> > >
> > > [...]
> > >
> > > > diff --git a/drivers/iommu/apple_dart.c b/drivers/iommu/apple_dart.c
> > > > index 9327dea1e3..611ac7cd6d 100644
> > > > --- a/drivers/iommu/apple_dart.c
> > > > +++ b/drivers/iommu/apple_dart.c
> > > > @@ -70,7 +70,6 @@
> > > >
> > > >  struct apple_dart_priv {
> > > >       void *base;
> > > > -     struct lmb lmb;
> > > >       u64 *l1, *l2;
> > > >       int bypass, shift;
> > > >
> > > > @@ -124,7 +123,7 @@ static dma_addr_t apple_dart_map(struct udevice *dev, void *addr, size_t size)
> > > >       off = (phys_addr_t)addr - paddr;
> > > >       psize = ALIGN(size + off, DART_PAGE_SIZE);
> > > >
> > > > -     dva = lmb_alloc(&priv->lmb, psize, DART_PAGE_SIZE);
> > > > +     dva = lmb_alloc(psize, DART_PAGE_SIZE);
> > > >
> > > >       idx = dva / DART_PAGE_SIZE;
> > > >       for (i = 0; i < psize / DART_PAGE_SIZE; i++) {
> > > > @@ -160,7 +159,7 @@ static void apple_dart_unmap(struct udevice *dev, dma_addr_t addr, size_t size)
> > > >                          (unsigned long)&priv->l2[idx + i]);
> > > >       priv->flush_tlb(priv);
> > > >
> > > > -     lmb_free(&priv->lmb, dva, psize);
> > > > +     lmb_free(dva, psize);
> > > >  }
> > > >
> > > >  static struct iommu_ops apple_dart_ops = {
> > > > @@ -213,8 +212,7 @@ static int apple_dart_probe(struct udevice *dev)
> > > >       priv->dvabase = DART_PAGE_SIZE;
> > > >       priv->dvaend = SZ_4G - DART_PAGE_SIZE;
> > > >
> > > > -     lmb_init(&priv->lmb);
> > > > -     lmb_add(&priv->lmb, priv->dvabase, priv->dvaend - priv->dvabase);
> > > > +     lmb_add(priv->dvabase, priv->dvaend - priv->dvabase);
> > >
> > > no. This breaks everything. apple_dart is an iommu and used struct lmb
> > > to manage the IO virtual address space. This has nothing to do
> > > with system memory.
> > > Depending on the allocation strategy this will cause all sorts of
> > > problems since the IO and the physical memory address space does not
> > > overlap on apple silicon devices. IOVA is for many devices only 32-bit
> > > but physical memory starts at 0x10_0000_0000 or 0x100_0000_0000.
> > > Every device has its own iommu / IOVA space so sharing the space between
> > > all of them is another problem. I'd assume only theoretical due to the
> > > limited driver support and memory use in u-boot.
> > >
> > > My current plan to fix this is to resurrect the old lmb code under a
> > > different name.
> >
> > Firstly, apologies for breaking the driver. Looking at the code, it
> > looks like the driver works with a dva address range in the first 4GB.
> > I think what the driver expects is fairly straightforward, with a
> > top-down allocation scheme. I have sent a patch [1] which replaces the
> > LMB calls with a call to the allocation function. Can you please check
> > if this works on the board? Looking at how the driver is obtaining the
> > dva addresses, I think this logic should suffice. Thanks.
> >
> > -sughosh
> >
> > [1] - https://patchwork.ozlabs.org/project/uboot/patch/20241029033915.423211-1-sughosh.ganu@linaro.org/
>
> This would not work as it does not consider freeing of the va
> addresses. So there might be a need for a parallel lmb instance for
> this.
>
> -sughosh
>
> >
> >
> > -sughosh
> >
> > >
> > > Not sure about the same change in sandbox_iommu but I guess it could be
> > > ok as there is no sandbox.

I have pushed the changes for the driver to one of my github branch
[1]. Can you please try it out and let me know. Thanks.

-sughosh

[1] - https://github.com/sughoshg/u-boot/tree/apple_dart_changes

> > >
> > > Janne
