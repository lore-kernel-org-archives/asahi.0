Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CA82820C6;
	Thu, 12 Mar 2026 14:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325993; cv=none; b=gOml0CWt4tQNMneR321Gbs2LYD2eK3QXPgT4LV9ktBvGcl0fXM+o1i4U7PYpk/7g9zaiKsziiLEZldBh9vztKfe59/3Pjb3QCGILc/IOQEsaRhezn7jC9Oo+a2KfA2CIJaqw94vMjxGHnJmJu7+V0BOy5z1muETiSGw5Yoa0/x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325993; c=relaxed/simple;
	bh=hAqiSIPHV6ZBtT4ry40ie+ToTsclopBhbBmC3I37NGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRDVBxKkeC9MQPXSh4j1KEbkEpDAkoBbn3xNOU+caod0O/iFgURYz+d6LO24Pcp3GQ5OxTyPHctZgfUIXVMxYHwgyF8JmCaW7674sj0FG2rGKhnh8pj6rY36FRtfgILbpqR2e3kQFuZB1oYy79bz05NS9Es9N2xO8mfkYjbCUgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcSOu1Sn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcSOu1Sn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3179C4CEF7;
	Thu, 12 Mar 2026 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773325993;
	bh=hAqiSIPHV6ZBtT4ry40ie+ToTsclopBhbBmC3I37NGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RcSOu1SnEJQJuIIa4HOnXsEmrDTtj2Eq/Y4YzU1yzmHbRx1bJL+NCNR6Tl7twkZkw
	 hh0ItLcS3/IYKU6IBAN/XGDH9fySq3ULcSBAcDegHRpIatPOWR97xugE49nDTs/9mv
	 uMvoHa0lUo9mFVyY76byD8zxQpBAlEElnQPpsmZMqTTH/453cCqpN7eJXHiA7qh6sb
	 pt3CbCSSosij9eVHRMG1pLnFJZTn8BjycpF4y6iBmnBSTtIAQr3NBvUHdkAftgpRtQ
	 MrJ/VgJd7DE6hJsy6Z26G2h389OmPQrjiutt9vdJy3gANgIMG6PLd8SvoCUk5+1DRT
	 xjluM+5aId5hw==
Date: Thu, 12 Mar 2026 14:33:05 +0000
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Frank Li <Frank.Li@nxp.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v3 7/7] ASoC: tas2770: expose SDOUT bus keeper via
 set_tdm_idle
Message-ID: <6a3cc78a-77bc-473e-bfbf-caffbe8f25bb@sirena.org.uk>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-7-c6ac5351489a@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IXXiSMaL5DxziIGM"
Content-Disposition: inline
In-Reply-To: <20260301-tdm-idle-slots-v3-7-c6ac5351489a@gmail.com>
X-Cookie: I feel better about world problems now!


--IXXiSMaL5DxziIGM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 01, 2026 at 06:05:26PM +1000, James Calligeros wrote:

> +static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
> +				    unsigned int tx_mask,
> +				    unsigned int rx_mask,
> +				    int tx_mode, int rx_mode)
> +{

> +	switch (tx_mode) {
> +	case SND_SOC_DAI_TDM_IDLE_PULLDOWN:
> +		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
> +						    TAS2770_DIN_PD_SDOUT,
> +						    TAS2770_DIN_PD_SDOUT);
> +		if (ret)
> +			return ret;
> +
> +		break;

This and all the other cases only updates the bits it's specifically
setting for the mode, so _ZERO and _HIZ don't update the pull and this
doesn't update the _KEEP/_FILL settings.  Not sure how often anyone is
going to change this at runtime though.

> +	case SND_SOC_DAI_TDM_IDLE_OFF:
> +		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
> +						    TAS2770_DIN_PD_SDOUT, 0);
> +		if (ret)
> +			return ret;
> +
> +		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
> +						    TAS2770_TDM_CFG_REG4_TX_KEEPER, 0);

Actually this does _KEEP but not _FILL.

--IXXiSMaL5DxziIGM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyzqEACgkQJNaLcl1U
h9C9VQf/fZCHVpmQ9kpNtJbiGpHrvPe+rIlhBNyQU3d3Ae6pe9l6B5REJOofNuXd
93N4y6V0PdC8ua1LFqj7YsQXCNcvEFBXhRS+NY8K6+6QwqG4umZ1PwI8G7zMWw/i
kkboFELiFULhwmm1iTWox0SYqLnUTY0dwyTHnli0mTLApQA4fiaHYFFSp2uWl4WY
rbxnjqQbQtRVi08wPAUU/QoSAw42L72c3DZBhug+eWONv1u54O4G0ssZVc9SqWQ5
xAa9PzAWPRasGfrSzPuUHBh4AT29P1tI3Z+a1eRkiTL8e8zG9qW9E8iRTU3Cnfri
7ebNB/ybAN6A+DlJmlSnVXW1zzIaog==
=mZC6
-----END PGP SIGNATURE-----

--IXXiSMaL5DxziIGM--
