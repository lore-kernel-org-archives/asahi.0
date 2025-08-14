Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1724E21422B;
	Thu, 14 Aug 2025 15:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755184629; cv=none; b=nah5RNCCdhhj6kiyVzcIiTBKNzvakCH1xa7CZ+islhLgQG4xZ9NDPVhsexfsYS8wyi+YuYNXMgRQtHpdOCUi2N7GrxIbNMr29++txgN2LdbpkudL95e3ZKXf58SBVhoUWPWpJxq0+p0IPlzZJCM6y7wMMFMQV0eoHAS9CBfYxPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755184629; c=relaxed/simple;
	bh=cL7dYIlmSlciFuIopinblc3YB80GsYEt7bRotIwo9B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MvhOeHzBcscYG7gzkpB5DVxUvaOA7SXqdUIic4iqXIAt2Ld0iermq+9Oo1Mz74ruYe9yZyJ7fipjuiJNoBQwHLb2gN5wtbM6Fwo5ErbtExicCHed+EhzK2xoJGv/ruBkJY41R/U/AURyzaIspdyrUd9PrQGpFOhXnGLc9uEarso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-435de7f6d71so781604b6e.2;
        Thu, 14 Aug 2025 08:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755184627; x=1755789427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umiR4j7DjLNlMEowdV58E6T5tLX87kYcXiEtAZnwsfI=;
        b=FCDo2Bv6WQl3TtbOIEe6ofDEM5LicMeA4tYWMQsNUKv40cyUq+XhUNZx6snOXUlp7T
         +jgof5wml499PRc5UgkkWj8b+2f9TBiG+/m6PDW6Kc2xwtkUbg3SISj2zVT4SUGLedX0
         15cheB03/fAaGhcx31EBJX8qU71I2AZgf9MRNQnfIZyhFA10cypC1O93GjSDvlb40fP7
         M4pBABMQ7A+b2cWE7LOEb2o3XinZ3bOTYpqNObt2/iaylNzdaGJoPlhyIXRZOwQ6ZKmv
         T2UuJIn2wjkOMeTlUy/0uVGt4hsPMrnU/tubxYNDoGtLRhSeY65Pm0X1o2LYKsxkj7Oc
         GKjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUStgbqY5qv7lLrzAQbyvZf0LoK6SBAGm+Nw2ZNYf76keCi7qCMC+sxcSumIpmGkn17/g+u@lists.linux.dev, AJvYcCV0AaLQZAH2U7FMH5SBX6RNLkqaTNTjqnTZrFR7ZTz7ZPjE4fChCKYB3quRk+Rk/M09h6bCvw==@lists.linux.dev, AJvYcCWxtoSFEMcuGMmE+i31qiMq4p8vwIcGvVN6ws/jPKEHL1z6AZLcEbOVTSdzHjl8KB7eM2iDKhcj@lists.linux.dev, AJvYcCXC4IHokvr4hCuZ3Ugpa7pCmwG28Gko+kNNy6H3HODMl1Iy6EUd/hcp8gdOh7aJ18TyZ88HE1LfYiQ=@lists.linux.dev, AJvYcCXHDZDM3axGJGgFXWUWZVVmRTmIRJVtC/hzPIaAcO675CmN5v6+z8ptjqOA5eqLOXdhKciZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwlxZuGbXs9WzJwsfBLZYsnHOE3EIhYFyBmSESQdUucfULtQHMJ
	WlirRCDYyGyBEBk+74ibT7RieJ9Q+M9YGW8L8SADWt0h9neVCErs60JSjblRfdzZ
X-Gm-Gg: ASbGncvVGYTbKnydfFecUjfkeNTlzIQxBX62ze8Z6J/RRU+FdhriXDpB7xhoZdYyJdf
	zzOW79pbbQuRPq84wLEFk8Oy8Wk0SRN9+a+KzsmMsTdYM+ADuD9be1444hBlynqK2Mv3h6Zn0L7
	QA4M24zRd/nRICmp3hhvTjXwUKH7enOTBvDseSr3ZX9p1tHCTVHizR5YQnGR9iQvqEOq1PxW7E9
	0Lx4CcDkg6Jp5oph+/kIx4Xx17AL6tv50U10Gy82oef1IjaGdTS30Bkhl04fiRvQq7iiU2slSII
	bzYPPKIyemITMSZkDGbC5e9ohoyLQl+C2dKV43LjR5+ZlwDuTG7Vs9m8TWRAI4dqylIRLzfC3Nc
	izYl4xgO++R74EhFxxNX8XV8quxH0O26+YHmsUOaoL3ywaHZgtaXTXjXUzf5e
X-Google-Smtp-Source: AGHT+IEeFTC0sAnzqtAjeExeQJEn3sHamLRMa0ecrU0QpGQKcR7YVe4QHDTPvXOusdDR68JDjmnITA==
X-Received: by 2002:a05:6808:2210:b0:435:71bd:64fe with SMTP id 5614622812f47-435df7ea862mr2094937b6e.26.1755184626857;
        Thu, 14 Aug 2025 08:17:06 -0700 (PDT)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com. [209.85.160.51])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-435ce8803a7sm1101875b6e.28.2025.08.14.08.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 08:17:06 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-30cce50dfb4so1165506fac.0;
        Thu, 14 Aug 2025 08:17:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOa3MKJg6ngvMFaOnA8bmV917bxRrgrnL77zcjWwciLvJ/clige9hDFRYWETLkKCBZXSmzO5XXAUU=@lists.linux.dev, AJvYcCV2x3Ji6nF9oN//OwwEo4tAYLW8JmraW4ju1nh8cK4XikQ+iv1EDt+mtWG3R+lFozAjeNmC@lists.linux.dev, AJvYcCVRf6rNJu/66buGESM3zx0JuOQWnT/JURoSkxMX+L8luZ+UooZbm3TIIxrCUgM10XKtL3dU@lists.linux.dev, AJvYcCWjMRDHmyCOM0TWiP3SdEoUTBe7m2RpQREzt7wijmkNZitUnx4IgKOAI4TAo/MqnFpShXmr+HIH@lists.linux.dev, AJvYcCXvRrtW0u9aH86ZjAjbO1AK6rJZuQjsCQ39F+qzLsjo1aJbkFcog5JIUOBG0G0UhA+dH5NeUw==@lists.linux.dev
X-Received: by 2002:a05:6102:4192:b0:4fc:1484:5500 with SMTP id
 ada2fe7eead31-50feb4013d9mr1289391137.21.1755184278470; Thu, 14 Aug 2025
 08:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-93-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-93-b3bf97b038dc@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 17:11:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpmdSzNcUOgjWLJhH6+5FkPEF9uruqGqbk-u0SC5z5wg@mail.gmail.com>
X-Gm-Features: Ac12FXzyDBZHsviTnjmg5miZS8Vof98mQ5mu_iqWAq-BW-zvBlKCQTg0qFd90xs
Message-ID: <CAMuHMdUpmdSzNcUOgjWLJhH6+5FkPEF9uruqGqbk-u0SC5z5wg@mail.gmail.com>
Subject: Re: [PATCH 093/114] clk: renesas: rzv2h-cpg: remove round_rate() in
 favor of determine_rate()
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@amd.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Alex Helms <alexander.helms.jy@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Aug 2025 at 17:18, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
> From: Brian Masney <bmasney@redhat.com>
>
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops, so let's remove the round_rate() clk ops since
> it's unused.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
