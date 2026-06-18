Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811471AA1D2
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781107; cv=none; b=CcoYl+kw/kNwgGI7frHnMhlW0R48HYC6STg7d3UmNM9AVs/wKK3kT6PJGQgOX6kvP3MMu3669nOt/w8i1nST1wp9vDysgKXYzjw92FGhVh/SG7UBYVczq6WpW9o5W5du6e22kAWP4rSxkZ0EycQatRrsY8ntD4uzlobUMsxxPsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781107; c=relaxed/simple;
	bh=++at9ROEgXmKDH/kyXw3Z0r6AqE9xO82XgorizIVGmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gs0rlT2vrOHioSbQcJOnQtTDsU6F7lCKoplCsG+SRpNi/WgkAP7jQiAe1HYnePJp/gKPC+/p917MlQDgP+HLdBehhdhN+1gR0muoDzdal7R6cSonDMHN0QdqBtn4R270wcArBHS38sRXPYQ96qoHGGuWp62iEw9cRtlff2tlmpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuIhensy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuIhensy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c6fcfcdb2bso3547375ad.1
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781106; x=1782385906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iT7a5mYt4EuRjvnoC6cJH0e8+Ysv0zetvEmuOypZ5E=;
        b=JuIhensyXflxMflRQTKLUgaZaMi/x2vy+n4oax4OSQZ0ISjW0a3cpCajNGReSVPIQ2
         E+fWU2LOjtj2i+0m7yRY15Ft4mqMxOsdot9J5LB7pWNEnUz4S/LPbIT8BzYjJJPBVhIv
         QEVWpNoezhfr3zHiKsdyA9JHmJ8huWwRBRiA0u3/AWxdt3aogPPPGsmyhxJCz2bNx6yJ
         UOic7eYlHWEVBqCrIBrKboRxGBIMxZdr3Qos+tikVoVxgf5TOiC69tHRZWsy8x7+/K1m
         n6EZX6bLaJJTygbl4FYritpf54kQzsSsVR/nelSAd8Cf3Iq/FFWe6nH9TL7/NTJ2tINj
         uaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781106; x=1782385906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0iT7a5mYt4EuRjvnoC6cJH0e8+Ysv0zetvEmuOypZ5E=;
        b=nwpsDR+66QBRXGo5uu7IocIZSiSOtVWJM6bmrLAjtKiPsQLSKny2pTrCIzIDxG1Ywu
         /RH2n33CJIIaMVImFePtAExkBUTpM/TIYkri7g0wnopkb7uIt3j7UdMiRGPDA1clfzHB
         pFpvg/imMmXUFzaLY9+ZMzlWJBVAI3L/3UijaOJHTdOTRlijmBPVh5ckW7xh/3fGxR9R
         TWC2Vya3GMIcJzec6R5yxlveTDY1/Newki2lLFcbACBSrzXi9bX60k/bgmDLQ3y77V+z
         enYicz8fb+nbXOjF7BJ9RW+cOPGrfdGv88TOWlWRVNw6V5leMF3kwnIHCdNC3NDfTlPA
         46Xw==
X-Forwarded-Encrypted: i=1; AFNElJ9pUQOmuczDS5nYenYDuNjnTidzoSBX5dlTwNLnq0tdS3QRkWjg3JK0xDIcfvUS+hqHaVOiyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs9OtAGmjwF5bBHgo0/FbzegWbVvz6LJ9hP2RkZG3eSeW8In/D
	H+HCCvobzqguZsiusfrD9yv2OuV2rMnlvQ1Z6IcnJR2e2BOHH6qF2UYW
X-Gm-Gg: AfdE7cmLEpuFTyD/rv/kqV4//pUzEQSVMMjq1/IAjbaMC7nRoZtvLFOPK4wL25G24oT
	XSp34qzMRrg4oHRAhjpKLh+TjgQ5NAgQhbSSSXt0yH2D46plvJzzpwxfBN6B4KpJ3nhiQMnLtOI
	GRby63NmBq4rqxmk0S2QH3JPD0+D3/2e68OLU7I+8VJdD31iv+kLAemze3dSVIqUvKDYKw69glb
	tyJXMSQmp7zu92qdeEkyMq0J2FGLJXwfJWjpc/AQIiZAbzlBkjY0JwcRq1z3x5PMpOq+Wp1xGu/
	sSbRvEprAgKtTiQ6TmGugVLm5TlWmEB8cmumNSeAoPa1te2IfzNSjOuJkXLelB1Nv5MBqlRpxTq
	+IUhKFF7ZbZGK/8InEhbj4cCI54GCogX/qaQm67dMu/nTndgaxbZ/0s1n6CKjMNXAqT56yepeWD
	Dh/D1rlI4AGEesUMJh81JddrD0Mv+/2PiueABzwe9O34bY015oaapu32k9kA==
