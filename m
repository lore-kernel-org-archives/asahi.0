Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30604071F5
	for <asahi@lists.linux.dev>; Fri, 10 Jul 2026 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679304; cv=none; b=G/tsUD9iApBZLZpiFnsRdZKMAhApIfceTXq5ber79nIWRRl3vENBDNeTGUqg9f1gU3onMXaFtzOxdg9oA3PW33BKarqbCMqk5+U8xGl81HgM7hhG9EO52Yf0NZ66eSFDwIMZvln7BqCY++jd+O1pAs6CxL7g2CUuf59AyCWX7TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679304; c=relaxed/simple;
	bh=8Lu8OMpVPc16MxdZvSkmOEt9Lvt01fn1EVEQixIYHBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hutUPcGgIvuS0i7T+2XpKVI7e1Wp1Z4oHGp5cKdgQrm6WkcSI46R2SZvQBbBqJyRdhH+Ab/tRLuZQQWd/PfgI9lUKEaort4EXTaOdGLrZ+O5i+mposOh9amjZiKpCjGwTVsX7XrFd+FcRqNZ6iDaBe4S1imzdEPifb23AywZvIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-80d33d13a23so9663297b3.1
        for <asahi@lists.linux.dev>; Fri, 10 Jul 2026 03:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783679302; x=1784284102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsVN2cPDw+/JUxMMLcOD68aRVLlq59TmevfTz9ChQ+g=;
        b=kV0HUFKKc0gVMFATiVwzDGvNAyWzzBlQAgJHe5m+MdCo8A37m3+qvhAVyDisy7eCxE
         2waKJLf8p//6qjTuEUadpg/cUi0Sk4ivmYmC9LEKvITdm45SqAtD5KtkrngAERrwHroU
         YudukS4C3HV9uaTAB8FD0eWM9xhjGJblh1P13HSZDd7bEF9u56mV1Og55wWxR6lNpQK1
         s3D9Jr3sFU+oTAiotvK5k9qzIdQCtEbMWvpxWlAJzskuJrfB5zXitzZjCcp5cQ1Q311Y
         M/jlFupEEDpnJu1h9PinDSjsNI6joi9c46FYVoL+ayWwtC51Wbh+vNajJ61fafZqLlDM
         RbSA==
X-Forwarded-Encrypted: i=1; AHgh+RpQMO1VjMKHBAkvfwA07PY9hxav28uDp3uR8oVOssjpSNarhJ2YOe4fbzsdilMSqJokGeVcdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjlDU5JQlMFTIcqIuH6IjHE2krZNFwcIooyovxSvX785Tge+gq
	wpegjDi7hpi94P7octBiluwBi1GScN8PBTUeEKOcTwl55EDIbNWQQz6t1KT/fOWrZtQ=
X-Gm-Gg: AfdE7ckAgwIlI1uPuP9EUl5NBBM6T655DDcfoZ1ZfFVw5G9XfTpAKsnv4N6Lb0nz70A
	krTlVGuMawCYq4cE5XYqo1HVUBfrRkfuBcC5vG7c9GBaxpMmiuFU3+YJetKw6J642eOB2oDpPZL
	hBRhVM1yR95/X3Rop6O42Nzt1bI10CPXV4ElV/yP5a0O8/igFZNv0MF2zo0ohftBry0avKZ5dnd
	MsvZ6CYXE0EcXbXNl+DZ2JXh2sTkcrcyVMz1LFaOaGU2pK4sr+Etg9Vz+/PigFPZO50teuMkT4n
	wKJ36hriX8hBSs22SXJkaTvF6oWghkNwAS7dYqXF5lzwyv7U8nc6w1zeNZyPNLxhQLdV7YCGBA2
	MCOaRXo0LVsHR/xONbp+YUFODEq4ObnK8xOcON7h4G29Mgr2LOhyEoEQbP03Llt87h4b88KgaX3
	VV3VQbXfeqAC+bhWsGXKDPcmbz6O+WYilddHURtNdqcDa81NqZ4w==
X-Received: by 2002:a05:690c:2501:b0:80b:9114:3b85 with SMTP id 00721157ae682-81dba3eeeb2mr82073127b3.0.1783679301853;
        Fri, 10 Jul 2026 03:28:21 -0700 (PDT)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com. [74.125.224.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6bc4285asm42002367b3.0.2026.07.10.03.28.21
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:28:21 -0700 (PDT)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66771ded50aso1271636d50.1
        for <asahi@lists.linux.dev>; Fri, 10 Jul 2026 03:28:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoZ7QcrBFBvoIJTgVn4XBkuFXV79t1CT4tDAFM2JRQ3Aabo+uiGIwVX/u6lOdcb0YOYuh8/2A==@lists.linux.dev
X-Received: by 2002:a05:6102:3911:b0:726:e608:6658 with SMTP id
 ada2fe7eead31-744dff43a82mr6415934137.11.1783678885257; Fri, 10 Jul 2026
 03:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com> <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 12:21:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4Thb0en6jeD23KhDp4pTe2F8o5GcBx4fnB+JAxPG-bQ@mail.gmail.com>
X-Gm-Features: AUfX_mxlLApCIjqxIsg4l7Qhe6Rgf_3Xy6YCZC9GZlPPApUQFkmqIVPuBIh_jUI
Message-ID: <CAMuHMdW4Thb0en6jeD23KhDp4pTe2F8o5GcBx4fnB+JAxPG-bQ@mail.gmail.com>
Subject: Re: [PATCH v3 21/23] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
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
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Jul 2026 at 19:00, Uwe Kleine-K=C3=B6nig (The Capable Hub)
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
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MA=
X77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

>  drivers/mfd/rz-mtu3.c          |  2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
