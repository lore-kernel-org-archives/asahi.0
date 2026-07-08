Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2F343E9C9
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515097; cv=none; b=dANicXFpntCaju1l2W1X5ePmT3JtFy3Dnct1H3kgXr/DQ1ThlL35jsNZsZr9mOvg7YcucNMr6hmslPondlTqLU8SYMOATIulTQ5+i0BFXy9ZMUTTQDZQGOCzFTueo1/23aJHXUuI+SVOoZTGuA7iNmHiAkDHnlOZXNAskCzk53s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515097; c=relaxed/simple;
	bh=FZJHEq+m+NwJ2REYxhVqqiGn9Us8YuJAuO/EjhxISdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j1U/fTkLY0d/95dNjzg/YVe+u1tOe7Kd+pX52q06iWNunmtHbb2IcWD5Rt68Gl5eR/TPjiitKUlLVi5enMlH2V2Io39S69W6Mx+pCUVXuI6Qbnj+yHzEUS08F3yQi8a/yK68wCbKkQ5vuossAWVzj4zAKD7do/65un/BpEWpG1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WG0qnSmp; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WG0qnSmp"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso507611a91.1
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515095; x=1784119895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5A9Wsb8hutS/8m09pj/ujWNwrZYrSgIajODypS2rlzs=;
        b=WG0qnSmpkzQ7/BvAFwOEUA3nlrRxtB8IS/apNGdfMFtRRjF7rwQX+10JXBe8wDQlS0
         N7ielJv+Wr7xwokk8PCpGg7F9ZUkXc1vsoXmJU0TT6TD+OTnfpF8QOHkdY1NC22b9hYj
         UGlsiPzw5yc5bhvbwbpdjjNZDRK8CnTri9DR2VvWQcUyQfqpzg5wIRWzIXobg5BOIXF1
         0yf2ngaQvsxlZ8Gt7yZBuWDdaMHY0dbN3l/rkNHaWvshLjBMxVIecxHFlaq3Bwdtuib+
         4Afvx30hSbybD5nDchQsHdkNqZ3uLYpYEtO/ZQiyy6zndsIcLKz3+fXD6Gmktx1HHRH4
         AwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515095; x=1784119895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5A9Wsb8hutS/8m09pj/ujWNwrZYrSgIajODypS2rlzs=;
        b=ONKmzx4n/mHt2LDhSpl3ZhXtdNdCXuJ7cJ0GNL/oK/S7eDiNKxfJsvXUneEEqVFXBi
         NpoycjUz+uCRDU4tM2KES00LKZ7dxC62+jgJCMTAMsFsNgcVTZ65lg3G9Ql6Nr5E6/Uj
         nSKHTZEXyYTenna1UrpCFekYGHOnBUweiZ1VtRjbceqYuMPeJzNoJ15xzxQJZlSOvqZX
         Dd6OXbXHS/byTA0XMj3MDysW9Oj88D3o+H2npykXLCmauPMaON0e99r8DC5X11scyqS+
         jgOBGKDEyqcx5rnkCia8hljIu4yJL2wgqCv4oInJw7E36y4yGxhOoQS/Qz+cquiHd9FF
         icew==
X-Forwarded-Encrypted: i=1; AHgh+RoJ5e4ACSIgIsA1ZquWhH9EoqLUpETijrm5qO77N3SB/uUhm+6V6cU+Tm7nG/rDaZT2K1/+mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMXPUXp/pNZTTHWVVjeCU/c/g0c1YAlo4Kxl6zqmfO7ACcpaJ0
	TYo14dmtP00Tlw8rUrhtKF/snMu5s35s93Oq0vAvwY6z90sYs9wEnk/P
X-Gm-Gg: AfdE7ckpfEGJmzgyhMjGA1pHPCowuO4zktCXC6PnwCqJidivlLfqZ5d7NvpM8W/OEvl
	9FvJLVpduZvXy+ooVlfLhA3f+waFERXXX50ZH2RzOJLIZA6T9+saIp+yIH7ivPlQoGVYXs2FkpI
	9WpNE8hHnUw2cRa/XkvsMaq/rPySaUxrE1wLajVDgI6xoHyo3BI2t1mHNdb5axSyT5rncLu8EC8
	GL7tQ9C9OcnAPkCRN8kPx3HTnVUh8Ztue3hDANFsQecmuJJbG171DHFG+rzheniRUFl0xLNQp96
	xb20x+ym0OJ1DlZ6qZA3/dbcGQsjM9zWAJLXw44XiqAMghVrKfXIcmREPVzIx7FOuhPNjX6syDP
	B4J7sbAM0NFICvnLSFT+iJjNI2h01lQJ9xueFHHlLM3O5AHKVcWjRRssXl0OM7eyvP3WLnm8fSr
	xgh9D3ZF9j/2/u2ZKpDFRKHBg+oKqIZi33kkm/3MjZXJvw3sk=
X-Received: by 2002:a17:90b:384f:b0:37e:1c8f:3dff with SMTP id 98e67ed59e1d1-3893fb746dfmr2587279a91.11.1783515094892;
        Wed, 08 Jul 2026 05:51:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:51:34 -0700 (PDT)
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
Subject: [PATCH v4 08/24] ASoC: codecs: aw88261: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:45 +0700
Message-ID: <20260708125002.202515-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88261.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 549783d3e75e..b931b8602566 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -8,6 +8,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
 #include <linux/bitops.h>
@@ -960,11 +961,10 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	ret = aw88261_dev_set_profile_index(aw88261->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88261->lock);
 		return 0;
 	}
 
@@ -973,8 +973,6 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 		aw88261_start(aw88261);
 	}
 
-	mutex_unlock(&aw88261->lock);
-
 	return 1;
 }
 
@@ -1038,7 +1036,7 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88261_start(aw88261);
@@ -1049,7 +1047,6 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88261->lock);
 
 	return 0;
 }
@@ -1188,12 +1185,12 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 		return ret;
 	}
 
-	mutex_lock(&aw88261->lock);
-	/* aw device init */
-	ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
-	if (ret)
-		dev_err(aw88261->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88261->lock);
+	scoped_guard(mutex, &aw88261->lock) {
+		/* aw device init */
+		ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
+		if (ret)
+			dev_err(aw88261->aw_pa->dev, "dev init failed");
+	}
 
 	return ret;
 }
-- 
2.43.0

