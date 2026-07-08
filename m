Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC3543CEC4
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515119; cv=none; b=BU7Dt7O7Fx+FHrO1Q0s1sEbrKRwhw2x3ehjUPlByG/VbLnPDo3HWUs+PCIf2r2ovIi0FFIsPDn9z+I0XjAq/+tp1rnlXsN99AzMzOJBTF5/FyntgVD77Eep5gjQD2x5/aVnW198K/abBoZpCXqAm90tfoBFF5i8/FLzSYzw/nPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515119; c=relaxed/simple;
	bh=l+jE/ICW3VwCjHs5/VwCJgnhBYlTFKeilmi/IdexrH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXEA9bwhCGi7ljuaVvJL5RZpSgsH+en7c63Sk5osK5N5xJl7PLV8cGvlDGWzaBMXbdR60Ba9ugn/Xijy++G7Zk50fQWVo8q3EfiB+PKnBMNSSZfD2gKa8ykHQrw8vAPFZiIx9VhEsoeH94d7XATOhPmTQ794DZjbSmRg7jzp818=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMN/Jh+z; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMN/Jh+z"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38759bcd877so545639a91.2
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515117; x=1784119917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYGM4NqjESQUWIB0GyhH+Inqu4fPaZ6H5/Lwh6w+p3g=;
        b=GMN/Jh+zVS3Qalx+QntS29iy97IIBdXjYr+ZcOEsVX7+ZD8nGVMGSLrALn3CEtD1YV
         HXoD3owxUe8930WaayoBNYQHy3vZ13ABbHpKCXlyM+/RLf+IYXlh9abtdjoghinc0q+C
         b05wrD4EjOrIR2Ub5Np39bquTXE5L7Q9SFUlqqMVhHq1KDY6uRask5Nj5MvhhCxbrpcA
         TSR23lHe9Ha18f5op4UmtB2Oq387VU0swlcsGD8gKHwzy2JntF1whpTpJV48/AxTJuYt
         NCk6TUImHk3Xtuv3qdaKfAIPET9FqApNKfR/bMRs4et75Wrf/r2ukN1RYmTxASXs/hps
         9dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515117; x=1784119917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nYGM4NqjESQUWIB0GyhH+Inqu4fPaZ6H5/Lwh6w+p3g=;
        b=adrL3pv5VgaeVly3GxP0agYIZWM8o5JzN/F5cmF15r2SSxUkN8zGEiIJQ6vO+km/GZ
         YKy1vRc/4DeYlG4a5HoJ15GAfJZ9s4hAViMaeHt1bGwPKO2KUeFw4IplFI/IIu23JMzX
         R9gsD+wlPZitYpMKOCPuq05WnZ/GC6tp41oZdsYybSeVvFA9e+zstaQKulPKi175yhC0
         mCjoHYNl7VOlf/I+zDF/sMdejZdEbxG7lx2+STJxr6arYzDaMfY5FDPCzT35oHxiI9TN
         BD5gPx/hpzQ7aQsG+VzZHB7jO4WiGTd9jz2o/l4VwRvW2nKpPyzc40pdjXIYlI7soB12
         ov9A==
X-Forwarded-Encrypted: i=1; AHgh+RoIWzKFq9WUIgb/BBYfYjd7e18ep4WuG3AAsLrbllEYIEKDReaAoMkALc8zaZCzBfCf6ON47A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx41gw+yM4uZTny6OpW3ACHWni4k/KVemLnXYMR/RAIZQbtjitw
	Z2WmR9WZ0ueY48JmewR5fkD/CKSyYN9fQtbEDaoyPqwBtcqRH7LXW3Cj
X-Gm-Gg: AfdE7cnRQvHdkFFS/lhHLxOUAN8ug2ZA3yrU00XLGg1KCoONEaI/rJJ9gqvTCEXNQVP
	Nc9q3inX7i72teQt75nGKfaufJjMdd+6HXml+1I/S/2i/q36txRawuQI4FzxJRGDxwWp6e10xkY
	IvGulUGVJJdk+bq1rJVZi9Yc+U5wo6IFm4kYK/MzTTYC9pBuB84kVMXf5dD0AKm784STeylmD/m
	DVd3v4UhY6ncyhQmXRStNxCxETUpMYRKmGaz1Y1QOW63j6aNwBP+ZMGPsYfaUFG+MHWwN8Kwq+6
	85PR9yJ7PbVguorrGzElBkg7lHXkOxmryxoav21wayY20A7jXtmFVI4uNY9XrOV4zcM9zyFQxcy
	kfe79uavHWL1qfrUIr30OqHzx1kePsOhCh/LNKfBO9lg/rMe3KzEuz/+OXelZJIYhE7ZIoJRD0c
	4xTFCxILt/GpNQzCOQ4ZSV7i2gA4bMFdV+ikoYflyrOT7X7fw=
X-Received: by 2002:a17:90a:dfc7:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-38941acc3aamr2520904a91.21.1783515117105;
        Wed, 08 Jul 2026 05:51:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:51:56 -0700 (PDT)
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
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 11/24] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:48 +0700
Message-ID: <20260708125002.202515-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cros_ec_codec.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 7dc5a7c3ca96..fd2d5d7f9276 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
@@ -608,10 +609,10 @@ static void wov_copy_work(struct work_struct *w)
 		container_of(w, struct cros_ec_codec_priv, wov_copy_work.work);
 	int ret;
 
-	mutex_lock(&priv->wov_dma_lock);
+	guard(mutex)(&priv->wov_dma_lock);
 	if (!priv->wov_substream) {
 		dev_warn(priv->dev, "no pcm substream\n");
-		goto leave;
+		return;
 	}
 
 	if (ec_codec_capable(priv, EC_CODEC_CAP_WOV_AUDIO_SHM))
@@ -624,8 +625,6 @@ static void wov_copy_work(struct work_struct *w)
 				      msecs_to_jiffies(10));
 	else if (ret)
 		dev_err(priv->dev, "failed to read audio data\n");
-leave:
-	mutex_unlock(&priv->wov_dma_lock);
 }
 
 static int wov_enable_get(struct snd_kcontrol *kcontrol,
@@ -895,12 +894,11 @@ static int wov_pcm_hw_params(struct snd_soc_component *component,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->wov_dma_lock);
+	guard(mutex)(&priv->wov_dma_lock);
 	priv->wov_substream = substream;
 	priv->wov_rp = priv->wov_wp = 0;
 	priv->wov_dma_offset = 0;
 	priv->wov_burst_read = true;
-	mutex_unlock(&priv->wov_dma_lock);
 
 	return 0;
 }
@@ -911,10 +909,10 @@ static int wov_pcm_hw_free(struct snd_soc_component *component,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->wov_dma_lock);
-	wov_queue_dequeue(priv, wov_queue_size(priv));
-	priv->wov_substream = NULL;
-	mutex_unlock(&priv->wov_dma_lock);
+	scoped_guard(mutex, &priv->wov_dma_lock) {
+		wov_queue_dequeue(priv, wov_queue_size(priv));
+		priv->wov_substream = NULL;
+	}
 
 	cancel_delayed_work_sync(&priv->wov_copy_work);
 
-- 
2.43.0

