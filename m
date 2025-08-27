Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533C8350D57
	for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 11:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293822; cv=none; b=CNCWmY+Elqlg4BNME2/yie2QrFnrOj6ZW27vCW1ksfUu0mJHGCXJflm9S4VfI/qFMF5+7K22p48vZrtWiDzurPuOhsX82fZavv3vVIgH7N2gGuvZi7yadQEYwaCzn2TbJlgTFBQkTZlMqBtnGqO7oiAowCGhToeFDps6Kx44/S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293822; c=relaxed/simple;
	bh=aUnhkhc25O58Fa5YqFoMV6tmixZgQOKzbHMDZifR9M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5TGf9m1xNbt91z016qZEdbAN+kVhGQiF9AZESxsy66/vViAwvnkhj063TVg/cL7ULFUDzTKvmNi9Dtccs2jHzw+JY4Ar8UNvqeKpOIp8wUuMxhRZbT8chC6jFEjoZP9a7PJlzzKE3Vv2rWb/ngm6r//nIZsa3NFhWqoLmohPvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOehIZby; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOehIZby"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-24626e06f04so43801945ad.2
        for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 04:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293819; x=1756898619; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwFBAcqDyw+S573uPLSPlKVhyOT8QYSk9uAcEnyCHgg=;
        b=mOehIZbyFQUI/efnxxWY4JY/mPqin1djY0QKYUVpX29yN6Y5Jlgw3hvQbU4mVQH+uA
         FGgs+gilHklyciZH9H+gxb5mRawAKlLmEiahgWUUrnKcZO0/07ZKMts0qxdW0A6GhTO+
         E/jdIuAp5mMkyvRSP4U4jV6i2g919hfxelzsN/tR2Ir8zxgnwZe94dI8goFQmZWssGhN
         o2LLL/HaXVSw54Rmv+gQzgI8BPH/YEgxaRJkMVwA+Rs7+jYfEKRQ4Nq3dEUUVSkgjh/h
         WnqPdCSoZYN3f03Y71IsKTgjRr+0Br6z65e+SslwBIxMJX4LKyxUCF50EAsLW6TSvEyw
         nhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293819; x=1756898619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwFBAcqDyw+S573uPLSPlKVhyOT8QYSk9uAcEnyCHgg=;
        b=Oa7zDk3xxfdHvRcM+4LC+Xh0c3aS98qruPWQsYY199lSNgXyIMYatM8x0/87msiPEB
         QtAAKuT/Z7YRd+Mog+FL3kIOQaWxAZn9wB43sSt5kj5X/BfZf41hs+gCbdzjzX7y7jAD
         jHkLuZh1IoSexiA/tEBlG6P6HFH+BC6F7RZ7I26yEJLhVy+79sNZF4om53o+J/h77J95
         cg3l3NUGqpm43Q1Ih1NnHWOC+qv0Xs4Aebw3sqwERdpz6foXSnUuFc7H2ImBQJ8vaHla
         iNdVz7oTIhOBgOsZd1eLyUiSSefpFrpjdIs0CwTeVmoI8HHq7ITdBfpKzlvffRnlsT5U
         ki9A==
X-Gm-Message-State: AOJu0YzCFILdrOl5QXANZXMRz7BgMl/hnJ69CBPdyRXDFa/6lPy40MVh
	4F314cPEBRE0wIUSby00jIK4z3jCzWti33Qp5/dynu8C4Pw6wao6WLto
X-Gm-Gg: ASbGncsrZUfBSoQgbzNoPyg68pJrXktv9VgdRifbcdW+6iADzPa47QWtx5tOMlQIwxH
	m3gdjsydn9OQStIfULQexXBL+uHmptwGhVmLbcKGDdJJEfnpas8JTEm9iEUExaruDbSaU0zo/wr
	w466eMMtdiuncWImoHO4BxhTMRap6WO/2Uj2dtiTsRt9RtHZSh7wlbcY2upG/1zL1HUS8L9Ab6r
	nZX/mp7fN6KYD7VIbXd3BhUxayT0/iwUy9MNevp0FnDky7x6D+YBVbInvbOO14pdEHyss3johxz
	5TdYt/8JhkoSzqwekjP/dhPMvN7C+qHG9j3akPFbVuBtRpOxQR49h2GjEfVKC9ZozXC3wdMaAT1
	zq/xL4//KKG79wJx+Q6jLd4XciIjZHlCJFgoTAv6SBa0Jsh03DcfrMxKAjHwec9QXtwE7JHGD6q
	TaSodRty18dh8uwXIG4iGZgD+WeEk=
X-Google-Smtp-Source: AGHT+IFJaHVzCNRC2Yngvs+SjY+onmdAmALaD5W/5FLvmbcKLAz64u5tbi8pbz4jZXP8aGLhEK2vxg==
X-Received: by 2002:a17:903:228f:b0:246:61e:b562 with SMTP id d9443c01a7336-2462f1d5493mr247040625ad.59.1756293819391;
        Wed, 27 Aug 2025 04:23:39 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:39 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:41 +1000
