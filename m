Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347748;
	b=VJ3hh4q0CeVZ6Wqw0t0JZwTRIbztLy2kHxsJwEiKWdIjXGG6+Ij8jZMb5jEjFgeGcYbh
	 Gmlb1ziQd3pt/GrS7PVRP+1k2HCRZ9G7jkJuAbZcnds/dikW/iFKhqyK5yAxiAV5kb+id
	 zlNUU/jsaQ78GG76VkQwizEOWQCTkHVdpvmIYvz4PBBaos6SwH7264QjYPrcijRBU6Exs
	 9AYuEGn+1p93MiCqFXjvksPRIT2kqloSHqaWVHMOp55znMdAtmd5Bxlz3UXSajL4LYwOW
	 c+o3TwvehMRQ1mZ1txRBuyvka/FFQcOH2TgCXAuYsyhA+TJltQ2G2dnZ74Dlt05fR3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=3345ZdTcCQuGdtmZiQjZoFFUO3mxUE5t23pzXVkSu9U=;
	b=mP9wDiDHe2925s34u53e9ZE6jke3vWY7FMhpFbSgWz9TFeU/quKcVk23GIAC90CrfK0F
	 EsDC43fXUWIo/HvhZ4EO71GSm+p98RrtaM/q9kK+ovofk1xkKZ3KBjBE24USJ/5Qf5bWY
	 Nx7BRKeAXhAYHlJbLpALkOxT6W246EeKSZmRjce3qSxKAProX8p0olwdPEdAF4+gKkImT
	 2JD3H+h8lEqCyqmqFO4Lg6FWZAYzEBqO4hif55i2WOakgJ8ZH81xWRx+xqL/QgujlX1le
	 Ja4jmPNsXi4g6VgbVrC1cW+oUbOxwdrXHBxwyxqkTwS3Ww3VjZCUMMNnT3MAm3FioGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PLZ5EnbR;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0589B606A31C
	for <asahi@lists.linux.dev>; Tue, 10 Nov 2026 21:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0589B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PLZ5EnbR
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so31006385e9.2
        for <asahi@lists.linux.dev>; Tue, 10 Nov 2026 13:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347745; x=1794952545; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3345ZdTcCQuGdtmZiQjZoFFUO3mxUE5t23pzXVkSu9U=;
        b=PLZ5EnbRG4gNapZh3Q//igpEb3uhsLGIFnytTgxPOd0yNXXFR4a2+VDS/uO3Op0dq9
         g+kbJBKC0cjHs9mE36D1saLcM6STXs4fiqqMjWbf51+dTBSlP0fMv2vxVYjf6H0rw5ta
         JTDThNQdLwqDW/eySBXCE27iwUTrn76YII0UCmDeaMM/FbnaQfm6IMfrBzO3e1iJWC+l
         4Jdboh+wZIDDJNwqgrhSRgfqXbfSCKy8VCtzWFDRMju35n5bARzof7UDcw3vfDJNOe/9
         IST4GEv19A50Dsaty1gwP2r83JFzE7r6Zp7AqAn3ZNBsmXALahSEb2wCjHdBo/BtXfQ0
         N1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347745; x=1794952545;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3345ZdTcCQuGdtmZiQjZoFFUO3mxUE5t23pzXVkSu9U=;
        b=j/qro0fFAI9o0CdXqD+qu6wZVyLMk36GUwCYKo8U0DChboUZQJRdUd2ebQqL5wpfzO
         o4uV/bMxVw4TP0aLmRgJVnXJf/PKPQ+lj44yh2UxbRmAztzfv3PSc0bEgxhjmpdgYNX8
         Ph3XKzLYS6X39FjVHXN+XDJMAJWMiLGiEI6QtTkvaxU6H0HzFP8GgBXxRIWOGJn0NXK6
         hVr94YhFMy/raSLARXOltspjFCx/Luv0zavHfyWHQSJAgR/kyZIYnHkfNTOmn2cwuPxH
         DqsJZDWxoz3rPT4mAcb+2hfetq4oEOWirZL/WI4RSh7i93PmL6tA0bt3hu+pdyVyEvKi
         YN3w==
