Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F813D3D10
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454556; cv=none; b=o+P09ZFglu7VbGEajzZ6rZIu32z+SvrChg1pS398ybScaebeLfyPHXd5Vc5dEmgfZzCFGj/GNtHPkCUpRyQpVRWb02aobU6geadlbSncS3K96egqeRd+ELdz/Sb3wzgZ9ojlNOlPLZZd502QrYMfN4EM5CJpVW7XY0uMLyBjcoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454556; c=relaxed/simple;
	bh=em96/ZARght/3otyju63pfWEB2uPboKH1/9p2lcucSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1Lh6aRcbLLron2VWVC/lA4hwY9iRJRObNlfPLyo0wSXFWAbbGO3ivn7FoV+/Cqcy0Plb+l7s71tJANEiUOhOEssRIXk+LZ3PQEmW2Vme9wlCXD03X7b33BoKJjun5VWPJ5oZi1g5yOitCk26AQjBZAPzwZtNvG8+Iu+xKrRVb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tNimfZOS; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNimfZOS"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37cbcf49deaso333624a91.1
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454555; x=1783059355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpJFy3k7fzvXeipnHRzRqJbquUwprfOCJ0cYmFTrF80=;
        b=tNimfZOSAqlve1SCuYiFAFE8sYC+4ituE84fF3d30jL1i2SAY7LJGrLKCyBAB0CXTt
         WoSxi0kLZQ3UiHSK9Wju0sbqKfpJ+UgoYR9/IVn7a9+KwAaCV+Q7KYzbQ7DslWWMQX1K
         gAfHVC03bleg2x4WL6zW6cv0KraeGZS3WB+z92Y/6GPVObj1OR0s65SRpxtGRVvykdic
         4LrAqzvpAQrM8AmchEfao6pIqZ02hsDHv63muIgsBR4dYK4cDhCoLclGett5hS4Uafds
         uiCJHKujumAzqP3MfGV3AedHscrjhfheBauKqPEoUGEtpScemjyScUiHL39W1OzLWjoI
         4bGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454555; x=1783059355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VpJFy3k7fzvXeipnHRzRqJbquUwprfOCJ0cYmFTrF80=;
        b=gj0ACVzxStqnVhkhSJ0b3bzt84n15dxzm9sUSgiYmAI0csV/NVums/4jXr+5tuuGbV
         2SIJSmi3hzTwNKPlLYrqD4CQ3bWMLd5xndUlb9W/ad/XOvCc4VmWdAqeMJrPSPgWv1OV
         lHFQyiguteDgVWBPCf2Ua1go9wrVLs1oQTqiEBsVY82WmFKGbUf1zzI4JU4IdzmRZr6C
         7bJaGvPHaFy2rrBlMbfM/YakJN0OlpmB4+MqPgmcTftwh2IOY142jtA6zz/wVKVuH/31
         a/7j1BYWQZbmTIkYvNLPMreY7WpK4yUKpnjVIxrmJUgnqylbRpmWeKGWjaxG33UxpZAi
         Cy9g==
X-Forwarded-Encrypted: i=1; AHgh+RpoSqcj2fk5t8afTL/BFXrbtHHVhuzXnOiaw2f14oB3CtNGko+OjpgwXqY8t+vzJH3U1Nh7Bg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMjXqSFpFub5S75VYxkyTG75nl3s4MCyooBIRdGcwMHaHFzKGU
	339dg+Kz/0l8niy/tiYcF1H5sLWzXXrzZnyvHhxeJbbcKdyYqzajZhze
