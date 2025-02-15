Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07257A945
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577815; cv=none; b=pF9U6/fhmaMqpduneXc4DRLkgVp2W8BJ3DMLarpUB8/oIxZu0fDF6eCN8gabXseE4kQexBlLrhGubRgG890DAVK+BLojxD3wv9uu7aUVeejeEgDFmUjl9GvrVhFgREyS8VHZ8pJoDjXLyam7sol/vzeF+8jI0WyPVghDTja1ahQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577815; c=relaxed/simple;
	bh=K5tVfDxVIZEsRyez0hm061s+077WRMgNNPD4C9/JBi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FScr02AQNdyt4dI8ypwfb5jmF9KKLQXpeNeIRlbR2z17guzqYI1VH7V3C8QNSM9MHWYF8Lh08lsCl3EkeF/w9AJDbIppTTwsx/Ql8VXMWnPsPknbijtDru2SXyaLE53jncThSGsnrdZ5zmx1mPmEPVrWV/sgpFnhj2xk5k2doAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWVi/lt5; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWVi/lt5"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22100006bc8so12058365ad.0
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577813; x=1740182613; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jv85ReZ7VjYl5+JfhrnCtl56IWTOSHkcPrZORl5Q+4=;
        b=hWVi/lt5I8npRJp57iJ16w7hctLYqFU98SYiM8aiuG0qB4OfCG2XNELUxuZQHuaugN
         UUgKXtZiEwL39j5utxNNaSsq/3u62NcMCScvUndJrCGl4T7OGeaIYSq+0zlyz7n/izYL
         Oflj8UsO64F0skD58KTLV5np53CWJEws6IIrNAwwcwLGGcsA9fYFfWNxpfwmBfAuJUoB
         EKy0k64U4QFck3u7HfNJlNQQDcMVrFiZhiaX26NdaZMyBYEAt0A5l9rPQ1W+MW5a//IV
         m9iqEM03wGbcg8TF5Z46nZkvK/AGrtUFGuHphXpgyDlU+npOFxMlhXX0A6V4Pzlg82hS
         QWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577813; x=1740182613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jv85ReZ7VjYl5+JfhrnCtl56IWTOSHkcPrZORl5Q+4=;
        b=c4Vmp1cUT5ztqQ3txB7zGOqLyv17GT8TxJIzGLRWrR0dAKNEjSyctuJ7vmLJc1mZp1
         uAgpbM2KcJyNN+AIg4SSr6nDfj8wRqvkE6m/AnOIfIU8QamDy6sgyAss8n1kkdNP9lu/
         PjQkeFfmeENRaO0JUAo4SW+hhCuk4v7C9f6QKQkIMbL1jPq3Qza5fZ/d6GrIu6/goWTj
         jC+zrk/sqk79VQ5IsAa8uZ1HzaWdTwTDWOAm3BfvIYeWJShqbGtVplrhq9Cp1sZYh4As
         euXjZOz2qZKm/1yBJWto+XdsoGI7XYAqlYfE0dOsyQYMcIl9EFaTNQgi3OcGpkEvt9P9
         7wow==
X-Forwarded-Encrypted: i=1; AJvYcCUjGAKr9WVgBAjpv5jzeI4jPKtfx4iN2MiGU0Ahq4GtdBmUBXHoBG2q7WBFeWixhg4SUHVJtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxI4eBSt1ja6OyiDlJg50DAMaKp1N7vrcvBLcRpUPFdwhXIhdHE
	9HQYlKmT0va5tQKiym2F74UU7u67031LITRSCoH22YAi5k8lxjiv
X-Gm-Gg: ASbGncujeFn91TG+MEaIsCx5ZmbIFepJDxH5fxaO9uMasjZs/4u4cspif0RFwAkVcPs
	U8NJ1kCu+4GnkMieGvCn926vH72RWQOvP5YAS6g9mktPFuHPRmHXPVBXi/SWCvVhua3GyCJ6lc6
	CYbvXP3tcKPF4WZE1MVLZvTfS3wS771OZcGUGwscZQcyuoSHXhGTgeH9Mv0q1NIB+iOAR7URhZP
	uUFNyihRgcxVt2+Ntankba5U4vuxLAZuIiC/g7tcSXBVtk2Dkf0ON/ep9TWvG5vJSVo3QiHU2Pt
	c2IvW+kjjbfqgahoRPLpXdyAKV5LFRUshLaqQjb3bPD9Uib0kipH03WmU8rq9RltCPQ7jb+Ulp/
	NnNnufhEJLA==
X-Google-Smtp-Source: AGHT+IFEDhAwa/6OACwmvv4+D+XKr4lDvPeWnQl1dQoZOOfH/ICfi2cO98uHa/GiWM7IDA2ZKpq2rg==
X-Received: by 2002:a17:903:2308:b0:215:b473:1dc9 with SMTP id d9443c01a7336-221040cf336mr15734255ad.46.1739577813127;
        Fri, 14 Feb 2025 16:03:33 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:03:32 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:36 +1000
Subject: [PATCH 03/27] ASoC: tas2764: Extend driver to SN012776
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250215-apple-codec-changes-v1-3-723569b21b19@gmail.com>
References: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
In-Reply-To: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4941;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=xd2PMfcuPk6XeGMGGgZ6wl2yZJIUxJkQH+xla5YAsnM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb26N5m53SDm3cMacS6ssNts39gitijf9173E4+DK1
 e9SdGQ1O0pZGMS4GGTFFFk2NAl5zDZiu9kvUrkXZg4rE8gQBi5OAZjI0kuMDB9Cvt7fpbV819bu
 RSfCnH5KXskNqj21oIbp1ss3h9rcaqcy/GZh38vvcstMtv3JnW3fCva/PjRjTl/N/IKne/0sW2y
 blrICAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

