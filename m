Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB770747A
	for <asahi@lists.linux.dev>; Thu, 16 Feb 2023 16:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED648C4339B;
	Thu, 16 Feb 2023 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676563233;
	bh=zn5cqo7ihCyFYu66pNpA0T87YS1Zk1ekASHfJaV9lFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=skNWlZoOUUXh0hy+tBZaGGHPkzQBlRXFvd3ajeTtsBr9VvieB4Pdmv+sF3W75I1WW
	 efwoUZF216MVg2URY8IBDMypyQGyJHsC4CsdzlHkwB261fJA+dm7/KC0w/Lr66hyL3
	 6odrVBCFWi4Jd0PAG6hRo24i4eNiEV/mOSmBLjKIY5ZvV2Y2TTW10xWpme9Mnu579a
	 rnzyhb06wZjAAkEwNxuAKriz113isyUezmUt1jff8srxo7148y1+QHAcpRM09x6Br3
	 kWDAVePj5QETCISxrl5mU8MNmpGo1HiXRho65U1rh2Lw54ZevvuWTu+G/f5zZ1nbpF
	 n7walrUmsTm1g==
Date: Thu, 16 Feb 2023 16:00:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 14/17] dt-bindings: sound: apple,mca: Add t8112-mca
 compatible
Message-ID: <Y+5TGKoMuRr4XQ+b@sirena.org.uk>
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-14-cb5442d1c229@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zLAA02ljnSaFRQBD"
Content-Disposition: inline
In-Reply-To: <20230202-asahi-t8112-dt-v1-14-cb5442d1c229@jannau.net>
X-Cookie: Serving suggestion.


--zLAA02ljnSaFRQBD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 12, 2023 at 04:41:24PM +0100, Janne Grunau wrote:

> This trivial dt-bindings update should be merged through the asahi-soc
> tree to ensure validation of the Apple M2 (t8112) devicetrees in this
> series.

I didn't get a response to my query about the nearness to the
merge window and the prospects of the series hitting v6.3, though
I do see that there's a new version needed for some of the other
patches.  I'm just going to go ahead and apply so it's there and
I don't need to worry about or see resends, in case the rest of
the series is going to go in it's not the end of the world if it
gets applied twice anyway so

Reviewed-by: Mark Brown <broonie@kernel.org>

--zLAA02ljnSaFRQBD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPuUxcACgkQJNaLcl1U
h9Af/Af/YMaqhnQb4Eh5+46lP4Mxb8PbrkBIC4qlIjcB+Hh/k8zv4T6lxMliCgrb
V26ONFvyzAl+q0EBaeRgwcB2htrFjzmrTmXa4QnbmfGIOriavTXNqKhfwAqqIFOs
NJhxIAqVavNLiKHkW2opVIiWRDWq8Sf/tyKwsVZB6OQym2Fj+X1Zv35s1jp2SUeb
MhzQYMIvIrLLXtIcZzBb6H7G0kOFCFbnaqTginkiQPgYawuoHaZ/kxsGlbPZA1Dr
tuWHPGnkdFtg8tnlYDn9AUSI+k5VJovf9m9bGzstnzBpH8uovKEciu6sDAkJtkww
A/goHQ6NXCEgVO+yyApSnF7Ai4X5gg==
=KvWA
-----END PGP SIGNATURE-----

--zLAA02ljnSaFRQBD--
