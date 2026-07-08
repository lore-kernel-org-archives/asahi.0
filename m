Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4412243CECB
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515169; cv=none; b=MHfzo810Tv/Wdv58m40s6bjXsF5HA2OtJHZHB42VOJcX9FKG1uZ+zTkTthoN7nW0Muwch7L4OETnCWUcCDdGYT43GqZHKLalmRwxOdKI3jwb5lIag6WTf8XUri166u4pTroiJn3XL+LxuVEeCaCQczY9W7pjr0EXCQLpLgYdbOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515169; c=relaxed/simple;
	bh=U8XvbxSxSkTA8/Iu4yHaWeEwL/aIo8CQltei/BWFXwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kc+iRk1SJvsokHWqfSIcfPZ0maBjhrym/PisIt5ALr69MSwobs83NyVNzEHeB19xDmB0TEvh0rc0liijfM3QQZkV2Ff5DXBdnT/gm16DK1lDK6V9eI5faFXX+yZ/59gUZGz2MTrmlGg7wSbqrfncAUO1Bq2yzSVMyvRgiggUd3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fmip7FmD; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fmip7FmD"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3804e42ad5fso634713a91.2
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515168; x=1784119968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ov7owr1xn+j7m+V91q4r4G+6t07sw41en2G6nbW7Mjg=;
        b=Fmip7FmDhGqop87PN9mebxDAOaATTavtTZcHMkBja0IY5gqZCQ9ZOAlXnOh0rEUuGw
         y+ODfubWZgvxVDNn5gEze6BN6aKSciZ7+HLuaPS/0Z+FSXilfA2AULtoNwS0fx4Q9J1/
         Qa/ZLv0iPi8nCo5eo5daJqQhSZLn9zgIyXykYINZM0W355ccw44TgkxSdjoa0l7RPEk8
         Deg+4ZespXnb/qZwrI9ED3B7f00vaTiKr7zdFJqYY/hWvQ8GmTpRlSPqoWhJzDnZOGGZ
         XtCuAY/lsaIBzA+F/UTA4EuZRDnHl12zCAZ44ycElP20+JFMsmz6n0iRFQoJEgZYhqkQ
         mzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515168; x=1784119968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ov7owr1xn+j7m+V91q4r4G+6t07sw41en2G6nbW7Mjg=;
        b=U9UVACiASocZBPnxZcz0QlN0tfo664e54nRE86zQl88E2JPxUgZHLCCwEK/LFnLVdS
         XfZWNjeKmfGU7w1PhnyaPpNvWrSABDKK2Ps/jjsc5B+AWPVg4R5WgzXB/4Zbliqv+lxj
         cCF8MZA8jIBMbct14AUJnLbrzwsA3DPDtB+kQB5N61qMWCcFiBGT2+JoUnR2ZVosmhOR
         pJKA2OeSf4lomBulesWVu+wAgK+hchuMLbafPeKtGgjv9Ru431DgRkg5VTfV68ttYAmO
         qBo+g+0wIBR/XYJi/KDONhMfPUKnh2I96nHDz4IEDNupXOXlLSL6qEGJthmSlPNdQNTe
         VtsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrj6XtGpwSs/EZjBl//M9Bb58LKBz0xE2kIy62mesJUzsZYMKDkmF4vc5BFIFs4h25E8bSg0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxL3MWzMxGbyXG7YmWHxg5BirBtSoe/YRZBVOo3MkwaBwmF3wVe
	/RyNzvQmUnIIG9gw8f6tU6PUUvXE7h/3wrOmCDs2JZaFzYKiCcobttXM
X-Gm-Gg: AfdE7clI9CaMec/2C10l3F5Pa7A5sFGkau2GOHTrlJfEG8261tTmKNCJRhXxGuz9IC1
	oCykpuVehbydL1eRqKgme9WG7YfFgYwN3OwJTc+o/z3EifzZscnxf8Vb8a31k+eLF9Nxj8J4+AC
	EO0E3UbMVN9AUMWCsbWRUl9SvKxIrMsBde0+xI5XMgbjXPIEY5F0VCkGK+hqLioEFLDK5wEMXfA
	Me62o4QaPA7Tj7Hq4UE57axvp0yLDHegOAthSI/rp8JHXYjGICWEXOk4OKkGdATjqH5yvIwqBAo
	KuvrYPaYP9rOAAAM21D6EinBwjBua/IwZCpb5GUXJ+s53E4AcqYymrxlhN5LEos4zFK3ypeRGtY
	BZXUrX4zcWeL/tzS4DAim6TUGTQktdwhzs1iZQCwKOfj0Ydey53FVADUr2WxDrzqSWtGS6s2Vy3
	4iGAeY337pAWVRdBW2Hz2J9R/ORvdqgmV3UKGvD0h5x+EuB+A=
X-Received: by 2002:a17:90b:3891:b0:387:e0db:3fac with SMTP id 98e67ed59e1d1-38942798114mr2804180a91.37.1783515167633;
        Wed, 08 Jul 2026 05:52:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:47 -0700 (PDT)
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
Subject: [PATCH v4 18/24] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:55 +0700
Message-ID: <20260708125002.202515-19-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l15.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index da64e0a1db28..2f30dd834709 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1285,9 +1286,8 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1317,9 +1317,8 @@ static void cs47l15_component_remove(struct snd_soc_component *component)
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l15->core.adsp[0], component);
 }
-- 
2.43.0