X-Forwarded-Encrypted: i=1; AL+hErEO/o3CU3E/OZIi0dw267ByhBpxp9qifhrZjAUMfeXhVfA+MTJNlN06NmTKat+Wjvatpditdg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+0L1GlzOP0YDLnlQYbD/2F48Y2ZIx47FD5HGXTB3JkUDOPa+H5
	ARqJcEUtZlE9gDlKbBwyBjyOPcJeheqi9ZzAUemhsEAE+pZ+9kNXrGmdbYa6/I31L1Y=
X-Gm-Gg: AYBFou18LjUZdBqEkS4rS2Ubhc9EAIP4Vt0TuyvEv9N70gA/5qri0b/wo+NOLl/pQ2Y
	g097qOd6xTe1u7j8/uU51MMW9Bzo9BhLPyz3lG+TqzCielSFMKGhTQ43fxC+kQDbmEA8CAbBVFK
	gqt98MbdodC8FPAuxZdBNwyJNdI2MYZ11HcaC94Pupxc4jgkmMKEPlgXMzR/KZFeYn+pphKKW0y
	EbKq1nZuUlYeY/E8hvImI1XqTXVoyJQAgD2sYjTrovhM9bblL6vQgRF/KMPZo0Zv6PiKJE9Qirc
	136y5ckO7/0yZ98qHel1F1osjdmvotlSn0XapDAuCVtMiOEjBkjPVTYucUhp+sNdvO+zHqPacOD
	76W/mDSxz/vn99zDdqtlpkRFGEb2YgTi1iLkKdRPtldfuhG1/sIxMbkohWaL+D/DZ+eMkLAPKYu
	DY7wpSqoqQ2pWEn3LqIQdfaoMqiyuDmbflmUpOgTf25Tl4lLVsb4jxDVmzV1DMPbMBmS4u6w1xx
	Mthk3meL95qXYMHGVuv0dKX6IFSmVc/lZPtWwBELnfDJZ+MkWu5/rSi7LtUmtBlRLpDxJsj2BW9
	VSlcWxIrwEQ85YDHpuJBEz8X3xkgSnH+lw==
X-Received: by 2002:a05:600c:6089:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4ba09376ccfmr6522835e9.16.1794347745017;
        Tue, 10 Nov 2026 13:55:45 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba09517bc7sm5065775e9.3.2026.11.10.13.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:55:43 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Qunqin Zhao <zhaoqunqin@loongson.cn>,
	linux-crypto@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Zha Qipeng <qipeng.zha@intel.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Andy Shevchenko <andy@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Andreas Werner <andreas.werner@men.de>,
	Samuel Kayode <samkay014@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-omap@vger.kernel.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	Linus Walleij <linusw@kernel.org>,
	linux@ew.tq-group.com,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	Peter Tyser <ptyser@xes-inc.com>
Subject: [PATCH v4 00/20] mfd: Use named initializers for arrays of *_device_data
Date: Tue, 10 Nov 2026 22:54:25 +0100
Message-ID: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9750; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=nD5jT2yhNB7skZ7+gOkejPp/Wep1AkKN4ZTmIkt/V1M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KSYpZBXE6fsJl5QLOE/ydM/argSy8UX4DhB Rza76iDzVyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSkgAKCRCPgPtYfRL+ TuNaCAC78WLpLILW6ABKU7KqzJvFY0LrLydKcc+7mVF5DZGE1H9PiVhV+zCn2RH8/TcPXnVUltJ RGb5tfzAK7cpAKTzjGKcxlZ0SDmvVwrJ1+vQoLx/g3Gt4Ib9L6ZZpBk2Bn7K0o3nWT+0S4ng8bx I1X3dRIgIBs2RhbOzYC96WmCWPWkk7nLmF2mKbjJOh8h4WCjEFtVNt6GQYWomV6FeHtO1WgdIaI LU5D20ltbHXzEMOxuqnsltnkD/MJeGdpKx+Y3e7PizV3ko3MvxrjboMjxkEAgpOCrs0aaDVkEch DULuZ/BeLolvyvOZtfbWNuvOsCnlAnHDeGoIcb4lQRCmL2Vg
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

