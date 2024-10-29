Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91291FCF55
	for <asahi@lists.linux.dev>; Tue, 29 Oct 2024 03:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730173757; cv=none; b=Pr6g8H5M8ws2xC2BpzowhblfnW1wqOypriTcUKeNDqKz+QZwCCzJIaXMavmVYT2CEONYOcxeYXvMAM/giyW1XMByfGurttubAEGeMDgcuBhnvAi/M6aOwAGiN2jUe/WteRJLiVk3RiXBdmFITzwdbbThETpmmPae3U+9RyVQnH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730173757; c=relaxed/simple;
	bh=u1flyCImlebbScYb1xwNfu6P8DJiWbCJ1uxBsdEun3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdZ+RUllxu/QzA9bWhHLAgoAjRikUBxqqjbPZ0lbjIRB4Uu6kBFCg4Mxqdps3yj3miVRxIKpZLAYfaxvDC9eKeY5rd90dibMETG8+kKSCCfILwPJ0XBGRbS43pJLNQoQV16qVolmVauPTWDJZwf/c/Yu2jiNvr2mb7wJ8AIQKLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i6zsgDnm; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i6zsgDnm"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a16b310f5so776618766b.0
        for <asahi@lists.linux.dev>; Mon, 28 Oct 2024 20:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730173753; x=1730778553; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ID4iBrzDMDKfzEAp5ipfBeecDdEtziXlZs5DnKIQVFQ=;
        b=i6zsgDnmLs+pvLIiVf+CzNiZ8oJZDEAF0xbtFOBCPRPgoop0I3EHVO1YOqJUcB86Zo
         IEbqfid9cWg48Xs38bgcvwkhRN6wfNPLqbMoGP39y5ukXVugWoStTbTHGBqP9ZIRGCah
         aW1W1/hCGN+e2XieTXk/+v6r4AcTpIMFHWQEUdLfHHtXTphTxRkExiKWkAPeusJrtbnz
         r/DAln4lqVcgCrgbjhsRj/PHrrhP9psJstHM5FkCFVxw2oOvKgunf5mUJpVUvmOiwgGl
         nDilUZXotICInUEAJoZ9gct35m/abetzHcpla/U62E2TF/gli07LQZ40OAKU1HUrYUW/
         8rTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730173753; x=1730778553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ID4iBrzDMDKfzEAp5ipfBeecDdEtziXlZs5DnKIQVFQ=;
        b=buc+JNi0K75rqDKXpTUmuOwffDtYyQcHz5NmEN5Q6hkP8eFM0G6wLeedm6eVB2Eids
         6Dp9768c73LThcPoZAbBjwT8YXkRTSysp0tgPv/mo+fbOGZisUrN3AJ5L09Mxed9Vmme
         ISuyM/WZJvqkpGGp0MvGEPJ9jJQXRsMdW67F7SB2SwI5NFo9DUvdKozxiPeHlNJBljhQ
         mCLu3+pcdLJZqvCEMC95RkENaDjEJn1vLxtUkBv9AaLDyUTcUEwCRIVGTfL2pw3mSJMd
         SLy5VI9IRpehtLnwAiTJgJFQPptbFMqte1lL5J6a63/WVlMNIJhxl8eZHTiUsnwQ4HpH
         uMYw==
X-Forwarded-Encrypted: i=1; AJvYcCUTXmRdAY2LXbaIS7imAIjZLcOUoY2EcXtPlsb9WRpd6XyNkDkgr4VPHSX1WL30M24mpYzETQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpZR1JjA5tNSQojWANh1FBq0EGQmAmg93LV+OlEdgrqgHgcPNU
	xD7zX3u856sC15FY8F2mHcye1g4Vtt5Ti5aRq+KwFPXHYQ0BETWoAyxUbtrKaZ+coaoCV6yksoi
	UXoQNBeorXBxShJ8sCNzxCfwb7jGW0DGI9+DSeA==
X-Google-Smtp-Source: AGHT+IHGPJrPOrrLFMzWs8whzxRHQ7p4La9YrH+XT6a2mY1B6sFh/UT5V6tZGMfE9qLdApG4tsAdmMd57cXbsRwXano=
X-Received: by 2002:a17:907:7e8f:b0:a99:d782:2e2b with SMTP id
 a640c23a62f3a-a9de5f24882mr948721966b.30.1730173753131; Mon, 28 Oct 2024
 20:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240826115940.3233167-1-sughosh.ganu@linaro.org>
 <20240826115940.3233167-6-sughosh.ganu@linaro.org> <ZyAAJsnV4uz2Btwy@robin>
