Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9E23F5BFF
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692392; cv=none; b=e11pVnkYbp/gI2yHZlQQq5KZv76fWJhiWCJK/FqBnkOOfMR3h5dNrsQEACRnbgXfR9NhopUEHf0of5OSpzaP332tOansyxqlZrdK5nmy3YoE0ISaX7ZCylahKRXfFnxxNS2Vhkd0HQkGkoXovRY2fYwngh8SpIHay34yfaswVN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692392; c=relaxed/simple;
	bh=wDcPckElgAa4leEaZuFHYXPup44IDtUb56bKeLoBSxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iy2Geya/bS/cTGRSorTcDHEto/F2fGY5jMQ9Cz1oLN9LHjQVf0szLKG8LePa0ts39hKrLOr3TfC8APhF4AtpzBPaH8moNAVWYZ+/zXOOrERPErssFP1eCFwcEDmlGZL4Ran4DQ2x3isFhPtV72b197VEHRLa5sFdl1jDBHCt/GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/eNRwcc; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/eNRwcc"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so2331920eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692389; x=1782297189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xBbIRxBXS5OYYxHEW50Za3vbeVn2bnT2ZgYpZa7ur4=;
        b=Y/eNRwccpHhWe44KsXzfgPP2c8Hcu/YuWM3IZmLQnDumnqDKX5xxPznNyJKXJY0xpW
         pCscLzFPX/e4rcdtKnBZTgl4hPY6+wTxxNi4HyHIdMmCkjbba6XnEmJ3Ip3X5vobb6ag
         LUS5riZ8A9uRrgFCJxDy8+rPiYwNnyZ+0yyaQmEKJPc34fnz22B34LmrZldeqGvzYL4x
         RVA9RHQFTHDQd/IZ9346nwV+knYC7Fh+qLC82v52p1xQJLyXehQVrNounyrbg3KGeFQ/
         jNTqevjWwhlaHZ8Ov9lFAth+S3OdQbLkTajz8c6nmPh26strMhLdisQUuXpy2CmUsyMZ
         angA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692389; x=1782297189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+xBbIRxBXS5OYYxHEW50Za3vbeVn2bnT2ZgYpZa7ur4=;
        b=OVhLtZAmPxYWd+3QqlD+ESLBZCrsOKCnDIw4i+L3uzZl/gnCjsyiU5Sv1ShrVwW/R1
         BI0X6iHQ90EAdUhfw6cXxm8wNymQchEs7SAenS0UzevSGcK9wmrIspBcJfJrCiypUHaa
         lEysFK55PLRgwVlfQjNJDHbi+gXrbkRGB/nAW/tukyN6XUYKZxrwcfPocJAEZ9h2/aKG
         jStRo5q59h+g5/oPz6emjCUzy14ceqT60MKYed+PZtJIGUxmrK7m7GSyVCMNYt7fa5xM
         HvCF0g5s5xbZ7RSoN4yqbLzR6FCecH1uk7h1X8GH0OtA/uwy8m3dx6uJ1vQtfSMA9Vef
         JV5A==
X-Forwarded-Encrypted: i=1; AFNElJ+PWsyvJZGOQBNskDzZnPAC1iF39jVuGYW0QMwk/7KSCp6cB0/0tEHWs3VZMDOgmDchQLbv2A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6NTvEEATGiJXpTikxIM1p3uA60/H/phjle+aYm5manYQ+lsEW
	6faGpdPtvNn0tau0xKGr4VWC3+MS/OniM4f1epJNpREMB6+vSHqh7Xt/
X-Gm-Gg: AfdE7ckek3LBaUZ5tyArwX/PigWt2kVxNC2voWKORe7fJqzA/PboKqowKrWmXjYUP2v
	ByuK9EUSG08XDTAHjAPb6fAeJQ+9vq67NbBKVOPnnyotkc45I3W4sem5TTYKQ4wQuN+4ZVccBT5
	1yctyjdGgDJulnohfaLXoQyP6LRFxeDAyjU0lCDsupmj6Lsyc4+RfvhH9mfId41MouQTpCikZ+A
	bhOuy3sl3LKGzuekmWIRO6SSmlnqvUD3pKIXMEUd82O+hjZ+v7GpOYs8yNOyopgGAbAndGoCj90
	ox4o2fE+CEC8RAvrq3i9v1J3mmm3BseFYC2QA0bubuaEv/n3CyC+ndkJiBFhX5n9GB7yKwvvgmF
	2HEebOrMCzfazzp1XSkzoyLzI+/IvonttB787JBLh84Uc/8zJdNF4QOULrpeBFhIrlsTsloEjwn
	8JlC9t9vXnAzKaRA/i559jLqZMgdSawFgT/jJmnvBElhoadgU=
X-Received: by 2002:a05:693c:2d94:b0:2ed:2942:34ab with SMTP id 5a478bee46e88-30bc990c00amr1603108eec.3.1781692389024;
        Wed, 17 Jun 2026 03:33:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:08 -0700 (PDT)
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
Subject: [PATCH 01/78] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:18 +0700
Message-ID: <20260617103235.449609-2-phucduc.bui@gmail.com>
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
 sound/soc/codecs/ab8500-codec.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 6e8ef9cd1b31..20beb830fd62 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -989,9 +989,8 @@ static int sid_status_control_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 	ucontrol->value.enumerated.item[0] = drvdata->sid_status;
-	mutex_unlock(&drvdata->ctrl_lock);
 
 	return 0;
 }
@@ -1014,7 +1013,7 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		return -EIO;
 	}
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 
 	sidconf = snd_soc_component_read(component, AB8500_SIDFIRCONF);
 	if (((sidconf & BIT(AB8500_SIDFIRCONF_FIRSIDBUSY)) != 0)) {
@@ -1025,7 +1024,8 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		} else {
 			status = -EBUSY;
 		}
-		goto out;
+		dev_dbg(component->dev, "%s: Exit\n", __func__);
+		return status;
 	}
 
 	snd_soc_component_write(component, AB8500_SIDFIRADR, 0);
@@ -1043,9 +1043,6 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 
 	drvdata->sid_status = SID_FIR_CONFIGURED;
 
-out:
-	mutex_unlock(&drvdata->ctrl_lock);
-
 	dev_dbg(component->dev, "%s: Exit\n", __func__);
 
 	return status;
-- 
2.43.0

