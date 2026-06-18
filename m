Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3571A28469F
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781758534; cv=none; b=ER67hmmnWk3jgx/EgvuRoaUsuRyLMq9S+tx9adOuGICUhQ7pOHkUZjgLE0eZ3weCfE620Xtv44YR9m+8YnmwmANLqskaIaQn0wB6fOpEsxiuAogHuBwKFj6oT2xKCHQrfMqZwWflLzWTemRvHJ9YllasYp8pouMPBd8XvkrjJW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781758534; c=relaxed/simple;
	bh=cEEwdeqT05k4doLemATHwf5AlO6Et0xiKaGg6yMA/CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WfCeLPuF8PQoPmzmcGSwX4zJ1wI9oXu4LCJ+wLj59b+leX8Pz8+xdMTpM9rGGI+VmilCHbjt33l9QplHgTM/GrXjneLxe1IOEIsnnpiZDzOUo7AKVLAoKW+Sxnam1lVkvCKUYMxuEdBPz8IDX4XrwyOZqyzkhc71KrhFveI9nrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNljRrEA; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNljRrEA"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-845438a46d4so53548b3a.3
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 21:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781758532; x=1782363332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCE4R2BOhT+27QO4acZRvKfk/kBv2Crz43/hbhSMkK8=;
        b=VNljRrEAtteDRbd2P08viEWHbpQLXjIKHTZlT9VCTxzlDS2wWtxnHfGCUeoIyJxNrV
         SaqfutOXu7pXeOT8bPHVQDJK0DaSj7+iabN0NVLpqIiMRlwDuO8nSLYhY1epqTYY7EcZ
         UsaIeUtCT9yZmRR7L5xYCpV6IkRCjpFWmdeU6NWMi8B5Wyl1OErpMIyeRMHw1pjYdfjO
         JTiuBPl0Un/fPxgwDrkRREqLI0b0UvAxhwODaijFdvgcRHh0IZrWmbK6tDB1wRR+e/I9
         l+SvStYlNG2jP/J9YYpb53VvGt7e14tExeOlGlQEVYV/PDi10wEm8F+fXZJfsetvEC6D
         knSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781758532; x=1782363332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCE4R2BOhT+27QO4acZRvKfk/kBv2Crz43/hbhSMkK8=;
        b=VcgjgK4AqsG27h98/V9473PVv/y7XTqmOOrIY1999uZnp5ful2S32kgYssKLLPqVy6
         dN6lGeoY7F0TB8fre4mZFBy/xIO8gh0iPNPvfiDTwMimgxNLmbzadFBbTHtphiJPex6T
         7L9jjcFh6o49raUh8WxqZwBAqy5QnCb6HxztpI6aovGfgz1WGCjCiSf8mUcmHEiXljKT
         Nyu6YWjILxd0KilBMmVv3Yqk6Nu4SuEscgDruCj7aHYidtlsTDqfICZ15tcdeDAMxfvo
         +TzJf/R6JLTmbVNamX33x1B9EYxgeTpKRGGVxscLwGDbZ2Bbpv6wbWAjmwvZeLBY0ABe
         G83Q==
X-Forwarded-Encrypted: i=1; AFNElJ8JOBqyG3nQBLOd8y3jud50U497BxnQGG2FgLyg89eB8PGygB8uMZM1CYLtHTuFEBNipklX/A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj1ruxJF8yq/11oFafjdoKgwuN1bS94RT7zYqeTCG/CmvgwrVG
	GatpvjiWMguDPEOudEMbN86H5JVXbIa5aAjOKs2GVuvcO8BOy7ZC9oQP
X-Gm-Gg: AfdE7cmhzCe2jZhgX1WADq6inQKPWwydmbI1UKnr1lI1ueCSMKSTGtUxJfotKTPZB/+
	0TJxs9CGBIzXXZTZtCafLULc7DH0/sCUBoKAE1kdgDCbVTNxv/cl6C/7O3BljqmuZTBjJKHag1U
	BjzLzYbHuQ91pci7tLCuN/0bkasGe7dAUeOYGq5OlyPM8Dzz6IONW2xUIsQzkxaddVS3TmfM22n
	WpsCoAFY3kSqV4SGmxPUzHpXdWFAemsGWuMqykwYuLwGbJnFeTw4N8hjkpG0cKXIO1o+6iaNQSp
	A3C2Gsjoj4TO4nkSxKKnsdMIvmC9bYlv+gbrw6PL3ek7aHuqJcVp3h8/dzZ4q4Rzs4z3bzui0xg
	ZHMq5CwQU8a5e5gaO830kXzE/AbRJ6lDg+T6TX0TYeOJiBHr0AJFSuFraiEhE8ay5shrDcy6YHv
	sSf48BFl9zwVdCheiops90I9MGCtjAN3CFQOq9v/a2FCLH+Ho=