X-Received: by 2002:a17:903:2cb:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2c6bc23c319mr84718925ad.31.1781781105826;
        Thu, 18 Jun 2026 04:11:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:45 -0700 (PDT)
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
Subject: [PATCH 77/78] ASoC: codecs: wm_adsp: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:26 +0700
Message-ID: <20260618110827.232983-21-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm_adsp.c | 87 +++++++++++---------------------------
 1 file changed, 25 insertions(+), 62 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index baa75e7ff53b..816e7e0d60c7 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -356,15 +356,13 @@ int wm_adsp_fw_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.enumerated.item[0] >= WM_ADSP_NUM_FW)
 		return -EINVAL;
 
-	mutex_lock(&dsp[e->shift_l].cs_dsp.pwr_lock);
+	guard(mutex)(&dsp[e->shift_l].cs_dsp.pwr_lock);
 
 	if (dsp[e->shift_l].cs_dsp.booted || !list_empty(&dsp[e->shift_l].compr_list))
 		ret = -EBUSY;
 	else
 		dsp[e->shift_l].fw = ucontrol->value.enumerated.item[0];
 
-	mutex_unlock(&dsp[e->shift_l].cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_fw_put);
@@ -450,15 +448,11 @@ static int wm_coeff_put_acked(struct snd_kcontrol *kctl,
 	if (val == 0)
 		return 0;	/* 0 means no event */
 
-	mutex_lock(&cs_ctl->dsp->pwr_lock);
-
 	if (cs_ctl->enabled)
 		ret = cs_dsp_coeff_write_acked_control(cs_ctl, val);
 	else
 		ret = -EPERM;
 
-	mutex_unlock(&cs_ctl->dsp->pwr_lock);
-
 	if (ret < 0)
 		return ret;
 
@@ -486,15 +480,13 @@ static int wm_coeff_tlv_get(struct snd_kcontrol *kctl,
 	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
 	int ret = 0;
 
-	mutex_lock(&cs_ctl->dsp->pwr_lock);
+	guard(mutex)(&cs_ctl->dsp->pwr_lock);
 
 	ret = cs_dsp_coeff_read_ctrl(cs_ctl, 0, cs_ctl->cache, size);
 
 	if (!ret && copy_to_user(bytes, cs_ctl->cache, size))
 		ret = -EFAULT;
 
-	mutex_unlock(&cs_ctl->dsp->pwr_lock);
-
 	return ret;
 }
 
@@ -694,10 +686,9 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 	struct cs_dsp_coeff_ctl *cs_ctl;
 	int ret;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 	cs_ctl = cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg);
 	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
 
 	if (ret < 0)
 		return ret;
@@ -709,14 +700,10 @@ EXPORT_SYMBOL_GPL(wm_adsp_write_ctl);
 int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, int type,
 		     unsigned int alg, void *buf, size_t len)
 {
-	int ret;
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
-	ret = cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg),
+	return cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg),
 				     0, buf, len);
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
-	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_read_ctl);
 
@@ -1270,38 +1257,32 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
 {
 	struct wm_adsp_compr *compr, *tmp;
 	struct snd_soc_pcm_runtime *rtd = stream->private_data;
-	int ret = 0;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	if (wm_adsp_fw[dsp->fw].num_caps == 0) {
 		adsp_err(dsp, "%s: Firmware does not support compressed API\n",
 			 snd_soc_rtd_to_codec(rtd, 0)->name);
-		ret = -ENXIO;
-		goto out;
+		return -ENXIO;
 	}
 
 	if (wm_adsp_fw[dsp->fw].compr_direction != stream->direction) {
 		adsp_err(dsp, "%s: Firmware does not support stream direction\n",
 			 snd_soc_rtd_to_codec(rtd, 0)->name);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	list_for_each_entry(tmp, &dsp->compr_list, list) {
 		if (!strcmp(tmp->name, snd_soc_rtd_to_codec(rtd, 0)->name)) {
 			adsp_err(dsp, "%s: Only a single stream supported per dai\n",
 				 snd_soc_rtd_to_codec(rtd, 0)->name);
-			ret = -EBUSY;
-			goto out;
+			return -EBUSY;
 		}
 	}
 
 	compr = kzalloc_obj(*compr);
-	if (!compr) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!compr)
+		return -ENOMEM;
 
 	compr->dsp = dsp;
 	compr->stream = stream;
@@ -1311,10 +1292,7 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
 
 	stream->runtime->private_data = compr;
 
-out:
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_open);
 
