Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363354;
	b=HNI8KozTdsXRJgGBxy7dnCcFfytbTgGsJDrmPulsNvVmVuSTY9NYOVzZBMw0oScZd0HO
	 PEfAumAx29a/bDXNCPmXHEosTlFN7AVUvrbNzlcGu+LxU2Z4bB1r4PDlHH+IwFggV8Stx
	 mL5L9a2/oUFoEdg0gOsHmoRt7M9YO5jBF6D3AcJtd5uL6tnMCeeDoqTCZCBPR+0aRIyn/
	 XPYXck0CuWz2y/wDZtD0mi3ZkMeiZPiKZmlRQ0+wFLkrYswd3p7G6rbHzj9Qgc0PM3sqI
	 JNXVOqnItd7frL3Yn2ZVKTtjgjeoL8zC//F2HAoiI11hJYJKYpR3ISq7Q5odRsa6w+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363354;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lAhgMwbCGkquv8DnXUEthq+pkw17wZ1l1EuClqj5Zd0=;
	b=FhIgTaNeEXGGcVFWDnmbf3REMfKaJscIkKQ6IztdRGeRDDy5eb3WtU3WTcggM6L1rcS2
	 OranEyXVh2reMoEPNNeV9eUebtGreOnJozDgFMfZWpRM0bKZ3CYThWfZTnOQCL4vFd37u
	 avyGvmrOcB5/M+OlmpnzWRnvPn+3qQz1No1LmDoL6QidSC7emmcpuQYhCj2gDuv7+y+I8
	 3G+Wjtc5yO9IunxlaCLqPlx9WN3DewMTaEiYrIAdcdyJdGSbhypSEWcJSvVF0DhA3sSJH
	 JIQdTQkSIK0wH9hvOk3F0puzrWy5aVnTBp8hn8Y+JjMGSNst4KrDgOREhlZ7tGbT2jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wj8MNaCB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CCA606A333
	for <asahi@lists.linux.dev>; Wed, 11 Nov 2026 02:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wj8MNaCB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF011F00A08
	for <asahi@lists.linux.dev>; Wed, 11 Nov 2026 02:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794363354;
	bh=lAhgMwbCGkquv8DnXUEthq+pkw17wZ1l1EuClqj5Zd0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Wj8MNaCBwCApL0nTzYAS6EYvG7ywnTpsSyVO1RVP4BFQVcTKVD/xFPa9uKjVihy4l
	 i8TrDB9BxnQmoT7ICSmt+i/6FWJHckwiddrOW7Mh3JjG7GzuGAqoJYRpPeuVNw4WWq
	 WVx2DE5obNSxISliSnIOu+FCfuSZQuvlgZahdlCburPIokjd/kp7AOkkNgYq0RSqxh
	 sDONNoLJVcigvR6CjUKTeY86U6444zeeCCqPsVglY8cq+ZR4zOv7IKu4rGSAZwHmst
	 T3dHgqqICzdzoli+qk/lZ8dlQGGm9ir1G43jJYmWkRuvxt1BJySHsytUXBGdRzr5pE
	 VzSzwLr7YvJNg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14f3dab09so1525819e87.0
        for <asahi@lists.linux.dev>; Tue, 10 Nov 2026 18:15:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFlI1enMctHQR973fZLxfcgRFF8T3NKu/7v+iPBhWNR86ipsakuciEP2ljiNQp1LL2DCwHYvQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/q/253Tg/wIFkWelbZejAShnpyTW83NzEcRtnp+xqHYEavIZrH
	5towrXxU97a97MD15kNHKUW35SqDZccp6gpXAx1lYrIH3v+AtFj3s0J4M4qf+UgexWnEb/Qdc4z
	/tAOrsSmsihCaZPE9ZKlGiFM8kmqwyTY=
X-Received: by 2002:a2e:be8d:0:b0:3ac:429f:6d93 with SMTP id
 38308e7fff4ca-3ae126c230bmr1415561fa.29.1794363351836; Tue, 10 Nov 2026
 18:15:51 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com> <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 11 Nov 2026 11:15:39 +0900
X-Gmail-Original-Message-ID: <CAGb2v67xpAbsmez2qt7pypW5T8czE93PtU2QjcSPuQ4a7c7qoA@mail.gmail.com>
X-Gm-Features: AclHuK-PEU8_Ju7uMZ7QoR2Wn0i8AsTrMLtFibJe7hATAjuodc-7gCHep5Ph93s
Message-ID: <CAGb2v67xpAbsmez2qt7pypW5T8czE93PtU2QjcSPuQ4a7c7qoA@mail.gmail.com>
Subject: Re: [PATCH v4 19/20] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	James Ogletree <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, 
	Ben Bright <ben.bright@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tim Harvey <tharvey@gateworks.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
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
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linux-rpi-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 6:56=E2=80=AFAM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
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
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MA=
X77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Reviewed-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> # =
max7360
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
>  drivers/mfd/88pm860x-core.c    |  4 ++--
>  drivers/mfd/ab8500-sysctrl.c   |  4 ++--
>  drivers/mfd/ac100.c            |  2 +-
>  drivers/mfd/act8945a.c         |  4 ++--
>  drivers/mfd/altera-a10sr.c     |  2 +-
>  drivers/mfd/altera-sysmgr.c    |  2 +-
>  drivers/mfd/arizona-i2c.c      |  2 +-
>  drivers/mfd/arizona-spi.c      |  2 +-
>  drivers/mfd/as3711.c           |  4 ++--
>  drivers/mfd/as3722.c           |  4 ++--
>  drivers/mfd/atmel-hlcdc.c      |  2 +-
>  drivers/mfd/atmel-smc.c        |  2 +-


>  drivers/mfd/axp20x-i2c.c       |  2 +-
>  drivers/mfd/axp20x-rsb.c       |  2 +-

Acked-by: Chen-Yu Tsai <wens@kernel.org> # axp20x
