Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B109F2E091B
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454451; cv=none; b=lWYmJTcPZdk7W3P1s0X2yY13i6r6J78/9CAyTewVWl7xEGhRX1ydhGaCeDRevvdO6CL5Z71hXRDbWIfr4po1s84A72ujh/iwuKSTR8ZWZYNLfYR918a4YJolBpAT62XwtxXBQ1BK8yPheYzE6HJvYeiFZpWBprUJ2LYeL3sedR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454451; c=relaxed/simple;
	bh=AqSKMzJhrln5rJJaKew1kNIMMHkqQq35uyMPzg1QGgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+Abj0w4a5XO6LuD9oM2YWt5f8L6wLFpZwHEYzuOsy3Pn17vt+Ck8M3Bm/Rbvq+jRuT1jq4KjJC48kmJl8UIEye34unkjPJ6k24LWvI3er+1viJ2AnPFyJjAbdsuICATL5g8tVGBwuA8eCcOoYv5tve8VnnMWBTpaXd6v1a1omc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4WasPRJ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4WasPRJ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37e0035aad3so285952a91.3
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454450; x=1783059250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7lXoP7p9Ir4aIi8W6zZOzzy0XA5jw3NqQUJ3RaYm84=;
        b=M4WasPRJjxk0nKJSmJ7ydtUiRwC9hGpvJ/70r/NVyEy8W9E+WOHULJGxHi9EMcylpu
         4FY0M8PTmPuYmyFJ/i8q96uu6+2R4mz0gTNzqjZGLHuY/0PofOBDx+TzTVb09yHOYY0V
         PEgtplbp6RpgKgA8YW0kvFLawJXFUkxT6/M/uh6S/G42PF98Av2v2KnuzYzVW6GDndQw
         psPs59j+7hwrE9eDUPMejbwR9wKuaUUbKGRMAJWrHVxKcqdOMUWgZ20WbCN3ZTyFxapF
         VrKscT8qoEOjgPMVBUrfR02AR4ezkwFyC2sbqXy8trYV+/BjjEdvMv/Dd8lHt4fw/kRz
         FLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454450; x=1783059250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e7lXoP7p9Ir4aIi8W6zZOzzy0XA5jw3NqQUJ3RaYm84=;
        b=L6vjI+LhbSjvH0cBG5S7bkOc5Gw6+GqzzVawLLGnVEUUWeXN1noEoC858cmM4LubaG
         0sbFF7RrfU27s20vstThf+C1NUCQjYxSUa4FZ6QEGI5Aal4Er3KhxYcNMx9tok64sDF2
         gNOPOC+siYT0oEzpgI1vSJN0Z3x8EuCtctMVXrqII1TQ7VYmU1osH+7hl/ttmeUlq0hw
         Ej9qCCZzw4fR3NhcTZ48NAFKgK8nqyljxQyDyvWxKNSlGatizTHPTGVAUpaG4XTUfTz+
         r1JO0PAADMtz9sJ03s8Vli0i7D45qMEqa0YMrmliygfPuCrD3C7IZNiCRbjCQ2wpz+Gn
         QObg==
X-Forwarded-Encrypted: i=1; AHgh+RqmhYApkkDxhfXg/1JS3vxfN+0MkkyCx8rhKDAG+emvviV2hgXYYygFvP5BlA7o67z1DYv3WA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8Vuf1cmewqE95L3Up9ZiDUWoMcfktnflXtGmFRLtbC4ZSCIZ+
	N7/2OuavORwvUexTg1jv1bcvWFzyNhd4UKj0y5m1sNYBfqM9Va+ihdyD
X-Gm-Gg: AfdE7cld+bdAN8YOVxxcbgx5xTIaM2xlus/Qx35SB/N1EYR1NyuG4OehZ//au/xz+/C
	4/KKTMllZ0lCjroS59hICFWm9pdOyDuYpFnO4t/FW7vPitFKstpht1xOmlkqE3V7VFkwz7vQ/0e
	WSLIadjA6Ks4hvspU8p529fuU1x23H2Whs0y254drbxf5hqbNn3iS2kP4uiJ1beUBSt4qIUXgrO
	/2YnZTNgKM7hVGxKGRbunlsde77c/HrWuPdqFz8vAB5PH7rfmLjz0BpiukF12Edy0/lbYKCKzFv
	IcZ0NgXd7NmzrQkVPRARP57jnYebCA1X/aLi9HBGHfG+PK90hyuKLHE8nshSvWJ9yWgFp3GYXnf
	ZIln+ec5n4HwUZ7kr3PCtt0/zpO5Rlfg/JnGoTcmGufddzMzKdQcy54Y2m2rIjrDz7V+Eq1ZSqO
	nFyNh8mmmSaob+jYbMILLvaEJHPclIZ7cr41Yj7HnJHlRr0QY=
X-Received: by 2002:a17:90b:2789:b0:368:83e6:ca95 with SMTP id 98e67ed59e1d1-37df9e976b2mr5533977a91.0.1782454449972;
        Thu, 25 Jun 2026 23:14:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:14:09 -0700 (PDT)
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
Subject: [PATCH 04/24] ASoC: codecs: arizona: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:09 +0700
Message-ID: <20260626061329.23264-5-phucduc.bui@gmail.com>
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

