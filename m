Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A6A79C8
	for <asahi@lists.linux.dev>; Thu, 16 Feb 2023 16:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D7FC4339C;
	Thu, 16 Feb 2023 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676564736;
	bh=nve5Ue1AJALAEX5aeOHUuJl3EWYyR+RvB0oWPuHaAPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBZMIvmfJx1sZUYx1H8P5shukqoca3HUxhoEXbs4GcQ92K/u/FoElpUYqPYSpvRiV
	 Fm1P02Pa6E5qop2uEvlLhHd6SFcUXyOX8QR0zQt6uNxFfiad4C7pjw5jUv61G9+BzS
	 QPnytouh/mh+JXwcXq1k5wM5nGWp0QhVbFSPStv0jHJyLNQWG1E6yIzd25BLdJn9iE
	 80TIEb/pxpt0pjPclxiVe1x8PmRbjbBZ4RuNBKMELesl0AH/AksyCQfNVxl3xI5ZG/
	 v6wHirlmmX922evaG3Gxfy+GmO1E/Mjf77j33GoJy5orW4V0ad22xj5+MIq1wJCgJD
	 hN2LdYcwkPsFA==
Date: Thu, 16 Feb 2023 16:25:33 +0000
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
Message-ID: <Y+5Y/ZW/FFJ5rRwv@sirena.org.uk>
References: <20230113102309.18308-1-marcan@marcan.st>
 <167362544665.163457.10878671229075890152.b4-ty@kernel.org>
 <20230214185234.uj63aovylzixs6xa@kazuki-mac>
 <20230216090411.GH17933@jannau.net>
 <Y+5SCAj4Vk8NLrW9@sirena.org.uk>
 <20230216162107.GJ17933@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Skpj9itf0StfGeN"
Content-Disposition: inline
In-Reply-To: <20230216162107.GJ17933@jannau.net>
X-Cookie: Serving suggestion.


--8Skpj9itf0StfGeN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 05:21:07PM +0100, Janne Grunau wrote:

> I think something went wrong with "[GIT PULL] SPI updates for=20
> v6.2-rc8-abi". The message reads is if you intended to just send
> "spi: Use a 32-bit DT property for spi-cs-setup-delay-ns" and not 62=20
> commits.

You're right, thanks for noticing.

--8Skpj9itf0StfGeN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPuWPwACgkQJNaLcl1U
h9Dt5Qf/V37kgFrW3nZL8VczgXJCUxn0MrUOxlKpy/vM+ZfigCJE9UiOOuyfJDBj
yfuYyHRtTPSNwAPavgUVH820gCixnE80ipxKe2X3ot7PonmsvLiq0lwqvx9qQYkc
w51k3981ZGo835FVP1+mH0gt4ZuyUj7W40K5v3r4sM4N+zyctFhPNdVB3k+TsdHJ
qoIyZprlsDL+JmO009DqGTiVI3Ov/0yQDq5VpWDS7mnRrFaFh5wNBjkgOy+4S7H5
6KLAJAQ7n4IeQTQsoltTufBfnlDkRcMcpSx+CekxsbugvxgRla+QqcCUYzFYEdVX
06htheZlFcCLELzYpHanojB+V3r/BA==
=1u9h
-----END PGP SIGNATURE-----

--8Skpj9itf0StfGeN--
