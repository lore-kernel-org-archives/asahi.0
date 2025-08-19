Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF4831AF36
	for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596887; cv=none; b=QDGDxSiSB01kr/rY0xGfTQUoo2oC+6QB215XxathYRF/7mRhxlP04PNeIz7SHJ+SHnHSSWPP0ITtNTWINoOswntLa3q0F/i022zr0JM9/kBNDh64sKSSJZ5rhkTXIE45/gSP+y+TsBXnFzKhYv7J946HC3c7Qcv3XYqD3ZQNG9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596887; c=relaxed/simple;
	bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KawX1kQCUq5C6JunFvYs4oyDltSx6vHp3S3Ltz/IpdTUiYp4Uq+IKLcahgcORip0vkgzhbzBfOFldzuWFfWacrwXQxV1sxlRuo6eKfW4UlhndiG77x9k1l4kVxA2laJdHOCstd+mzAemLwtA3v56/Q4abUB2j5EJ9EdSZiqKAn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VDJE6v1x; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VDJE6v1x"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55ce526a25eso5081472e87.3
        for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596882; x=1756201682; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
        b=VDJE6v1xRoALL3QxgkctA6wWWVs4I6LnGcIH/GEtp6g1HJfcLtYfkq0w3yW2TzcNai
         dkHhTPwQ7/hnH2EzAxSa5d0P9fFPuB1A+/tdb7vIL/TIb9RzxO8sYxZv8dDnX+A6dGI9
         1j5RGZUU2ZEv6kgwjpwDSxK88fk9php6F8HcRhmEQB1yarZNzj1J8cWfNPpBl2USbCtT
         O4mYFrSKE7IcMHv7sQ9O0zQBkIkN7eyPvl26C88gFzNCO0rPrxFIOXhd3RcDlgfE3BvR
         y91o2YfGb7zrBZ2zm4dfowxcxbGoNkphgTXhjeElkCLf9WGstIJAROTsR9WNKCTdpR6Z
         Vn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596882; x=1756201682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
        b=TPcosI/eRWWiWqRUpCEecuKbJHTbfR5VrNaSRaRMtTP/1qf/YGKLGbB84Lu8C1UOrR
         6t0KIqexHAKdC/4smT/d03cS6aEnC+ayYHKV9UkkEq3SemNCgwc2SM7exfB13ZR+h7jH
         UTZ5+4iJQNlMbXCncKw0E2YVXxfLKRHYbfsPmGHdhuixKd4k78shZ06VcWWAnfvJUHjG
         rYhcgaNj1+ZixzxoOsoE6g0/aiITQSwi5GPWzCC9DuCagojAKSrTCQXfE1oCRFkIdY91
         VAiJSbmUD7rik1SKLhS/TaziXdVm+HKme4dCY56n79PHWzbjDP3KEPudlbrAO10oUmX/
         Fltg==
X-Forwarded-Encrypted: i=1; AJvYcCWuq4A8sdtXeKgB0VzKCArk2gYODSTuyzQb2BQ9mBsMhuM6uYllXe9mt7OLETzobpwIvq3O6g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4c1slq4Oq75fz8NgfeDWKiWpu3JmRH3ANgv2Yenoe5eRWR4e7
	l6uUkltL8iUt2a0AuOKes9UMRi8Ox6F5UK+Q6b0envrQ8f9PDNlOLjrTZTi27NfabWMy8Tk9BZI
	C3+k0jfArfY6pE6+rZ6bda30UC1qnzca1pZXgziAfHA==
X-Gm-Gg: ASbGncsTQDptpEKhTRPIXWFNNwAOohY0csgYdfnZQdt414rDVNlOe7kU2xEcjKhUWJx
	CMUAzLEFq+WGi/TbSUt0S6NUMiG03/tFyof8g9qBkrqJU4DTy1lRVtwsFg8jNzKopje+XWoNqe/
	5kvk7OoESskGwyy+vZ5xakQ3pkDJwMvdxCwJTQG1qWUmMrTW0w9xvjwH0+51IIjOg1J2ady5eoT
	vJfjTw=
X-Google-Smtp-Source: AGHT+IEolFO6aeJABYr1hNPxQasixpAjIgJqFl/o9dwJCRxvFjpbc3xagoFqiJPlswYsIWJYgR30Ss513xxDR9NTkTU=
X-Received: by 2002:a2e:b8c1:0:b0:332:45b5:d68a with SMTP id
 38308e7fff4ca-335305347e8mr6104861fa.5.1755596882380; Tue, 19 Aug 2025
 02:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-108-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-108-b3bf97b038dc@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:47:51 +0200
X-Gm-Features: Ac12FXyAMutAnmM6yYaTGFkQgGmOcrXudlcTGzS_av87nGHcGPs7Xb4FZygWAbE
Message-ID: <CACRpkdZonmP8rSQS-rwzthNPv_MyddMReZQaD13b1qkRexxWyA@mail.gmail.com>
Subject: Re: [PATCH 108/114] clk: versatile: icst: convert from round_rate()
 to determine_rate()
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
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Andrea della Porta <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
	Viresh Kumar <vireshk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Alex Helms <alexander.helms.jy@renesas.com>, 
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
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 5:19=E2=80=AFPM Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:

> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
