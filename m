Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC8B1D88D7;
	Sun, 26 Apr 2026 20:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777235551; cv=none; b=AETtonSydLPsyYvAo24I7XbX2+PNynI1uE/xqfybIX6Emnc4hbNgW/ck7sPzDmfRAeuip85fi3a69H9zCUB3N5pGXyZ5/DoGRukQ8bMla7DgoYBAPPm3VYOLvbDwvXP5lUVDSmkM9I77dRm7WUfyk3yV/WP6qteMS0MnNsbttnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777235551; c=relaxed/simple;
	bh=Ds3gxzQ8m4suolOgA0go+iuDdpqvWttps5+xxjX8PfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrf5rNBhF43pKegJx/fSamzQKbTU7x01wN/D7bWcuPXIhK87L6bE5NbJdZHZIVfssr3IjLagxVEv6X+5souJRbb9HtkYk7IO95pC1VbjQY0x+6G44AQRj+DSyyOKP0HaXaA4Rh+4nRbHsoAyTjhp9CvaIqn2ABwhjzJH5U7/p94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u5VVXQFs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u5VVXQFs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB556C2BCAF;
	Sun, 26 Apr 2026 20:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777235551;
	bh=Ds3gxzQ8m4suolOgA0go+iuDdpqvWttps5+xxjX8PfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5VVXQFsYc80l2SeIAP0bUEYdIHKn6RWq8uPO2P/95ODL8Q4ePhhbcvK5JwmGWAO4
	 Zz5/305jEFiwjj2h4HmIJaozxIyvJjT3Kbq6dxHJDm5fCyCv2Q0xo7UFAoi1+4/zdj
	 rheeRI0wo+pXI78X3uMP9hP0C9sNazNcDFkAgEAHBr8RMd/r8wsoqppFamgDP9O+eW
	 9YHKsgnFVlQwlmArpaiuqtYqnHUXbdgHxrzkMIubke8jCIejt6fl9vXzhEYGTIaGNk
	 R9OPWoJjfOQVGCtOPRVZ08QDPiPJQ66Cej0mwoRKx/Ma4C8sUTvBbOTXQG4bATYjEq
	 WcgPBPSaAepmA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EA96E1AC5821; Sun, 26 Apr 2026 21:32:27 +0100 (BST)
Date: Mon, 27 Apr 2026 05:32:27 +0900
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 2/4] ASoC: tas2764: Deal with bogus initial temperature
 register value
Message-ID: <ae52W1bMIngzrTiv@sirena.co.uk>
References: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
 <20260425-tas27xx-hwmon-fixes-v1-2-83c13b8e8f54@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tJAag3hnjFSdKzLc"
Content-Disposition: inline
In-Reply-To: <20260425-tas27xx-hwmon-fixes-v1-2-83c13b8e8f54@gmail.com>
X-Cookie: Victory uber allies!


--tJAag3hnjFSdKzLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 25, 2026 at 10:44:04AM +1000, James Calligeros wrote:

> Return -ENODATA early if the temperature has not yet been sampled
> by the chip, and indicate a fault condition using HWMON_T_FAULT.

> +	case hwmon_temp_fault:
> +		*val = !!tas2764_read_die_temp(tas2764, val);
> +		return 0;

Should this pay more attention to the error code in case there was an
actual I/O error talking to the chip as opposed to a synthetic -ENODATA
caused by reading a 0 back?  If we can't talk to the chip we don't
specifically know if there was a temparature fault.

--tJAag3hnjFSdKzLc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnudlQACgkQJNaLcl1U
h9A/EAf/V2boh7Zey1I20Vy1k2PU7+bNRIFd5c0YmKJAoSGAkP4Ptr99sfXB+frL
/bzUhV39M1+UBVAhxriQ7cd+g8vnSqAaS+4+pGtMk0br7vuzIsFfUJxPVWHoGNix
nWdhB7j2n0y9+jFtu5fVdumQXxpLGQU1nuYRWjVXCceq3QmaZXDeOMWE3wYPfrEZ
uDEq9udjwJhdvs3pv+nmTqmFRN2WDuvDNqFCvVihkwFxeJnsyVJJxBugISStSd15
bUxhJjj5TT+m1ddgGfXOlNBVH8Qu2yJ90i5Vdz485Du0gYmYKo5z6O2BYiZvPyiQ
UCD/yOCQArJ7z3y3v5r6kIcsl9OrGw==
=86Ve
-----END PGP SIGNATURE-----

--tJAag3hnjFSdKzLc--
