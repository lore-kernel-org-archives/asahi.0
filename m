Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4A92E88B3
	for <asahi@lists.linux.dev>; Sat, 23 Aug 2025 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755967854; cv=none; b=ac4zWPio/qTYxaul3BXOAstUnp/KtJ//kpUhydDBGEoIUXY5CujULr/2LohtMpKsn51QMULFuqB8ZEwnM7zRuLtPNnDfvZdZdyO5heGRsLq5jJ9oxXK8PFmpNsJoFcKKRKO8VZnwE44Pf0VFJ8cMYYOgVD3tMq5MnTVPoK2mUO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755967854; c=relaxed/simple;
	bh=ll4kgop1oU/2MiH1wKMG9HwPL4Ffv5IU0KbLcPeRX0w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nRwkWdJNc2s/x7PVNaYoZNtMM9oMRn1uIw2J2bfJTmF4eVkPow6piPXKlUBYtT+nelm17iqX08hoXUWTg/zX4oSL25JZg7X6KgnzDhNqRqDV90DtjWdO6gu9w/R8iaVV0TVTId/Ul6Xx4eN/Yl5pOKBaWKdpQhv5pmiZTFXFF1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0XYz4Vj; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0XYz4Vj"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61c20df01a9so193214a12.0
        for <asahi@lists.linux.dev>; Sat, 23 Aug 2025 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755967850; x=1756572650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rswAVyuJvRa6TX9BXHZuTzZwEBPSMziKik/9EoWIi4w=;
        b=c0XYz4VjyziGJ0iPowNAuPsyr8znyFpcmaef/nVXyJFlJmS4+a4pkX0Ag/A9BBeV1o
         Mt9Esiwjn2TbcaKSrq8AZ+P+rVu7m8HRjnugTUElku+3fwEC7PBeFqk9YftrWI3ePXef
         gQ9FxXIVEOakCaUPV41tL7mWhtE7+hpbPfnXCTvx6sf9gtCfxoXf8LD5dQ/BAvY/VX/L
         EyvVKIexNYYjq0ARs3yT3qvg20TGKMyBvVByYIGXND5l3bOiw+oux7MtibOKfeJ4DByv
         CZiEhWNV0tC7X1lOnvxdrkb5oukYESFrulIOYTZaZ2Xahl0QFxzXC4dqjmlF1dXU2vvC
         yftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755967850; x=1756572650;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rswAVyuJvRa6TX9BXHZuTzZwEBPSMziKik/9EoWIi4w=;
        b=BLtrfpd6WMtCSW70a3klUwq+UoM38SS3sHQ8gX6ZnPXCfPTDcf5ukCBwh7uL67bc1K
         m5LjwouLADA3BUruANkL4w/g6w5HYO4z+tytmDo6UUZ254i7i0c6VNVmY5IJ4HpZIoUl
         AH5O7PslSqOUQja5pNY4eV0AMp0hiMobtW73rkPdW9motYJpSXu9ngxyOxrmYRMUYScw
         3mndo1kELJGq4sZQaA/VeW70J7XLbmlWEhn8TcXvuH6Ee9Hr/g+DW79utUd/NqXa7G6H
         QcUgRo4MfIwCOUAX3fwb6p7aEaJs6QRBtM1tf7l27Cke93/0z57IW3lvxI2DcF2ZYKlf
         CK3w==
X-Forwarded-Encrypted: i=1; AJvYcCVoe8mHgtdorla1p3y28szJJxLplMievxj2YiSazpZvBhKbReN3tTgxtMPXOUszFs6484rKxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBxifOOSp2CDk6kduxE0OyyT3WlPMoAFO5LogLWubuRN+u5yT8
	SpaWH2lSVQfFjK2hdal9chzZ5kbI0VdO7sfZE+W14RvQWBtoljFg4CcSE8xmOEKYojE=
X-Gm-Gg: ASbGncuDxo1Tf84WvAtX7BuS0Vm/H0ZgLPZx8RGm1aZ1Bxlzsqtn5NLAfeIDy8JHFtx
	bfd8q2FdIhxbPXxWVvXmVevtfie0FWcqKDBDCwAz+d+ae3XIrR/kVZSFOcB0ndAe3hWD0NtvC1p
	I86j5T5U1DaHiNeF8Pr/59W/gVzqjWLScRiiyBAEklkooBWJoZYdTZoOq7+5uXVhH8oA6zaCrYE
	uOPb5RczsV+glPLolGO8qvhp5jVzULz1zdLKo+yjSnduh8fukh+wBU+B7gaAqy6n2gAnOGjhbZl
	doKwhgq3fEELokjuxFHQKsyRmuLKqUH7adYpISQOHuYtJPTTDYeb6ZC09QD2n2UigA5I90nToh9
	f6SSm6FO56Zq//yqo8bF/+SHvQyuLYGq22l3UZHE=
X-Google-Smtp-Source: AGHT+IHjBstjuzxQsJVLkeGYHgOE3wWdKaHmumAPQvcdN50PYZzwBsMeGzXzhJUjnQCkGBQZZA30xg==
X-Received: by 2002:a05:6402:274e:b0:61a:927b:a79c with SMTP id 4fb4d7f45d1cf-61c1b703ddfmr2766014a12.8.1755967850448;
        Sat, 23 Aug 2025 09:50:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c312c4cdesm1797880a12.23.2025.08.23.09.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 09:50:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Alex Helms <alexander.helms.jy@renesas.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
 linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-99-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-99-b3bf97b038dc@redhat.com>
Subject: Re: (subset) [PATCH 099/114] clk: samsung: pll: convert from
 round_rate() to determine_rate()
Message-Id: <175596784601.52468.3851559862193091574.b4-ty@linaro.org>
Date: Sat, 23 Aug 2025 18:50:46 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 11 Aug 2025 11:19:31 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> 

Applied, thanks!

[099/114] clk: samsung: pll: convert from round_rate() to determine_rate()
          https://git.kernel.org/krzk/linux/c/e278e39b014d789fb670695d422ff33c3ef56040

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

