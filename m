Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2699937F73E
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401053; cv=none; b=kWRuhrmyBEiGuK4ZRCxK6j8rTqbacyFRkLJK/0PKle5+YrHsX7/TZwfnKD4a4Kl3GicSE6mRXHdrGwEd5rUy8gyRrtQ5L6AaH0p6AHaST7DmzTy8mvRsko+ZljYknR+7ueItML6xbWYqzCAj8MGsGfCLFbqX374LKn4nEFySeUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401053; c=relaxed/simple;
	bh=09+uHExlisne1jIooukG5gRoEn/YSMdFeZBQ6FKI5q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R1W4YhZe0lVqp7269qdXPX7BPblXXfAtlxSw3V2soqeAmdbd+UJhTApHWy1YdiOnpYNwodGoZ0XmGJxtdV08EDk+22DzFHBil04ZJn03Sz6YXmI8yD0WUCSkulL/qN7skgVuo8HZODGh3tg49Xwz8L7cTYsxVXUbn4YBULDZtAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuPKvVu7; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuPKvVu7"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-847921eed4aso5133957b3a.3
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401050; x=1784005850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hagTq/6ZaI2+r9Hot5OPuLrYC79qm3HVss9ILqnQ1PI=;
        b=BuPKvVu74BLKpwd5l1DekCLvmqDfpoJROcjg3iPnv4F8k7I9oCrgWk/CqMBfHJAMtP
         8TFgdo9wCaC9ZIMqBfO6HO5/wTlF9kztAnGJeCF4zRReiXiAhRJbKZJ897D9wmIcoijG
         K+QKv0H7jwxUHqa5Ks/gn1eBOOBdF7y50ersQe0Q9+F4AbH8n+lAFy/uRuyf/+f4G+7E
         jf/j6fXgvBphmV4O/lJRfLx9ATNPuDmwOj23O4Z4IQh+Hrf4+t8Sivb4MKkFzlDCvTa/
         MvwIV9EefyCqvupLL8brrrBUQkwyEhnqQ24zPqrbmHR+9B0MNbINGl4Q2jq0u8LjGxSS
         1MhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401050; x=1784005850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hagTq/6ZaI2+r9Hot5OPuLrYC79qm3HVss9ILqnQ1PI=;
        b=kLBvLfhwRhNwqCRUHOlvbkV6x+xfKWDjSYR9f37cIu98K32In6H5PRfKnrH/Fcu13g
         KjfTwfTQK2bEr/pGXrHFge6GxpbSCTWT3F1/eTZBu9FomPgT0B0zc7Jqc44MJhzPXCoh
         Nrx7L41cf4DZ99wxT4fMogdpVLd+ZoyicUHsNFHpBYT43XDhktiGM232u+HSfNX1kThD
         EHFRrZ0SEPL5Zwz4QNsOSbfsgy4mvoCtc0fYCeXpvcZW1Gozt5SVbomrfZTJUiKWkQO2
         R21fznfj32UfCyRBVVzAc17LMBCA+VNw6MAqra7yRFUas2LDHzp+NWL1mWU+UWbGewLZ
         1h7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrhevYBP1pPziDrYaRdp1WEsRJFHS+/w1M6pifw/mKrw03uw/09L9wAo9WWijDHaDe3N6LWmg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7HXB3UXOD0AJ//jpQSHQlyCt6t+b3U5sAMrliV8KdBEpJ23QO
	JMSDI+IRGCDteoz6aZ4iIoYqq7Fesp3Xoklq78EVJO0eTRXRSB0BJzr4
X-Gm-Gg: AfdE7cnhukhQT/Goh6GCn2FmYAY7MgiY/HeF9QrBmtD+U5XcPETR+NpxQ8ELLbtDJir
	QEQ+7RI68i51D0cGdjnIY2uSB6NgH6pE/fhU/Ljwr5BZAWZdTwl0OClcLJ6qiVzpzXmx8Jj1GBO
	Ly1/9rZ9EVbaw10OXTi7OP6oxcGDzas8O4hcKo3soumSqovwYIIOYldk5l42FxAN3e+OW+PeDGf
	Il8NcEq1gVW+Vw828LhfaGXyDvQnsuOSmrr5Lus1t6QHuFo6vvsdAxHPW5vW6BXQiWoMLRe/aZD
	iBIO04iSUfZPDt7Bv0SisrWQG8wQGC7S1x4XnQPAniTrfe0WYwK50J8AdavcJkT7FanrREdha5M
	Q5s/EKjD0g5vt9Ontt32PAwkNN2SMzKXqJwRrG9HxOQV4gqvMTR6OQiRnJyy6YNtlfRi+bkY4ZD
	j5WpOeA5YHP9yonPzdifaxDjaDX4Sg/lWfM3rHnC57MGX2UPY=
