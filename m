Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0B332B100
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058095; cv=none; b=WxpXrllRNPWjK1dsbHyypLkWl6DePp3oFnWLVjRXUYPoXWRXq8hY6EKhlPeeXEa9LchcH4hQFvQR+EiJ2SPnD0bNHMPyGZ5l12jMwMaJf75wc3N72Dnd9eCsXjyI6EFCtWHZKeC/0RsoB9lrnzGGeaZQEQNbUj6yp5YGfLLUU9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058095; c=relaxed/simple;
	bh=xKs5OmhRIiqnhvZb6lkj6wzv9qVi42azkDJo9XoZNiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZeaxYGi/E6DGg1dB54sh7eTMKF8DILLvvOIrOvp4bJWDkDmqIiMiz2/D4/2HPnMXWeDWnJalCriC7cAdDTBs28/UqirYhRLD/U5NhBAykSxvAqP/KLdpLtHHZTb5WNs+cAZhj3V6Em7SjKo/dZrRkj16JNrvQuWSLSw+onZO6vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFXWCaw3; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFXWCaw3"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so192682b3a.1
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058092; x=1783662892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6I96oxVkfNpIRakqC/uO6uT6n3Ys4Sg04RqHkwTxN4=;
        b=BFXWCaw3UvbBYUUkJW0Yzqg15FJfpII+tRdi5kmKE4wssWoYDFR1xb1jsb4DHu/49B
         5HxNV3C1T50ynxno70xZ+oGu20LCds/YE46JDgW0lNkbho9wbVFUPm+HTf4oCwVA2PxZ
         LQm9OyObaq2nMPeNbFSb6/e6zfOcxKom7QtKTzrGnoJWmOB0BXmQcQRxiISehoQrUVdS
         ZXYMDEzZIoL3/6zNX78JNSQ6HLNaPtO/0cYlN7pP+dwJniRSEOgOn21IjJwy6LOJBg2t
         F+pwQpsj2NgOkBurq2qv8/zj4ouHEq52uRsQ9k9fbOpZmC22xI4/2ZRQkVXcjICmGvGU
         CN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058092; x=1783662892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a6I96oxVkfNpIRakqC/uO6uT6n3Ys4Sg04RqHkwTxN4=;
        b=VJHtcXv7gAEsWV+JyNutU+PsG8IGQ+5YRXHtT9Q2cTNvEjUapEgR0dQE6NiqWTjS/0
         g8pem5cYO+XqSkWbWst69uxzNQyrhAVddPjMJjhR9KLYsdMH1sdX6Fw4OqHWU9nsDIeL
         uPPkGySlUskphv4aXiTg4vaV63ZLllnCKm2qDpT6ji7+jABzE45YQd3D23P2P6AOExzi
         H3Qr4OdacVUGBv1Vnlv7unt319jHxTZfyW8VRMlU2chMfyInfUVxs4UZM44jcKSZD4Dp
         fhWf+zuVtS/0brG+EJPUoOfsOfs1Y4vKC1f3UaFT9SoSHRy+LRA/YeU+RSgmFZxVryne
         3vxA==
X-Forwarded-Encrypted: i=1; AFNElJ/fD+0qNzT1aAlAZcRxaRtWhVIzmHI6HrxFchKvTnOKPRrfMDjeS7pMKFuuVeZKNLSCXbzkMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwW3uv6LIXHM4HcMSSMmaLhDnizLertTqIczJVy+GD7MpwbEMvR
	dt7DCFUShcQD5RhVuUstek7+SGeJZDBUuTs/QqJVvfYq92XS28Ub4eCK
X-Gm-Gg: AfdE7cmyK4Bfdx2c6PRZC1WlIHkaQoevegKDcZUkFsqZUMyWeGzec4mJ8LUG1crwdgM
	EWXTmCl66HvlRcVijyWXtT2Jn3R7v1oKcrfMbNnUSnpQOKklqy3WM8yG92hCktkOq+yZWEIix3N
	8mJdlsw59cvB6Lvd9epntDs9OeMhJOFRtJEE6gleOdtJmwbWhQM0luo8F1/VjzN1lJywCMoSTea
	DA0kVMEyJ51YwD8Z9dzHYcsH/RrkSnl52ovx8p7RJJ3Mr7MWGSN7wDk2C0TI9FN2aQeN6928XTA
	g0mBHQtNNaLzjueAEqgqGPjUXnaEZxrt77yijKSMT2+wYva4uRaB6fWpilmCQlk89aQBmb7nqsJ
	Uz/7nJiEFLTUTpWwpuB/1qBK7EQXYMx9Q/h2La+Mqq2CVTnTCRYx2IuduZUfdOEXL+ezjHL3OeC
	Xaj++dpXs1uPme0hE5O1RjPPYqYprrvfPcQOBZyRGlJbBSmJo=
X-Received: by 2002:a05:6a00:368b:b0:847:926c:582c with SMTP id d2e1a72fcca58-847c0988950mr8839800b3a.29.1783058092111;
        Thu, 02 Jul 2026 22:54:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:54:51 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 04/24] ASoC: codecs: arizona: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:35 +0700
Message-ID: <20260703055355.244898-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/arizona.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 8c683b0bb74c..4411165c3734 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/gcd.h>
 #include <linux/module.h>
@@ -1158,17 +1159,16 @@ int arizona_dvfs_up(struct snd_soc_component *component, unsigned int flags)
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	if (!priv->dvfs_cached && !priv->dvfs_reqs) {
 		ret = arizona_dvfs_enable(component);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	priv->dvfs_reqs |= flags;
-err:
-	mutex_unlock(&priv->dvfs_lock);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_up);
@@ -1179,7 +1179,7 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	unsigned int old_reqs;
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	old_reqs = priv->dvfs_reqs;
 	priv->dvfs_reqs &= ~flags;
@@ -1187,7 +1187,6 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	if (!priv->dvfs_cached && old_reqs && !priv->dvfs_reqs)
 		ret = arizona_dvfs_disable(component);
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_down);
@@ -1199,7 +1198,7 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -1222,7 +1221,6 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_sysclk_ev);
@@ -1657,13 +1655,11 @@ static void arizona_wm5102_set_dac_comp(struct snd_soc_component *component,
 		{ 0x80, 0x0 },
 	};
 
-	mutex_lock(&arizona->dac_comp_lock);
-
-	dac_comp[1].def = arizona->dac_comp_coeff;
-	if (rate >= 176400)
-		dac_comp[2].def = arizona->dac_comp_enabled;
-
-	mutex_unlock(&arizona->dac_comp_lock);
+	scoped_guard(mutex, &arizona->dac_comp_lock) {
+		dac_comp[1].def = arizona->dac_comp_coeff;
+		if (rate >= 176400)
+			dac_comp[2].def = arizona->dac_comp_enabled;
+	}
 
 	regmap_multi_reg_write(arizona->regmap,
 			       dac_comp,
-- 
2.43.0

