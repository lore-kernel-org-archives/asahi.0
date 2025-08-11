Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7B329BD93;
	Mon, 11 Aug 2025 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927259; cv=none; b=AD2cWYx4oyaAqk6QylZurpm5xy/0iQzeVfd+6DSO+KB3IE6zcFR0OWKBgLfj11f1UIdRSbP3I4X080Qm99TK+bj10Fk4ik8Upsaq+58+3aWB82+H0yAwGx4qQpFgvmEaM3g86wESfd32FvrYsl9s8cvb2QTkKtnevwaFO6HRb0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927259; c=relaxed/simple;
	bh=HqZVUyZfVpIoagKLdA4Wnmr1ax/f/DpaIg2D3Ho4d+g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sF+6gHz4J7/KNYntEzIb6hPTBil4bjCYrSOHp22W4CzAulhDUojZ90J82nJpSm8HcvHabXOnAJPxGp+y4TbppnaSSKr62A4vUcTheL2rpoU9OGuCP7eVhL1qVCRF+iqn6AHLSFreN7viUnX2fRCLJnvwoWwSlPzhzfUcJtZAN2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsG2FR8b; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsG2FR8b"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-af93c3bac8fso641211166b.2;
        Mon, 11 Aug 2025 08:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927256; x=1755532056; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HepA4l2VLL2ahLpWoV8gVaUs9oZFV/xKVn3GOH58US4=;
        b=IsG2FR8bj1sCazrNSKwWporxefmsDHCuFd5qw/3bs5YuoP3U75uW4pYU6gylU3Abr/
         Ru2GkTwypHzDLlXyHvF3zPhEP3aHukut+AbgAecdNL2cEwrGy434jxwqJY0hNWbqrBar
         +hWSItdqSUCWo00qeuvWqLKUV+AJjORFxvuYwRn2DogjKL15D0dQ0BIYmm0TjtXUUwyE
         Eb5zAO5W1WekX8y90bwXyNzCSRb1h1N5ehjRZZyJwb0HoV8thnkGQsWItnXrNbFsksoZ
         1+Jl9QWRjSonWZ3zqbck1MXlVntzxIff5X+h8BydEZOCvfwh5egwuTK0WMScAklzvIeQ
         HS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927256; x=1755532056;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HepA4l2VLL2ahLpWoV8gVaUs9oZFV/xKVn3GOH58US4=;
        b=bTNwc5i2JAAtMctVchU59PJq3ZINeghoVpknEuR6/RQwqVpDfnfr7r6kMIWHtFJcBR
         F+dH4DGm/6tPv8LsMMOAl1qv5CcLz7DlT+aOq3ULDFy2BvynNm8wRUR/PvuVL8aEWg95
         lAnVSIbhyHibvpFf9h7oLabfthmGTn0tkq8c0TNy4e6mOlMthgrKcDAIwmsJBIcYv+Si
         qepwK2VMYJguJ7wHh8U1SQwRg5CZpplPAeJDB7fZoO9ytux+xjNmdWG7FSddPziX25yQ
         E+6OzNUnN120bw9j/SaY6YfYM60dTwR/KcxVJYvwUDjksgERNsmmpazB3CzOygQGNMRM
         DHNw==
X-Forwarded-Encrypted: i=1; AJvYcCUIjv1daByM8VnK686J9RIb1C07DnYVYYFiNuBV6R5PlR3eBD1ouEcNASMFoVUG0hYQqtFr@lists.linux.dev, AJvYcCWSYqHWS0nOpbJpIiKIDqavW+UEPCVlOWbruGBBJpbZWU5DCuBFNbu0am2EVa79iwU4FjaWsw==@lists.linux.dev, AJvYcCWXb/enJJZuEGssS0mgT6e8W7FeLxmyCGSr3rvPFm2FQcTq6uvxVwlH3/TxuE5clRQMA0i65K2a@lists.linux.dev, AJvYcCXaNERO5DjxN7Pl+xk8MMcmKHCcBHCBZHgmM3eRyM2wT7x9JH7eiHNrSGw1fVcXr8h2W5a0@lists.linux.dev, AJvYcCXfvEqXNkUgVcGiD4Pr7oSQteEQ+7hDhEYIF5WkNro1EcPXpja1qjna8DPbAcYNZHuLCfK3YEfRAGo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVD53Anaa/ljD/ecnh+78WMD5VC9/pLufAb3vXrd0F3lOFjc5x
	BakoOlUjSYEf08BHnpKO5u81e2FIZSDqoFY2plNYSASSapbRFS0wBQoL
