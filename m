Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D63D410A
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454513; cv=none; b=dXu/F8lAHN4QOw6YdXLeQriOpclBiUTbpAVDxP/dlakILvAEZRWIwGuEuerUjl5OLKiSp1bMOnIJwF3q53qJEbCtcL1LtUXKXNSUxFJoJHx76tMrQKy9Pwmt/d9wmHXk23tPhtckU8KP7xlGLSsNnHItZT2EYDnh+n9i913PG0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454513; c=relaxed/simple;
	bh=Ndi9ztERcV2E6wj0ZiAD9dw8sa3JKmHNL2DXlielBW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSTedQphqwNvtYLMziwkIjUntpYM7NKi3PlLhWM7Xlfnh/Nyq0qvbk0B9/C1xYlKNGn0g5rYlbjAINrbOre3pI2yKgEjxNDHunh67qg2H8t7yoedZqoDGdxtx2IRNW6lFZkIZZayZsFCw4YCIG9ZWIEYPig+KHnM73Xhqbih5bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=al5q1BLY; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="al5q1BLY"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37df416c45cso291615a91.2
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454510; x=1783059310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0jFp0C/egZc6BQS29FRHENTjPyX9Az93enk7WCGwgo=;
        b=al5q1BLYGRVDl71VHO3cZCp93ln2Kyb6Io1+973lfztS4KwxRCt3keodAjrbPtHtK7
         DKsCrqkIBZnZqEk521KkfPB59+TW8jbexHxeQMjjcTGH6GZB+T3x9XXWpuFBaDxet5D/
         rfV2X7JE6UdNU8NUCmEJM3GDOoeTEFHcriJCaB22Ohz7WK4EkHuvg0A+cRmpaMK7s6me
         pB27wmZnxoWf4V+wKQgG6K0rwj6A0dbVH4OJjJ99FxgHED4Et76yZa61tFwSBWS4aEw9
         iBvACLMQVvzcuC+5n6noOAWd0dvmCgb2e0K8rylz8YGdtbOyXsIR3HfmNAlb8qd/Fpiw
         Onfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454510; x=1783059310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0jFp0C/egZc6BQS29FRHENTjPyX9Az93enk7WCGwgo=;
        b=i81C26Kdn+GdXwkRdlW3oo1NfwUeyZuVJGwK79k9it7Z/ZjbFmwUzTtZxTFPoeU1t/
         BVKNPB/3buvKUIKNx/KhuzGVUJq+XQyH0RnG975mn6apajoXueQlYYlCmLJUIPiSeWoA
         QkO913/TJ5xQhlbfnMlTkSJUuqCuSF7AYXABN+hl2EK/kRSneK6nbPcxPS1wqMQylfmA
         D5BKvcK3XRWjM5C3/wqLLbh4DvRJ4uMhC9UGqyqE10tJn4pOKxAT2pSiMkFlEaaa1/0u
         6Sg4XYvLpmDVIIU2MLW8U44pep/N61ZXsS/P+MKAEsZRermeSGGmW38UTmBw6ngUVfXF
         X9lw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0KvjwN8sSlNetpB7cbN+8XMBq0tTBIk1tItLJ+jBghBPvTgH6o9GSLr5mscH0OLySZD4PBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFnd8XSxn/weX91NbQ89jLoOHu6+BMW6StiY2c0cavMDry68r6
	0+YGTIwdSM1fwoIQ10+atv77Y3/U3FitdLPmCm7ikQavcMkG2ws03EZw
X-Gm-Gg: AfdE7clQEs8lKQ28me6nJ+CD+Bq1H1MARRBSj6sa0j0RnB8h3oPYKWgQ7PMSthdh0ji
	XZDMrgKEsbME/qb0RRidnIVPQ8/cbgom5vBCGO9UEp8nAmWCRKVGBLUOmKa+VyxloGVqseLS1dg
	vjzps8uBA0pee4V2rh3au3lANsnwv005mkSlpDDpSpqejNb5+JsOYs87U/Z93WEEJGPXvbRAuC4
	ypX27K7DLt60UBgkZicIzZPg2HYB2fpablpsXqByupO8IxYLyRD5e9sWclYOfU/UyRMzFvnPc3g
	5u93cTjvfOiGK5UvgmU5Sp4hbUmc6xpdLYRR65P4nfNRfy4Zmfyg77uj7sLT1hv57x9NSfbtDan
	zZSy7MPFfYY51msdRYAUOfm1pVEKmff1wtr6U3QpiCnkBCd87L8hKJglVIzLtYLyxyG201eq/8t
	9mTfqpb01pdcwlLKbQSY2Qx9ZmZpkA6qDds8jue31x2KsMkQfdYmQW/XmuTg==
