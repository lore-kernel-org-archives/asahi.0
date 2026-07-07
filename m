Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67F4381EA7
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401146; cv=none; b=MihBwg01cGEcuIZzcAErprEv4fY8AndWV0S4KWIsvvU0sOM/YFu4Fw9bU6w13b7f+PWZWuIYNs1jvfNnXlvnqJfrgwNBUur2Kj7saqm7T3Fo4wB6RYq20PIvdyFCVxYbwcd2SY3D//vU4aSY6fGawv665QsYa0cjwaPH/zNdHZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401146; c=relaxed/simple;
	bh=sCVUN8gY1h9/nIWRmRiilIKO/UTVoTdwN5d1OfxbJo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EbJC9xPRIuHLr7SliHmL49kY2ARwObhr8whKoNg4PP1IpY5Gbg9PjN72wAE9XEDR3q4QfvNQ1XLOUYrA0VYUtf1T2s7V/bxGiVAY5phxwk6JbHurqUCqtRf3N8WBIHgz8klSq7TLZL3NvHmDYx2e2XLwkdjwiEhAhO9U/buUz2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8aB6WsT; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8aB6WsT"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-847e6f03df8so4559390b3a.0
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401144; x=1784005944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwVA092wtCUoFLf5EkOcxNA70xG1xrrJyEkWDUrUIog=;
        b=T8aB6WsT0Iqt1XAVRElIiqTLXz69LqS3T8Eb4Ro0pQBtLtoilhQMu6V/Vux9bhO/JX
         A/L/+cimITlN310jJbirKRquO1J5oOaMT01Nq3SnY1wynCLJFpNMBMPjdKqO5rEIuBB5
         MVn9UmmrICmQo3Pc1Lqh6suypR8RNfJqRKyUHcrYCvFom8lrfLTX6Uy0+8G9wgBROfXL
         oQSB+oF/a5Jg+wKSJqOwSOX8C7dl/yuSxzX3ynzkvszO8Fhibx3r7QF7dj4/9KUQq1hn
         1l46V8XV78Gn5d9x4M4O1A+oH65zX3pYEFv1r9cw8YlpmtpZpCoXKKcVqXNs0uEG542I
         u7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401144; x=1784005944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TwVA092wtCUoFLf5EkOcxNA70xG1xrrJyEkWDUrUIog=;
        b=gIgGpdTby01EncdqloxYC1P8vMlfxBkaG88Tgx1/jh++7BHk3hPxTUJc2fKgifZmJU
         /g/LaOBFwTqNZWNj99WDESBvAlpLb8MI8+vYCKQTeGSbJfne5Lp1/fZ+sZ3bzA8PR/NV
         z0CZA7+QtlEAH0+NnMPlsPgtcy/+EXTv/W2vGBVqF6xiJjm1kBOe7MRNnEnEfbA4zfKY
         HOhePSzwpyPKPpDdTj26VLPigzOGwseodgKow97aKXhZ1T1fmJDxPohDkKjlMvGxLRTU
         71xmLuQomkmFLtXYZIAB564OZiRC9N3SP0VmzSufJmCGO0CxIzT6IL/JoldB5q8/Antm
         dXPQ==
X-Forwarded-Encrypted: i=1; AHgh+RohjkyaySeXbQKQ9dmSbwsZj5K4iTo8SVulFMwjpnhjMPDArGqP4AwDAXUB8X1HdtkvXBZCmg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/F94QTCmdB4gYAjMEQINAIQMA5RXb+QB6nat/3/nCVwzZok87
	xGaDMhFK1JaU0Ek3Htzhc7VGaj+6ZYWtTpNtNOaSYdjFRa7+LW4T2lRO
X-Gm-Gg: AfdE7cnNMfU8nq/JpYamcNjPkxmWyzW2VX0u24kUzOJ7AeI4H/ImSb208c4sBecPRiR
	OxXoZRTKD3bJ41/pRPwo5y7z5B+x0v5G9uEHR7wEcjTKkRBQSknhiQ4jjDT9XD94Zkw4sBoZwLK
	V7sjZTBIc4R22XgclqsRkpmjVvWS8NzM388VOSssRkznTk+AeztKHtrzSJ+S0qTxan6Jt9ILHC4
	5elLRWu7EQELf4LdbS61qm5R56NeoHVWCg/o4a5o7XBFFr7RqzqodMo+njdM+QkOEHMr4sIVPQV
	8cabR00NlMxS00N7WBOKkrLs+4MzqxTYsNH3MNufnLJw6mf8bDyX6o/wiuDoPiRue5OqoKB9+G5
	6MOilfxkrzOnCbx50zXjwkL6WNkW1wVSspyZcvFRZKndpKIk3DeeqUS1/Je8ZeoNC0yLfHs/399
	H5Rjp+0Gz6u/TZNhT0QR3I1t9Zc2rpx6a6y26MIXpFgsbbrOk=
X-Received: by 2002:a05:6a00:2e23:b0:845:d284:9e10 with SMTP id d2e1a72fcca58-84826e37c82mr3735337b3a.55.1783401144297;
        Mon, 06 Jul 2026 22:12:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:24 -0700 (PDT)
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
Subject: [PATCH v3 10/24] ASoC: codecs: aw88399: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:52 +0700
Message-ID: <20260707051006.20058-11-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88399.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index b2ec3503f7e2..67ea073abdb7 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -1140,9 +1141,8 @@ static void aw88399_startup_work(struct work_struct *work)
 	struct aw88399 *aw88399 =
 		container_of(work, struct aw88399, start_work.work);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	aw88399_start_pa(aw88399);
-	mutex_unlock(&aw88399->lock);
 }
 
 static void aw88399_start(struct aw88399 *aw88399, bool sync_start)
@@ -1702,11 +1702,10 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	ret = aw88399_dev_set_profile_index(aw88399->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88399->lock);
 		return 0;
 	}
 
@@ -1715,8 +1714,6 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 		aw88399_start(aw88399, AW88399_SYNC_START);
 	}
 
-	mutex_unlock(&aw88399->lock);
-
 	return 1;
 }
 
@@ -1939,12 +1936,11 @@ static int aw88399_request_firmware_file(struct aw88399 *aw88399)
 		return ret;
 	}
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	/* aw device init */
 	ret = aw88399_dev_init(aw88399, aw88399->aw_cfg);
 	if (ret)
 		dev_err(aw88399->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88399->lock);
 
 	return ret;
 }
@@ -1975,7 +1971,7 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88399_start(aw88399, AW88399_ASYNC_START);
@@ -1986,7 +1982,6 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88399->lock);
 
 	return 0;
 }
-- 
2.43.0

