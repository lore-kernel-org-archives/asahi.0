Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342733D25A2
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454457; cv=none; b=jKBtAmIIaJ8oH/gpiNmbS6wF33XmdG2+hQa95pxCRWyDggOfXp5K6wmhfCG02LZ4JBDw2wx5uxTq9Kg4Bs+QjEsOJ2DbDuSCT1P3o4MlyoQ9BAWz8wcH8bxIZlYS495L+jLXCedLHtL135ABo+6U1DwJ5FkcQC7bCap8gFX8SPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454457; c=relaxed/simple;
	bh=XBo9TFWfRkkBDWeIBbEHSqFNAD+gQAnKPasD7gZlVgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Synb3tbtiPZP/nXbczoKtx01nLK5YQ7FQBJWDj8KZxnRJAAQdqX+26s+uEtyPS78bv9lx1Jv0mQGxnPgBnSGM0gKXH9PUm6l0v8N3E4DwNe+ou5UrGtlVu63LJHCoD1OT5j2sUjJK9Ior5Z6/X0ujUvrSbFUZxQ671t9ZxsIk2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dk784RG0; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dk784RG0"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37dedd62b90so375559a91.1
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454455; x=1783059255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CvHhZDuh9KEqGXTaRtE+YpkRyUyzW6BE6haBhiMpzo=;
        b=dk784RG03mgZrtdZlqd2VPs7qjrnlaDvAcqKuglUCEwRvbDfkdy96KYql66Rto6bcb
         auyVg5yK2yTxNwkHekr3U0kB14r6CTQk3LRW9tV8BY+AvxcSQ3D6FQY2QH/TgzYAzAnD
         K7oTGWdbyNss2W4Cc/umwpkXuc+vjeVHamKAvk6r4jO+49UTFoqAaTXsscxhc8X/vs0A
         QLo7NTrZNUgrTK4yo8HFxpZ6h8etHMdatrsrv73TQXqPLBypMrLGRJGEdkU/R7XrPFzx
         yQmm3bQIXa9WHhWU7Sui9AmVlEqCkICYYio6d2upSQ50ZIb+c7zOFGfTAM3TEC1jlP5a
         Qcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454455; x=1783059255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CvHhZDuh9KEqGXTaRtE+YpkRyUyzW6BE6haBhiMpzo=;
        b=Iuti/SKjnSCUUERJ8LMoAqvSwtRCR8P/0ObE7gijLBKQw7OL8b1zTJR9sbZDDYdkS6
         lpl2Jug4He0c6uY9O/0Ez0DFM2I0IxAVog7bLoevLDngElPvjCkX89f3rA5nBVeFk1d2
         7CJvoukb3Z46W41wYQ7YT+foEN0SXg1UKZQU3VRH1pYJq3qbi0e1155fHsXZQl423dvB
         tvlOvy5zGInOSAb95mo6ocr3zb9mJ/DypgEb0P+VaWH0TClElha+tiVw9RvfHwGqap1t
         ubM1ZN2F7x7cCKvRo3lYcG2sG6k+udEgo0LGXn8tucb1CbDmIa8oZ2OOwqgqAa/VRiUs
         5/uA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3vQTAiyd/cLb0kdpy3gBSyt0jJfM1IfetYyx+nou2SvOACHarZy81GgfZJQVQgnyWOrcAHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwyDRxvYQX1LIorZU9HfN9BWCVmRl88Kb2f5U2LND65GkxQ+ERH
	zmCHVWQ1CVIWvKOlDyyRSEgbCQV6O828OdTc6Muq9EdVWGHTjOPfDEVf
X-Gm-Gg: AfdE7cl2ZwiPdxnDTvN2K0zUSHv6s4nvKPzAukpPsjSU3w66Z57sHJDSpRykwBH02vJ
	pMRhrV6tVOh69GpKPdKP56j3R1rWlEJTKr8unDneWwCBk0mn0axLtfeFNXuu7dYiC8Y6qXPbxi4
	eDbB4TcVk8NQegUnzVkCZfJmYdqcqcReqKvh7dTs/+04Q3CBWPNCKwfekMagEtx5kfueGpgVAOQ
	7ZJbhQO3ALHJoRLZyjUyYDTfcj2IQ9AhzjVInKQPOYDz4t1nzLDNbjJB5MicBAwBC8Ap1F5Xitj
	EkQPsTKaMRc0xyqhK7dgEEbr8lpzWWhHDaPCM+u1gxYQAgEASL1ozq6FdyW5iqzDHfrByFkjE5G
	Soj51wmOjtyeHYSO+1osCI+wT6pCt73tOQ4bfsvH2GlF0kRN05eAXOko2JuGeAdTf4F1TVM80eW
	XzcKOlQEin+ZlUD9OT0yhN9wSxuG8K+kc/6sIP5ggxugFpijE=
X-Received: by 2002:a17:90b:2f87:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-37df9163af0mr4081576a91.12.1782454455461;
        Thu, 25 Jun 2026 23:14:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:14:15 -0700 (PDT)
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
Subject: [PATCH 05/24] ASoC: codecs: aw87390: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:10 +0700
Message-ID: <20260626061329.23264-6-phucduc.bui@gmail.com>
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