In-Reply-To: <ZyAAJsnV4uz2Btwy@robin>
From: Sughosh Ganu <sughosh.ganu@linaro.org>
Date: Tue, 29 Oct 2024 09:19:01 +0530
Message-ID: <CADg8p94MnjnPQ4Y8_OeQYfwk9W7L8vu+J1tHPcX079D87PzFDg@mail.gmail.com>
Subject: Re: [PATCH v4 05/27] lmb: make LMB memory map persistent and global
To: Janne Grunau <janne@jannau.net>
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
	Marek Vasut <marex@denx.de>, Mark Kettenis <mark.kettenis@xs4all.nl>, 
	Michal Simek <michal.simek@amd.com>, Patrick DELAUNAY <patrick.delaunay@foss.st.com>, 
	Patrice CHOTARD <patrice.chotard@foss.st.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Oct 2024 at 02:50, Janne Grunau <janne@jannau.net> wrote:
>
> On Mon, Aug 26, 2024 at 05:29:18PM +0530, Sughosh Ganu wrote:
> > The current LMB API's for allocating and reserving memory use a
> > per-caller based memory view. Memory allocated by a caller can then be
> > overwritten by another caller. Make these allocations and reservations
> > persistent using the alloced list data structure.
> >
> > Two alloced lists are declared -- one for the available(free) memory,
> > and one for the used memory. Once full, the list can then be extended
> > at runtime.
> >
> > Signed-off-by: Sughosh Ganu <sughosh.ganu@linaro.org>
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > [sjg: Optimise the logic to add a region in lmb_add_region_flags()]
> > [sjg: Use a stack to store pointer of lmb struct when running lmb tests]
> > ---
> > Changes since V3:
> > * Fix checkpatch warnings of spaces between function name and
> >   open parantheses.
> > * s/uint64_t/u64 as suggested by checkpatch.
> > * Remove unneccessary parantheses in lmb.c as suggested by checkpatch.
> > * Fix alignment in test/cmd/bdinfo.c as suggested by checkpatch.
>
> [...]
>
> >  drivers/iommu/apple_dart.c           |   8 +-
>
> [...]
>
> > diff --git a/drivers/iommu/apple_dart.c b/drivers/iommu/apple_dart.c
> > index 9327dea1e3..611ac7cd6d 100644
> > --- a/drivers/iommu/apple_dart.c
> > +++ b/drivers/iommu/apple_dart.c
> > @@ -70,7 +70,6 @@
> >
> >  struct apple_dart_priv {
> >       void *base;
> > -     struct lmb lmb;
> >       u64 *l1, *l2;
> >       int bypass, shift;
> >
> > @@ -124,7 +123,7 @@ static dma_addr_t apple_dart_map(struct udevice *dev, void *addr, size_t size)
> >       off = (phys_addr_t)addr - paddr;
> >       psize = ALIGN(size + off, DART_PAGE_SIZE);
> >
> > -     dva = lmb_alloc(&priv->lmb, psize, DART_PAGE_SIZE);
> > +     dva = lmb_alloc(psize, DART_PAGE_SIZE);
> >
> >       idx = dva / DART_PAGE_SIZE;
> >       for (i = 0; i < psize / DART_PAGE_SIZE; i++) {
> > @@ -160,7 +159,7 @@ static void apple_dart_unmap(struct udevice *dev, dma_addr_t addr, size_t size)
> >                          (unsigned long)&priv->l2[idx + i]);
> >       priv->flush_tlb(priv);
> >
> > -     lmb_free(&priv->lmb, dva, psize);
> > +     lmb_free(dva, psize);
> >  }
> >
> >  static struct iommu_ops apple_dart_ops = {
> > @@ -213,8 +212,7 @@ static int apple_dart_probe(struct udevice *dev)
> >       priv->dvabase = DART_PAGE_SIZE;
> >       priv->dvaend = SZ_4G - DART_PAGE_SIZE;
> >
> > -     lmb_init(&priv->lmb);
> > -     lmb_add(&priv->lmb, priv->dvabase, priv->dvaend - priv->dvabase);
> > +     lmb_add(priv->dvabase, priv->dvaend - priv->dvabase);
>
> no. This breaks everything. apple_dart is an iommu and used struct lmb
> to manage the IO virtual address space. This has nothing to do
> with system memory.
> Depending on the allocation strategy this will cause all sorts of
> problems since the IO and the physical memory address space does not
> overlap on apple silicon devices. IOVA is for many devices only 32-bit
> but physical memory starts at 0x10_0000_0000 or 0x100_0000_0000.
> Every device has its own iommu / IOVA space so sharing the space between
> all of them is another problem. I'd assume only theoretical due to the
> limited driver support and memory use in u-boot.
>
> My current plan to fix this is to resurrect the old lmb code under a
> different name.

Firstly, apologies for breaking the driver. Looking at the code, it
looks like the driver works with a dva address range in the first 4GB.
I think what the driver expects is fairly straightforward, with a
top-down allocation scheme. I have sent a patch [1] which replaces the
LMB calls with a call to the allocation function. Can you please check
if this works on the board? Looking at how the driver is obtaining the
dva addresses, I think this logic should suffice. Thanks.

-sughosh

[1] - https://patchwork.ozlabs.org/project/uboot/patch/20241029033915.423211-1-sughosh.ganu@linaro.org/


-sughosh

>
> Not sure about the same change in sandbox_iommu but I guess it could be
> ok as there is no sandbox.
>
> Janne
