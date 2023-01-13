Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252C82115
	for <asahi@lists.linux.dev>; Fri, 13 Jan 2023 18:39:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pGOxI-0003Gm-8t; Fri, 13 Jan 2023 19:39:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pGOxD-005pLl-Fq; Fri, 13 Jan 2023 19:39:03 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pGOxC-00CamQ-Tu; Fri, 13 Jan 2023 19:39:02 +0100
Date: Fri, 13 Jan 2023 19:39:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, marcan@marcan.st,
	sven@svenpeter.dev, alyssa@rosenzweig.io, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] pwm: Add Apple PWM controller
Message-ID: <20230113183901.gt5vdmidprxbzzer@pengutronix.de>
References: <20230106135839.18676-1-fnkl.kernel@gmail.com>
 <20230106135839.18676-3-fnkl.kernel@gmail.com>
 <20230110230618.pfz267jj5ne34ava@pengutronix.de>
 <CAMT+MTToR+0_CmVBuGfLemALUv1XuevObAMB=TQXV0Vd7HdW5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nmof7qq6mclq3tlw"
Content-Disposition: inline
In-Reply-To: <CAMT+MTToR+0_CmVBuGfLemALUv1XuevObAMB=TQXV0Vd7HdW5Q@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: asahi@lists.linux.dev


--nmof7qq6mclq3tlw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2023 at 09:25:08PM +0300, Sasha Finkelstein wrote:
> On Wed, 11 Jan 2023 at 02:06, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > > + * Limitations:
> > > + * - The writes to cycle registers are shadowed until a write to
> > > + *   the control register.
> > > + * - If both OFF_CYCLES and ON_CYCLES are set to 0, the output
> > > + *   is a constant off signal.
> >
> > How does the PWM behave with *APPLE_PWM_CTRLAPPLE_PWM_CTRL =3D 0?
> > (typically: drives constant low)
> >
> APPLE_PWM_CTRL =3D 0 implies that the APPLE_CTRL_ENABLE bit is set low, w=
hich
> turns off the pwm signal (constant low). I do not think that it is
> necessary to explicitly
> specify that case in the comments.

This is an information that I want to have available. Ideally easily
greppable by using the format that other drivers use for that, too.
(The command I usually use is:

	sed -rn '/Limitations:/,/\*\/?$/p' drivers/pwm/*.c

so if you make sure your info is added accordingly that would be good.)

This is useful to answer questions like: Can I reasonably expect that a
disabled PWM respects the configured polarity.

> > Can you please rename such that the (maybe new) name for APPLE_PWM_CTRL
> > is a prefix for the (maybe new) APPLE_CTRL_ENABLE and the other register
> > bit definitions?
> To make sure, you want the register named APPLE_PWM_CTRL, and the bits na=
med
> APPLE_PWM_CTRL_ENABLE, APPLE_PWM_CTRL_MODE and so on?

Yes.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nmof7qq6mclq3tlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPBpUIACgkQwfwUeK3K
7AnWsggAk/ifPGzsZY/5XaujVz/l2za+R4K7un5xaWTjbba1YwhEvJJcLl0LNJbQ
vIqOfST9nif+KCixGcdeSZDkMLMC0GPYU/VRnuaWPkSkAMt0yGrdOUkiiFfSgqC4
UB8F7NfJX5nE2zWVIsspjI7liC5r68tH0mmy7Sjmi93Ux3e32WXCyNUoXR9h5Gt9
ZcNmSvBhVqmpMOORK7uPL0jC7RRTr+TWd2I1dfmJ7jOuWpxSDzpN40wcCe1ih3U3
R2O8GstPfM5CeXWRkXzktKUqk+oCOy2G0JWPTIlztyETKBfVqimJ/C+0VQP1hedI
hqlDcd1ZngxvKk5+scRf+OzQhg8L8g==
=ocLx
-----END PGP SIGNATURE-----

--nmof7qq6mclq3tlw--
