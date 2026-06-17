Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4833347886A
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692645; cv=none; b=St9YVCNe8gNl9G3Aqr424cqq7ZPshBDy2+o9gIWipshkoQX0NaLUAug2O5vUnKf/rWPVWIhu4UPFO+Ld0DxPQZoFwfHMKq2/VEuyNXya0Q45IuR3zFf4FFQkcoBk/3qOAvOqmu8b8CgJQ5WkFZzCE4rKd4IKHvZsu7IrWPzTMkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692645; c=relaxed/simple;
	bh=bV0wrsnUSNArsr1QxrKoX10viZPs2daxbLWhpuMFSns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oHeVMAHnQmSFtukNkVHA/yxS/ew7iOCCst4O9WmESJnU4mFrXmv5Jd3OFL3Yhz+if1IXtk1S0hGVLA/SFVmCN2OiZLJsxJR6WcC/Iu7A5ktVkGWw08MArbPTZ7R396LrmxSoBfKKBEwywBW9wUIgx9VBfrSd3X5y6QjRiI7l+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cltgfvsh; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cltgfvsh"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so2337198eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692637; x=1782297437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RS60dBgVHLJM7xKUP9F+W887F9cI3ycWsKsxpAyWFqA=;
        b=Cltgfvshj5Dwgu0Db+25FGxYVL3cct10GArwpEOk/g2WSbNa3vhHhzme9uFRoZ2DX1
         +0IeoaVRVxbzzzh8I9wJw91WZx/TJftmBcG30XmLOcs21oKXCCFJKWizHVFsi5J3uKIf
         GbnJVHHpII0nWm4GEzZb6q5XfRwppkd34px2RKzTlI1LBxfoMokni0Dzg+AgUz8KOB7m
         nx7kizl7YIYTqflGyVUnly4/wlpsDjIobFZT3A7VHCwvQ//JXo+E90iATuH0CzJMjsvF
         gQVY7jqGLNe/WBacSb5FaHypPXEyaEW4/1Njv4n9UUbHGW5kRmFZUX1Ka0x3k4Jx1kWu
         5q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692637; x=1782297437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RS60dBgVHLJM7xKUP9F+W887F9cI3ycWsKsxpAyWFqA=;
        b=Ru9ugzqdk3CiCRwlVKhreH55nRNoBgVKSuzGFCZqPSMDauUShaoJdTaiKwNGHMfZ6S
         0Dg8FjX9fk4dKW4RI+KYX+cHT+NP7LXEvUvXAfWuM9P9pn1zGxA1+muyaj95aV0YRWdj
         v9aRooh3siEJximu7IfGtbOXNT/2p9iWGq5RJ63KOhaQy5o8Hu8Y+rDsNwDX8xRZMxZP
         D7jeLW07j2Mf6QowwDAaWDRY4bGAWKnuSbTseYmFJkn2jyyNRFASTGtEzy0TLnmk7IXW
         GdkF5uYP2vLmRyzXcZ7RDw6nDElrS3SXQwcT+zMAPmc1lQ/9kFGXVbBPlvuCqE6NO6P9
         6Uug==
X-Forwarded-Encrypted: i=1; AFNElJ+ABTKSbEREDY0CRgjOQ5xAeMTqupzyKr1pvn9NccCsH/ha7rcY+wz+QK2dcc9bzk2qQ68k9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmlGiOzkPn6xbXYG45l9rnYDF8gRpcvrv156t1rdZ6i3srV38r
	/3/O3mvUOS0zW6U+y5GP+BVsP3GFMLHxfvev+tG4vAOKTFc/SLGtNEAB
