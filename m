Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7471E368277
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058273; cv=none; b=ra+EQcr3Iet8Ku/N+MMCxkA7zmWyjFpw/11ZSwtgsJOjJWnPqUxDZ2ZrGR7n4edq51w8CZEl6iD5yYEMpufLYP7Tmx3Bw3zUlA6yNdTMoUaGYaZ9qiGbmVq895iEuEVnSzlV/1uHArfvtQv/TWcXMoBgz26G1VO/I3KB28wjSnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058273; c=relaxed/simple;
	bh=MHB+vjFfWlUHNNfYgxS6YYgiZANX31/DVhBYct0rLOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+mlB1zHI7uZ4pwfYjv7tvPwX8Ue8x1Npo+ScwJLALHuaPADP8ACbFsUS9cb3Psm76WXsSnN/Hi4mtdCLmP8ot5/hE5KCtsZNqWKFY71BHRJi3ukoA6tbHbpZeRk3dHNVi2rkeoyBpkdz9P8HNpcxYIuDeGG11Vlk2261Ue3wJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oeWoE1bi; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oeWoE1bi"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84592b55832so133423b3a.3
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058272; x=1783663072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FzZIorP4Bzh+1kJvRnQPSqCkVRQdA0Z7VAbqDN1WCU=;
        b=oeWoE1bic6Tm0OBugvUgiPxosIxTE8MAv7LWBfsTY8qzt1kf000OnvanoOWt8SFE3W
         zqs8lV5s/7r3mzTZKAAzT+sV1ojFdHrgEbwR4vkOXZD1DyXcGONHU6GWCrkEatPWiFRz
         RMHxTHUjCfcHA9mxDiay4xDugSCRUrkIsEMMpg569YRVQZtv6chpE9AiOhYOodfGHoau
         +sTMhdQTeJNJzbmwECJN83BgE5CJGo5sfGPgMLz7NjwAd00Xyf275btpFTydjbGOJw5s
         ys6qtYxaMlfBd7Lb4DpNpuTqhQZrtWS4pfje4rVfUPFRBsQaR6jdV3f55wDhToRVxVbN
         22iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058272; x=1783663072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8FzZIorP4Bzh+1kJvRnQPSqCkVRQdA0Z7VAbqDN1WCU=;
        b=PMt6pngpElMwdCwwKuvOD5aJpb4jvbpALeP7XWGb2hrE5VDak7MOsSrYE9vax2nt4X
         DmcLMQU1ztpbki7aQwhPnELSFPjMo7q7x0h9lT3Wx7tXwwFgqH+vfyg9ZdM/E1kHCPJd
         V0OulVOuI9bOR3xsgtRi3bczNfyjmVHB5VwM0hzRD9bkJi25mSmptNtJFAP3+pM7aaJe
         0minIttUjT7fuOm8wySKO02yB8U9sze3ZY9qqg8vxI1/GUV0XQClIFmavk4BHxDF0i0l
         BZD3aTi8AvTRXWNGuX2dIVDCObjDDooN1habLxMl4/GC9SM4xQCBZaMe+xEz0LDh6/dX
         ExmA==
X-Forwarded-Encrypted: i=1; AFNElJ/kF0TWs0RvAhICYjaW+IYZRcTqRVjNJSU4FQtNuQZDi4EDKhjXgb3hkv4e8xPUQmxT2ikT+w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyVHsjjUg0IsAp35IMmLA2ME62sEacfgtZW2aM67EN5Fn6dc3u
	Rp8QwFKOxN6jV7oQuTi67mGgp9PzZIF/YJ3x2rYvltYx20nIYOZrK8X9
