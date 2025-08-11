Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7362EB5C3;
	Mon, 11 Aug 2025 15:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927165; cv=none; b=NPy5Dga7ti4ffU8IhMfsechhsWgowtmungyEpVwZtlk7xYvHmN2r5QbEINpTk9dwslRxXqYJpjEn8MmEmS+aIV7dhUTUJetYDCuBwI1emYMmWntUr/Acij5Ujs65Ih+en5kmIH7IL7HZ3Z8ScoZmfRUFrlPO8Ml1yHdKUCZtsT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927165; c=relaxed/simple;
	bh=Q77wqwAbcHR9HUwTxUgg9jG4ex1oX2nizpAbF8eii58=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TPJbn1XtvWFDfVnO0v59YJkksTNFs2Yb62B5wjtNldyvdltWKbvtS6YkxMNIL+NijBaFYCtt+g3baSzwhivKHA4yqsIl4ZwZq+zt+EHShjYLf0KveUTEJVbLTNVG0q4JNl5DelpJZoAl9+lglmYYgjVSCrwJsvNAXlVzE0ge5Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAZ7AdWV; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAZ7AdWV"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6180b9e4e74so4216452a12.2;
        Mon, 11 Aug 2025 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927162; x=1755531962; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0XIy5fUomSBPaFsng7WEyeMEK8C2loF9IYDTwEHeIQg=;
        b=BAZ7AdWVRCrHIBFbaFeuY5ehdwIIltag1hX9X+45Uz7w3De+XX1rwLDanNzBfp4RLt
         I0yizgOb7t30KzpEEmQyCNuwRlIoYzYaFZPY8nn9K+EK4cQz3wzhFAHCrAhr6NcsOh6g
         ud1bJbFtIhJVBNQOCy2DHJaVxR9ic63eypFQ25LvWB1WBZGBj453kuM79QKYtokfB6c3
         uXewoZDmS9cYeG1y4Obq2IhcCvoBl0WpMO/IE8HHfHnFENrbWcdcMoRu00iMMjKYPMsv
         1m7NoHLoLFgOQ60a8Hn3kj+ueEqCIGLGjGiUGuxdrb50kP1KFYIcYuMrCi9Xkcl+K2i9
         7cQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927162; x=1755531962;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XIy5fUomSBPaFsng7WEyeMEK8C2loF9IYDTwEHeIQg=;
        b=p/Kkzz6OR5ncWJYzNNyqOn548CUgEXBCgS/MK1xfNEOD4GnOsGiczFMqtlonZQLh4a
         X9wy/Jk0zAMinU+sn5PpjXJZ+GCuMlEd5g9xqGB8HesjzCymIFjRmWLOXCXcGY1uqAJT
         z8vxa0RLBI1Pg7Ow9ezvVTV6CTX6pMgcWtqIglsRN+KfU/W1VR40fyrnJzM0R8q2gq+1
         WIKdIO4ukVUVxT/hhg2LQeSa2og1krFUgdJooHa2rj42Ea266ptRwQ4WHFx7kmJjTu7C
         R8cKwJaT469LRCNdoGcKmnvAOjDHbMc1le2kvjWPbh9KBNN2yru2ipbVfMyjBNaKaof5
         GuGA==
X-Forwarded-Encrypted: i=1; AJvYcCVZu5gMNa2uu0MhnUEKlR45PoDIOv207PcoxHkSRXUR4KQgZjVHcJkTK8j5212JgxJQZtoIzhliIcw=@lists.linux.dev, AJvYcCWEcsVsyFvQ7+FYj171WY6KGPkEstQH4szZdCl+mJgmSzw/8++3XKwja87cepTwg/8mTKCS@lists.linux.dev, AJvYcCX8AMxzgrthvdC+m+GDmof0KjozA1oriyL5In7DHlHAdopKJGUZy8G9Qv/+j8a9qUC0mhHtng==@lists.linux.dev, AJvYcCXHS8a64xzYmJcWeAL4BieAVWbWfcjVHpm2MhtqPlKQtDNKNs5PmAxPvABGfy6xod1ErqTX@lists.linux.dev, AJvYcCXfxl4NVvJg4G2bPo+RRprMoSgd0a1R7xKgdyIlGp3fsBCqLYGQRlndSYVAFtq87N6Wl2lt7HWr@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9gydb+tshOsbs7u5yUEGTJJVxhY5eRagXrIBzkCWC9JcJI5lm
	3WYzLCzD8eNr/Zl6whWid6LgSqV2+Nqzanjo7Jqbv1qUdKDotH3OAe/0
