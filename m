Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0660F156C76
	for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 04:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739505855; cv=none; b=ow8xf6NSrm0bfdbYwwMvKqB+xD8fe6a3PwJjl5zazKKix9/gKyS1HYokdVZMnk6hDyAg8YOoUORpzvJH45VA/GlHJqMqBqh4cYX1mWrko9pbA1FhZy16bWjlGa3WdpCtJStJ/1IH4sJIz4gOJohEXfpckE2SdB03xXT08g8VIHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739505855; c=relaxed/simple;
	bh=3GL2/WeIQojBOOSCQVtLEOFC8W4Kf1COEU0/3t8SOG0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XGAbrVzs729JDzrx98TIvsVywCoXq8G2wq9qlm1vEzLK1u1stTeLIBsfRU30p+xgap9w5CXo3hSh0EVJ/jpUqHycF7ieyhC7NgyQfj8lX82FnQ0KrN+GM3dId7thUlzKp03wZDiF+hDv2IunufWBwSUZeVqr7PH/K3C1xCvwWiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6Xr5ArG; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6Xr5ArG"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220bfdfb3f4so33423685ad.2
        for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 20:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739505853; x=1740110653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=THGbXf//SrScK+32A3BUuAqCods80KxGwHDBckzXHsI=;
        b=I6Xr5ArGMG0flpzM5NKg+fx+HL3Ko4D7dblY/Zbtq+O1a9T3P0z6HNVss3D+iFqN2n
         TKMTIxEzjbtJoYjj1XVzoHTzgRcg5TLmez8kSSfn09L7jT/m/sB5CeesYYQZgfVY9Nlq
         f4yFmiEivf0ojaRrZO4QaCTiSVKwCkhdgpCtfsyR64qg/cQhAL0ZOtpYZYPzWpaj1r8M
         YBNTZVW0Dl5lxB7lSbaHZy/eCGN+98B1mj5rdkn+2D78yqF/PpBTl5P2cKyEall9Faac
         eZNQT7yYwL4bkAS4vVRU0opaC5PHsATcqK+sIGfJXyEp/+etiuud39SIgGvBXUF9lnfm
         osWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739505853; x=1740110653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THGbXf//SrScK+32A3BUuAqCods80KxGwHDBckzXHsI=;
        b=pYz7vScjt1SBmBnyazySEx5c6L7EPAwTxV+3vYj+WX3G0f6YyhaToZGbN2+Mw8BcDI
         AEcnhL5MxCM53RHC6Ns5OdoMdXNw2DQvNeqZAyooKyUC0tQOWpypvq6zOPG/jCZV/Zo3
         arcrSYGS3Ub3QpvotSH1yw9VQJjtJAYH1cUjpp/qCAeOxWsHFADxLVuiqeKZFduQuogl
         0PX7pJ3o4WseCH1gJlHXCdqk87DoHI6p9dg29pFgafwwJzjOmaw+TYETU9IMbfEUD/sq
         oXHaU4R9iQ55bZAgN4Rmb0EXtnEpqmjyJTJ8qsKZF+H4U2KuiXjPUZhxXAb0NtKeMvxT
         Z3rg==
X-Forwarded-Encrypted: i=1; AJvYcCX4L38utndpqoV2fNbuDIXu1+UP7Kd+Yc+qwzjb+syaY5/kdIpxzWmi6wEkXoIs1D4bptVXfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVA9vnHK5O0jcpZg18yKVnFgjDWdKv/Tq1cmGh8y3N/V2k0kEH
	adZJZU+XZ+HqID2v3gelS2OuXwMH+40H54IflvlAxBcwXLzTuZel
X-Gm-Gg: ASbGncu6m8UCrZcotmLfK/pSJVx3dYXVWIsDsseyJhHC3Q0uik2U6pifXjThWEyaO+B
	d+/Q0cpIifv0GutC81uBx+ptGnupPqFHGynY73wDrELxBpfBeDVs0AKlP07GPd+B1Xv3E8YZJZC
	p0uHo4A/s25796H12+IG2ANv8/31nl2x0zLE6x9lPvCP9lDPmIeYcnw4aXT5uoQS+rDPqY28zEm
	mVjN3uuzUeri841LOnyMwPgD/6C/b+jhoX3+ugi2IkAts7z07V/14YbYNn5MtFZ5DNJMTWp2QvV
	finM8+e3FT11Luo=
X-Google-Smtp-Source: AGHT+IGxivn76yELBYxib0w0BFCjx4VgWlcePDuyKrKPnZS1ISzc7Gxg04wRI/FeWDE8mSYuN0bpnA==
X-Received: by 2002:a05:6a20:2585:b0:1ed:a812:8860 with SMTP id adf61e73a8af0-1ee5c796e7fmr16856578637.25.1739505853270;
        Thu, 13 Feb 2025 20:04:13 -0800 (PST)
Received: from nick-mbp.. ([49.130.17.220])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7324273e3e7sm2181227b3a.91.2025.02.13.20.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 20:04:12 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Janne Grunau <j@jannau.net>,
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
Subject: [PATCH v6 2/3] backlight: apple_dwi_bl: Add Apple DWI backlight driver
Date: Fri, 14 Feb 2025 12:02:13 +0800
Message-ID: <20250214040306.16312-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
References: <20250214040306.16312-1-towinchenmi@gmail.com>
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

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/video/backlight/Kconfig        |  11 +++
 drivers/video/backlight/Makefile       |   1 +
 drivers/video/backlight/apple_dwi_bl.c | 123 +++++++++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 drivers/video/backlight/apple_dwi_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 3614a5d29c71..cee113bba30f 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -290,6 +290,17 @@ config BACKLIGHT_APPLE
 	  If you have an Intel-based Apple say Y to enable a driver for its
 	  backlight.
 
+config BACKLIGHT_APPLE_DWI
+	tristate "Apple DWI 2-Wire Interface Backlight Driver"
+	depends on ARCH_APPLE || COMPILE_TEST
+	help
+	  Say Y to enable the backlight driver for backlight controllers
+	  attached via the Apple DWI 2-wire interface which is found in some
+	  Apple iPhones, iPads and iPod touches.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called apple_dwi_bl.
+
 config BACKLIGHT_QCOM_WLED
 	tristate "Qualcomm PMIC WLED Driver"
 	select REGMAP
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 8fc98f760a8a..156ff9461fb3 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_BACKLIGHT_ADP5520)		+= adp5520_bl.o
 obj-$(CONFIG_BACKLIGHT_ADP8860)		+= adp8860_bl.o
 obj-$(CONFIG_BACKLIGHT_ADP8870)		+= adp8870_bl.o
 obj-$(CONFIG_BACKLIGHT_APPLE)		+= apple_bl.o
+obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= apple_dwi_bl.o
 obj-$(CONFIG_BACKLIGHT_AS3711)		+= as3711_bl.o
 obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
diff --git a/drivers/video/backlight/apple_dwi_bl.c b/drivers/video/backlight/apple_dwi_bl.c
new file mode 100644
index 000000000000..93bd744972d6
--- /dev/null
+++ b/drivers/video/backlight/apple_dwi_bl.c
@@ -0,0 +1,123 @@
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
+	props.type = BACKLIGHT_PLATFORM;
+	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;
+	props.scale = BACKLIGHT_SCALE_LINEAR;
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
+		.name	= "apple-dwi-bl",
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
2.48.1

