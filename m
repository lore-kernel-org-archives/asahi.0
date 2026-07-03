Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC09368277
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058247; cv=none; b=cZFmhv3pXg+MSI2UTIB+NX6r+ILmiPLbCkzmqdCBDP7+UvnWZsPgIJRflnkhAARoeC94LgLYtlvB2ILZlHu8dcapnqaGL6aOg8znbmXiEnFX0vKAKoBGu2gisJWmCn4tkR3Ly7gfpct5iIWywPm9MK3JDsLFmQd3b/TyS2ru8FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058247; c=relaxed/simple;
	bh=l6qs5I0JUI9K1DiRIyWqpra8GOK6b66PJxrAnmuwY7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uk1IenUXKx4MBo5bv5gV7rcpjdELPH4GX7QxcLj4lFwHrAOnkCh3wEJJc5KwB7LpJGguFVzO06wQZkPFNwNuAix0mOxWJpIl1Jb9jPN8KDS6Kz62uz2mxqtHeoW7F8ExicbiG9icbXvsYp+AM0l66TkUDCPWG3X9yxYKzzB5Mmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFoyqgCB; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFoyqgCB"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8454160043aso194449b3a.3
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058245; x=1783663045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUf2B3EuRxEbD2AxXAzHzC6DSRPTYh22ar9PET4jqsg=;
        b=aFoyqgCB3EYporVhxXy3aCalLy4aZ9m0N3OgsXMPL6gY+sGPIp0+1Kp3qg/kDeuZDo
         FurvWjkcGyLRHEmNg+dzCsJkljEh1QTSsU8Zkb3yKAOJDLA3u6GQKUuveihn3Y0rCE9z
         c3Lt0YFSTO7wR/CENwL4TaIw8P6ak4TI6+2M22okF6JNea0wJPP1FGd9TkHAKSaNh7as
         +NBYKjnW/N6/mYUJNUJpsZrs3p+2LXCFGv/tpN+UgHK1F0CGiaHzXqdoiSFC1MKOGyL5
         bqypMD+08xFoyPpRDACVxzqyucL37Z4MO66i41x+canUcRHgC+OqL+M0ZX9jernJ6k4j
         PbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058245; x=1783663045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vUf2B3EuRxEbD2AxXAzHzC6DSRPTYh22ar9PET4jqsg=;
        b=ojstODqzag8+2SoOB0uy8dIvk0mbjhKAg/4jkj0IdpxY/jjaS3dvVpCN0z+iDmeguW
         9nGUF5zXcZV+gLva5UX8IzUSlSJ+wo97uKUbzqktlVz5Ap0AMU+JYOSYo2zHLaXSesB+
         bEKRQSi/vNd4CPXd5QftHKgKYTLtgsDTvaQO/kXEGFJNwNg3oBnQL1RhjwiyzvHmaqAR
         SADEKw51kVUxCqWkWuAJKUJDwWoxWQIC1y2jQJUheBV5xCQqa8Pmh3WzPvPIENp8ZP0q
         zuIHVrp0YWIuHsH65l/wZrqomPjgsX5A2j3+oZz/tPPb1I1GO2/mB0rC+xD9POubncuy
         MFHA==
X-Forwarded-Encrypted: i=1; AHgh+RqCjfr7tpFXd8vMcdBqUS7K8juPkybdx64RcO2bGU4MynRiOpM3T/XUn9ggxqiFUY3JBoWOzA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyK1WaRGMLegiO5E4O+3ajUtMhB/hhIUNNFfZjLWg7FBgavPtj
	35dDdm5xNrh98/E1NMsW25joHoioN6QzQfTBQvJ5iwV5xMM/2PayZJHN
X-Gm-Gg: AfdE7cm83Nj8uXlsfTg/aMtJs3wT5edFugkpExAMhk3TMZtn6zBauZpogmkpFcIX/w7
	i46eXhiLUlwGPu6x2wihP6cIllUTBGB1WP6TGcYjb66XdtHhkIklJaC/By4MUUKj3SUd+MvENzR
	PFDQlbbdiBabpCgI84GApZ/dj5ttrP9B7Xh3JEBOMu7iBnUpwD5eHlqCvXQf2NqrDd5nLW4pFOZ
	rwDwTFuo//aB0q7WjFk7tSEw0XYq4CKFXP67GNxV+968BFkJA2sPLnqEHJsteZNqHWQTkzzLSAt
	aWdDKspXypDgiUEbutg3Rlf5+Nha7DFaf8wvzxoy/+uvqilKXRk7tfQ+JX9QCYdFsFrl21RokCS
	5D0dbGl7Tc9u6Piaxb5hGA0koOelNVczX+bGV8jL4VbRbDSsjrVYn83fTModVtaDHdunLcbUvBS
	0SWz89iS8qeL6bUb4/fCskwLBrfX76sg4HcUyTCOVDN3jzIPJ7VcGFwrUxzQ==
X-Received: by 2002:a05:6a00:a383:b0:847:8203:f530 with SMTP id d2e1a72fcca58-847c0795447mr9921830b3a.14.1783058245396;
        Thu, 02 Jul 2026 22:57:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:25 -0700 (PDT)
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
Subject: [PATCH v2 20/24] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:51 +0700
Message-ID: <20260703055355.244898-21-phucduc.bui@gmail.com>
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

