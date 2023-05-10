Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F2F362
	for <asahi@lists.linux.dev>; Wed, 10 May 2023 02:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694C8C433D2;
	Wed, 10 May 2023 02:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683684990;
	bh=U6aBhk/Q3uUnMk2O77E0L4T+7y5ww55Q2QBKyfZlPTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDCHGHa1qYxnTXFB9bLTFz3ZHJo8VAlcbicvPIppEAzkjn81E/RYICcNwlrTXS7/B
	 uRj0Ye9WtzJkHlYqxCnoihSBRvP7GvAHmpVqW0WoxUi0eLiytI0L5h6JCzuaCnHxWO
	 2SOj0DD3FSyqSxNYCIWlr1xs81rnVgtnKrMF0l/VRuW9Nk+kc25yOpstF6Dm2hQJ8w
	 Zy8Tc8kWUygooW27RI8L9+P6W7rxQQ9H7Agj3FRWdWwVxpOy+qJJqdAtIXL2Yp/Xg7
	 aNI62wk69cxWOEImf+ALmOuABH3AOoUmCxdeYPTJStTkSsjtf2d2RxRf1hG+VU68Y2
	 AKOEO/Xrtww2A==
Date: Wed, 10 May 2023 11:16:27 +0900
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	asahi@lists.linux.dev, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: ssm3515: Add new amp driver
Message-ID: <ZFr+e+bM86Rwj2LH@finisterre.sirena.org.uk>
References: <20230509163828.86003-1-povik+lin@cutebit.org>
 <20230509163828.86003-2-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cxYPFokHHwYbjCKb"
Content-Disposition: inline
In-Reply-To: <20230509163828.86003-2-povik+lin@cutebit.org>
X-Cookie: Avoid contact with eyes.


--cxYPFokHHwYbjCKb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 06:38:28PM +0200, Martin Povi=C5=A1er wrote:

> +static int ssm3515_setup(struct snd_soc_component *component)
> +{
> +	struct ssm3515_data *data =3D
> +			snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	ret =3D snd_soc_component_update_bits(component, SSM3515_GEC,
> +			SSM3515_GEC_ANA_GAIN,
> +			FIELD_PREP(SSM3515_GEC_ANA_GAIN, data->ana_gain));
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Start out muted */
> +	ret =3D snd_soc_component_update_bits(component, SSM3515_DAC,
> +			SSM3515_DAC_MUTE, SSM3515_DAC_MUTE);
> +	if (ret < 0)
> +		return ret;

Why are we not using the chip defaults here?  We use those for most
things as what's appropraite for one user might not be appropriate for
another and it's easier to agree to follow what the chip does than to
select things.  There's some exceptions like for zero cross options but
not typically for gains and mutes.

> +static int ssm3515_probe(struct snd_soc_component *component)
> +{
> +	struct ssm3515_data *data =3D
> +			snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	ret =3D ssm3515_reset(component);
> +	if (ret < 0)
> +		return ret;
> +	regmap_reinit_cache(data->regmap, &ssm3515_i2c_regmap);
> +
> +	return ssm3515_setup(component);
> +}

We don't normally reset things on component probe, only on bus level
probe...

--cxYPFokHHwYbjCKb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRa/nsACgkQJNaLcl1U
h9AK2Qf/bWiXFzpCWnZoxxEX3Xk0rhx83Vd2brRM+A9E0ZKdJuHIjfT9W31cWaMH
SrpE3KzlpOaGr6c1s89QhCT8/EA0gNUBcrOOkiALAlkQVMPrDaUq890JRPvmj40B
NL4Eh4Y2JeW8vcFL0v66NbpTTlko6z+M5vX9geeQMcujYzzf4XynRk2VvOOaaXim
aRuM7+COfpF5mwUfOY7AMNjbTtO0L60++LcU04oH2kUnEpOyAy5PPcn1oFg8DirS
ioTe1/rpDimXpt6+vp/VzMSF0StpKCstmx95qPxJxv8C3w6nqWOGhcwYVBunD9vW
/MS3OS0aTvfjAvOoYz2w4oli8jc+jA==
=tvnt
-----END PGP SIGNATURE-----

--cxYPFokHHwYbjCKb--
