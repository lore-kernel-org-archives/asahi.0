Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E46350298
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058103; cv=none; b=uAlb8+Ljdp1KoCISAOYFgbgtBpqqVPmmsZTwmWkPXNMQdmDdxkTLP/94Uk+jkEZcER7l9iIv5S6ufwwKumh/0W2c+TK66Sx7pHJBAZbVm2CxGVLXxw2FG7urxSfBfzXFmcdg2h0vrDoukTjBekVpK+oTj99S+RdUthhQF277P78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058103; c=relaxed/simple;
	bh=XBo9TFWfRkkBDWeIBbEHSqFNAD+gQAnKPasD7gZlVgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLRHK0DcKD/jAGYP24EFdHyGy5FHFMfMCv5w1PsQfVyZBWhktbOxkphyX7dIOHmy46Cj6yNSexwzcy154l0AbcgZLgGxGEWPjWMcDfaGsTqbGG0kVoCWGBkK9BJ0kU/5SivwyCv+T8ykbY6wAntPIUGvAeWE8bFFxyKuOUlIY+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSEH7fcz; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSEH7fcz"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8478a25f268so122771b3a.2
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058101; x=1783662901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CvHhZDuh9KEqGXTaRtE+YpkRyUyzW6BE6haBhiMpzo=;
        b=QSEH7fczTvV1aO+p7CvPy792spFz6EgEOu4VjBVTbRNyBP+He7ZKl/yzHNdzUyRUZx
         D46Mm5UASntItrgcaHzb1FZp31FGl7GuQh+l8HJigcpLfWQqMmcUaGljBlKy/rya9MlZ
         7r2GEElOGYyHbueMXPlsaka7HCWfVhnee0F2nrhPeK7+EIJjgRphh62qEeqLVoL2llxU
         BW7chT6MY2h8uRydZgVBuIgCVY5fxspfYZ8i7P68k2b1EE04GQ/nRHm0CMZqEb1Xm1C4
         phXTr+PMxyrSJjUjpNGS9S0p5MNHeZGHfrrMnQw/TOZ+BmAy15Wf6IMrHZjf24M/l+Lt
         kQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058101; x=1783662901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/CvHhZDuh9KEqGXTaRtE+YpkRyUyzW6BE6haBhiMpzo=;
        b=i+KoRJTYr3Bk1wTeU//SQvt4fzTuatv0lGxlZXo+/rSxkrWlGds1/GUVO1PvzwVK2p
         9JpSYPzDrzxYeIkMRN+OribKZ9aca1vVAE0BzSaP305n42Co9o+r34IpENMHSpF5etL3
         2ve1Kwwq//c9pohtC50UA21gz6OmrXhE38guZOuXsOfXEHhPD+xxQO2yygvd8CWHq8sy
         qgITxAFmxlnXv7ogbwO7XNQ8YPjHwmOvsgLFhaKm9NUjBoaUvqeT3749RpTkfOsUSRzC
         odFZTzWYWaDJPYpFoxXV4U0L7OGmvz2v5csBj0L2Kft71ARRi+A7CdRkDSxSZEc/7I18
         nZKw==
X-Forwarded-Encrypted: i=1; AFNElJ++JG+8NdDzksifCFY5mZ0HolmFTamqFN8G/EG8hdDus4GTOtMUmWOiPQW9gmug5XfShhgTtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyREdwUXFnUwu+VGiGxOEiz4k50UaZoJVS0VfkcMysVMqNGOJak
	txvPvoqGSnj266nwFXoZ9z4IrflFRanmhSCS0q/SeHGFqi48VjAu59B6
X-Gm-Gg: AfdE7cmh0lMkDY8MhDrl6v7optD/XhUedj030fhesNNEPoYSGuhtiaSiDUqaOCJZrqC
	r5dNHQtk9im2Io8cAVt/2TPh/wZgpZ0gT0j2G6XcmXQkj6abAdebQIH4ANVjK9PFAftEHPmq+b4
	bmM2OLq4YtK3WykLntoiGmY7ZC7sJsm+rGiNBwW74oqHq8GASoPjI9V6vOYzCcYBHRSo7fcpfqr
	v7kRvO1CpUDjuTac5GkG3splW7avDniDTirPK66laFmbkIVmeLHoulctlBA8AEdYHbxuZ4XfiZH
	yl0jXh0jMWp7S9CSJj7sbyWD6sbwK6esA/OH5k357SqsRQsCBbdIUD7mq78BX1b5aWguB3z7bIe
	MRErf96eGLThOyq75y4ZC5+ixcAcKdafjNc8DesLw2VDmRUcoOAO483b9QOTjFDqo4ceM0zYsSw
	Mbg0SCBKhNxadjyDTpw46c9qZdUBUYPjStrGqPZonOld4JES0=
X-Received: by 2002:a05:6a00:9286:b0:847:823c:bdf5 with SMTP id d2e1a72fcca58-847c5140069mr7763177b3a.37.1783058101122;
        Thu, 02 Jul 2026 22:55:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:55:00 -0700 (PDT)
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
Subject: [PATCH v2 05/24] ASoC: codecs: aw87390: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:36 +0700
Message-ID: <20260703055355.244898-6-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw87390.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 020213e0ca4b..8150670fde2d 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
 #include <linux/regmap.h>
@@ -225,11 +226,10 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 	ret = aw87390_dev_set_profile_index(aw87390->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change\n");
-		mutex_unlock(&aw87390->lock);
 		return 0;
 	}
 
@@ -238,8 +238,6 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 		aw87390_power_on(aw87390->aw_pa);
 	}
 
-	mutex_unlock(&aw87390->lock);
-
 	return 1;
 }
 
@@ -280,14 +278,12 @@ static int aw87390_request_firmware_file(struct aw87390 *aw87390)
 		return ret;
 	}
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 
 	ret = aw88395_dev_cfg_load(aw87390->aw_pa, aw87390->aw_cfg);
 	if (ret)
 		dev_err(aw87390->aw_pa->dev, "aw_dev acf parse failed\n");
 
-	mutex_unlock(&aw87390->lock);
-
 	return ret;
 }
 
-- 
2.43.0