X-Gm-Gg: AfdE7clNuyHElasS7KWv4h2tftmfiXRwYzGMXck4G/CwJqeFI22mecXRiiY2AVpwIu4
	wPb9yTCEgwvkkyU34R/3TgCynVW9G5JCK2ksoPinlE12UaPICMa7v83DuRT11vugrq+wF8GGoZf
	eCyVrHXiHvg5loy/HWgE8riiCZiHMPy5Oi2Ug1w7XICxAeF5wQ23VpPdG7QRznkYQugX1+U+HMo
	rY9yUp3JwzGEFClU37sxW7ealLLuV43fZa/LK4yK65pTkQDoKJw35TWg1N5ncQpyZd1Bhh+Fh4r
	yZiIwZBQtOufRiUU5s6a/m8oQKTRIs9H4nZAgPW7AoOWFsyksFOqyE2AguVRrsWD9vPSnZwPDIv
	3kxyUczRPK8uSZGh9A/t8v5GCEWSczQQnkr6Uzz9HgNTqEb/5YBQYzVW5oqH+DrCSmNPXzaC63q
	b4GTg9N9U/LdMFnnND0HWxWKnnW9wN04oTO6s+l9jI9iAaMg0=
X-Received: by 2002:a17:90b:180b:b0:36d:ee3b:fcae with SMTP id 98e67ed59e1d1-37dfa1b664cmr5210147a91.6.1782454554875;
        Thu, 25 Jun 2026 23:15:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:54 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 17/24] ASoC: codecs: cs43130: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:22 +0700
Message-ID: <20260626061329.23264-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs43130.c | 72 +++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index e7b06f962790..48d88dad4ceb 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -6,6 +6,7 @@
  *
  * Authors: Li Xu <li.xu@cirrus.com>
  */
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -818,26 +819,26 @@ static int cs43130_dsd_hw_params(struct snd_pcm_substream *substream,
 	unsigned int required_clk;
 	u8 dsd_speed;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* no DAI is currently using clk */
-		if (!(CS43130_MCLK_22M % params_rate(params)))
-			required_clk = CS43130_MCLK_22M;
-		else
-			required_clk = CS43130_MCLK_24M;
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* no DAI is currently using clk */
+			if (!(CS43130_MCLK_22M % params_rate(params)))
+				required_clk = CS43130_MCLK_22M;
+			else
+				required_clk = CS43130_MCLK_24M;
+
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		cs43130->clk_req++;
+		if (cs43130->clk_req == 2)
+			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
 
-	cs43130->clk_req++;
-	if (cs43130->clk_req == 2)
-		cs43130_pcm_dsd_mix(true, cs43130->regmap);
-	mutex_unlock(&cs43130->clk_mutex);
-
 	switch (params_rate(params)) {
 	case 176400:
 		dsd_speed = 0;
@@ -881,26 +882,26 @@ static int cs43130_hw_params(struct snd_pcm_substream *substream,
 	unsigned int required_clk;
 	u8 dsd_speed;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* no DAI is currently using clk */
-		if (!(CS43130_MCLK_22M % params_rate(params)))
-			required_clk = CS43130_MCLK_22M;
-		else
-			required_clk = CS43130_MCLK_24M;
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* no DAI is currently using clk */
+			if (!(CS43130_MCLK_22M % params_rate(params)))
+				required_clk = CS43130_MCLK_22M;
+			else
+				required_clk = CS43130_MCLK_24M;
+
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		cs43130->clk_req++;
+		if (cs43130->clk_req == 2)
+			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
 
-	cs43130->clk_req++;
-	if (cs43130->clk_req == 2)
-		cs43130_pcm_dsd_mix(true, cs43130->regmap);
-	mutex_unlock(&cs43130->clk_mutex);
-
 	switch (dai->id) {
 	case CS43130_ASP_DOP_DAI:
 	case CS43130_XSP_DOP_DAI:
@@ -988,14 +989,13 @@ static int cs43130_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&cs43130->clk_mutex);
+	guard(mutex)(&cs43130->clk_mutex);
 	cs43130->clk_req--;
 	if (!cs43130->clk_req) {
 		/* no DAI is currently using clk */
 		cs43130_change_clksrc(component, CS43130_MCLK_SRC_RCO);
 		cs43130_pcm_dsd_mix(false, cs43130->regmap);
 	}
-	mutex_unlock(&cs43130->clk_mutex);
 
 	return 0;
 }
-- 
2.43.0

