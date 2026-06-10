Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D4F3AC0C6
	for <asahi@lists.linux.dev>; Wed, 10 Jun 2026 21:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781125732; cv=none; b=RLV8esDvafIddDaZko5nnkA2jdxh++D9owJafn8mSx3ksc9PFUZ4MS9Fj5EZXyyzbEukijXa5Twc/ICwnXATDk4oxPyxnjIcWg15txanqeybUNkFvFiwwIYCfcwtPd5doIJ+KWWtPYP5NsdO1gWPvOdEYqTfaPepcMzZMKYTXag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781125732; c=relaxed/simple;
	bh=Ig2OVt3TBv7ddvTUNvfJSFZLo8RWweuoGZlGh1vDWos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRSXWnkZYF5qQs3psdQdGubxqky/OA6al47O/eu2G2vofGx3wPod2ULMgOjPBV9SyEm4Ub5v1cjzez5GQi19RpKem4Aa95IZmdi/FMJjgalgMe9h0Fh+QkgE1Sp2w7G9nbSmAdjIxKnIaCo1gfM11VcxX2PVrTiTavvb+VZld2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dHvdTLl2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dHvdTLl2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490af320e2aso79666505e9.2
        for <asahi@lists.linux.dev>; Wed, 10 Jun 2026 14:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781125729; x=1781730529; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ig2OVt3TBv7ddvTUNvfJSFZLo8RWweuoGZlGh1vDWos=;
        b=dHvdTLl2ltvoy6DxSMWCAu8X6tiZ562Ga35Pz8Fh5HLDeKmDyLD0eeTbA4MuWkFIZw
         EqOOmTGGlvPqVuVfUMxGObpzXApczaWLyXZr2xYcuEunLSjyWjilbgeCaA9xuCyffXvN
         YvoFSRpWkXjIEWVWnrzvQQ1UdWWxtwDX5aXr2xLBeDhj/XRABnXRpPORjs5+tkgdGiuh
         /eHNbDVIHPQNA/Mq+2OQCMOReDDKguisRkvZb53Le74ThEzvO0Pr9WkTQ8SJreauuJ8q
         xdyxmr8loi5/qKYlaDZNTcfORvnV4AllgFEndsBZlmSuzZyKjhjCEL1luycIu8KYxpXj
         Cy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781125729; x=1781730529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ig2OVt3TBv7ddvTUNvfJSFZLo8RWweuoGZlGh1vDWos=;
        b=FbNsRZuWNebsGwwJeyjJx1t8YYinoXZSjBzS9QarRvHHSIhx7s9+PRysZ/YO/GCVZX
         aj1HHFxTO4tA0IyKwi3nl37nMamBG8QgQMvM8aq53VcxeF/i6aoTTLvBflIed+Nul/Xp
         oL7oDerZF+bq1Py6zebTh12CQbupCk+WA6D809MFE+x6uQcNLX7d5hi/X2mbCpJbzSEI
         C03RHYHPlYM7ZM57P72l3tgzW+PgpefZctKitiGJh+TsMk8RCuX7BqIRjLR3/xUVC8Tk
         7+oiUeWBedB3ajmBxmrtBDx6tnsIF/VMwZBrWw+4/Uf3aitdtKGRHbyFsGDLBYtPfk3b
         nidw==
X-Forwarded-Encrypted: i=1; AFNElJ97oWFfhLqlUqdehBgE4CdAEXw/OLqMNFts39jOF37bwdh1T4g7ZiIIQiH1PC6ucWZjVOnBww==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5kj/hXCaED6keVlvCkOVapuMkxhtYVlo+pJRWlfN0iksD9bbo
	Ivg8GJRrUxcUB/JB7omhIbxNuOSAmT+OSpIylaUn8ZsqEnrI85HwEtIaif73PlAj96I=
X-Gm-Gg: Acq92OEolvr7PRKNxUIAvCI6B2F5glUKRhMx81PAg6BnglwkUZgxHBk0rAz8DAVn8jI
	PJrNfjrBfSkIao9W9BGhpK5ocWvxje1hJM6kYKS8agRblBA7rW6qIi59fpbeStjWPPm6zzBJLC2
	MOGXXK5ZCUmjeRvI9KvTKPK6QSklB4NWsJKMalMPHj6yNFVAGQ58/UHPPU6g05O2jdbOPjhP0cd
	IXsxuwEoW8z5uWkxDdQH9kE6qCj/sP9UIwa3uZMES+SfY29FWbEFzXHJZzIqasAfg88/eLcGSXF
	NCsHH9hgEgDkzGp62lKdsekq+oZ6EIeMPB+UP+VNUWMv4b9i75sTTzXbMbo5YK4c798Q2EhcwW5
	Y1KPT2jLpzqINbjpYuBfU6sUVAXGxioMEZmzWDLH50vzBDgdbKqBouLh0+HWzdttAgbkCRgaWqo
	HQ1LECLfForS24PTf3RwP5HCK2bRG9CFqFepkaJq0=
