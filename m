Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E732F0C62
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781091; cv=none; b=PdxeLLBnWhojQH6o7uUOIGIK+SE+PtkAPlpAS/QBiHsRZGpUmSWhUfXrGvRPUC73sG3yZnwFlHjiQspmKKivVqjpYAgOAolOOKmMcTqTWWzx5G/C4JoGWkrLZ+hpQi+5mgElCHUqbV7+QkdJr3bjCZHN+3XJfsBTBzxcifSPBpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781091; c=relaxed/simple;
	bh=86Mglw3sAgj0wl4SUUHXpfzbY0JBBRM8KnaSg4QllDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iEmOev6B2dHFR/TPOGfhoVjnmnawIwNS+2ZVU5Z2oNcJXNHl/a1KnXy8vC2cWm+0oPV4Lk93z2G+vlbBg271dtjlqHqy+7oOSZ/P49a7JiNvijeUT/JcjecdyCF42s3tbD6fZAktGOkQt6DiBgfa2SM6sJGfIxR4vPnUaFaPNX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyVPm2Va; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyVPm2Va"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf22d29dabso5173315ad.2
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781088; x=1782385888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLWN4LTtmd7hng+ZhZtLQKsiVn6dQ6fE8GmkqrRR6IA=;
        b=HyVPm2Va6TdDHFTVCaafqDgRK/3svkSR9FAanREhszVIxjQ3ev+NjOnXWST44SKJY4
         Fs5PZFbp0pY+VDjMg8unu6CSWEen9gFyBQBbjrIn5yIiqkol+DkTzDUKhyjyHLXMVAUr
         sUkfD7NEYY2v1bIaM1XwjOWuDgim029oFDVu8vki9sZWdtWJak1U8rvkx+einaSo3l6G
         8Ed5TtY12O4pobFEWh8HInYRdckoQMNXqI/M65Q0vvHB1tvEMPmlnEPcfxmtljUQb5pK
         xL5AiG3YLOxEkVIyWP0vTQK42Q3L5XJ8eQjx3P1hkxkLVpaYeGSashpfKj+rYTaxuqU6
         4CVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781088; x=1782385888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cLWN4LTtmd7hng+ZhZtLQKsiVn6dQ6fE8GmkqrRR6IA=;
        b=OxIiD7rQMHDLc7KyOpveaZ0Lw8Br2A62drweMFGHDwhVlpY0L/SLCnpugO9Z018fo/
         0TAN6om8Ppr26+7rjF7FsWJoDQ+Fpre9fQf150BhocFcSChJn88urJAU9F6eTdNjUiRU
         UNBrOgDpLQBgHYZzpvwiuJRksEKZQn7LcM1EOndQTisOlBmivFLGc8N9Iz+i3SLCIYQW
         KtpanuL5mw8F6rjm3uDH+zPUrGMgN2cq7DMnXQSo9Cn1CzKzHJeu+qXOdGsOqvSmOP/+
         ijmS9lUa0k9XZQES3I68vvxsP11duH4HWkui4OZg7EhsZONh50+4XLz3QxWx4Who6+QD
         3Ozw==
X-Forwarded-Encrypted: i=1; AFNElJ88sypmmkCodXlfwW3is9XZREhyqEMn+7B+PlN5g+3B477XnbcdTB+eR/yxgINYR52WljiIyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YySfQAhN+FOqBkNBcxbwWr5bbLld5Cshr/xniaCwYLnHXqKmf0S
	AJt+AkmmybXNLOhLnWeNI98GzKAyk5iG/znaSLrjfxXAQKdBcHndMzKx
X-Gm-Gg: AfdE7clQrRwuICyDmG44hKUYl9942X53rQspvARREUgICVCLAN++aLd/9gXRWc1Ao0K
	1xGBpIfm2qsqPEWfjBHjAFoJdIj1m649sy7eSbjcJ9bCAZdBFwKhKuCh63MX+OKfCGNb33W4R9t
	3yR23yFmj7bWjTL14I05VtdtjUICZNUIsX2PKQ3I9qqFUBb3Ahgq2kgvwuwuoGnKO2NxqXpMH+I
	klj+F8Apgyo50taAGTdgGYAXvqT7Uw+SvFe51SOhIsUqZSV8FdVI3jIZtzFF5a3wrmPAPLTMyJE
	pijyNS0Y0J0PeA8pCioyajCYzQe0c5VoSvkONbDXdEkWxrB/D6dRfvGs0phmNnpvo9EGdhi4aLi
	wvWcmCmuImKC8JN33/yd0IsG9Ydp/XwVHbsNlEpV3IE//YvR2eAFrptCxXqLNtjM7HQIFPpKuXf
	wMHwX/C5g0+IfXA7mX/M+ic7PV6TxtK5Sfk9A+PmQaqg5cE2zrFHfIpAqmxQ==
