Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E54735E1C1
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058157; cv=none; b=Njp/7oEJWc+J/B5pwDphR3SAdg2+1v90Pu+tIHOsXCp4j6AMDmfRsAHm9aI75s96EHCMqD0IZcrSSs0c6Kkuuh5ELHXfwYShWl34WGK5vuOwNvswxaJLDaZJxUC+XzHdCuFn5ubGYWTR52PjJoWtVllvQS3KGyOSDwwC4kjfPf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058157; c=relaxed/simple;
	bh=sVJcDLSzvxVc07PKONwqwz7bpyreaHuk9mSCphbPjpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ia/OQ6ifUm6iskEo6vlVWxQX3124EBrTBIApNEnb4/Bl5svNRWOKJNLTKSaKOMtBp097jxg6QG/uZZe74ZLCkTz/Uu4JCulByAP8mPPItlkZUu/6kjEztgDoUtD5WhNSwEwH/Pg5lQa2C6IteguuDT6RV1h35i1ZjaOK9L0ENcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oOp7MN1r; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oOp7MN1r"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-845ea8924a2so171691b3a.1
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058155; x=1783662955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhB1hdZH1RXfYnuHTRXF1+iHxT1kM5V0IWS9nNClVhA=;
        b=oOp7MN1rnjL6BOuOtEGbKYZl7qJ3WDYHt5lHZnnyQHW/WLIT+0zGRQoSQcJFKux0JK
         ro8Wr37Ia97nJm+h3sXWszBXv0pZwMYs/fV+VpI+x5XBOmTNEPCWzsenW30gkNzG6SNd
         SoXhOBpiyk8YSTGoBKZOmwxdc2RnLVNRE/+xAeg6uv4JQicqmy+fRLcAQnDQBbbWFlMJ
         unTCSyfL89S4CIzwJV7IvaG7ChElFLK1bg4BxHYsZ3Hyb4Tq9M8C4RUtQOhCcbyyAPbm
         Ngyl7TQKagql254cYBysckjde/zKn/tz5mU7MtYfausXp/qLyQms/MUfus/lynSsKCds
         9S2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058155; x=1783662955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OhB1hdZH1RXfYnuHTRXF1+iHxT1kM5V0IWS9nNClVhA=;
        b=DUzv/SYsKVJdr0xYvvXKLh0WAqZbsYXE+I/wmrBYe4uE5/7teM/RSWOS8VHUUwoS8R
         V1tX5UCYPbVOz7TyMcjj7BF0PQ8FP1upSAR3C+ArE+xXK03Mh2mvvj2lm2hlLkZ7STnw
         PI5fbLsivnnLuNR5J3NZsfZ+CBw162sCuZ6rqvRnTVUSlufdNbV2BN4QUe79MQozDQxr
         TqgJoxaiNFaJ4tT7BLuNYdlctkfM3rkq0cWyPkdC++0pgyS7V1CSzOnSVc9mfy0syg8Y
         6Hi1zk1Smka+MPPZstgUY6/FctU85ZL4D3Vq/dqU/gMZDFbZLzKWwIhErEAD+RlnGHcW
         RBSg==
X-Forwarded-Encrypted: i=1; AHgh+RqA2oQarK1SdyEKRmJ5YUH7TwL2kyUHdfyXD65oN/lfK2BMJThUH3Ape0L8Z3AjetbIr3wXwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIAPq/WV/w4UDUb8j9RkXu3RSEI8sMTZ3bXOiHEKoDnIbOn9jp
	mQVo/x6g/W5crvWflY8j0v3eG8NbkK3ZK5GuJM/pfexJVauE9nH9JYfE
X-Gm-Gg: AfdE7cmLYCFKS7zq9mFYd9/IiBjpRZHsakr1Ss66XgmcaKAN5SEsN4cgC02Df1RyQwH
	tFZ5nohO1S4Z0nqlARuV9Tsvs3p8VB0BjqAUMMfHHhtroe0sJGz0mr6ivzJzD5q2kOu74qzbo9r
	otpN1HIMZ9tjgCRw8K8w0XfxcL6ZXoLBOAWDykAXt7pmDM+qOH9IR3Bgpggn/o0LhBt9YwYVF8I
	kWyzobNfUKcht4z3+W74M36XpnIfYdLxkCadvf7u7X4ADzf7KqQzKn+OK3jz37NSs3GeKbYvdO4
	mYo+SQlkrCF1Vj18hjdtm3HIzrwCttDL+UzZbYbZuS+TI70UaeNxeSHFlPCQN9bHzSw0UB/3y60
	YjM7MyNXFFYCQGYYy7CbiDVRLo892qcYceGSYYLUlybyUc9OC7IFVTXNYWY0CQGagznQTqlnTPK
	zv5uiMdEBcBb6qR6wUjcirbgA8NEo54Db8If4dyAgIkQhS+xU=
X-Received: by 2002:a05:6a00:b53:b0:843:468d:7804 with SMTP id d2e1a72fcca58-847c0879346mr9802024b3a.34.1783058155241;
        Thu, 02 Jul 2026 22:55:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:55:54 -0700 (PDT)
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
Subject: [PATCH v2 11/24] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:42 +0700
Message-ID: <20260703055355.244898-12-phucduc.bui@gmail.com>
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

