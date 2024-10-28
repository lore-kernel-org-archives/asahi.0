Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEF7188CDC
	for <asahi@lists.linux.dev>; Mon, 28 Oct 2024 23:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730157120; cv=none; b=J0DKa1lWoA/Xt5lLq0/85oJJqAhrTd4NW4Rgkxgc2x+TLi2Hh3uTSUc6t1hy3xpu/1q37g8vedEuszZyBV1ODWKtKLMa0VAht4i9K+kNfjDVCvVpO7h7QGBZzEH+ZOx+17g3fmj2xrAliAHMaq9x9sa1TjX+4dX9IdOPKa+gM2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730157120; c=relaxed/simple;
	bh=LFSYNa2Nf0OYS0DbbJA3AHc2wMjUGKbwvrMTf+Xk+O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1Dk05PNWnWCokKsCWgWvV5N1PzUJ/vnOInuv6RCbxfRpJlnRH9BetdFQ6jxgTPXoORMs+gQoqg9jCeMJj4695SfVL7hulVvbXFqPAUXu42JekO+LMvhRDVrPsd/yVPQTaxWAmZJvw2DE6euGRk3V2QZctNlKUgx8PC6NMtPWZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=BcFsatyD; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="BcFsatyD"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b14554468fso369646385a.1
        for <asahi@lists.linux.dev>; Mon, 28 Oct 2024 16:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1730157117; x=1730761917; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l+N0/H/jKGrnQrN1CroK6oF5hj6UmvW0HIEBi0mEv5U=;
        b=BcFsatyDMiTphx8HAGFOM3d/ZdJqKDjX6uYoByCdOFuEs9W1te6Tq9mnUAR6lGgU+3
         BFd+N7uufI5kvbYHHEruSVf83Luwbo+Gd1wPDy6C2zlbPuIpOa8hTfWYTM2X9LPW+W04
         RgMj3q9VsxjOWQb6IDCyq0XWh1pF0zkUCvLEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730157117; x=1730761917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+N0/H/jKGrnQrN1CroK6oF5hj6UmvW0HIEBi0mEv5U=;
        b=CJ/S1hNsB+lY6c1GmOG7xznhmZ/x6rwzu2T5Ezoi2w2sjNIaYyMvhM3X2gRhSyTAy0
         xdfbK6q7ClPuJLDTzyKkTuH1t/eRtkMrq8OuU54WslHvblEvgtSWuQiTEty6jfprazOf
         u53KhovNKHCGAVtIAcKDIlBpQoIJF5GeZipLX3rsenz7DYOwxjxYlIMKQSzTV+XnY/6d
         fUW8E+lhnbtxUD0ZHsXryoBm4L7aqDZbB8KZzGRZwlopDUvjmGQGJGJbgC3+HLocaxal
         9V8zuiTE587pjOGpQB6MgP1ZH7UporYbxv2SnHVaTb6ZN7vfMg5lgS5+15v2Ijzo6M8G
         yddg==
X-Forwarded-Encrypted: i=1; AJvYcCWDd6B05i/kRiWNXsGLQxL3wQmwrtSmksluPaTPNoSktKA+FfrywtzOZi0S8Y2YxFwtHVw+kA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzpUO4opZZADRD1A5yLK1ZXsG9Ew1JLoI9LqJD84WYLfoaebMS
	QLdA9o+UVv2QQdqb2DhXHbfpDn1u1Sf+EA9U4nu2wZQow03ITu9IAhLNTNfDGPB+z8QcPXvMpDH
	OUZw=
X-Google-Smtp-Source: AGHT+IGzXN+tp+hLq6tlHe+9ZQNrcZnU1jfnLsDXp+ejUq5epoZU7u3Hzqdk8LngyytECV6+iCBjbQ==
X-Received: by 2002:a05:620a:178d:b0:7ae:64a2:be61 with SMTP id af79cd13be357-7b193eff6a3mr1609027085a.36.1730157116942;
        Mon, 28 Oct 2024 16:11:56 -0700 (PDT)
