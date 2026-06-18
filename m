Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18ED3EE1DB
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780996; cv=none; b=l95VftRuYkru+CzsQleW5fA0pVOj8m2as8BgO6XPBdBwTo9FGnTeF8SbCpJyL/6ZroOAQXeYlIxQmJTRjVG2n+SBiawWbn1bS5xvOhUEXemOQgCEib2PdcVlVHbmst/8kuaLMG7G2ifM7PpHnPqwC21/Pq2c1fI0BilDVr3RxkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780996; c=relaxed/simple;
	bh=c5O372q2rjDQ5irwM8M2Qw2a9PpNWbTIU2zvtjVkg3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOyvPtjnOxOGfW0IrIDqrTfAKyFXh5wsMYepSLJl5CNp0NcrjGqhc3fyEr9lFkVl9n/cOIAfnSv0WseqQsWmOMakESSW0muRYqoxKMXbAWYbKqPGQ+mCw+L6OfhdyK8RvwMHpUI85CXXAVnG4W0RZ/iX03LS7XvsRhFHH7HEE6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7SL/4mM; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7SL/4mM"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso5832305ad.0
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780994; x=1782385794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr2TzHHPLOZ5QRNblYXdE64EZ52E5yqz/2kOl9/QETA=;
        b=I7SL/4mMk5ErUO4uuwFiHpurdxLf/sUTyr//lh8J6bIE+YcKsPr3670GqgXO7bwtpd
         +1qTBNu3HiUY7uj3UNOD4lvKjqxaZdIwVT9Gw8gV41W542zNnVYdAJQixUCyYk8VFZIB
         9tudi1VQU/VjUnORq8z60eOsb3nDBP0b8+Ix0Z4RymgIqMdv2A0R6uji85QXFix1DsRS
         FVdF1F4eMkbF6E4Hxk3pa8LtvfW5+/DttpwNAPgUGHi/Pc4td1UXqarhFpqcq2vqPa4/
         uBJifvgemZagjMRPubAer55hsdgvQJwo/CmEUWX5TLm79tzuij4wPgcgvpMybOfoGvus
         0/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780994; x=1782385794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mr2TzHHPLOZ5QRNblYXdE64EZ52E5yqz/2kOl9/QETA=;
        b=APlL2esTQ0JFwBkxaTyfD3CiI5ZPEd8bbxekLus2xsKP2i1uJ4Wwa8Js+QNz41gw+K
         JsPuFc3rPXldJlvhkADMYMynNuWHVnJ9ZhQAF0AXDNC7Atazm5NRH2A2tNjW7uVY+ctQ
         +S+bX1f24ivv+At46DkUKvYzcpE3K/MpueU0yCXoB8+NGFXsg9UNtQGPrFTDyPLPj5ym
         i/YxLnJainTikTuRpn5gm4UqtMAKO1d54y0wYvEiybHnLxshQ2F8RFxro3RmuyzWwLmt
         ohDkLwgtOkN0I9u9Nup/+F27y1TxlLrXJ0Y35iy9xDOQQIlIkfQedhWdvC728y5+9r8t
         tTFA==
X-Forwarded-Encrypted: i=1; AFNElJ+5c4gdXxa6iMUAJHzGpGy6jMcMBCDZ8Evsj24ZpwFaAp1QSO5GBRg5PEdJtqa37uqRQmRHxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTDjAAfpe3DIe/Nszdc0Pe/W7VG1XSjzwsgDP8iLNQ+QUGzogN
	WbygYs3gZl43lmPAQi5QsJeZ9GxYAK/ff6eLwN8v9Ocy08Kczwt/T7C1
