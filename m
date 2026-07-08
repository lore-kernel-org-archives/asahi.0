Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107EF44212E
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515163; cv=none; b=MaJKM3d3DRf8DANDPg2Ofjo4MW5G8On2AQ6XOdDBMZT3qY0lnh/wU/Hbbz64/S+bpD820cF7pzyiWwUnXQFyA2VvBsF2VGPKUvETm6bsWwXqNkW9GKHeZ+zt3Np1u89dLdUSBXG8+0fkNmK55Z87E993yp0CojPdTw5o1Xysajk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515163; c=relaxed/simple;
	bh=fj6i3hoRw2lUGwj4QnJCTFx+3YmWMVmLdvQ2+3smyxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aWe7JIvf318oHKKE3vUa1OpZq/WhaL2P89uGshTPcx1ntkLCCTiCHDWJZdgPNBQox38ikw8iKQyCd1zNSjxELM64g6A7ayY0gDJ0n3PZ+b5KCqU4BInLJhnJ59lxev7b+lLq3tP7X3y9n4Y+WerGX8qtHRN+yeLKXIGSiwXO5i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=psGb3klA; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="psGb3klA"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso532975a91.1
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515160; x=1784119960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmvNpNrM4hxwguO0fa8BTy0Lbihqp33Ngtal/urQZPI=;
        b=psGb3klAAd8/AVO6vJHxznTRwL+Gl8Oy47ZlGtxA8guRu/j6IA6Lw7ztz4vWlsH9gh
         tlwttN0bQrVeJ4lgAVXsMJ1k6rv8DK4UdS3iic818x537IB0FAYHHQpQf25L36Fa847O
         92ycYiWV9fWJWlcNqOwd8gnA2k3ISx2+9YY/avbfjeDZxcmf+QSLEoxWU9tKD6bJ6Y8+
         uvN3g8pydT8/tZieUFIqgUuDzm/3ZcDkIoyotsMDWKFJtKP8/krUfR8JmcPSkJfQnMyQ
         HRU92+KIz+hUd1eL81iCo/TSppPSnpk9zQkWqOE4bEVjApp8txSUhp93oZK2I0Fw+mk7
         rKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515160; x=1784119960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmvNpNrM4hxwguO0fa8BTy0Lbihqp33Ngtal/urQZPI=;
        b=mnn6+lJTwdrrAXd2ZazmBUNAg9Pcelvze0K5kH82n/AVozpRtZ8b5SuMbrL5f85DYT
         ytxjHTxlSAiJ5zwSgo7Dya3mtmwjo4E/Qwf7suCZRRyjMTBL/Egj03XjkCGuGyBnz+d9
         ReqPkmDJ4NGUU9jGklhJRGAux/yt6bqzh3ap1b2SYOVuxZe/fXU5swCUKM6mshO+OCbf
         MyBxbsKYMPAnw14lCMGIvCG+L/jYfa6WCccHIk/KRlgcVS2aKhf/QOBYtlAvmUm3xlEZ
         LD+NbqmWDRHfNxO7jBQ7zZsofZPIapz0m9V7gUluV0sRvuTwUNjqiD4FVfzlpiC2pdsb
         1NlQ==
X-Forwarded-Encrypted: i=1; AHgh+RrsL05zSpohLQAUq51mC7yZRvSjyqKD2odCbxqjmxc/7oK6J6R4PsucZ+RjbFCZurRDOjbUjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw400EyS/a9tW5yvZZ//dwVyC4zYLWUHLxzktdpwSuUYnmWC4nG
	N/kkAOKg72OUOOTy2GR3NIvXNV3GbtOpDVBcCA6ibpUhc8l2B37gCpb7
X-Gm-Gg: AfdE7cmLCTTjw9b89guro8OzCTg1nehKte37YYJzzAnsPjEhmztYO7XnL7Jw+a3P//6
	7OYo6m52q5zfyo5EP9vh1GmcDs4iP+DqBgK95PeIeR1VqclZkWiAvzUsSYa/cWexrWDW/Bf96oi
	Mpt6VyNvM+en+ZaBVlIYrVn39XH92uoIwttH/39ocZdNYL3Lfno+vuYaYF+gpFznPtUsGTF+Bo0
	/0glQznQxrvHjrQYPqNXKALynEqf7M52QKmq8y0gAM1xVEeOyzdiJQyLCIHTUrEeWbpUoHPJeYq
	ZPPOtmF5YX4dc9AJ7bJMmUO0AH4Zjx3g+zB14VU2PsX2mwOvX7oQDZ628xTzfifxOioo5GS3mv3
	/j2upFx6CKzxm84C30Lybg6yQgiEhflw4HvUAcM1KSFHA7c1E9fKgvmaMfrQsNvsUxGp1FzYqb/
	+cJcP286nZblOj1gLfeuXby8rp59poTViXJyFCrIWfmmVHS18orvD+bcw7xA==
X-Received: by 2002:a17:90b:3d87:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-3893f977bf6mr2394645a91.2.1783515160314;
        Wed, 08 Jul 2026 05:52:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:40 -0700 (PDT)
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
Subject: [PATCH v4 17/24] ASoC: codecs: cs43130: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:54 +0700
Message-ID: <20260708125002.202515-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - Added Reviewed-by tags from Charles.

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

