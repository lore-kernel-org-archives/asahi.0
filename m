Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624BE7460
	for <asahi@lists.linux.dev>; Fri,  6 Jan 2023 16:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DA2C433D2;
	Fri,  6 Jan 2023 16:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673022389;
	bh=jWB+sN7NrEajAweWKZpqeUW/3yCctjfcPWzZp9GCvNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dOpdXagINOab8jxuJQkJI+qER+/XiBLXJ/M86brz8ojFo4gs3UlnlW3faeTla9lTK
	 t/ztyWgcC+mhqmUnqGR6aLJGRtn5RmsCgrE1E+TLF/tShnZGT7C61dx0cjKHyOkNXL
	 6Nt44LTixnjWLfsOkqvXYDVkNIRkE1c42gnAqKc//tn8tRnTB0HK7WVF8+WM4+KBVD
	 MjRHxiFHO0qD7b8JMVSqo13OmDgdMcwD1dpsgCCMwGYM2Stwt0jl6LvtxTIFmX8gLZ
	 5gdG5X8Ywj+M4O2tKj5KjU/7EDrPMyfiEgvFZ+Y8cLzXKcnO2leJFZ17AvH+fI0x6N
	 DgQD2kvggwS/Q==
Date: Fri, 6 Jan 2023 16:26:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Janne Grunau <j@jannau.net>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hector Martin <marcan@marcan.st>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 3/5] spi: Use a 32-bit DT property for
 spi-cs-setup-delay-ns
Message-ID: <Y7hLrxQO9GbgpW1h@sirena.org.uk>
References: <20230104093631.15611-4-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c+1eWrxib7oClGdE"
Content-Disposition: inline
In-Reply-To: <20230104093631.15611-4-marcan@marcan.st>
X-Cookie: System going down in 5 minutes.


--c+1eWrxib7oClGdE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 04, 2023 at 06:36:29PM +0900, Janne Grunau wrote:

> 65us is not a reasonable maximum for this property, as some devices
> might need a much longer setup time (e.g. those driven by firmware on
> the other end). Plus, device tree property values are in 32-bit cells
> and smaller widths should not be used without good reason.

This breaks allmodconfig builds (I tested x86 but this should happen
for anything with -Werror):

/build/stage/linux/drivers/spi/spi.c: In function =E2=80=98of_spi_parse_dt=
=E2=80=99:
/build/stage/linux/drivers/spi/spi.c:2243:13: error: unused variable =E2=80=
=98cs_setup=E2=80=99 [-Werror=3Dunused-variable]
 2243 |         u16 cs_setup;
      |             ^~~~~~~~
cc1: all warnings being treated as errors

--c+1eWrxib7oClGdE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO4S64ACgkQJNaLcl1U
h9CXLQf/YnI1PGSSqXVvRBi3udlWlcxcl4e3XTdPIfx50uYNZtbMu7wTBBa/z1zD
taef+9KGMbp28DCMVaWhefYaFgDUrDk53fB0idts+TdHaX/Uww4BwvLZxwb1oYqu
KSPo4rPD5q05N7KtK4Z5JMtQ0ldP3rbk37QuzSZTsF2X7EwNTndsX2RiwBo2KQlv
/y2nxQfSA1qlfv6BNSnycJBNkxd283K5WIb0sfM0uc6J4lcF2pISHmx/KszZ+u54
QIS3Y6oaY0YOXTnn/o672+vuSB1I4EaM7mhv/RqLZOW3CgeZl0rSPGvdbXmaRWOd
RSBbY2L0j84DkOoVZ5O4Eb62R/7O9g==
=nX4z
-----END PGP SIGNATURE-----

--c+1eWrxib7oClGdE--
