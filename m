Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C42D15A856
	for <asahi@lists.linux.dev>; Sun, 29 Dec 2024 11:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735470855; cv=none; b=k+B5xbNoxNWtlK8aqW7BXn8fyC9gI3YTG4RydiBpLSd+AKyVN7zXsma4uAkjQQJCcbPNrFv6ZiBPd2mvt6zutp0SVghiaj2vhQflNz3p7qwrf5c7jYv13bD8FzbS/zBxgLn+vgAy/xecBSuSjtQhpvFxaQuRhmey7JnByRGzGZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735470855; c=relaxed/simple;
	bh=/NGZcEXzKfllPc1kHyrV4Jpt9+1VCGGg+ROxJ06pXvI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGavmzl/O3fluaNeXsY5HVUqaDBV6r0Gxx0MwaZyyKCr7920KpBVD1hAU2p/MifdgxG0e2FTcvRINBFP5t2AthiQSdbm6Cd23GzRNXNOCCWdyQ8sUtwTPiL5eYPbKTMv44QCZQ4CW5J9iOvvJJtuN5F8Uqegn1vfMjf44miGKUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qar7oMb5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qar7oMb5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21669fd5c7cso107667665ad.3
        for <asahi@lists.linux.dev>; Sun, 29 Dec 2024 03:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735470853; x=1736075653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkHtq9idtKzQ6fNQxVQI03Qs+Bo7JPqfFg778nP11bo=;
        b=Qar7oMb5YDGDgV1uklN4jcLvjWXyT7429ZRuHa3BnEsYYxJLjn8/x1o7s2qE1DfmFY
         aRX7Cqx/wv7MFWzlxF1aU70Y1fH8Fq+Wy+WiB+3aKC2S4Aez6/kbRxPt6aevBc/hdjXu
         X1LvapexEPGkvmkmh1UOI/+wi7SYd7uTrLJnKJXsFuQ2MnIgBqyhd1Ztb6wceUdKiFhf
         FbqJ5iEipPEKt14ZUIxJDoEWUDdfuj0gAY5l2oYy8FZZMPCBeo7WuetPNDvX7M2wghfJ
         5EvShg1lXD/zUHFFrGQhckHqLPFOhbKPjDER2Iln6XKKzYNgAHjq/PMq/Fd4juy3eoku
         XcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735470853; x=1736075653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkHtq9idtKzQ6fNQxVQI03Qs+Bo7JPqfFg778nP11bo=;
        b=qlSmtLtflyAV9sqOyZ9CLzXGmsjnxyhRtFbjDJxF2xM9s6YEDBW1gWWEKnxw5omeS1
         qKKoOE2x4++cY5GkKc0mf8ItKKfaj7i26X4/7MWfuvTkmfxCybUYugIyfkk5GkPT0tfB
         s83guMOQB5lI453fvl2doEsLGNTmOwUR4KU2/CstrIN2rzInEbDUFW/GPXY/GpOGA6o6
         ydI6CbonHZXjkLZA5zEXJ+NWk1QtsMFbP0EDO0ekzY2uXdbzJeeSl3WVzynzQgyWb0hw
         1RFifpeOmEHbx3l9DNG9hMZGiMBfu8yABjyL+dOgjvnDV9fGe8iVv7C4v5qLNlELYM95
         2O+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMRYWxwyiduSb++LX9q2gtYx8jOcaFa9yMy9Vk0LkZ4HqTfeakF0r5jQ3q0hdkdz8yofVqpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRMhWoxGaBBp3KAPDXBolO5/9uv2u/wdJ2C2534q6wbr4YTToh
	YVQNSM5RtZSiZjTGV8T3acZHI5J4/R+KFTJA0T0+TV2USiebVOxk
X-Gm-Gg: ASbGnctd0tnZnYH/Tu3KSpXI3Rvcd++qVisg15QJgDoje3kBZWk11b3iUZSIwjbATGG
	eLiafdwnguzCwv6U6rsedVmubtWmXtNMPtjv581SDaLmsw4wEIYTrdUjEEzs1etCfevbVpvwE/u
	TppWF8EvafZPVvOTquuZHnTv3B36H9zjSWfowimwbyBii8o+sUp4QqUBWcXpgTZl90TxcaQzs7r
	CIC1nMmfQPRihxKgFryj6Ft7L0B6b/OF2g51vGNEyxfGS9c+QSrIo9zaw==
X-Google-Smtp-Source: AGHT+IEyIi6HUO2JQkKFOryXmvrGOODz762o8X1d/ZKS40A3Z+2xFbGPPKo+iWXpIpSeQRfaF7gWBg==
X-Received: by 2002:a17:902:f54e:b0:215:e98c:c5b5 with SMTP id d9443c01a7336-219e6e8c5c5mr484887255ad.1.1735470852783;
        Sun, 29 Dec 2024 03:14:12 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca02544sm161655895ad.255.2024.12.29.03.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 03:14:12 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v4 RESEND 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Date: Sun, 29 Dec 2024 19:11:18 +0800
Message-ID: <20241229111322.4139-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229111322.4139-1-towinchenmi@gmail.com>
References: <20241229111322.4139-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add driver for backlight controllers attached via Apple DWI 2-wire
interface, which is found on some Apple iPhones, iPads and iPod touches
with a LCD display.

