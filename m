Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3878A305E27;
	Mon,  1 Sep 2025 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720200; cv=none; b=Y7Xrodm+xcxQ7HWUpwJZpqDqnJUXNL9eUHQ4OtMxrrO/Qr3blJsUZheEJc7DAOuK2h8SOlF4Wx9wyX2ILiyU1vbFUFTqXiHo2pf90TjkRq8UV3kwsPiAhvrAW9G6iaoC5tX21JxsSLzWhukBwRegejAFuN4ifnyBspQdPfoT39Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720200; c=relaxed/simple;
	bh=ZHCWs4HH+c5lN4IlE9gqTWg9pmmhgAFoeTj2IWPQWHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGDNzTKImKwh22skBraf/RWJ5IzyPH6UfpsFViJgyGrLSqCbFYYW2Us2OHuOQ/LSlpWLG9suvGsRl2LNxm3GyPYGl0iIZEEq6AwjV5ktOJBUCcPWPImnXO8O0bzJ0VZtSAEukMisZB4P8ahdnCKZ56BTeuL7JvDVTv0Ve/BaWUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5449cfbc489so1502144e0c.1;
        Mon, 01 Sep 2025 02:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720198; x=1757324998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tFy+S32zcH8SOQI+WY2rqVzMFSU7CQi//EUuweLF5I=;
        b=KWYJ5a+BrJgBoInbTNOlvGdwX2IC/dmHg12fdLNFka83huYGoGL9s04RndM+lJ4iH/
         fO+buLm8aEgI4ccjy/fv+DrWBUnbVCERbIbSCql3U0A/jVM3o9KKSLg4ETzzJW3666AI
         H/WtgTaNJHwu9BZ5opbAofaGR7ECBUEgPF9Xc1q8Re/nrltDmjKmlIQBAPg66asRRFh5
         490wlWG7UErHKnZFC9wYN9mwuoDLK6BsITYnuRS9LrZQFGwJGkEbugXbp5u1T2SNHQ71
         kSVzaAophh+rYjBEQu0j0Wk+Bu2TNHYvucVhiSjQhr92tDlaQ5CU/CbT/ipbbsHOB+Ar
         nDdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZpiEEyaovKUvQIpLVHaha897aZrfA0Ohi43+cKBwoaoeXSmrkD/gsJORk8XAjs5XHTGnf57vf1B4=@lists.linux.dev, AJvYcCW8WMBAUqlPnpfuWcPrDnDSoUJk8ss/FSfxPSIqxdsiR/gDr7ph1FcgVNB5MIiYVYw/103MTw==@lists.linux.dev, AJvYcCWnXGpcT8rHngZjKmZmmwTKVsQPCOEbOBeT+RFb/aoRJDj5XHOUKYHN/tMP3xxeB0gtCzIq@lists.linux.dev, AJvYcCX6YnQWrzT/HyXhNuT159Mm+hZrPpJxo6DR0BZ2SNDuCBvVufiWqntmILx94ZJpN0EtaymkDfv/@lists.linux.dev, AJvYcCXRLwAkpfFiy9J0apmRuXKnJHw72PdqunwHjRbAjnRb7lYM/8dlndocpDeeysAbkYfAZ56n@lists.linux.dev
X-Gm-Message-State: AOJu0YykCKRvWz3J4+Qq5l5D6xPFODmA+VDveDe+C8I1DhX+Dq+WLCwF
	Zf/pFUWFYAmok5a8g+XW6rftZe4BEHM1qoat6m8UrmDU/yrVn5qN/PEHZSK4J2J3
X-Gm-Gg: ASbGncvTvTI3aWEDjX8DultNZyRtlCaWGCbRqgVz5D+X7ydQNxndjpMuzp0HESA8flv
	uArftXLEBS7U1a2TUcgg2HXPPJmuBPLrez9mQzAx4r4m7fzY8JnG8PzYnJVieyj8iFPbyuv8Oe8
	dOF25GEhUA9IEOOQNx1t2CXi0ds8QgdIZWgAJFbB/sjXVedqNDQyHdTEgZoOWdlZcvY0E4kcKOX
	69YGt9ZC5KAVRFS2Kobn+ChaE2x0+c2HHfNnHu2+D4EQyGlMmFkq4WfUoRaGrsQaV7cnMaDeifd
	xUOZMBObywhZxeiCTJ/xcNqfmH0GqLVe4SL9vR2yhaXOTSYF0cxWFc5Z2Xm32g4BtCFPi36kNyA
	452jGwzk9fGGhyronMl204b7j8IkkQHCAVONB7GhlKWmO4yTDidgW8YsWVnF9
