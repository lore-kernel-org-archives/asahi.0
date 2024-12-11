Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121DF230270
	for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 11:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916942; cv=none; b=hzeWd6TTJWOjzg+LBSOWiqRxLmFJ34VulIGM3T18y2p+4KlxxmAewYor3rEI+cWZk9iCuNOMiQoHEbAOoBkbD3ohQGRqmiABR4mOo3W4Jd3wul1m4ZjUFQbqRiEcWfYfbvu2N2uUsRmzmIxpw/N+c8YBZOy9oyc85vgBk3KwOco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916942; c=relaxed/simple;
	bh=/NGZcEXzKfllPc1kHyrV4Jpt9+1VCGGg+ROxJ06pXvI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1Sn297BOJIfBC3azeogO649f7EJzsSmhDt3/wDQ0c5bZlR0SxqJ/O8eUKS3HbSWypDTy3FZlbheixWa5R+Oj7D68prHF2EQSxoN/DJguJBzk/agQJw57kwLIrSL9fqom2GiWV2EpZQf9wUQR6FPa1DVItJhrosP9aWLWEXmBnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDj0swXr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDj0swXr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2163bd70069so35754745ad.0
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 03:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916940; x=1734521740; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkHtq9idtKzQ6fNQxVQI03Qs+Bo7JPqfFg778nP11bo=;
        b=WDj0swXre2kWyDoIX6tHlPoMSuay5/TzxXcMQe2EmLw7J1D8In0WMNsZCuBiSJ0CdD
         gqSJu4BCA8CabzVPkhwr6JyoonuG24vmtIl560VRix9+89Fb7mQuzqryDkU3qSheOYhw
         /Rw63MelB/xEo4andGin2yLaEoM68v1tr0PmUp2hG/9sLzjp6yJVnQ8DJ5ghFFR6ITl0
         ioXu9wy4kzdYwL5vW62iRQyVWkk+AgX1QIq1tur8GJ8W6iM5A0ny14IR9Tx+GHhK3cSL
         Q19cIU35NUQMYeMuhmuHV3jt/P3ndrqecKE0ptQ12Jwq3LLGJmJj/ilYQKZKQkvYNALp
         eWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916940; x=1734521740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkHtq9idtKzQ6fNQxVQI03Qs+Bo7JPqfFg778nP11bo=;
        b=b3857SH+mE2wfPn6SHjJlfLZaEaSufFScSbrt1PkCjoUmLwsHvAlXgOXg4ntT7yP77
         U3wnPKhYMwePXtxjBhYUrMUDsunreDF+x3qyqHWifv7HjAZqpKKXgopx+FfZzSliifHR
         FjbTWxaC5JlIu4EdNM8xdrkwok+fWQCteV/uoyffnJCKyXuA3j8TUqErpqrnIQFASo81
         IOStnpRKIt0N9xy6oz7/PTsCOYwHQ5GSY80I5lbq5xvJoGE5J/4ObvDUNyDPNsDVyQ8d
         7icsrs/quDRISJQhuISBsxU+FKqJm3PiGNo422Y9LGR2wjbSavkCtrXUSmNdRm/ESQ8u
         YXrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaZaCkhmldV89bmkJQxfXWCk2aRtflA2eXQX9miVr0hkJAUukqY1aTDuEhGeUlhKcnhZTV8A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2ISszE2k4sA0NF/g4cqwNvTC+wDTTjCjwHxf3J9bEdvmUxCx/
	ISMlaeOwnIHVlsX6BL1EBb32L4StO5q2NNdVlUBf8Z31VDJF21op
X-Gm-Gg: ASbGncvAk9QddAuIXfYaAxq1P6fOc5zdauwb+So4ZvV2Y/aDH0BnF9HFAcHUgDPbceL
	5F0mV3VfoBEm6ytV5CSFqpgWqJ140CMMapQ044syQLuqYDJxrW+zC5o1vq1HnFKqoKIBy9jhZ9i
	3mLJWS6dCOBo/lXrJd+yP4e403WN0aRz91Cxqbu3BYWuBJcp5iUCjna/e7pKxSrnO+FUB/I9bC/
	cK5fU/0sjqXDzzL4343HdxE2Q8CsamypwewjyywsJhXa2YswvKjlndW+pO4VcIVXsvgUA==
X-Google-Smtp-Source: AGHT+IEvwlSiJ/A/e/bX+VxNlELH+lImFhyckJUBzQs/9yPJZMVZ9VQiinmNaf4t+2eVGwvQVdZbIA==
X-Received: by 2002:a17:902:f646:b0:212:615f:c1 with SMTP id d9443c01a7336-21778534ccamr43159815ad.14.1733916940321;
        Wed, 11 Dec 2024 03:35:40 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-216404df131sm56765635ad.203.2024.12.11.03.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:35:39 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Date: Wed, 11 Dec 2024 19:34:38 +0800
Message-ID: <20241211113512.19009-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211113512.19009-1-towinchenmi@gmail.com>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
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

