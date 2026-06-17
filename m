Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA32D407CEF
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692476; cv=none; b=H4JAqWvVJ6SHCwrw6j00GatbvbeoLmNkn0gN2Wi92UU8FgQP9YgIRPc3V+KZPNjMxh5mIPot0tAZKiAG4ea/fQ5h1fhb50e+807C2hnZeJaKBRMHdxuTdw6F6QBocs0sje8oMviKLTBACZjMaTjX+Qu43M1IJldv49BasQGOhSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692476; c=relaxed/simple;
	bh=YU9czEwBC/A7klxq2Qooz+npPYdUR9f5C6rwWaGdcy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d9lmyEw4VQVjjyLVh7sgzGF64+56wOg/hd8EDyoSqLu/tr+a6DU1zFcIbYrcLSSvtrKOge6zwVDLlVMpYoh1gRVPBizPpQ0ZLB7MITcf2W++B/zm+twEoRMzLmMtyaLFsqoh9l5skrfvkSoF9JLtf1nLhKpMkK9bXM8DWT5C6m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQKpvlTd; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQKpvlTd"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30bc806fcf8so1066562eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692473; x=1782297273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmFUuCghSI/8BuNtR4hfb7HGezLcFzfjMK34opjT9UU=;
        b=ZQKpvlTdwmRu11O0c7+UZUrbGXDcZ7DDPuRmoTPja1vGeuWCGiJ5F3EQkOAMrKGpi1
         aZ+Df1HN5cF9dBoAySga7B8nH836812yMGUKjlLIAs4hN0YReVOVnvb+Id/3rlVbwJRG
         Os4xcuIJB5qXY2WlyiSHumDaGfFAF8ozsFNxg0FZUUQAbip9RpSW2RaGjke9K3+e2cqf
         ZMok2Bj51UH2OyX3qxrxykAeQfmPUQ0mr1TwD0O7co67fXyFm/G5sfu0jAcvMKMBw1Y3
         3XdmBcCEHW2kf1CqWeQ7pgAyjjO/2lBemGlmgaKaWKCHLGnskxn7sUvCfchEqf7W7Ubg
         Mbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692473; x=1782297273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HmFUuCghSI/8BuNtR4hfb7HGezLcFzfjMK34opjT9UU=;
        b=Z+yfstbgsUgWUdHCrnUQJjWtCy5ZKO30Zs4B26L4z60O65zYA7NgqUWpk7uJWi9pAo
         XgFKMeK2Ntceo62eRa+bqSF7zD/vyhiTYXVB0TH6TLCt4UA3W6n2mOT4FWKIX9IYr27o
         0VWd17tLvPmTUKnyFE6GroKnId+r3tz1eV5nlZtxzDdV1AdSOI7saOE7ZnsGjWy+TIj9
         H4n+wQ6SKSb+kyNHZl0WGTWt2u9t6rVwhuZBaBWJ8H89QX4daIuzUaoIOEbWYrxQdwvo
         BU0L5DAS4HbfCG8mzyhGY0n2OoGwZ44OFeIk7KBl8dNB8w/9ImnFELoZM5mHZ4FSTbul
         Kd4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/9jLyXVhNGnGfXpki+u8Pokc7o1/BHMWkM5YRh110q9aDIla/7hN7eyjWSHX5lLE5zG1Resg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnLIUa6YMGBp1D3suKJyKwCVQe3GlPt1fzWZRtV20/2FZa+XQ+
	+izNV56TcfoF2z7zqq9dmhm1mnZ6Cm5V4IDXrleFhYC+KpZEeuvPFnv1
X-Gm-Gg: AfdE7clzmA5/qfoJdxOS+MH6CVzeOupr6d3ASBdGRFyan5oYPD/eCO2L8E1kWdwRvqA
	iow/5RH3RRV1864MfgwhKvVgz0A7GW1Ql0LFtIOYsfn3wW50ln86tk26UeLcYVfuC0HXJ2hzr0b
	Wbq+HN5x7TTWwVcPKBd8Fl/b8q88EivgEInvSvRVguq3oDUrdggcE96dNSULLyRWKUEa8bQNyV0
	4jphyE89k6z3WDcNyVP/W0fBe27BCY1PogTalMsr7tUmzjfy+dU6OxrLVGVmS393wuMnOYzKr59
	gNXhMptNzXapMM80+vQp6rxA/ZLJzq/+hcT2LpZe/lqxqabMUpktZTuztA83jZmlnGb8Paoo3gY
	ipeLIK3iM3ct22N6ieLEW283vpJFOuvwuZyIskikKy+QxGy0TDFGW7B4USQjlpA1MlEMPKTlIxs
	XYfzrdK4QfmAB5EJU8t2LMZx/Xd6J9KEFmFzGgjFG2XB6ZGU0=
X-Received: by 2002:a05:7300:2153:b0:30b:8860:94c1 with SMTP id 5a478bee46e88-30bcae21d20mr1485679eec.23.1781692472742;
        Wed, 17 Jun 2026 03:34:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:32 -0700 (PDT)
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
Subject: [PATCH 10/78] ASoC: codecs: aw88399: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:27 +0700
Message-ID: <20260617103235.449609-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88399.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index b2ec3503f7e2..5691d3fd20b2 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -1140,9 +1140,8 @@ static void aw88399_startup_work(struct work_struct *work)
 	struct aw88399 *aw88399 =
 		container_of(work, struct aw88399, start_work.work);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	aw88399_start_pa(aw88399);
-	mutex_unlock(&aw88399->lock);
 }
 
 static void aw88399_start(struct aw88399 *aw88399, bool sync_start)
@@ -1702,11 +1701,10 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
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
 
@@ -1715,8 +1713,6 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 		aw88399_start(aw88399, AW88399_SYNC_START);
 	}
 
-	mutex_unlock(&aw88399->lock);
-
 	return 1;
 }
 
@@ -1939,12 +1935,11 @@ static int aw88399_request_firmware_file(struct aw88399 *aw88399)
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
@@ -1975,7 +1970,7 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88399_start(aw88399, AW88399_ASYNC_START);
@@ -1986,7 +1981,6 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88399->lock);
 
 	return 0;
 }
-- 
2.43.0

