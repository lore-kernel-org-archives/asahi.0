Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22E05103F
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577878; cv=none; b=Z8Jt3g2hoo50ztTs9sgKsgYHGcnoAqRJLtQUw/kKJRD2fwGjawmNl1SNHNqcbNrS2Un0GbliQDWMtnxUlHLd39lOa9cpsd9kU1/IBYbUV9GzfulBayWMmOJFJT9EI8Ji6iKMDk5gwkcza6vKMz2CWhZ1Ym9bS2mhgLAXp5TJRWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577878; c=relaxed/simple;
	bh=Zuc1I8TT4ZyUSdQ6djt01chHpoOe1TMWUTTGeSumqHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dHbz6M5n1+coln8qSvw25fcq9Lx5o0R0GtXQQW3Hh2Ed3A2pLvDZfS139xktixuOaSj22qkMsOQs6EJ0z0WcUg7tdbxCcGiK4PPc/lNA6zDcqnRTtE+ZB4ckTvm+w9F3hb9ajM3iChUqSvt1NH4xuSav+2vNaLwbx9QEgXvirm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIbroG4V; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIbroG4V"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220c8f38febso48962405ad.2
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577876; x=1740182676; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1uOScahEEFhtiWZmGcmum0wyFSflQxWR2mBa6Jo9Q0=;
        b=aIbroG4VulK/qLZxVkQQwnSFGOCCDZYgXlgJ1ww7zCJCYjktPJqoHW2jdKcJq8Ui3k
         t+3gHLgilCK82KwXrUdQTNs+QybI95sHScw2EkFfTRsrOQ2+IZgj0t5zKkNxa6xw6D+1
         4bi+6GtL+QuTseQx2KRCEly+nWpuvZt4orFFG716f3EP8jUFGSyrf4XecAiujrgBeVzl
         GZmv/0KyiUr6Pp4AkmkbEhUHAh+V4HP3S2tOgdTAQAQrCVgQJ3IovL0sH4b196lrfrhO
         WWBm6WXEgN6j97eZ617FSE+CcFh/eRoyQ3oFsG1CoTTVGmU0GVqZfOGM7Y/IsZjXNRTh
         c76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577876; x=1740182676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1uOScahEEFhtiWZmGcmum0wyFSflQxWR2mBa6Jo9Q0=;
        b=vfcq6tNBQMZR0CAB5TR6bSLdEd9BEKyzU28feh+/bSFPciBnyIY/eRTdsiEoFPSGRW
         2Ito5yjD6NN422HU+/Cm6cm9yZLVeLP0TKI0MiET/D+y6O3etBEYDcDNuuYdT7MlXxln
         VDoxkHj+XP7g5tATgQl/RnM6B7ddsu8RLELNuqwFePgM6FA+uDC8ZVzeqSRABCPpWq5r
         mwg+7JjfUo3CEfD9+J3EW4iLsySqR2ewB88EeAyO5fo6cNkhVufMy6OXyhVcLi72Q9Tu
         MYl5iwhyU4w6wCENmghNaKwWrND5+yZl9JulrrBN7etjIJ1dgbIgw6sKrXv+XcjNOUhe
         Z7gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaLrcWIhmaNaZJ5awfyApN7CvvP2FALS5lX/WGqBf5B28AwG3d3zgNSMdk3jZOxZ6koRPgrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6Y1h8/BfyyONW19HtWWS1hvkuxGto9JGD2V2UuyLRwB61VfLr
	MZVe//+8X2RzxYpbekOCIdDTD0N3nbsAwpq1JSTdLTXWV5Vhe1N7
X-Gm-Gg: ASbGncv1+bmYdVq00MCudOyFA/gcQgQPx/cxJKOSjebOzVJIMGdmMjiAAxm3X8/D8pB
	3qcrdBXbmTgUJ5g3G5Aj5g1zfgEqfVb2Y9CdaMRmcabZvxBtlcg/tU1qg7PgJSPHwSWPSmVfXQ5
	s1u0klTHJ6HKO7gJLeayTB3TOYHhSg4JL+YzsW+Y60i47Q1XbR56ClahYqDt7qd/JB8KdPq/p79
	CBppAdhwAdEh7Jo8e+E+QRq4lUJxkY4Ic76drRAZN7YJ8GgecCjufvWbHQoB9RHmfFuMxzNlTdU
	MWti8OY9A2NM9GfzRwXC4SkB44ybTytZUNNtcafJwI/DppfFw3kAuMFLAzikB4zQn/XKWDyC6zS
	lri9TnzdBHg==
