Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A08322B83;
	Tue,  3 Mar 2026 18:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772561865; cv=none; b=sw/P5QCGgNjQaohi2z8Ec8nBoQFC5o/H0exZ6fWRLqs6maDr9p458UxatdHm7PUXOWx0x2K2D4puZ3NTsfjXVxcWUp0dHYoypY9SDETvI8yzSXtMeVK+ElH0WnW5jJwRFzazFR13L0tl5m71VhD/2obYQNQafFnIpKoBC/qBQeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772561865; c=relaxed/simple;
	bh=RRSAF7Cbn+Y7/qFbIiFd50NDJ3b2Hsk6Fs1KYlOpjjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W48sCDVhDVNxCu1Y47fAB9D1T3h2vwnNx2IMvOxAzw3Tu/qvCwgyHlyJNjeIbF2fhGV0ToNi6Hb5GdKxqYUaYEgqKQDs1AhydChYrVI2O7pffeFllmqbpu6h9ZtuvkmYYe9YuOsvO/aCVLghPD6H4JUxaqPfxzPL9UWW9A96ggs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFmnpksV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFmnpksV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F0EC116C6;
	Tue,  3 Mar 2026 18:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772561864;
	bh=RRSAF7Cbn+Y7/qFbIiFd50NDJ3b2Hsk6Fs1KYlOpjjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AFmnpksVfSIPe8qCt/hkyH5cbrYtt39OP5Dd9AY32ahzBq/SfLssswMsrvhiZRR/0
	 THUs+C/sfmMEfBQ3aTu06jlY3qRA3M2qpVNVOIco91EKL0ooeTPTsmD2PhdGZdNSAC
	 /HUblPl8vVEFgHnRUcjE8ArtRxPgBw6cNho4didjxHeBzd5lijRUQHXIs3KtRFRLY5
	 pK91xQHZ62j+GzG/i0sVJ/cBF9K/guf93KYaZj1/R2GpLN0zvUF65JurCgymnNYEfX
	 bUnyPAtYBhR2G/ik3yzTQFf0ZrdfA+LBkoXtVvzyTTfzjaveRUubMSKbi6DIEYSiNP
	 ZWZvArNOwxdlQ==
Date: Tue, 3 Mar 2026 18:17:37 +0000
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Frank Li <Frank.Li@nxp.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v3 5/7] ASoC: soc-dai: add common operation to set TDM
 idle mode
Message-ID: <0478f3d0-4b96-41f6-a69a-818255463203@sirena.org.uk>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-5-c6ac5351489a@gmail.com>
 <877brtacgp.wl-kuninori.morimoto.gx@renesas.com>
 <4716405.LvFx2qVVIh@setsuna>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R4THYWriuVzE2xcg"
Content-Disposition: inline
In-Reply-To: <4716405.LvFx2qVVIh@setsuna>
X-Cookie: Use the Force, Luke.


--R4THYWriuVzE2xcg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 07:10:49PM +1000, James Calligeros wrote:
> On Tuesday, 3 March 2026 12:11:50=E2=80=AFpm Australian Eastern Standard =
Time Kuninori=20
> Morimoto wrote:

> > > +int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
> > > +			     unsigned int tx_mask, unsigned int rx_mask,
> > > +			     int tx_mode, int rx_mode);

> > Do we need "rx_mode" ?
> > Only "tx_mode" is enough if my understanding was correct.

> For our (Asahi) purposes yes, we only require TX. However, TAS2770 also
> has a bus keeper on SDIN, and I suspect other hardware may too. Rather th=
an
> break the API later on should the need to configure this arise,
> I decided to add the capability now. I am happy to get rid of it if
> we think it is superfluous at this time though.

I do think it's reasonable to keep things symmetric, it's probably
better to have an API that's consistent even if some of the code doesn't
currently get used.

--R4THYWriuVzE2xcg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmnJcAACgkQJNaLcl1U
h9DTSAf8D0G8Yi1rPXU5owawPsaqcagcoZ+c0UhX0QTxFfnDUvvp1d5jHbmNGo9m
ZWx0C0/ZFmCimlRnGHpyt4YEhenuHsyN8/oqKUsy1Txgo3ix21CkQY5bPPetoZp3
QX+0g0TRFVIkz9SSddjj26w5rZ9QYwQhZDNv//HsXSHpCTOjCM5gjDyNYIbOz76M
N7gxBwo+HvyeR6kBXpNJAISqQNBJOK/9n4Cg3RxQfwz9UIooBBfzzGIirpbPJl2G
uJxs/9pk1MDUivxcR6CEVjexjRn3GhZFrQ4UQLoW3fuiRvbgJ7yEJlEHh1URHr1B
n9BDBFv0uM3a9yipyoTLWwzG6NOX0Q==
=12yo
-----END PGP SIGNATURE-----

--R4THYWriuVzE2xcg--
