Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B54397AE4
	for <asahi@lists.linux.dev>; Mon,  6 Jul 2026 07:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322406; cv=none; b=kqNiPyfg9sJdUNXrZeJzetTwzMnTVdLXc5ege7KfaPgZ7trDG9DI26G37tvnwEDCgRUR1XvoBI53JtkwIfz4D42VceS/djLQOEuhTwlGmgVqnZ6/6SHL+wju+0qFBFcybUOY4XVK82NxMMeCMvv/9QWwEOz/lxRKGZINcTUyHM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322406; c=relaxed/simple;
	bh=9ZXUr18b6ICtMwcnfCfQqcoadYON5lGnHDJBPbVufHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6vnI2wzl44Ip07jKAuEYD0hA5is1RqMY09mDhSgew0x2u1OKVg7++pIQHzivGGRWYJE3ML2199SLHz5Xe4RO/3e9WOwZxAg+n2tpbNW3WJHy+ba7kra33evJscbRTMUdq/mqenv9Qltz6zUaexxGOxZzGgZLzy2ZBa5iZEUC7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Zl5T4/KD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Zl5T4/KD"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47863f723ccso255569f8f.2
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 00:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783322390; x=1783927190; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VIt88eh6zWv+oEhKK/Aw514C6mk0Vd1i5LusZK/Ssuc=;
        b=Zl5T4/KDsgVn9y77bkrN3Vo4LXpucrt0YSk3UxI3dPE6uHG4wr1a0ePCiIQG9BXnN7
         tTUJmovfC4OuOdu+X6gBWIDvoM75oOFoBjAR/McjnE29YMltrcxeH9fDy2UYJNIAPC7V
         YXuO+KmzvpCufmoDgSjvOAuHcISCmJScZo98QgINYZ0lOMJQtUsMGys4sQJa3scFPQ7c
         5odf/cb7fWdFzDN/alxmTlCRiCvIzJG0EfbWoHiXSLTvztjW1p3Mh8Z/pojwSCbX77cC
         XQI6DWIGWKVqchcgGhEpmf9zjRvh3i32HmunrPpuRqPiI+jpkJ4UNf66DgLyCDbtQpQL
         JoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322390; x=1783927190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIt88eh6zWv+oEhKK/Aw514C6mk0Vd1i5LusZK/Ssuc=;
        b=h4IsM+1zj6d5AZc7RA7IDRYJr2VrIh6KRtO519HbiIVOfui9ku9Oxh6cUbXulE7sk2
         Amu793YrCxaYyBCiV6cvxxQpf6lgVv+JoJarMJVWR4zO29CYnV/JowPaFZwpnkwTJeJZ
         tIq6wbQH44WdC+hDiB6ubECTI0voERui+KrcVIRBawdMSYETpZwvyhynt9//Tvqqjl3u
         BTEJFCmKvATJxopmwhj+mxMmXMbxrD64rrUVaL2OzVLAgBbTg8GJ47iQtu2aBzRFivFb
         VjgKOZ8pn6I82Y5yjKq//FHPJewI19jGvEUIKTaVrL3nW4feiWYAFEYpWcWX7C8t80TF
         vRwA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7PK4nFBR5TKfW2mFEXgCTruzRmFHSAW9W/8sQYA2B8AYa1Q6vbQketUQRzZNwbcb15HhIXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxNhi2To22tQOqD0Z0957q1GRNBWe5abWWjwoNmSqq1tZH/D8t
	VP30C50xsqeDkScn035Npnu6WHCKrye6IGIFyYvwpJoX0zTWomebXvZr3PJBC5HK8UQ=
X-Gm-Gg: AfdE7ck8RNkE97HzUGpdRbH+bJLAtbBeAaMZeLH+xsOH1lVB/vKuu2YKOtqNfJYCSb1
	vny1cF3PtfJMozF5RLQmIIEchrfIDJ69exqlJQH5T6pg/0RZyk8BUgsVZZQCpjv6E174y5WjI9K
	mx4P2kH7gauZuCrNTh/dBpS1HstrvOcRwaHKIMFdYdTXAiKycWjp2J4sxIWNSWoVybXLIcaGtA9
	+WhWfD2KOmORT13Xlgy8KX5UHqIchBCOj2vVjMO96pw4V9KsFx7V5GEZOGXbQ67Dli84/+Uz5Tc
	/gcnQ2cOYVmZwlsHF1BXMqLqLz+C+p/S0ccfSUQiW+nE4MvST/taQJk29wDVed5JNfxpm1ir3cW
	m8HK9RfXy5AcD3RtCDsD9JOCcxoVnz02G8Gvpqlj+ROxwsf67NcDI8xdfYxaW+JFFlVrq7CFHbb
	b08gnobgxNp3SwL+TTvEG3xVEbH6pco9ptXukIbDPiqIxvzXUT3nzxWF1Iy2Kgc3r8MyUN362Jt
	jfn