X-Google-Smtp-Source: AGHT+IFM0dkXeXbf5JFHi/pDT6Wk/MrMpvxLc0SbbjSaYemzUXIi1yvFx1pgJhmq4OzzUyfVzhNe/w==
X-Received: by 2002:a17:902:e848:b0:216:31aa:12eb with SMTP id d9443c01a7336-22104064cd6mr18187655ad.31.1739577876009;
        Fri, 14 Feb 2025 16:04:36 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:04:35 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:45 +1000
Subject: [PATCH 12/27] ASoC: tas2764: Export 'die_temp' to sysfs
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250215-apple-codec-changes-v1-12-723569b21b19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3404;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Y3N6Dh3kVHE96LUsCuZ6vzwsDaQ59NOokhGRMET8DmQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb2479WdKn0LDY5GCu9u6tsuFrLDhvjjX6snKhxLCp
 8XeP/sq01HKwiDGxSArpsiyoUnIY7YR281+kcq9MHNYmUCGMHBxCsBE1qcxMqxaI3fLcNu3sOyj
 nuxXUr/I5q4/dXm/6f/EJxP2iP6Zt3gmI8NUH6fex2d/GTXFuls8Tgxj+fU08bS1fseDDS/W/pC
 2jecGAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Export a file for the readout of die temperature measurements.
As per the datasheet, the temperature can be calculated by
subtracting the value in the register by 93.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 45 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h |  3 ++
 2 files changed, 48 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index e32ac441cf3cfc8fd8c6a1839c68e84ac9347150..25238d3721a21d5af8434490acfdb7ba53de9ce0 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -571,6 +572,39 @@ static int tas2764_apply_init_quirks(struct tas2764_priv *tas2764)
 	return 0;
 }
 
+static int tas2764_read_die_temp(struct tas2764_priv *tas2764, int *result)
+{
+	int ret;
+
+	ret = snd_soc_component_read(tas2764->component, TAS2764_TEMP);
+	if (ret < 0)
+		return ret;
+	*result = ret - 93;
+	return 0;
+}
+
+static ssize_t die_temp_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	struct tas2764_priv *tas2764 = i2c_get_clientdata(to_i2c_client(dev));
+	int ret, temp;
+
+	ret = tas2764_read_die_temp(tas2764, &temp);
+
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%d C\n", temp);
+}
+
+static DEVICE_ATTR_RO(die_temp);
+
+static struct attribute *tas2764_sysfs_attrs[] = {
+	&dev_attr_die_temp.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(tas2764_sysfs);
+
 static int tas2764_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
@@ -664,9 +698,19 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 			return ret;
 	}
 
+	ret = sysfs_create_groups(&component->dev->kobj, tas2764_sysfs_groups);
+
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
+static void tas2764_codec_remove(struct snd_soc_component *component)
+{
+	sysfs_remove_groups(&component->dev->kobj, tas2764_sysfs_groups);
+}
+
 static DECLARE_TLV_DB_SCALE(tas2764_digital_tlv, 1100, 50, 0);
 static DECLARE_TLV_DB_SCALE(tas2764_playback_volume, -10050, 50, 1);
 
@@ -698,6 +742,7 @@ static const struct snd_kcontrol_new tas2764_snd_controls[] = {
 
 static const struct snd_soc_component_driver soc_component_driver_tas2764 = {
 	.probe			= tas2764_codec_probe,
+	.remove			= tas2764_codec_remove,
 	.suspend		= tas2764_codec_suspend,
 	.resume			= tas2764_codec_resume,
 	.controls		= tas2764_snd_controls,
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index 10ef7d4a490e1dec3ba9c824479a6d35ac57f33e..dbe3f7fa90187919b017eb2d59a67cfffc222735 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -111,6 +111,9 @@
 #define TAS2764_INT_LTCH3               TAS2764_REG(0x0, 0x50)
 #define TAS2764_INT_LTCH4               TAS2764_REG(0x0, 0x51)
 
+/* Readout Registers */
+#define TAS2764_TEMP                    TAS2764_REG(0x0, 0x56)
+
 /* Clock/IRQ Settings */
 #define TAS2764_INT_CLK_CFG             TAS2764_REG(0x0, 0x5c)
 #define TAS2764_INT_CLK_CFG_IRQZ_CLR    BIT(2)

-- 
2.48.1

