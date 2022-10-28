Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDF02916
	for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 16:53:49 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id r14so8724964edc.7
        for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 09:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2JNSWKMPMcl8SDntvKymnSG5RXcFKKH/9/h36qTbJk=;
        b=NfOIQObmeUUmd5kyKTsOMM5SQW4HDExEwcC6UngYgjbFURggeAXn2mhKM18SongoQl
         yIHPR3/uC/SbYOSKHksblwlWPSNPjiAr2GG8gHgi2IrdW46yVuE7VqOxfgUO2z3v0ldV
         wXPNgP38lZr1jo36OMgyeIuug+bxwAPpsMDA9Ye3DHrrWrUEIPJ5EILP0WWbGjzdfpjH
         wHqTnaXxuq2Vv9LmIjxjI1Zo4SGJGEGmgNQLL4M9Qysjg/jJyRVu9yPD1WiWGQslsEYB
         mSSMN+WJAiAwTSBQYN6Q5dKt1UWB9aWfLIdlspXgw1U9YzJvnzLWTF6Dk1a38cJ9CV7G
         ox6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2JNSWKMPMcl8SDntvKymnSG5RXcFKKH/9/h36qTbJk=;
        b=An0FBltKdlO7HlSzcJbyR7fEHwt20CJZeBpe4RNt1v0MJj4h8TLo6wtm9GkFl7RrPP
         156sqUG4tJMFHvdocIFTl249TmLBipJrquR4RhlEDm+d5XjtSblXcmqBkxiMbuDI/3Z1
         RY8gz8mlb/YtN0UCaybuhGyEHIxMDHptCuUylTkXBgIQY2K83DvtPCy0r6heEchT/FsU
         502YGr+EgcQjolNd3s61ufWQnBIGFyC16E/u0qq7v7T68yQsbjti84dt5ew+5hHdFCHR
         /kgVF7ceSKEMkIDUy0uqQRXZDXzZb3LC6DR4b02wkMzjGErRGpSrIYVMO38wTL2fBdEP
         D3tw==
X-Gm-Message-State: ACrzQf23dmip+yjLCD6ivarYrZcwsOW5GRc9cNNuzAaVxpNmNazRLSvx
	F2i2e+G214amsalfzBIOJQM=
X-Google-Smtp-Source: AMsMyM5YdJ87bP+zIQvjAQl+rYHHGzVLuAsxI9PlvB5iRXrMZMUExp6NA4GXE0dpxodexsbZgEubzg==
X-Received: by 2002:a05:6402:428f:b0:454:c988:4bb1 with SMTP id g15-20020a056402428f00b00454c9884bb1mr361047edc.196.1666976028172;
        Fri, 28 Oct 2022 09:53:48 -0700 (PDT)
Received: from localhost ([88.227.58.131])
        by smtp.gmail.com with UTF8SMTPSA id f30-20020a170906739e00b0078e05db7005sm2331200ejl.214.2022.10.28.09.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 09:53:47 -0700 (PDT)
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
Subject: [PATCH 2/4] pwm: Add Apple PWM controller
Date: Fri, 28 Oct 2022 19:52:14 +0300
Message-Id: <20221028165215.43662-3-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20221028165215.43662-1-fnkl.kernel@gmail.com>
References: <20221028165215.43662-1-fnkl.kernel@gmail.com>
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
 drivers/pwm/pwm-apple.c | 124 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 drivers/pwm/pwm-apple.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 60d13a949bc5..ec6acb368073 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -51,6 +51,18 @@ config PWM_AB8500
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-ab8500.
 
+config PWM_APPLE
+	tristate "Apple SoC PWM support"
+	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)
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
index 000000000000..4cfa9bf435dc
--- /dev/null
+++ b/drivers/pwm/pwm-apple.c
@@ -0,0 +1,124 @@
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
+		on_cycles = fpwm->clkrate * state->duty_cycle / NSEC_PER_SEC;
+		off_cycles = (fpwm->clkrate * state->period / NSEC_PER_SEC) - on_cycles;
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
+	state->duty_cycle = on_cycles / fpwm->clkrate * NSEC_PER_SEC;
+	state->period = (off_cycles + on_cycles) / fpwm->clkrate * NSEC_PER_SEC;
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

