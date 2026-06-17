Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C39147886A
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692652; cv=none; b=jpk7lVDXZGH7yiFyn0indrQqerWFXfySwHD+DX8cusTKlRz4kIIDoCDJAaC+Sq52RRL04I6pO/4TN3wmPOxuwGU5OJepaxfZXeAM1bPvkIWCAbTiYStYD/Md4J33IsgMP/guI0sS0o4oCcjLQXpyOVxr4tX9S9Y52EA7SnSUCw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692652; c=relaxed/simple;
	bh=yMC2x0vx3J0iXo0ls0Nysns2s/4zDPY2og/b5u+3KjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TbTZVGRL0nybMhPvp4g6+Ekoj2a0qPYck97edC22ueyR2zM66jp5V2f9QsGunrckAn2pOUMVi6dLu/a4THNWeJPn4hZMjWbBmKgOkgT/Bik1e1WrDryj2qiSTnEiHqX8q8gje3/Q+bDVGiGv5b7z5J+KP29Vqnvhv1cw5fUlxpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSAPIX2g; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSAPIX2g"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so2337420eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692646; x=1782297446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eMqE3BBUM7YLjw0Y2Au39yLx+nag/ZXvLG1ZHdqVe8=;
        b=mSAPIX2grAkkKMY1tIsqcdjJWre/SxVSSey1x0wFtki+TU/idwxfDFAXIKqoyvZ/k8
         rweOcHkeVsZcqlmmX16ZkYwkbFFEWfix8EnedTJvZMGsIlsRKSO64Mxmq5sJGjK1iYEN
         UreykjIlepzfOwAGFi0OOlUbSiL+fAwbawnqbz/PtSO1iv/0Bxl9EreobjtPy044Ll6W
         uPZJjmP98CX6idWFlpip14N5MGt8JtVtR31+wHNPc2dv08EHWkE+qs12cjYJQmyFJoO6
         Def+kVR1jkdnnZtP13KDEBFwnIvC/8x/zlDw9Mq8ZGp8+8Olnh6qwqVf37ibWuooMO8U
         35Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692646; x=1782297446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7eMqE3BBUM7YLjw0Y2Au39yLx+nag/ZXvLG1ZHdqVe8=;
        b=O6V+PPzWpr/f6jf4MM0pjsl7SWf6f4ZkgniLISqpi57NLzehSgCf1fykdjAb8kP2Yq
         a6zivsT56wgREml2ZlQuEb417imrinxSqeZ4/BbEEvtuUwnKxnJuSKUTjkLYAQSlT3qG
         dmhIWrnbRzpCTJc1OstCii7a1YdATlWd8ZUsmSI3v2cXU9btnTv7eTue5mmSsDka5jzn
         OFdEGYki/PxcA6H69wEkTpftOF3J/rLZluQTiDzh4nrQSgDG8yE2T1uaZOpJ9TpJinws
         LchIsWlQDQvePzOxZhaL+O9S61uS55B5TouLqFPIfCyb1d5C4Ss7M23YC9E/fws0a865
         m9jQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xyAIe25Bmr0gaXinkxQm5iewuBfOZm+Tms79M1qLKLsbtL6eZr9MxYVsK0E6IhhyWXIJ0Ag==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb1CAY6IIjHzXV8VCwEi96BPqNFXfP9YGLpYIKlY6NRNfR5BXP
	YIyL9DbUqxorX1klo8u9gnr3iEJGXvCPivGkc0XANPU/4+gfBym6MbHF
X-Gm-Gg: AfdE7cnmg5+TDDlpfCi4iqN9PrgTAXxku0IdK5Yh/hVDPsTdztuxptVi/4bCA0ikG9/
	9WD9ymICFnWCKwHCdP+lt00RGQcEkKHfdc65Rr1uHFw01BXOx9kGcojAQt7rR5tdaDThherCUKv
	M3PpemlNTOE/W+w5p4F5gAWBer+ed1T+znyWx5N9tU6Gto1Mh2WQy2yisBbOoNDHu6pkfM9DN/r
	CHr21mrgJtboaymaxAaBd89HmzU6vz1+DFDpreAAPN3PVTcVyQ25zB5lEgBOhOog2vl4efJcKXW
	4uc24a5lG536fWUSL6zltiqUEXtx4aXqBM3SD8l1XOfgpbalVCIZSR0E18P8CkTDmA46J60wZFt
	2sM2Ory5v4uvnohinasrf3nJORMZhfwl4e4gyCJK48ru5CH/2x1lqA5H0jektwkscDRR0M2oUz+
	S9LrP1P14RDxDnarwbDyXQU94Ha9N0s85L+VISJ1Trzi3NXuc=
X-Received: by 2002:a05:7300:5b95:b0:304:ed85:5f43 with SMTP id 5a478bee46e88-30bca068312mr1553091eec.24.1781692646184;
        Wed, 17 Jun 2026 03:37:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:25 -0700 (PDT)
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
Subject: [PATCH 29/78] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:46 +0700
Message-ID: <20260617103235.449609-30-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es9356.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 670e918b56a4..1915cce09809 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -501,16 +501,16 @@ static int es9356_power_state(struct snd_soc_dai *dai, unsigned char ps, unsigne
 	}
 
 	/* power state changes are not independent across functions */
-	mutex_lock(&es9356->pde_lock);
-	ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps0:ps3);
-	if (ret) {
-		regmap_write(es9356->regmap,
-			SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps?ps3:ps0);
-		es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps3:ps0);
-	} else
-		dev_dbg(component->dev, "%s PDE is already %d\n", __func__, ps?ps0:ps3);
-
-	mutex_unlock(&es9356->pde_lock);
+	scoped_guard(mutex, &es9356->pde_lock) {
+		ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps0:ps3);
+		if (ret) {
+			regmap_write(es9356->regmap,
+				SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0),
+				ps?ps3:ps0);
+			es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps3:ps0);
+		} else
+			dev_dbg(component->dev, "%s PDE is already %d\n", __func__, ps?ps0:ps3);
+	}
 
 	if (rate)
 		regmap_write(es9356->regmap,
@@ -929,7 +929,7 @@ static int es9356_sdw_interrupt_callback(struct sdw_slave *slave,
 	int count = 0, retry = 3;
 	int ret, stat, reg;
 
-	mutex_lock(&es9356->disable_irq_lock);
+	guard(mutex)(&es9356->disable_irq_lock);
 
 	ret = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -982,11 +982,9 @@ static int es9356_sdw_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&es9356->interrupt_handle_work, msecs_to_jiffies(280));
 
-	mutex_unlock(&es9356->disable_irq_lock);
 	return 0;
 
 io_error:
-	mutex_unlock(&es9356->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -1092,9 +1090,8 @@ static int es9356_sdca_dev_system_suspend(struct device *dev)
 {
 	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
 
-	mutex_lock(&es9356->disable_irq_lock);
-	es9356->disable_irq = true;
-	mutex_unlock(&es9356->disable_irq_lock);
+	scoped_guard(mutex, &es9356->disable_irq_lock)
+		es9356->disable_irq = true;
 
 	return es9356_sdca_dev_suspend(dev);
 }
-- 
2.43.0

