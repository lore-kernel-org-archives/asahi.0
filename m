Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D723812D1
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401102; cv=none; b=NtOd9OjFvBGqOmlElzga38ngYeLVzoZbTTH4GlhouuDaNiB5iPT/kJR7Bsc9w/fSAxZtVWGRwr6XrzWgXlb1f5s+8yluMrfXguIi34cvIQwFuR0PNt2Dosmgm3XzSW0DustGrM1vzaQFNTQq8U0lXnJd/Z2WL1NeSOdiHdai7Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401102; c=relaxed/simple;
	bh=6tATyni+4XjZvBeBIaoW6a1jvZmc4iKytcAls52Jz7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QXrz/M9KP8M4Aohi4lXYZ6SRBc74FKRjS5GRkHZyfb+tqMEWRkzFd4ddzF33cdnmmZCF8mk3qDAQRFoUPB2HoMh2sBVsWbuwY4osEJsrfRZB62onRXAzXsOHekK1gtJu6mA1viLBeinGBGCWKDSheFsrNFvKdhwQjLEpJ1VLMp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2A1kCTz; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2A1kCTz"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8478a25f268so2838278b3a.2
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401100; x=1784005900; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tT+JnYbqvqAEcwKG451SaW3hW/30F9TBA4BNUGiC6ps=;
        b=B2A1kCTzWOK7YmiYWZJo4U7U1ihcyx/lW5LBJhVR68DtIDQjgVJAXuXFoV+UvfPkeW
         lQkFkfdmFIYpiWGjhQQP34XE0tDKnZuIvoz4kmGTBFHzGGwAtEkeVGz2UTfua2j/DV5z
         L25bzlXCzhdbxt+eoA9kLBze2Kcr2PXdj5ZADUhAoJga+nx8nwVyNQKNCyMwJOytqelD
         KbvKQc9E8u6sSlpjf6+Bymk9PltWVTEiDN+05kE3fP1JKzKSxdiIqMRfnO1eATHyJUyY
         Pb+k5I2UO/eRBOm5ra7xE7R/O5E+FSrwnrUAicJiXxRZjc0baSEbbWj2jgsrNnBgOhS4
         CqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401100; x=1784005900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tT+JnYbqvqAEcwKG451SaW3hW/30F9TBA4BNUGiC6ps=;
        b=CS39+xYV4vL6XjBCHCwJxXuLywLoo4AYlg8Ow+KrCrvHPv4ruvNhXOoUGAxkRKsYQK
         mqdCFHX7VoCdQ2gU2Pz0yDoL3UtbjX1h6syvA63IIKomauIJJIzUHXmM/60Iam3URIkS
         6+iU0ZFQPyvL8LaqSMLVNGBkVipLnapbPJRIbvt4uZh907IPNVfOybJ9D4CMPbGfSNrh
         kBcT0mjD//U/wxqrHJNViXCaVLBFi2xbTwt7i7uwUMbC4wL3pXj+TZhCWikTKRmPcJHr
         qkml1LhbWqtumbLJASiyFjW93WTmyWy0dxKbJLzVe5N+iZlxnfkc8WSAURgOChm8CXQx
         /SoQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro88RuWVkG+z7hLiKvpU7u7N+nqadVgDHPzJwchEYSj2Bpi5tUbSWGEQXzze7RXjCazPxkcjw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/md66+mEDdOsjG7qeuLX5bHeqg6JFswLJYQDnAwDugrkPwyB1
	ELF7q4mX69ZQvuAPK//+M/G0/nONKQt1vXu3pKb4DVHyKczRkAXYkc5Q
X-Gm-Gg: AfdE7ckerKwMNAlbCXFp/YSN1jKXsgzSSvnyK5XY3Ncfoc31dVf0XE0OGABXSDNe6cp
	edB8BCXY/OgJnww4jqrABJTDLpm0CbIMlpXRSO1dil8REZqRLKk7iNmguaIYGIPrKJ6EzJTNWLj
	kVV5+8j2SpVXhs3KgOBo4dd2Xp+zdKlEE0YSp7yUpu764detOC+QNudiIiz6PJ2SmggGux5B++f
	k33GDwXId6aKgVeOKN6A9QqfIg986Xo5j3jAD074NHfANM9oRM55YwfXIYE4k/prnx5XcaJ8y00
	5EgbaCoUutMstpgekBhP/q/wJbl4Z6w4oWiojxADSuMpKZ68dO6c8TQ9yb6WTuF8rYh1qdKIQnq
	8y404/vBaSSCyA5PXzIoRqoId/O6ZI6CyPIWQKEuVxXI2MaOcgrIPqyJ9oJLBa+xo1p9Para3XZ
	VXHPHzwgsr62pYJcSyL9kr3yrFc7wdPlixR6XR+f8ScJZEzW8=
X-Received: by 2002:a05:6a00:1819:b0:847:9b9b:8981 with SMTP id d2e1a72fcca58-84826d3f6b2mr3361766b3a.33.1783401100158;
        Mon, 06 Jul 2026 22:11:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:11:39 -0700 (PDT)
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
Subject: [PATCH v3 07/24] ASoC: codecs: aw88166: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:49 +0700
Message-ID: <20260707051006.20058-8-phucduc.bui@gmail.com>
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
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/aw88166.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 3f15f4ac51f7..b72f87f677dd 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -1173,9 +1174,8 @@ static void aw88166_startup_work(struct work_struct *work)
 	struct aw88166 *aw88166 =
 		container_of(work, struct aw88166, start_work.work);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	aw88166_start_pa(aw88166);
-	mutex_unlock(&aw88166->lock);
 }
 
 static void aw88166_start(struct aw88166 *aw88166, bool sync_start)
@@ -1413,11 +1413,10 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	ret = aw88166_dev_set_profile_index(aw88166->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88166->lock);
 		return 0;
 	}
 
@@ -1426,8 +1425,6 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 		aw88166_start(aw88166, AW88166_SYNC_START);
 	}
 
-	mutex_unlock(&aw88166->lock);
-
 	return 1;
 }
 
@@ -1607,12 +1604,12 @@ static int aw88166_request_firmware_file(struct aw88166 *aw88166)
 		return ret;
 	}
 
-	mutex_lock(&aw88166->lock);
-	/* aw device init */
-	ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
-	if (ret)
-		dev_err(aw88166->aw_pa->dev, "dev init failed\n");
-	mutex_unlock(&aw88166->lock);
+	scoped_guard(mutex, &aw88166->lock) {
+		/* aw device init */
+		ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
+		if (ret)
+			dev_err(aw88166->aw_pa->dev, "dev init failed\n");
+	}
 
 	return ret;
 }
@@ -1639,7 +1636,7 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88166_start(aw88166, AW88166_ASYNC_START);
@@ -1650,7 +1647,6 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88166->lock);
 
 	return 0;
 }
-- 
2.43.0

