Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D063CA4BB;
	Fri, 10 Jul 2026 22:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722257; cv=none; b=PJIY6iCurxioia5rD7vxbLGNYIrFSg8Fm3ZOHLueIXEeFmE5Zr13xkWB9k/WS6qzLLovmxj+JkP7rwcxV3WvcEsLx6hCQfLYB+gMTGQ1j9xnn8Q9aRZpIjKemO+p44CgaptcyE6yHDj4CR8hl2PWs/KoYcGH3D0LySLDDwf88fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722257; c=relaxed/simple;
	bh=HdHNtI6uhYgTC72Z+/7rLnRD/H/jiLAL4q9nt7wn+KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nd5sFTBIhZyzCmNFeAmxDgtXWud1XU5IahALMTNUD80Lw/eMwzBd3ZJeIkwwCWz0BLgkajwPypBXnLEOvls8V1ZkJ6WI3TOei/oRfBHANYe5ho+qri853UsfpbFj2KkqQbHLy2C/5NIztMWCLfOjkE2Kg5wpKe6PwXhqRmFt+Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wt73OMTl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wt73OMTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC971F000E9;
	Fri, 10 Jul 2026 22:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783722256;
	bh=MzCFBtHo034uv1RQ95sbY32kFNW3GJhKmqJy1gygyA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wt73OMTlZeTWZ9iGxCtWprbcGIIdUZU4gP4cpPc9cwYWbkv8i7vu+Px5G4szyXOSI
	 Foe37/WihmfhLKYGwbAiGYcgFlN4V32vU3yheg5b9fUJhgqIULWJyovF7B2TXI2MxI
	 NnnTDplVeb4j162C2hiUELJ54ajukofuUCyrqEXctYlbWidj+FgWaCETJGwpE8yLdN
	 a/MwB0Nv0FhBHug4jMGgtjuUWSw+yX9OfnJgfZcCnxp8ZOfNT37y4TybIGXID8OXKp
	 pcjGNCBAgFjDh8ZenVKuHdXyw6VpWmWKYAfS06/rLrycG90FqXMqigjrzikBMmLk25
	 xnbk7IIDp05Ug==
Date: Fri, 10 Jul 2026 23:24:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v3 0/7] ASoC: apple: mca: support simultaneous I2S
 capture on the frontend
Message-ID: <c9bd227a-cc37-4fd7-be3d-b7502f52fbfc@sirena.org.uk>
References: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
 <178370665528.82617.13561476084775898427.b4-ty@b4>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C0zlOfSEfyyeoIqi"
Content-Disposition: inline
In-Reply-To: <178370665528.82617.13561476084775898427.b4-ty@b4>
X-Cookie: Are you still an ALCOHOLIC?


--C0zlOfSEfyyeoIqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 07:04:15PM +0100, Mark Brown wrote:

> Applied to
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
7.3
>=20
> Thanks!

No, it's not, sorry - I backed it out due to the build failure and b4
can't tell it was only pushed to my ci repo :(

--C0zlOfSEfyyeoIqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpRcQsACgkQJNaLcl1U
h9AE9wf/cV+yWCIIM/voXF6G+sVPeIwa/5zCj9QOJS8Cv48ipRj7I3UEOO4dSrKn
lEWW3RmWvtau1RiXL4JoWKM4zo9hWHA2uzQ3BsQUydU5hDWyVcGI01j+EU0tZzjO
ydHP+hlzgd9O1FGkUKOW4Jxa6LLP//6n0pZpW5K4kE2gT1urQnFsl9vM5SUobW+5
6vU4D+tnN6rrezTc3qQrx4cmJA3W6GMIbaT379Ob+5fE3M/mKAVvfd7mFcKKe/Jl
iw3cLCkqMYTGt5UtWbehDqlprIG9DQ1f5wRZWNESaQ64xPT/9O5nW03okAupGeEi
V1xhn1F8/jE9vqccO5ITnihDucZ2Iw==
=aEmM
-----END PGP SIGNATURE-----

--C0zlOfSEfyyeoIqi--
