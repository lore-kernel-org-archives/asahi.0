Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B1E217F29;
	Wed, 10 Dec 2025 02:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765334592; cv=none; b=AWPrIzi6I6LhHcl/WBZaaO79vhIEeEik9i89unpW3Tr/POvHYbhqyqChZnne/E47LlsRCAqcTiJ+NE4UIglBnmFzsUv5XEes082RfnXP8gMA6Ik0No3KxrbmRvJS+ShUhp1uV1wOBdqzycnNF5LC7hlJQQcOkKhnBiwVUeKCQAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765334592; c=relaxed/simple;
	bh=X+b6Ds7bmDEkMPiz88ZlLr0Tke0Lzhiei47PPP9Y6Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfQRx7Ta6q5uBTulXWjSvFC6UfnT3puPCliI4nESbZzSNszsaZlwUOuERhFc3U+VATo6eRqrR2OF3p5byZ97r9hvAAvx9fMrpGHnz6gIJE6XX/3h+Tluv3TT/i3TUblOxcKlgmfQabRpjXv80TEE7kM3nydkzNXTQAXOJjGToyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpQdcJSM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CpQdcJSM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798B4C4CEF5;
	Wed, 10 Dec 2025 02:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765334591;
	bh=X+b6Ds7bmDEkMPiz88ZlLr0Tke0Lzhiei47PPP9Y6Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CpQdcJSMWs4M8QuTtVJ+bnbNUmARkQ1gBUYFKTXSt3AhAYhizWobpRAWvY+LJOFg3
	 dVfIqakpH/b8pKN1BMKpXl6jUJdnqwpG9vzFjl3vUDV/GP/rcd66AMvTyGXH1+b4WK
	 o6KdADELPU+VRszdDs/MBnJf+MJUMkHhJFNA7L01QAxEFlq5yxfPUq6DSVKLx8mZKy
	 Rt0wu0Q777MwB/xDVyIcNAEOAcDxNU0raLrKK43Z+ZG1vWBBQdtCnJ9v1dPBEtU01o
	 ed+Es/YgKeAs95siQfkBh1AvzXs50f9R3SpiV+ncQiQ/2TbpFLQ3bhbI8zRjN1wfGX
	 wYX+Tp5HPyfFQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E23071ACB974; Wed, 10 Dec 2025 02:43:08 +0000 (GMT)
Date: Wed, 10 Dec 2025 11:43:08 +0900
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
	Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 0/7] ASoC: basic support for configuring bus keepers
Message-ID: <aTjePJuPNegXc9cl@sirena.co.uk>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SJWIcwdK1mSmc43s"
Content-Disposition: inline
In-Reply-To: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
X-Cookie: It's clever, but is it art?


--SJWIcwdK1mSmc43s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 09, 2025 at 07:31:13PM +1000, James Calligeros wrote:

> Consider a device with two codecs that report voice coil voltage and
> current data back to the host via I2S. Codec A is configured to transmit
> its V/ISENSE data on TDM slots 1 and 3, while Codec B is configured to
> do so on slots 2 and 4. The receiving end sums the two together.
> If Codec A transmits anything on slots 2 or 4 (and vice versa), the
> result is a bus conflict.

> Some codecs include configurable bus keepers to ameliorate this issue.

You've not really mentioned an issue here?  The expected behaviour for
TDM is that devices should only drive the the slots they are configured
to drive and should let the bus float otherwise, otherwise no other
device could transmit.

> Notable examples are the TI TAS2764 and TAS2770. By default, these
> codecs keep their SDOUT pin floating during unconfigured TDM slots,
> however this can result in garbage data on the bus. TAS2764 can be
> set up to fill specific TDM slots with zeroes, TAS2770 can hold its
> SDOUT pin to ground.

Right, so AIUI this is the actual thing you're trying to do - you want
to additionally configure a CODEC to drive slots it's not putting data
on to ensure there are no dead slots on the bus?  I guess you might have
some restrictions on clocking which mean you need extra BCLKs (eg,
needing power of 2 clocks).  But I'm having a hard time connecting this
to your description below so I don't think I've followed what you're
saying here.

> This feature is necessary to properly drive the speaker systems found
> on most Apple Silicon laptops. All but three models include six codecs
> in two groups of three driving two woofers and a tweeter on both the left
> and right channels. Each codec group has a single line for SDOUT, to
> which all codecs are connected. The two groups are then summed on to
> one I2S port. Each group must ensure that it is silent on the bus while
> the other is supposed to be active.

So is there one SDOUT or two which are connected... somehow?  I'm
confused.

> In the downstream Asahi Linux kernel[1], we set up one codec in each
> group to zero-fill or pull down its group's side of the bus for the
> opposite group's transmit slots. This is done entirely in the codec
> driver, however this approach is perhaps over-fit for our use case.
> Following previous mailing list discussions[2], I have tried to
> expose the functionality in a more configurable and generic way.

I can't parse what this is describing at all, sorry.  What is a "side"
of a bus, and how is all this different to idle TDM slots?

--SJWIcwdK1mSmc43s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmk43jwACgkQJNaLcl1U
h9AHiwf+KNgaEov7+sP0RmabPXtktOJflXPUzmECYjFNugoBNM4LeV91NCbOd17I
w3/P3+7rS798JEmVpnB6u/ERppHZt6hXDRNP7BVSB5y/vr0+P6Iv7aSIWnjsjsXJ
K+OicnfxX2MNo4QoSRkHKZqr0tXGOyewfsAidl4nxVvhbdZUPpozGXDexOxIvsbP
HE4RQBTIz5F9pISZ+pdEjrGCrj1aNbCfd8/DYlzdm9TQExI61JJ+HPPlUnv7YFEq
hHmuXXyqDt1MKIEqbvp3fwLzdM0aABW24WFoieXFwZNtZ0Aw2VAFkwvtNBvDCYVA
wtM8KiYQDpQp/Fnmj62T4YS9Yt7dyg==
=50C4
-----END PGP SIGNATURE-----

--SJWIcwdK1mSmc43s--
