Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B9335B139
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 18:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767981972; cv=none; b=olu4r7Y+8dmFSLkJUIRVvp5r3rCGIPwtl6tqZpjstcWQQChPtsHJVKGhK+k1pjIGhl2Zeg9N+HkeoE3uUWtd+LqUR2/sF9KUHwzkOy8ltqOhFJUWzoQqDUxodduwMgJRQ+Wy+2AlLWpGTncvvIMxifXVGMD+OzongcSRr6buuLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767981972; c=relaxed/simple;
	bh=JtJ++7wvzUnLpDFbg0wYAP1DVO1wsy2Wt6w+QIcXdBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptzaYM1N6K+Qv/k5ehVdAaCUAdkC8axcA1OIvxosyWZz2oOOkNXZFan9xnQSB5/wO8WQY/mpnpVF/9gh10xTKseJCJaFoV8qOUEuEX3Ka1g5fnJlnAeda6QLqqKUAiwtXJ1fGe0nOap/k+snOHuc8C05Xnjx7lcA2NfAFkdbGJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=CSKAZWvU; arc=none smtp.client-ip=209.85.210.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="CSKAZWvU"
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-7cac8231d4eso2720296a34.2
        for <asahi@lists.linux.dev>; Fri, 09 Jan 2026 10:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767981970; x=1768586770; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MKCu5unrSB1dOWGsyyCrTfwyDfUU8kx5gFhP0ffAKew=;
        b=CSKAZWvUP6zkVAn2j17ISoBNzIH57Upf7tT5/TL9uictd57pcqvwCSeTrf0tl9vIhy
         phI2WMihJVeRshZE80m53Y/pi1dxYRB/UuJwUh9jr8Tb8S9Rv7gT9+XTbXps65chH/nF
         llJUj7wFS4PU+0fBSP0SOX/Iwr6w3MVyIyTBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767981970; x=1768586770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKCu5unrSB1dOWGsyyCrTfwyDfUU8kx5gFhP0ffAKew=;
        b=B9ntAhoNDyzE7sNYttD11bOJ2h/78j0x6m3PQD5+nChmgyeS2suRkpFI7M62wePs5W
         PcjKirFYmghJgJlyBbzz5obxwSZhU6GknP5f5BejkzbJ+KIOgJ90bG5FU2ZEZbkAnB6R
         kErFhJXllcXgZt4kWx/oY0OCjTHQRdFB52S9JWltmQzLTbamcXmNdPMyA0Mn71VAXUbe
         0AN0rukllvI/v7w9WUTBm6o2eGTw4hdXqlbQBx0hjf4BkotfEWr+LfkPfIahO7+nfroS
         sjdHQ+mukJci/24CvlqmyY76k3vF8j2tC6s232PvhlR/XOng0i0xadH3OTLFtq7LWguP
         yc+w==
X-Forwarded-Encrypted: i=1; AJvYcCXKCb544jOOUC1RjnNzcsnt5sDU5d5gL5wOsH2sayQnLoqIQ1f1YiWrEMhY9mSsB+tcQ13iqg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6oG2vztMHRRk1NeiJuM+cEket07SBy4+m2xb15Za/Z9R3H3dx
	v69X6RU/UzsaEUqlzE3dgQ945MbdjOW90iyYYPHNX6oVcVv7IMixTpOQbFZ8RBvEWkI=
X-Gm-Gg: AY/fxX7fbHJACYBpEILk9oEfuSxYANB2xkNNRK2B6JnO7m3gg2wGxKJYMezwiQ9JIjp
	PYFnFnCgRPqKaZegHyZoRX5pf/ycgX9S99/AwTEtdnGukflP57d64G7IMhstMDEHMRaZY73gF3C
	oHHdoUKsrV5pp3TwVALUgPzEboRwlwbzQddDbTZlQ9dOhjpJETgfkZcI4qST2yjMBjyC5yhnA/P
	ow7x28qM5HEO+yEykiky71rjZUYZ5i0LI7KUZ7J4qV0kQ8Dx4pia8pj+LAvZA6Rhdc0Pomzbox9
	nmk4DIN3wI/03ubBL0VEXaWyD7Sc9gkAejhpZl83hWfE+0SoYBZ95y+1KIA2ZaolIKexy1gZwYy
	7gCe8baYdlYLm9x/jpqv1fktqSOmhrCOboLeZHJMC+zYOg+q1EMshzzZxQaz5oAxkhwYW+LWuHT
	iT7gopJ6r3AX9T3Hm6bVy8aSCKoFUapl2Igzl+DOq+YzvpZt5R/9Rf11JqIas92spN5d2dO6ZFp
	oNwJSyaHH6I5QMQ13h7enjSjIcshLDm4y4KrHA=
