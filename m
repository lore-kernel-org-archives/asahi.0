Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE032FDC37
	for <asahi@lists.linux.dev>; Fri, 22 Aug 2025 13:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868163; cv=none; b=u36uqwSpotGHTiLvxtBQ2bDNfTlYOf3navcZTAHFTI1TkRMPnSgchthBKnO/UWVmSM5FXYEaQrG09AxJsn1AapoBlMOyNik2x12cSEpaerRgaj7U3f2hHzAWUaPBCuujtR5bLLRsxRiwThJcs1J+/8MaeTZtxcVbAcklIQQV7BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868163; c=relaxed/simple;
	bh=O0asdK8SeOVtorPLNtX9IHFVw5PwpWz+Y/IXMS4KmCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bopPcUvUe8Z3HQ+vQLY2rdkiyjh96RFpoPduBfjeMMmXoHSClAH0rwU4MkkoSrEX139qzJou3pKEXyxpYUPuTv8Srb2Yj/+rLOQzziVT+2Kr/Nt0ddnwyuBsVO6p4yAGOefv4c+2V997Qy7uLRyDDNOMIWN1xCzR3JER9uHmUH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O2XOgrm8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O2XOgrm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755868160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a26YwWriI/cAZNSFk7MZK1EJDFmLtTh5uMUvUQRBu1c=;
	b=O2XOgrm8cUhbjKBAjb+XSahGNMIWKJwM8IUEvTnAqwszBPk+D3irzDEPsRKEk2GsSVvjn0
	8BVRU1mxTu5gdtNUN1aX876SqQq2Sc9KiiDPbwa37X+iNyxTB6ETsRRFLis0XXnSZSjwQB
	ryky0b/w2FTIIx/Qa3Y/nROxq73nZbE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612--OhLmBUPPyeIbh0rY5OqFA-1; Fri, 22 Aug 2025 09:09:14 -0400
X-MC-Unique: -OhLmBUPPyeIbh0rY5OqFA-1
X-Mimecast-MFC-AGG-ID: -OhLmBUPPyeIbh0rY5OqFA_1755868153
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e87068f8afso530492185a.3
        for <asahi@lists.linux.dev>; Fri, 22 Aug 2025 06:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755868153; x=1756472953;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a26YwWriI/cAZNSFk7MZK1EJDFmLtTh5uMUvUQRBu1c=;
        b=WZpu0YLSGXvLZTZj8sPGXwVxScu6NPQzWVYtuohhTXOPomRAyKS3CCByGWD/Okx10Z
         /KSIJCfhKr1JJFkLPS3F6cC1TPsbT2UuQnb8pQ4EGnw0XlDSGlonpvlLJEnxeu+ueA5a
         y626coHrAq30ezq9xWStlp0dAE03m94Vc9OgMs1mqpD1BmdkbzM27bmpsykZfav0c2NI
         XT91JjAdxJScQZfthl4W/X6fNuktbNGis6MfXJdlcioqvG8WNKIfBdIAIJJTUdE5rA60
         IHjZCGRv2mpyRe0Q63xp60Z8W4ZVfQfeuN9WascJRQPkTPOu9jX7oNgWUyu49AA0tovS
         rdFA==
X-Forwarded-Encrypted: i=1; AJvYcCX4wSi1qIp3wHOgxZ4DP7MYPtU3b7ZSbJL+v9NTGVtTi3GG9zWHoDrPFDr5XG8EfCj/Z40zqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMN9f4fXxCIxwlyMWvzv/XLBlwVtkJff63F04Olj+wgFqDDFOJ
	tEbegUXsGhIP2iGFozCmBZ9yuSPjsuGADE0FfP/m27YSZQG/DrkzcD6QD5JcwPThykt4QfjPGSI
	6eDQvsH41Gj+7w2xXEfDsuML2GA3mT66RuFdVToc5UDmSxUEfkK9+TcQZ