X-Received: by 2002:a17:90b:3a0e:b0:36d:66d4:270e with SMTP id 98e67ed59e1d1-37df9f382eamr5612576a91.5.1782454510173;
        Thu, 25 Jun 2026 23:15:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:09 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 09/24] ASoC: codecs: aw88395: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:14 +0700
Message-ID: <20260626061329.23264-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/aw88395/aw88395.c        | 24 ++++++--------
 sound/soc/codecs/aw88395/aw88395_device.c | 40 ++++++++---------------
 2 files changed, 24 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index ee0e8bd8c54c..e9ff2c79ac15 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -8,6 +8,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
@@ -51,9 +52,8 @@ static void aw88395_startup_work(struct work_struct *work)
 	struct aw88395 *aw88395 =
 		container_of(work, struct aw88395, start_work.work);
 
-	mutex_lock(&aw88395->lock);
+	guard(mutex)(&aw88395->lock);
 	aw88395_start_pa(aw88395);
-	mutex_unlock(&aw88395->lock);
 }
 
 static void aw88395_start(struct aw88395 *aw88395, bool sync_start)
@@ -224,11 +224,10 @@ static int aw88395_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88395->lock);
+	guard(mutex)(&aw88395->lock);
 	ret = aw88395_dev_set_profile_index(aw88395->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret < 0) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88395->lock);
 		return 0;
 	}
 
@@ -237,8 +236,6 @@ static int aw88395_profile_set(struct snd_kcontrol *kcontrol,
 		aw88395_start(aw88395, AW88395_SYNC_START);
 	}
 
-	mutex_unlock(&aw88395->lock);
-
 	return 1;
 }
 
@@ -366,7 +363,7 @@ static int aw88395_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88395->lock);
+	guard(mutex)(&aw88395->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88395_start(aw88395, AW88395_ASYNC_START);
@@ -377,7 +374,6 @@ static int aw88395_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88395->lock);
 
 	return 0;
 }
@@ -495,12 +491,12 @@ static int aw88395_request_firmware_file(struct aw88395 *aw88395)
 
 	dev_dbg(aw88395->aw_pa->dev, "%s : bin load success\n", __func__);
 
-	mutex_lock(&aw88395->lock);
-	/* aw device init */
-	ret = aw88395_dev_init(aw88395->aw_pa, aw88395->aw_cfg);
-	if (ret < 0)
-		dev_err(aw88395->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88395->lock);
+	scoped_guard(mutex, &aw88395->lock) {
+		/* aw device init */
+		ret = aw88395_dev_init(aw88395->aw_pa, aw88395->aw_cfg);
+		if (ret < 0)
+			dev_err(aw88395->aw_pa->dev, "dev init failed");
+	}
 
 	return ret;
 }
diff --git a/sound/soc/codecs/aw88395/aw88395_device.c b/sound/soc/codecs/aw88395/aw88395_device.c
index 79c3135a4110..12d42d27560d 100644
--- a/sound/soc/codecs/aw88395/aw88395_device.c
+++ b/sound/soc/codecs/aw88395/aw88395_device.c
@@ -8,6 +8,7 @@
 // Author: Ben Yi <yijiangtao@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/i2c.h>
 #include <linux/minmax.h>
