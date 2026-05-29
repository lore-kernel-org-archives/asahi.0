Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E7C81732
	for <asahi@lists.linux.dev>; Fri, 29 May 2026 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049923; cv=none; b=J+eKJk/7bLx4P/3bsbP2O6lfq4hKfkUOAUIDBjUeGM/7p1bYxxkmWWdQR6ZXqG1Ym37H1K+9tD6IlECd0Kce/BAIt+Q+AsBMhlTbwv77uBGScUid5LOo4H8rd4iBfl6G3vEw4xGlLdrL1zuEjzkhWWhHYt+A1cfJJfFZJzJNTQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049923; c=relaxed/simple;
	bh=HR0BG2x5gStI8qVvDgUBsjfK17M95+4vrnDaD2QTsYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aqXYybN2EWaAwTkKk7Ol3S31X/YeiH/a2smW5TmIAmVzb9DYfJ9/lCMLK9RE32fz87LrwbVdI0tKNecFanss8zO0Qe5DsBIuVXunRrPuuaFuN0ATbj0SZF/CGtwS8Mh83KvHKbdHpncIpX8FXuCc5Wa9cLsfKUDcC9HSySiEZcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=anZB5nmx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="anZB5nmx"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45eedc94d37so676812f8f.3
        for <asahi@lists.linux.dev>; Fri, 29 May 2026 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780049919; x=1780654719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gRuenZrko78jZddy0UFWO+BRki0zaXyQrkNHtJpBvQk=;
        b=anZB5nmxohmHhx0MeKzlf0ac3ussNCFyihbkn5KFtVLLH8Ey4M/boSc9Bu572OZZyb
         JvqRVyaS0MRAsmVRGufFBDTnHE/uYbM72TMvNmR5K6suNuaUzw74XuCqP0Phe1uc2bet
         T3SiEXVDVXpvMnn0RdvQq8SspDNioKN3ze3Q++KOaVvv1krXoMnTaxcvTD5mEMlt1ast
         aidnNTVNX6gulYdmYn1+Z8ODQ/4fVnYNQuTyPvHF7/CWKT39MLKSWQL8zRgxXZwmkT+t
         +vdBE+Q9aIamzqQbzYZ89ZfvkairAkU1NSN3WkFM9yjAmGE0yz1ErZZLN7g4SrzvJk71
         A22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049919; x=1780654719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRuenZrko78jZddy0UFWO+BRki0zaXyQrkNHtJpBvQk=;
        b=F/3T1YuUzoWt2kUr+slsNyNgb0293Z4WnfYlx9kVfl0d9FvzZlBJd4X1qKt6V1Q//7
         4se0YUrGkPn2Pspxgaje9GL2CXD/LORqxlJhtGW3ck5I4ybY18IgmWN7i/XOwA4+pUeS
         x8ZXQ3WFLjvKXtdPFJmRkSoluiPZtPvTeKelGbabTWcyuD4wM912m14yeXVtnstcBURb
         5DefosIlCc35GhRMxA5Kw9nci6kVVCjBDUvaalGWilHDmE+dMTP3EEB7OOg9XLnLMeYv
         Ae4xp48x5YwqWrCWsvRldtRt9E9ftew4w8EBE2kTCc2nM6hr7PW1j8P0bstok/c7aOLY
         hiBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9l1i8yilsqXjY4hAmAAxHrJ1KzDnZltu/1h0eMuYTLHXkJkglVU+4OaJC5XRE1y88DXTCo+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzW2JvYLmgV9bnQOr+vaKQA3psHxc7GfidiB4id/M695v41C+qj
	iRL+1XVSmtUVE80Fo0y5kCQoB9vaathITRmiBDslcrUZqwzNDDSlWrY4mA3gTdw1lqo=