@@ -1324,7 +1302,7 @@ int wm_adsp_compr_free(struct snd_soc_component *component,
 	struct wm_adsp_compr *compr = stream->runtime->private_data;
 	struct wm_adsp *dsp = compr->dsp;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	wm_adsp_compr_detach(compr);
 	list_del(&compr->list);
@@ -1332,8 +1310,6 @@ int wm_adsp_compr_free(struct snd_soc_component *component,
 	kfree(compr->raw_buf);
 	kfree(compr);
 
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_free);
@@ -1741,7 +1717,7 @@ int wm_adsp_compr_trigger(struct snd_soc_component *component,
 
 	compr_dbg(compr, "Trigger: %d\n", cmd);
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -1777,8 +1753,6 @@ int wm_adsp_compr_trigger(struct snd_soc_component *component,
 		break;
 	}
 
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_trigger);
@@ -1839,12 +1813,10 @@ int wm_adsp_compr_handle_irq(struct wm_adsp *dsp)
 	struct wm_adsp_compr *compr;
 	int ret = 0;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
-	if (list_empty(&dsp->buffer_list)) {
-		ret = -ENODEV;
-		goto out;
-	}
+	if (list_empty(&dsp->buffer_list))
+		return -ENODEV;
 
 	adsp_dbg(dsp, "Handling buffer IRQ\n");
 
@@ -1859,13 +1831,13 @@ int wm_adsp_compr_handle_irq(struct wm_adsp *dsp)
 					  &buf->irq_count);
 		if (ret < 0) {
 			compr_err(buf, "Failed to get irq_count: %d\n", ret);
-			goto out;
+			return ret;
 		}
 
 		ret = wm_adsp_buffer_update_avail(buf);
 		if (ret < 0) {
 			compr_err(buf, "Error reading avail: %d\n", ret);
-			goto out;
+			return ret;
 		}
 
 		if (wm_adsp_fw[dsp->fw].voice_trigger && buf->irq_count == 2)
@@ -1876,9 +1848,6 @@ int wm_adsp_compr_handle_irq(struct wm_adsp *dsp)
 			snd_compr_fragment_elapsed(compr->stream);
 	}
 
-out:
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_handle_irq);
@@ -1907,21 +1876,20 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
 
 	compr_dbg(compr, "Pointer request\n");
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	buf = compr->buf;
 
 	if (dsp->fatal_error || !buf || buf->error) {
 		snd_compr_stop_error(stream, SNDRV_PCM_STATE_XRUN);
-		ret = -EIO;
-		goto out;
+		return -EIO;
 	}
 
 	if (buf->avail < wm_adsp_compr_frag_words(compr)) {
 		ret = wm_adsp_buffer_update_avail(buf);
 		if (ret < 0) {
 			compr_err(compr, "Error reading avail: %d\n", ret);
-			goto out;
+			return ret;
 		}
 
 		/*
@@ -1934,14 +1902,14 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
 				if (buf->error)
 					snd_compr_stop_error(stream,
 							SNDRV_PCM_STATE_XRUN);
-				goto out;
+				return ret;
 			}
 
 			ret = wm_adsp_buffer_reenable_irq(buf);
 			if (ret < 0) {
 				compr_err(compr, "Failed to re-enable buffer IRQ: %d\n",
 					  ret);
-				goto out;
+				return ret;
 			}
 		}
 	}
@@ -1950,9 +1918,6 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
 	tstamp->copied_total += buf->avail * CS_DSP_DATA_WORD_SIZE;
 	tstamp->sampling_rate = compr->sample_rate;
 
-out:
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_pointer);
@@ -2063,15 +2028,13 @@ int wm_adsp_compr_copy(struct snd_soc_component *component,
 	struct wm_adsp *dsp = compr->dsp;
 	int ret;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	if (stream->direction == SND_COMPRESS_CAPTURE)
 		ret = wm_adsp_compr_read(compr, buf, count);
 	else
 		ret = -ENOTSUPP;
 
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_copy);
-- 
2.43.0

