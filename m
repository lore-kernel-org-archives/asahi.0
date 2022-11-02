Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875B92582
	for <asahi@lists.linux.dev>; Wed,  2 Nov 2022 14:17:20 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id d26so45619264eje.10
        for <asahi@lists.linux.dev>; Wed, 02 Nov 2022 07:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvY1t8d2DDNkn813R2BzjKxIxBFV0sqyCIGH+RICWH4=;
        b=THE0vbp3D/eVQ2z/qfHOY49273zjCOuaMmI6ApSWe7rY+VYKbgL/CzRoWaMT8LTQ/l
         i9Nl2DOjxoOvcxRBQZ69jrEF4YHMTz0ElpJUKPBzZqwnRg3bPMkdFSHsleX8iNwzsjGn
         3HIJX7t4eFBnE8DTOv6vBGAYky9Esi1FKe/pjkvMmU/NfmYWSrMfM2kvGmZs3A1KGoZE
         u+zaZ1n4SDrAzxlvs7WoyYpftrg52A/JYg/TbGzM7i31evIG99JJMrvlF/kwuCpIMXYB
         zNtdfjML++MfjAjOoLc23N2HxPe5KeZGWrFV8OMjTCUy/eX/VgmlYFTkdUYGGaZwPlmB
         DcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvY1t8d2DDNkn813R2BzjKxIxBFV0sqyCIGH+RICWH4=;
        b=K0j1lTyNk4Og7UQqY4biFW+tHJGzoinfmiZFjyvmE9jKXcOLEIwJeTSjQsgsamYPLp
         AVEu3JCcMx/eAmb0VWA3IYqYTurTf/TbPYGFo+tPQfaG3nIi2uSwRRqVxPU4UTdDZqkd
         kgVl3CEUfbThJsuSVwVWkgIHceND1H83S8r7gi0Mjh4LHia63of82rAQVJ2vKNmoGTEC
         yJxGOJG4PiFkkdW7fNG3AuR+OhQz44Hvkvbc5Vq49BRVYi6E1+xqi7pT8/iLYRgwYEr6
         mRkikWA/MzUXGdfhfcNCzJvrOXZ1y0JMEVxWLIB5BEK9XHf/7BjhI6xDChUPsFDMmOaP
         13fw==
X-Gm-Message-State: ACrzQf1TEuhmTwgj6rQXtl/oD2wJCP9prfBOWmpSCUr4Vk3OpeSurxCu
	XcKB7WYnQo5qzMN9Faw3hfQ=
X-Google-Smtp-Source: AMsMyM7IDtrXzDcP4UaF7ItyAX7wOhgsT9A/ODjOaA2jq47ElJLSiiu9p8zV7igepuD5Ss6DrNRY4g==
X-Received: by 2002:a17:907:a068:b0:7ad:956f:f13d with SMTP id ia8-20020a170907a06800b007ad956ff13dmr24290056ejc.643.1667398638735;
        Wed, 02 Nov 2022 07:17:18 -0700 (PDT)
Received: from localhost ([88.227.60.86])
        by smtp.gmail.com with UTF8SMTPSA id fy8-20020a170906b7c800b0073a20469f31sm5480449ejb.41.2022.11.02.07.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 07:17:18 -0700 (PDT)
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
To: thierry.reding@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: marcan@marcan.st,
	sven@svenpeter.dev,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <fnkl.kernel@gmail.com>
Subject: [PATCH v2 2/4] pwm: Add Apple PWM controller
Date: Wed,  2 Nov 2022 17:15:11 +0300
Message-Id: <20221102141513.49289-3-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20221102141513.49289-1-fnkl.kernel@gmail.com>
References: <20221102141513.49289-1-fnkl.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the Apple PWM controller driver.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/pwm/Kconfig     |  12 ++++
 drivers/pwm/Makefile    |   1 +
 drivers/pwm/pwm-apple.c | 127 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 drivers/pwm/pwm-apple.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 60d13a949bc5..c3be11468414 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -51,6 +51,18 @@ config PWM_AB8500
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-ab8500.
 
+config PWM_APPLE
+	tristate "Apple SoC PWM support"
+	depends on ARCH_APPLE || COMPILE_TEST
+	help
+	  Generic PWM framework driver for PWM controller present on
+	  Apple SoCs
+
+	  Say Y here if you have an ARM Apple laptop, otherwise say N
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-apple.
+
 config PWM_ATMEL
 	tristate "Atmel PWM support"
 	depends on ARCH_AT91 || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 7bf1a29f02b8..19899b912e00 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_PWM)		+= core.o
 obj-$(CONFIG_PWM_SYSFS)		+= sysfs.o
 obj-$(CONFIG_PWM_AB8500)	+= pwm-ab8500.o
