Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0F7E4C1
	for <asahi@lists.linux.dev>; Fri, 10 Mar 2023 21:47:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1paka5-00043Y-LX; Fri, 10 Mar 2023 22:47:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1paka1-003GHn-RB; Fri, 10 Mar 2023 22:47:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1paka1-003tZx-3f; Fri, 10 Mar 2023 22:47:13 +0100
Date: Fri, 10 Mar 2023 22:46:58 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: fnkl.kernel@gmail.com
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	- <asahi@lists.linux.dev>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 2/5] pwm: Add Apple PWM controller
Message-ID: <20230310214658.424vui3frynit437@pengutronix.de>
References: <20230214-fpwm-v8-0-65518a0d4944@gmail.com>
 <20230214-fpwm-v8-2-65518a0d4944@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wbrnvcvhbc5cviao"
Content-Disposition: inline
In-Reply-To: <20230214-fpwm-v8-2-65518a0d4944@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: asahi@lists.linux.dev


--wbrnvcvhbc5cviao
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sascha,

On Fri, Mar 10, 2023 at 07:44:08PM +0100, Sasha Finkelstein via B4 Relay wr=
ote:
> +static int apple_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			   const struct pwm_state *state)
> +{
> +	struct apple_pwm *fpwm;
> +
> +	if (state->polarity =3D=3D PWM_POLARITY_INVERSED)
> +		return -EINVAL;
> +
> +	fpwm =3D to_apple_pwm(chip);
> +	if (state->enabled) {
> +		u64 on_cycles, off_cycles;
> +
> +		on_cycles =3D mul_u64_u64_div_u64(fpwm->clkrate,
> +						state->duty_cycle, NSEC_PER_SEC);
> +		if (on_cycles > 0xFFFFFFFF)
> +			on_cycles =3D 0xFFFFFFFF;
> +
> +		off_cycles =3D mul_u64_u64_div_u64(fpwm->clkrate,
> +						 state->period, NSEC_PER_SEC) - on_cycles;
> +		if (off_cycles > 0xFFFFFFFF)
> +			return -ERANGE;

This is still wrong and needs clamping, too.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wbrnvcvhbc5cviao
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQLpU8ACgkQwfwUeK3K
7Al6iAf/brzDkPdu7qhixSZXlHEcf+6cCEGjYdch6SwKLkspprLcOrBvHsvEa8ay
TYG02baQpF4eNbZdPBbBv2b4VOqDOJ92H8Bx7IvfhCQy+fdZkSCiSeXHPteY91Hc
A56UkrBNesv68qEdfX6e4vtVYZbexHFqgaeTZMPfr8dsqt0ms0RyyMMuT/DhrpPs
sBTZd7V0IybwXTCEomXUMbxOA1mzWfU05rEz4bPUOS14N9TL8i1Mom8VsZrMD5UH
bO6F9Y13HCXq8xUgLKZnoxqEEm1E2r6ZunUTSb/RenSaxGE2xx9NlHlTNeyKJR2V
FYA1FefcQgl8RIZvCowtSH9Y+Lkcvg==
=MgXN
-----END PGP SIGNATURE-----

--wbrnvcvhbc5cviao--
