Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B892C3659FD
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058112; cv=none; b=B/3OKri5tab/ijQbPadTiLkPBgx1PnOxUsLRdhcLGN4fGlRR3t63ufA2va4zXUpfP+RHnv62zVYRnKgi23kc03WCVoSEwim0AtniFG0TPpdfp0gigSGBp/B2fGPijUdGEEmhDA/Gm1ejo3ikoRU8AYzFvnH2DgvdZcps0Yut/rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058112; c=relaxed/simple;
	bh=j0DXGRVUZGLFodFFZDuPh1GY1V1OX5hMwJceQFENsgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ws1tR0rsvdCy0og3RhKJGPu1mox+lGvuLkBpyBcilG7JBTsoAZb214WF+AFGMn2fMzvCks0DMoJ/jGpH3K6MfWq88oAEwDr+zJrGEujzNxisJFcwgq9oFazSGq4tMOvUQyT6vZavdrkzSi6CZUZncx9JIHze/HalnP1/ymF/bF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChtiFCBx; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChtiFCBx"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-847a5528b33so92230b3a.3
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058110; x=1783662910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIImJGUCMEYSffIizPuc32WkGD23VTl/2TOsQS5Pw0s=;
        b=ChtiFCBxceR9hrWKUSsKuXG++zW6S9rSwVdX2L/JrFZjPBOBQs0j+b4EVdSdZ7qItU
         djZBLWhzJpxOP1r63RMxXrw2uV+oqACyi4ohhfPGfQz1UFMju51ypcztecdQ8Byl8mx8
         gN02IubS4BqcRKHJL5Kmf4S41wyo3aDMOmj8nz3GJHkfeiil4gT87dMviKk9jJ0sk0Pn
         2hxIz2I0fRXg7JxiMy+uTGGuzaYJ/+in1+FnZNRC0YSgXsyMP7NOR9HfIP2BOe7lHTep
         SEPw5vk7ISsXwTFaJEy5she2pgpJ/fT+lic3sz5BVwQBtRZ4de3imBxsldSFmpqjOmjt
         cAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058110; x=1783662910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIImJGUCMEYSffIizPuc32WkGD23VTl/2TOsQS5Pw0s=;
        b=o/91jik3D82N2YHyD5GMCIrSkAbZcW3AmvM4f9S/NDFD5+h24vIBvRg8di6h5HUNRN
         lwf9RbljsBaIZn155iIugrhRT5tuyvyPEaw7B1ectEYzkUNrF0QdVeufALvH9GNJPDpR
         oqn0Sa+Cvtj5lg8x14hc+whRVykz4vLJ41NB7hsKC5MIhZ9EiMMlVTjjLgvC7CSbi5Te
         S+d/0hRNs5zpJA+TO5Q+TFDF+TNSj2BOmFNcVQXQSB/GRv4YPKKIKLNjSCn0+CZ3CH6w
         IURBrQtES/ItSkNAvoV87vR3vApZRfAqqPLskm89NtcsYqNgaA8SJhdcma2YMXB0CLYa
         Sqyg==
X-Forwarded-Encrypted: i=1; AHgh+RoVqHychCdMi0j3aNpzoIctlA1XwOxhV2d08oow1Bd+zM6+iKSh+jFkN6WWUPtG7gN/dtaj2g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7sOZffeu4xh8m2INk4MLT+l/eq91onNgh4731Y/fJSbLSkSzP
	LlKFgfKYVHG17sEb6n3DLHt6EnvOzsR0bENytm2Q+pNknuHjgvIBfyDR
X-Gm-Gg: AfdE7clHETsJRC+OKK6ypeHZur9faFLYyIwiyiiFWsNVT4JMLe9Yrg39xTlNyw9x+84
	kVoyognUKZHDJ9f8l6K7suuZZ8T+2gn9uovTLmevv92RD5d1SjcVPOWDUCndwKB+1/IMwkMHEBO
	WP83nLC2b5vjfUsWcZGqle4rhixtPFrjW+NlwOFwEF6j9Vd0laLkObJHSWLClXMsW9FW4XrtIcV
	rCislrVQZ5pInOTduIEs3caxdmKGM1E5KESpEukM6lI9FCBuVdlBTQzHZZWzRitECInb4H+P69O
	/d6eQq3P1iCGkSqfATPC043QKHnWxrL15PSkm0ogXqeihq6ZIflKZpjfgoLfXw7y4JopulD03pq
	rHmFuTlrymKmF8yHJO9dbTx8UTukfScir5pI+COFe/ciHPKiV3CHOLSY7HYU4zTJnZodt8LlPQn
	ZO5csepQ3n4JdIG1/EWFpcFf681Yh8H29+2pe9SvmSVc5jplE=
X-Received: by 2002:a05:6a00:4b47:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-847c5130544mr8170118b3a.34.1783058109959;
        Thu, 02 Jul 2026 22:55:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:55:09 -0700 (PDT)
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
Subject: [PATCH v2 06/24] ASoC: codecs: aw88081: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:37 +0700
Message-ID: <20260703055355.244898-7-phucduc.bui@gmail.com>
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

