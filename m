Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3314A02
	for <asahi@lists.linux.dev>; Mon, 22 Aug 2022 17:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8238C433D6;
	Mon, 22 Aug 2022 17:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661190331;
	bh=11zZAIvln2KnjZa+NDc5/38WwFHC5uUCvQwpMLeQgKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WUaaP22a5zZsy9GiQ8bCYSYGvAqnmUz0lvNXrBFoireqXcRCibtu479FOC+3OkX2r
	 e2MXqPuhICJICWMcFq+cVclfSrp9Yi5KZ6heB9sJ7ulJWRej4BJKMeYR6TeKSefDuY
	 EWBFPfQJtR6EOnJhiXOQTvHYQndzw6XMoJ05CjJUhx+NJnt6hPAiy3su+CrfKUZv1Q
	 KWKG4oBd/cEdIAo+XLWWd5mMcY6ofQKtMBQXCJAp1C83qba9TnZLHu3WtqqF/YbwEx
	 kqZ9A4hnf3PmxuvVL6byKPK1o7+90m0+Va1F1kj46jLjh7yVuu0W0pGxixRT78FDOf
	 akf/B/448h0mw==
Date: Mon, 22 Aug 2022 18:45:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] ASoC: apple: mca: Add locks on foreign cluster
 access
Message-ID: <YwPAtY1kp5tU/isF@sirena.org.uk>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
 <20220819125430.4920-5-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7TCI7W6orlvhYY9k"
Content-Disposition: inline
In-Reply-To: <20220819125430.4920-5-povik+lin@cutebit.org>
X-Cookie: Do not write in this space.


--7TCI7W6orlvhYY9k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2022 at 02:54:30PM +0200, Martin Povi=C5=A1er wrote:
> In DAI ops, accesses to the native cluster (of the DAI), and to data of
> clusters related to it by a DPCM frontend-backend link, should have
> been synchronized by the 'pcm_mutex' lock at ASoC level.
>=20
> What is not covered are the 'port_driver' accesses on foreign clusters
> to which the current cluster has no a priori relation, so fill in
> locking for that. (This should only matter in bizarre configurations of
> sharing one MCA peripheral between ASoC cards.)

This also looks good.

--7TCI7W6orlvhYY9k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMDwLQACgkQJNaLcl1U
h9Dvagf/TRY4LCW2H+nmGAoKwC6tDc1DZpexBXRhpqOhlBQD7h3NJbtNN6uIJwK6
E7n1ORFmQFe7fIgSz9vOQmTFBEGg+wYh/RqvEOZhTC0QpdXYe0l4H9yUMCEabiJg
Ngf6f0m08vBex9X2NDr+B/wq4xbXbMVlbSuMdNDgIqPqyczuuGFdBbrGuiOQFtFk
SlCQoiQXWW/OLTcSMok2d7To4zbfON7eaZBZTza8b3XeI5y0vnWyix67qAuhPCMY
i0SGbf2U8gbnEJzlkUDRpsWNH77Qie7c+VzagvzQvefKZd6Ww+ShI1fYq8CVtf+Q
BXIFo1OuoozZ7yTj2FWGC/dn2PuSSQ==
=7Lok
-----END PGP SIGNATURE-----

--7TCI7W6orlvhYY9k--
