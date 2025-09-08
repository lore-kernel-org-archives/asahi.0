Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C18230F957
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 17:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757351530; cv=none; b=Lrn1b8Mb6Ey2V/sTNHzhKg3vyT6v/if4x8N+4tJjYV5JXPpMNxr7KDuBiWtxrbPHt8FP6zlTJSZ7smuv45msBjeTyuSItM7x3MtFWNVdLiDNb9DG5Gv9U9p+QFjslSRMuDPpP8PXJUKYHf4e/iRo1FpfCaJaNgwr1QnKYsTwjok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757351530; c=relaxed/simple;
	bh=N0Ew5uLxMWlX2hxvzxeMznJDWzQfwf1IVExLfD9g+8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CWiCbN4vKrqc6ZMWQee+adNZpGdilyOX1l4nIgv7rTUanFbLU4Nh3AGi+87sYtJsFc0aAKiv+tlga30WUlYGnzxy3zlHrtOhWOciXpmghQ521pNmzG/KJlrXRhFX1b04pJ/hT+tgSJ1jA7BVwzVc0f6hBKjJIclvhIrLSTzk70Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZuHq0bgQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZuHq0bgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757351527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N0Ew5uLxMWlX2hxvzxeMznJDWzQfwf1IVExLfD9g+8c=;
	b=ZuHq0bgQveon6kp40mnKKhpBoBWJdfWnY67qlHPz9++SQVij9nh/gwl/t2W/HG+saDFKCf
	nvUu2YmR1+yWvLYAD9GVp8F/2TrLvwdYw19ooinDxC9ot27Edcn566GZjiykKj8LSVundK
	qnXN8C67pACLu9F+Y4Rld4u7G6QuGtc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-n4kO-BriPtqfL4bZ0330kg-1; Mon, 08 Sep 2025 13:12:06 -0400
X-MC-Unique: n4kO-BriPtqfL4bZ0330kg-1
X-Mimecast-MFC-AGG-ID: n4kO-BriPtqfL4bZ0330kg_1757351525
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5ecf597acso88645931cf.1
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 10:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757351525; x=1757956325;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0Ew5uLxMWlX2hxvzxeMznJDWzQfwf1IVExLfD9g+8c=;
        b=QwkZqky01HDuseu5Jqm+9O4jy5jr307reJqo5HNfD7/YSNpU2wje82LXMjtipG+ZI6
         NCZBczJ1RODPcP51gqK6G0lChMcGCbMNE/YTAi9HBTSCmIzti3xGP5eYlqxFqYIFB5Zc
         hiN7aYoAuYQroxUPd8IbSsljXVbMUZcOWHtwGlc0mD5qal2nupMM4033zbEp5mY/0DW/
         CqTrTNx8dFGBR/B9Vbzbr5RzRZoa04XyTNkg5a7WQFcpI6B2Nzc79XAuPHIQ1KJO5Xpp
         TdQaw4ex5L6JhoJI0InOCMDD5SXWVVIjRzUclp4F4m+Ts4eaUCk6KEhIsD6xb1KvWmml
         MX5g==
X-Forwarded-Encrypted: i=1; AJvYcCUpjWd5u3HA5MvvtUBfmrVdQMT/EtL4KtULSsJDK5xXZSQHOPJFvjmQbRqf1PR457l+fO89eQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2qd23n1HjPesGpYJB+m63tWOCOdirxrQMBFWgMD+xCcWjFWw/
	Y5mWb1Ijk4FhBUEppEhWLuKFSPV18/cEFI6D9pUAoIILrQVZLGohjzwkg0CZGi2PlIjZgesIlBE
	9a/I8R9BWj5uJoQ71fP4bUD79YdxiyfQgutEcyZtqMi5pPyjEIgKSXI5U
X-Gm-Gg: ASbGncswemV3A6SCiLWSbjZMBGILVnEhV/RHx6uKekO6HT2Jh1NAENBxlyOfyk7Ym9F
	SexqgFS2NFAAMOSTyPGf8ItwieIILWxdPEGc6cEqbLxxrVyQ4Zj7soQf378lVhFfQScvSPTDy7O
	ppyYCNi9i1CTUFX7zhUcMxNl4Z0G1tvasXeuHTeE5AuiwH+MQNdZq/XyCmxOV0eqWsvyMgGXPp9
	D3SH2nEnKqQkhH+4zEf2oSlZWvNbiyJ/RDSfwqqn436LhHIiElwwWBkTcGX2lqDfCBLAeyOo8KH
	5GgbGJ+5QNaPccSH9rxk+LmG5Miwzg5eL5gbHbIMajGWLdR+vsU0x+97i84=
X-Received: by 2002:ac8:5a12:0:b0:4b5:d739:6273 with SMTP id d75a77b69052e-4b5f8490345mr93489621cf.75.1757351525450;
        Mon, 08 Sep 2025 10:12:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVez0JttMWAhr/EpA5S3LWdvkJoIrJRGLs+fJ0AEeH7TgyS1UoHb0txwN7TUYVZQswHIwQlA==
X-Received: by 2002:ac8:5a12:0:b0:4b5:d739:6273 with SMTP id d75a77b69052e-4b5f8490345mr93488361cf.75.1757351524739;
        Mon, 08 Sep 2025 10:12:04 -0700 (PDT)
Received: from x1 ([2600:382:8507:870e:b6f8:ee72:4f09:a16a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aab5a062fsm1122872785a.48.2025.09.08.10.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:12:04 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:11:57 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
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
	Krzysztof Kozlowski <krzk@kernel.org>,
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
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Message-ID: <aL8OXeFC4N-J_kvC@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G53iygFDWpA3T5v2l4bYzp1iDcuIsFrsuejcfRJxrYA_1757351525
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 11, 2025 at 11:17:52AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> various clk drivers using the Coccinelle semantic patch posted below.
> I did a few minor cosmetic cleanups of the code in a few cases.

I included a subset of these patches in this pull request to Stephen:
https://lore.kernel.org/linux-clk/aL8MXYrR5uoBa4cB@x1/T/#u

Brian

