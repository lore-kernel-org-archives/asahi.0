Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645582F530A
	for <asahi@lists.linux.dev>; Fri, 22 Aug 2025 11:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755862370; cv=none; b=kkt8WdHApdfPSqz8kW74VSRrQrHxXq3VrFohGcXJkT29VDsaEO0IElgP+iBQXH1OZabNxyYRVK36q7INagwe0C/VC8NENKv7b7eiRuQmqiyAuNYgKX0ct2PSGBd1kxrqMvj+UdDjycn91pAa6bswxbEw+CxmLlS73PSi05hkuoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755862370; c=relaxed/simple;
	bh=L8r+qozRR4+oRg0gjEnUdgQIlMMDMWyJ7V174VmYI18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jr7Us6l62sv3LDbmOMZ4MExsVKizWvRRZZUHWBjmHUKdFoLSVt37SHHu6EuGzFk4Nme1GePoY6xK2vKHiAQT1XOj1QuPJy0Jj/5Y2tQsRzxLUbZYqwitc7esLuYHVgqO2vVK4hEH2pZ07QbgmduZiGEoAhbj7txp8kGzdBUBnvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U9zh6PWX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U9zh6PWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755862368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=szopGzlKxzQVjhy80Hyf8D8Trqw2L0U+tNPu86d0YYI=;
	b=U9zh6PWXG0dtBQhuseXkdivUFODR2qg/DjZBDT98Ahg3liNd35S8yZkwHW6eO7gbPZIeOp
	w06BBAFdFZiBDKCWsVOIuUvRzUe5IlGmk7vBjl7Cw8gV9T08k5wad13AqzG4u33cBePZnU
	hZKmkfXM+Kr8Y2KZevTBblNe4SWTnzs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-wN1GeejlOnyU8x_VB04gXw-1; Fri, 22 Aug 2025 07:32:45 -0400
X-MC-Unique: wN1GeejlOnyU8x_VB04gXw-1
X-Mimecast-MFC-AGG-ID: wN1GeejlOnyU8x_VB04gXw_1755862365
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e87062832bso522372085a.2
        for <asahi@lists.linux.dev>; Fri, 22 Aug 2025 04:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755862365; x=1756467165;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szopGzlKxzQVjhy80Hyf8D8Trqw2L0U+tNPu86d0YYI=;
        b=qXD9afnic8opjQfquNhj19TD0NFheMrRUruaJQDFRVV88OeiVxUBunXYQmH+56ggYr
         Yfy+rJj5kK+g/oKEsjDMoFLuOC1ANCEokH5f6HxV3McFpabOPD1vxsWibHjWT3aHK/4s
         Q0xqTjUt7CWl9B1S3H62C6E6WLWJo+1DhqwtF9PMbpR8CDtoZmgcIkEK/Zfk+T+xATWR
         xiHxpggZ0+B61CokASYMkwdxcZLPFOJbTPSlUYGn5d4qzptmITqRt2p+0jcWsTXltY3A
         9TjgMhSdroJ748QR+MGmCZSLtal2efknp8Fe9qSRIEc3aLo/XzDRyQQC6xYmc3l21BxA
         dNRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbOGMngdK3bFLKy/OfmkRlfobQ/+azoL6qlVNb8qzZGmdxSCBX1o5Va4XVccGmX3JV8i5BVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWYO1+ZT2M2TDUJDgjAT/Oqr8a/3Sin/osXdbTDVY/gYcXtVP/
	IBhENJgpi9/vFqqTTN+sOssxNaXTzvHJYeFH6Wu6bokbFVpY7qyzNR4ClKcdVhAGiGKmNzVznkF
	suN0M096CDsEgSz6xVzZ/v+kuUXbZOenFPxU7LfB/IxxLNWA5dXW9hxd6
X-Gm-Gg: ASbGncsF/+0vwZcFti9q22zrngTGE+F5Hhm5HZE0laUJjY1My48vl4DrzuCX5i27Dmt
	r6kihppdwFaefK3W3ObIinuAUbisWwU8r/vd/F5BCAmJb4aKkuYAQuKt+hfHRLrjKiBvQICbq+s
	D4AwDkpBMLzTlC7q4QgPVvvx8As0CS+5puVC9aLRQi+USzxm1WYzwHkP6BMqmtBwP/CAELlX1or
	AaAttsrCAXV3twOyIVV6PWjl0F28TU/USfaPBgqVbLiH515EWZRv6W8j8PMIkTHADWm9ZsNsGyU
	t6BCIMig10XsjaswLgL95Fi4qdubCrt4gEPYs3hnH+VP3S/O2rkdmfk1G1v36X2YsK4U5uHNnAM
	MZmTAzy04nTq+iGsvN/Q=
X-Received: by 2002:a05:620a:404c:b0:7e8:46ff:baac with SMTP id af79cd13be357-7ea10fc7a12mr283052985a.1.1755862364399;
        Fri, 22 Aug 2025 04:32:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmUibDYWQCc5l/mEz36xU/pWXO/c0soUOFhWHapUhi9osq4o9OwXIif6VsGjeizcb9uRTquQ==
X-Received: by 2002:a05:620a:404c:b0:7e8:46ff:baac with SMTP id af79cd13be357-7ea10fc7a12mr283046685a.1.1755862363659;
        Fri, 22 Aug 2025 04:32:43 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e1c186esm1319562485a.68.2025.08.22.04.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:32:42 -0700 (PDT)
Date: Fri, 22 Aug 2025 07:32:36 -0400
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
Message-ID: <aKhVVJPEPxCoKKjI@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <1907e1c7-2b15-4729-8497-a7e6f0526366@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1907e1c7-2b15-4729-8497-a7e6f0526366@kernel.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L9L1I9sGxMqMg83rvgtfVoAWmJ1sx0ffC33y7aT8W-Q_1755862365
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof (and Stephen),

On Fri, Aug 22, 2025 at 08:31:08AM +0200, Krzysztof Kozlowski wrote:
> On 11/08/2025 17:17, Brian Masney via B4 Relay wrote:
> > The round_rate() clk ops is deprecated in the clk framework in favor
> > of the determine_rate() clk ops, so let's go ahead and convert the
> > various clk drivers using the Coccinelle semantic patch posted below.
> > I did a few minor cosmetic cleanups of the code in a few cases.
> 
> This is going to create huge conflicts and I did not find here any
> merging strategy.
> 
> What do you expect from us here?

That's a good question. You are right that there's a handful of drivers
where this will create a merge conflict with some other work that's been
posted this development cycle due to other unrelated changes. I suspect
the majority of these will still apply cleanly.

This series doesn't remove round_rate from the clk core, and I'll post
that change once everything else has been merged across the tree. I've
been trying to catch any new round_rate implementations that are posted
in review.

7 of the 114 patches in this series needs a v2 with a minor fix. I see
several paths forward to merging this. It's ultimately up to Stephen how
he wants to proceed.

- I send Stephen a PULL request with all of these patches with the minor
  cleanups to the 7 patches. Depending on the timing, Stephen can merge
  the other work first, and I deal with cleaning up the merge conflicts.
  Or he can if he prefers to instead.

- Stephen applies everyone else's work first to his tree, and then the
  good 107 patches in this series. He skips anything that doesn't apply
  due to other people's work and I follow up with a smaller series.

I would prefer to not to have to post a v2 114 patch series if
possible.

If I don't hear back from Stephen about how he wants to proceed, then
I'm planning to send him a PULL request the week of Sep 1st.

Does this sound good? I'm open to other suggestions.

Brian

