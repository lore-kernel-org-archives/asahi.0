Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC1948C8DF
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692800; cv=none; b=pO8rrio0P6EuGg4xEudYo2/jZOcN/kBBPVVzTotiWvn4Mun/WofQjPXWXZzYTyly++u3I3/Rncw2Q7HCb3e0OCYiOOf/xeT+Tr+PI38g3qU+CF9V8/bwp6HxC+SLGG139A7YPkFphtzS3vXTHPP6fQgQ38FQs/IetCuLLG5uV2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692800; c=relaxed/simple;
	bh=CfPSrFVheY2+VrZHiVHqixZx/q7uaP11RkObiCVMyqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHQTB67YZBEdlZ+hpxbi+C7UMnGydB767Hw6rSBQdxTLJYDyAx8QGvUHKqcgbLovUmGv9Hjp77JbmVMMfW2I+IYFrawNNAEIFPwyvsaCFSmAt8n5hGtJ5iVJhK+hu44el46TZsrqvniYP6QS/jLE7soZOzhQqj2MLNZhl2jYMJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWwSGbWk; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWwSGbWk"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304d8362a58so603923eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692796; x=1782297596; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9NimHoJxrkt0fKeQ5nDtc/hHZTnOxU7Jn5N5pQIslE=;
        b=HWwSGbWkGM05qy2QVGsK0P0u1Ptd3gfJpK/7aE72HL625tfoV9vdCcU2KCnfjTOVcb
         QRpN38ze55foaTG5zKtwUOfaIstEL/MxO5wP4QuZCGUcDAT2AE5cvkkBMWsLeiCLYiyP
         CXPwqvRuj/TV+R+X24zT1bIyavncZADf60vdRXw0uG4M0QhvTpRJ3WRCmYDZxWqW49gG
         Qj8sZE2ZooYnV2vvcXxMAc6LPCbozQ98xQWcnyNpCAAIsnHVp1WxucqfnqumFjY3tiYH
         9eXUemfawVpJE6ox5dw461nn9Q4PpNOKG/dMCP+sHZP2vIffUgjzklsIZaJNQu0wAVNh
         nzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692796; x=1782297596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9NimHoJxrkt0fKeQ5nDtc/hHZTnOxU7Jn5N5pQIslE=;
        b=fSf7j9hIfvs9q6fVq1eilWkXQVCw6L1WFZz74aA27BbR8h4WtuywQeiOPtCgHQYvQW
         McnXxqQ4eo/Gr5nmJSuz8N/UVBM8hArEtGf+3zvgVDn6YTmL0oZnwR3SIHrvqQdz4shc
         f2jpbLoyWbTUGFvMy+QXL+q6EbhS2/PtapLYpR9pJWKC6+USf3kJWGZ63m2EgslmR2UK
         mISvkH10EHxWPTR7qJEUj/mMiy1iyAc44UwDHSFoYUcJinegV3nncQ3B7zRoeO+GTyPV
         ox3UCJXXfqRUhm943kgGtow4zmt69ulUTpkFVzETBhao7GIlhlM0YzHofO0KqrwXP6HG
         O+Pg==
X-Forwarded-Encrypted: i=1; AFNElJ8kN2Qy7ZlGElcetf8mkmQ/mTkkoJEsoyLHeUPWgQ5pd0Ht/pfFcQgFTEWTWFASCMz/YXIU8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzP/8lCAC1ottv50SGcXEFUbjZuzaHhoKGiKFflB5wHsXQcB32R
	5ujJy61F1LZrNCvIIDlyKcwQA7NE6jAPk2rjDxTnL2sO6OIUD0vaCsiR
X-Gm-Gg: AfdE7ck+Db7Wv7udAHGN22Hta1P9grL7ix8whYPztMwurkR9QSEgoq5tv/Cu8Tf3gvD
	/XmMkFsC3R2Danji9A01rO+4vLAa9wARFo5k+iRemTU5LrDPEEP1Pk0YVKB8J+Bp2pYQyezeQ/T
	3c0If0LIdafxHmXAySpwAjJyF4gyAFZLaecNqHQmnjAMdDZ2AjAW8oVeAuqnbxa8zpWbkC6qEeG
	kcWZTDV5zX2l6qbhsZ2fETHOXYqOhTZvM/Jq6DNgU6ENyntdZBTAf9zCfkBjFxghygg8SshsU8v
	l6193jwCs36Afq7X9Vek4GvGlUQ0NmdrRvUGa78bHQUgXDauf0bOChh4PdmF4WF4ctFYeeRUEwp
	CaMB/OaaRvBJ4b9pGmQAVyNJ4BtMgX/mwktCQSxmmNcS5zHFazENbOZGwk8kb82QgQE4fHU/Zhf
	maifwayrCpTD6nKahcm73rCintjKWkd887K5ALcCIJusAt3LQR4wghjnn0GA==
X-Received: by 2002:a05:7300:3aa8:b0:30b:df3b:fe94 with SMTP id 5a478bee46e88-30bdf3c0705mr266574eec.3.1781692796467;
        Wed, 17 Jun 2026 03:39:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:56 -0700 (PDT)
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
Subject: [PATCH 44/78] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:01 +0700
Message-ID: <20260617103235.449609-45-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5668.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index fed6de40b8c8..1eba4d559c0f 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -986,7 +986,7 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5668->component, RT5668_AJD1_CTRL)
 		& RT5668_JDH_RS_MASK;
@@ -1053,8 +1053,6 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5668->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5668->jd_check_work);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
 }
 
 static const struct snd_kcontrol_new rt5668_snd_controls[] = {
@@ -2356,7 +2354,7 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 {
 	int value, count;
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	rt5668_reset(rt5668->regmap);
 	regmap_write(rt5668->regmap, RT5668_PWR_ANLG_1, 0xa2bf);
@@ -2400,9 +2398,6 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 	/* restore settings */
 	regmap_write(rt5668->regmap, RT5668_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5668->regmap, RT5668_PWR_DIG_1, 0x0000);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
-
 }
 
 static int rt5668_i2c_probe(struct i2c_client *i2c)
-- 
2.43.0