X-Gm-Gg: AfdE7cmOtnncRlt0LKDlmMIZM/Up6Pdvvtj3sjIvlH6FGXqjPYlv9eBzoCZ2qJelU9u
	4j/OfnR9NnTJizTxDZhxUi5YSreOLIEjRv7W77GuwBYBAvKZD6Wxo8Xtq1YNvw9ukpRjXZJx2El
	zQ5J/gPS0QCHPHr15YR+TxQtdORXrxa5c/G4OjQRgZSLFC98YtCOddH6ONY1yTYuiT0InTvU0dU
	LZz0C/0JMk3iWFY3Vx8jX/m/YLASShjOVUaxREc+G4Y0XuEKhu2z8opXw8yR0IzHIyNgACwqocK
	ZbeICcsnD5pRNijAxEA7Si4Rg7DKbIle2eQZ/kXMZYyk7cngb5rpIvsL5BmXPkDHE+GXXbhsBrG
	oHGbQAxMf2vTh/TkYykHhypz7AKFBKpV+LB4noGzAJghTcE7+Knw7UTKbR6T7SSa6ZP/QD6XBPD
	L+k6ZIjITJLEZQRg6dUC1sOtAFE9WgC5BRgdLsvgQtOY22nZE=
X-Received: by 2002:a17:903:1b6f:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c6bc25ca62mr81275545ad.30.1781780994455;
        Thu, 18 Jun 2026 04:09:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:54 -0700 (PDT)
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
Subject: [PATCH 64/78] ASoC: codecs: wcd934x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:13 +0700
Message-ID: <20260618110827.232983-8-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd934x.c | 46 ++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index bc41a1466c70..817ad53595fc 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1265,13 +1265,12 @@ static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd, int sido_src)
 
 static int wcd934x_enable_ana_bias_and_sysclk(struct wcd934x_codec *wcd)
 {
-	mutex_lock(&wcd->sysclk_mutex);
-
-	if (++wcd->sysclk_users != 1) {
-		mutex_unlock(&wcd->sysclk_mutex);
-		return 0;
+	scoped_guard(mutex, &wcd->sysclk_mutex) {
+		if (++wcd->sysclk_users != 1) {
+			mutex_unlock(&wcd->sysclk_mutex);
+			return 0;
+		}
 	}
-	mutex_unlock(&wcd->sysclk_mutex);
 
 	regmap_update_bits(wcd->regmap, WCD934X_ANA_BIAS,
 			   WCD934X_ANA_BIAS_EN_MASK,
@@ -1328,12 +1327,12 @@ static int wcd934x_enable_ana_bias_and_sysclk(struct wcd934x_codec *wcd)
 
 static int wcd934x_disable_ana_bias_and_syclk(struct wcd934x_codec *wcd)
 {
-	mutex_lock(&wcd->sysclk_mutex);
-	if (--wcd->sysclk_users != 0) {
-		mutex_unlock(&wcd->sysclk_mutex);
-		return 0;
+	scoped_guard(mutex, &wcd->sysclk_mutex) {
+		if (--wcd->sysclk_users != 0) {
+			mutex_unlock(&wcd->sysclk_mutex);
+			return 0;
+		}
 	}
-	mutex_unlock(&wcd->sysclk_mutex);
 
 	regmap_update_bits(wcd->regmap, WCD934X_CLK_SYS_MCLK_PRG,
 			   WCD934X_EXT_CLK_BUF_EN_MASK |
@@ -2384,7 +2383,7 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 			__func__, micb_num);
 		return -EINVAL;
 	}
-	mutex_lock(&wcd934x->micb_lock);
+	guard(mutex)(&wcd934x->micb_lock);
 
 	switch (req) {
 	case MICB_PULLUP_ENABLE:
@@ -2446,8 +2445,6 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 		break;
 	}
 
-	mutex_unlock(&wcd934x->micb_lock);
-
 	return 0;
 }
 
@@ -2488,7 +2485,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd934x_codec *wcd934x = snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -2506,7 +2503,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd934x->micb_lock);
+	guard(mutex)(&wcd934x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2521,15 +2518,11 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD934X_MICB_VAL_MASK);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = -EINVAL;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return -EINVAL;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	if (micb_en == WCD934X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -2550,9 +2543,8 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd934x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd934x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

