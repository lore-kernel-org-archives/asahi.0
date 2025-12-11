Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF69322259F;
	Thu, 11 Dec 2025 01:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765417707; cv=none; b=jCyHBikjKOuuiQotulBHtvAQAqrj6C3kivyvXCFauaeE7sQwbk5hTfPh7HLnxrhk6keg+DpP5lGIR4klB1Oy+iP4UHv291WIuDJHdo3F87++2LBCRQan0/1xWJXuthsrTLvrPOHXttT67c5JJ6Sof7rUEN/dkCV3LxRT2C9waeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765417707; c=relaxed/simple;
	bh=bsNHK4wRv0LhzVOGuJzCuJXVaLyhXJunj4croYtEeWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHdlToDKTJiI0Xnb/lEbEinP0nHX4GMHahRyPZW3f4XVD0lYf3b7pjaL1qQyt6s+CI/GfTwNKQOTpWdo7so1KWxFsjww/Lk4a4HfYhSaXgGeWbwrIt5q4zmBLr0fvb9oRzA3SJu1iNW48o7UGRQ7kQhyXp9U8y37zMOGw7gjBiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lm7a7I7m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lm7a7I7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A6EC4CEF1;
	Thu, 11 Dec 2025 01:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765417707;
	bh=bsNHK4wRv0LhzVOGuJzCuJXVaLyhXJunj4croYtEeWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lm7a7I7mE9qT7WGiGUx8UdxDcVZSa9UN0nSaP4kBdo+g4JvLCTiRlTJ5N6u2XpsaI
	 3H/0he3VN4xfMWgfLDlRSC/2ZPWMELjtV4Sb7JUvQTeZPJ83sfDsCKUJdU0/s8ugnU
	 FuJJLcqRqY7PjJSOvqVH9+Tn3skjW5GMcqX0jGbLIqtTEUTLBR+HnFLJenNTJF/elA
	 RqNAVSBRTtql7F3quGz3ZEWZCy9kkTvjGzJk/eCcGWdjcY1uuXH3evh9/l+gq2HBsa
	 inrR6e+d4Oolyqn7mBvKmiLACb/xVnlrG3mSlQQzCc423uLgjGHDQJ7eqscGN/9Xz6
	 xs82Ied/wIB1A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0045E1ACB974; Thu, 11 Dec 2025 01:48:24 +0000 (GMT)
Date: Thu, 11 Dec 2025 10:48:24 +0900
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
Subject: Re: [PATCH 4/7] ASoC: soc-dai: define TDM idle behaviour modes
Message-ID: <aToi6OMxiAcdBrnV@sirena.co.uk>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
 <20251209-tdm-idle-slots-v1-4-38dabf6bc01e@gmail.com>
 <aTjZc3mgu7CQOkDU@sirena.co.uk>
 <CAHgNfTxmYxNaYOdGK4Eb4ouCqmUCjVuhzGdgTAL=+ybObqrCmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pb1joisuHwCHeqND"
Content-Disposition: inline
In-Reply-To: <CAHgNfTxmYxNaYOdGK4Eb4ouCqmUCjVuhzGdgTAL=+ybObqrCmw@mail.gmail.com>
X-Cookie: It's clever, but is it art?


--Pb1joisuHwCHeqND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 10, 2025 at 01:57:50PM +1000, James Calligeros wrote:

> We have the use case where a codec enjoys exclusive use of a bus. For
> these, the codec can transmit 0 on any unused slots to hold the bus.

> We also have the case where multiple codecs share a single bus. One
> codec can weakly pull the bus low when it's not being actively driven by
> any of the attached codecs.

Or configure so you don't have any idle slots.

> However, a number of machines split six codecs into groups of three
> across two electrical lines and then OR them at the receiving
> port such that they appear on a single bus at the SoC. Because the two
> data lines are ORed at the receiver, we have to guarantee that line B is
> zero while line A is active, and vice versa. To do this, we set a single codec
> from each group to zero-fill during the active slots of the other group.

So this is an actual logical OR gate somewhere rather than a direct
electrical connection?

It'd be good to have an explanation more like this in the commit
messages to make it clearer to users what this is intended to do.

--Pb1joisuHwCHeqND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmk6IuUACgkQJNaLcl1U
h9D25wf/UsJQP72iHm3Bx4cCkiOBX1vxvax9DWGQFjRnVyUlib3e81+nEUN9hPUP
F1z7hEOJl9VBT8DTHkCF+u69lJqj3VcaLyv4y9p5JRmnn8a752strfvFCbb6u8ut
zDAP+3DZ0s7/xaM55dr+dXoUfmde97HiZkk23mwW6Mk1GaVR0eW1Q141j2lMBCzM
oy2m9mRNnF0FqYMUhtXJE1X2ZqZJ4M3ATessCDZqG3HLk50nNdZxpYKl3T6J6KpG
fYksvE1mvk+Kub9c4I7iZ7rpJk09wOy9JMgL1kDKwKmsjsR5SkxnBBMoy6+r/7nP
uvdJYoHVO71HRc47ISk6XHQGduPIIA==
=WXvU
-----END PGP SIGNATURE-----

--Pb1joisuHwCHeqND--
