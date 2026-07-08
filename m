Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AF6436BD3
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515074; cv=none; b=CT2mAUTLAt8osP/9IxYVMPWfc53t4p8YKm/a9oXKmp7J0nS+peMvjrgM6TVN60VheQsW/8f/bPm/+U6gSFAWkOHb8mJXlWqMsI5ML+kCdbQo5ouGOg+Z7mwRgE8paodYgVpVSzraM8hTSN3DlC7DYj4BWYSOY1jORKnX4tqxmtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515074; c=relaxed/simple;
	bh=yfnMNacLdodpfRhW2bQZbE7pm8s0ri1caS058dgJKWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvqPZ4bBtn1oZ2SLIGYN4Hz/GDXwMeGEtuh/CTljregR1lR/QKncmMBRJ6ZMFCTcjgbKNtPRnaQdFTRDfoKe/CMAVa+rPgLWXHYN5b0GDHTFRYaQ3utgIRQ/SLOX91l28FPCxviqv+TKHNnDxgRESn4bq44DUfCnIcA1dxRJJB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nV8RNpiW; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nV8RNpiW"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38759bcd877so544936a91.2
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515071; x=1784119871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq5Iddla3Hd0Zh5qEYq/9fp7CsXU6/7TUOr0ybGJuLs=;
        b=nV8RNpiWAcmRoVzVnLrcU/WdrvMP2PEi9SuZpvx+mwkHOgEQCXql+U6r6oorV5cTPM
         iOjwWHBNKezU6p7zHzujaeXCNvzmPWFxZfgFO12mkYmhT7O3OYtPkyiCu4MuCyWTNxuk
         XulLt1BbsZliy7M2YX+ELZeLrS3ptufeFBECZ+I6e/OoeOgcF6r0Y7VnP9llCTPLQ1/h
         ECbbgUEK66DIZQ/buorSQgRs2sin+PYbpKOMbsMtefijhZfRJLudyAYeOT4aqakDvo+W
         7awT4yjJ1aUb4Z/XVI6tFME/HTlOwf4hEoTls8xYch8wZ7gCUVErXVu3qmdm3QQ/FZOi
         AWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515071; x=1784119871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sq5Iddla3Hd0Zh5qEYq/9fp7CsXU6/7TUOr0ybGJuLs=;
        b=bTaRzXTNM7B1wPNgI1Z8BRI22oqdqQtQyTZv0IfqtFUUdtB5rAhCRozl02tLQEX3rs
         RwnQDO4dEXm8dhEI1M3MAV0gi1nCIEPNu2+Kc6pFrdn/m2FHGEt6Vj2ARhlAfDLCo6sc
         LTk8Y/HV2rf7bWDjlW9ZafbyQn9qlK4CvfalM4MWp2aYvZd1XmBS9asyROm6cMA/NwPS
         qxz2DggfnsNVkAMWwROE5yxAXs49CyReOoTnX98iGjyMY19UrRFW2ZRyxuhdc0Ag2ZXe
         CF7hyNbkudXMrbWSpdIJjNOPI2hm9kMu80lveQiHeDGo78a81UIPnWVTnF6UeJN3JyU2
         shzw==
X-Forwarded-Encrypted: i=1; AHgh+RoQGB1naFzuT5Hco/1AeW/pDpZT3esvLAEg3wCLfeli4vushj7V9qismGD8hPdhrBd6bkvCug==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl1RQmdWCJZytcm8raCRgOECYQIC+kGjPP9oxDkeadjPVqQ25A
	Qx3jUGfH8vH8zJDpscDIPWdOk3pAmW+2R9YWvcTPLK13mJzdXYrIOGuE
X-Gm-Gg: AfdE7cmpYcNv0xGLUMOjKXqJ/qXQcg1ejsAIa62F3b0XKZinU8lemWP4kZbyzJn7qPG
	lvm7mYGa2khMCY3apiN3LKDtGeCkC9yPZiGrzOeWYgf8QGMSUU1sJwDLp2ul7oSIIrAXwApP7IV
	Km4ruGxqA/8BzuN4XnNoJMWgcI8BjmhuThef3XPH61UvP3Cb+JMS7PL0bHlRnYnNDo1V4JyEip4
	OzFfTfgGhHg3Sz2nitDYxs9TsyECFXbB1wmASo7QkOZ52JRo3Rjhk34dTOIi4XroA2T5ezOceDi
	i0tb+LydQMzQIC08dIRtDudjfWL62wis+KFa0G31hvX7CVLwaAltqATJ4PW/rQpieBrKGANVuGj
	3q71/vcyCGDlTZJVKNSXEKGgOyD51In2Ucy9s8E6qibrniqSn1eq2pUWlnLPdPSUDt0Vxq0jUbP
	4bCzHfijuyDWOBH/hbzj2aj4u673mHdhKTJ4oL/bNuQnpahLs=
X-Received: by 2002:a17:90a:e705:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-389426976f8mr2543047a91.38.1783515071231;
        Wed, 08 Jul 2026 05:51:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:51:10 -0700 (PDT)
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
Subject: [PATCH v4 05/24] ASoC: codecs: aw87390: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:42 +0700
Message-ID: <20260708125002.202515-6-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw87390.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 020213e0ca4b..8150670fde2d 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
 #include <linux/regmap.h>
@@ -225,11 +226,10 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 	ret = aw87390_dev_set_profile_index(aw87390->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change\n");
-		mutex_unlock(&aw87390->lock);
 		return 0;
 	}
 
@@ -238,8 +238,6 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 		aw87390_power_on(aw87390->aw_pa);
 	}
 
-	mutex_unlock(&aw87390->lock);
-
 	return 1;
 }
 
@@ -280,14 +278,12 @@ static int aw87390_request_firmware_file(struct aw87390 *aw87390)
 		return ret;
 	}
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 
 	ret = aw88395_dev_cfg_load(aw87390->aw_pa, aw87390->aw_cfg);
 	if (ret)
 		dev_err(aw87390->aw_pa->dev, "aw_dev acf parse failed\n");
 
-	mutex_unlock(&aw87390->lock);
-
 	return ret;
 }
 
-- 
2.43.0