Subject: [PATCH v2 07/11] input: macsmc-hid: New driver to handle the Apple
 Mac SMC buttons/lid
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-7-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9195;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=svsWxCO/igBOuKhszf8mGDGeWre4rxAc9E2zZQZ5XiQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjW/2qQR8ZqPOafC+tE/P5PH0WetvN4qxElfeyHg5
 vru7YOejlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACbi/5WR4UrfG6MzTrVZj3o/
 iF22sl7iX3r5u2r3hu13Z2/xsi2bdpyRoU30lZpSpnCG60354nnJLTIFigH1dvIGJuxGLz5s3NL
 JCgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

This driver implements power button and lid switch support for Apple Mac
devices using SMC controllers driven by the macsmc driver.

In addition to basic input support, this also responds to the final
shutdown warning (when the power button is held down long enough) by
doing an emergency kernel poweroff. This allows the NVMe controller to
be cleanly shut down, which prevents data loss for in-cache data.

Signed-off-by: Hector Martin <marcan@marcan.st>
Co-developed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 MAINTAINERS                     |   1 +
 drivers/input/misc/Kconfig      |  11 ++
 drivers/input/misc/Makefile     |   1 +
 drivers/input/misc/macsmc-hid.c | 209 +++++++++++++++++++++++++
 4 files changed, 222 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2eb23522654dd050262eb06e077587030cc335aa..b3b5220fcd0d4bbef67613c8ee9afa880c0aa45d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2412,6 +2412,7 @@ F:	drivers/hwmon/macsmc_hwmon.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
+F:	drivers/input/misc/macsmc-hid.c
 F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 0fb21c99a5e3d1230d7f40f99e0c2d360bbe80e8..a430c50e7f63f245bba56bd526026ec7901cf821 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -961,4 +961,15 @@ config INPUT_STPMIC1_ONKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called stpmic1_onkey.
 
+config INPUT_MACSMC_HID
+	tristate "Apple Mac SMC lid/buttons"
+	depends on MFD_MACSMC
+	help
+	  Say Y here if you want to use the input events delivered via the
+	  SMC controller on Apple Mac machines using the macsmc driver.
+	  This includes lid open/close and the power button.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called macsmc-hid.
+
 endif
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index d468c8140b93da5bb537e8a3baea2b90e7bb4229..95b8ebbb9ebbe6f3afc9db724d2ebeba1d75d1a6 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_INPUT_IQS7222)		+= iqs7222.o
 obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
 obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
 obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
+obj-$(CONFIG_INPUT_MACSMC_HID)		+= macsmc-hid.o
 obj-$(CONFIG_INPUT_MAX77650_ONKEY)	+= max77650-onkey.o
 obj-$(CONFIG_INPUT_MAX77693_HAPTIC)	+= max77693-haptic.o
 obj-$(CONFIG_INPUT_MAX8925_ONKEY)	+= max8925_onkey.o
