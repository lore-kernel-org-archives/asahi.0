Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DB839989B;
	Fri, 10 Jul 2026 20:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783716072; cv=none; b=QwkXDi2rNsULMkpDVuL6WGnwpC6LGaJY0E9+R1Qv7zLmNMsKoRLe+ZJ9dSnu5Bdx45iJXvcURb7O+mB/p2JGE4AqXLYX0eLJL3EW/Oi2KwEzULmUhiPUWKRbYJVWhBuwpQWRYbOaHDFvHDgY48PmLQaXR7b9LiOqfxyl1HC3YTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783716072; c=relaxed/simple;
	bh=e52Nx/e6JnnRCGD4DalCMgiOCNKswEUFTwaew2DRius=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVs8FNR20e6tMIqEQjmxjd/nFqg5ksyfUws18quS+Kp+qJJKb34PoJpBceaABPRmHkLgSLUbiT4HfRdPX65rv3QE3azRyn3xhVVPlEubY9Bv+k09Kw1oi2f0hnQFrBu3/hGfZRrr+emFLgbTKiPXEfkeLfIAL7tPEPUANTtwnSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3cqg/R3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3cqg/R3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397001F000E9;
	Fri, 10 Jul 2026 20:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783716070;
	bh=7m6l315yF0O/Rfe717hLZIYnuCFKG+NolI0az9s51+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G3cqg/R3+StFq5xP/KwtYu8LJwlediqwWm5/pQXRY+uZttCrU9e1UNEHCJYgZpZeJ
	 MAIin2JtSA3FQgXv6JT1G66BvqGgiuyUine06Q72BD/lNjEmMAeNL4nGj0/hJz+QIc
	 URQNJSUCFi5XQs8nI8K+UvPw2T1owXD+ygmutI3rhEUHrQiLQbUo3L8UWKnMPX6+8M
	 FDFbya/De1M7YahcbEkuUTuad6XxrEVM+6yFeBuLOq8LHoOCbdbEhz7EfAelj7ExiP
	 LAvrkd6/fBXkhSx+ZhPNDOoiWhVAEJ04D1FqHFhPQSZcX3plbwDrVtSj7NPS2UWQmH
	 BbcFAYaMZaceg==
Date: Fri, 10 Jul 2026 21:41:06 +0100
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] ASoC: apple: mca: Separate data & clock port setup
Message-ID: <d5cadaef-54a6-466c-a12f-484fa2aecb37@sirena.org.uk>
References: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
 <20260705-apple-audio-redux-v3-2-ff7a7afe2b6b@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z+jjArJPOlT5Vtf/"
Content-Disposition: inline
In-Reply-To: <20260705-apple-audio-redux-v3-2-ff7a7afe2b6b@gmail.com>
X-Cookie: No directory.


--Z+jjArJPOlT5Vtf/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 05, 2026 at 01:37:51PM +1000, James Calligeros wrote:
> From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>=20
> Up until now FEs were always the clock providers -- feeding the clocks
> on any ports (BEs) they are attached to. This will soon change and FEs
> will be allowed to be clock consumers. Once that happens, the routing
> of clocks and data will to some degree decouple.
>=20
> In advance of the change, make preparations:
>=20
>  * Narrow down semantics of what was formerly the 'port_driver' field
>    to refer to clocks only.
>=20
>  * On 'startup' of BEs, separate the clock and data aspects of the port
>    setup.

This breaks the build:

/build/stage/linux/sound/soc/apple/mca.c: In function =E2=80=98mca_be_hw_fr=
ee=E2=80=99:
/build/stage/linux/sound/soc/apple/mca.c:363:17: error: =E2=80=98struct mca=
_cluster=E2=80=99 has
 no member named =E2=80=98port_driver=E2=80=99; did you mean =E2=80=98port_=
clk_driver=E2=80=99?
  363 |         if (cl->port_driver < 0)
      |                 ^~~~~~~~~~~
      |                 port_clk_driver
/build/stage/linux/sound/soc/apple/mca.c:371:36: error: =E2=80=98struct mca=
_cluster=E2=80=99 has
 no member named =E2=80=98port_driver=E2=80=99; did you mean =E2=80=98port_=
clk_driver=E2=80=99?
  371 |         fe_cl =3D &mca->clusters[cl->port_driver];
      |                                    ^~~~~~~~~~~
      |                                    port_clk_driver

--Z+jjArJPOlT5Vtf/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpRWOEACgkQJNaLcl1U
h9CI8Af/ZsomKI6ewAH8Ex2lNNo0XXLmz25XVk/ousp7dZn/cPNgepsNMUUdO/b2
zbk2YPNJnQ2h7LTAfAMYEVPdPefDnZe95TMoCkmOMTvmA5StnwogTZ1qdrAVvJM9
BKfsT6xzwuUo0DtIDN/ubDvg62Y4Z1mH0UQj5EHZ5XFoIslrSpGaOz/7RaufyqM7
BSQYO+OJk6JgIbKvZRPqKasFR/fRpKDusX6mpGja3vpZgW8FvtA9tK1GGRKYd79Q
JXPaAoq+0JhtYnZz8TTttONBBK+BvhjmhA5jXZ2OSVKpYimX/k3DBOhPMmIvTcLL
fT1H8RZFQZeM2CMVLZwTl92LUDEflw==
=S83u
-----END PGP SIGNATURE-----

--Z+jjArJPOlT5Vtf/--