X-Gm-Gg: Acq92OHtXN1kRF+SX8b6DWVLjzGP7BwDSBcconTVspv27rqu84Vd+6KqO2rrVqbU5zi
	TnkT0n8mofWq6pFCAnobKX9Hj8EYVsSVNI9G8QeTqGXdHCKpD6xlSsBRFmiwNwf0NrT9ifpgNnq
	PKgZqa1aF+vzR/40+c6ONK9+zGyKBjXRY6PuoO9g+TkxYN5+aQHuxHHVlP1/8nLRwm3maJ0mv2d
	/VCMuZaPt1scfOJLPa2wUXaucat3PUeSOlcRW1oPNXsvG1WoCwRYnImp0XcgodK0XINO01zHqUp
	LVVtBGdDv95jnD/E+lawb0pN5agIO8uloKCpQTfaY70dbjRlzVc/clrcbXBYm4KfSdF2zS7uWNE
	O6NZ5dgFnLQ+SnT90WW2+cMQGoHbyBpFO/2+aj9/YOZSNxQaqmwvk2cR84XCraTPr+WKyp6sQ9D
	qOe6S1b3kaRxvGhYGX+tzi3Zn+wCs0REEo8WF0cJdMa8EYD+jqCtzd9dvDRIyoUDazkRoE/rqEj
	qKHyAhOsvYFxdM42SulvE+BsQ==
X-Received: by 2002:a5d:6f03:0:b0:45e:ef4a:8192 with SMTP id ffacd0b85a97d-45ef14aeca6mr4456766f8f.38.1780049919017;
        Fri, 29 May 2026 03:18:39 -0700 (PDT)
Received: from localhost (p200300f65f47db043f932d8b97293bf6.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3f93:2d8b:9729:3bf6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef354cd7csm2359192f8f.18.2026.05.29.03.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:18:38 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hans de Goede <hansg@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Purism Kernel Team <kernel@puri.sm>,
	Yixun Lan <dlan@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Samuel Kayode <samkay014@gmail.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	asahi@lists.linux.dev,
	imx@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH v1 0/6] power: Use named initializers for platform_device_id arrays
