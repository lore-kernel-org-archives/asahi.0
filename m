Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2594218AC
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692488; cv=none; b=qodZCDfkVVtyfVjDABNHzNdH0qbw9tLPKDSaF0w4scwFZvcjvy0HkTOrVw0NHVZC7nF3zOaAqNeihPfBDOqC6xhxzEMxvM+tjgLVwXhH60nBdzmvl9NJpiDbo+pc70U4RoC7o2RIEtkCp7DCR/P2ySNIJDhrocK2NHbirJD1sYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692488; c=relaxed/simple;
	bh=uNHjTev2hmfXRNq+0ljawWlrrdZPdtmV526ovzJ70zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=swnOusZwg5TDghVuO+urUJHyR0gnRpaQNeLz4jo2WbWT6CrWhnlSmIOcBwf5uTS1owKEj6IrvASEyHwflC/I1KFueVLX2+UXuOh7RDxIyZ0DqXW3OtGuQSYD24j0zxUb1EDXgJlqH5PLdRwQqGkWxFOjRrMIexE7HqpDCvQzt0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpYjANLz; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpYjANLz"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3078e0dcd67so5789835eec.0
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692482; x=1782297282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R22m/pLPBKiTabqFMhVFBn5ZxuG7/U6c6Q8dEuLYd8=;
        b=jpYjANLzWmZizWIKqPMErCYRNNDHpE7h6ispFk99ddnaLJWrLRHafZU/bIIjfJUcvV
         Ay7yAgwSmF6MxB8MOpk7iaQSMrBVSVfA/h5sopdW3f5eyhziBUHDYygoKrC8bEF7y31P
         HvM7QsqghFliu2VbOeoTmbzOcq9VKy87B/bDFd3wiyun6bJu+rPxADE6drLYJFFWZSGm
         /V+j+KDIeH4vqPzfzjUm1TKjknXJU+y7RuXtg1mMfo17XKpO39DB8A4WTYZQqPzwxCiA
         B+RawK797/Ob/HFU6sOxSdXJXMt32LUwxKQn9DNWamVEM2cH6ZPLfESZM5NP9V695nwB
         EZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692482; x=1782297282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6R22m/pLPBKiTabqFMhVFBn5ZxuG7/U6c6Q8dEuLYd8=;
        b=KeoXYMyHcwh9i4eXyun5REAetOwTH3UkGp+e2g1lt/i9eIrqWZemXJpg7uTlR8Xcnr
         FBUBhQSu+0GszddRB0FCkmCVBYBeEFkBCRE9d99isj5XI58exmSswc5Qv4S67PApRXGM
         I6XnHL9akhcHIf1Lw52Wj4QuJ/gKeu0NmLMd8m9SzNbL5ygsAqNoiw4agycb3fegeSjF
         DZXiwlqV1iFQHP4FyJAgaNRtqmf5JR5LI/6RKA2HOQzhVmf9qy+OMaNOqYfaYzBXv8XU
         2Thg2+BYVIRFa/s+AbGPIUVoLwy8lS7zoGg/M/OhZq5y/pcyESUBXMb4zSFHJGyaLgle
         Zo5w==
X-Forwarded-Encrypted: i=1; AFNElJ8hmOTV0iN0BLwkFO6XvBxoChSRSDq4Mz1Fx4FOHSH1BtzTlbuxkhwU1+4A0BnKBvkTTNisvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbxThNUBWM4kNZkShug3Ayi84nNGLenibFE9nf6QACZCD8J2p2
	4/aHuFihmMWwpyKQS0nl3xcbsOenPfT4eK2fCOM/m60UVv1r7ubu7y7N
X-Gm-Gg: AfdE7cmHVTKsi3+TUYQMnM8gC+R/qFpNV3vcHMtoID+rQuQSxwETvAUP37S2gOesQ8x
	1DePBnnLufTRy5mXvSgLUe2jLOMXhovLRSZrS3ih31cVcUOC0REm5pc4mpWxAO84YkI2YAK6KUZ
	XnjMugh5g42VnSiEv9LSInDQ9wF0x93kdpfJ6VKUcPVifJuauEZVZjYlqQvIxRpHqTIb8eSO6+a
	boOF9RjR9+TTa5r3+WswK/RlWRHV4F+askTtIVnW6s4opi86tjnS/OqGgkLk7vExqDOTVwYE2y/
	+FRdu6R1bXPzJpyh4JXC7RTIzAMpOR64ZHNdx1nXEBffIKqLk38+yMLCnAOla7h+3Z1kPUduY2m
	RC+97eC4U5237LDLbIGxG5Cjg1aUN89hxxNvjLWQEQABorodhmif5yd5gaj1riGBlMMbTiSKYg7
	I91FGjybVKb6Jy5CvdUgpHrs3lA2f11JAylgXoRtESS2WeZ7U=
X-Received: by 2002:a05:7300:6d15:b0:2ed:b131:240e with SMTP id 5a478bee46e88-30bca0dabccmr1625180eec.23.1781692481713;
        Wed, 17 Jun 2026 03:34:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:41 -0700 (PDT)
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
Subject: [PATCH 11/78] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:28 +0700
Message-ID: <20260617103235.449609-12-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cros_ec_codec.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 7dc5a7c3ca96..c522bacf06de 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -608,10 +608,10 @@ static void wov_copy_work(struct work_struct *w)
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
@@ -624,8 +624,6 @@ static void wov_copy_work(struct work_struct *w)
 				      msecs_to_jiffies(10));
 	else if (ret)
 		dev_err(priv->dev, "failed to read audio data\n");
-leave:
-	mutex_unlock(&priv->wov_dma_lock);
 }
 
 static int wov_enable_get(struct snd_kcontrol *kcontrol,
@@ -895,12 +893,11 @@ static int wov_pcm_hw_params(struct snd_soc_component *component,
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
@@ -911,10 +908,10 @@ static int wov_pcm_hw_free(struct snd_soc_component *component,
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