diff --git a/drivers/input/misc/macsmc-hid.c b/drivers/input/misc/macsmc-hid.c
new file mode 100644
index 0000000000000000000000000000000000000000..c7cd56e5c17f08936cc623f7d3690f27e05012a5
--- /dev/null
+++ b/drivers/input/misc/macsmc-hid.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC input event driver
+ * Copyright The Asahi Linux Contributors
+ *
+ * This driver exposes HID events from the SMC as an input device.
+ * This includes the lid open/close and power button notifications.
+ */
+
+#include <linux/device.h>
+#include <linux/input.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/macsmc.h>
+#include <linux/module.h>
+#include <linux/reboot.h>
+
+/**
+ * struct macsmc_hid
+ * @dev: Underlying struct device for the HID sub-device
+ * @smc: Pointer to apple_smc struct of the mfd parent
+ * @input: Allocated input_dev; devres managed
+ * @nb: Notifier block used for incoming events from SMC (e.g. button pressed down)
+ * @wakeup_mode: Set to true when system is suspended and power button events should wake it
+ */
+struct macsmc_hid {
+	struct device *dev;
+	struct apple_smc *smc;
+	struct input_dev *input;
+	struct notifier_block nb;
+	bool wakeup_mode;
+};
+
+#define SMC_EV_BTN 0x7201
+#define SMC_EV_LID 0x7203
+
+#define BTN_POWER		0x01 /* power button on e.g. Mac Mini chasis pressed */
+#define BTN_TOUCHID		0x06 /* combined TouchID / power button on MacBooks pressed */
+#define BTN_POWER_HELD_SHORT	0xfe /* power button briefly held down */
+#define BTN_POWER_HELD_LONG	0x00 /* power button held down; sent just before forced poweroff */
+
+static void macsmc_hid_event_button(struct macsmc_hid *smchid, unsigned long event)
+{
+	u8 button = (event >> 8) & 0xff;
+	u8 state = !!(event & 0xff);
+
+	switch (button) {
+	case BTN_POWER:
+	case BTN_TOUCHID:
+		if (smchid->wakeup_mode) {
+			if (state)
+				pm_wakeup_hard_event(smchid->dev);
+		} else {
+			input_report_key(smchid->input, KEY_POWER, state);
+			input_sync(smchid->input);
+		}
+		break;
+	case BTN_POWER_HELD_SHORT: /* power button held down; ignore */
+		break;
+	case BTN_POWER_HELD_LONG:
+		/*
+		 * If we get here the power button has been held down for a while and
+		 * we have about 4 seconds before forced power-off is triggered by SMC.
+		 * Try to do an emergency shutdown to make sure the NVMe cache is
+		 * flushed. macOS actually does this by panicing (!)...
+		 */
+		if (state) {
+			dev_crit(smchid->dev, "Triggering forced shutdown!\n");
+			if (kernel_can_power_off())
+				kernel_power_off();
+			else /* Missing macsmc-reboot driver? */
+				kernel_restart("SMC power button triggered restart");
+		}
+		break;
+	default:
+		dev_warn(smchid->dev, "Unknown SMC button event: %04lx\n", event & 0xffff);
+	}
+}
+
+static void macsmc_hid_event_lid(struct macsmc_hid *smchid, unsigned long event)
+{
+	u8 lid_state = !!((event >> 8) & 0xff);
+
+	if (smchid->wakeup_mode && !lid_state)
+		pm_wakeup_hard_event(smchid->dev);
+
+	input_report_switch(smchid->input, SW_LID, lid_state);
+	input_sync(smchid->input);
+}
+
+static int macsmc_hid_event(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct macsmc_hid *smchid = container_of(nb, struct macsmc_hid, nb);
+	u16 type = event >> 16;
+
+	switch (type) {
+	case SMC_EV_BTN:
+		macsmc_hid_event_button(smchid, event);
+		return NOTIFY_OK;
+	case SMC_EV_LID:
+		macsmc_hid_event_lid(smchid, event);
+		return NOTIFY_OK;
+	default:
+		/* SMC event meant for another driver */
+		return NOTIFY_DONE;
+	}
+}
+
+static int macsmc_hid_probe(struct platform_device *pdev)
+{
+	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
+	struct macsmc_hid *smchid;
+	bool have_lid, have_power;
+	int ret;
+
+	/* Bail early if this SMC neither supports power button nor lid events */
+	have_lid = apple_smc_key_exists(smc, SMC_KEY(MSLD));
+	have_power = apple_smc_key_exists(smc, SMC_KEY(bHLD));
+	if (!have_lid && !have_power)
+		return -ENODEV;
+
+	smchid = devm_kzalloc(&pdev->dev, sizeof(*smchid), GFP_KERNEL);
+	if (!smchid)
+		return -ENOMEM;
+
+	smchid->dev = &pdev->dev;
+	smchid->smc = smc;
+	platform_set_drvdata(pdev, smchid);
+
+	smchid->input = devm_input_allocate_device(&pdev->dev);
+	if (!smchid->input)
+		return -ENOMEM;
+
+	smchid->input->phys = "macsmc-hid (0)";
+	smchid->input->name = "Apple SMC power/lid events";
+
+	if (have_lid)
+		input_set_capability(smchid->input, EV_SW, SW_LID);
+	if (have_power)
+		input_set_capability(smchid->input, EV_KEY, KEY_POWER);
+
+	ret = input_register_device(smchid->input);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register input device: %d\n", ret);
+		return ret;
+	}
+
+	if (have_lid) {
+		u8 val;
+
+		ret = apple_smc_read_u8(smc, SMC_KEY(MSLD), &val);
+		if (ret < 0)
+			dev_warn(&pdev->dev, "Failed to read initial lid state\n");
+		else
+			input_report_switch(smchid->input, SW_LID, val);
+	}
+
+	if (have_power) {
+		u32 val;
+
+		ret = apple_smc_read_u32(smc, SMC_KEY(bHLD), &val);
+		if (ret < 0)
+			dev_warn(&pdev->dev, "Failed to read initial power button state\n");
+		else
+			input_report_key(smchid->input, KEY_POWER, val & 1);
+	}
+
+	input_sync(smchid->input);
+
+	smchid->nb.notifier_call = macsmc_hid_event;
+	blocking_notifier_chain_register(&smc->event_handlers, &smchid->nb);
+
+	device_init_wakeup(&pdev->dev, 1);
+
+	return 0;
+}
+
+static int macsmc_hid_pm_prepare(struct device *dev)
+{
+	struct macsmc_hid *smchid = dev_get_drvdata(dev);
+
+	smchid->wakeup_mode = true;
+	return 0;
+}
+
+static void macsmc_hid_pm_complete(struct device *dev)
+{
+	struct macsmc_hid *smchid = dev_get_drvdata(dev);
+
+	smchid->wakeup_mode = false;
+}
+
+static const struct dev_pm_ops macsmc_hid_pm_ops = {
+	.prepare = macsmc_hid_pm_prepare,
+	.complete = macsmc_hid_pm_complete,
+};
+
+static struct platform_driver macsmc_hid_driver = {
+	.driver = {
+		.name = "macsmc-hid",
+		.pm = &macsmc_hid_pm_ops,
+	},
+	.probe = macsmc_hid_probe,
+};
+module_platform_driver(macsmc_hid_driver);
+
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Apple SMC HID driver");
+MODULE_ALIAS("platform:macsmc-hid");

-- 
2.51.0

