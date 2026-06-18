Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F363EE1DB
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780934; cv=none; b=Y7BLk3ywX22J0HINYc5IOdhDSfZbjrGffLCpvrqBUJI3EyClat1tY2HPw4Tf1esc6/yuLxw4bWuL1bQ74Q2du69YbhF5JatiluQUu8abgG8NohYfLW0Pl9gm6Qp13/Ix7SCEN8+jRTjuoq29NM+WuTfhoUcjwMJCgyr+Mp+9SBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780934; c=relaxed/simple;
	bh=0yaQq+Grvu3FGJjYsD1MZsTbz1cHiqbNEJ6t3Xr8ZZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBaYAHJJpEcZC32C0OFQrcWRu8fOMjsDOMhelabrHgZ9xJzjUbSblWWx96HkwVNPZxBGBfOv48rBxL6rivu1qcxKjrwVhJU2kgRorZ7sADPRo9LhaCxMUxFSXtYPJz+7QLFiyCiZ60Wxtx3cd/FROvwtoUzDU+h7Pjfk+qnYWn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGbDW1Ek; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGbDW1Ek"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c6bc87f4d5so3288235ad.1
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780932; x=1782385732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeDyrRSgLV/yx9S+U/FOT1rxO1cOlIi+l6TEpJj57t4=;
        b=KGbDW1EkPQzhT5F8kRP6I/5/8L1eZqGsnzk+X0AkUbo4jItVh6htknBjvAuhALOv1w
         pbpNoZlbL+2bB8C8qOdBULSmGTWn9PH0c9C/PkbE6ZRvOnZ5p4PA20jqukecscQNrM/y
         XmVpKKlr8E4lLWCyhmZZWIJxmlbw29VJapvwR6dV1LihzT3Lpb2qbRDXJZM4xMkCR9MH
         GEpx1rk9qhzdlRj6NHu7UZOZCqlO8ocvB89goSN7kqFhcP/ABhTy7DO9uK+delcY+AqA
         WDciqZ+ArEFsohU/fmJH1dZmsybsuOA+qgWAt9wY0qBC3aacigWDSXTx4duAPVXorC4a
         Zjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780932; x=1782385732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eeDyrRSgLV/yx9S+U/FOT1rxO1cOlIi+l6TEpJj57t4=;
        b=JgdA5IdSQo4DJAly0M3KR/KW3wgX04Xh2e+mvUJ2sHxsDw9pdRDpKWA6wjMx4yCzH5
         qQzVlRFfSdGSHo5G8jd7vRQAjxHP1qEXCnoD5qjBxXgK9yJmgJlpGsZaQ7BCgmvmz2pE
         faispzNxheOGtrNntDT8Sk0vods8yaY1FiOvPmLq2ox0gs5zSWUHGLWeurK5X6BJPfzk
         6W3X7sQXvC1w628UXxIZ3SVZouUpXqEbSgFLhnX19wm6DSbOotlLoFDyVnKonSfy9LLE
         yd8sYW1udPwPWeUZFXWcdlvk4157GfzfsVMWElRBqmHvOeu0HiaDac6bU3M5L7UaqVsC
         WkUw==
X-Forwarded-Encrypted: i=1; AFNElJ8DXvtMMGN0oAAhUmRv2+9nDQoB5OWUmNJ8Ssed+KWielwHUbYVqUwCYAbTyMfteEBgRPYiXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzQpg59SiU4e1/9bFskaxxmCCOxkxattaxr+hKZZmpDaLUitva
	6YTulTxSxGe8Cp/On2EHKSolndGgTwuzCVy+xo4HwbQAe9fsCFrCo+c2