Received: from bill-the-cat ([187.144.104.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d344bedsm362194185a.115.2024.10.28.16.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 16:11:55 -0700 (PDT)
Date: Mon, 28 Oct 2024 17:11:51 -0600
From: Tom Rini <trini@konsulko.com>
To: Janne Grunau <janne@jannau.net>
Cc: Sughosh Ganu <sughosh.ganu@linaro.org>, u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Marek Vasut <marex@denx.de>,
	Mark Kettenis <mark.kettenis@xs4all.nl>,
	Michal Simek <michal.simek@amd.com>,
	Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
	Patrice CHOTARD <patrice.chotard@foss.st.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	asahi@lists.linux.dev
Subject: Re: [PATCH v4 05/27] lmb: make LMB memory map persistent and global
Message-ID: <20241028231151.GV4959@bill-the-cat>
References: <20240826115940.3233167-1-sughosh.ganu@linaro.org>
 <20240826115940.3233167-6-sughosh.ganu@linaro.org>
 <ZyAAJsnV4uz2Btwy@robin>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xrpsQgvBZ8fO+3q/"
Content-Disposition: inline
In-Reply-To: <ZyAAJsnV4uz2Btwy@robin>
X-Clacks-Overhead: GNU Terry Pratchett


--xrpsQgvBZ8fO+3q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 10:20:38PM +0100, Janne Grunau wrote:
> On Mon, Aug 26, 2024 at 05:29:18PM +0530, Sughosh Ganu wrote:
> > The current LMB API's for allocating and reserving memory use a
> > per-caller based memory view. Memory allocated by a caller can then be
> > overwritten by another caller. Make these allocations and reservations
> > persistent using the alloced list data structure.
> >=20
> > Two alloced lists are declared -- one for the available(free) memory,
> > and one for the used memory. Once full, the list can then be extended
> > at runtime.
> >=20
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
>=20
> [...]
> =20
> >  drivers/iommu/apple_dart.c           |   8 +-
>=20
> [...]
>=20
> > diff --git a/drivers/iommu/apple_dart.c b/drivers/iommu/apple_dart.c
> > index 9327dea1e3..611ac7cd6d 100644
> > --- a/drivers/iommu/apple_dart.c
> > +++ b/drivers/iommu/apple_dart.c
> > @@ -70,7 +70,6 @@
> > =20
> >  struct apple_dart_priv {
> >  	void *base;
> > -	struct lmb lmb;
> >  	u64 *l1, *l2;
> >  	int bypass, shift;
> > =20
> > @@ -124,7 +123,7 @@ static dma_addr_t apple_dart_map(struct udevice *de=
v, void *addr, size_t size)
> >  	off =3D (phys_addr_t)addr - paddr;
> >  	psize =3D ALIGN(size + off, DART_PAGE_SIZE);
> > =20
> > -	dva =3D lmb_alloc(&priv->lmb, psize, DART_PAGE_SIZE);
> > +	dva =3D lmb_alloc(psize, DART_PAGE_SIZE);
> > =20
> >  	idx =3D dva / DART_PAGE_SIZE;
> >  	for (i =3D 0; i < psize / DART_PAGE_SIZE; i++) {
> > @@ -160,7 +159,7 @@ static void apple_dart_unmap(struct udevice *dev, d=
ma_addr_t addr, size_t size)
> >  			   (unsigned long)&priv->l2[idx + i]);
> >  	priv->flush_tlb(priv);
> > =20
> > -	lmb_free(&priv->lmb, dva, psize);
> > +	lmb_free(dva, psize);
> >  }
> > =20
> >  static struct iommu_ops apple_dart_ops =3D {
> > @@ -213,8 +212,7 @@ static int apple_dart_probe(struct udevice *dev)
> >  	priv->dvabase =3D DART_PAGE_SIZE;
> >  	priv->dvaend =3D SZ_4G - DART_PAGE_SIZE;
> > =20
> > -	lmb_init(&priv->lmb);
> > -	lmb_add(&priv->lmb, priv->dvabase, priv->dvaend - priv->dvabase);
> > +	lmb_add(priv->dvabase, priv->dvaend - priv->dvabase);
>=20
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
>=20
> My current plan to fix this is to resurrect the old lmb code under a
> different name.
>=20
> Not sure about the same change in sandbox_iommu but I guess it could be
> ok as there is no sandbox.

Oh damn, sorry. Perhaps it can be brought back in the iommu framework
more directly? I asked Caleb and they said snapdragon doesn't need
something like this.

--=20
Tom

--xrpsQgvBZ8fO+3q/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmcgGjMACgkQFHw5/5Y0
tywfjwv+J2FIGg7fOM2FX1HkVAYTAk6DuqX+s0/GjIE/Xiq7AbRy+qFKHZLS8xTK
13cQDgx65ad98dXwbb0J84OPkSAP0BHQYSCXwWGkbK8vG+NhL8vuz5Vpdd1AA2HG
+1OTixg9YnXLQOfrKpxOEbkfc/CZoX9I2wNTEQHg3yA/J/t4lhxMva3zCBdMPMy7
SHwuWO7Yl0Dgl5qT2HqHJx9OcUxa5rhDYWKhH6kAKNqkUv6UAKDOuEpwLygIodk0
mnIXti8o+sVJs0PeUrVap+QSeD+Oo+kjIxN7WYsd11qNdy316YtosaZObl42xUAZ
Hz4vN0mEG/du+niCcOqhYtXuJuZS3hjcoRe5xS926+MvMBNNqOyiDdZdQeOzOxk5
VWHjVGN2LDsXRYgzsqodVBMdo7Rt6U9/STN8lvZewqROaHkxzVUeYJe8VzBtp4VP
Qi/rw/CTSWm+kSw7cZKHDCkaSUyWbnfbVNlj+8AemUpfCWZ29SZnJCbwUcTqIVBm
OqpBWCuW
=w1BV
-----END PGP SIGNATURE-----

--xrpsQgvBZ8fO+3q/--
