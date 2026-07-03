Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2B53644C9
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058148; cv=none; b=HImBWtsIMZW5nfnsjKkxkggWwgrbgSEbxXOJlWEQ1bK+K/U/ED6fj6FkO/i1Etw/eB31R45iYo1uqhzRz7imUCDmoALS1zKQAWjPuxhcef/Ng2UUAWh8sKs/0MKPXbMzrYjOIpdJkSdxRB9fPOM2pWApOU8+DcXOkG99jwaJasM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058148; c=relaxed/simple;
	bh=hI8Uif9OWfUC9nJ4ryYn5lVr61cKx+hjtfZlpJoMJ0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7fxAbSmgTNVZEuY7MJlyxrTDtysuH0heMHv23gJf9evFLM4sXV+7gw0QaGr7jWNttj6ZNAY1LDo+neN0fiwqDPJeK99qLIrbKaQ1uEyWxGWNwOdp2azCSiGwOUoE/AKiedcSgwCgVsbjI7kTBR8X4WCsVXFihBTgm2SygTtQ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUjfopuf; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUjfopuf"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-847aebc56b6so158314b3a.3
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058146; x=1783662946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUaUW9hyC9Ct9STDjbyAspp3HtPck/9M1aAPJx5Uwvs=;
        b=WUjfopufQyAbpfWDYIGSfb60yuuCTj7uApsk5esMlKYfRI2/RNyS545VDkpmYtrFY9
         X+6TDNiVKX5eJ+gdMZG7rGhnqjG3MvjNLuIuNZY2rvCPeCnS2ODYr/MB9L7iOk4JECfF
         5kx/3aAi67XKbSGf8Kap/Ua971OYd2MZJZnHlphgbeA4t8bjmpf9g0Qi/sKRUsHmjE4B
         26Np3YK6dgzcChjssnYGdAtelLdfPLvMoE/+46o/J4dyl8UGgf787+R4ZKJjATGhJNps
         ULC+dK+B1debdNP00bZ5dV0myDrUi04p4v5+Ts3sd5EnO1aLBK5c5SrbNvWkD5iu9gwL
         YwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058146; x=1783662946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUaUW9hyC9Ct9STDjbyAspp3HtPck/9M1aAPJx5Uwvs=;
        b=IBlP94L5j5dc484H0sakA8judvmqdxYx95XWowvE3II3lqj8gaY2f79FPFYvHVRSC7
         Fn7ttgovZLufHx88YFPqpzz0XVhwhStJWczp3cmvg2Lfyyxd+Hcy6VW2zyEWOmVN6WhR
         uJ+MktoryCQFbQ4ginwf/oBI1iBEjGy/9dkfDgdH/rpuPwFZdn4qW+XPqqIi72nzENIO
         B3aIIEXYtp0hR9rbaEWT75RzuiujhrA+Pe82arbzfDkKUUuH6K9YfjqV5D5Dz7DfKuSs
         W7CnjTMJF1Nuvj5OwD15kHE2e5LtS96vufPtXUIOcCtdXlZje0ILhi5GLMoLdcLgd4MZ
         iVQw==
X-Forwarded-Encrypted: i=1; AFNElJ+VAHqfN6UaGyt1qw+3vsHe5iVIMGMOlNGtHrfWjIgaZDMTdw3z1dfvledawLC27be0misHQg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yww5/e3idhD5X2276TeC3FBI7eJo0OX2MfJA8cBooN4WM69QaM5
	EBVPBq32e1STQxgNDkJUeDoVjsjfXj2LtPyGRNCWIOpCCbc/9QWK6PPY
X-Gm-Gg: AfdE7ckLExaFKMmx2kDV+gNmUgmdhhtyIDvGrY/3VBJ945NDambeoo1+Wnn5GuZ8gC2
	crpz/AXh23u03ZULpOIYrEP7Z4GUUL0Yy74AVh4q1O+P6Q+xJiNQPyOpQrvsl97YUdAVJl2IVJZ
	PZiaSKBya+i00B3I30zZw8JJYlzgghhd5vovPQq5cjxiFl5ZWhkwYVzA3dwt0RMWbbyyLI62Foy
	82+J+N5kUexN5PLyv36tJRI72vyDVdhTUc0GBeRN/OpaZmXZNpFJb4z35/cfNU1FMTYim3htQym
	nmqqLPFlvJJitbRXmYXaMGPscI5jI+ET4m1FVnCTZCrvl7i62/8RSpqlFRv3UgOz94J0V9sDwvl
	n3oxfUqE7s6pTIqDY3qPYEncLjbYFJ4UP5bbMnXL96hhaidXImTbt5L9PNfN2y8LuFeVbLha0KT
	oKQD/+28mRdLo4Sb+cxuOCdgO5XKLT4kG6flsw7U6NNX47Rp4=
X-Received: by 2002:a05:6a00:3319:b0:845:d286:1fb4 with SMTP id d2e1a72fcca58-847c094915fmr7587687b3a.50.1783058146418;
        Thu, 02 Jul 2026 22:55:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:55:46 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 10/24] ASoC: codecs: aw88399: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:41 +0700
Message-ID: <20260703055355.244898-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88399.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index b2ec3503f7e2..67ea073abdb7 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -1140,9 +1141,8 @@ static void aw88399_startup_work(struct work_struct *work)
 	struct aw88399 *aw88399 =
 		container_of(work, struct aw88399, start_work.work);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	aw88399_start_pa(aw88399);
-	mutex_unlock(&aw88399->lock);
 }
 
 static void aw88399_start(struct aw88399 *aw88399, bool sync_start)
@@ -1702,11 +1702,10 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	ret = aw88399_dev_set_profile_index(aw88399->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88399->lock);
 		return 0;
 	}
 
@@ -1715,8 +1714,6 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 		aw88399_start(aw88399, AW88399_SYNC_START);
 	}
 
-	mutex_unlock(&aw88399->lock);
-
 	return 1;
 }
 
@@ -1939,12 +1936,11 @@ static int aw88399_request_firmware_file(struct aw88399 *aw88399)
 		return ret;
 	}
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	/* aw device init */
 	ret = aw88399_dev_init(aw88399, aw88399->aw_cfg);
 	if (ret)
 		dev_err(aw88399->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88399->lock);
 
 	return ret;
 }
@@ -1975,7 +1971,7 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88399_start(aw88399, AW88399_ASYNC_START);
@@ -1986,7 +1982,6 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88399->lock);
 
 	return 0;
 }
-- 
2.43.0