X-Gm-Gg: AfdE7cl8zozBkjGQKKjjYBlyAcfu3tbVMhwCw2b/+xPJec1KZg74t0jw/C1JYpntjnH
	hgC3T6H9uvyicICpZBba3t1XW2GKlr8CONieysHh7UA9DoSl4FUVvSvHHTJb/DYgk0HvY3FPnGp
	JJoubZiDorSdIBVlWN2lkTG3gWCJOIp0LD/8pI1uaaWtcSll8QMcLZ1Als6eyVweBs6GR+UzuzZ
	Xh9A+6+82jDUki2dcLEe1TLFwsgiiyV+V6CxaWEjk0DlRU/qs1GS3PKfKwFclFqw9c0osqlo+17
	hLyAJywMGiZBB3I0ekIrJv9xeTlXuwXaTB+A0dXsI8rkoTjp6cDrnlE/sMnRHI6uAylRdoONA9/
	LLlMuTO1q4FcKQEzzP+MazzMocJKDQhkxH2m2B04uunFaV4JorhR32ieEFVigf95+Z6xuKkzuPT
	777FXBXE5umKmxcuAtHXucWhN9JvlC0C+NzacpS/bB6Fi1KhkG27/WM445FA==
X-Received: by 2002:a17:903:2447:b0:2c0:b5c1:8e22 with SMTP id d9443c01a7336-2c6f34218aamr24583345ad.12.1781780932102;
        Thu, 18 Jun 2026 04:08:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:08:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 57/78] ASoC: codecs: tas5805m: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:06 +0700
Message-ID: <20260618110827.232983-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tas5805m.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index bcc8cab8d667..f21670dab0f4 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -230,10 +230,9 @@ static int tas5805m_vol_get(struct snd_kcontrol *kcontrol,
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	ucontrol->value.integer.value[0] = tas5805m->vol[0];
 	ucontrol->value.integer.value[1] = tas5805m->vol[1];
-	mutex_unlock(&tas5805m->lock);
 
 	return 0;
 }
@@ -255,7 +254,7 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 	      volume_is_valid(ucontrol->value.integer.value[1])))
 		return -EINVAL;
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	if (tas5805m->vol[0] != ucontrol->value.integer.value[0] ||
 	    tas5805m->vol[1] != ucontrol->value.integer.value[1]) {
 		tas5805m->vol[0] = ucontrol->value.integer.value[0];
@@ -267,7 +266,6 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 			tas5805m_refresh(tas5805m);
 		ret = 1;
 	}
-	mutex_unlock(&tas5805m->lock);
 
 	return ret;
 }
@@ -332,7 +330,7 @@ static void do_work(struct work_struct *work)
 
 	dev_dbg(&tas5805m->i2c->dev, "DSP startup\n");
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	/* We mustn't issue any I2C transactions until the I2S
 	 * clock is stable. Furthermore, we must allow a 5ms
 	 * delay after the first set of register writes to
@@ -345,7 +343,6 @@ static void do_work(struct work_struct *work)
 
 	tas5805m->is_powered = true;
 	tas5805m_refresh(tas5805m);
-	mutex_unlock(&tas5805m->lock);
 }
 
 static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
@@ -362,7 +359,7 @@ static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
 		dev_dbg(component->dev, "DSP shutdown\n");
 		cancel_work_sync(&tas5805m->work);
 
-		mutex_lock(&tas5805m->lock);
+		guard(mutex)(&tas5805m->lock);
 		if (tas5805m->is_powered) {
 			tas5805m->is_powered = false;
 
@@ -379,7 +376,6 @@ static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
 
 			regmap_write(rm, REG_DEVICE_CTRL_2, DCTRL2_MODE_HIZ);
 		}
-		mutex_unlock(&tas5805m->lock);
 	}
 
 	return 0;
@@ -414,14 +410,13 @@ static int tas5805m_mute(struct snd_soc_dai *dai, int mute, int direction)
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	dev_dbg(component->dev, "set mute=%d (is_powered=%d)\n",
 		mute, tas5805m->is_powered);
 
 	tas5805m->is_muted = mute;
 	if (tas5805m->is_powered)
 		tas5805m_refresh(tas5805m);
-	mutex_unlock(&tas5805m->lock);
 
 	return 0;
 }
-- 
2.43.0

