Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4026F43CECB
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515184; cv=none; b=WMOKu7+iStcrvMlXLaIQFa8HMaOXfvb48VSRB9OT983wMFLmLXmwMNIgH02Lg/dIwIBRSxcfLjnu4qJMeCrATOglb4btAFwt9nFcmsm1CgK0wFw2Hyj9S2krm56fmre02ds75i3oCYjfgJSXaYOnsF0xmZzSoptB2l12SpMivU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515184; c=relaxed/simple;
	bh=myMc8cB5TZmyPAjZl2RU5Pqsd/fh0JTdU74J2r/32DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QKwh6rAQNt1RO9HCpBzDodA5F7RFL7/Kyb+4rUvB/tPyKk2aU1yYJG3ngnNzI2pAfrfgGJ4s/6oJzTGbcOBR10WVIhFHKHs3tkFGQqwPGY+BC/oQkTjK1eAFtYziNj0zwRocpsH2oT3tgXpgq7iwm7iusk0h2mBW3FlUDkHFqHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eum6+VgW; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eum6+VgW"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso765589a91.1
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515182; x=1784119982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMEdxrf5C54lrH2YSFI3RWWEKJwn7a/uRQ+uyEkXurA=;
        b=Eum6+VgWD6ZArPm+j+Q3+hOUFEV4gFXR+NPBKfnMZw0kLAaZPRQrAKjZWjVijrRA6p
         I3zSZz1ErtqELtV7xFTpK/sY+zSMdnNz4RsShjzsjQrigtWTZtUyOLfLiWBdHRuq6mtC
         jbArmwWvQ9OO1pHFIMLednmGf9jlwAELNfde9Ypm1BIepo60p3ka9X/x12n1VbEsjH3O
         Vxa3ei3OK5aeh0WTO4sq9MD0G99Phk0/Zn1KD1Z5Vl9922T7Wm9k12aSNPQTm0ZCyZoW
         U0i7tZneTndCiPs9lJvNJFnvUho0MeDcLNNXzO8H9LaxZ0vJNbSSubHwQTulmDAC5Q3d
         e+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515182; x=1784119982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OMEdxrf5C54lrH2YSFI3RWWEKJwn7a/uRQ+uyEkXurA=;
        b=e56hU5cjKmK1d+MSQ2F8l7/+SZyCyE9Q+R91ygeTmhGXYM9qDyzX6edipyrbDNVGPz
         1G1Fk3ivNnu9JiliBze7/HiZ0CXuzA1ASqa+bT3/DPjCoQDqEGZUNDSm0iuSCXT27GHm
         KWMZ5OLKxc6hCGauSJJUnXbwjPc7Usy00gK0+Ba+YNx1V7MIJj2cYKLgg+gdZA5Fp0LT
         WkWboIJA759QPn0OrLqxRvtElkbnkqqSN5TpNRCk9BaxZalc3gFQTQeqEPu/KmB3y9Zc
         faNBfqc92cgYL07XHJLuSKza5rx6HCuc4bo1rbDvZcfAzTEq1TgLFo54ZXVCVr58nIj1
         pR1A==
X-Forwarded-Encrypted: i=1; AHgh+RoTpxNpCQFA98CYIyJ38PCg/pUlJkzl4W+yIYjlwqe90exnz3FVGc6Tb+73N+xSB1YWfuaK/w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2Lv+pcddvVRUkEr3PA0QbwViQSdd84Cv4mYZmzxIJI+JSyF0w
	mae/TWCw7K1fXyvNEc9goT8Kn6Cj9M8+bdw4xPFiNUmTKbWlx8eV9oAF
X-Gm-Gg: AfdE7ckn4G5EolITqzon9vyoj4Ry6OgQU4fxqfHG4sj2y0qmA02GhENQw53fKYRtMON
	lP1vHdANmqDCdQGrq6HVNwvLrNONdCdJ135O+5pywKcivECOo0Lg5z+S1koz97IFA5NSB9XOtcR
	WJEyv2XbWPlTuwx6iT3HtI50OooeSz8y3k6JPaqS1XPEC6Kp3vdWnkGHwfl++bibU0YrqzIBhZv
	whZoUXYScnK37GOE5/qY9VWCDQfVAsBOe8D8mCjRpGOyasPGQL+J/bS4iEptEQUuRe2yF0vBGT/
	VCGsLJmfVyOGwM2Rs7Ymg1i67LIiMKYySkZ6IopJd46aENpQRoFAjihPJFMTP21roOUEZZS7rpO
	JvY3Bo6innSvDJm+xHJe4w7ORLyAD+kkDa7PrJz2HQaGsYX/zzkUXrFDijUktZnQ7LtGDlfuoAh
	ShuWpedgv+fQBh91lOPnfZe5EuSc67ObjNWsMdUy8R34jqXic=
X-Received: by 2002:a17:90a:da8b:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-3894053d0b1mr2454692a91.16.1783515182657;
        Wed, 08 Jul 2026 05:53:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:53:02 -0700 (PDT)
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
Subject: [PATCH v4 20/24] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:57 +0700
Message-ID: <20260708125002.202515-21-phucduc.bui@gmail.com>
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
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l85.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 42fafb0b392c..9ee60616c04c 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2504,9 +2505,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2537,9 +2537,8 @@ static void cs47l85_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l85->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L85_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l85->core.adsp[i], component);
-- 
2.43.0

