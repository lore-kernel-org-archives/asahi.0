Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8190E2EA171;
	Tue, 12 Aug 2025 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990208; cv=none; b=KgdCOnMgAA/HGX2qR7nHip8TTisSXB9Ot5odLjqD2NBotUv60zdeBraBbXx/c8NZye3zfhzlp0DbFsykfre2kabGgGa1PjtLgzSdw8rxYrLdm1IV5Pg+fTz4Ri7Yh5tB1sEOeiskcXxUZmXlo3Jfg4rHH3H7J1v9hb/9wy0g9j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990208; c=relaxed/simple;
	bh=XaiybivBLEOc5tyQ377RQv6aOttoAfSI7i2voibQNmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rP8vI1eudup8Gc9jSyKVghTUBqUu7TZUBCiA1UjZjirAD054byNmQqD3fzTyvesNYBuDEW3rRrW5rytCDRVnJcWIMK9ToqzTC2I8/CmIYcSniGAxTXpSAWouonBvTb5hB8Vbc3+0a9lORTedHwG5znLsmZbs8/vo3SOnujoCmdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HX/Hc/eg; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HX/Hc/eg"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-741b6fa3456so1108443a34.2;
        Tue, 12 Aug 2025 02:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754990205; x=1755595005; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rOGKCteFZMAy3LeuWf1j/2F5b+EEOJ9yxzrgy674/8c=;
        b=HX/Hc/egg7Y51rWCCN9XHNIT1CKNoOLC7I8GEg+fugP0i8Q+S1pDBl83X0pC2RCvGc
         dfWwN7x9Nm/Nsu3G0ifP065X6mf14c9z2t1g2cJOc4dEoEDKm1TGe7w0GtpNOybI7tFE
         s3+yXd7m4WjwP3Q1M8Vtxxa5jXLiSPEdvobX2fUUfWpfzX7MEVbMGLiv9zG3B3mxRu7k
         M+9DxmE7F0JrCeIJC9/kzdQNsHQDphTDr6MZ9KYqh6SeLWcXRRPIR9UNi/R4d+oYXHFa
         DcC1T46oNCR6VeqO1LlcGLT0EPDBYD38tUW3AwfArAZpWNaGxDvdCRZiqPDensveSsJB
         GQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990205; x=1755595005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOGKCteFZMAy3LeuWf1j/2F5b+EEOJ9yxzrgy674/8c=;
        b=McxE31HtkSN4qbmQnd4TNDhSQ8JtzgEMPyg0i/sUtg8pBaDhuXkusbWVKLmOTcRZrT
         ZTaXHSEELwmfzG67essDSFOkobOx9upn/mYhI7K+8ZJx/JA01cuAu4bNnkA4ClOhBxPz
         Qt2jZtla0xn6aCAJC1Lhs2NMt/DqV3gfs57fsWkJ/ta+1FX0VE+KVjoO+a1C8irr6Hdb
         CFjjgK4mEduawxSFmTQ/ZpKpKciiG++SvOKb9WETee4n+8CzzLMTiB4XdhjaFYYz1mYx
         fz/66u/E02wHzZojkRJs93tMQkFr7OyTtYiI1cniV8XVoCISECr/Hw1IJ9vyqK4tPceD
         dLoA==
