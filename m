Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F67381E81
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401270; cv=none; b=ZsYbmmB4Zx4W0T0ov3+7x7CzsKwXR+bzF0Emt0fT99kKYNASbuY0Gj1XSRhzMCGqsFVbOiZeKQ4r5opY0iouQpzM6honRLHu9RJGCBqDDCgNMPj5tgseKV++N5OP9Y7a0q2qfoUQOdsh2Ks3Hns7kp9J+oQ90n90MRkhvQRWhGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401270; c=relaxed/simple;
	bh=7j86E9nXxZplFGdBXN+J5/NJOmhWhrCy33LKfn8VhNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vh0EC8Cmwl0m9JCYWBUjQbVKa+5lYb6OwA4tQb4sCG0uXZ1DOOPHT63QSgsgw58b1wMw2bxgWeCX6YZYf7lvI27xACdJLxSfEdOtHM7naD1+S19+43njvkFZSK7mWclAk0pHpCeBcXAbPpYyBJ4k79ooTiw7c6R/HDTbbO77qX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr9WlBRD; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr9WlBRD"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8478fe07f0fso4298904b3a.0
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401269; x=1784006069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cp/veyII4HIQI9OcBqFYAzKDNTS/IeWDlODSVw1jz+w=;
        b=Pr9WlBRD/fVX+RVO8/QDSLN4l5WAc3OJy0uTiqpvj2yxlAOlkFyAveoaHwsKtZOq9+
         7xI50couzr8GP7jWGT9HNCm6eVQLE0AhORCmqHN9Xd/eqc3xS3s2v1nRrfTeBjSQjA25
         ICKgEcXKc8RGI5fOD+1QUPVTuG4f1bATZ3cjmlkYB6XtEMsDXfiR9S9hYxSlXZmumrFJ
         tnSh32ICnqZuRBtMD2cwlnS8fjerXxl1ilM162rvv430cuGyQR05imHYoy/Mui2mKDkx
         xc52riXuFgdeLnJUexI0hsGUnB8Clho8bEZCxSbeOZz+OJDZuFF6PxcLEibfe7WLgj9v
         WvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401269; x=1784006069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cp/veyII4HIQI9OcBqFYAzKDNTS/IeWDlODSVw1jz+w=;
        b=mo2yOkS2dvQwUrCZoE11z5jSxJV3ej+h6ajWQrNsLQOmEtpoqT8CL47ae4rtqZWEQi
         KHYRG6qUbuqJdka4IZ3+LjXT4SdgvMOpxoGJTye3hbSWmLoT9Fms+AAqsvsgJ548M0Sz
         2wNv1+y1SvC0T/rjmji3CvhXFwM4+7gsxVWj2krvL0psrQ/thR6A5gn0lPEs9I+H3pVr
         s8hMJrICj9ti+T2ELMX/dpj2Wt22/yy3Uj2EUd7JDeNi2C6cRNlFLPuTPHq35h4oawun
         18JtaFQxDIoG8r80aUbW9Cu4P3tpW6+0R8SboZobt+jvcPOrOPCKR5SgDlTjASipGn8Z
         0I8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq/jld16CIecg5UCl5xJdaLXkVphukkxcw2kuTbKnmXArKrzfm2Ehv3Gw/yujo60deXoydCQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlcI3dXipbf4o47ucMxSWRRmtiOQWtF8yhmTljijoHMRzgW/vC
	V2dJynIw2cZEpc9hQOiqBnQmVsrJXw44QmPQJMKukk/4Pj7nRHFD5AQc
X-Gm-Gg: AfdE7ckdJmLSXeeehjeFxEEmGl/qwIH6NEBQqy/MqdYSktGpQUhxy8DjxRF1Uh4ygb+
	mUKDo3Jgl3elQcPFrCSk1RRE82ugZ/072nSKnvAUy8iwkIgy7lOYOdt/6QBKpB/gSON1h1tbbIp
	0Yc7GUVnekIu+KNshjZ1r89hlADudNf5ykNQh1nunCPOF4fKsmPdA3PF7D+yiw7XZ/G0eYwpell
	W8IbVcSF+pu/T7Gl4RoOB4Nyemze0JkrVvS2kRe8b96jRsAOmJ9nLSVWSZF/7L/me0uh4IjkBuG
	Hmk17qtb50CG3cfeqiyLcvgfhUcLtUiwyZvCmeHHSi0LED+P2H3ceZTW5ZVHjHXyU1pbLgRhJZn
	+f7AH4uO7QCltAQZUZcrhlAdN0s5sEp+Jucf8Mx6VN1rDBI/oBcuyG/uQiSFjEMxVu3HulzKjq6
	dz57TR4EMaQS8qANdR/cMVqVIvLWwF8yBM1C3TDeS/iuXSpm8=
X-Received: by 2002:a05:6a00:2d18:b0:847:871a:94ca with SMTP id d2e1a72fcca58-84826d24b26mr3505351b3a.41.1783401268848;
        Mon, 06 Jul 2026 22:14:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:14:28 -0700 (PDT)
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
Subject: [PATCH v3 23/24] ASoC: codecs: cs48l32: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:05 +0700
Message-ID: <20260707051006.20058-24-phucduc.bui@gmail.com>
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
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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

