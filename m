Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FA736729C
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058230; cv=none; b=hEZCAQkivZXmclQlMRSIW8tSVL2OqiPVYZSx+AzPLfm5EW6po+J48gD1ZV59uiyVHzkdpVFeqXADbQh9BWRp6Zz+K/JSu7hne7cu2gOH835lpNYpe0RbZWDarxwpTmg3vltc7QYYdZag0l94Gfu/28fwIhTgt4gyhMFsJv0d72Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058230; c=relaxed/simple;
	bh=AZ+/sprSGNWOJL5QjLJaSpFH0m8wxH+sukCBtJYoNfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tcMD2Valq0LEUXBfU+PzMaYYG7Todsd2wFo2o1Fg0ihhc4gIwdncSp25JSt9JPsfU9glUzBIg5ftrNyHYRdVstW1IrM1iAVtmdeQNWK8yyx+KnEvuWlE5uxKSDC1k8xATjD/PDLXfuJh+WRU4+QOOlahwnHUaID0pGhBYTL6uDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jm9LzHFT; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jm9LzHFT"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so179214b3a.1
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058228; x=1783663028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZrDdEV0nAN9w+kfhy3H3xNzSuMWcMiDn5csKMrOHzc=;
        b=jm9LzHFTBAypash9py4CXNVvpw0LkfpgB1lol5c0rdeM2zHiKjm/p3orzdOzNKezYp
         jTxWRSeGf6TCBuP2w6nphLMSSmoba7iUSTnikhmHyvbGKl3jt3fe8F454hTcfgzehIEW
         TpDx0Os6ugSCiBamy/Ze9MLPdo9TwjuprsBsfbZJFtLP/VI18N1ByGrUSOGrImzBxer1
         q7AwZaIuzFOQbgfhLsecdN3BLO7flU0G1oGwZfiNQYMur5rU7qLxlPF5xPsHsRx2nEcK
         /6fZnxXMfUism8YNVABXDZbq+YY722Zew8AsYE3hI0EEUlHgnvfOt9YrgO87lzLE5EYX
         DmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058228; x=1783663028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZrDdEV0nAN9w+kfhy3H3xNzSuMWcMiDn5csKMrOHzc=;
        b=muokqtPC+Vw/c8syI3AVdJNSLxnSzOwPAp0ObTjA3iw5fKh1vnvI2j6X1sjPqJ98c8
         kiGNhJrUSqOW4x2fiQ4B5xOnYD9rDsJk6xzSKAfP946d68S4rp+x3xmPBhGyofFwxQHD
         e24E8dvwIkOQnmGi3XQv9ClomPSzlqBF5ruc9QrNhX4ittcfdw1mYgwXSQ4QC/RjtSqD
         kMqm+whgOq6Hk30OMHHUNTTN2cYr7aoh3t8mQabcd+lQ6/Zy/P6ekGxuJypXF9cXomp6
         KYRvjA+crP4MdPsxFoq0BjKBE+95YBChxLp+fkDOMkjPDsM2vVNSONulDbC+w7pjfUHa
         C02g==
X-Forwarded-Encrypted: i=1; AHgh+RqYRUICtewVjYSe93vOCMcoEtlueX1DWf9/EWtgEx62wVZwOZTC1dY+/X+7tBpF11qXoWkRRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhCXtEksKy/yEC7nVZJq1Rj2kh4uWR/owRAxh0U8cMHXT3BwIB
	h/K8ytg16e732GNLmtgkNYBmoKupNP6Y4K6Ult5IdspnRclj+hYv2hXH
X-Gm-Gg: AfdE7cm6Lx6wjdMhFJtqFNeoFSrfBf6xMSR1hwocsNddExHuA4pJnYDp8YDqwOUfu7B
	dEQ88P2CjZg9JdsdxSgCyUXo2TCB1QePdMg/0yJB5EnUE/iUzcr3eNv25tnCX9Ru5Eu3/ktKwik
	VyyU6G4bAC8HIWgGMeYJuBodTyzy0kff5YGwju2cOkFCvZ2Nx6hqKZ6rMdk2XIUA+6D/gW29lzv
	MiE+aFpjL22ahyQUZ8qpCqZC5ZnF8TCS35UsG2eDjH0v/flkBIgJD/9T66h2bS6xOpZ6m5ogBVN
	ho06LPat+xYZUXXBiW/SP900yGUtZYDPTXGfSG4RMPg4d98p32lct1DIU3Za00uu1meBXJ8p7uK
	/q8XkWuVy4Rp1DorEAjscr3i5IY1qTP9K58toW3xyXZ7WIbr2U+F08j0jlx7aERZM/A3EiDWPQ5
	OGj9I8InSllIJ11EWPhUq+rqtXSfv/VuaqgcoPIhVbztekDYI=
X-Received: by 2002:a05:6a00:1708:b0:845:cf86:947e with SMTP id d2e1a72fcca58-847e18f5069mr2725220b3a.27.1783058227975;
        Thu, 02 Jul 2026 22:57:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:07 -0700 (PDT)
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
Subject: [PATCH v2 18/24] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:49 +0700
Message-ID: <20260703055355.244898-19-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l15.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index da64e0a1db28..2f30dd834709 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1285,9 +1286,8 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1317,9 +1317,8 @@ static void cs47l15_component_remove(struct snd_soc_component *component)
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l15->core.adsp[0], component);
 }
-- 
2.43.0

