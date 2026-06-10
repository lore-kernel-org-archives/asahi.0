Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4957E31B130
	for <asahi@lists.linux.dev>; Wed, 10 Jun 2026 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781110750; cv=none; b=Za4ZV6H6iEM+C0Jk3vd9OLE+o5gFBOiO6aA4djDzRLf4rQLKmvh10/cn3qiEfCqabAS0On8xVBSCc0WfK1xQDxTYffT+4I9oM5ne2/ShdwmFXgjPd0VvJudVg0B8bYeA9bwXNNSrKJoV9ekrK09BapzKs22BzTj+4vnx0aNZcKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781110750; c=relaxed/simple;
	bh=bVyyrVts4pyEF2ndHUxmpv1aAAxrSJxcFaTJx8fYUog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rChwbA9uFSjfndc+TJWK50eIGv4xx3t10vVAW9XFuz1yvf1cBgPRUjxzfawZPoEXDgASm/TPM5O4YcTX59JtnElEioqKdTWUbXM8r5C2KDOXryq6MWrUj6VVyPYBcjWkeOdL9/izfNqTuJ5FQv8zpbV4EJOMUNQmEnAZFq0GAwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OUFO5NVY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OUFO5NVY"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b915ded5so61790455e9.3
        for <asahi@lists.linux.dev>; Wed, 10 Jun 2026 09:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781110748; x=1781715548; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bVyyrVts4pyEF2ndHUxmpv1aAAxrSJxcFaTJx8fYUog=;
        b=OUFO5NVY3YGRZn3OoIfKsn29FMdPKdFxHhD0XI9dNUg8P8t8bw9NeYHWicd8kqxSKh
         7MAWAXsS7LJfwOJRhEUT5V2ZXRqrt+bbfixzUgd6sw0iU/nZ+S+NyTGQYQhgBvPj063P
         /2rNtyFOSOCoTczuCTte5+qkHyD/SPqyfXnoye/M/prv/6nfB3Eq3BVjaOXJf8+mO2gc
         0SKYAjnm25gCdTnw5syZ8Qa5GtrdhmBlUI1kwf6p93vuHCt9OuMD2Kml944YF4seKTeL
         +zddok0UvAN87IKdda4a4RbRTrnGzhA64eL+LfUe8VnTcWAVEvoUJRXoq3kZ3MQ3OF+R
         vgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781110748; x=1781715548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVyyrVts4pyEF2ndHUxmpv1aAAxrSJxcFaTJx8fYUog=;
        b=nLFm1oqexxOhd2Z6SBC/oJD+an3mQJuU9t9Wnb2kKbm6ZG2QGR4bmrpvIOfp+g0kiV
         RsiMryyYy1RmFRB/QKjoO4gxNnjj+sJv2+Lo3EHnynOwviyP9GqYYDlxrFrJVjc8pJRS
         Tvd/fLZX7kUyE10ygTAF8JcKhDDx+q095NfQSNVX3IQnlHjeVqvNrzwy5aPZBj5VUX9x
         cg+OSV8XDftL8GlcJ+yxpRCPLcAQju8mu1Ih89ePMKDl37JisF5bzMcx3jdjCSvLiOjG
         rNH5EJG58cLj6gLxfxQoO3ANRaWKrbWyLWDYtVQgl8WHVCPY9psBVtklipRW4ITb8pJb
         99CQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/PHbw/FRvx+gp0Dih8dk6wEUCWItJSq+5PSCK9d5b1QQzMZ/6P/CrobRYZ6W+6HXPMTNkVw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5iQmQ+ByKiX4/NAptsIAEalpzHa4yk1UJvbxp0XdroN09XWs7
	hu1YhOpaH2d/4g2FVQsCxQt+p8ZYYDJw0u+4KtcrlOEjSrbUvgOXFJ77Ii5zYRDDkJCVuqIAbel
	YTls5