Although there is an existing apple_bl driver, it is for backlight
controllers on Intel Macs attached via PCI, which is completely different
from the Samsung-derived DWI block.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/video/backlight/Kconfig  |  12 +++
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/dwi_bl.c | 122 +++++++++++++++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 drivers/video/backlight/dwi_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 3614a5d29c71..debb1326df63 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -290,6 +290,18 @@ config BACKLIGHT_APPLE
 	  If you have an Intel-based Apple say Y to enable a driver for its
 	  backlight.
 
+config BACKLIGHT_APPLE_DWI
+	tristate "Apple DWI 2-Wire Interface Backlight Driver"
+	depends on ARCH_APPLE || COMPILE_TEST
+	default y
+	help
+	  Say Y to enable the backlight driver for backlight controllers
+	  attached via the Apple DWI 2-wire interface which is found in some
+	  Apple iPhones, iPads and iPod touches.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called dwi_bl.
+
 config BACKLIGHT_QCOM_WLED
 	tristate "Qualcomm PMIC WLED Driver"
 	select REGMAP
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 8fc98f760a8a..45cc80d9ae22 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_BACKLIGHT_ADP5520)		+= adp5520_bl.o
 obj-$(CONFIG_BACKLIGHT_ADP8860)		+= adp8860_bl.o
 obj-$(CONFIG_BACKLIGHT_ADP8870)		+= adp8870_bl.o
 obj-$(CONFIG_BACKLIGHT_APPLE)		+= apple_bl.o
+obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= dwi_bl.o
 obj-$(CONFIG_BACKLIGHT_AS3711)		+= as3711_bl.o
 obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
new file mode 100644
index 000000000000..59e5cad0fbd8
--- /dev/null
+++ b/drivers/video/backlight/dwi_bl.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Driver for backlight controllers attached via Apple DWI 2-wire interface
+ *
+ * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define DWI_BL_CTL			0x0
+#define DWI_BL_CTL_SEND1		BIT(0)
+#define DWI_BL_CTL_SEND2		BIT(4)
+#define DWI_BL_CTL_SEND3		BIT(5)
+#define DWI_BL_CTL_LE_DATA		BIT(6)
+/* Only used on Apple A9 and later */
+#define DWI_BL_CTL_SEND4		BIT(12)
+
+#define DWI_BL_CMD			0x4
+#define DWI_BL_CMD_TYPE			GENMASK(31, 28)
+#define DWI_BL_CMD_TYPE_SET_BRIGHTNESS	0xa
+#define DWI_BL_CMD_DATA			GENMASK(10, 0)
+
+#define DWI_BL_CTL_SEND			(DWI_BL_CTL_SEND1 | \
+					 DWI_BL_CTL_SEND2 | \
+					 DWI_BL_CTL_SEND3 | \
+					 DWI_BL_CTL_LE_DATA | \
+					 DWI_BL_CTL_SEND4)
+
+#define DWI_BL_MAX_BRIGHTNESS		2047
+
+struct apple_dwi_bl {
+	void __iomem *base;
+};
+
+static int dwi_bl_update_status(struct backlight_device *bl)
+{
+	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
+
+	int brightness = backlight_get_brightness(bl);
+
+	u32 cmd = 0;
+
+	cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
+	cmd |= FIELD_PREP(DWI_BL_CMD_TYPE, DWI_BL_CMD_TYPE_SET_BRIGHTNESS);
+
+	writel(cmd, dwi_bl->base + DWI_BL_CMD);
+	writel(DWI_BL_CTL_SEND, dwi_bl->base + DWI_BL_CTL);
+
+	return 0;
+}
+
+static int dwi_bl_get_brightness(struct backlight_device *bl)
+{
+	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
+
+	u32 cmd = readl(dwi_bl->base + DWI_BL_CMD);
+
+	return FIELD_GET(DWI_BL_CMD_DATA, cmd);
+}
+
+static const struct backlight_ops dwi_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.get_brightness = dwi_bl_get_brightness,
+	.update_status	= dwi_bl_update_status
+};
+
+static int dwi_bl_probe(struct platform_device *dev)
+{
+	struct apple_dwi_bl *dwi_bl;
+	struct backlight_device *bl;
+	struct backlight_properties props;
+	struct resource *res;
+
+	dwi_bl = devm_kzalloc(&dev->dev, sizeof(*dwi_bl), GFP_KERNEL);
+	if (!dwi_bl)
+		return -ENOMEM;
+
+	dwi_bl->base = devm_platform_get_and_ioremap_resource(dev, 0, &res);
+	if (IS_ERR(dwi_bl->base))
+		return PTR_ERR(dwi_bl->base);
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;
+
+	bl = devm_backlight_device_register(&dev->dev, dev->name, &dev->dev,
+					dwi_bl, &dwi_bl_ops, &props);
+	if (IS_ERR(bl))
+		return PTR_ERR(bl);
+
+	platform_set_drvdata(dev, dwi_bl);
+
+	bl->props.brightness = dwi_bl_get_brightness(bl);
+
+	return 0;
+}
+
+static const struct of_device_id dwi_bl_of_match[] = {
+	{ .compatible = "apple,dwi-bl" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, dwi_bl_of_match);
+
+static struct platform_driver dwi_bl_driver = {
+	.driver		= {
+		.name	= "dwi-bl",
+		.of_match_table = dwi_bl_of_match
+	},
+	.probe		= dwi_bl_probe,
+};
+
+module_platform_driver(dwi_bl_driver);
+
+MODULE_DESCRIPTION("Apple DWI Backlight Driver");
+MODULE_AUTHOR("Nick Chan <towinchenmi@gmail.com>");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.47.1

