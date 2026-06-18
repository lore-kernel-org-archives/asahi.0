Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E2E3F0A87
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781004; cv=none; b=ZnL2zlZI75UcYirncu1AmzfUkbzgcCUgeSRPFoLU9D8mZ2fDmCJWT/Fdp4353Nj7mM01zDItDyz+T+8g3dWf5ejsM1pwhP00Pmc5etqqL0TxnRlSJnzqEpwHXgMoDq2nOlJI1Og7ao7AElXBrmJFH9Td+4slgIbrJp2d6yBK9Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781004; c=relaxed/simple;
	bh=r4nP5iq5srzymqWd5sW1nNO9Ilz4j50vuTzEN76jxq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIosT3jeNw0KQQTaWMVshcWbG39c+UvfdjkoGeNHoIRmdlroWCGt1jTDhdnx9BJp/c0TScepR94be2UQzoaEPTOsU+GNjQzc6XMuOCjXzIInhjmUhn+FI7PlqCdMV7OoPLY7Flck2fQn5+HBvp56unGObMfIYIuh+86ubknQBXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVADuLw2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVADuLw2"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c40397e746so5401405ad.3
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781003; x=1782385803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml8Dfg8DiRS+hvlcBV4USOy9unLoDNhfJzJGobm3XwQ=;
        b=ZVADuLw21WhV0y/5bZDOivhWKdb35CkxA5xxqEPxw82ZJdEpq7gKqiBD+panJkPowB
         ZjfU0YHlop6hHzCwj9CEisQPcyyRp+yGJQ6yVWsaB3LrI1OZPqmW1KxyvQxiKIJwKDOl
         x845XmJk2TiSfnxfLdeLSgpgKw3VebYT7pDhTDpzitX4QKm/GVLQxuOf0q9D5SGkVcrE
         6BncuFyVUZ96opTvMqrVooDAuUFvm0CQoCKPFEbSO7dQ4hG5GOGWJ4glONhpNuqh5ay9
         FtPODEqMbiquXd1hm8o6Kjyic6ZeSPBSg2xalH7lgyGlGzIr/eTYsQ3U0mjHqy9vHUDm
         tYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781003; x=1782385803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ml8Dfg8DiRS+hvlcBV4USOy9unLoDNhfJzJGobm3XwQ=;
        b=Kc/zCWgL2AgM59ahsH1sZFIB99O4eIG33600PjcewzWmc5OycltcoPLKc43DwjF6IU
         2WoG/T609yIMqUTJ0qd6vJzqaJfZoJ4P78pQ3dkoFbEHnvFSB81OogiLDRhQiXlH3saf
         SgrZKxeEuRkEFZUuVfmCZHR6IkGAqNKBCI9QDwMBdTL4i+HRp+PjeBjVoPRyU7YXcE5O
         LUDLUvWLr5QAo8lpdxuq/EXbgCAiiNevHxPV1YaIKoCRbjY4uGy+DTqqPPTPyTsWqfMI
         5N/wbtU626O+P38lI4dCz9vWOQRSGcXVWnE6BI+/dfSDUsAFTEy7MQUXfv8nZYlBn4VE
         V6gw==
X-Forwarded-Encrypted: i=1; AFNElJ9Wwg5nw1mM6hHM/f7OzSMpLk020FWnVuSqBs5issNYyyAiOFKLEcFNvwBT94XGFOp2vqMuPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXkeRk2o3Qr4s9XNzwgUaxTb17nF0rou7vVdKfb8EDZykYo0OM
	KGPe9AuaLaOrrkRJOjV121PKGDmTXxh1NPPK83qr+0ArCj00OFptZJ5g
X-Gm-Gg: AfdE7cl0Q6sxshMArnP96B64upcomeMW01T096ppgEqy5vkqwxvVCQTOIM2Mz8cj8q0
	/MWh6aTeirkMSHrMWxFCGhQocnindN4QfaxSU+cEIloSIx6i/lHu7hMAAmZdG3D6FkCQf8Yz9OB
	rp4dQbEY/X5VyAdgdw7s0GQT0DSY6N2kqyRhdetX9oMcBm2f+MU3HOgZyaYRDVz86c28GA/DeKD
	44jQ+BckaMBHruZZRbw0pWyZ17MX2rwkDWqpNJ3Nl6CsaFhyOavcEmNI+DNv9b45A9t45JDW2W7
	jCuk5TQm0aEHptvrTVv9zh8lIqKBSo41Qgt7q7lAZqHPsX0knQ+S1eXs7jrffce+0v+eb7C9fLz
	MmkDi985QX2x776Kvv8/QJTNaAWb0OVPF5BELTUK4gRlXINFAnv36WYXOXoIbmcEcwmjcpWEYkq
	S8FsJ64Y4feSKjQ321QqQiR1k9+H184jueDtQS7c0II7QB9rc=
X-Received: by 2002:a17:903:249:b0:2b2:ec46:dfed with SMTP id d9443c01a7336-2c6f347409fmr21914825ad.31.1781781003000;
        Thu, 18 Jun 2026 04:10:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:02 -0700 (PDT)
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
Subject: [PATCH 65/78] ASoC: codecs: wcd937x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:14 +0700
Message-ID: <20260618110827.232983-9-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd937x.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index e0169e783ee9..8336316866ea 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -1056,7 +1056,7 @@ static int wcd937x_micbias_control(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	mutex_lock(&wcd937x->micb_lock);
+	guard(mutex)(&wcd937x->micb_lock);
 	switch (req) {
 	case MICB_PULLUP_ENABLE:
 		wcd937x->pullup_ref[micb_index]++;
@@ -1136,7 +1136,6 @@ static int wcd937x_micbias_control(struct snd_soc_component *component,
 		}
 		break;
 	}
-	mutex_unlock(&wcd937x->micb_lock);
 
 	return 0;
 }
@@ -1460,7 +1459,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1475,7 +1474,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd937x->micb_lock);
+	guard(mutex)(&wcd937x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -1490,15 +1489,11 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD937X_MICB_VOUT_MASK);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = -EINVAL;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return -EINVAL;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	if (micb_en == WCD937X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -1519,9 +1514,8 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd937x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd937x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