the objective for this series is to prepare mfd for changing
of_device_id and the others to make driver_data a union, see
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for the idea behind it.

Changes since v3
(https://lore.kernel.org/cover.1783615311.git.u.kleine-koenig@baylibre.com):

 - Rebase to v7.4-rc1
 - add various R-b tags
 - Fix a bug in patch 3 found by sashiko where I accidentally deleted a
   * in sizeof(*pdata).
 - Drop patches about spi_device_id that were sent separately initially
   and applied in the meantime

These patches are a pain to track and forward port and they are mostly
orthogonal, so I'm happy about a partial application of this series if
only some patches are considered ready.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (20):
  mfd: bcm2835-pm: Remove member of struct bcm2835_pm that is only used
    locally
  mfd: bcm2835-pm: Drop unused header
  mfd: kempld: Simplify device abstraction
  mfd: lp87565: Explicitly set driver data for the generic dt compatible
  mfd: mt6360: Drop irrelevant __maybe_unused
  mfd: rt4831: Drop irrelevant __maybe_unused
  mfd: loongson-se: Drop unused assignment of acpi_device_id driver data
  mfd: Drop unused assignment of i2c_device_id driver data
  mfd: Drop unused assignment of platform_device_id driver data
  mfd: Use named initializers for acpi_device_id arrays
  mfd: intel-m10-bmc-pmci: Use named initializers for dfl_device_id
    array
  mfd: Use named initializers for arrays of i2c_device_id
  mfd: twl6030: Use named initializers for of_device_id
  mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays
  mfd: Use named initializers for platform_device_id array
  mfd: Unify style of acpi_device_id arrays
  mfd: Unify style of dmi_system_id arrays
  mfd: Unify style of i2c_device_id arrays
  mfd: Unify style of of_device_id arrays
  mfd: Unify style of pci_device_id arrays

 drivers/mfd/88pm800.c                 |  4 +-
 drivers/mfd/88pm805.c                 |  4 +-
 drivers/mfd/88pm860x-core.c           |  8 ++--
 drivers/mfd/aat2870-core.c            |  2 +-
 drivers/mfd/ab8500-core.c             |  8 ++--
 drivers/mfd/ab8500-sysctrl.c          |  4 +-
 drivers/mfd/ac100.c                   |  2 +-
 drivers/mfd/act8945a.c                |  8 ++--
 drivers/mfd/adp5520.c                 |  4 +-
 drivers/mfd/altera-a10sr.c            |  2 +-
 drivers/mfd/altera-sysmgr.c           |  2 +-
 drivers/mfd/arizona-i2c.c             | 14 +++---
 drivers/mfd/arizona-spi.c             |  2 +-
 drivers/mfd/as3711.c                  |  8 ++--
 drivers/mfd/as3722.c                  |  8 ++--
 drivers/mfd/atmel-hlcdc.c             |  2 +-
 drivers/mfd/atmel-smc.c               |  2 +-
 drivers/mfd/axp20x-i2c.c              | 26 +++++-----
 drivers/mfd/axp20x-rsb.c              |  2 +-
 drivers/mfd/bcm2835-pm.c              | 15 ++++--
 drivers/mfd/bcm590xx.c                |  4 +-
 drivers/mfd/bd9571mwv.c               |  6 +--
 drivers/mfd/bq257xx.c                 |  8 ++--
 drivers/mfd/cgbc-core.c               |  2 +-
 drivers/mfd/cros_ec_dev.c             |  2 +-
 drivers/mfd/cs40l50-i2c.c             |  6 +--
 drivers/mfd/cs40l50-spi.c             |  2 +-
 drivers/mfd/cs42l43-i2c.c             | 10 ++--
 drivers/mfd/cs5535-mfd.c              |  2 +-
 drivers/mfd/da903x.c                  |  6 +--
 drivers/mfd/da9052-i2c.c              | 12 ++---
 drivers/mfd/da9055-i2c.c              |  4 +-
 drivers/mfd/da9062-core.c             |  4 +-
 drivers/mfd/da9063-i2c.c              | 11 +++--
 drivers/mfd/da9150-core.c             |  4 +-
 drivers/mfd/db8500-prcmu.c            |  4 +-
 drivers/mfd/exynos-lpass.c            |  2 +-
 drivers/mfd/gateworks-gsc.c           |  2 +-
 drivers/mfd/hi6421-pmic-core.c        |  6 +--
 drivers/mfd/hi655x-pmic.c             |  4 +-
 drivers/mfd/intel-lpss-acpi.c         | 58 +++++++++++------------
 drivers/mfd/intel-m10-bmc-pmci.c      |  2 +-
 drivers/mfd/intel_pmc_bxt.c           |  2 +-
 drivers/mfd/intel_quark_i2c_gpio.c    |  6 +--
 drivers/mfd/intel_soc_pmic_bxtwc.c    |  2 +-
 drivers/mfd/intel_soc_pmic_chtdc_ti.c |  4 +-
 drivers/mfd/intel_soc_pmic_chtwc.c    |  2 +-
 drivers/mfd/intel_soc_pmic_crc.c      |  6 +--
 drivers/mfd/intel_soc_pmic_mrfld.c    |  4 +-
 drivers/mfd/ioc3.c                    |  4 +-
 drivers/mfd/janz-cmodio.c             | 14 +++---
 drivers/mfd/kempld-core.c             | 68 +++++++--------------------
 drivers/mfd/khadas-mcu.c              |  2 +-
 drivers/mfd/lm3533-core.c             |  2 +-
 drivers/mfd/lochnagar-i2c.c           |  2 +-
 drivers/mfd/loongson-se.c             |  2 +-
 drivers/mfd/lp3943.c                  |  4 +-
 drivers/mfd/lp873x.c                  |  8 ++--
 drivers/mfd/lp87565.c                 |  9 ++--
 drivers/mfd/lp8788.c                  |  2 +-
 drivers/mfd/lpc_ich.c                 |  2 +-
 drivers/mfd/macsmc.c                  |  2 +-
 drivers/mfd/madera-core.c             |  2 +-
 drivers/mfd/madera-i2c.c              | 18 +++----
 drivers/mfd/max14577.c                |  6 +--
 drivers/mfd/max7360.c                 |  2 +-
 drivers/mfd/max77541.c                |  4 +-
 drivers/mfd/max77620.c                |  8 ++--
 drivers/mfd/max77686.c                |  2 +-
 drivers/mfd/max77693.c                |  4 +-
 drivers/mfd/max77714.c                |  2 +-
 drivers/mfd/max77759.c                |  4 +-
 drivers/mfd/max77843.c                |  8 ++--
 drivers/mfd/max8907.c                 |  6 +--
 drivers/mfd/max8925-i2c.c             |  6 +--
 drivers/mfd/max8997.c                 |  6 +--
 drivers/mfd/max8998.c                 |  6 +--
 drivers/mfd/mc13xxx-spi.c             |  6 +--
 drivers/mfd/menelaus.c                |  2 +-
 drivers/mfd/menf21bmc.c               |  2 +-
 drivers/mfd/mp2629.c                  |  2 +-
 drivers/mfd/mt6360-core.c             |  6 +--
 drivers/mfd/mt6370.c                  |  2 +-
 drivers/mfd/mt6397-core.c             |  4 +-
 drivers/mfd/mxs-lradc.c               |  4 +-
 drivers/mfd/ntxec.c                   |  4 +-
 drivers/mfd/omap-usb-host.c           |  4 +-
 drivers/mfd/palmas.c                  |  8 ++--
 drivers/mfd/pf1550.c                  |  2 +-
 drivers/mfd/qcom-pm8008.c             |  4 +-
 drivers/mfd/qcom-pm8xxx.c             |  6 +--
 drivers/mfd/rave-sp.c                 |  4 +-
 drivers/mfd/rc5t583.c                 |  4 +-
 drivers/mfd/rdc321x-southbridge.c     |  2 +-
 drivers/mfd/retu-mfd.c                |  4 +-
 drivers/mfd/rk8xx-i2c.c               |  2 +-
 drivers/mfd/rk8xx-spi.c               |  2 +-
 drivers/mfd/rohm-bd71828.c            |  4 +-
 drivers/mfd/rohm-bd9576.c             |  6 +--
 drivers/mfd/rsmu_i2c.c                | 18 +++----
 drivers/mfd/rsmu_spi.c                |  2 +-
 drivers/mfd/rt4831.c                  |  6 +--
 drivers/mfd/rt5033.c                  |  4 +-
 drivers/mfd/rt5120.c                  |  2 +-
 drivers/mfd/rz-mtu3.c                 |  2 +-
 drivers/mfd/sec-acpm.c                |  6 +--
 drivers/mfd/sec-i2c.c                 | 22 ++++-----
 drivers/mfd/si476x-i2c.c              |  8 ++--
 drivers/mfd/simple-mfd-i2c.c          |  2 +-
 drivers/mfd/sky81452.c                |  4 +-
 drivers/mfd/sm501.c                   |  4 +-
 drivers/mfd/smpro-core.c              |  2 +-
 drivers/mfd/sprd-sc27xx-spi.c         |  2 +-
 drivers/mfd/ssbi.c                    |  2 +-
 drivers/mfd/stm32-lptimer.c           |  4 +-
 drivers/mfd/stm32-timers.c            |  4 +-
 drivers/mfd/stmfx.c                   |  4 +-
 drivers/mfd/stmpe-i2c.c               | 34 +++++++-------
 drivers/mfd/stmpe-spi.c               | 14 +++---
 drivers/mfd/stpmic1.c                 |  4 +-
 drivers/mfd/stw481x.c                 |  8 ++--
 drivers/mfd/sun6i-prcm.c              |  2 +-
 drivers/mfd/tc3589x.c                 | 14 +++---
 drivers/mfd/ti-lmu.c                  | 10 ++--
 drivers/mfd/timberdale.c              |  2 +-
 drivers/mfd/tps6105x.c                |  6 +--
 drivers/mfd/tps65010.c                | 10 ++--
 drivers/mfd/tps6507x.c                |  6 +--
 drivers/mfd/tps65086.c                |  4 +-
 drivers/mfd/tps65090.c                |  6 +--
 drivers/mfd/tps65217.c                |  6 +--
 drivers/mfd/tps65218.c                |  8 ++--
 drivers/mfd/tps65219.c                |  8 ++--
 drivers/mfd/tps6586x.c                |  6 +--
 drivers/mfd/tps65910.c                | 12 ++---
 drivers/mfd/tps65912-i2c.c            |  4 +-
 drivers/mfd/tps65912-spi.c            |  2 +-
 drivers/mfd/tps6594-i2c.c             | 12 ++---
 drivers/mfd/tps6594-spi.c             | 12 ++---
 drivers/mfd/tqmx86.c                  |  2 +-
 drivers/mfd/twl-core.c                | 22 ++++-----
 drivers/mfd/twl4030-audio.c           |  4 +-
 drivers/mfd/twl4030-power.c           |  2 +-
 drivers/mfd/twl6030-irq.c             |  6 +--
 drivers/mfd/twl6040.c                 |  4 +-
 drivers/mfd/upboard-fpga.c            |  6 +--
 drivers/mfd/vexpress-sysreg.c         |  4 +-
 drivers/mfd/vx855.c                   |  2 +-
 drivers/mfd/wm831x-core.c             |  2 +-
 drivers/mfd/wm831x-i2c.c              | 14 +++---
 drivers/mfd/wm8350-i2c.c              |  6 +--
 drivers/mfd/wm8400-core.c             |  4 +-
 drivers/mfd/wm8994-core.c             |  8 ++--
 include/linux/mfd/bcm2835-pm.h        |  9 ----
 include/linux/mfd/kempld.h            | 12 -----
 155 files changed, 478 insertions(+), 520 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.rc1

