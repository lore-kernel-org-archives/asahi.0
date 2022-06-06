Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA007E
	for <asahi@lists.linux.dev>; Mon,  6 Jun 2022 19:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC115C3411D;
	Mon,  6 Jun 2022 19:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654544952;
	bh=UzryUnnGvZZBNEMB0odKe1O3TvXeLuFqBrHf32g9aVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSyhAlslzDDLj/7+Ko7uPEdCPdRI4c8xh7YsepEmcyIlfyiKhprn2+f9X5Uqkymuv
	 4tkQNb1dIa13VQQdvzszUg+0yNoXARS3zWuu5hq4Ak+Y5B21nhDSSlU991gfMTO144
	 /MU9S1P/yQSnhBdRvcSuLFSaHDuzSF+ttkze0lVvkJX5YykMaNKl21+daYla1GWA9N
	 9yhKNQSQpMSBiBhR7/I+00PZvgapPRk2hgHEJ2PHV3KOuTUj5ngjvx1kROjhoDwmw1
	 jnZhZ7BP3uEkBiupsa6PUosb/egFxyIVpPk7SQqgh9o+Ry9lSeop6vKXQ4VDZETtv5
	 25y1JxiHsQUUg==
Date: Mon, 6 Jun 2022 20:49:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/5] dt-bindings: sound: Add Apple Macs sound
 peripherals
Message-ID: <Yp5aMi0sSfBQzk0p@sirena.org.uk>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-3-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vLLkHsME4UnMDWvc"
Content-Disposition: inline
In-Reply-To: <20220606191910.16580-3-povik+lin@cutebit.org>
X-Cookie: Have an adequate day.


--vLLkHsME4UnMDWvc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 09:19:07PM +0200, Martin Povi=C5=A1er wrote:

> +      dai-link@1 {
> +        reg =3D <1>;
> +        link-name =3D "Headphones Jack";

Incredibly trivial bikeshed but normally that'd be "Headphone Jack"
(singular).

--vLLkHsME4UnMDWvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKeWjEACgkQJNaLcl1U
h9BZ3wgAhIlgRunaKB0X+XBqE2TxgOKqeJ9dsZt0OJULGSwYFsGmFVb+calG3r2T
TnKHqrx30urVJntDF1UmZu4m6Z31PMR5NXDvmMTy1DLb/LHyjOG/kAdRI1DW1zZm
xVQFXD4QgCsyB10o+UL+Xl8AfWrj7FqoGXGioG3nYMWmtqsldUI2FinUDZKLZ5ef
kqWVr17QjYvQSS/HbxlDfwQV4x+7JcMoVXn53oP21uOuYtg1peXr1ST50UpY+ixU
fSGC+tIq7h/zTiKoXcbB8kPyLxZrAHMW8d+KolWhZzfq0ff06SMb0nfS4t7vT8Vy
tbWwjbvUTkF7PRrrwCW6KCXI19BxWQ==
=9TYE
-----END PGP SIGNATURE-----

--vLLkHsME4UnMDWvc--