SN012776 is a speaker amp chip found in Apple's 2021 laptops. It appears
similar and more-or-less compatible to TAS2764. Extend the TAS2764
driver with some SN012776 specifics and configure the chip assuming
it's in one of the Apple machines.

This driver already partially depended on CONFIG_OF/Devicetree, so
drop the pretence that it doesn't, too.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/Kconfig   |  1 +
 sound/soc/codecs/tas2764.c | 46 ++++++++++++++++++++++---
 sound/soc/codecs/tas2764.h |  3 ++
 3 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ee35f3aa55216534037257b45f405a2af06c4872..0636b1f7a178a9ed8050e1567c18b94d446ac564 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1965,6 +1965,7 @@ config SND_SOC_TAS2562
 config SND_SOC_TAS2764
 	tristate "Texas Instruments TAS2764 Mono Audio amplifier"
 	depends on I2C
+	depends on OF
 
 config SND_SOC_TAS2770
 	tristate "Texas Instruments TAS2770 speaker amplifier"
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index d482cd194c08c5c443b82c665de7a6d96531ef2e..e04b8ecab819402b8c3d2b81a2a447730802e968 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -14,6 +14,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
@@ -23,6 +24,11 @@
 
 #include "tas2764.h"
 
+enum tas2764_devid {
+	DEVID_TAS2764  = 0,
+	DEVID_SN012776 = 1
+};
+
 struct tas2764_priv {
 	struct snd_soc_component *component;
 	struct gpio_desc *reset_gpio;
@@ -30,7 +36,8 @@ struct tas2764_priv {
 	struct regmap *regmap;
 	struct device *dev;
 	int irq;
-	
+	enum tas2764_devid devid;
+
 	int v_sense_slot;
 	int i_sense_slot;
 
@@ -526,10 +533,16 @@ static struct snd_soc_dai_driver tas2764_dai_driver[] = {
 	},
 };
 
+static uint8_t sn012776_bop_presets[] = {
+	0x01, 0x32, 0x02, 0x22, 0x83, 0x2d, 0x80, 0x02, 0x06,
+	0x32, 0x46, 0x30, 0x02, 0x06, 0x38, 0x40, 0x30, 0x02,
+	0x06, 0x3e, 0x37, 0x30, 0xff, 0xe6
+};
+
 static int tas2764_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	int ret;
+	int ret, i;
 
 	tas2764->component = component;
 
@@ -578,6 +591,23 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 	if (ret < 0)
 		return ret;
 
+	if (tas2764->devid == DEVID_SN012776) {
+		ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
+					TAS2764_PWR_CTRL_BOP_SRC,
+					TAS2764_PWR_CTRL_BOP_SRC);
+		if (ret < 0)
+			return ret;
+
+		for (i = 0; i < ARRAY_SIZE(sn012776_bop_presets); i++) {
+			ret = snd_soc_component_write(component,
+						TAS2764_BOP_CFG0 + i,
+						sn012776_bop_presets[i]);
+
+			if (ret < 0)
+				return ret;
+		}
+	}
+
 	return 0;
 }
 
@@ -697,6 +727,8 @@ static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)
 	return 0;
 }
 
+static const struct of_device_id tas2764_of_match[];
+
 static int tas2764_i2c_probe(struct i2c_client *client)
 {
 	struct tas2764_priv *tas2764;
@@ -707,6 +739,11 @@ static int tas2764_i2c_probe(struct i2c_client *client)
 	if (!tas2764)
 		return -ENOMEM;
 
+	if (device_is_compatible(&client->dev, "ti,sn012776"))
+		tas2764->devid = DEVID_SN012776;
+	else
+		tas2764->devid = DEVID_TAS2764;
+
 	tas2764->dev = &client->dev;
 	tas2764->irq = client->irq;
 	i2c_set_clientdata(client, tas2764);
@@ -741,13 +778,12 @@ static const struct i2c_device_id tas2764_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, tas2764_i2c_id);
 
-#if defined(CONFIG_OF)
 static const struct of_device_id tas2764_of_match[] = {
-	{ .compatible = "ti,tas2764" },
+	{ .compatible = "ti,tas2764",  },
+	{ .compatible = "ti,sn012776", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tas2764_of_match);
-#endif
 
 static struct i2c_driver tas2764_i2c_driver = {
 	.driver = {
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index 168af772a898ffd1c5e96c50df77ff6225f704cd..0a40166040e7e877ca5d23db6cb65531af12c40b 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -29,6 +29,7 @@
 #define TAS2764_PWR_CTRL_ACTIVE		0x0
 #define TAS2764_PWR_CTRL_MUTE		BIT(0)
 #define TAS2764_PWR_CTRL_SHUTDOWN	BIT(1)
+#define TAS2764_PWR_CTRL_BOP_SRC	BIT(7)
 
 #define TAS2764_VSENSE_POWER_EN		3
 #define TAS2764_ISENSE_POWER_EN		4
@@ -110,4 +111,6 @@
 #define TAS2764_INT_CLK_CFG             TAS2764_REG(0x0, 0x5c)
 #define TAS2764_INT_CLK_CFG_IRQZ_CLR    BIT(2)
 
+#define TAS2764_BOP_CFG0                TAS2764_REG(0X0, 0x1d)
+
 #endif /* __TAS2764__ */

-- 
2.48.1