X-Gm-Gg: AfdE7cnuGQuui5Rp5N2uxVHQTQ/gHp5g88HqXhHgEBG76sYbJoUX3eLQNQCZ8vYOz1t
	nGsTSSydJQwFV9IAMvgfg5WFsI3w4kttReyWqIgZN0Ixc4yqx7siBqTxe5qm/O/Wf1NLT6crjxY
	khF1aPavb05YraVWI2/ncvdRjlDkxBuvIrYpdBZlnkOxXWzN/4b0MmL16aXvOPqKhntHAUozcyQ
	8yWc/hlAs/yIuiM38M7P7v63OGvSh3AyZJ6iPMaFMNASqdUkkHpWjdUR2uTY4XCuyxmUwjTlrk1
	1zovo9hdJeDqdMr4XDjY8+bL7JsMqf7i5Kk6QAujIHABDy7+aKApmTCcRXgkV/IaiwqfjMkPRL1
	jtVU/fz7TkuCPIKuKB4hpP/tfmrJGmQcdN3R4IlB5nWCRJu+Mkw81mDpr3VfiTbX7m++Ky1yGqM
	mPTb/vUivT1Z0TGRtE6C1blrin30i0tR7Wf+23rJ9ljztC0nk=
X-Received: by 2002:a05:7300:7481:b0:30b:bf5c:c878 with SMTP id 5a478bee46e88-30bca067e13mr1803295eec.25.1781692637212;
        Wed, 17 Jun 2026 03:37:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:16 -0700 (PDT)
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
Subject: [PATCH 28/78] ASoC: codecs: es8326: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:45 +0700
Message-ID: <20260617103235.449609-29-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es8326.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index a79b2da35099..4aaae6eab7f2 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -790,7 +790,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 	if (!(es8326->jack->status & SND_JACK_HEADSET)) /* Jack unplugged */
 		return;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	switch (iface) {
 	case 0x93:
@@ -845,7 +845,6 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		}
 		es8326_disable_micbias(es8326->component);
 	}
-	mutex_unlock(&es8326->lock);
 }
 
 static void es8326_jack_detect_handler(struct work_struct *work)
@@ -855,7 +854,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	struct snd_soc_component *comp = es8326->component;
 	unsigned int iface;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	dev_dbg(comp->dev, "gpio flag %#04x", iface);
 
@@ -873,7 +872,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 		regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE,
 					ES8326_HP_DET_JACK_POL, (es8326->jd_inverted ?
 					~es8326->jack_pol : es8326->jack_pol));
-		goto exit;
+		return;
 	}
 
 	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
@@ -930,7 +929,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			queue_delayed_work(system_dfl_wq, &es8326->jack_detect_work,
 					msecs_to_jiffies(400));
 			es8326->hp = 1;
-			goto exit;
+			return;
 		}
 		if (es8326->jack->status & SND_JACK_HEADSET) {
 			/* detect button */
@@ -939,7 +938,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			es8326_enable_micbias(es8326->component);
 			queue_delayed_work(system_dfl_wq, &es8326->button_press_work, 10);
-			goto exit;
+			return;
 		}
 		if ((iface & ES8326_HPBUTTON_FLAG) == 0x01) {
 			dev_dbg(comp->dev, "Headphone detected\n");
@@ -958,8 +957,6 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			usleep_range(10000, 15000);
 		}
 	}
-exit:
-	mutex_unlock(&es8326->lock);
 }
 
 static irqreturn_t es8326_irq(int irq, void *dev_id)
@@ -1200,13 +1197,12 @@ static void es8326_enable_jack_detect(struct snd_soc_component *component,
 {
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&es8326->lock);
-	if (es8326->jd_inverted)
-		snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
-					      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
-	es8326->jack = jack;
-
-	mutex_unlock(&es8326->lock);
+	scoped_guard(mutex, &es8326->lock) {
+		if (es8326->jd_inverted)
+			snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
+						      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
+		es8326->jack = jack;
+	}
 	es8326_irq(es8326->irq, es8326);
 }
 
@@ -1219,13 +1215,12 @@ static void es8326_disable_jack_detect(struct snd_soc_component *component)
 		return; /* Already disabled (or never enabled) */
 	cancel_delayed_work_sync(&es8326->jack_detect_work);
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	if (es8326->jack->status & SND_JACK_MICROPHONE) {
 		es8326_disable_micbias(component);
 		snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
 	}
 	es8326->jack = NULL;
-	mutex_unlock(&es8326->lock);
 }
 
 static int es8326_set_jack(struct snd_soc_component *component,
-- 
2.43.0

