Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CECC380FD2
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401129; cv=none; b=QakPaTuN5b1wU/KKcc/qGOzxuaQZfJpgtJHnXde7sRxJesU2FYLAbe7XiQdJshoij2HPzAUpC0U4iUaV6DqYRY0DEYXb4HBQ/zP1VSgqeOs37uoig8EhNurixrcpMKCCg9J5uN6ESKONMr6aPeWUMjp8QB0TRGuAA9iqbVbim/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401129; c=relaxed/simple;
	bh=FZJHEq+m+NwJ2REYxhVqqiGn9Us8YuJAuO/EjhxISdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kgvmhFYp/5stnYezePkSwAgy6WkKS3eJuckVljciKKwSqAUjb5fmK3KqxTn2SRgkupbAevck6ltM/C7xqYckBG/aWbyFitsikiDuFM6v3WZOlBWQSPuwRnEWj/nyJkTXPwDPPFsIhM9qLFa1cNfA/zARf79hteuMhx6pxAOUQCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gn7MWQUK; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gn7MWQUK"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-845eb7b96feso3611106b3a.0
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401128; x=1784005928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5A9Wsb8hutS/8m09pj/ujWNwrZYrSgIajODypS2rlzs=;
        b=gn7MWQUKGAVSad6wtztf/28tuHI8GWiC8qzXfJD9UvFV9LpXRsCH3OQPMJhTpPtKDN
         6emWvYP5oyTJmTFxMVQuX9B/eP16EHCiVtbpqYjtnbCH3T/UA4fcgDJ8OzjWLrcZ4eVt
         mR2xpGhCFL9QwJ/tu1D0u+2wLbx7LDSImTXO3O/s2q6Ftz47gZyFk/3E7appnXu4S9Kv
         EmeZV7qAlobD91yXDmYpAS8qfljb0msXisPA/s0avoHTpnUjF64L1n8Y0unOh+4Ckq+t
         xVIIiNi0QNdH/gucEMC7k4yv/HlZtO5DzBhUVNavBmrHklxBv19Dpby0t9d5KWkzqXmo
         poHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401128; x=1784005928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5A9Wsb8hutS/8m09pj/ujWNwrZYrSgIajODypS2rlzs=;
        b=FZaRyWsl4Qf8r7GWZugMw2+gkxxzEnXA2dkePvHTGGKXqt2qqO171tWNgj75iHswtm
         Kfh4PxDZqlex896/kcGtXpeKfLvevJSsbWMsOazbEeZPs4cDXWbZZkyTbu4jvdzRNKdG
         VHIHVaUrMowb/jI5z51rMODSocJ4vy62QRDJC2wRidfAO0C/PAFQyeJn5gDRncMTYix4
         A40cCT0PorUHfqVPeSQqMr/VV1fzUrrVJZ31LyUDnwU9Hhh4I+LbJTRKgEU4YI2AgGsS
         NGTtG/r/a4tBjQ1y/JAEqVZ8/IlL7fCUAnmhibLRVV9bysAYcRbzZcPanYdWB/eZhqlB
         Ln0Q==
X-Forwarded-Encrypted: i=1; AHgh+RoU3b/VSv/b0hlgSk3DuWmrJNQYnRK5GJh86Cgrz0aqgfs4TaHB1CXdP8HBZX5RehboSD/6GA==@lists.linux.dev
X-Gm-Message-State: AOJu0YydXaPQ1PC084LPk9MuoYs7LTQeel+d5ca7H+sSLiTpYKupoBlU
	9FIunKZlJmCCc02prmO8hqjvXiP4u8luhIDQcaCj8nIR97dcPTXLZkrXXXfGyQ==
X-Gm-Gg: AfdE7ckEoLnasCyQROw0L0agsDiem2VniBm3B2GJC+QQjH8iZBEIhqW3LH15+SoVVK3
	GC3UF2oC9cyp5tJdz0o7GnH/wV3UiMtXFpo6jJ6ie4/sSbOEbZRRRez0h/A/ZYrdYiU7sbFUO9H
	iXY3h68xubgrJkwukxz5EZ7IuMgPAZM4kxa/GsbGd2/S5YJaO1zj1O68J18D4nbtK3Miu2k2/Fu
	LbD/Ets35AOxZ7lnfIb/mGjMWvFzmMPIk5G6OMpCzp5dCver4i2stwsVYdxgslXPZxcfWcEW4UF
	VxL+x6aoC98xGkeQsi+XC2BA6xGufAk3L8DbGJ1IYvvWn357NAq5yYp5dusaxeZVyQYmt4QF/2E
	3QCBvLB6rZ8ELX6mmUNcoCWOgOyaV4Fktq/XP46SCKpvDKp3Ceo0q983S0VmoHQ8w6iNHi7F/IL
	YzhtdbYsMpNthD0M8vw54CpTtLVzCVmtDHYJ4FyTSnCmymBfE=
X-Received: by 2002:a05:6a00:bd03:b0:847:982e:cca0 with SMTP id d2e1a72fcca58-84826c0d8eemr3301028b3a.19.1783401127670;
        Mon, 06 Jul 2026 22:12:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:07 -0700 (PDT)
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
Subject: [PATCH v3 08/24] ASoC: codecs: aw88261: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:50 +0700
Message-ID: <20260707051006.20058-9-phucduc.bui@gmail.com>
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

