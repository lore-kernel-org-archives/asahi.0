Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34232E92BA;
	Tue, 12 Aug 2025 09:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990260; cv=none; b=T6w/d8KNN6Us6YnPvBjFGxBUS7+IEzrvwUtC5ebOqsfsCsMjbFPoLjVafQDESyXgwRGRWIOxRqyW5bF1ZGXEt+Eqrjiw7GCzmG0Gwjis5hGZeXjggf9nZ9yBuMSHcO/6yxsbWUewMp2spKpE8/6g77ZXqvAphTkiUbr62bk8qjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990260; c=relaxed/simple;
	bh=MgJgkqy4X7VBkdUHQgmnpgJcaBRPxSksxSZ/rty4i9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkFTQP/zdQsAIn4053eSAtP/TBHZhklJkrUgxWOhfO/guCQzerTeKc9u6+KIE35q9hZ5TycqakRaUuMAHkp3feh/avgRXZVncB/mYoK82vHzgauEWQ9xhoPvJjS5tJ/voWljcK4yAzTyxImqYHJ228ox5xuPMo3E8WKdf3fWmzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKaG7Lkd; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKaG7Lkd"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-433f1f97199so3213463b6e.1;
        Tue, 12 Aug 2025 02:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754990258; x=1755595058; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OsZfh7jnCZM1qIdbyzshEpg7lU806F0f1eIeVxq5DZ4=;
        b=IKaG7LkdKSaIyDyy6guQnYqU7AYO7o8uI2Z82rw0TWQ0AujxCw7NH+lZbGOOeCzBbY
         XkutYqPgKxtVZVi/h0KLRdsfRQmpK5DtUxABhLKj5nqM2hA0yiwsDiMYBrg9MCHoqjUI
         cE6A7PlCm3v2Klq545X+sVLFIUZbO8O2RpWCInj9zuQREdOVyDqQMeS0k69CD+bFIPR3
         wIT/R3dS4tx7FziP592VoXX97boLj23xNfpHw4hEmhGOScwGcc0ogAwBHHNy7M0/hdAK
         vEDU15hdD1Bk9PTwLzVrirmQjWNYe+kuviJupDRwJFbzyQhr96wrNWx6XcuCxzRXlKXr
         zJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990258; x=1755595058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsZfh7jnCZM1qIdbyzshEpg7lU806F0f1eIeVxq5DZ4=;
        b=Y/VZedIhwqdFGX27hEyFl2Gi7v6GSbC87ONYKkD7uGSS8Gwi5kyiv5UmbuzMhzGgMA
         HNANox/NYwrYbP2c8ifqRIR+YzaFaRNI4I/7F6YANxWBgaIC77HT+ilPRd0y7bm87LZ1
         /rtzxyM2aF2GmoEApIauUw2xwhVUKUQhQ4u6TysuQ/bLVOVUb7eY9LTV84TFb+fcmMQ3
         nybbqIa03i5E63pAHsG+KNZcyoxOykeLdAaHJ2dTExEOvpbYOaWWMiAEQ3YBjPPyqeqg
         3jyziZNikzRtzzeCWrAmPLxsSOyp1ly3NhEJlv/hWm1ypry0ylMiTKpV1JZnpmUbaAdy
         sGuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCfog4JgJSXRmFxrox4ap8TugWENGFShvqoZLwTxxtzLpfslh5GXlxM14ICQENHThtoL5k@lists.linux.dev, AJvYcCWjGhzmjHZmgmE0WWmULx3UxD8JVSUmsJgXdxKRdolhjPa0WDh/2Aj0RS/+FaAsD9HRzipHOPp6o50=@lists.linux.dev, AJvYcCWs4OZOd60uIAQrd9MZ2TwW0CCYJEF7EVl94bgjaneN8rd8WuidlDt/CSjSl4prVfhoocmmaw==@lists.linux.dev, AJvYcCXQxC4l6XZzaso7wkBL9XWlUjfl6xOZxH+UecL214ZkLd2wWugo8oEwrr4/qy8d0hnG/1Up@lists.linux.dev, AJvYcCXyHj6DJlUIUKjlkssNUQJ9f7NF1xy9NspojJQrQU/Dy5FmLAV5xGf1nAXNAD1VNGdndnErxgRl@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5AhOIDyvU3gaHy/Fnu/lEAXu2c4FV43VX3SUhN79w9krUIdRL
	oXozM83EZYGWfx1LqZFIdVxKdTo2QxVcqP76jSEqOFc5BpadjeKY6MgQHuzuTNWEO0o0bFFi84D
	EPUfvnJY60TgNHEJk399FzOz/A4W9mEg=