X-Received: by 2002:a05:6a00:238c:b0:835:3d5e:1dd3 with SMTP id d2e1a72fcca58-8453b3a65e0mr2118875b3a.42.1781758531503;
        Wed, 17 Jun 2026 21:55:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acfd7ecsm18024767b3a.25.2026.06.17.21.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 21:55:31 -0700 (PDT)
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
Subject: [PATCH 56/78] ASoC: codecs: tas2783: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 11:54:45 +0700
Message-ID: <20260618045507.21339-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tas2783-sdw.c | 89 ++++++++++++++++------------------
 1 file changed, 43 insertions(+), 46 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 7d70e7e3f24f..763663daf3e1 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -691,12 +691,12 @@ static s32 tas2783_update_calibdata(struct tas2783_prv *tas_dev)
 		return 0;
 	}
 
-	mutex_lock(&tas_dev->calib_lock);
-	ret = tas2783_validate_calibdata(tas_dev, tas_dev->cali_data.data,
-					 tas_dev->cali_data.read_sz);
-	if (!ret)
-		tas2783_set_calib_params_to_device(tas_dev, tmp_val);
-	mutex_unlock(&tas_dev->calib_lock);
+	scoped_guard(mutex, &tas_dev->calib_lock) {
+		ret = tas2783_validate_calibdata(tas_dev, tas_dev->cali_data.data,
+						 tas_dev->cali_data.read_sz);
+		if (!ret)
+			tas2783_set_calib_params_to_device(tas_dev, tmp_val);
+	}
 
 	return ret;
 }
@@ -764,27 +764,27 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 		goto out;
 	}
 
-	mutex_lock(&tas_dev->pde_lock);
-	while (offset < (img_sz - FW_FL_HDR)) {
-		offset += tas_fw_get_next_file(&buf[offset], file);
-		dev_dbg(tas_dev->dev,
-			"v=%d, fid=%d, ver=%d, len=%d, daddr=0x%x, fw=%p",
-			file->vendor_id, file->file_id,
-			file->version, file->length,
-			file->dest_addr, file->fw_data);
-
-		ret = sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
-				       file->dest_addr,
-				       file->length,
-				       file->fw_data);
-		if (ret < 0) {
-			dev_err(tas_dev->dev,
-				"FW download failed: %d", ret);
-			break;
+	scoped_guard(mutex, &tas_dev->pde_lock) {
+		while (offset < (img_sz - FW_FL_HDR)) {
+			offset += tas_fw_get_next_file(&buf[offset], file);
+			dev_dbg(tas_dev->dev,
+				"v=%d, fid=%d, ver=%d, len=%d, daddr=0x%x, fw=%p",
+				file->vendor_id, file->file_id,
+				file->version, file->length,
+				file->dest_addr, file->fw_data);
+
+			ret = sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
+					       file->dest_addr,
+					       file->length,
+					       file->fw_data);
+			if (ret < 0) {
+				dev_err(tas_dev->dev,
+					"FW download failed: %d", ret);
+				break;
+			}
+			cur_file++;
 		}
-		cur_file++;
 	}
-	mutex_unlock(&tas_dev->pde_lock);
 
 	if (cur_file == 0) {
 		dev_err(tas_dev->dev, "fw with no files");
@@ -917,22 +917,22 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substream *substream,
 		dev_err(tas_dev->dev,
 			"clear latch failed, err=%d", ret);
 
-	mutex_lock(&tas_dev->pde_lock);
-	/*
-	 * Sometimes, there is error returned during power on.
-	 * So added retry logic to ensure power on so that
-	 * port prepare succeeds
-	 */
-	do {
-		ret = regmap_write(tas_dev->regmap,
-				   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
-						TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
-						TAS2783_SDCA_POW_STATE_ON);
-		if (!ret)
-			break;
-		usleep_range(2000, 2200);
-	} while (retry--);
-	mutex_unlock(&tas_dev->pde_lock);
+	scoped_guard(mutex, &tas_dev->pde_lock) {
+		/*
+		 * Sometimes, there is error returned during power on.
+		 * So added retry logic to ensure power on so that
+		 * port prepare succeeds
+		 */
+		do {
+			ret = regmap_write(tas_dev->regmap,
+					   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
+							TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
+							TAS2783_SDCA_POW_STATE_ON);
+			if (!ret)
+				break;
+			usleep_range(2000, 2200);
+		} while (retry--);
+	}
 	if (ret)
 		return ret;
 
@@ -965,14 +965,11 @@ static s32 tas_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
 
 	sdw_stream_remove_slave(tas_dev->sdw_peripheral, sdw_stream);
 
-	mutex_lock(&tas_dev->pde_lock);
-	ret = regmap_write(tas_dev->regmap,
+	guard(mutex)(&tas_dev->pde_lock);
+	return regmap_write(tas_dev->regmap,
 			   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
 					TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
 			   TAS2783_SDCA_POW_STATE_OFF);
-	mutex_unlock(&tas_dev->pde_lock);
-
-	return ret;
 }
 
 static const struct snd_soc_dai_ops tas_dai_ops = {
-- 
2.43.0

