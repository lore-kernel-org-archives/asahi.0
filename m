Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929BB2DFF13;
	Mon, 11 Aug 2025 15:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927454; cv=none; b=N97BbXKGFtfUCMW5F5BfYwqbvehJT7zOEaRTJ/6TGM/Wn7MXFGk8Wh4ATOIY12S2CGUfA7+JJJ8vbPJwkxawISqXIr4eJmWEkRSOlhN7BIkEkOEEY3QDD9NQX+TilZ6fgA+xzc18Oi2h2A+vXbTmm5OWeon87kSZeH9sy2Fdboc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927454; c=relaxed/simple;
	bh=3MrMePu5qHYOOUklAMogGuKMAutTQLNLRBh4z2IBUxA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qIu4TNU3S1ZoRNx0JjS/ft7K15LYR9L2JqIIOIUQAriwAx7i1m/v0V6w8Sz3/XEC6jj5KJ93mfrPl9t+c0UFOB7HCrkmf7zBKzp1wrSHwq/45dkuu8kMCsrV8auAG3pn93/kGP/+wYtttEAF6oG+iZ2OI1VC+cGvPEsNKo/xpqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTbeJVgF; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTbeJVgF"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61592ff5df8so5685396a12.1;
        Mon, 11 Aug 2025 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927451; x=1755532251; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gtZQ94WBszTISCSHtIKTauM3dit5VcpLWsofgTPpah4=;
        b=PTbeJVgFHH+NhzGw/wUyql6XCjLnBv8ooGsNiuo3Dbs0WdBGQ613kzq/5NP7ZPHXUr
         FQ+5J42RaeJh+PAn62Er8Jpxj0cNc3u6PVY0cN+M0jtHOYH/fz/s3Vftso+zyx0dW3qC
         3KVegKIeX7TIAcVImwXhHvUFsGv2pjDd50hCF+//dfDFWla/Pqbb2K8clRvtNvNfMH3R
         MoSAwhbDMIDEmf5uOdt15G6Chu0KjFfDb+W/M9hSGojzdOYTNQSgWTEkDt6VhguP9eF9
         O9tleSmPflB3qrAV/SSqXOFs6gcnZwgToqLttpXN1IsqoGnf+4tyNdkbvZtGQw65tND/
         7Mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927451; x=1755532251;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtZQ94WBszTISCSHtIKTauM3dit5VcpLWsofgTPpah4=;
        b=f9EMKRuBga2g1bWD9rTlRYJOUBbtyMvFmteqasJF1XDAqg1u/C/O7zIGvsJhyFvxvk
         YUCNA/Ta5IcAoamR+U5UUDqBBi6eKqB5ozPIXcSiYKRtdU82IDIcFOtIcszWZ1V3IWfl
         /KeRofFtLPUOOv3Nh9xwxJyr06KvaSTl3c1RgCYcMFRvkBD9/T+KYDo4qP708tFYlsWW
         5MhpOA06uySdvEF4LkOd0YKTOjvc1QUT6DiFKchyW5qRJ5xVtxLQcSTxuJgfpWtW79Hx
         dMfC32cpGf7g/rcW8cV6pFqdtcuKyImSoDDeMWQXUBt7s0ecUFoF5VrxQ8rFmKL3COz4
         gP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+2sIJWiqTNMzBcsv/Ix7+FVT0NdiXnbuKXvrXUQTYuiBr+EJ5w4JGZ6ylxVyxmEaOpABS@lists.linux.dev, AJvYcCUf1r+UhH0OkhTYXKAB+ArRPpL2EXE0DF1lqBXOxnp/wAMlWjiUju/lcf8N7VrlIDIAQ8Kf@lists.linux.dev, AJvYcCUsTBeqNZPy83FSXH1mA90uXJv4ZqiJhg2AkxHlOgOstos4kRgxpeM4ayS2UdijEymOMkMm596VUfM=@lists.linux.dev, AJvYcCVW2E9V/z5CD4KskYWQXbc8mS2GzvMN5iAS1AELOoG095bwr+wMMZm/Y1xJl871TDNmIQv2rQ==@lists.linux.dev, AJvYcCVkFAf7v/BJROuhysgfCchb90aomN5ndEtBRW4nTQ4Er//BIaVnamW9EJjev0jPiM451/FY8alj@lists.linux.dev
X-Gm-Message-State: AOJu0YxvX26cLMiCeSYNovwNRKa2VTokSgIjHZIVU5rH05tlmFNwWinG
	6FdqPKueCPJykEA9/FKKKm+Od71YBIQUyDAMMbov54ABBehu3pxoSeWk
