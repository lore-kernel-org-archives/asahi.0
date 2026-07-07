Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036B837FF5E
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401086; cv=none; b=k3/fzqdZF3qPZxUBKMvRYwAqB6E46IV603xcFODbJtIJ6c4RFtuPXE3DU1rSueFOK2z72RZqNxkoLed3ZJsox+8ywZtznNtEvgk3Cof2YvCv9X0AnNpaWgjjhEyZPqQDYj7+lx48PrQRcQ4YpdGsycIi9zFNr/GXrfysx1DrvTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401086; c=relaxed/simple;
	bh=mG5pRpfRueqPRsS1UnGChfxPg+7TVAQuLlVgN6Molhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p92q/StLAUAoLen9zEyV/xOetde4dOtqrSUhyER9/Ub3nmL4yxtM25Z/m1otGaeZeOK8Wc66pRGfowjpVBz3eWK3ieSfA5udN89GifBaF1wMmT9vEbfhsC/S4HC5igCEPhQbOu/fz0UIajdgwu5Uh+qJPB12JK6VdbgK6OW0mjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6epJeTU; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6epJeTU"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-847a483e344so278902b3a.0
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401084; x=1784005884; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7IGUH0VtQ7qJ0ccJyHWYquIdmNZndl5qSSw0oJlA6k=;
        b=n6epJeTUANco60SDF7WyY5QZb/DQJJY8+32Y+EihAWGjPZG/J8CI/3dQLdibkkoXcA
         v0DqkdOxl5IV8coSqBfXXto9B0crcgfPGwuf9OOpMH9CwSiQbcl6Y1UhGLFOoHymiOOW
         DV41K9KX/a39nFgzFavH9TkHIB1+Cra2rHzx6NtdhoNKyE/k3lsG94CLOhRPGEAqEL1g
         mbjHRcSVNQAAiKyC9uOn0DfAwFduGEtuI5rNxVXzVfxYpt1Kb4A61Vw57yVfa8nsqUiY
         s9zdQiKJGNJMo27DdF9jSxI0C8aCmw0tpN0DP3BXVV1wd4FaAnlQOFtCIgWc56dB2LC2
         e+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401084; x=1784005884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b7IGUH0VtQ7qJ0ccJyHWYquIdmNZndl5qSSw0oJlA6k=;
        b=IkiWXCD5v7EY5VhFLmeOyyyl8EydvTJ/0KOno+1WrT9BdrDi1vlDqEjwHvi5COCa8f
         Y6LgMV6MW/dneHvbzXwmuyxIOwPnv6J6VnVIEQ2bl5a0oJKsOjyZpivlfRWljlqOXdHj
         v4J82o02kLuT+lhB8lop1Bv/aFlXTmBF1ymV8BV15mEMbiCkt/ymvUv0ov9fZj5j7NRZ
         VO7Zt/3+jBhQMQ6L3t8Qy3knEUf+OoU/wN/tj15C72/k/t9oJ/Vga55JrTgMKUosNn5s
         qKeQTyLFQa+kmVzoLIzDwcPrIE/yWXpW4j5HOy8xP8Q+HRYqfKsTI7zEMV387Q39ng2h
         kVAw==
X-Forwarded-Encrypted: i=1; AHgh+RpUo19DTgAkkj9FeQGxSak9OeURRmlY1f6lM15hTyKhqmrxwrlTBZGgnQZvuRcnSOvU3LmD2w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0E3jwSGFeiYEPu/xaQFWG7KGmbXPmp8xsrSAN7l3hhh1AmJMj
	TlY77OEMBW9/IF4c/mHoJz7y5nKvUWkzgeOOvjEUrlxqdITThY3+kN5w
X-Gm-Gg: AfdE7cl4I9jTdfpaqzmr0HnxDym4R1/qCLk7IfQUMc74UoX42zzykOy2KqF3DQh4dUh
	G11YskXJlzVDwIfStyW4YVkjbtmHGaQHARIx0MqNDAS4oC+BsAQ9fUsBPMTr3eppN1QJNDEVwEQ
	T2WQEYaEVvNT2Faz2RsaXbiltZzIeo2vsVYL5g0hkO0e1QQoiE1aWeag5523UbS95x/7W5UtvAu
	cEtCEuvWMFvwdoq0qa1hCRFXbeBkikrg9qeTGMtAv+QOEGqF4wCrxQ+o6Q+G8AnMpSYbHR5LGnJ
	JVBw76BkwJROoMOO15eKneu8tJ1QroQxWRn2buBBBki84HJv2SAlaqaHnfwvowBeR1zIdUZnaKu
	G1hxr/Pv1VVJk3Ld6zQj2/xFUBPXFHlQAxrx/0N85qQV0AXWGT1NAqDBiYycBE3w19rnvKykNOA
	aUa5AFgm2pAZ5OCO/ivGil7Id+WQVOS6uX9GVj5aWbpNsrIkZwITmuMYNX+A==
X-Received: by 2002:a05:6a00:f8d:b0:842:6259:5e2b with SMTP id d2e1a72fcca58-8482f5305a8mr1211855b3a.33.1783401084160;
        Mon, 06 Jul 2026 22:11:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:11:23 -0700 (PDT)
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
Subject: [PATCH v3 06/24] ASoC: codecs: aw88081: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:48 +0700
Message-ID: <20260707051006.20058-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88081.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index d5e886a8f106..a3cc027de606 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
@@ -763,9 +764,8 @@ static void aw88081_startup_work(struct work_struct *work)
 	struct aw88081 *aw88081 =
 		container_of(work, struct aw88081, start_work.work);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	aw88081_start_pa(aw88081);
-	mutex_unlock(&aw88081->lock);
 }
 
 static void aw88081_start(struct aw88081 *aw88081, bool sync_start)
@@ -942,11 +942,10 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	ret = aw88081_dev_set_profile_index(aw88081->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88081->lock);
 		return 0;
 	}
 
@@ -955,8 +954,6 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 		aw88081_start(aw88081, AW88081_SYNC_START);
 	}
 
-	mutex_unlock(&aw88081->lock);
-
 	return 1;
 }
 
@@ -1165,11 +1162,9 @@ static int aw88081_request_firmware_file(struct aw88081 *aw88081)
 	if (ret)
 		return ret;
 
-	mutex_lock(&aw88081->lock);
-	ret = aw88081_dev_init(aw88081, aw88081->aw_cfg);
-	mutex_unlock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 
-	return ret;
+	return aw88081_dev_init(aw88081, aw88081->aw_cfg);
 }
 
 static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
@@ -1178,7 +1173,7 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88081_start(aw88081, AW88081_ASYNC_START);
@@ -1189,7 +1184,6 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88081->lock);
 
 	return 0;
 }
-- 
2.43.0

