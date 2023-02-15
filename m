Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7BB7B
	for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 18:04:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pSM8f-0002SN-Cg; Wed, 15 Feb 2023 19:04:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pSM8a-005AGu-Sc; Wed, 15 Feb 2023 19:04:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pSM8b-003oDD-CX; Wed, 15 Feb 2023 19:04:13 +0100
Date: Wed, 15 Feb 2023 19:04:10 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, marcan@marcan.st,
	sven@svenpeter.dev, alyssa@rosenzweig.io, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/5] arm64: dts: apple: t8103: Add PWM controller
Message-ID: <20230215180410.jhontngsrb5vvv55@pengutronix.de>
References: <20230114132508.96600-1-fnkl.kernel@gmail.com>
 <20230114132508.96600-4-fnkl.kernel@gmail.com>
 <20230215111652.lyhebfntqlibtmex@pengutronix.de>
 <CAMT+MTRydNiYnhBJYVCoS5iXnhr7MywCV0t7FanHWwbwv2TrbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yilcpz6dzlbuyk6k"
Content-Disposition: inline
In-Reply-To: <CAMT+MTRydNiYnhBJYVCoS5iXnhr7MywCV0t7FanHWwbwv2TrbQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: asahi@lists.linux.dev


--yilcpz6dzlbuyk6k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sasha,

On Wed, Feb 15, 2023 at 05:47:07PM +0100, Sasha Finkelstein wrote:
> On Wed, 15 Feb 2023 at 12:16, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > This missing newline looks wrong.
> >
> > Otherwise the patch looks fine to me.
>
> Do you want a respin, or can this be fixed when applying the patch?

I'm not the one who will apply this patch, so I cannot say. Having said
that, I wonder who will apply. Will this go via the arm tree, or via
pwm?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yilcpz6dzlbuyk6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPtHpcACgkQwfwUeK3K
7AnIUwf6A8IV/CXEap01qlTZISJ8wYlKprzqbrcfuItftWrFrVoOTL8ocSEW4fu8
sYqEZHd/xW1SkHLXn6aCg/1ujkFmMZDT9facvPhBTDzAE61zGbOL7NsDGY1hrhja
ngit5Zl77keHvabKpqNYKR9LmZtLTiqKpVKDcwhayfxGd1BRcMcA2sfm6HGjsNwi
+rIXUdzIJDC0t2rzDZAcFJWFbnScMeudnnV2A0OX/ljvDBKZLkQGDp5hHOxc6qmo
oToABe+8nrF6EtQit0ChbjudhiCrFKKezElks34G4E1Ch3cmj952/rTNHkDA5DVS
7nGERtYC2i9H2l/3kpgKsUSxI85jAw==
=ODpw
-----END PGP SIGNATURE-----

--yilcpz6dzlbuyk6k--
