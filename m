Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D27F7B
	for <asahi@lists.linux.dev>; Sat, 11 Mar 2023 19:43:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pb57N-0008P4-8p; Sat, 11 Mar 2023 20:43:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pb57J-003Szm-3f; Sat, 11 Mar 2023 20:42:57 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pb57I-0047FD-ER; Sat, 11 Mar 2023 20:42:56 +0100
Date: Sat, 11 Mar 2023 20:42:54 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: fnkl.kernel@gmail.com
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	- <asahi@lists.linux.dev>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sasha Finkelstein <7d578vix8hzw@opayq.net>
Subject: Re: [PATCH v9 0/5] Hi,
Message-ID: <20230311194254.lydmh23has2e3flj@pengutronix.de>
References: <20230214-fpwm-v9-0-364480b0e4bd@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yfmtvikgbkfwkb66"
Content-Disposition: inline
In-Reply-To: <20230214-fpwm-v9-0-364480b0e4bd@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: asahi@lists.linux.dev


--yfmtvikgbkfwkb66
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

apart from the subject this series is the same as the one sent slightly
later. If you want to reply to the patches, please pick the other thread
to have all in one. I'll discard this one from the PWM patchwork.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yfmtvikgbkfwkb66
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQM2bsACgkQwfwUeK3K
7Aktogf/ZNH0mckncPX69jVwQNe8WsD28BbcNbz87J/7l3czLEOSt7kTd//8CGME
5RIwS7J2pOIuQC/3rIr4rBLZ0BEPr63Jnc5BZ16963YP+FGAgQfOrJq+BfxjP3Ua
2ez7UzxNte8AOkMl/9DlsTjrBlmMGUR/iVeRhw5FKpJyZOHMp+DubSNRc1Ve/47z
bmVc/2oDSd6iD5qNrWiFDzHkxVT1lHS/G+rwvNqc00i+bWq89BU0socJlGy+u1ox
iY0t0/U4dp9hHvAnFWTK96f4YwJzF5Bw/FAqVvCXnunrrRtdPzUxiik6p0Dub0YT
fB31MpDPTHpevrq3t3r6+Klg6PTj6Q==
=QJ99
-----END PGP SIGNATURE-----

--yfmtvikgbkfwkb66--
