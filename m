Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C153A9D96;
	Tue, 10 Mar 2026 18:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773168691; cv=none; b=ACAmk6kxl931q3e3sYbgc78lrsQm2zrjD/h9QZ4u8dDClc+jZaUElFuLAOSy95ZoEg3fawZDAXqP/Z04P3+TpQzcHzqf8JN7CfAdjEE4A4qHiGZRf6RhSZRdBl5szU6HR3+cci+ziTDx3JuLwTK2T4JoKwxfKJ4NG4MeNyyVPf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773168691; c=relaxed/simple;
	bh=KGaKMLvkoliMaZXpI7HDmUW+54rBNU1JmrNzpvNKq9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dk5KfU7bjG8KDsdMticmNApmRb1oCs+/QlAQEZtz/cxgk3LaJ6whCpkFVMpxEcMEWYEzs1+qGAX98qQtG9Y5jTkvWALQ0OXM63AjSehGFFYwivUKLeMMycrNUibv/+ElvLpurlzf1YbXJTMmRbWnZDf780lBseOcSpyDdYv1NB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrNowWCg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrNowWCg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FADC19423;
	Tue, 10 Mar 2026 18:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773168690;
	bh=KGaKMLvkoliMaZXpI7HDmUW+54rBNU1JmrNzpvNKq9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZrNowWCg5m9v/Sv/arAbden8FLpOA1NXgfvnh8tQ6ExCBcnk2Z8tuTf2fpxEkQoKr
	 h/s6cYaBHKuXdmx55AKQU3QqMN1Phw1nsuXuHd2NCqW4OnuSZH6r5mnzfE2PVPy3U+
	 X8QG6UgCP/Z0Vie2HDP7lfWFxmtQ/pOibByQa3ghwDfufMsVYzDWCBfGWT7zOwSrAd
	 cZTVJCr/H+HUKisJU1uVgxpw1ujuacM1TmOxK1X0ywv6Cc+awO+utkbkDQ8PJCEOUh
	 Qkjxh8DFCWhGFdtJmw32YMM/4ccIN6+rhm7OVRQR11RZ3H8Qh5jf1lVoS0JHk6jFh8
	 ppnfDQF2Gp9dw==
Date: Tue, 10 Mar 2026 18:51:25 +0000
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: cs42l84: set up PLL for more sample rates
Message-ID: <ac417b14-dcdd-4e67-b1c0-b41ff1e22fc3@sirena.org.uk>
References: <20260307-cs42l84-rates-v1-1-1c55a5673031@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RBIsO4+GHPvv843W"
Content-Disposition: inline
In-Reply-To: <20260307-cs42l84-rates-v1-1-1c55a5673031@gmail.com>
X-Cookie: A fool and his honey are soon parted.


--RBIsO4+GHPvv843W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 07, 2026 at 10:44:18AM +1000, James Calligeros wrote:

> Fill out more PLL config parameters in the PLL config lookup
> table, and advertise the corresponding sample rates to userspace.
> This enables 44.1, 88.2, 176.4 and 192 kHz output and input.

>  static const struct cs42l84_pll_params pll_ratio_table[] = {
> +	{  2822400, 1, 0, 0x40, 0x000000, 0x03, 0x10, 11289600},
>  	{  3072000, 1, 0, 0x40, 0x000000, 0x03, 0x10, 12288000},
> +	{  5644800, 1, 0, 0x40, 0x000000, 0x03, 0x10, 11289600},
>  	{  6144000, 1, 1, 0x40, 0x000000, 0x03, 0x10, 12288000},
> +	{ 11289600, 0, 0, 0, 0, 0, 0,                 11289600},
>  	{ 12288000, 0, 0, 0, 0, 0, 0,                 12288000},
>  	{ 24576000, 1, 3, 0x40, 0x000000, 0x03, 0x10, 12288000},
>  };

These are adding 44.1kHz based rates with a new value for MCLK (the
final value in each entry).  Those values are read with a switch
statement in cs42l84_pll_config but that only has an entry for 24.576MHz
for some reason, that won't match 112.896MHz and will just leave the
pll_mclk_f with whatever value it had before.  Don't we need a new case
statement there for the new MCLK?

--RBIsO4+GHPvv843W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwaCwACgkQJNaLcl1U
h9CvuAf7B7cdBFgbJWHBXq/4B1y6YOhvxovqXAvsuiCsq+b4Lkn4i/NZqfQfELGT
v2L5EDpNKgiljIRUP4qyQNBhlt99EdNDNfOakkhfA1gBSw/yejR5nrvk1gOU/5TZ
Wqs6olncic935gVUCKUfPcMN5PIR9nSaUBi45/uQP2DwlSPYgn9+3+QnQmpROEer
Hm8P27CyOxDV55HNDWo0fTAC3srJJSY3j6jLCyUwm74dHsicNaifooBJtj5tSoUK
//IxK1F7kPozgZ3a4GcwuMzYf7csMLrE4+0u2rSnJ9/Vbo/LdAFrwZCWQZVEUrbp
DCZv5Waf1+ZNHH0tCUiUJ6YUCnsKeQ==
=hjOh
-----END PGP SIGNATURE-----

--RBIsO4+GHPvv843W--