X-Received: by 2002:a05:600d:640f:10b0:490:b7e6:bd1d with SMTP id 5b1f17b1804b1-490c25e30a2mr298781385e9.16.1781125729131;
        Wed, 10 Jun 2026 14:08:49 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46028a6dce6sm67341274f8f.30.2026.06.10.14.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:08:47 -0700 (PDT)
Date: Wed, 10 Jun 2026 23:08:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Marcel Holtmann <marcel@holtmann.org>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
Message-ID: <ainSCcYroJUIAuwr@monoceros>
References: <20260504160940.2168650-2-u.kleine-koenig@baylibre.com>
 <aimXkX4FC4JVxt6q@monoceros>
 <CABBYNZKuOdtxa8ksEZM1FyjYJCQ22H6NzaX31t6LcZuvn0LMNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xqdkuhrraxjetghb"
Content-Disposition: inline
In-Reply-To: <CABBYNZKuOdtxa8ksEZM1FyjYJCQ22H6NzaX31t6LcZuvn0LMNg@mail.gmail.com>


--xqdkuhrraxjetghb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
MIME-Version: 1.0

Hello,

On Wed, Jun 10, 2026 at 01:13:44PM -0400, Luiz Augusto von Dentz wrote:
> On Wed, Jun 10, 2026 at 12:59=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capab=
le Hub)
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > On Mon, May 04, 2026 at 06:09:40PM +0200, Uwe Kleine-K=C3=B6nig (The Ca=
pable Hub) wrote:
> > > Initializing a struct using list initializers is hard to read, compar=
ed
> > > to that using named initializers is more ideomatic. Convert the macro
> > > used to assign values in the driver's pci_device_id array accordingly.
> > >
> > > This change doesn't introduce any changes to the compiled array on an
> > > x86 and an arm64 build.
> > >
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koen=
ig@baylibre.com>
> > > ---
> > > Hello,
> > >
> > > this is a preparing change for making struct pci_device_id::driver_da=
ta an
> > > anonymous union (similar to
> > > https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@bayl=
ibre.com/).
> > > This requires named initializers for .driver_data. But even without t=
hat
> > > this is a nice cleanup making the macro better readable.
> > >
> > > Gcc is happy with simplifying the assignment further using
> > > PCI_VDEVICE(BROADCOM, BCM ## id ## _DEVICE_ID), but this is a bit fis=
hy
> > > because PCI_VDEVICE also assigns .class and .class_mask (using list
> > > initializers), so I didn't convert that.
> >
> > In the meantime I learned that doing that would break W=3D1 builds, so =
it
> > was a good choice to not go that path.
> >
> > > Once all pci_device_id use
> > > named initializers, the two zeros can be dropped from PCI_VDEVICE and
> > > this entry simplified accordingly.
> >
> > Is this patch still on someone's radar? Ideally for application in time
> > for 7.2-rc1?
>=20
> It is no longer in patchwork so if you really want to get in please resen=
d.

Instead I unarchived the patch, so it appears in the patch list again. I
hope this is easier for everyone (it is for me).

Best regards
Uwe

--xqdkuhrraxjetghb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmop0loACgkQj4D7WH0S
/k5XeQgAoTcuZnjClD8CBiVzulCVvCVSkCfgQKHapo9L6hikgCrhNsvTOvHMFU6S
XDZ2dot5rGjM/KAYI0h8FHaXTdH36OKmbjykaiP+DIFuHS7VkpWcSc2EM7hAvZha
uGcJCF4xyc5CyNPElG/wDPHJdL2fJPJkKUjMeDiFSnU5qRg4spodg9e2dD03Hrap
0D0yH2F9jcYbHNC851gjYuJ3NvrJEHijOc8vg1Ylw8+9LsQDrt76yI2uffzB8/6n
/CFEgnnByMZObzRw6oaxYc9jXkjK+e7oiquz56xyx0c3SqFOlMrBPo3Zj2G9LIRM
UFLkgNRU51FxahnG5mJuKv98enwHMw==
=zDmy
-----END PGP SIGNATURE-----

--xqdkuhrraxjetghb--