@@ -70,7 +71,7 @@ int aw_dev_dsp_write(struct aw_device *aw_dev,
 	u32 reg_value;
 	int ret;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	switch (data_type) {
 	case AW_DSP_16_DATA:
 		ret = aw_dev_dsp_write_16bit(aw_dev, dsp_addr, dsp_data);
@@ -93,7 +94,6 @@ int aw_dev_dsp_write(struct aw_device *aw_dev,
 	/* clear dsp chip select state*/
 	if (regmap_read(aw_dev->regmap, AW88395_ID_REG, &reg_value))
 		dev_err(aw_dev->dev, "%s fail to clear chip state. Err=%d\n", __func__, ret);
-	mutex_unlock(&aw_dev->dsp_lock);
 
 	return ret;
 }
@@ -156,7 +156,7 @@ int aw_dev_dsp_read(struct aw_device *aw_dev,
 	u32 reg_value;
 	int ret;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	switch (data_type) {
 	case AW_DSP_16_DATA:
 		ret = aw_dev_dsp_read_16bit(aw_dev, dsp_addr, dsp_data);
@@ -179,7 +179,6 @@ int aw_dev_dsp_read(struct aw_device *aw_dev,
 	/* clear dsp chip select state*/
 	if (regmap_read(aw_dev->regmap, AW88395_ID_REG, &reg_value))
 		dev_err(aw_dev->dev, "%s fail to clear chip state. Err=%d\n", __func__, ret);
-	mutex_unlock(&aw_dev->dsp_lock);
 
 	return ret;
 }
@@ -1110,42 +1109,36 @@ static int aw_dev_dsp_update_container(struct aw_device *aw_dev,
 #ifdef AW88395_DSP_I2C_WRITES
 	u32 tmp_len;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	ret = regmap_write(aw_dev->regmap, AW88395_DSPMADD_REG, base);
 	if (ret)
-		goto error_operation;
+		return ret;
 
 	for (i = 0; i < len; i += AW88395_MAX_RAM_WRITE_BYTE_SIZE) {
 		tmp_len = min(len - i, AW88395_MAX_RAM_WRITE_BYTE_SIZE);
 		ret = regmap_raw_write(aw_dev->regmap, AW88395_DSPMDAT_REG,
 					&data[i], tmp_len);
 		if (ret)
-			goto error_operation;
+			return ret;
 	}
-	mutex_unlock(&aw_dev->dsp_lock);
 #else
 	__be16 reg_val;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	/* i2c write */
 	ret = regmap_write(aw_dev->regmap, AW88395_DSPMADD_REG, base);
 	if (ret)
-		goto error_operation;
+		return ret;
 	for (i = 0; i < len; i += 2) {
 		reg_val = cpu_to_be16p((u16 *)(data + i));
 		ret = regmap_write(aw_dev->regmap, AW88395_DSPMDAT_REG,
 					(u16)reg_val);
 		if (ret)
-			goto error_operation;
+			return ret;
 	}
-	mutex_unlock(&aw_dev->dsp_lock);
 #endif
 
 	return 0;
-
-error_operation:
-	mutex_unlock(&aw_dev->dsp_lock);
-	return ret;
 }
 
 static int aw_dev_dsp_update_fw(struct aw_device *aw_dev,
@@ -1231,14 +1224,14 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
 {
 	unsigned int reg_val;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	/* check the odd bits of reg 0x40 */
 	regmap_write(aw_dev->regmap, AW88395_DSPMADD_REG, AW88395_DSP_ODD_NUM_BIT_TEST);
 	regmap_read(aw_dev->regmap, AW88395_DSPMADD_REG, &reg_val);
 	if (reg_val != AW88395_DSP_ODD_NUM_BIT_TEST) {
 		dev_err(aw_dev->dev, "check reg 0x40 odd bit failed, read[0x%x] != write[0x%x]",
 				reg_val, AW88395_DSP_ODD_NUM_BIT_TEST);
-		goto error;
+		return -EPERM;
 	}
 
 	/* check the even bits of reg 0x40 */
@@ -1247,7 +1240,7 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
 	if (reg_val != AW88395_DSP_EVEN_NUM_BIT_TEST) {
 		dev_err(aw_dev->dev, "check reg 0x40 even bit failed, read[0x%x] != write[0x%x]",
 				reg_val, AW88395_DSP_EVEN_NUM_BIT_TEST);
-		goto error;
+		return -EPERM;
 	}
 
 	/* check dsp_fw_base_addr */
@@ -1256,7 +1249,7 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
 	if (reg_val != AW88395_DSP_EVEN_NUM_BIT_TEST) {
 		dev_err(aw_dev->dev, "check dsp fw addr failed, read[0x%x] != write[0x%x]",
 						reg_val, AW88395_DSP_EVEN_NUM_BIT_TEST);
-		goto error;
+		return -EPERM;
 	}
 
 	/* check dsp_cfg_base_addr */
@@ -1265,15 +1258,10 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
 	if (reg_val != AW88395_DSP_ODD_NUM_BIT_TEST) {
 		dev_err(aw_dev->dev, "check dsp cfg failed, read[0x%x] != write[0x%x]",
 						reg_val, AW88395_DSP_ODD_NUM_BIT_TEST);
-		goto error;
+		return -EPERM;
 	}
-	mutex_unlock(&aw_dev->dsp_lock);
 
 	return 0;
-
-error:
-	mutex_unlock(&aw_dev->dsp_lock);
-	return -EPERM;
 }
 
 int aw88395_dev_fw_update(struct aw_device *aw_dev, bool up_dsp_fw_en, bool force_up_en)
-- 
2.43.0

