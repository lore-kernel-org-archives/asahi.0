Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ED023BD02
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058256; cv=none; b=M15gdz7XwGIA4YXSntnHS6anX6Dyql3CePTGSc1IJ7O9pWXv1N/LTSXR2AhX+do8UJvRaV2hgVtu/MHQ8zC3Pb2pf3GWD9OwIEiuMaQrb1pv0NKScGr5dtDN5/GFRewSDWSIDmfW7trlEeoG44tAiEBn7mEanT0+z34XHeTfUQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058256; c=relaxed/simple;
	bh=KYo49UuYbgBO1m14OgkhHkjaRTQZTWjIzrum4/tkycM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pr2T2BYzbp2Ex/GFUmgPsr99ZwzF8vS7uF/ORw8l111smE0B07yAbZXt6F7ekedboeEgF3rU5uvBoqBbk3frSUz/CPfCC1aFvJfKbV9CWrEkMfejFLu1Z10xdp8rbQ7dTWQo3n30r9iP6gBQSy+FGUWdK5dutfLA/BPzGAGMLy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFyz1i0M; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFyz1i0M"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so193994b3a.1
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058255; x=1783663055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WCuIaAoOlEGlqla88ugURiuPnqOFGITdU7Oz8/QvOM=;
        b=LFyz1i0M9SlYyAaOj7UnXHYDoYzRqyXQXMy90PbGDiLRKT8FmLFzMoHoTdEqDOPQrQ
         0VDSt3s9yKNzAnZ3g4aZS3Z7a02fiwW+azekr0sBIxldA3+fADXrE/rD67+7n81fNPX0
         4PyQ30FougNlU2G0/kNz+8arCNCGiXEAAP8yGDjmmumuBNIq6FwITZz6Fgf5USQUQOg0
         ijpfMwL7mh0jM3W1gZYJc2cxEe5NQy8WFwcWICAgvzjOGQfueXcOFXCBWy17Qn+AO1lT
         PRtJaeTgLd2wl2AdzNl3Tb/2UI+p/re9mQbmEzGFOPa0Z6gMehAv/02aZ3PiBfwmtQq/
         +isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058255; x=1783663055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7WCuIaAoOlEGlqla88ugURiuPnqOFGITdU7Oz8/QvOM=;
        b=jWp+8ia2e2pLVBeZgB5fvnS1mLbJ9spROqMD84dL7Kt+oj/5BwYMu1mZW275AKRmsX
         c1KIIRT67ukq7hq7i0RURY4aGkTEfelXlKnot/7rsyJUWbowyETRoK4X7WsOmlMeYQxw
         HLM+pYfz+WTifw1KT1/DqcsQ1fUwqCBhOu1/giqOmQOF7Wc95+P6d5OYYR03B1ObbKPr
         pT/7EZv8/61YOVxER/1D7Xra1P/YvY5Nnd3nEiKeGWl10VWxXMW+8/UTZYkKI6kj89iF
         ZqFCXU6nCu5XSGbGv9RSizSkp/kUFeKc0Nin18i1fa2Hjx3eFaeSYhT77XCRWU1aC9fo
         bmSA==
X-Forwarded-Encrypted: i=1; AFNElJ+ufMIe8ITBVfn0wz86s7vc/2PBBOkokzNCHoAfSk5ulr3oSf0isV2gDOnEMk/4358h6bFwdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/f0dP5OCi2vVdUlCoEFD5OpjN9uMbaEGjGvXjzvvfKlaC3ZON
	Z9BqUZESUwkSK+iCmpWjyrP20jg3bQnkdlrkeqORi7zxiOecbzMafYNI
X-Gm-Gg: AfdE7cld/1G7m6EF6cbbSifkRRuWikorBgABtByJ/+hnu5/Qvt5QdUUjtFuOjiiNsXE
	c5/+L1xPhVlSKDh/AjcTcCopwD8SebEzBTHPMZICwNH6F50zbdoZ7aqCbKfKPxXakzzkm/zA7Lo
	4ln6IMDyXNRPCAaALYYjt3lREVUvZfC173Wpt3BhU0JebEW/DaKHIgKox9jeQdciozf8EDhvtJO
	OY8PUS1mNIPiC44+i+LUV76bYCGFQq+gd53uat2JRNs0rrWBz6Ihm01GmrdlkgkbrRuS5zI1uVD
	2a88lftgzFT2jR6M2MWg+daRtxG5r11ero8i6pQ8Z/fgGnZWUWgg+kA0o6QIiQE2ZqEKvDW0+ui
	N8L/inkV54QiEKrAVInnHZmfY8koYhRhGdWjSHFA/J+rD7avsjNBpo+9SwIUvMaOR01b3uzI/EL
	I/+N9m0jr0F8sxZpcAT2XMWkTyCEqx9OB0up6GfXkuQ5cc40g5ELdEkTbutg==
X-Received: by 2002:a05:6a00:3c94:b0:845:cdc1:a803 with SMTP id d2e1a72fcca58-847c074e0d5mr8733259b3a.11.1783058254709;
        Thu, 02 Jul 2026 22:57:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:34 -0700 (PDT)
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
Subject: [PATCH v2 21/24] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:52 +0700
Message-ID: <20260703055355.244898-22-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l90.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 77e8aabb241a..6ce603bfd500 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2423,9 +2424,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2456,9 +2456,8 @@ static void cs47l90_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l90->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L90_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l90->core.adsp[i], component);
-- 
2.43.0

