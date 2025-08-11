Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E508D29E111;
	Mon, 11 Aug 2025 16:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754928056; cv=none; b=e5VaX/Az8J10cYGt7+2DEoeYkRs6SkXXZyyB8ARmEucSpmKhVUVXiLWYlIV5kxtw4cbsoeS+gKJI6W/y7jLbm8IuW2MvtYJY4H58YG5pNKc9GgrFh8TcexT36onxZo5ExcRn7t6nNU2FHy0g56Z9TeQMvE+3kMNb6BIL5XpQoLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754928056; c=relaxed/simple;
	bh=c4dnBdft5abWpi6v7xsGcdHktYX5OXpwZTFm+IlP2U8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gPICEyF6aAesto2kmgHctqcRl7mntZ1NiJiNsh2SMBgUViUWczRnpN4JthEXmEWrLVfaZzX9QNeVnUfjUoYM8OOCpvNxrFHv+T8f2LSLYSsU0iM6DbJbVqyflFWpTAYYvmzvw4SPUGjkgfc/ebk/lUq7JoazIRI3kMLbVete648=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+PPFEU2; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+PPFEU2"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-af910372ab3so940248766b.1;
        Mon, 11 Aug 2025 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754928051; x=1755532851; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cmIrlL5AjQp5OrtEkcw9eDi4LGiI7a6CtQnHd0I7Fpk=;
        b=U+PPFEU22EVWSWUSR18X/sl1QyWbww4zfLYm68Nu+GpIAg12s8Ah+ZBDSs8Wj5uzt+
         4jMAq6wtksVdLmCxjslJkQVVSGNJpD+PrZPa8b4AhEnbu79JaNxMl0axL6/y4pg+1/2I
         bisNHobfOXnwPg6f0DBvFOdbfXwSzmm0lPJoI3sKnNGnNsoEQdhli+ROyRh1lF45Wvy8
         HCXzYL4H9SH1xQuXuHtquYGJ/cznZgq/vK409SuYoXO6LysBcPl+/DXR3sNBhG99+0S8
         wAb99BObUduyTfTMkBmahUryoYkh6QvUdNYBV9siDFHmzPHZeqOby/6ILRKluYRyHbdE
         09/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754928051; x=1755532851;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cmIrlL5AjQp5OrtEkcw9eDi4LGiI7a6CtQnHd0I7Fpk=;
        b=dYq5j3nga+w3K+eQC5wuI2TC5SaZTAOtnGe/6r61sYgse5Y/qm8+YfU041wU1BfqWD
         98d/Z4lY1d9BQoApBxAj4x7bdPsN5r5JujEqRosJRc2fMceo2lpj1nUS3gMGAdYGCR9s
         n/+6cw/T/QZOV4psh37XNQk3I+YB+BprK0/3CONzeeONYZW2zH6CX4W7Rr7enpBzE24u
         67XaheaRje09jNXDpuqyM0uLyK8YF6E/NjxSpV5Z+cgQUFIqMxfb3h/dw3eemVIagRbq
         egpx2wszk3w39i0Cf99mjjuVrRcZV1HxH4hQizbLT5d2occ0GVtHHvZbnGwYzQ7cIPUG
         xDoA==
X-Forwarded-Encrypted: i=1; AJvYcCU0mGc8CgnnJDGl/4rY9cLLEh+pxIv+us2cMnldPntR8LP27LbT3zLd1R32ZI7WEXN66jO4E6zd@lists.linux.dev, AJvYcCVFGwLOopGrJ0ybu6M0AWET23YmNwNXqJ9Yzx2nzGBvEUYDQ1fl69tFoLedks7ZwXh+XT0Y@lists.linux.dev, AJvYcCX/TLTZ+7hw+iTTkkPogdHfwNTgAzoOLp5dOEXzqijz7nFQJBHRRJba/sXERQEiTbW8dCHe6rZfvC8=@lists.linux.dev, AJvYcCXM3vxiI0ULg9L4GAnVyMZDKnre0HNhqTuKahmesco2ntfNlq3qIDsNoIt4U2uW5TiTszjR@lists.linux.dev, AJvYcCXcXyDEcN6FQMNhLm7C0ebJL+Kdx3Pc3TcKw18lInRMjDmnVwSe8t9cwpJSsGM1LHPeT7aGUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg/GJXMOTpWyc9g6FeykO0LfLV38q5YyC+YuD0MBgGPis/MKoS
	fAsDTyegvi+YR/KmVeqenz8PFg85OAIjD0sqmKV+JOMp1Dr5Haa9wHIX
