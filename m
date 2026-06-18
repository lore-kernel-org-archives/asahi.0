Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF963F0AA7
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781039; cv=none; b=jEb7Z+z7Q54zCOuMbEZ0VVpFhYeYaw/HMPvALx8hbmjwZgmKlVe9vM/nPgfoM3qyw9feYZ6tegaPyonZC+EfkI2Ni5oHpKdax7qrCXoM3WK7Tw3V7EEzSRb/VuiLik0J/ssquaH423yI1K3atg0ntRxI/KffFjOdZJe1+UhwSSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781039; c=relaxed/simple;
	bh=VUGM1dmrYZr3ZCpRVFURnksOb2sWDjNx8Q29gealQ+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/ugchjQZIFLE8HrGUTWhP/JIBr9Ber2T/03ydy3KDqnUTLmbOzO9+6lhNwLEo5teaU6pVKeeDeISumfHmWJ+SdofxOJGNXG1uJtOiy1N27hxbqISt3UwwKgsAKNvZdjpvh7O/edVrhAnRK0tbcuEfytxJMLKzc1wn9sSkk81ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSoNOjbP; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSoNOjbP"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c40397e746so5405985ad.3
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781037; x=1782385837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCvpI9caCdCJQKq9fbLR0v07NU2fYhKI7H79tQqdsi8=;
        b=XSoNOjbP94g50Poh4jBlzKtwN+vUcEsr6zZVy/M7RpGZTNje0u60ghGkxLS6d6g3RX
         t/NP8+P9v/aLmeIHzHaWj0Pu7ft2VvdjRJ6CSWiehvQvOWxP7t719H323//ZGNp24/cL
         ATDulmhONZHPMrLBOyiC3VqlwTsuI7xiUNAqjiQKQ6rQP4ZhiAyoZDJWVup50Kisr5Zf
         eVnsl2PMAbaUdEo5QZ/VY9rhWcJNQ5JGvq5ty3v24diymHavDv50gKx3ouUTwGWw3Vwb
         J9Uk+XBloK81PiId6+u40TEksCH6kQHCG5PmEFkXynvjtB+nh7svqHUMh9LEjul7cLxp
         a0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781037; x=1782385837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCvpI9caCdCJQKq9fbLR0v07NU2fYhKI7H79tQqdsi8=;
        b=SrJQUf6or9LDzHILvTYF/yR1bNDltcNtlEQ2SIGqSDNZT2f+I9rlx4wviMDwKuylDK
         7IvbuzB4mMIwSSLLTDUOD04t/7cIqKsvyb5SKT/5jf7qSsUr8GOBAFXxf6huSn20C8Ki
         Xg+zBegfKBBtbcSclliEZnykN2Pl7K6vyVVoUUqeMCxm6fk1HedO5DMFh+qxlCqMARuL
         tHVSYRBo1/5n3JwPnu0MtgYWs3p3nA4pYkEJbHpgs7ejehnUj7wZFR0/8T/Ryv5Ifa0z
         VZLeO4RH03dUYzeDkptNvyp0YnO+6SRl0lZJxopTW9ZB2tlluOD2oCgrqgM1QKqO7l9q
         IECw==
X-Forwarded-Encrypted: i=1; AFNElJ+LDGqLyc8UmBlVV/XQ1BKyH8ytL5pgp/6UXvWRlMwk14yuqA+xqKPdOVuVjORwAxbOlTyZ3A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZUMiTL59E718S3kRjFiHXixn3C3PrsnrTN/k46D+s+SOlgs7C
	Np8wkj+VKG42yKhzOlwsC1cUi+H/WXfIncMJ53UwEKHBlxRCU77jbvQR
X-Gm-Gg: AfdE7cmVYUZfx9AfkNhLeJDiSg6aMW5GXr5DVMdNCtnVIjXqQqmv+jE18T4TKmuwEXi
	2JVEyZ1zJ8OTMehFJsRCq+arnARIpbocWtsgUUqVmznVxXl0Kon0VJ580uZ/bNqVuwlZfF2sc/k
	Bj+UXEBlQt60MQ7eszW4BfgoDuogMcEVqFaP+10ZeQFOMrFJFIbIy++D0AnVmRi+BM6kdIbnWui
	OwXBwZpSv01jUeRRx3VI/k7MwbzCCq+wzXonP5equY1Iu+3PhUe8nE6DGJuEOQkdIlm52POBlBy
	H8PoCoBiagtjoC4Oz/stVD2AukOS2FrDmbtshG5dF+RarCl2RZquwPn3/EkPISQOtGZBoisZMTa
	X+cWp6NoBacRAMkcEzi7KMu8TXoyzefmzDy0nX7wQDp1Nj724jnZPp0bjLpU891lrE6TMTDyfVf
	5d4tx0MnJVmJ6MsCn4Cr4oJ+uFj59OC3aPGWU2hGTT92ZQvoo=
X-Received: by 2002:a17:903:1a6f:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2c6f340c78cmr24378815ad.1.1781781037629;
        Thu, 18 Jun 2026 04:10:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:37 -0700 (PDT)
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
Subject: [PATCH 69/78] ASoC: codecs: wm2000: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:18 +0700
Message-ID: <20260618110827.232983-13-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm2000.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index 9b68ee69324b..775f138fdf3f 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -612,20 +612,15 @@ static int wm2000_anc_mode_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int anc_active = ucontrol->value.integer.value[0];
-	int ret;
 
 	if (anc_active > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	wm2000->anc_active = anc_active;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static int wm2000_speaker_get(struct snd_kcontrol *kcontrol,
@@ -645,20 +640,15 @@ static int wm2000_speaker_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int val = ucontrol->value.integer.value[0];
-	int ret;
 
 	if (val > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	wm2000->spk_ena = val;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static const struct snd_kcontrol_new wm2000_controls[] = {
@@ -676,9 +666,8 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
-	int ret;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	if (SND_SOC_DAPM_EVENT_ON(event))
 		wm2000->anc_eng_ena = 1;
@@ -686,11 +675,7 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_OFF(event))
 		wm2000->anc_eng_ena = 0;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static const struct snd_soc_dapm_widget wm2000_dapm_widgets[] = {
-- 
2.43.0