+obj-$(CONFIG_PWM_APPLE)		+= pwm-apple.o
 obj-$(CONFIG_PWM_ATMEL)		+= pwm-atmel.o
 obj-$(CONFIG_PWM_ATMEL_HLCDC_PWM)	+= pwm-atmel-hlcdc.o
 obj-$(CONFIG_PWM_ATMEL_TCB)	+= pwm-atmel-tcb.o
diff --git a/drivers/pwm/pwm-apple.c b/drivers/pwm/pwm-apple.c
new file mode 100644
index 000000000000..7b2936346f4e
--- /dev/null
+++ b/drivers/pwm/pwm-apple.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Driver for the Apple SoC PWM controller
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/io.h>
+#include <linux/clk.h>
+#include <linux/pm_runtime.h>
+#include <linux/math64.h>
+
+#define PWM_CONTROL     0x00
+#define PWM_ON_CYCLES   0x1c
+#define PWM_OFF_CYCLES  0x18
+
+#define CTRL_ENABLE        BIT(0)
+#define CTRL_MODE          BIT(2)
+#define CTRL_UPDATE        BIT(5)
+#define CTRL_TRIGGER       BIT(9)
+#define CTRL_INVERT        BIT(10)
+#define CTRL_OUTPUT_ENABLE BIT(14)
+
+struct apple_pwm {
+	struct pwm_chip chip;
+	void __iomem *base;
+	u64 clkrate;
+};
+
+static int apple_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			   const struct pwm_state *state)
+{
+	struct apple_pwm *fpwm;
+	u64 on_cycles, off_cycles;
+
+	fpwm = container_of(chip, struct apple_pwm, chip);
+	if (state->enabled) {
+		on_cycles = mul_u64_u64_div_u64(fpwm->clkrate,
+						state->duty_cycle, NSEC_PER_SEC);
+		off_cycles = mul_u64_u64_div_u64(fpwm->clkrate,
+						 state->period, NSEC_PER_SEC) - on_cycles;
+		writel(on_cycles, fpwm->base + PWM_ON_CYCLES);
+		writel(off_cycles, fpwm->base + PWM_OFF_CYCLES);
+		writel(CTRL_ENABLE | CTRL_OUTPUT_ENABLE | CTRL_UPDATE,
+		       fpwm->base + PWM_CONTROL);
+	} else {
+		writel(0, fpwm->base + PWM_CONTROL);
+	}
+	return 0;
+}
+
+static void apple_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+			   struct pwm_state *state)
+{
+	struct apple_pwm *fpwm;
+	u32 on_cycles, off_cycles, ctrl;
+
+	fpwm = container_of(chip, struct apple_pwm, chip);
+
+	ctrl = readl(fpwm->base + PWM_CONTROL);
+	on_cycles = readl(fpwm->base + PWM_ON_CYCLES);
+	off_cycles = readl(fpwm->base + PWM_OFF_CYCLES);
+
+	state->enabled = (ctrl & CTRL_ENABLE) && (ctrl & CTRL_OUTPUT_ENABLE);
+	state->polarity = PWM_POLARITY_NORMAL;
+	state->duty_cycle = div_u64(on_cycles, fpwm->clkrate) * NSEC_PER_SEC;
+	state->period = div_u64(off_cycles + on_cycles, fpwm->clkrate) * NSEC_PER_SEC;
+}
+
+static const struct pwm_ops apple_pwm_ops = {
+	.apply = apple_pwm_apply,
+	.get_state = apple_pwm_get_state,
+	.owner = THIS_MODULE,
+};
+
+static int apple_pwm_probe(struct platform_device *pdev)
+{
+	struct apple_pwm *pwm;
+	struct clk *clk;
+	int ret;
+
+	pwm = devm_kzalloc(&pdev->dev, sizeof(*pwm), GFP_KERNEL);
+	if (!pwm)
+		return -ENOMEM;
+
+	pwm->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pwm->base))
+		return PTR_ERR(pwm->base);
+
+	platform_set_drvdata(pdev, pwm);
+
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	pwm->clkrate = clk_get_rate(clk);
+	pwm->chip.dev = &pdev->dev;
+	pwm->chip.npwm = 1;
+	pwm->chip.ops = &apple_pwm_ops;
+
+	ret = devm_pwmchip_add(&pdev->dev, &pwm->chip);
+	return ret;
+}
+
+static const struct of_device_id apple_pwm_of_match[] = {
+	{ .compatible = "apple,s5l-fpwm" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, apple_pwm_of_match);
+
+static struct platform_driver apple_pwm_driver = {
+	.probe = apple_pwm_probe,
+	.driver = {
+		.name = "apple-pwm",
+		.owner = THIS_MODULE,
+		.of_match_table = apple_pwm_of_match,
+	},
+};
+module_platform_driver(apple_pwm_driver);
+
+MODULE_DESCRIPTION("Apple SoC PWM driver");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.37.3