X-Gm-Gg: ASbGncsR16Rhp5HNSdwPOZlJNNzrUBQGpW0MIR2q9CtUwmVYg7BuJnT87ineXl256t/
	3Nqg38FCax/MjFZ0JzNqOAPqoZzTSjJgxbnLKSxHrYhlTv8oRBIJ3L3QAaXwbbpepI7Md0Ptui9
	jnlHzGQ9v2fK+pFz6ijZqG0rDV7jMOkEBe3CgmXlsbLbUlMM0vFrdHigEh/90V1begmfI32LyC2
	XCSiiZfjBZSGeEjaL35WPK6gOObS6DRbDet8WsSIC1sunh3In26XEfcS6kjBLfbLj3VX6toVkhQ
	HCX9D5XQVOzz0PEa19bUszhz9ZUpaRbLZ11w9SGkevnmflzzPkfA9Ttu9wfqtWRgVwiiYVF74QX
	pQC/KTZFxF4pfzl5qIbbR4ekRm2pbiABFN9wmspnYPzx34cIMUw==
X-Google-Smtp-Source: AGHT+IGh6yl4CupkZ+bbkqrg8mnCZBWOoNaEnJApexkC1cSCi5mW8bJYL756B85cuxjEowuHPJgNRQ==
X-Received: by 2002:a17:907:9486:b0:af2:31a9:c981 with SMTP id a640c23a62f3a-afa1d7233bdmr11410366b.23.1754928050948;
        Mon, 11 Aug 2025 09:00:50 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a07643asm2049410666b.15.2025.08.11.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 09:00:50 -0700 (PDT)
