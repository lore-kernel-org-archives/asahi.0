Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C22636C588
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515090; cv=none; b=QNvuCCx0Kbdgq+s+F907eUW/5qglcjcrOVqRHZ2IwjOWuYaHt9+xtyIuksfe/olGMmY6cEjhFTr70nqQo77e6ByrdGismNOb/SLXBPw/j5nvYEGm7ZFf8tERwCInbSOOVY2Y0rO2DOFbamC8Ht1Uiujzi4bycoUasJ/Pzae1Ys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515090; c=relaxed/simple;
	bh=6tATyni+4XjZvBeBIaoW6a1jvZmc4iKytcAls52Jz7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/zRxyfdAy58Lk4hEipRGo/QAeG80x7iADBC48uodOC6zQ4hN/4Xwc+h0ZQa82Bw3TTK/eozJIWOYxV8/Q8pktxQf4i5i3Jxtt7Bl+o2rjwyHnKBH33oQBxRH6MdSQRN+41AChuUQxx5jgn14pghKN2LioP1kXSG9Lu92wOv3Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ht69OPiD; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ht69OPiD"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381b831d535so811884a91.0
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515087; x=1784119887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tT+JnYbqvqAEcwKG451SaW3hW/30F9TBA4BNUGiC6ps=;
        b=ht69OPiDn72KfdpGd6ljnvZgqEoSviIEMTvEo26KxAkGxgaDHSf95amj+S32pWc6B3
         mXh9L6/HDT21M1t0f/yVScApitYKer8o/Q9TaojU1nnm0/XPqR+r9Epj3fwNE8uhPLqZ
         2Qg5aT7WiZJ3S9vHqmZjCjnKh5gVN5sb2dbCiJoVXPLr8hDOzXSdd406nBhbjF9xI33T
         BsRtS60LGxOJGU1255UTMnXBPIQx3hM8p5t9cTgpsVH8P7gSSu7g6WlvXN2kYiNKrJq3
         aDn4xPGOr2cZ93LizlnSubSEpJG0McAbSb/fk1bGQzhOIGJSXatajq61vN2gYOWgGebO
         uCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515087; x=1784119887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tT+JnYbqvqAEcwKG451SaW3hW/30F9TBA4BNUGiC6ps=;
        b=cgsiwp+6VYU0ubWxrm3sMpmgeVhzwjh8R7Pjg9qKmQuGleTGyc0y1sGcyoDVwfg0su
         Zi4cm86Uglbch7N82wzkNPzwM2/QdnV0o8hPjw1q7OAyIaL93mcD6sYUpTaX7NVShxTT
         nHP9MqDcVku5rpMZ1hMc/Z79Er+7HLj3SxiPlNdwS/8BCl9ggPRfibmF7ezxs7qEDsTn
         hS5mIh9QDVdUnsTiF/JqYhDOlMBWpZfwV5NmSps9V2YGn8Le+OsVcMwY5HFTbmsTz1PA
         TWQ9WIotkp1ptCP4VGpVGZSmVSF53hqPvNdfBo2D5ZuC5jBxxZD+nGWNR9HBlVI2Vk8h
         EFVg==
X-Forwarded-Encrypted: i=1; AHgh+RroOQ4od965mnjyr9thsIOV7kUwOauoIx7vaPHbwS6AvDE6ftO3aEwpcfDhJyS2FUxMSHIXUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YygaKrpXoPRHvcuEhzYPCAH8vQO9cV+sAGMMjl966tPnwi7R3AH
	Q9WSRT2qM6C06cN+O0YvrZ3f89VhB7PAuW3Gf6J42XW47gtkDIEn11mV
X-Gm-Gg: AfdE7ckJcEz3VJ5Ius32Pc9OKlB21ymOAr56K4KjhR5AQ0JjMRtLdiXyPrJxCKbGjB0
	SmIJ9KI3Z6cafG9iog1vEPWRaEqyiKNz7mCVHsKU0b3Cwx3uxy95/7ueJA5Z09cv+PwWB/2cSIg
	YwkxuTzuKSNp4R+uos8DnyXRAXQqA5fIWZZ4D/eCz63dtkd+FxvSUjF4kv4IWegjc41ysfhIuGB
	hJQHvQZ+/u12PbNq2bZnOBsr68ojnEFWrk+ydU1tdSbd6VQMbpQsmLsT8gqNBDOdvV1DIismGsg
	lMgzDlt6P5/MeUUkHt0tkTE36Vw7iJ4xLZQb/clU6eNMZtHBdJ9adBmyhnbKO0BtiwgeZR+AwzV
	G4JeQO6nETzeLq+Dy0yGMnp2WEJV2eoZn2Wot70Jh+X3cYtPXfBGsttr77Nal5GCe06rnp1+6ST
	tUn9bT0+LqwgQVCUIwnVDH3/12Tidik5D1FHgmLiNVjTtxujc=
X-Received: by 2002:a17:90b:2d05:b0:381:29f2:481b with SMTP id 98e67ed59e1d1-38940150106mr2628890a91.11.1783515087138;
        Wed, 08 Jul 2026 05:51:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:51:26 -0700 (PDT)
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
Subject: [PATCH v4 07/24] ASoC: codecs: aw88166: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:44 +0700
Message-ID: <20260708125002.202515-8-phucduc.bui@gmail.com>
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
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/aw88166.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 3f15f4ac51f7..b72f87f677dd 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -1173,9 +1174,8 @@ static void aw88166_startup_work(struct work_struct *work)
 	struct aw88166 *aw88166 =
 		container_of(work, struct aw88166, start_work.work);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	aw88166_start_pa(aw88166);
-	mutex_unlock(&aw88166->lock);
 }
 
 static void aw88166_start(struct aw88166 *aw88166, bool sync_start)
@@ -1413,11 +1413,10 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	ret = aw88166_dev_set_profile_index(aw88166->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88166->lock);
 		return 0;
 	}
 
@@ -1426,8 +1425,6 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 		aw88166_start(aw88166, AW88166_SYNC_START);
 	}
 
-	mutex_unlock(&aw88166->lock);
-
 	return 1;
 }
 
@@ -1607,12 +1604,12 @@ static int aw88166_request_firmware_file(struct aw88166 *aw88166)
 		return ret;
 	}
 
-	mutex_lock(&aw88166->lock);
-	/* aw device init */
-	ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
-	if (ret)
-		dev_err(aw88166->aw_pa->dev, "dev init failed\n");
-	mutex_unlock(&aw88166->lock);
+	scoped_guard(mutex, &aw88166->lock) {
+		/* aw device init */
+		ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
+		if (ret)
+			dev_err(aw88166->aw_pa->dev, "dev init failed\n");
+	}
 
 	return ret;
 }
@@ -1639,7 +1636,7 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88166_start(aw88166, AW88166_ASYNC_START);
@@ -1650,7 +1647,6 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88166->lock);
 
 	return 0;
 }
-- 
2.43.0

