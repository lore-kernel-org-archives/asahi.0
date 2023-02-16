Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BBB747A
	for <asahi@lists.linux.dev>; Thu, 16 Feb 2023 15:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38100C433D2;
	Thu, 16 Feb 2023 15:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676562955;
	bh=hV3TgAk/KO+NdNpJKyDzmoNWy91YGJwb/WwPxBrMaqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bdIwx35G0MLr8zpqqp47h75H/OZCZVkusZsj7GbFecNMbH7P5oT4icb10MEw6e6Ri
	 q5QxF5kBcHp8OKYAJCFukJrcjZOrkJS/g3e2M77Cx5A4l9hdT5YrRNMCXDV45CO8kZ
	 xWFDid2csx/LxuLAqu7XN2tBxtyT1p90zhKJ+gb9AIqxPBjNoQeJP8DX/GAvjHHkQQ
	 5xCJzllEBLB8ocmVl37gF9KuBdQxVN+dpw3MH0DAOv3Zxi6Pr9Sy9pMQ+LmKPOjW45
	 UAQnSU5UcKuQm1IDwtTmfLGl13D0EQb1YkuitXgsNmkT91kEU6wgETLPMDeIZx7bqY
	 IQqiNudqyQkOA==
Date: Thu, 16 Feb 2023 15:55:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>,
	Kazuki <kazukih0205@gmail.com>
Subject: Re: [PATCH v2 0/3] SPI core CS delay fixes and additions
Message-ID: <Y+5SCAj4Vk8NLrW9@sirena.org.uk>
References: <20230113102309.18308-1-marcan@marcan.st>
 <167362544665.163457.10878671229075890152.b4-ty@kernel.org>
 <20230214185234.uj63aovylzixs6xa@kazuki-mac>
 <20230216090411.GH17933@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s65+AzCdwLsVrzag"
Content-Disposition: inline
In-Reply-To: <20230216090411.GH17933@jannau.net>
X-Cookie: Serving suggestion.


--s65+AzCdwLsVrzag
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 10:04:11AM +0100, Janne Grunau wrote:

> can we still get "spi: Use a 32-bit DT property for=20
> spi-cs-setup-delay-ns" into 6.2?

I think I sent a pull request for this already.

--s65+AzCdwLsVrzag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPuUgcACgkQJNaLcl1U
h9BBigf/dsJ+ETdTLuVQDaiiOGZssz74Zfb/yxvCGBxQPNF/e5096O+ulj4PrJo5
+Hv3TUl4BlbpSZpBU/xMUMvGLlCzAOY84+/5GORTiI3kv5dJPiANbhC74MWQgAip
PQk0CkRzmuTfstt6TJebtz75d1oaQ9IwzzPyJXNQDsf/QsFZ7ESbDNVFinfbUTme
UdLUS93gq7rmJ6Bug1NBn8pIlI+fXFPsX8SbBskh39mgtD3du5vgDoiffi45dLNa
f/Hil41eRHZf4/W0Te1MM7MVf4OCb4eJ0zTNRg8QUrC0LkcwwqLHiXvwgSuvNR41
56c4NZFev9qOAs83U+F1FIx7gJkTEA==
=U6EO
-----END PGP SIGNATURE-----

--s65+AzCdwLsVrzag--