X-Gm-Gg: ASbGncssyNIQlPTH3KColR6C4/ePUGdaXK/94nuMUDC1i/iGAh74EujoAP9Qrjhg3RZ
	t9mfMDxkaSWB1ZwW5EllKv+hczfUoG19THaH72oNYEK2qp/E1ZyWJkRyfY2HoEd9TUU5xFxJai7
	B5e0o/x4+0gOWT9Oit9eF+H6C1z/H3Vela6vsX+9OAYb1Ex+04o4F03zXdS/JjT2lDj/sAB763F
	+teE1e4hryyyiR6fhcR9Wb/7V3ECnt8kSK4dNLpH3Kt70X5p5y7MPRi/jzJ9WUAABb321ilP6MO
	zV9Z+JFEIj0vW53UnksY9Ls0CiqJo6NMdBo+xkIe9RYjnPlkkZpRZNmyC1CAoaQvM9xo5OOfd1a
	gqAYd+tQeI6c72rHfLMc=
X-Received: by 2002:a05:620a:6cc2:b0:7e3:6a01:e6ba with SMTP id af79cd13be357-7ea10f538ddmr299219885a.8.1755868152181;
        Fri, 22 Aug 2025 06:09:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW1uvjDvOlgb0eZoGZSzJHV+ZTat1aB9dEJTqNDB/h4VuJNJ3Q109+V4G1CkIe7Ilb4zQPqA==
X-Received: by 2002:a05:620a:6cc2:b0:7e3:6a01:e6ba with SMTP id af79cd13be357-7ea10f538ddmr299210885a.8.1755868151398;
        Fri, 22 Aug 2025 06:09:11 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e1c9b9dsm1332247685a.70.2025.08.22.06.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:09:10 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:09:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 000/114] clk: convert drivers from deprecated
 round_rate() to determine_rate()
Message-ID: <aKhr8NYhei59At0s@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <1907e1c7-2b15-4729-8497-a7e6f0526366@kernel.org>
 <aKhVVJPEPxCoKKjI@x1>
 <4d31df9e-62c9-4988-9301-2911ff7de229@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4d31df9e-62c9-4988-9301-2911ff7de229@kernel.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NmuLAq086NxTiMloRWy43skpSyWR9-D9EG52sv45HE8_1755868153
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 22, 2025 at 02:23:50PM +0200, Krzysztof Kozlowski wrote:
> On 22/08/2025 13:32, Brian Masney wrote:
> > 7 of the 114 patches in this series needs a v2 with a minor fix. I see
> > several paths forward to merging this. It's ultimately up to Stephen how
> > he wants to proceed.
> > 
> > - I send Stephen a PULL request with all of these patches with the minor
> >   cleanups to the 7 patches. Depending on the timing, Stephen can merge
> >   the other work first, and I deal with cleaning up the merge conflicts.
> >   Or he can if he prefers to instead.
> > 
> > - Stephen applies everyone else's work first to his tree, and then the
> >   good 107 patches in this series. He skips anything that doesn't apply
> >   due to other people's work and I follow up with a smaller series.
> 
> Both cause cross tree merge conflicts. Anyway, please document clearly
> the dependencies between patches.

This series only touches drivers/clk, so it shouldn't cause any issues
with other subsystems, unless there's a topic branch somewhere, or I'm
missing something?

There are some drivers under drivers/clk/ where there is an entry in the
MAINTAINERS file that's not Stephen, although it wasn't clear to me if
all of those people will send PULL requests to Stephen. I described on
the cover how how the series was broken up.

  - Patches 4-70 are for drivers where there is no clk submaintainer
  - Patches 71-110 are for drivers where this is an entry in MAINTAINERS
    (for drivers/clk)

For the clk subdirectories that had say more than 3 patches, I sent
those off as separate patch series. The ones in this series have an
entry in MAINTAINERS only have a few patches for each maintainer.

As for patch dependencies, patches 111 (clk/divider) and
114 (clk/fixed-factor) should go in last. It doesn't matter the order
everything else goes in.

Brian