X-Received: by 2002:a05:6000:d4f:b0:478:4de8:9b91 with SMTP id ffacd0b85a97d-47aac7d018dmr7577860f8f.41.1783322390409;
        Mon, 06 Jul 2026 00:19:50 -0700 (PDT)
Received: from localhost (p200300f65f47db0426af56a07ec3b32d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:26af:56a0:7ec3:b32d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039bcdasm23183058f8f.21.2026.07.06.00.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:19:49 -0700 (PDT)
Date: Mon, 6 Jul 2026 09:19:47 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Chen Wang <chen.wang@linux.dev>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Michael Walle <mwalle@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Alexey Charkov <alchark@gmail.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
Message-ID: <aktWoIfY_DdO6gb4@monoceros>
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="64vjgbl764osolti"
Content-Disposition: inline
In-Reply-To: <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev>


--64vjgbl764osolti
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
MIME-Version: 1.0

Hello Chen,

On Mon, Jul 06, 2026 at 08:33:47AM +0800, Chen Wang wrote:
> On 7/5/2026 11:14 PM, Uwe Kleine-K=C3=B6nig (The Capable Hub) wrote:
> >   - Use a single space in a of_device_id array terminator; A single spa=
ce
> >     after the opening { and before the closing } in non-empty
> >     initializers;
> >   - No comma after an array terminator;
> >   - Also no trailing comma after a named initializer iff the
> iff -> if

This is actually intended. iff =3D "if and only if", see e.g.
https://en.wikipedia.org/wiki/If_and_only_if .

> >     closing } is on the same line;
> >=20
> > Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig=
@baylibre.com>
>=20
> [......]
>=20
> > diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-s=
g2042.c
> > index 7d07b0ca7d29..0b6461172e6a 100644
> > --- a/drivers/pwm/pwm-sophgo-sg2042.c
> > +++ b/drivers/pwm/pwm-sophgo-sg2042.c
> > @@ -225,11 +225,10 @@ static const struct sg2042_chip_data sg2044_chip_=
data =3D {
> >   static const struct of_device_id sg2042_pwm_ids[] =3D {
> >   	{
> >   		.compatible =3D "sophgo,sg2042-pwm",
> > -		.data =3D &sg2042_chip_data
> > -	},
> > -	{
> > +		.data =3D &sg2042_chip_data,
> > +	}, {
> >   		.compatible =3D "sophgo,sg2044-pwm",
> > -		.data =3D &sg2044_chip_data
> > +		.data =3D &sg2044_chip_data,
> >   	},
> >   	{ }
> >   };
>=20
> Changes to sophgo related files=EF=BC=9A
>=20
> Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks
Uwe

--64vjgbl764osolti
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpLVxEACgkQj4D7WH0S
/k6otAf+MDN98V1OLHB7JSvapxuE4DwDpddJFumdMe3z/vu/P/VdI1oEao4PKhGo
2fMsJUgJT4k/6wIfoB6C3asAQFoEg3UirigbTf0d26+LpcWXfr+MJ/e2tzlX/Yzn
2dH88yKAhOR4HFj73YAi1FscS6vtyPmk7w2A84lWRMvteeY+zJan75O9xwgRC7FX
gEMJExnAEBHY9tEW8dgB3EK07MFFQWLlVpGQll6BbLHxOcMIz17Pj/sI6+7Sv0xW
cahUhiwZ1m+Y0EElAHIwQFoWyyyg7KINbFYsCsnyL1ev/EbUFyGCMRuR270OEIJW
bKMoVE2keTYc8IQjmKqk7x/VPRLsTw==
=LX/u
-----END PGP SIGNATURE-----

--64vjgbl764osolti--
