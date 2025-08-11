Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3952C2E3B08;
	Mon, 11 Aug 2025 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927969; cv=none; b=NA5Q2v+lAsBVK7Ic5t19+H4r2Xr6uRJPsrXHqCMsItchgC9ay09oUdw202L8K6XOJRNFF9BIw7r13oA8QQpGJwf5aTeLx0pIC8MfeZ0LV4uLQtQMVZKtfq7ovo6CdiYdZU8l72ZqK/X6KxvFn6J+QmWSSA4z/P8H+G1BSAhe86s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927969; c=relaxed/simple;
	bh=1ZjtfZm6gzHoBq7YwuEyZk4iDxQ70a64CmZy/OoszSI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iz82LT9lQRJ1/KmPtuxlCF3WbmYpUoWPNL9Mq9hbhSg1lHqqho4sF8KZYuY6uf13OoNxvRC7SF+q/taNFyHF/ebLEGiNUFHelb/omv0gRoW84vgTeHop9EAX+rZ4C07haY7iRrCTtB6iFQSOCHNHCMI9OCB1CQPudh0TKIaZeNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqDRTHqJ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqDRTHqJ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6155e75a9acso7117213a12.0;
        Mon, 11 Aug 2025 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927966; x=1755532766; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TvyCEuzC+XGQIfI6+Ojs1caIw/9527DVynHbE5eSZOc=;
        b=ZqDRTHqJuAlBohnxJ6oM+wYZ48qQ3QmuA74FCY+cxbA+hMYLcwG6yHvhJBV+sM1KZ7
         DRtDADszA37As2945uLTYRG92K7aL/jzbzHlPfaOJXYEtLUeSCELjn3l/xDPUDpCHaW0
         ao9OzbMANMbphvPE25IST84urmc1l9xKk/geIjkUi7vW4yUjMoXpjPFfFLZAj/lgnx8k
         YZImnPY4H2X2pHxtYrE0BX0KqFh8W1snn+0j1mWbSi/z2FcZzKcEPPkvjS/JfobCdzbb
         V6IRtIWz1mQUG19ZDcl6Kc2QlXDB1w7wheLxPiHYzmMrhcjIc7+EPPgOcTGfl+E140m3
         Nk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927966; x=1755532766;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvyCEuzC+XGQIfI6+Ojs1caIw/9527DVynHbE5eSZOc=;
        b=E3wuDc8xe58iwfLBWHPMhfP9Q507/bPhu+byipTOldsEXkE1uceyPnTysd33QExgRM
         2mo7K2hFCz3w4WveIJq/9dvH5fFt6hlHjkMOlYCGncjnIlK1V1NAXfD7RtqzMVNhynBi
         EvTgXy4Znqht1v0+57S6gZRIABBREsUNind2bFF0+6WU/IqlQsuKF3Ybc1hrPWvPk5yy
         HVWHHjjX4XlW/bX5LRQQKJlWiNDfKEIWeSPjECRqLjmiMyC1m/6eX2gGU+7i3ZrPT36H
         Deo24O81PbnBKeeJeiMCPKw8ZXMOzhwuPQ+4Gcptp7U8NvmCzXR/IL8FZiTnJ1OV17Gv
         hduA==
X-Forwarded-Encrypted: i=1; AJvYcCV8x6/1vkzHkgH8HkfTJ0CguM3czR4+3P9wzpbjiUwc6yO4DvBqWc6mU5BC+0scSjuAT8IO@lists.linux.dev, AJvYcCVY84fZbnOlCMme+EwDVDXtlFqjnuJNuzYjlF+PnY2i4LD2ZFwV5G5qdulawcHOGLoGMeJ9kA==@lists.linux.dev, AJvYcCVwzLza1HO1dAzuYSoZEJgwSc0iD1m6s9s7+V6kC4WDwswIdZS7q/nu/sf74znDhiM1V5n0@lists.linux.dev, AJvYcCWFBZSi/gQXEv9iQYNyV6mw1pAZEy0TuUAPTogiddR5HtXAMpclaVhI4pD2+ESyqrJiLWs8ud7h@lists.linux.dev, AJvYcCWbnq4398N/VXGh2FIJyypdHjlZrlhLGN/nvX53x+rS04zmRfN+zBNSwkvrTuguIu9+Asg/hEv+t4M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdOKG1YvwWo7uPIhyPcHDDABk3UccQ5xij3OlLmepvv43uUHgd
	wt9u0uPVmNzcror+G8W/aESlcWIyrs2xCvHcyQX8FaELF6g2DNMaesKw