Date: Fri, 29 May 2026 12:18:15 +0200
Message-ID: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5698; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=HR0BG2x5gStI8qVvDgUBsjfK17M95+4vrnDaD2QTsYk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGWfoDIuZ0g/W2ypE62dFHULfUWoyzPSByuJOy zumyQmeqqeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahln6AAKCRCPgPtYfRL+ TsKPB/9mAyfp+pLZiIDxZa/Gq+SSHanqJrTQwpZ9rQFWh6BTlVwAzfy9/iK3DTaEC0m73vbGFfQ SrrV9RH9jd6SuuSNJEy+P030qdvrNgwnqe9+Kw6h9Ox1Xf/WbmVgbFqiAvBlC9bWaxNYlaSXA6b k6D0JHKSjZPpHgGWSl8de58GW9wTOhD4G7APcHqvig2ElcuxKXGEJMbDiI5C+wM6c/uNZYGDKQH Gyln8usdt6LIe+L24f+S0WZZOkN5b75oBqE1U4SirbgWSV0oQR/VgR5R3MVvLMMrmyqPiFaaawD fWqFsf8PmmOgcfZvBQ4ZGzTElp/ezMarN1H6m653QUtXR1kb
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -610,4 +610,7 @@ struct dmi_system_id {
	 struct platform_device_id {
		char name[PLATFORM_NAME_SIZE];
	-	kernel_ulong_t driver_data;
	+	union {
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };

which allows dropping several casts and eases porting CHERI to mainline
linux. A possible follow-up change is the following example:

	diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
	index 5d61053e0596..03bc8e859d73 100644
	--- a/drivers/gpio/gpio-pxa.c
	+++ b/drivers/gpio/gpio-pxa.c
	@@ -534,7 +534,7 @@ static struct irq_chip pxa_muxed_gpio_chip = {
	 static int pxa_gpio_nums(struct platform_device *pdev)
	 {
		const struct platform_device_id *id = platform_get_device_id(pdev);
	-	struct pxa_gpio_id *pxa_id = (struct pxa_gpio_id *)id->driver_data;
	+	struct pxa_gpio_id *pxa_id = id->driver_data_ptr;
		int count = 0;
	 
		switch (pxa_id->type) {
	@@ -708,14 +708,14 @@ static int pxa_gpio_probe(struct platform_device *pdev)
	 }
	 
	 static const struct platform_device_id gpio_id_table[] = {
	-	{ .name = "pxa25x-gpio",	.driver_data = (unsigned long)&pxa25x_id },
	-	{ .name = "pxa26x-gpio",	.driver_data = (unsigned long)&pxa26x_id },
	-	{ .name = "pxa27x-gpio",	.driver_data = (unsigned long)&pxa27x_id },
	-	{ .name = "pxa3xx-gpio",	.driver_data = (unsigned long)&pxa3xx_id },
	-	{ .name = "pxa93x-gpio",	.driver_data = (unsigned long)&pxa93x_id },
	-	{ .name = "mmp-gpio",		.driver_data = (unsigned long)&mmp_id },
	-	{ .name = "mmp2-gpio",		.driver_data = (unsigned long)&mmp2_id },
	-	{ .name = "pxa1928-gpio",	.driver_data = (unsigned long)&pxa1928_id },
	+	{ .name = "pxa25x-gpio",	.driver_data_ptr = &pxa25x_id },
	+	{ .name = "pxa26x-gpio",	.driver_data_ptr = &pxa26x_id },
	+	{ .name = "pxa27x-gpio",	.driver_data_ptr = &pxa27x_id },
	+	{ .name = "pxa3xx-gpio",	.driver_data_ptr = &pxa3xx_id },
	+	{ .name = "pxa93x-gpio",	.driver_data_ptr = &pxa93x_id },
	+	{ .name = "mmp-gpio",		.driver_data_ptr = &mmp_id },
	+	{ .name = "mmp2-gpio",		.driver_data_ptr = &mmp2_id },
	+	{ .name = "pxa1928-gpio",	.driver_data_ptr = &pxa1928_id },
		{ }
	 };
 
increasing readability due to less casting. Also this results in the
compiler warning:

	drivers/gpio/gpio-pxa.c: In function ‘pxa_gpio_nums’:
	drivers/gpio/gpio-pxa.c:537:38: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
	  537 |         struct pxa_gpio_id *pxa_id = id->driver_data_ptr;
	      |                                      ^~

which is a good thing as adding the needed const to fix this warning
improves type safety. (Sorry, no driver below drivers/power benefits
here, so the example is from a different subsystem.)

Patch #5 is just an unrelated change where I spotted the patch
opportunity while preparing this series. It's included here just for my
convenience and could be applied independently.

If you consider the last patch mostly churn, just drop it.

There are no dependencies between the patches, the only file that is
touched in more than one patch is drivers/power/supply/mt6360_charger.c
and even if these (i.e. patches #1 and #5) are reordered, git should be
able to cope with that without conflicts.

Note that this series is only build tested, and there is the possibility
that I failed to spot driver data usage that render patches #2 and/or #3
wrong. So a deeper look on at least those two won't hurt.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (6):
  power: Drop unused assignment of platform_device_id driver data
  power: supply: max14577: Drop driver data in of and platform device id
    arrays
  power: supply: max17042: Drop driver data in of and platform device id
    arrays
  power: Use named initializers for platform_device_id arrays
  power: supply: mt6360_charger: Use of match table unconditionally
  power: Unify code style for platform_device_id arrays

 drivers/power/reset/qemu-virt-ctrl.c           |  2 +-
 drivers/power/reset/spacemit-p1-reboot.c       |  4 ++--
 drivers/power/reset/tps65086-restart.c         |  2 +-
 drivers/power/supply/axp288_charger.c          |  2 +-
 drivers/power/supply/axp288_fuel_gauge.c       |  2 +-
 drivers/power/supply/bd71828-power.c           |  8 ++++----
 drivers/power/supply/charger-manager.c         |  4 ++--
 drivers/power/supply/cros_charge-control.c     |  4 ++--
 drivers/power/supply/cros_peripheral_charger.c |  4 ++--
 drivers/power/supply/cros_usbpd-charger.c      |  4 ++--
 drivers/power/supply/macsmc-power.c            |  2 +-
 drivers/power/supply/max14577_charger.c        | 12 +++++-------
 drivers/power/supply/max17042_battery.c        | 14 +++++++-------
 drivers/power/supply/max77693_charger.c        |  2 +-
 drivers/power/supply/max77759_charger.c        |  2 +-
 drivers/power/supply/max8997_charger.c         |  2 +-
 drivers/power/supply/max8998_charger.c         |  2 +-
 drivers/power/supply/mt6360_charger.c          |  6 +++---
 drivers/power/supply/pf1550-charger.c          |  2 +-
 drivers/power/supply/rt5033_charger.c          |  2 +-
 20 files changed, 40 insertions(+), 42 deletions(-)


base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
-- 
2.47.3

