Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD203F5BC0
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692721; cv=none; b=Grldx9/WEaBNHhzlNAI2KfzOiUXxR3vvF8a9Zdwmr4INxU8PCHolgvYN8ASsPXnpmqrYJ1g9nRkR+/MZcBc26mGV3ng4/WAYaP/jiHHnzFeYaZ7+vU4LoM5Wk60pAoQafYbiblBqTdLL25T9iP7HRygxm/kuPlGPxA3gMr0/whU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692721; c=relaxed/simple;
	bh=+Jhubp8Ad5FukANrMioxXXMIcipBw2wUqbSTsnqQwRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GVvoAXX6n7C7sEXg/EBqTaT7//CsII2ftol07nsEdyeSwRxhJF40NAjN9gAnNKhQ7gCP1ZKkAiQqNTaJwvi8zdRpORqZJ/QQaVfWrL59bkkpDG4Ng2qTb5xymBHZDOcnLpJ/gbCpo5rhvlniyv9vrtlgLwqD1O/7OIAiqHQqAxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOKAq7PE; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOKAq7PE"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bdb3eb5f0so151846eec.0
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692719; x=1782297519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJIy1+pwCeD5f5eJrcAwlX5FxN6nvvTgLzD/CiIu9zI=;
        b=SOKAq7PE6fJFlQ3ywuvCGHozIaRF5YS7Y7eQ+oJdOF0x3YnMP7dgfHttyChnnY4MbB
         PWsvhC2+4FV0oMS27i8xgrBf8V+wtSleekgJL96xWg1Zv3q507IN82niJIkWhx6HdDW+
         pzKOQDbFhST5N3WW3W25dYOlW2GnuPWjEomYkN/jBeX6vhmNeJHddRWMP2FIPlsidHDG
         /xFdrgkxUc08kqaTOqmz4vlPtqxjjlTmZGcu30Tdg7bg4jJDxQS2ydZN/rwBeWXTe8LG
         TnsRNA3u66FCWjg/9NfIEuqM5v/Z0Jqgr3ark2ysH/PXQivbKZfxyqNhl9bS3fBhYaVb
         yyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692719; x=1782297519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJIy1+pwCeD5f5eJrcAwlX5FxN6nvvTgLzD/CiIu9zI=;
        b=a1FSRy3+DUZe/w4ZafyIZriGTUF24hLUnMiw2k0iV0xNez3LPAUZve3L4gQ5wfN3zv
         2aPIXhuTLxwdERDJ35smYP5cOzWag8O5DpkY8c70RvGU+FYoxW8Lwfs3F4OcjnliEtWP
         WI0Q7dVq4noPH8/qsLB6HG/J7o2NLoXw0K0685wVc1Si65pfeMU2pVR6+oPdVLvW9diL
         3FWxh1RiG3a7lZig34y8sdwPGgrat8VuBiCdH3T0b3xBvmupZoNpbWDpO62Q+zxI4/Yf
         H1RAv8H33rbJrZMv1MxXL2kutd3pbLqwjT+zFiQrW0jYIpdl+2iZErIXN5KB5Y+vEIqR
         DGDg==
X-Forwarded-Encrypted: i=1; AFNElJ/jytupCtvk7HrRPEfXHpPVs79NB1U8SDo0+i1g5ozGdC9E7sa4eGxATyHiGplkA/G6K6LdmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxjb/nEhl6xg1HV4574Iky3+SsZsMdza1Zh7Y3xhjVrAf6RSWC8
	Caz1jY07AhMjO29H4wZLcD+W0Lxas5fk8kNAaSL7Ixv/sdn39kdRNzp/
X-Gm-Gg: AfdE7ckLzY+e8gN5/t4N58j3p/x/eEBZ3CKTteHimEO78y/7oIm8rQtPsUs7jkShrvH
	4uzQeMYXdlNx4NGFX+wh2k/3YJi5Zyh3uCcQiKgDSyq/7iEHLm2EJO/RY9q8MTJcIAbniCzXnbb
	Xevdd/u9keRLvy7Qt5ERDV2l2ncd+s/TUr8I4smcfNgQjdYgHn8W4KHgnrVtPXNpH01S/EcKOXk
	FqdBZxsPwwQY4Fv287dOg8Cj/z/O76YAiGKdbaYIUF55/ytv1dZI7OSoONMB/AYX1Mu159ZNzKB
	ssWfc+1lm+d2Q1G05sB8lBJQIB7ggNOXHAeCesr7bxqxjubYX53JFnCeqL8pvuERUJH1jsa03t8
	gudD/Aiuo593uY/YjF14CAc4ZhE6WIhzti7bb5019VuEhUxyTGRL16BipahLL1uXz47+ijurkA8
	YU7CkSz2iLHd8S3ZDdT+nw2jWR95SlGAIaV8FhVQ9JtJKNeFM=
X-Received: by 2002:a05:7301:1192:b0:30b:d86b:f250 with SMTP id 5a478bee46e88-30bd86c5dcfmr429093eec.0.1781692718566;
        Wed, 17 Jun 2026 03:38:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:38 -0700 (PDT)
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
Subject: [PATCH 36/78] ASoC: codecs: max98095: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:53 +0700
Message-ID: <20260617103235.449609-37-phucduc.bui@gmail.com>
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
 sound/soc/codecs/max98095.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index ced9bd4d94da..7cdb76f3813b 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -1532,15 +1532,17 @@ static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_eq_band(component, channel, 0, coef_set->band1);
-	m98095_eq_band(component, channel, 1, coef_set->band2);
-	m98095_eq_band(component, channel, 2, coef_set->band3);
-	m98095_eq_band(component, channel, 3, coef_set->band4);
-	m98095_eq_band(component, channel, 4, coef_set->band5);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_eq_band(component, channel, 0, coef_set->band1);
+		m98095_eq_band(component, channel, 1, coef_set->band2);
+		m98095_eq_band(component, channel, 2, coef_set->band3);
+		m98095_eq_band(component, channel, 3, coef_set->band4);
+		m98095_eq_band(component, channel, 4, coef_set->band5);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
@@ -1683,12 +1685,14 @@ static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_biquad_band(component, channel, 0, coef_set->band1);
-	m98095_biquad_band(component, channel, 1, coef_set->band2);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_biquad_band(component, channel, 0, coef_set->band1);
+		m98095_biquad_band(component, channel, 1, coef_set->band2);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
-- 
2.43.0

