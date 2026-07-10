Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4360C334C3C
	for <asahi@lists.linux.dev>; Fri, 10 Jul 2026 19:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712194; cv=none; b=SX7Mymak5ApWsURe4yZv85dRMXhtImh1+71KhBYi4SknDt7ZcgurvM2xxOCrf3Et9gqmzjChxbhLrbWRgaIXy86vPTKw1vkehPQcZIKtw9Lf/CGly0biq8zFqknlD/o6kaG+0L69WwQiV9b4ZIbGIiRur3KQdSiWm9q0jT1SDKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712194; c=relaxed/simple;
	bh=wO1MPId3Vtrx5eVsLf+EKmRRPNbeNbSYmTHEZLEDlDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iTxz7yysj91hsv4IEMATg5GcFh2Qf99ScRlJ4DcrGJxywJvwsHxkC+qihnmPVZ5Xf2oYOlV0dc2c4T0+2k9WA7fkDp61DTKTlLzoESQqy/XH17N+OsOF9fk1xdip8Duc/CShsx0ozS0FhZ9sahKQkJoOMIdNYeJ3TWR0WZ0NrAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJQjFMO5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJQjFMO5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5344D1F00ACA
	for <asahi@lists.linux.dev>; Fri, 10 Jul 2026 19:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783712192;
	bh=WfoUlWEeuKtg5ji7K2r6ODJIVODJRvoxIKC//T1cf3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UJQjFMO5Ru2ypG3zOfZ4hEANXRTwjm/9ejCDdL+TooLEtRU0lvKPAW1D8BqKGZ5DN
	 zEvvZ5IrQFu2HlBI3YhN2lLdHplytIRiFJEYVKL5uQ6zKJSNEZcCZ/PvddjkctsLek
	 ih3/t2hRqRPK4J0+kCQXiVOKCSvhe5higOtJ7/3l2k1z+YjT0o1ItDEZFSxD6dtV4x
	 2Vo6d2iq/8Gns/ljNTKgJujR8e16p/tPYYz+2Ta1p+GlwWvhRPl+3uc9dAhpowXSfc
	 P/J9a1UZInP7coH4/Q7zbMykGiVkgBjPrY1eX9612k4wVRs+hGMHFD5WQf5IGIG3yC
	 MEBCiE5QSDZKg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c9cbf0719so7345571fa.0
        for <asahi@lists.linux.dev>; Fri, 10 Jul 2026 12:36:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RolshjDmED+ymgnYBeZrPN/8xy6xG9FysGUGqIiS2bRZkZRrSMH0YV/egokI20bVtWjLna2AQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDjB4Vj9a3EIIxG9MralCiyzeWq7tfCWgm9so1XOz/YIwStDKM
	X7NWIczvmPZc36NQaYipVeJQ7AQSR8PlYeiEs+ApT+qPWFvtHPf0/kXM/+BlGFHDmX6cP0R4Tjx
	Ei3M6sMT9tvXg96nppat494W5zzK/VoE=
X-Received: by 2002:a05:6512:40c4:20b0:5ae:c454:3740 with SMTP id
 2adb3069b0e04-5b0236ec2f0mr64636e87.60.1783712190489; Fri, 10 Jul 2026
 12:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com> <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 21:36:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLkhkEVsLyoYobV9ZfD0o7YWXh74cNsy2rcFrajna4mRjg@mail.gmail.com>
X-Gm-Features: AUfX_mxF7aXm1NUaeKv9tRmJ75XIeUyINM_M0uEJT4kZsHp0a8M3V6ZUZMQlacY
Message-ID: <CAD++jLkhkEVsLyoYobV9ZfD0o7YWXh74cNsy2rcFrajna4mRjg@mail.gmail.com>
Subject: Re: [PATCH v2 21/23] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Chen-Yu Tsai <wens@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	James Ogletree <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, 
	Ben Bright <ben.bright@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tim Harvey <tharvey@gateworks.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Saravanan Sekar <sravanhome@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 1:17=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable H=
ub)
<u.kleine-koenig@baylibre.com> wrote:

> These arrays already mostly match the most used and generally
> recommended coding style. That is:
>
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>
> Adapt the offenders accordingly.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