X-Gm-Gg: AfdE7cnAIwK/I5ZvIWaulGpj9EsO+erbBVxtuTblquuk1VnPWttqfo388txNt0TZA7H
	HhvSQJYAf2DUcLjGKSg6v0quZkNLlcFgT6MC7bR0OQP2Z/G4oQRjSZ8S+HjukFQ0nF6Cowl9Fto
	nSK1GVlMF5gECqFkblZq146x3f4twsgqw+aLAeisaaGLHH761QuBQt9aWL1jXamCDXtPuPIiH8B
	1b9M4ayhpNwfIgORtRA6lQ9anK7dURs+5j3R+85Ff+pusYXMu9covDRDO4eN6Psn1V5CKI4vc6s
	Ysc+7ZQgVUc20X0OEXbfXV7Wc8FmxI+WPoY5c1YxmuzxlVJXuNDNxi2VLgLfu/qcnjS0slX+AMT
	Nf55uQ+U0wNP6zQnygRZRYQwgeQIagntRgL6Ysa+laULl/DuZF75GDdeABDJ1m6OE0U/SpvGvie
	w4EZG2Y23swr09bqHd/I8Pf+RBlCP6KFqbVCCS1TmgfNZzq/k=
X-Received: by 2002:a05:6a00:944d:b0:847:83bc:d2a4 with SMTP id d2e1a72fcca58-847c068623bmr7752438b3a.2.1783058271534;
        Thu, 02 Jul 2026 22:57:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:51 -0700 (PDT)
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
Subject: [PATCH v2 23/24] ASoC: codecs: cs48l32: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:54 +0700
Message-ID: <20260703055355.244898-24-phucduc.bui@gmail.com>
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
  Removed the unnecessary else block so update_bits() 
  is not called when no changes are needed. 

 sound/soc/codecs/cs48l32.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 086ed0f57a85..a9967771124e 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -8,6 +8,7 @@
 #include <dt-bindings/sound/cs48l32.h>
 #include <linux/array_size.h>
 #include <linux/build_bug.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
@@ -236,15 +237,13 @@ static int cs48l32_rate_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_v
 	int ret;
 
 	/* Prevent any mixer mux changes while we do this */
-	mutex_lock(&cs48l32_codec->rate_lock);
+	guard(mutex)(&cs48l32_codec->rate_lock);
 
 	/* The write must be guarded by a number of SYSCLK cycles */
 	cs48l32_spin_sysclk(cs48l32_codec);
 	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 	cs48l32_spin_sysclk(cs48l32_codec);
 
-	mutex_unlock(&cs48l32_codec->rate_lock);
-
 	return ret;
 }
 
@@ -2242,7 +2241,6 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 	struct cs48l32_dai_priv *dai_priv = &cs48l32_codec->dai[dai->id - 1];
 	unsigned int base = dai->driver->base;
 	unsigned int current_asp_rate, target_asp_rate;
-	bool change_rate_domain = false;
 	int ret;
 
 	if (clk_id == dai_priv->clk)
@@ -2284,19 +2282,15 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 
 		if ((current_asp_rate & CS48L32_ASP_RATE_MASK) !=
 		    (target_asp_rate & CS48L32_ASP_RATE_MASK)) {
-			change_rate_domain = true;
-
-			mutex_lock(&cs48l32_codec->rate_lock);
 			/* Guard the rate change with SYSCLK cycles */
-			cs48l32_spin_sysclk(cs48l32_codec);
-		}
-
-		snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
-					      CS48L32_ASP_RATE_MASK, target_asp_rate);
-
-		if (change_rate_domain) {
-			cs48l32_spin_sysclk(cs48l32_codec);
-			mutex_unlock(&cs48l32_codec->rate_lock);
+			scoped_guard(mutex, &cs48l32_codec->rate_lock) {
+				cs48l32_spin_sysclk(cs48l32_codec);
+				snd_soc_component_update_bits(component,
+							      base + CS48L32_ASP_CONTROL1,
+							      CS48L32_ASP_RATE_MASK,
+							      target_asp_rate);
+				cs48l32_spin_sysclk(cs48l32_codec);
+			}
 		}
 	}
 
-- 
2.43.0

