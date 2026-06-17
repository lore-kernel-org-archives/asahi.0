Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C52408604
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692750; cv=none; b=ZznjRTl9NTpffmWW+HCEjPOMXMfjHwwte1hmb4AqS+B3ZlFp/vYrO4HQtD7f2tENK9FM/eOO/rjjHm54loUlo4HoxhS7hX8WKq2Z5GxCrlGVlnKqJiZUq1C6/TEtQONYkPv/6b5rFt1FOd9sy5aNQzS2G+rtBgCOx1E+tq1Xezg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692750; c=relaxed/simple;
	bh=2OS+ZLeJB3Vp7Kq/OKrNMwANrE/9kC0JDhKdYAhqOEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bsRlEgBE6hKKQjaxD/hOZjXVhDjBIqws8hHZpAYSHO13thDZ7w597bD11mKijLL+K9RJbW3nej4VSlBcAdXTC+zTHGDDZta31jA1WcWRKMNh02Vo4d+UDhefwJh/ORmXnU5inCroNO14tZs9XiGGAy9ZHhaQvCVRDDHRJG/0Fl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhEKbZVb; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhEKbZVb"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-307d0405e07so8461057eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692748; x=1782297548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYWRPoZz4ae7K4jnXXMDEkNAOT3Lgww531flfNqozJE=;
        b=BhEKbZVbDX2VDwBLhlUtS19QTeDGUkLbkhW4sWpGSj3ohss5cdxro4PyvIFvDzpi7/
         6yUC+QuiTiuy4yvN66+HcyMH30r8HMxTMPHREaJKBl37G31qDaLsituyuD6CIVf4rdIv
         P2Ucbe7um4RqmErasXs0mA//E6EL/W67cxJw/F8UKK5QZnAYhcZ0/XxpmR2aflz71db2
         Ti+zx6KYlvwYXfpssbj6ESZ+zR190szF+TTpTXaI91EdQ19J48xN1pAix739sUDecjGe
         VzfZY2CmHaylzS7QxKZZXyMaYJggWm4AUCWyIByGP2c6KfZ1HN4z3bwlS21sYV9Bp1wv
         4/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692748; x=1782297548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IYWRPoZz4ae7K4jnXXMDEkNAOT3Lgww531flfNqozJE=;
        b=gmIWXKe335SwW2qn3K7lbRyAscHgx1GF149ETOxRiB6vEfwSPUKdahJlUGxp4+TOW3
         o1cCw/pHFcBYLew08k+i9GYkxEzuen3pJBn8VKTYEIcs+sbB/SLjzOaq4ZnF6Gtoyt/p
         /h2Xc1G/fU0oX10n79VqMP2D2FghlOGKm/MPr533zxbanHryaWFRD/vCkiqzL+S9MsEU
         nbrCrnnymUNGJQGaF/WMTcbKCCwCxXIPDLqR7bYYoi+VE8otU/T5T+AVn0QxZNRPf1wX
         sUEhIwTRFeyzo2SXMqIZsStICvSijY+3Yov66IODTNpHZuXAP8OaCYAEfpiYvytRr9E3
         0Sew==
X-Forwarded-Encrypted: i=1; AFNElJ+U2nU2XsZFNwXUuf38Jv+gowl01uu9bQD06U39H5XiDvgKI5NMBApwK6j48Rrbf6KERGAVcA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzckQpo24ljKw2ZKyl9ru00kfwcBJkb9q5aUZbZRScHE75sBq/S
	7VFMD4LlYS75OFlouIh6wDbexJhox7PHEy2LTJQHW8NAlBP+pkRDSWpi
X-Gm-Gg: AfdE7ck7SfxhaZ0L7xrbKIN+QeKwfykURaAk87pyiheisrEkZ/1+T7Fqq+qCwsCIPmN
	1H4v8p/OMXLLxM7bt1C2DA8kx6PDuAe6Xi9dsIMJ/PVIoIqg6OU0Sz1CcWPTt8fWsziTEdu/4kK
	Y8IfiLEEIW6CugBS/6qx10pOB35H9U6YMFsofgSxGFXUpnCce1LgcGtuyeGrUX2+ES3hliWX/ew
	atR+htdQlMxsiARmXlkAS7azHl/aA2uJi3PqDTg9+3f0xaXg9IunD4kDWAK5UvUYsZBqAPXMb89
	OKPwJGw0ep2+Dly/LuGl+AeOvaU8H3InFYuPObIe0BQPBsKvJ7naQ6Ulk6UtP47T3ae0jAO+jBk
	uYvdtbZotWHWWtyCGaV8OfKVEeHwc3moZZBH5IkdR5yOxgWvhgs8ZOkbrsr66mczqXGeLu0YN4R
	E+cU0gCzhoEWooPbmfbuen3yVCKhVssuC/DowL3qJXEbxmAn9zYaFaspXWWQ==
