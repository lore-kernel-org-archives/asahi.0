Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9BE3806C1
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401154; cv=none; b=BibPsmbc76pOFjc9nR/xkGZK01GpiKttJ2jtyCWRHLTpR4I27TXEXyrTIdffR0DOON2Tx1okdUrcIzea8kl8BCxuxywlfN0NQE4+TiYxYvP6N36ZiWApZZDMWqiIm89vkNq5B/xsSOs1r2/3AxvPRuZ+6urGFqsK6k+i48Nil2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401154; c=relaxed/simple;
	bh=l+jE/ICW3VwCjHs5/VwCJgnhBYlTFKeilmi/IdexrH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTDsIWkJBs1OvuNv6nm0s5g+L7AMnQryUBwRQVFD29V8V962OwzORRDieb4Y286iALNWkGdl4egOz454zqa2XN5JihAxOXH34s/syVwqAxIWy3eM0K1zGPAZSi6Ja6Jr4lEUwt3VuiCZVCcyXFPbQIiaiw+q32JB/C/NuhMsn0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5Yudoyg; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5Yudoyg"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-847921eed4aso5135636b3a.3
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401153; x=1784005953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYGM4NqjESQUWIB0GyhH+Inqu4fPaZ6H5/Lwh6w+p3g=;
        b=l5Yudoygpyl7oXvIfyktawRCxnkmYl1sDWM1v98nGaSEvgLHBKyJkYU7jT3eNqO6L8
         ODvUvpIuSD4M6Of1J42ygQPNZlOUi+nU/+L7J27WblaCBC2EfZFA2I976/6doCaLWNBd
         djRSDjLkOZXN9rWMdc4gc25rV2568GbhllzObgMoFRSGoQuRsq2531INdI0oKpukSTBs
         Ed8+pNHthJrOUJi0l2OxoDB2pY0H7n7NgEnoG2531Rh79gDOMwNc/+KUj9t9dnXJWqqv
         k0bdJk9uDZBA9ohCnmP4QzALo+N48i4lRw3WQfYyI2p/Ry2gQWGYplNht5nYQ8Xn746a
         esWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401153; x=1784005953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nYGM4NqjESQUWIB0GyhH+Inqu4fPaZ6H5/Lwh6w+p3g=;
        b=XaJx21/ajmazGQ77kbF+GWWXxP0EV0xd3mYoGbbFvGrLDXw2Q24+V3pF3VN3t8tl7R
         x5OQIOxS98x3YHXbFxfQ7++NKBqX0xeWxQ9KR8nY6ZyMt1AIAZHzNvcH/Ytahvnnvyn0
         h7EJp3RrznVFtiO58/uMJdLbiIl/w212WQpSfCn2oR/vZ+BZGSz4lF3K9rRoXzrshgyo
         wBAXKQtybMlE6nS/wWGxtEmVmmYyUXQSibgKvdaze1IZTsPAaBvzTloyeuWOTyUragQk
         zGGrZCtzlE0Dfq2UyGquu3frtEhNtlpQEzRdTqqRsdhKfLjyDMD05MKK0+cp55WPfWTs
         B3XA==
X-Forwarded-Encrypted: i=1; AHgh+RpC+M/8UgHqyvENiFeCtEsIc6/YCjNTPJlcr4MAWLgckKmku4SIMgL0pEvgFEw9Rsu+9ycUgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGHOKo+ASUZ83r6Se1z6bDqNveFSIZuEQvX+KLAcSZn/PJML45
	W/Ds7gtTbCnHlhYIQSL7HMB56i7/wWlYKqP124m85R9x9fMrIOKy3rBQ
X-Gm-Gg: AfdE7cmWn1SZcFD+HLJIlrAAWrNZFV7dFnqXzwHYjD26eN6wnv2lRrhScFNHdtxFTIg
	IMdzJEGWVeLIT5G9PPg57drJ1zyB4mpfeaGJ18rtHszq0oqYqzJxMRUFAm/kJR6zGaACtFlH/AQ
	Ap3+6pTVwMvUPoFKcj1TxL9o07x9aSZJB0OpK/6JcQSaFto44kLQcg3ZT8f1gpOyQpf2kZpVDmR
	C4Rtui1fDRDw1ntI6u4AY5GKOX8pwmykwyPXjH+2CzKjV+oVWS0XVJPq02V1OgPMG+Tms70HQ09
	HFSFD0o0QOsU7rNh44vrFj3DDQpkQJ4ppr1yh5STiIr2/t+PFBQ9ZssenMtqqvNUSbaQedwosUW
	Qk77jmUm+D0nDJECnBvcrfjr3ZD3ufcMsZQhhBTgB21oedfqRuvmrMyLmUEwyiH1zPvqHXTFMM1
	aYgm6z54plFNbr4bZ5JxAiW3XXuD0SlUm4hE8dnd/kW9S7Tkw=
X-Received: by 2002:a05:6a00:bd81:b0:847:8650:69cd with SMTP id d2e1a72fcca58-84826dad939mr3557020b3a.33.1783401152996;
        Mon, 06 Jul 2026 22:12:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:32 -0700 (PDT)
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
Subject: [PATCH v3 11/24] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:53 +0700
Message-ID: <20260707051006.20058-12-phucduc.bui@gmail.com>
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

