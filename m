Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3527A2E9EC9;
	Mon, 11 Aug 2025 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925512; cv=none; b=K9oOzrZMMYrGdQnFtSwxhQw9D4SVNfbPqOdUONQzWmoCzqFyfpt0Zmk7R18/ZNdpjuE/hWABMB5hmOJ2DllQ3QcuqEKMVv921nMVAyyxeZKiY1CF7+n6GPwLxUMa7jk2Cm0fJFkDas/4C2Oz+worFcy6M3QVsFBTFq0C0pEA1XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925512; c=relaxed/simple;
	bh=mWXRJOoopfvqnFa0JdNdGB3FYQy6v1MKmQSJbGeAteI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ka3FCLLEwQ9RFr2qDTbkuwl7utA68FgLe8f+P46LYgFATEhq3XJ+qWcYirxr/iX5eKHSH4H/SXB2W1wkJTpOCO2QUB8UJXi2KDaTYOSTg4tUrvhY2bZzyUt1sUQaC5A2NyCSRV+fkc9PQPRBS15msoibWLlq3UWQoTIdy1d13vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpQz24gs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpQz24gs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F81BC4DDF0;
	Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925510;
	bh=mWXRJOoopfvqnFa0JdNdGB3FYQy6v1MKmQSJbGeAteI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DpQz24gs9w4CvRuQ+KxQP5c2NpI+iDLpC21uYEt8JB6HByvlxKV6ndPv0X6NwDBGw
	 eHbNSVMeIwK4DiKwYr9cIYkoIG+RQWebU1D9Q8oownnPTw80eo4EL8f2DfAsx9t2OY
	 DWC0TZiv8vHvvagUJA+eqF9BfwMU//gO3y/tjKPNLQ68qCn/WPyVvKUZjLgNQykbE2
	 xzo6HsjmNHQ0Xg78Upjnfb8m89Tap37x1pZHG8uv3l5kf8Zx0I9iJ7yZMZdkYb8a8T
	 ESGhGp93bktTdOgWMGQEcLQRuZsAE2xmk5pzWzCqcfanOXQe/LjAuyPTV6gBybrGrU
	 nPeo1Et21c5dA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F85CA0EC4;
	Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:40 -0400
Subject: [PATCH 048/114] clk: sophgo: sg2042-clkgen: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
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
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
 linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=2414;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=WakJL2SorLn8f12eiJrmBTcs+madt35adpNUwkQ75KE=;
 b=+tpAnh+QV7SLecJ2w+x7Pk61cQTHuoqMyk6KYwEsokY1RB+s7EDzXBIEGG3wykBiPPU4N5yvX
 XQygIbUeXdsA37+QwiM/SyFZ9ewZHKOFeO/vEZxqIfPx2c9yCIoG2Va
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
Reply-To: bmasney@redhat.com

From: Brian Masney <bmasney@redhat.com>

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sophgo/clk-sg2042-clkgen.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
index 9e61288d34f3757315702c355f2669577b29676f..1d3b1656bcf2e6655e0299e68ab39f32189744dc 100644
--- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
+++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
@@ -176,9 +176,8 @@ static unsigned long sg2042_clk_divider_recalc_rate(struct clk_hw *hw,
 	return ret_rate;
 }
 
-static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
-					  unsigned long rate,
-					  unsigned long *prate)
+static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
 {
 	struct sg2042_divider_clock *divider = to_sg2042_clk_divider(hw);
 	unsigned long ret_rate;
@@ -192,15 +191,17 @@ static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
 			bestdiv = readl(divider->reg) >> divider->shift;
 			bestdiv &= clk_div_mask(divider->width);
 		}
-		ret_rate = DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
+		ret_rate = DIV_ROUND_UP_ULL((u64)*&req->best_parent_rate, bestdiv);
 	} else {
-		ret_rate = divider_round_rate(hw, rate, prate, NULL,
+		ret_rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, NULL,
 					      divider->width, divider->div_flags);
 	}
 
 	pr_debug("--> %s: divider_round_rate: val = %ld\n",
 		 clk_hw_get_name(hw), ret_rate);
-	return ret_rate;
+	req->rate = ret_rate;
+
+	return 0;
 }
 
 static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
@@ -258,13 +259,13 @@ static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops sg2042_clk_divider_ops = {
 	.recalc_rate = sg2042_clk_divider_recalc_rate,
-	.round_rate = sg2042_clk_divider_round_rate,
+	.determine_rate = sg2042_clk_divider_determine_rate,
 	.set_rate = sg2042_clk_divider_set_rate,
 };
 
 static const struct clk_ops sg2042_clk_divider_ro_ops = {
 	.recalc_rate = sg2042_clk_divider_recalc_rate,
-	.round_rate = sg2042_clk_divider_round_rate,
+	.determine_rate = sg2042_clk_divider_determine_rate,
 };
 
 /*

-- 
2.50.1