X-Gm-Gg: ASbGncs7T5zhQKgfDQXuYpd7sYw7zxMtwZMaAs5hbBBGK2TzuCsPS1a6c9mFTacI2UJ
	f4BQT9vg5TKRcA6T45uHPTKzBwdaQ+N1d/fSwkfH+s1gSNUBuDGB3MzkpLh0TiTxuCV2lPA2H8w
	jdMORyF8c18KHXktnU8oOYLmi2UYOElGuww/mh/Qdm6uPPWG7OLCsnbmRLHqJDsISdPLah4VjZA
	PSRuz04Qo4xML/D6WjrEQqDmbOWpuuud+8Z55bmM3Gf/xsmoAvWky68cFJO5O4S/OKiMSxmmloI
	Eekw0Yq3PEu3qoQISmBWUsPMzGMJOZjgpLDpBZl2p2tAyIf26Hqp1Eow6KeGaWRLA5xG9rnXL6P
	zRN/ZEpLlmLCkUA5piEYKQkO8CxYaL6N2z0hcT9A=
X-Google-Smtp-Source: AGHT+IHR6aQlSF/8bXSoH4TD6ap2xoMQpmbGXXfb1yr3omEUKfVx4ptOTSMnNibgVm0ppSBcD6Zkmg==
X-Received: by 2002:a05:6402:42c5:b0:618:4044:67a7 with SMTP id 4fb4d7f45d1cf-61840446cc7mr1952899a12.5.1754927966277;
        Mon, 11 Aug 2025 08:59:26 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618200a0159sm2966360a12.6.2025.08.11.08.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:59:25 -0700 (PDT)
Message-ID: <522ae36bf788df6d957bfee671857d6b2e1e8863.camel@gmail.com>
Subject: Re: [PATCH 001/114] clk: at91: peripheral: fix return value
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
Date: Mon, 11 Aug 2025 17:59:22 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-1-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-1-b3bf97b038dc@redhat.com>
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
> determine_rate() is expected to return an error code, or 0 on success.
> clk_sam9x5_peripheral_determine_rate() has a branch that returns the
> parent rate on a certain case. This is the behavior of round_rate(),
> so let's go ahead and fix this by setting req->rate.
>=20
> Fixes: b4c115c76184f ("clk: at91: clk-peripheral: add support for changea=
ble parent rate")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/clk/at91/clk-peripheral.c | 7 +++++--
> =C2=A01 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-per=
ipheral.c
> index c173a44c800aa8cc6970c266995f4a60b0a38554..629f050a855aaebfd1a03ff87=
c2b016cd2284a5a 100644
> --- a/drivers/clk/at91/clk-peripheral.c
> +++ b/drivers/clk/at91/clk-peripheral.c
> @@ -279,8 +279,11 @@ static int clk_sam9x5_peripheral_determine_rate(stru=
ct clk_hw *hw,
> =C2=A0	long best_diff =3D LONG_MIN;
> =C2=A0	u32 shift;
> =C2=A0
> -	if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max)
> -		return parent_rate;
> +	if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max) {
> +		req->rate =3D parent_rate;
> +
> +		return 0;
> +	}
> =C2=A0
> =C2=A0	/* Fist step: check the available dividers. */
> =C2=A0	for (shift =3D 0; shift <=3D PERIPHERAL_MAX_SHIFT; shift++) {

--=20
Alexander Sverdlin.
