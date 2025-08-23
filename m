Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3A522126D
	for <asahi@lists.linux.dev>; Sat, 23 Aug 2025 16:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755967849; cv=none; b=gEjsshLWy1JwZKgGVMlfY27ATPEPfDYyHUt0LtE4+z4Xfi11rwOHYXSDprKXc7fktlaIRqE9qLYW5oCYyr/1WFMIwAEyFKs6wf66r2ei/I8FSj8ry3Qs7x7ErIqX2M7msImTo27gRAPZsuKhnn5n5/yXT7ASGNq1iYL2mjOLBMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755967849; c=relaxed/simple;
	bh=D4l/bK6NOcyRlgfuSTYFAZkY/V6CNxkCV8wyOCE4M8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d9vSu9Po5R41UeiuhH94YTcYF+CWMmFP7edOk8jlaFaqjmIMofY+jzAV74If3+TdyJl5GUExvdrFLCjhaM7hDpEMHdNJn933TFeMpSVFMvdOWTJ49JT5D4TFQQ+B/UaCKvCcpXFXSBmfuV8gpaRZuYoYgk7+WzTCbmie6WdyUWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yqa2BEhF; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yqa2BEhF"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb78d1695so39714866b.1
        for <asahi@lists.linux.dev>; Sat, 23 Aug 2025 09:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755967846; x=1756572646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNq2Nibqdx+evdv5zNaDNJtsHifnmrRlp9CMMl4pZuI=;
        b=yqa2BEhFYOi0w4kbHXyfGkaQ4rhvVY0ySbkATNHpabgkRfFCG/a5nR25ewX8zHFdaW
         Pxn1ebgunjyCblQL9/fLVmLbMLH13s05I0iVasnC1KilCMsG2QuT31gMX8kgwwpVAXfE
         T57OE6q2C6XcDRz2v1MF2e/WzsTXVoZsWBw3ijU/QChVD/oSzhv5qi9nszeVoVqtKcyn
         y1j7R2OO3uEllLfac5eBJrlFpWpQbf7P5Y6S//HiuPqJyI6+860SN/i8+prQBNYUPXBR
         wjdPInL4/kEyDiOAX3UB1NnecEc7o+SldOmf+yv5gw5tkGKwDzgqycnwsCZBN0HxynOe
         VgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755967846; x=1756572646;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNq2Nibqdx+evdv5zNaDNJtsHifnmrRlp9CMMl4pZuI=;
        b=ol0rHQIokFcJ/Yj7FNtLpLHcrKTsKM5I7MlZCQELeVR+zmfLqoN2poMnW5F7rkvnmB
         TVhzA8efpYnNA5YSuqv3KGXJx8pZUh0P1AQ8ZhPscpZPVFHXaWRe1JtqdKLCbw2xua4H
         NloOTPf/HMIOmhzDY+KOZFu8PxZGP1jlq+rchaLXYlx5jUfginIBaUCkxJBlWjYL29X/
         pA1CDx1NsY/kObace0qrreFGZCs1tmoUAulnqW4SHyVnqFVkVgqWT2MpD+66Dn7vUOz0
         IC+V/M7jVajpxQFEBkM06zFg5yJFGMWLiVZvH4qpzEwzIMe21XBGjbhVZVwrRXBLWRzf
         B1Zg==
X-Forwarded-Encrypted: i=1; AJvYcCV9yNFpXkjXBH1B1hWBEqtzf7lxJRTopxpVv80X43P6QMe+e0NDSqxW8zJcGLXbF/EXzo6jlw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNEX44Ehs5tqHS6TFg0inA0qSV1mrvssfb9fitiWHGOVLyssvK
	2wt2S3aBmvF5Eywq59F4Bs+fVOAZJYehgRO8sWQ+Jnhg6PbV5C2RDLk+f13c86Fh12c=
X-Gm-Gg: ASbGncsyrl/K649eqqW/qLcFtpjM+nzwpXaZdGwwP3uEqpptDXP1mvv96IbbptkzqS1
	lBIYWje28wzrg0k8OT/KTVoGoE7yOxc6L5VOcl6J/jQmj2Un4HDEzC2MqSnkq1qbGDL/tyTXAe0
	peVbCu+1LI1edczZG+Ev8R3ej8dy7IyM7UfR90sq+byEFwGPIPFsWKmRzC48XL56ytgvczPaCKU
	Wyq8d3jsO9yAd86PD23AdrNfcdPR4gM1Dl/5dPBlLG+RfSvmalVa1PwxWP9djgIsR0kA6hYL58F
	xULWo/gW6FnbkCN7FCQGTdUQVbjXauH5fzNcYqnItg2X3RQmU2v1+WpciZF+rYo6k6wT1XdmJgs
	0Ws2X1H2g5LHxmw5zR7oDW7xge6E/xf2ypQJkHe0=
X-Google-Smtp-Source: AGHT+IHHFRcZ2uWc450cm6YGSWLLm41zFn8yMlhrRzRS5mz16K/9Ne7EtPYoZsI+yYfZ3MDyCa6PPQ==
X-Received: by 2002:a05:6402:358d:b0:615:7ba6:4876 with SMTP id 4fb4d7f45d1cf-61c1b91089cmr2916571a12.8.1755967845817;
        Sat, 23 Aug 2025 09:50:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c312c4cdesm1797880a12.23.2025.08.23.09.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 09:50:44 -0700 (PDT)
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
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-98-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-98-b3bf97b038dc@redhat.com>
Subject: Re: (subset) [PATCH 098/114] clk: samsung: cpu: convert from
 round_rate() to determine_rate()
Message-Id: <175596784123.52468.6703738128182958997.b4-ty@linaro.org>
Date: Sat, 23 Aug 2025 18:50:41 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 11 Aug 2025 11:19:30 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> 

Applied, thanks!

[098/114] clk: samsung: cpu: convert from round_rate() to determine_rate()
          https://git.kernel.org/krzk/linux/c/05c58c9415d1369387aedd28518fd0fdaeabd178

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

