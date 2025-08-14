Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0982221DAD;
	Thu, 14 Aug 2025 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755184699; cv=none; b=OyGnljfkOPShPEMDYuAYKPtfH1Q2s1jGsptSf0jh8LmdEu/YkE5S2sQjO4B6alcr39+6ZMJb/14+iY6yKS/bgbUVC1diDfkm8V/kWMbpOssKDPmaZrgW9ocnlUbhKRrpEOtZoN49+hidJqgepbGaXUeZc9Que6rUtspMERhOYEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755184699; c=relaxed/simple;
	bh=PMFf9xzg7pxujnDyrrhyaKEYpp1klQQY8RGxuDDnp2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENNpavH3xHFGFi+ykbsGzpAXtJoOKj4WhLF+Tz1aMokXndRhi/KQvv/VBBwrRa5HDAcnBAUbL4bq7WmYuTTumPA/b6T4u/4Fv+e8TssfaP97SZO4/lgGiKjZwpb48gpnKNxPVjhts6ltQTCKsE+3jOK5bieL5R8UZ6kaCfAesMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-30cce83fb5fso692071fac.1;
        Thu, 14 Aug 2025 08:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755184695; x=1755789495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUx5rdSAym75bidV8LMMjvhD6atsKdb4p+2dl0DoyhU=;
        b=xMhuhz7o2m7qzLt/kmlMSAoRBuBg2pXCPSwIvh3QlZVoWbN9dObmmzPwE79woo6AWD
         cbfeJOI49HGOidttpbumdkUVT9JkIRuZskvOW0BP7+j6HvHNhO2zzGbArgGxUv4/KFZI
         yiEMAYt/ytz+WcBC409cRl7BXj4UdlvB4mT7dYHwjp0uNQMt4dO72C4fAofjpMhlkZZF
         ufxm5FU6Vk1gPDmYVAmhAHwoEwOkRfcCSJbEZn6Cx0HGq8VM2yY1ET+v8jWpabrbA3/H
         ZD6Iof/TY4r/1G0+Qw2kP5ySpShgYBMnHnZ07k5JPshTmVVIgphEZS+m4yV5t6uVXD3X
         RwYw==
X-Forwarded-Encrypted: i=1; AJvYcCUPNrAU8EHmtqLmd6byYBmPitxCA5rp5ttmV2pqyp99RiLlI6XJNWS7qUOw7k8A1sLPZnsP@lists.linux.dev, AJvYcCV2XmUHu8uErwGTuN+b9b+U4cmCLXdDPr5i+A/kqWLzUlRGFhAlYxFT81094kagre2i0ydD@lists.linux.dev, AJvYcCVBehmLKecXHcmfo34nRehm+qQ4Qm2gJw/PomkeD9i9Em6MDSyRzuPE1aLtCFMYo64WOzZGJO8BbEE=@lists.linux.dev, AJvYcCWgjSvR3Lrwgto+2GIGYpgCH3HqPr4b9pn44UcaYd4QBIP9qht4zAEBjLy0VqVFg63UD+i1Sg==@lists.linux.dev, AJvYcCXMyNwV6IrVmqbS6E8wuX5kHFNhrPHkpNvDiWzCH304OFtUPMsonMmEUQSV2tHmvkqpzmk5OEAy@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu54GonOyRy9WP24HKuFlFlYUujjBGRkPg4PEDx4NWbPuX4Afl
	BdjHxUcSbXjbcPK9QDCZI7LbEcsX2kRNIE9CRETJYxUYCke1cSEfd/kMqZD7K4kr
X-Gm-Gg: ASbGnct9JYYm7JmwQ5U9QiKTpSzt7qqU5PfDZBjpnWMthhtQ+DOiO74WbCoje+ubpTw
	mYuL6DgK2t+bCD7nkU+ig/5bcrvJ0bJYJ2JikOFWOekzKr497/lVcbb7dLdFHSkXM0Rfl1671Mu
	ioBjHnLU9R3uzbxQ1jgGWhgJAzVp4Tn4pCIhmvVlxcCZdhA6baEMEg09iXj+n6Q5zGKhVv0qVaV
	oytZ4uMgQSQqVrdHAwr4gVotDtvZWcE46vHY7ntR0W5YKRQ7B4SutQ+rNEJlg45mPVAqz/3ueFX
	cZuuccsyDHVohORMe3k+jTDyjcNk/gRc2P3+Oeo5i0Q+DfZLyNVM8alnjeaJUXzH5+emtmbrppe
	exz0q2qjCPc3HIyL5+Pmb7eLTUnZpkJwcWQlDRV3zNQjv4nFQ+YDg+rFENZHK
X-Google-Smtp-Source: AGHT+IH/gMjjP0g+XdkGOsNfWdHLnnSiud02px63cjSz9helgBkcG8YX2H7+aezlXiTjiRrR92FOvw==
X-Received: by 2002:a05:6871:e418:b0:2e4:4617:f6e1 with SMTP id 586e51a60fabf-30cd0da6426mr2386858fac.2.1755184695301;
        Thu, 14 Aug 2025 08:18:15 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-30ccfe6bcd5sm702265fac.14.2025.08.14.08.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 08:18:15 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-74381fa6b15so552979a34.2;
        Thu, 14 Aug 2025 08:18:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdYtFu3f/DwAXTk9sS3Zt2Pqq97KyK8rQfxWOIitl7iJmA5pnk5NmNSu5VDreO6lkBiVDZX58mkts=@lists.linux.dev, AJvYcCV6oetMtRSLOKLzFk5MCgEqIJcXmTM6GySoRtK20WoXU74p1W4jejG8z6acx1sbBAtQ+t7o@lists.linux.dev, AJvYcCWJJPKEX6LdtVkRA9Qp3Wi3mNb4iEE8vpGWD+t/dcCoz/kOYRvkPjTNOiJzpZoDNzZ9MvZJdw==@lists.linux.dev, AJvYcCWyD7Nx/SpsBjXRBIiwoMRyHgBjMUQq22krKlVYWzTn+MwmjmG9mfxUe833Tv/3Eb5/OSce@lists.linux.dev, AJvYcCXqlAh6XhP60jl98nlB+LApwrZJ6dQK58hVIXuZy1rFHP0HUcWFn/hiK2/aBfxAvfk+z3TcKM5n@lists.linux.dev
X-Received: by 2002:a05:6102:e09:b0:4fc:b033:cdc5 with SMTP id
 ada2fe7eead31-50fe9974df5mr1305485137.22.1755184225208; Thu, 14 Aug 2025
 08:10:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-111-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-111-b3bf97b038dc@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 17:10:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnN+4B1=RhOOHZ9mCN4e4WnfjtY_HO1t+176=dSs26Qw@mail.gmail.com>
X-Gm-Features: Ac12FXz03sJgdAZuxBhvZVUnciJ_u8JIfA74KaWnv048j9en2I4ZzU7p0Ef3ecQ
Message-ID: <CAMuHMdXnN+4B1=RhOOHZ9mCN4e4WnfjtY_HO1t+176=dSs26Qw@mail.gmail.com>
Subject: Re: [PATCH 111/114] clk: divider: remove round_rate() in favor of determine_rate()
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
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops. Also all clk drivers that directly calls
> divider's round_rate() have been migrated over to determine_rate(). So
> let's remove the round_rate() clk ops.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