Message-ID: <c7f1fb05a6b7703ab18770bb5b58af0c58154f1f.camel@gmail.com>
Subject: Re: [PATCH 002/114] clk: at91: peripheral: convert from
 round_rate() to determine_rate()
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Cristian
 Marussi	 <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto	 <inochiama@gmail.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil	 <paul@crapouillou.net>, Keguang Zhang
 <keguang.zhang@gmail.com>, Taichi Sugaya	 <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>,  Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jacky Huang	
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Vladimir
 Zapolskiy	 <vz@mleia.com>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan	 <dlan@gentoo.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon	
 <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Orson Zhai	
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue	 <alexandre.torgue@foss.st.com>, Michal Simek
 <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, Andreas
 =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,  Manivannan Sadhasivam	
 <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau
 <j@jannau.net>,  Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa
 <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,  Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>,  Romain Perier <romain.perier@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement	
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth	
 <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner
 <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>,  Krzysztof
 Kozlowski	 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi	 <cw00.choi@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Qin Jian	 <qinjian@cqplus1.com>, Viresh Kumar
 <vireshk@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Alex Helms	 <alexander.helms.jy@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>,  Liviu Dudau
 <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Nobuhiro
 Iwamatsu	 <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Date: Mon, 11 Aug 2025 18:00:47 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-2-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-2-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2025-08-11 at 11:17 -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>=20
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> This driver already has a clk_sam9x5_peripheral_determine_rate()
> implementation, however it can change the parent rate. The existing
> round rate does not have this functionality. I could add a check
> for CLK_SET_RATE_PARENT, and combine the two functions, however there
> are some other minor differences in the two implementations. I don't
> have access to this particular hardware. I believe that they could
> be combined, however it would need to be tested on real hardware.
> So, let's play it safe and convert the existing round rate
> implementation to ensure that the driver keeps the same functionality
> as before.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/clk/at91/clk-peripheral.c | 41 +++++++++++++++++++++++-----=
-----------
> =C2=A01 file changed, 24 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-per=
ipheral.c
> index 629f050a855aaebfd1a03ff87c2b016cd2284a5a..e700f40fd87f9327365f25036=
6f7f7bde01f5987 100644
> --- a/drivers/clk/at91/clk-peripheral.c
> +++ b/drivers/clk/at91/clk-peripheral.c
> @@ -335,50 +335,57 @@ static int clk_sam9x5_peripheral_determine_rate(str=
uct clk_hw *hw,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static long clk_sam9x5_peripheral_round_rate(struct clk_hw *hw,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long rate,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *parent_rate)
> +static int clk_sam9x5_peripheral_no_parent_determine_rate(struct clk_hw =
*hw,
> +							=C2=A0 struct clk_rate_request *req)
> =C2=A0{
> =C2=A0	int shift =3D 0;
> =C2=A0	unsigned long best_rate;
> =C2=A0	unsigned long best_diff;
> -	unsigned long cur_rate =3D *parent_rate;
> +	unsigned long cur_rate =3D req->best_parent_rate;
> =C2=A0	unsigned long cur_diff;
> =C2=A0	struct clk_sam9x5_peripheral *periph =3D to_clk_sam9x5_peripheral(=
hw);
> =C2=A0
> -	if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max)
> -		return *parent_rate;
> +	if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max) {
> +		req->rate =3D req->best_parent_rate;
> +
> +		return 0;
> +	}
> =C2=A0
> =C2=A0	if (periph->range.max) {
> =C2=A0		for (; shift <=3D PERIPHERAL_MAX_SHIFT; shift++) {
> -			cur_rate =3D *parent_rate >> shift;
> +			cur_rate =3D req->best_parent_rate >> shift;
> =C2=A0			if (cur_rate <=3D periph->range.max)
> =C2=A0				break;
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	if (rate >=3D cur_rate)
> -		return cur_rate;
> +	if (req->rate >=3D cur_rate) {
> +		req->rate =3D cur_rate;
> +
> +		return 0;
> +	}
> =C2=A0
> -	best_diff =3D cur_rate - rate;
> +	best_diff =3D cur_rate - req->rate;
> =C2=A0	best_rate =3D cur_rate;
> =C2=A0	for (; shift <=3D PERIPHERAL_MAX_SHIFT; shift++) {
> -		cur_rate =3D *parent_rate >> shift;
> -		if (cur_rate < rate)
> -			cur_diff =3D rate - cur_rate;
> +		cur_rate =3D req->best_parent_rate >> shift;
> +		if (cur_rate < req->rate)
> +			cur_diff =3D req->rate - cur_rate;
> =C2=A0		else
> -			cur_diff =3D cur_rate - rate;
> +			cur_diff =3D cur_rate - req->rate;
> =C2=A0
> =C2=A0		if (cur_diff < best_diff) {
> =C2=A0			best_diff =3D cur_diff;
> =C2=A0			best_rate =3D cur_rate;
> =C2=A0		}
> =C2=A0
> -		if (!best_diff || cur_rate < rate)
> +		if (!best_diff || cur_rate < req->rate)
> =C2=A0			break;
> =C2=A0	}
> =C2=A0
> -	return best_rate;
> +	req->rate =3D best_rate;
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int clk_sam9x5_peripheral_set_rate(struct clk_hw *hw,
> @@ -430,7 +437,7 @@ static const struct clk_ops sam9x5_peripheral_ops =3D=
 {
> =C2=A0	.disable =3D clk_sam9x5_peripheral_disable,
> =C2=A0	.is_enabled =3D clk_sam9x5_peripheral_is_enabled,
> =C2=A0	.recalc_rate =3D clk_sam9x5_peripheral_recalc_rate,
> -	.round_rate =3D clk_sam9x5_peripheral_round_rate,
> +	.determine_rate =3D clk_sam9x5_peripheral_no_parent_determine_rate,
> =C2=A0	.set_rate =3D clk_sam9x5_peripheral_set_rate,
> =C2=A0	.save_context =3D clk_sam9x5_peripheral_save_context,
> =C2=A0	.restore_context =3D clk_sam9x5_peripheral_restore_context,

--=20
Alexander Sverdlin.