X-Google-Smtp-Source: AGHT+IHrtRk0QtT7ZTA/hFKIOE4204rOebRYcbgbmGrixqAHoqC3GtqBLhTXx8zTUjS4cmCBWSTHvA==
X-Received: by 2002:a05:6808:4f29:b0:455:e5bd:414 with SMTP id 5614622812f47-45a6bf812d8mr6077840b6e.66.1767981969898;
        Fri, 09 Jan 2026 10:06:09 -0800 (PST)
Received: from bill-the-cat (fixed-189-203-103-235.totalplay.net. [189.203.103.235])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5dfb6256sm5222604b6e.0.2026.01.09.10.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 10:06:09 -0800 (PST)
Date: Fri, 9 Jan 2026 12:06:07 -0600
From: Tom Rini <trini@konsulko.com>
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: j@jannau.net, u-boot@lists.denx.de, kettenis@openbsd.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH] configs: apple: Enable SMBIOS / sysinfo
Message-ID: <20260109180607.GG3416603@bill-the-cat>
References: <20260109-apple-defconfig-smbios-v1-1-16477009c034@jannau.net>
 <20260109173351.GF3416603@bill-the-cat>
 <878qe6ad7s.fsf@bloch.sibelius.xs4all.nl>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NjUixkueznanYzUN"
Content-Disposition: inline
In-Reply-To: <878qe6ad7s.fsf@bloch.sibelius.xs4all.nl>
X-Clacks-Overhead: GNU Terry Pratchett


--NjUixkueznanYzUN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 09, 2026 at 06:49:11PM +0100, Mark Kettenis wrote:
> > Date: Fri, 9 Jan 2026 11:33:51 -0600
> > From: Tom Rini <trini@konsulko.com>
> >=20
> > On Fri, Jan 09, 2026 at 06:20:30PM +0100, Janne Grunau wrote:
> >=20
> > > Enable verbose SMBIOS table generation so that user space applications
> > > can use the SMBIOS table to provide details about the system. The
> > > desired information is chassis-type to determine whether the system is
> > > laptop.
> > > Adding the chassis-type property is proposed for the upstream device
> > > trees in the Linux kernel in [1].
> > >=20
> > > Link: https://lore.kernel.org/asahi/20260109-apple-dt-usb-c-atc-dwc3-=
v1-0-ce0e92c1a016@jannau.net/ [1]
> > > Signed-off-by: Janne Grunau <j@jannau.net>
> >=20
> > Reviewed-by: Tom Rini <trini@konsulko.com>
> >=20
> > > ---
> > > I do not plan to update u-boot's in-tree device trees. The Linux devi=
ce
> > > trees have almost reached feature parity. The main missing features a=
re
> > > the USB Type-C ports (on track for next merge window) and the laptop
> > > keyboards. I think it makes more sense to close the feature gap and
> > > switch to upstream device trees instead of adding to the in-tree devi=
ce
> > > trees.
> >=20
> > This sounds like a good plan to me, thanks!
>=20
> Yes, it is probably time to remove the in-tree device trees for these
> devices.  They were never actually used in the build anyway.  Just
> added because a maintainer insisted on having them in the tree.  But
> now that we have the upstream device trees in the tree, the in-tree
> ones can go.

Note that a small challenge for today (I ran in to this as part of
fixing OF_OMIT_DTB not requiring building a dtb) is the instructions do
say to concatenate m1n1, u-boot.bin and a dtb in some cases. But taking
the upstream dtb for that instead is fine I assume.

--=20
Tom

--NjUixkueznanYzUN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaWFDiwAKCRAr4qD1Cr/k
CrP7AQCuCIaHtuwJ6YDdfuspvrBLDim6UpQLGoQE2ChTKzFK8QEA7ewShYsnGHgm
0bp30lzfnTfaR/bZlOwfH5RkKgvyEgU=
=EnO5
-----END PGP SIGNATURE-----

--NjUixkueznanYzUN--