X-Gm-Gg: Acq92OEeV8WIeHnTn+PAFydhCMHrXiL87xgHiB+2lBBrRsbG7ykYpSTHK8ZccR0BQM/
	qFdZlRk1WqeiCs4RiWOpOG6VsD60bUJLG/WPJMhWlu/7Y75EFCZMX3uoDaL7q4zKePcaA2X4eNC
	lVBz3fKcMMyU3NzoJeiOzUyU8LXZNN76lmr5goWmX9kNvHo/4BzwqWX8K7bcJEHPLbnN4d3E1Kg
	X+QE8M0GEy+3k5G5mSAB0fyDWEBSJ2fRnOT5RKO26zm9zkPRQug2/QJwiLWoATUpu7GvcXsky4v
	MFADM9SqiOEdWhLK9z0TxBbA49l0KM69QXrv4Qef+cG4dSOyzuzavd9SPJH3hnPomMoO2pJWsIi
	fElXvF/Won1F7c2BL8jokaxjoFydKGjaN7X2frohnGNz8DG5LcKpeQpMgJS9+VBMUI8K2fZjzy1
	SRyed+n/hz1GRN9wSWnMRR9eBTos+KmxFnTUTcIR/DXVS8zDqLduId9DNJgMIb309e0+K70Jm7g
	e3gnlh7UpQ9ZBlo2QB7pXCPNQ==
X-Received: by 2002:a05:600c:674f:b0:490:6e11:c303 with SMTP id 5b1f17b1804b1-490c25ed266mr430620245e9.13.1781110747684;
        Wed, 10 Jun 2026 09:59:07 -0700 (PDT)
Received: from localhost (p200300f65f47db046aec8c3a4b621e71.dip0.t-ipconnect.de. [2003:f6:5f47:db04:6aec:8c3a:4b62:1e71])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f344762sm78016031f8f.23.2026.06.10.09.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:59:06 -0700 (PDT)
Date: Wed, 10 Jun 2026 18:59:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
Message-ID: <aimXkX4FC4JVxt6q@monoceros>
References: <20260504160940.2168650-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3msjhzytjrmzyqmh"
Content-Disposition: inline
In-Reply-To: <20260504160940.2168650-2-u.kleine-koenig@baylibre.com>


--3msjhzytjrmzyqmh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
MIME-Version: 1.0

On Mon, May 04, 2026 at 06:09:40PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Initializing a struct using list initializers is hard to read, compared
> to that using named initializers is more ideomatic. Convert the macro
> used to assign values in the driver's pci_device_id array accordingly.
>=20
> This change doesn't introduce any changes to the compiled array on an
> x86 and an arm64 build.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
> Hello,
>=20
> this is a preparing change for making struct pci_device_id::driver_data an
> anonymous union (similar to
> https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre=
=2Ecom/).
> This requires named initializers for .driver_data. But even without that
> this is a nice cleanup making the macro better readable.
>=20
> Gcc is happy with simplifying the assignment further using
> PCI_VDEVICE(BROADCOM, BCM ## id ## _DEVICE_ID), but this is a bit fishy
> because PCI_VDEVICE also assigns .class and .class_mask (using list
> initializers), so I didn't convert that.

In the meantime I learned that doing that would break W=3D1 builds, so it
was a good choice to not go that path.

> Once all pci_device_id use
> named initializers, the two zeros can be dropped from PCI_VDEVICE and
> this entry simplified accordingly.

Is this patch still on someone's radar? Ideally for application in time
for 7.2-rc1?

Best regards
Uwe

--3msjhzytjrmzyqmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmopl9QACgkQj4D7WH0S
/k4iqggAj3aeMF621GTGpJEHIqnNARfBAqngiHflYRiIhmKykwRxpBFaMIbsMmcs
qaS9NHLpxehcieZKUsjtuHpxJ6kc8//qqgRhfwcBdzpgoWz+eFyjxaIXavQ1z87b
k8YJJ6J5VNFnXKiZT4pBl1W7c3eWF+kCoq8UYyNHvI/cE1CCAd7qR5gprTFiZHkS
xH+/9H//w9KQEGL8tDXY2q2s0QSwThwPnABCbIl2gzwsnU/MhM73oQW+DhH1WaRy
rfclH5p/FfkqtITu8CqaDd2hAxtn3KVvBCbQRNHYk6nGHQnxWMnl9fOCSVMu+3HT
mPViuT/eGfETuUtngl9g2o6whmonPw==
=hiX3
-----END PGP SIGNATURE-----

--3msjhzytjrmzyqmh--
