Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D0A6FA6
	for <asahi@lists.linux.dev>; Mon, 21 Nov 2022 17:45:09 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id n20so30400307ejh.0
        for <asahi@lists.linux.dev>; Mon, 21 Nov 2022 09:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+9IrtAc191rAMJ9lamUKYajmKH7hj/07wCLXl1AJ5g=;
        b=F0N5VBAlSRuCK9dwIjBJ+sB4ejjY3jp7bnEHmkA1+3g4pr/YlxiLBAenlCQ1TR6svB
         AVWoi9tdb7b7jGQIKNxIi54BWX8ZsXGhVgwlUbyHQ8mtiiUtcN8zLIWafSOdlBk/nt1y
         fDYv0OxQt92tTSGkowqCjeuFXXBkdR7mAjfDL1qYCXFvAjC/m4gQptouJKpw2aI1Ags2
         qz6QsdqFIRPOKQkJKbE7o0Uv4il02accd97GvIY70RqSLswcfwJsE05Biddj9SIljPbm
         pvM9DHMU+y4lnZHa2Quz3W97Y/IzMv6dViiAhZ5tO8rQJ2L26HiyDL9EbiuUvj/qToAX
         MBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+9IrtAc191rAMJ9lamUKYajmKH7hj/07wCLXl1AJ5g=;
        b=eAi+OrCUluvbT//82vUOZDtIWXdnAdHCBMnzfh46qb0vcVMWptaOYz6A1e6keenGh/
         PIgyzeg6A6Zcp9vdbKjx8/lgjBKKaXOwjLqsEYkK4RAzsFgk1oQTDbKZCT4A3zafmWeT
         Z8VtQPZ1v3oXMLxKs5nadA90RA+GwePx/U/Rm8qdDN5+SPRAiMn7udnG3BjPPkpo48ML
         cjXTtjzKH5QZJ0OWN8ZadFYbtVdVesSj9CC6RNmrssazMJIW8HqvU4uukomZjdfQP/aH
         xM/rmCBv29c3UgsN15iN5GMSndorWYDuC2cq7YAVgXDun1AjTqwjzrwZvSSwWsh97oFV
         A3qQ==
X-Gm-Message-State: ANoB5pleCKJSOO7yOEqrWpfzM9WDHdVnCwI6M7evYb97/Uv+l5l7Gj09
	+GXPaEpNYonsxr7LyxxD/heMYGPWbLzsTw==
X-Google-Smtp-Source: AA0mqf7WB//zz75XwT4qrUkl7f/GrEkUi04JkoSigEcForgwCnymKs9LkQFOa4IoRo21tv6ysPq7QA==
X-Received: by 2002:a17:906:68db:b0:7b4:869f:f944 with SMTP id y27-20020a17090668db00b007b4869ff944mr6339155ejr.427.1669052707965;
        Mon, 21 Nov 2022 09:45:07 -0800 (PST)
Received: from localhost ([217.131.81.52])
        by smtp.gmail.com with UTF8SMTPSA id x10-20020a1709064a8a00b0078d3a075525sm5252834eju.56.2022.11.21.09.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 09:45:07 -0800 (PST)
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
Subject: [PATCH RESEND v3 2/4] pwm: Add Apple PWM controller
Date: Mon, 21 Nov 2022 20:42:26 +0300
Message-Id: <20221121174228.93670-3-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121174228.93670-1-fnkl.kernel@gmail.com>
References: <20221121174228.93670-1-fnkl.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the Apple PWM controller driver.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
Acked-by: Sven Peter <sven@svenpeter.dev>
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
index 000000000000..b0c3f86fd578
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
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/pwm.h>
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
2.38.1

