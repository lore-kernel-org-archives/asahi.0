Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0363C382377
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401233; cv=none; b=fJKBnQ198ENoTKBgLNlYrdd9TYJAw/alPvA7Q16qMgf5yzvTQuxaGLEqDIFFFmz1RkWO2sKU9MHUzKAr0QSDogix0tAhvs8h7UK29XGkhqhQ0EQkFdVE3YSOPt+ToC4H9qrPUEb5CiOIRpAYvw3UnKrRWtaF0/09Y36llXhMRPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401233; c=relaxed/simple;
	bh=myMc8cB5TZmyPAjZl2RU5Pqsd/fh0JTdU74J2r/32DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxHoHfgvaRD2sE2i7Xi0vCRCy21qdFwWC+PlHiygEz3imiG0uvwczFHAsp5eEMgNhylJ5/WQ1GKOSktNy0gG3PoJ1LNFzRJIUiKjrzvFStut8q4wn2JXVHD1Tt2iPsqOhc/wzi97uOi2c88Pi2WhF2iE4Y8g+ysojw5L/jzH+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9Mc0CoZ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9Mc0CoZ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8478fe07f0fso4298533b3a.0
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401231; x=1784006031; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMEdxrf5C54lrH2YSFI3RWWEKJwn7a/uRQ+uyEkXurA=;
        b=E9Mc0CoZ/23VqvIYHvr7KnxcUUNdCDNcuBihHj3SWXQ8IJrvEBmZqxYt+Uq8uf+U2C
         0ru19URAYeDFVrfcZW9c/TcFUlKdFgGX5wQqoHmA71SiZWxmbUXHVhMGD2ZrVeoYRXdb
         XbkKL2JzB/FlX3Im5Q32FJqXtMnpRCPuTtH/6w1zEnYBgLqvs8xM0q42Ko02oq4XnkYX
         mQdG3GrN2qFjtl7ZUDImO8CN6UfRRqqOAyhK7Jyp85XO6UdvFYWtCpyTnJyuIrIpTCsD
         ZC2uRTyPHkTaYzIgkwXEiJRMDiskCgjtgcD/4bWdKO3eeQIhKKiYUVW/MnRlA5ht5Cay
         peDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401231; x=1784006031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OMEdxrf5C54lrH2YSFI3RWWEKJwn7a/uRQ+uyEkXurA=;
        b=qWyeJtZ/5MBZX62vWXFIL5RCKaOvvRICy12O/mkMhK2vW6VPQp+22gDD6YHs8vE5+u
         udQgpauweiYL/priWvZJ5jvaFXeivCQtjdQmNSZr4H5muU2W7sBrv35I+VK/5CAUjXki
         7DGu5oFUNtr9GZBul96KAdEke/E9eJiloSg/eIMHV+BjpXw7hmk0njXVV0P2X6LVcvbY
         U4VZKTVwdygHkccpYXfdPCZRFiwmqOMcPp2t3g4tunCRP5x5UGDC9J2LrYPopXNmnp8i
         zFVhctvNy9cY+qUg5As/LSwhg46wzcQC5t6Nijetwd2uVRWVmy97mS+0qceFEr/PoAWZ
         IVEQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3MucYmAwQKD+ASUhmxyQiYV/6lpgKzTi6+MuQqCspuduXa74+/jJPaLwYJokEhgpl/huaQg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyab0mF9J36b4Oj0JLklmbM2y4dr2/c7INLiwmDkk8hGEQrQk9j
	7pXsRVqiD3cr8rca1i/ZEjKLjeISFQ6nG0M2WfKODKOjY9enK6OA3TvY
X-Gm-Gg: AfdE7cnzcnzU1cez1do4Zc5S8sMD9YF+3HwAC4wR7Sc8Yj0N6t8ZaiuxWiTHkgSqVRQ
	mV3xsjfNtyaACyQQNpdjX4uSDs0sFErZTudqOYcnGb7LdstB9p7VIlZ+IoSDBCJ/mN8hWjk0Dqh
	JfVxj3azsIwVfLXTRLJFNPXUNHdRBQWJCo6KOIJ2rIHg0HmXMVqTQAgsOEDwSjBz/+BLQdpmRoO
	p4wstka3owBHeLWML5SkfuxRxRSH2vn9nK7qMnbuxjrBSNfhxpIxrbowpE6B5uO3bA8Si1mjXSB
	JJ7lvowOu/RQqTq+b72XH5I3pLbJHNCcQqrenKFXV/BpWm1uGzXM2xMSTOZLnfMrrW3X0W5uv5L
	9kJ0xDX6SsE4bE2Wjh4SWwbFcRXiFM92vY+KMfjgJmv/E3ndb39HXyOGXvgqcGfcsfZ2QZKpMZf
	bu4iY8YqE6n+607VQT34GWNvnc6e7FVgthDjF0muA2MSSnMpg=
X-Received: by 2002:a05:6a00:3d08:b0:841:58b0:82bb with SMTP id d2e1a72fcca58-84826b8d0f7mr3442321b3a.9.1783401231339;
        Mon, 06 Jul 2026 22:13:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:13:51 -0700 (PDT)
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
Subject: [PATCH v3 20/24] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:02 +0700
Message-ID: <20260707051006.20058-21-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l85.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 42fafb0b392c..9ee60616c04c 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2504,9 +2505,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2537,9 +2537,8 @@ static void cs47l85_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l85->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L85_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l85->core.adsp[i], component);
-- 
2.43.0