X-Gm-Gg: ASbGncuqmSvJaw24rnhxzntbwlKadICNxha+Hk9ni36+eVG1x2ExzcFXNFMSUQVm8ZP
	UnZ3zktiuE9sFgYhcsPDPDyEl+5n1MiUm0HyqPCN5vaze+Nyei00VD3IVLqtQF6WGSP9hdTP+CS
	SpRFY+1OXLxW8zmsLNwmhj3U94pkyVA+XNHiHWwX408+5E8fm1Uf+Nu3zqt53jxCLFaTR+F3p8y
	p6QrDx5Q0xgcz4U0HQhKIx9C+OLhWO0hhbtApKjjUzhldxfU7a+rAwLQGHndPXrBShyAISyp5Wt
	s8x68wehdt7X7KgegolnoUXBvA/14Ox5ecdO5BArO3hdHIyhc+xIx3TJKjTXDjBKosDc02D5q1D
	TtJsyiau12LTlIJk/eVIyu9jSs3qi+jdsuItgQeIYKrVXfE2QFg==
X-Google-Smtp-Source: AGHT+IHe8ajBJUyXwu1jxvqnFBotZVZqGKDHQgYwFn+fyltnooA7uDIcyyMAL7hOfbd71etw3G4PSg==
X-Received: by 2002:a05:6402:26c2:b0:618:3a61:b1c with SMTP id 4fb4d7f45d1cf-6183a610b1fmr2169187a12.31.1754927450586;
        Mon, 11 Aug 2025 08:50:50 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f000c3sm18680418a12.4.2025.08.11.08.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:50:50 -0700 (PDT)
Message-ID: <d3b0ae61d0bb5dc4e115ace27e1672444ae90d83.camel@gmail.com>
Subject: Re: [PATCH 014/114] clk: ep93xx: convert from round_rate() to
 determine_rate()
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
Date: Mon, 11 Aug 2025 17:50:46 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-14-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-14-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2025-08-11 at 11:18 -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>=20
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/clk/clk-ep93xx.c | 18 ++++++++++--------
> =C2=A01 file changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/clk/clk-ep93xx.c b/drivers/clk/clk-ep93xx.c
> index 4bd8d6ecf6a2bde26287e4e949b062a5660139e6..b081ef920e250dd99134af684=
5c443ee11266da8 100644
> --- a/drivers/clk/clk-ep93xx.c
> +++ b/drivers/clk/clk-ep93xx.c
> @@ -389,23 +389,25 @@ static unsigned long ep93xx_div_recalc_rate(struct =
clk_hw *hw,
> =C2=A0	return DIV_ROUND_CLOSEST(parent_rate, clk->div[index]);
> =C2=A0}
> =C2=A0
> -static long ep93xx_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -				=C2=A0=C2=A0 unsigned long *parent_rate)
> +static int ep93xx_div_determine_rate(struct clk_hw *hw,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_rate_request *req)
> =C2=A0{
> =C2=A0	struct ep93xx_clk *clk =3D ep93xx_clk_from(hw);
> =C2=A0	unsigned long best =3D 0, now;
> =C2=A0	unsigned int i;
> =C2=A0
> =C2=A0	for (i =3D 0; i < clk->num_div; i++) {
> -		if ((rate * clk->div[i]) =3D=3D *parent_rate)
> -			return rate;
> +		if (req->rate * clk->div[i] =3D=3D req->best_parent_rate)
> +			return 0;
> =C2=A0
> -		now =3D DIV_ROUND_CLOSEST(*parent_rate, clk->div[i]);
> -		if (!best || is_best(rate, now, best))
> +		now =3D DIV_ROUND_CLOSEST(req->best_parent_rate, clk->div[i]);
> +		if (!best || is_best(req->rate, now, best))
> =C2=A0			best =3D now;
> =C2=A0	}
> =C2=A0
> -	return best;
> +	req->rate =3D best;
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int ep93xx_div_set_rate(struct clk_hw *hw, unsigned long rat=
e,
> @@ -437,7 +439,7 @@ static const struct clk_ops ep93xx_div_ops =3D {
> =C2=A0	.disable =3D ep93xx_clk_disable,
> =C2=A0	.is_enabled =3D ep93xx_clk_is_enabled,
> =C2=A0	.recalc_rate =3D ep93xx_div_recalc_rate,
> -	.round_rate =3D ep93xx_div_round_rate,
> +	.determine_rate =3D ep93xx_div_determine_rate,
> =C2=A0	.set_rate =3D ep93xx_div_set_rate,
> =C2=A0};

--=20
Alexander Sverdlin.
