Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4EF3F0A87
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780979; cv=none; b=a3mmNM7Wb5pH6eK+NWhKcUj1OA+uuG0+lMAy/xU0VS/GicMm7e/WGygwEnDciFQg3/uN1QfDssNSprAMS8qLBLYboW41HPRrUl+3HQVCvh+V7Ar2Dxz12icRR/YdVJCARr9wGERsibEJQvqr4EmcBp98a4SW8uLjamFEbasl+qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780979; c=relaxed/simple;
	bh=VveqHJbkYEX4uhQvFM0c21ksOyeuRsbn28lpWqPOOFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hN6S3ojwSD5jjjWOCudgspQtDcHsyQEopOxvk1866vo2ilolTfKb3khCuoARAQOhIMWe9TnJApJYb+HVW0sQwqmGSUksYtBBFEe97Zh/oSExOtNcUHr6WR9g0QSundc/zrRY4AjxVfEBFkeVbOUjl9lsrJiOVVnLN3GCkQw9eW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXIdc1/b; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXIdc1/b"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c88b7c92577so371635a12.3
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780977; x=1782385777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWJ/7U705zHTEAWXLYlWm+c6/Dx8tZg3vpf9oUByAzw=;
        b=bXIdc1/bq2Y3CCGk2j1dFj/dA5Ud0hV4JNRJ9IAyTnVwb8ooqh+vpIxSSfv0vKQtOM
         syCRGQ6nfj6QcVD+QuxMX1PBsLrZXr1n9WEwetn0Z9lR95DHraAH6faBCAQ94JN3a5CH
         xa3Gvfyb4mWMyHKQTxoiwHeFEU/tFGr1gpcr2VfxwOHgNjrhJOREBbzQ+vL9nHjC2haX
         caJfwP7T8ghNCIvzo5sVJiN0O0uhrcwit4kq5D/FH5wTuOSXuUl6RzQxYJ9nlSBlYAxt
         g85lm1EoepiugGfI3MzqaKhtANDU8ISyBj8WNzy2vLxUIV/Xd0/rtfAE/TiCQiu15gO3
         LWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780977; x=1782385777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EWJ/7U705zHTEAWXLYlWm+c6/Dx8tZg3vpf9oUByAzw=;
        b=QanXnNQbEkUWNexft2ckTyjyFR3+s0ITxiFxBvzEsAFSE2uzRVWIB0ztoMBVtddw30
         J7SH+hg0W9WV+XUED0Mc5cq4iY/MhMu5/prmEvcqojwo96IkraSrPoO5AbzAqcWoRoR+
         9hzAmit+lhaGghmtVcysw0SLG8oNfqFGI5htRMT/29IC1O5sPfVhUkSkl9zndmH3ytL2
         v8iquBOautaCwtF4k4WhjzDrgouHLc/UHORldpJOndUK0DbBm6mhrl8T0Uvvxgo8Jy7M
         vd2bJs+5lUxT01WIwA99WWg5kqLDqNmtf5k9bJxdza9gGE7NTGMln9Oy6diRxfNw8BPe
         DwFw==
X-Forwarded-Encrypted: i=1; AFNElJ8FfN/GBJvAsiCLwqXbdVMfoXmrCSIujBeYWlRQdkldpo1tUUPz+YMREGZOPYHshPM+I8XcJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmWaJtM/5wem49c5cMXspO1qYvHfwzzznjKQBtt8hXD8kB3wwB
	9BWHGLw2jUNSHLxK6hZdKkrN/sAq61QfXRXxyICmZ5aTGhP0lXQeuOki
X-Gm-Gg: AfdE7cm6s0wNusBF3bNgK1LFcNINY2yMKRxjWzzrrtonW8TVCZxrfPoIi8Mz/XUPvpQ
	DXxokrsO7s368kEDPtzK2bGifclZXmaK52KwLVfCfyJBo8kSwtG/oAn1qn3niHdmJSB2hLmHwUc
	50dT5MNu0xywr0FgrhTrTcSwkxLtGqWTdkqXl0N+Ae4K1Eixc6kpb6nDHglU2Qn/o+TBYqh08KW
	47SmAkiYS5LoE8vjwCpg6LstA85kik5g1R/V7wTp9KG/Qkp2Z3JgDCstRb40i/L9xWZYm+Cd7M9
	GUPd9YW4HfKE9RJGjuPibaqLVtZ9IEXqqpWdqMyOgGU9wqAFTU0QKgE1wnlROXEv8EK/WgqB3Nr
	loM9dmfi0P47uOaYiiYFW8g20XJH9cXY2qppk7zYGLiI9YDLf7yRWTiWaZgTE3sSvWhR5+dyC2W
	45MQqXGnP/mKu2d/MyZwl4X+kAHbMQQ9MmTf9SEM/spbZY5pooYyIpjNuPvw==
X-Received: by 2002:a17:902:f547:b0:2c2:c0db:964a with SMTP id d9443c01a7336-2c6bc23d4c8mr89883015ad.26.1781780977509;
        Thu, 18 Jun 2026 04:09:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 62/78] ASoC: codecs: twl6040: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:11 +0700
Message-ID: <20260618110827.232983-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/twl6040.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index e10c51092a35..6b18252fa8c6 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -273,7 +273,7 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 	int status;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 
 	/* Sync status */
 	status = twl6040_read(component, TWL6040_REG_STATUS);
@@ -281,8 +281,6 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 		snd_soc_jack_report(jack, report, report);
 	else
 		snd_soc_jack_report(jack, 0, report);
-
-	mutex_unlock(&priv->mutex);
 }
 
 void twl6040_hs_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