X-Received: by 2002:a05:6a00:2e87:b0:845:4928:8645 with SMTP id d2e1a72fcca58-84826c1ebfamr3415918b3a.7.1783401050517;
        Mon, 06 Jul 2026 22:10:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:10:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 02/24] ASoC: codecs: ak4613: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:44 +0700
Message-ID: <20260707051006.20058-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/ak4613.c | 83 +++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 43 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 3e0696b5abf5..be5306d07d40 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -95,6 +95,7 @@
  * see
  *	AK4613_ENABLE_TDM_TEST
  */
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -384,7 +385,7 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 	struct device *dev = component->dev;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	priv->cnt--;
 	if (priv->cnt < 0) {
 		dev_err(dev, "unexpected counter error\n");
@@ -392,7 +393,6 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 	}
 	if (!priv->cnt)
 		priv->ctrl1 = 0;
-	mutex_unlock(&priv->lock);
 }
 
 static void ak4613_hw_constraints(struct ak4613_priv *priv,
@@ -507,10 +507,9 @@ static int ak4613_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	ak4613_hw_constraints(priv, substream);
 	priv->cnt++;
-	mutex_unlock(&priv->lock);
 
 	return 0;
 }
@@ -599,45 +598,47 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 	 */
 	ret = -EINVAL;
 
-	mutex_lock(&priv->lock);
-	if (priv->cnt > 1) {
-		/*
-		 * If it was already working, use current priv->ctrl1
-		 */
-		ret = 0;
-	} else {
-		/*
-		 * It is not yet working,
-		 */
-		unsigned int channel = params_channels(params);
-		u8 tdm;
-
-		/* STEREO or TDM */
-		if (channel == 2)
-			tdm = AK4613_CONFIG_MODE_STEREO;
-		else
-			tdm = AK4613_CONFIG_GET(priv, MODE);
-
-		for (i = ARRAY_SIZE(ak4613_iface) - 1; i >= 0; i--) {
-			const struct ak4613_interface *iface = ak4613_iface + i;
-
-			if ((iface->fmt == fmt) && (iface->width == width)) {
-				/*
-				 * Ctrl1
-				 * | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0  |
-				 * |TDM1|TDM0|DIF2|DIF1|DIF0|ATS1|ATS0|SMUTE|
-				 *  <  tdm  > < iface->dif >
-				 */
-				priv->ctrl1 = (tdm << 6) | (iface->dif << 3);
-				ret = 0;
-				break;
+	scoped_guard(mutex, &priv->lock) {
+		if (priv->cnt > 1) {
+			/*
+			 * If it was already working, use current priv->ctrl1
+			 */
+			ret = 0;
+		} else {
+			/*
+			 * It is not yet working,
+			 */
+			unsigned int channel = params_channels(params);
+			u8 tdm;
+
+			/* STEREO or TDM */
+			if (channel == 2)
+				tdm = AK4613_CONFIG_MODE_STEREO;
+			else
+				tdm = AK4613_CONFIG_GET(priv, MODE);
+
+			for (i = ARRAY_SIZE(ak4613_iface) - 1; i >= 0; i--) {
+				const struct ak4613_interface *iface = ak4613_iface + i;
+
+				if (iface->fmt == fmt && iface->width == width) {
+					/*
+					 * Ctrl1
+					 * | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0  |
+					 * |TDM1|TDM0|DIF2|DIF1|DIF0|ATS1|ATS0|SMUTE|
+					 *  <  tdm  > < iface->dif >
+					 */
+					priv->ctrl1 = (tdm << 6) | (iface->dif << 3);
+					ret = 0;
+					break;
+				}
 			}
 		}
 	}
-	mutex_unlock(&priv->lock);
 
-	if (ret < 0)
-		goto hw_params_end;
+	if (ret < 0) {
+		dev_warn(dev, "unsupported data width/format combination\n");
+		return ret;
+	}
 
 	snd_soc_component_update_bits(component, CTRL1, FMT_MASK, priv->ctrl1);
 	snd_soc_component_update_bits(component, CTRL2, DFS_MASK, ctrl2);
@@ -645,10 +646,6 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 	snd_soc_component_update_bits(component, ICTRL, ICTRL_MASK, priv->ic);
 	snd_soc_component_update_bits(component, OCTRL, OCTRL_MASK, priv->oc);
 
-hw_params_end:
-	if (ret < 0)
-		dev_warn(dev, "unsupported data width/format combination\n");
-
 	return ret;
 }
 
-- 
2.43.0