X-Gm-Gg: ASbGncvb7+pFOp1hJG138M1sP1hyef5rwXH4rl0rArkVcw4RRBDg9BJS0r2K5ZdcUHK
	Bt2qVMkH1InIG+vDKhuIbHxme9+NlYi0pWaiZNGzYnld4q3YG2tSuEIdBXMOnRoYovFbf3v67sd
	FQypm/Hvg8VNENQRBt+fAuCj8ISXa/pcH10Cn1/VtcdHqKK4gt4vn+KZ65T3y8MGQT6Wf3IkQ0F
	k2+LSRXEVnfjZSZD9vCR6jpeWXjRbxqbhayseImRES5t9RcHHJlaBWCgrJUx/wPUlnv3U/i65bA
	DBoFSJM3mHAKxuDKKKq3DAntrkS8A73l3pbq7CWdmnGc/bpKz658IgsPDTJ8VBHr6EwCfpJA1Wq
	aADoWHUHj9xexQbLknHXtHoBx3rwJNGzeOdtI16A=
X-Google-Smtp-Source: AGHT+IF0QNexCp3wac3HqRrzYFcQwTmRLRgzyDHjNrtoHTrtc/DjgfXz7LJ4ALK6NtSRdUvSvS+HtQ==
X-Received: by 2002:a17:906:9f91:b0:af9:7823:620b with SMTP id a640c23a62f3a-af9c6517c2cmr1234169966b.44.1754927255767;
        Mon, 11 Aug 2025 08:47:35 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a076409sm2048822966b.12.2025.08.11.08.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:47:35 -0700 (PDT)
Message-ID: <597d4a777a13c2b67effaf5ba32959710d2f58f8.camel@gmail.com>
Subject: Re: [PATCH 047/114] clk: sophgo: cv18xx-ip: convert from
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
Date: Mon, 11 Aug 2025 17:47:31 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-47-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-47-b3bf97b038dc@redhat.com>
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
> =C2=A0drivers/clk/sophgo/clk-cv18xx-ip.c | 10 ++++++----
> =C2=A01 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/sophgo/clk-cv18xx-ip.c b/drivers/clk/sophgo/clk-=
cv18xx-ip.c
> index b186e64d4813e2701b17520e544c453fc13d0e77..c2b58faf0938b7d537dc3a81a=
ef59c549b9c9c79 100644
> --- a/drivers/clk/sophgo/clk-cv18xx-ip.c
> +++ b/drivers/clk/sophgo/clk-cv18xx-ip.c
> @@ -45,10 +45,12 @@ static unsigned long gate_recalc_rate(struct clk_hw *=
hw,
> =C2=A0	return parent_rate;
> =C2=A0}
> =C2=A0
> -static long gate_round_rate(struct clk_hw *hw, unsigned long rate,
> -			=C2=A0=C2=A0=C2=A0 unsigned long *parent_rate)
> +static int gate_determine_rate(struct clk_hw *hw,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_rate_request *req)
> =C2=A0{
> -	return *parent_rate;
> +	req->rate =3D req->best_parent_rate;
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int gate_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -63,7 +65,7 @@ const struct clk_ops cv1800_clk_gate_ops =3D {
> =C2=A0	.is_enabled =3D gate_is_enabled,
> =C2=A0
> =C2=A0	.recalc_rate =3D gate_recalc_rate,
> -	.round_rate =3D gate_round_rate,
> +	.determine_rate =3D gate_determine_rate,
> =C2=A0	.set_rate =3D gate_set_rate,
> =C2=A0};

--=20
Alexander Sverdlin.