X-Google-Smtp-Source: AGHT+IGOppDQrbTIu5vJgHfe1cv0Cfm4pU8eQTmHTt9saluTmK6TBLel6SYSjLm0y2uqEVVBaOwMQQ==
X-Received: by 2002:a05:6122:1883:b0:53f:ea13:5002 with SMTP id 71dfb90a1353d-5449e88dce8mr1664816e0c.3.1756720197812;
        Mon, 01 Sep 2025 02:49:57 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544a1f09810sm2437702e0c.22.2025.09.01.02.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 02:49:56 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8902ee514deso2274873241.1;
        Mon, 01 Sep 2025 02:49:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW41BcSK+N9IkmdF4bw3ljMFQWYavhK74+wgqLxTUOWLM15BBmowFmEv0tzemPIeNmBP9r4Z+yrO6g=@lists.linux.dev, AJvYcCW5xxuIUdMk91QPEnzieG/jH/9aa788bsrrkOZnQGxRLPWV19HjWhJLaaVTA+4AX7VXH/Lg@lists.linux.dev, AJvYcCWHpSkPFhPcyPa3OxECnZMhdRh31d8ALE2avG/XsQdXzKKJEA7ppjTi+w8jEmhSywLUzoe+BQ==@lists.linux.dev, AJvYcCWkLLB2hncDmJ4IMTGgyXQIPFYUwsGTcagGkOziUNZjW1fRkw+Q2q7uGrUlAuhKSayG+87I@lists.linux.dev, AJvYcCXy0obbi8SMKA/rlO/9ZrA0AYwI3I/wxvfsiiqTI1e+PhEyZAFo9z/D/OBi2ixUYc5gGDU6NBz7@lists.linux.dev
X-Received: by 2002:a05:6102:5e8e:b0:50d:feb0:316e with SMTP id
 ada2fe7eead31-52aeb7798e1mr2104974137.2.1756720196368; Mon, 01 Sep 2025
 02:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <1907e1c7-2b15-4729-8497-a7e6f0526366@kernel.org> <aKhVVJPEPxCoKKjI@x1>
 <4d31df9e-62c9-4988-9301-2911ff7de229@kernel.org> <aKhr8NYhei59At0s@x1> <7c6cc42c-fc76-4300-b0d2-8dabf54cf337@kernel.org>
In-Reply-To: <7c6cc42c-fc76-4300-b0d2-8dabf54cf337@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 11:49:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUB4QGBaMk5r5eNRCPriUWAY+LBE2C7kVEkE9eCNE1TUA@mail.gmail.com>
X-Gm-Features: Ac12FXwQn8nZWuX__OUteos14KQ8Ceq7TOY9AfEwCR3rwgzCn6YxJiejdZ6ywp8
Message-ID: <CAMuHMdUB4QGBaMk5r5eNRCPriUWAY+LBE2C7kVEkE9eCNE1TUA@mail.gmail.com>
Subject: Re: [PATCH 000/114] clk: convert drivers from deprecated round_rate()
 to determine_rate()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
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
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Andrea della Porta <andrea.porta@suse.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
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

On Sat, 23 Aug 2025 at 18:43, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 22/08/2025 15:09, Brian Masney wrote:
> > On Fri, Aug 22, 2025 at 02:23:50PM +0200, Krzysztof Kozlowski wrote:
> >> On 22/08/2025 13:32, Brian Masney wrote:
> >>> 7 of the 114 patches in this series needs a v2 with a minor fix. I see
> >>> several paths forward to merging this. It's ultimately up to Stephen how
> >>> he wants to proceed.
> >>>
> >>> - I send Stephen a PULL request with all of these patches with the minor
> >>>   cleanups to the 7 patches. Depending on the timing, Stephen can merge
> >>>   the other work first, and I deal with cleaning up the merge conflicts.
> >>>   Or he can if he prefers to instead.
> >>>
> >>> - Stephen applies everyone else's work first to his tree, and then the
> >>>   good 107 patches in this series. He skips anything that doesn't apply
> >>>   due to other people's work and I follow up with a smaller series.
> >>
> >> Both cause cross tree merge conflicts. Anyway, please document clearly
> >> the dependencies between patches.
> >
> > This series only touches drivers/clk, so it shouldn't cause any issues
> > with other subsystems, unless there's a topic branch somewhere, or I'm
> > missing something?
>
> Individual maintainers handle subdirectories.

FWI(still)W, I have taken the Renesas SoC-specific patches through
the renesas-clk tree...

> > There are some drivers under drivers/clk/ where there is an entry in the
> > MAINTAINERS file that's not Stephen, although it wasn't clear to me if
> > all of those people will send PULL requests to Stephen. I described on
> > the cover how how the series was broken up.
> >
> >   - Patches 4-70 are for drivers where there is no clk submaintainer
> >   - Patches 71-110 are for drivers where this is an entry in MAINTAINERS
> >     (for drivers/clk)
>
> It's hidden between multiple other descriptions of patches, so I really
> would not think that this means that it is okay by individual maintainer
> to take the patch.
>
> This really should be the one most important part of the cover letter
> for something like this.
> ..

It was indeed rather implicit:

   "Once all of my conversion patches across the various trees in the kernel
    have been merged, I will post a small series that removes the
    round_rate() op from the clk core and the documentation. Here's the
    other patch series that are currently in flight that need to be merged
    before we can remove round_rate() from the core. [...]"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