X-Received: by 2002:a05:7300:2388:b0:30b:8862:db15 with SMTP id 5a478bee46e88-30bca100cc9mr1489898eec.28.1781692748156;
        Wed, 17 Jun 2026 03:39:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:07 -0700 (PDT)
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
Subject: [PATCH 39/78] ASoC: codecs: pcm6240: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:56 +0700
Message-ID: <20260617103235.449609-40-phucduc.bui@gmail.com>
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
 sound/soc/codecs/pcm6240.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index 4ac4448ac3c8..984fabc6d578 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -605,7 +605,7 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int reg = mc->reg;
 	unsigned int val;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 
 	if (pcm_dev->chip_id == PCM1690) {
 		ret = pcmdev_dev_read(pcm_dev, dev_no, PCM1690_REG_MODE_CTRL,
@@ -613,18 +613,18 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 		if (ret) {
 			dev_err(pcm_dev->dev, "%s: read mode err=%d\n",
 				__func__, ret);
-			goto out;
+			return ret;
 		}
 		val &= PCM1690_REG_MODE_CTRL_DAMS_MSK;
 		/* Set to wide-range mode, before using vol ctrl. */
 		if (!val && vol_ctrl_type == PCMDEV_PCM1690_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -25500;
-			goto out;
+			return ret;
 		}
 		/* Set to fine mode, before using fine vol ctrl. */
 		if (val && vol_ctrl_type == PCMDEV_PCM1690_FINE_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -12750;
-			goto out;
+			return ret;
 		}
 	}
 
@@ -632,15 +632,14 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	if (ret) {
 		dev_err(pcm_dev->dev, "%s: read err=%d\n",
 			__func__, ret);
-		goto out;
+		return ret;
 	}
 
 	val = (val >> shift) & mask;
 	val = (val > max) ? max : val;
 	val = mc->invert ? max - val : val;
 	ucontrol->value.integer.value[0] = val;
-out:
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return ret;
 }
 
@@ -678,7 +677,7 @@ static int pcmdev_put_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int val, val_mask;
 	unsigned int reg = mc->reg;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	val = ucontrol->value.integer.value[0] & mask;
 	val = (val > max) ? max : val;
 	val = mc->invert ? max - val : val;
@@ -702,7 +701,7 @@ static int pcmdev_put_volsw(struct snd_kcontrol *kcontrol,
 			__func__, rc);
 	else
 		rc = 1;
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return rc;
 }
 
@@ -1580,7 +1579,7 @@ static int pcmdevice_comp_probe(struct snd_soc_component *comp)
 	const struct firmware *fw_entry = NULL;
 	int ret, i, j;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 
 	pcm_dev->component = comp;
 
@@ -1634,7 +1633,6 @@ static int pcmdevice_comp_probe(struct snd_soc_component *comp)
 out:
 	release_firmware(fw_entry);
 
-	mutex_unlock(&pcm_dev->codec_lock);
 	return ret;
 }
 
@@ -1645,9 +1643,8 @@ static void pcmdevice_comp_remove(struct snd_soc_component *codec)
 
 	if (!pcm_dev)
 		return;
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	pcmdevice_config_info_remove(pcm_dev);
-	mutex_unlock(&pcm_dev->codec_lock);
 }
 
 static const struct snd_soc_dapm_widget pcmdevice_dapm_widgets[] = {
@@ -1890,9 +1887,9 @@ static int pcmdevice_mute(struct snd_soc_dai *dai, int mute, int stream)
 	else
 		block_type = PCMDEVICE_BIN_BLK_PRE_POWER_UP;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	pcmdevice_select_cfg_blk(pcm_dev, pcm_dev->cur_conf, block_type);
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return 0;
 }
 
-- 
2.43.0

