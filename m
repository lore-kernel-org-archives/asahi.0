Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74AA3D349A
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454464; cv=none; b=kIBU+oo+EcAjCWyzUZtpfCeAoZ3QJvJRbsZENjKKmaCxuq9oIeh3AP0hF20BR/PmUO4Qz2eUtshvVi4H0JJ9MM5RsZaKaG6msGL1Pt1tpqZa6MU7x+D8bn1aR7aWVBE0b0B4mU+xqZ6OxZDJWxpi5v2neMg2rJdj8k60ToMp0Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454464; c=relaxed/simple;
	bh=j0DXGRVUZGLFodFFZDuPh1GY1V1OX5hMwJceQFENsgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUavZ3Bdycn43NnHl6bth8oyNJ1uI6DR3N7Z5KJasbbMxoQS/Klrd/+iCbkPATgPj+nDd0eAELG9smFr0gqKFu4i6fNnbl3bTuJ2Biw9uMQXXPZMX9bKmv32hhEa6n5Z52cfffG8PcQb/EE6DvFYfFpnGrkOQIkew9zi2ImFQC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6Gv2llk; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6Gv2llk"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37df0b86a82so991982a91.0
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454461; x=1783059261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIImJGUCMEYSffIizPuc32WkGD23VTl/2TOsQS5Pw0s=;
        b=F6Gv2llkKOhvGQu57HIlSeW6Yj/Ee5mTC4XlMj8jQ2PMKCKHEnNrgCK5WDLSDWprN3
         x2cSBL2as3ZNBTqt1Nd/kr72hWdDrrs49/HFZ+mfbpyhK891jDansmSQUDgsmi0s24CB
         POs60Ytniy58206GYtSRxHP+snxQOgc0ZFXQExM4UAX7qKtRf4ZXgJDlTDsmNOtbqzEX
         qW0aM0j9cI+bHL5lQRlNrWrGHIGLg7oX6vdRKeFnwVIc0iz/u2AIapCX/VmjQkxKnd5H
         7IRWvW7J8TQB0xqo+a/4LE/90vSBW6Y1w8MOgwDRMdWQs/zD/oHo95NiPMYd7LqrPVJH
         8jVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454461; x=1783059261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GIImJGUCMEYSffIizPuc32WkGD23VTl/2TOsQS5Pw0s=;
        b=fxiWAolx/aGyJj5mg0yxGvAZXjInnMbIFr6jdi5WYiGT0DBOdsPV3bAOFawAK0AMXX
         Staes3gUcqbcHfcEtXbg3KElke4IxReqOaVsn7X8jYwfRYnjtBE13QgNYLn6NQd6q1J0
         qu7f8Wlx9kt1Wt54fUMr9iMPHBM3Nc1KFzpUJSaFFAMt41gchcoYxKRjlfkkrMLQuLKu
         3RhBIuaeZdxI66zK14weIVD/gLp80D1ZwISIaqGHvDljODaXXk8csNosHC0nDYcXOs8h
         9fCohvHeMro++qRBKFn25zj+WS3Ey6NBuYw7pEOO1AQAJJQRbDDlzL2hrlpshfl/qw9a
         rIvA==
X-Forwarded-Encrypted: i=1; AHgh+RrCvboS/Nmm3bzP8kOFPSjTNGsT5E0tFRX+1ih8vrAAnmijHvXi3ZdyLLFy/Zi0Dsojd2DqkA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyje+0c3PWLv2vRRQuCJxVWxSFVXNNPmf5fiEhPxY8ytpx252E
	QvAc7KApGmElERKvmsNqFyfeyu3qTIeAcFqAwCpAg7X5CImEqHnkiFnTb8Y+fA==
X-Gm-Gg: AfdE7ck/yZcdLnjPNSx/QECLJNAGaOHVmIZEDaTCkXC4gCAZ/6zolUZ83VcB8j2Uigb
	N64l7g4c04Ek5PSK9g2NU3cOKllev9tWUm9aI9LO0vUdQ2OYuUZTAr/88NSBP5eV8wS3wlGbtTx
	4ehKWwQkRU7PbshbRmBgVG6EViJz46bfi3s8pwtEmjZK201uLqAVoWsKEC+r9VFP66hr25+YCcW
	gHxoEwkJO/ESeOx5Tt1iWu2zswulaSQkMDVsqdFxPjDwsGXJMvTTrakbY/BCqcGDSAtzlaEIDA5
	ni3aO+lbnPkgLcf3FTh74t58rmkiZ+goa7RgQgLkMo2R9GbOwww+Tl30ZVBQjKZCD0Y5d3J3/0A
	ktmwTCemipplNbk9a3S+4qitxHZ2zNMpCgQhPNp3wyzuh/Xc+iNIbpRAqc0I5cYusLcbdxi2goX
	O4uQDeINI8nY7LjfYPeDXZWpVO70OOYYCSSHwFLvlVWTrJdaJDpxBaOWdx0Q==
X-Received: by 2002:a17:90b:1b07:b0:36a:8519:a4e9 with SMTP id 98e67ed59e1d1-37dcd792db9mr13247012a91.18.1782454460950;
        Thu, 25 Jun 2026 23:14:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:14:20 -0700 (PDT)
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
Subject: [PATCH 06/24] ASoC: codecs: aw88081: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:11 +0700
Message-ID: <20260626061329.23264-7-phucduc.bui@gmail.com>
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