X-Received: by 2002:a17:903:1a6f:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2c6f340c78cmr24421195ad.1.1781781088169;
        Thu, 18 Jun 2026 04:11:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:27 -0700 (PDT)
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
Subject: [PATCH 75/78] ASoC: codecs: wm8994: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:24 +0700
Message-ID: <20260618110827.232983-19-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8994.c | 51 +++++++++++++++------------------------
 1 file changed, 20 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 1d64c7c42ed1..58f18bb0057e 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -766,7 +766,7 @@ static void active_reference(struct snd_soc_component *component)
 {
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->active_refcount++;
 
@@ -775,8 +775,6 @@ static void active_reference(struct snd_soc_component *component)
 
 	/* If we're using jack detection go into audio mode */
 	wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_AUDIO);
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static void active_dereference(struct snd_soc_component *component)
@@ -784,7 +782,7 @@ static void active_dereference(struct snd_soc_component *component)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	u16 mode;
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->active_refcount--;
 
@@ -800,8 +798,6 @@ static void active_dereference(struct snd_soc_component *component)
 
 		wm1811_jackdet_set_mode(component, mode);
 	}
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static int clk_sys_event(struct snd_soc_dapm_widget *w,
@@ -3704,7 +3700,7 @@ static void wm8958_open_circuit_work(struct work_struct *work)
 						  open_circuit_work.work);
 	struct device *dev = wm8994->wm8994->dev;
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm1811_micd_stop(wm8994->hubs.component);
 
@@ -3718,8 +3714,6 @@ static void wm8958_open_circuit_work(struct work_struct *work)
 	snd_soc_jack_report(wm8994->micdet[0].jack, 0,
 			    wm8994->btn_mask |
 			    SND_JACK_HEADSET);
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static void wm8958_mic_id(void *data, u16 status)
@@ -3785,27 +3779,25 @@ static void wm1811_mic_work(struct work_struct *work)
 		snd_soc_dapm_sync(dapm);
 	}
 
-	mutex_lock(&wm8994->accdet_lock);
-
-	dev_dbg(component->dev, "Starting mic detection\n");
+	scoped_guard(mutex, &wm8994->accdet_lock) {
+		dev_dbg(component->dev, "Starting mic detection\n");
 
-	/* Use a user-supplied callback if we have one */
-	if (wm8994->micd_cb) {
-		wm8994->micd_cb(wm8994->micd_cb_data);
-	} else {
-		/*
-		 * Start off measument of microphone impedence to find out
-		 * what's actually there.
-		 */
-		wm8994->mic_detecting = true;
-		wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_MIC);
+		/* Use a user-supplied callback if we have one */
+		if (wm8994->micd_cb) {
+			wm8994->micd_cb(wm8994->micd_cb_data);
+		} else {
+			/*
+			 * Start off measument of microphone impedence to find out
+			 * what's actually there.
+			 */
+			wm8994->mic_detecting = true;
+			wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_MIC);
 
-		snd_soc_component_update_bits(component, WM8958_MIC_DETECT_1,
-				    WM8958_MICD_ENA, WM8958_MICD_ENA);
+			snd_soc_component_update_bits(component, WM8958_MIC_DETECT_1,
+						      WM8958_MICD_ENA, WM8958_MICD_ENA);
+		}
 	}
 
-	mutex_unlock(&wm8994->accdet_lock);
-
 	pm_runtime_put(component->dev);
 }
 
@@ -4028,11 +4020,8 @@ static void wm8958_mic_work(struct work_struct *work)
 
 	pm_runtime_get_sync(component->dev);
 
-	mutex_lock(&wm8994->accdet_lock);
-
-	wm8994->mic_id_cb(wm8994->mic_id_cb_data, wm8994->mic_status);
-
-	mutex_unlock(&wm8994->accdet_lock);
+	scoped_guard(mutex, &wm8994->accdet_lock)
+		wm8994->mic_id_cb(wm8994->mic_id_cb_data, wm8994->mic_status);
 
 	pm_runtime_put(component->dev);
 }
-- 
2.43.0

