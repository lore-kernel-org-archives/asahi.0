Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8404224B0E;
	Thu, 14 Aug 2025 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755185599; cv=none; b=lki3egCzYzeVGGRXsHJnAVkSK9pkDW3/rAubNSMp0218+NughVk4jx+bqCGa1xmnTvrMTAvcHMfB0SCuZPhctqPEf7HaILXr0BcUYZ/WU9w+gPeU9A40tx0jrsb/yxSJjrt9PhZZ0pPdE7Rn9PSE80JKBse1G+ER0VtAeTNikag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755185599; c=relaxed/simple;
	bh=QYRUK4EXKQ3Br3Wc32yS0rLX0zRpM2iSrQbV0k4msLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pj+x1/hzeFCDNJX1AFlER47uOFvMzKfW9QfagMtMsWIWfUZ+rZtBf+5IqnqWf4F0iaYTSbxbAX+8VYMftg6wBWegdEfGwv64OQX3OVwVyZ0Hpboh8s8HYgpa9AuLXO+yIvi7M852QshVUd+mTHoVzuCDZTHQxuTiZrJ0ZeERCYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-30ccebb0cc3so745605fac.3;
        Thu, 14 Aug 2025 08:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755185596; x=1755790396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9du/Bs1Vwkuk15qOOpl62+YeIchI37tbTZ/WdEUy2s=;
        b=FYOWFCIQZWwFuGUTDrwxvhfEwXsCHKYvepK9ZYRIJC5LpoMy+4fZJvt72Z21Twja9C
         b4KAIPshinYX7MCVrgWQsgDggKaqqYtQ/QCWATda4UksxIXJp/O3F2+c5L9WnY4J2IbC
         obINQEyJQFdfPD2bxlaaW30XCvlPnxfm4txApDSxOknAZchv8Pfuxh8c+BC11oCoCBwX
         6xmwi2t6Htp+6JTqrSgMSL6k85FjWt+f3DV8uE5Cb22jwSOnIhofOl2nflhXndNKrtPa
         dEQ1rS/3z/LUHjOKJHTGV2NZ9LaJl8Md/5jq1glkZvqmuM6aKkpZ8ozOjWKQdM4W9QXE
         P/TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIsdzhWPy18rShO0DtAKqELvyHfTJ5tjUIGKzxGw6GdOTF+quwYjKsIpfr6DZrqRDTEhq3Pg==@lists.linux.dev, AJvYcCW1dWW4EPzQX67Vr4V9/n9OFOpRAsJiAfOXHJXhm5BVSscI0OlYCYZ2OVRYb782lSFobcbB0J8qZ1M=@lists.linux.dev, AJvYcCW7MBmpYBdNAY6MV2eOydzJINhxNYF1LAPqtDiH4o4wryzwBc+dVLc6vo9zC1mE/BQRJaZz@lists.linux.dev, AJvYcCWyOsTnYsAxoXdJ4ELrRgdJlVTp1JuC32+io3S7KOMzkJxENF/vb6Tmsx+/CitMKlIr2G2V7CwV@lists.linux.dev, AJvYcCX22EwvrGgDXk2kff2FQQiuORfPZ8qG3n1zJDcNxqBA4QG82UBML/QeH5kvvXwgsQJxgYw8@lists.linux.dev
X-Gm-Message-State: AOJu0YxYlIZnnPL14mhjn9S6uPbyNJIho1y+dnc/oMlE0BFYZ9KR8zg+
	zk6RBTj5tDAtzsG/1ePtb2cs91J0McPVMC2ATR2jkxxCu2KjceE/MzWOIL+L6N31
X-Gm-Gg: ASbGncuh5RQtSRPQQpBogkZkk9hd3mG5br2zuDefcoMYm5IEj6wXt9pwo3vCoEQvAmL
	h8jBP7FLsxuTDdatxlu8gE/B9I7Gg5uovXoN/PCdmYXJ4sFk8VQX9RhQ9thDkhGF8G3eFSVRwqA
	cssgC96/Ba5McnZm4B75OG+kF0Vc9ND3MpwhjgKPmMuGia94OVdkvSn8b2oRDfHxz98FppHokDU
	PVSt9RXSvoZSoJpFL3qGVdX2sQHfw2dim6gGDrFipVmSkiH3dj96FQF0qdvHYYytQW3AUSjplnK
	jmb5OhUMd6/+Z3FzGfbTobNUCDUy29aKXRuNgEzYvGmrOMVLZ+o07+pUgcJ4Hytz4D6+U98egEc
	sY4oxTwDTcRvAnejjxNcLlN4e714Lw1BSxqacSHg4AY1cNMd9/zoRSIlWtiJq
X-Google-Smtp-Source: AGHT+IEz6b73+TtGDLShroQ7h9Nu3jtA+zybpWcR0EpA2LOjkcC+rPZOl6VzDldnPyCKcJeRpcwz2w==
X-Received: by 2002:a05:6870:ed8c:b0:30b:90f4:ca08 with SMTP id 586e51a60fabf-30cd12cab15mr2039191fac.22.1755185596379;
        Thu, 14 Aug 2025 08:33:16 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-30ccfec5cfasm719830fac.15.2025.08.14.08.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 08:33:16 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-74381dd4c61so504290a34.0;
        Thu, 14 Aug 2025 08:33:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKgOwgvUOtq2HrY6Y15v/ZfvsD8tW74yNUql/H1BAJNGau/N8xx1iEBV6S68t+KBFR0YUFwtJ2@lists.linux.dev, AJvYcCUU6f4BrPCtb08W6iTRaATIsCRsiSUf3vHMnCvtR5OLScNZM6ZHmJO2K8GwdpUkMPgOXth91A==@lists.linux.dev, AJvYcCVWCmb5yJDqYx5vclyYUfx/I/Ah0+WGeo6jg5i4UhAKdDYF2mVb94SWQa8Bag3t8WwtiHAL@lists.linux.dev, AJvYcCWiqRiurfvAI7SA4Op7hgIae1ENpiWYa42D8pJFmjE9aG3g3lmLV5iZIWLJBn672ldGmNpB@lists.linux.dev, AJvYcCWyijjrKsHejnVWgt93hUMqAttgdOz06iPGj8xMFMdFjmicBR+Hc6L7NfVEW7ThD3cIkccfTquWcUk=@lists.linux.dev
X-Received: by 2002:a05:690c:700b:b0:719:f582:be17 with SMTP id
 00721157ae682-71d635fe81bmr48846567b3.35.1755183986689; Thu, 14 Aug 2025
 08:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-92-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-92-b3bf97b038dc@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 17:06:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUR9phiPyhi9=f3gdA_f5oRmaX=ucj8SUquXQEq7bUTkg@mail.gmail.com>
X-Gm-Features: Ac12FXzt8_e3pGt50aBSDpwDZhCGVBhDLrUDheSmsSXHpMoy_pb5BR_R7aHtEdE
Message-ID: <CAMuHMdUR9phiPyhi9=f3gdA_f5oRmaX=ucj8SUquXQEq7bUTkg@mail.gmail.com>
Subject: Re: [PATCH 092/114] clk: renesas: rzg2l-cpg: convert from
 round_rate() to determine_rate()
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

On Mon, 11 Aug 2025 at 17:19, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
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