X-Forwarded-Encrypted: i=1; AJvYcCVG5Cu5o+E25IXclUNrwuEt4bbBitpmJRYDnNT5dluxzElqFmqhYlmuB3C74gA5NOkn5inESQ==@lists.linux.dev, AJvYcCVMKvLNkWy7foPlxNHwoK/91B++RAMh4WIsTPoQSgDvnqba9gAy4szyCjLtHvHSzmYa5d2G@lists.linux.dev, AJvYcCW94hzEb26qs9ld8NEUSK6Fqpc1JTWq7orJ5XmKZH043YuFJ6km5/m3xOhPfFtxAXpNYQ2x@lists.linux.dev, AJvYcCWyl3MBxuLlfECF3h8bts1DmTBiT8aU2v6a4+4eQ8+ERwK1eJFNxYXNfk6twLVUBKpEUHK2RoD2sIA=@lists.linux.dev, AJvYcCXVsFCuHkXJrLELWDRpCrQEL7gNI2vxAbLJDJV5Q/JlFM1DdQ5J0k1SINEzT/dvTwt9hV1b7fZp@lists.linux.dev
X-Gm-Message-State: AOJu0YxA9RMGHeqD6n6EjLWXG8HLNj6XgI1R9YgKVHzJ9NLOrC4/5+Sd
	J7rOMxKHBra1k/x/2XrEpUDXKdMXRI/zGE/uFH7Z6R2lsK+NlnzGs3oMO1cIkhuHLQc5yxcvxE9
	1kBapCak9yO5nNXYgWeVdMss5ob1Emfc=
X-Gm-Gg: ASbGncv3tPlL0FzI4YBUyImJ0xzzvPBcQ/pucWR9Jc8YLexejkFk90ZWolcdcMjWNVd
	LwdVAraHXfxCrAWjvjRWzzMCIhjXyLNYJmUwVxhyAEs9kcRD4vEq2F8u10DfIcyIW2tv0t1+nBe
	M/Hcf+OIHIoWHpsKoNiXQyWMmCmk/JVb7BkYL8aPaqNmFkSEMZOxp9pSjbbYQmG3FEfPo8pGzUz
	O3AUA==
X-Google-Smtp-Source: AGHT+IETTIJEQRSUprmEW/PZ43+7aaIWslt+bYkWZi3Waoz2cOUzGNm7S8/l4wJRhakmB2sfTn3K3AA6daLwKG1Ea8M=
X-Received: by 2002:a05:6808:181a:b0:433:fd1b:73f1 with SMTP id
 5614622812f47-435c90f0e8fmr1519318b6e.6.1754990205351; Tue, 12 Aug 2025
 02:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-54-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-54-b3bf97b038dc@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 12 Aug 2025 17:16:09 +0800
X-Gm-Features: Ac12FXzs0-qDCA0x0Aw1aZmy8texiIAG_F4IY6MycSoBtAjQ1ujDKaGaSXI8gxQ
Message-ID: <CAAfSe-u-YkkwKyS4+6EU+-zg5ghemk-4VJVE8p4Sky1-e4Y13g@mail.gmail.com>
Subject: Re: [PATCH 054/114] clk: sprd: pll: convert from round_rate() to determine_rate()
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
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
	Andrea della Porta <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
	Viresh Kumar <vireshk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Alex Helms <alexander.helms.jy@renesas.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, 
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

On Mon, 11 Aug 2025 at 23:18, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
>
> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

> ---
>  drivers/clk/sprd/pll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/sprd/pll.c b/drivers/clk/sprd/pll.c
> index 13a322b2535ac37ecb17f2c39d17d2c03532cfcb..bc6610d5fcb72faa7406ea78dca4cd9b848e9392 100644
> --- a/drivers/clk/sprd/pll.c
> +++ b/drivers/clk/sprd/pll.c
> @@ -254,16 +254,16 @@ static int sprd_pll_clk_prepare(struct clk_hw *hw)
>         return 0;
>  }
>
> -static long sprd_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> -                               unsigned long *prate)
> +static int sprd_pll_determine_rate(struct clk_hw *hw,
> +                                  struct clk_rate_request *req)
>  {
> -       return rate;
> +       return 0;
>  }
>
>  const struct clk_ops sprd_pll_ops = {
>         .prepare = sprd_pll_clk_prepare,
>         .recalc_rate = sprd_pll_recalc_rate,
> -       .round_rate = sprd_pll_round_rate,
> +       .determine_rate = sprd_pll_determine_rate,
>         .set_rate = sprd_pll_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(sprd_pll_ops);
>
> --
> 2.50.1
>
>