X-Gm-Gg: ASbGncuGoIkWnd2eSC05sl406qR3/Jwq2DZvKZpqeoVUERfZP5abR1um3sLE5GZBd/X
	NHXTjT0q/8zKPGmHuUUezcqb7TRIk20lxCXR5O6srdp/iIi1z3pMK3rQB1GGETAL8I28d348LYU
	+/L3raGkreyDc4jYntq3ky12dGqXG7ENTQdkMxsA7Z4HndTG3sNnItm6nrPUUsHrm9MuQeJXdeo
	pr9NI0z2dGorbJtXtwX0RIGRc2cKXqDxuLV5ri05DmDqeIaxmH3UoZCuYYiQEREvVDnNbwmwA/+
	ZyYNyp/82prUD4MudUga6xDS5OKZGwWNvlwf8/RB4RPhkciOljFVbVhuYbgbCow8UEwmJ2ShX+P
	OhEdracaTbz3UYsItCpa6VJFoIosjZdDGpw4hGaU=
X-Google-Smtp-Source: AGHT+IGKOhTznscGhTdRt3W/yuNZg42+gjVjgTXKMoiUalIdY18fOpSzUHq5EIPnFUdAaOuOrYQZJA==
X-Received: by 2002:a05:6402:2106:b0:615:5353:5e2c with SMTP id 4fb4d7f45d1cf-617e2e5311dmr11886624a12.19.1754927161809;
        Mon, 11 Aug 2025 08:46:01 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f25739sm18957452a12.21.2025.08.11.08.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:46:01 -0700 (PDT)
Message-ID: <9379f132e52c972b2735cad768242cb784b0ed2b.camel@gmail.com>
Subject: Re: [PATCH 048/114] clk: sophgo: sg2042-clkgen: convert from
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
Date: Mon, 11 Aug 2025 17:45:57 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
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
> ---
> =C2=A0drivers/clk/sophgo/clk-sg2042-clkgen.c | 17 +++++++++--------
> =C2=A01 file changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/=
clk-sg2042-clkgen.c
> index 9e61288d34f3757315702c355f2669577b29676f..1d3b1656bcf2e6655e0299e68=
ab39f32189744dc 100644
> --- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
> +++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> @@ -176,9 +176,8 @@ static unsigned long sg2042_clk_divider_recalc_rate(s=
truct clk_hw *hw,
> =C2=A0	return ret_rate;
> =C2=A0}
> =C2=A0
> -static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
> -					=C2=A0 unsigned long rate,
> -					=C2=A0 unsigned long *prate)
> +static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_rate_request *req)
> =C2=A0{
> =C2=A0	struct sg2042_divider_clock *divider =3D to_sg2042_clk_divider(hw)=
;
> =C2=A0	unsigned long ret_rate;
> @@ -192,15 +191,17 @@ static long sg2042_clk_divider_round_rate(struct cl=
k_hw *hw,
> =C2=A0			bestdiv =3D readl(divider->reg) >> divider->shift;
> =C2=A0			bestdiv &=3D clk_div_mask(divider->width);
> =C2=A0		}
> -		ret_rate =3D DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
> +		ret_rate =3D DIV_ROUND_UP_ULL((u64)*&req->best_parent_rate, bestdiv);
                                                 ^^
May "*&" be redundand?


> =C2=A0	} else {
> -		ret_rate =3D divider_round_rate(hw, rate, prate, NULL,
> +		ret_rate =3D divider_round_rate(hw, req->rate, &req->best_parent_rate,=
 NULL,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 divider->width, divider->div_fl=
ags);
> =C2=A0	}
> =C2=A0
> =C2=A0	pr_debug("--> %s: divider_round_rate: val =3D %ld\n",
> =C2=A0		 clk_hw_get_name(hw), ret_rate);
> -	return ret_rate;
> +	req->rate =3D ret_rate;
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
> @@ -258,13 +259,13 @@ static int sg2042_clk_divider_set_rate(struct clk_h=
w *hw,
> =C2=A0
> =C2=A0static const struct clk_ops sg2042_clk_divider_ops =3D {
> =C2=A0	.recalc_rate =3D sg2042_clk_divider_recalc_rate,
> -	.round_rate =3D sg2042_clk_divider_round_rate,
> +	.determine_rate =3D sg2042_clk_divider_determine_rate,
> =C2=A0	.set_rate =3D sg2042_clk_divider_set_rate,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct clk_ops sg2042_clk_divider_ro_ops =3D {
> =C2=A0	.recalc_rate =3D sg2042_clk_divider_recalc_rate,
> -	.round_rate =3D sg2042_clk_divider_round_rate,
> +	.determine_rate =3D sg2042_clk_divider_determine_rate,
> =C2=A0};

--=20
Alexander Sverdlin.