X-Gm-Gg: ASbGncu1Wp29wAHQQ1xB4xErogysa2jeFRyZVeMrFbbQfc2LfqhBvdSiPf5wmmZqhnc
	CF8YvfEWrL11qqumpvL/PCWGM92NC/T5Vt+/032c38Hyh4eXgOCfDTgrEF/qYoQtTDDIc111jIc
	vnyfy3uakOdGs9j6VfDqshTiw8cb3TOhv5ycX7fdGg4RkL0ymH5YU+DmK0Y/39sAz4KsOrGNth0
	Xkq2IMJdG8ZxR7Ju/zrCA==
X-Google-Smtp-Source: AGHT+IGeKg+1AsHT8OzWJRaAIn4nQ5un+51PPsEFZqXXG7zkpSAAOASU4iUV34U5Po600E/i/8biPwPW0aGpB8iXi3U=
X-Received: by 2002:a05:6808:30a4:b0:433:fd1b:73f3 with SMTP id
 5614622812f47-43597b3b9d0mr10072751b6e.5.1754990257436; Tue, 12 Aug 2025
 02:17:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-53-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-53-b3bf97b038dc@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 12 Aug 2025 17:17:01 +0800
X-Gm-Features: Ac12FXwWvkLhtiiPhiHwQqmN1cgPTqDfCjN_x0Nmsu9rzni9NmKJK-aaPD6k1MI
Message-ID: <CAAfSe-spVF480JyBwxFN=KH82CdKNR0oY87oR6fsR+-CUH356Q@mail.gmail.com>
Subject: Re: [PATCH 053/114] clk: sprd: div: convert from round_rate() to determine_rate()
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
>  drivers/clk/sprd/div.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/sprd/div.c b/drivers/clk/sprd/div.c
> index 936782c241271832c0a1957c99cbecc287351d1b..013423881968002d29c4e9536e7cd7b944779196 100644
> --- a/drivers/clk/sprd/div.c
> +++ b/drivers/clk/sprd/div.c
> @@ -9,13 +9,16 @@
>
>  #include "div.h"
>
> -static long sprd_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -                               unsigned long *parent_rate)
> +static int sprd_div_determine_rate(struct clk_hw *hw,
> +                                  struct clk_rate_request *req)
>  {
>         struct sprd_div *cd = hw_to_sprd_div(hw);
>
> -       return divider_round_rate(&cd->common.hw, rate, parent_rate, NULL,
> -                                 cd->div.width, 0);
> +       req->rate = divider_round_rate(&cd->common.hw, req->rate,
> +                                      &req->best_parent_rate,
> +                                      NULL, cd->div.width, 0);
> +
> +       return 0;
>  }
>
>  unsigned long sprd_div_helper_recalc_rate(struct sprd_clk_common *common,
> @@ -75,7 +78,7 @@ static int sprd_div_set_rate(struct clk_hw *hw, unsigned long rate,
>
>  const struct clk_ops sprd_div_ops = {
>         .recalc_rate = sprd_div_recalc_rate,
> -       .round_rate = sprd_div_round_rate,
> +       .determine_rate = sprd_div_determine_rate,
>         .set_rate = sprd_div_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(sprd_div_ops);
>
> --
> 2.50.1
>
>
