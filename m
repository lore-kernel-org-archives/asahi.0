Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF2F35DA55
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058130; cv=none; b=mM2i778abdmHCIK/VU1nek6PZ+jz6JfPw8K1T1RFMpJKlubtagJt9CgKkZkZXZ6tE0IWTf5NotVvQes6dxbIjfBzAn0Nu52ABMWVkQe2+H/XyXNwh3D4JXoT29XuxjnM7cZF9LIjPnsMz+/iD1LAQZnA6GEzojoCQ8+JF8zNAvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058130; c=relaxed/simple;
	bh=OqNQ0wtsuuL6+CNsnbsafgnka32swlgaGxVNsspVsn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BDtxAtk3H81+mtbx5fQVBY3AiCxAfK15xvBcKYWpqyJx2YttjDMCQgxcVf1lB6yQ2oMkSnsMFIhIwzg44iartKme0BAdbbX9THSJA66fLbEaZ7q3gfJ/5quN9AztW4T7R49mdcO2uQLZQMzafJ78wGxebHiBM9rEj8FVq/4N9WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcPFwaYR; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcPFwaYR"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so192986b3a.1
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058128; x=1783662928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntmU0j7UTDsaoP65JVvadIw5ilAlCiOGjFq2v2/q4mw=;
        b=kcPFwaYRzqDnKRSEVN4xt/ahGuJkTaGDdeo9gG+Fc6oN/DTVmaKV8b/96KNAPoxfPc
         Yosjum4l88zm9erUgRRpxl3ux2pyXUUvXErzVtIXRPzZcfSfh3Itxu0NvjSwHmAwoFl0
         C5UemWYSKrm5vTN+7akmIYRNAm+sMt/NFlE85WrgIcHlNK6NvO6P/RUGRx1k6wuFE+kM
         FMjMG6zd+zX1tX8+2kGYOEb+2wAWbgn4byHwFZPGdB/iZoA3No05kQIn9reGCXItUpVD
         d7nDTcsWajDeUFTKevi6Kx00Tdqlr6fNuZvZz9j/2RwuXYwBCWB2ZhHXiFcsI3qNEREk
         yPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058128; x=1783662928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ntmU0j7UTDsaoP65JVvadIw5ilAlCiOGjFq2v2/q4mw=;
        b=nUu0xqvgVp1+hpQlmMdIin4fpdRZFz+uFe9yD7l463+8TBie7Y3swugKD0fxq6RlT2
         pEFsgIsA/KyVTIW1rcKDIcQj+n2wna4rnR4Tux5dr9vUDj8ryFtb58oEIoEd6M+fdCR8
         t2h5mPPC3WiRHnTn38PuTWgovoRvzlqgO2cO1OLKXcMl3EmNeZSNEb4axViYZlI8R8FA
         eOGNVoosv3769L12fMqHvLVOJFFLao2MwF23T7TSoq9c49oRAQ2CP8DkqujaMY/3UrQD
         3TCpxz+DofHGZbShSQTpAS2a03eeydRPpnONBYxSl5jtpGs3LSZSnAx88pCSkKZf4nI+
         k3uQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Rl+K3MHtO1R9jt2eNZgnbcISs4LIM78A5g7GxtBtsyfunljQw+c0PeyRM6SuVhwnoqYgM9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFscbNLPJcSpDgODCyGJRgQEGfKdU3s/qC3CFw+a7KbMwl5GDv
	wQZqT+S6xC5l1p2PTWdUa6LD+8XZX5OjzKbEW7LM75eilxvV2lAp4QPL
X-Gm-Gg: AfdE7cmDEdBTppkck6tHPXg9afe9BdE/ghHtHxCCDia0hFni3iAOxJmRq5O+xSfk/CC
	YDVp7wLGwyfUg8b0KFqIOWanhkzPDEBy0SahLuCyNOb5eFYB+vWzOWO5rrQAcyP0HKdzukUnwL/
	5IuwxSjuIx9i0JBYcFL2z+OWqZ9fol1LZ02piqqCy9wjDoyIw/7d52ZonmAmaU9Rm6QiBlDTYl7
	1tRP23REHuS3vmfO2Esztkwhcg4RzbL5tC5VkrH22HpFM8pGCNVIDB20AHTSfzMLhCNnDvNCtBp
	P+HXM2OqkQ2lmG7stTvdEIgvn9Hjjd1GodXgOGYIG4TM2CtiQQtJGCiOWgIjZBFTYPcGI7Empcg
	vpo8tDHfGprrMx/Rqs8+NnoE043gLifmBMKRBvNkQMeLNOAIvf7FBD779pDBuv7DajbTcS82jhR
	RIYZ/nOgxdJTADCPwAPZfGdqCiKvt+KZZjEV1ls1/Pm8V2lsY=
X-Received: by 2002:a05:6a00:340a:b0:847:b16b:46d9 with SMTP id d2e1a72fcca58-847c09889d9mr7899560b3a.34.1783058128176;
        Thu, 02 Jul 2026 22:55:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:55:27 -0700 (PDT)
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
Subject: [PATCH v2 08/24] ASoC: codecs: aw88261: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:39 +0700
Message-ID: <20260703055355.244898-9-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88261.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 549783d3e75e..b931b8602566 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -8,6 +8,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
 #include <linux/bitops.h>
@@ -960,11 +961,10 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	ret = aw88261_dev_set_profile_index(aw88261->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88261->lock);
 		return 0;
 	}
 
@@ -973,8 +973,6 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 		aw88261_start(aw88261);
 	}
 
-	mutex_unlock(&aw88261->lock);
-
 	return 1;
 }
 
@@ -1038,7 +1036,7 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88261_start(aw88261);
@@ -1049,7 +1047,6 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88261->lock);
 
 	return 0;
 }
@@ -1188,12 +1185,12 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 		return ret;
 	}
 
-	mutex_lock(&aw88261->lock);
-	/* aw device init */
-	ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
-	if (ret)
-		dev_err(aw88261->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88261->lock);
+	scoped_guard(mutex, &aw88261->lock) {
+		/* aw device init */
+		ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
+		if (ret)
+			dev_err(aw88261->aw_pa->dev, "dev init failed");
+	}
 
 	return ret;
 }
-- 
2.43.0

