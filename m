Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CB73F0A95
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781056; cv=none; b=m1zTpo+IZ2K0QHpOyyUDvpiKgcdql4ZxSyLra5VlRRzd8ah81TKDa4CVqOQsTh+OujOEIeDiu9hh9Z8cJsCqnsIXU18qxt39Rx9KuY5zZwFJsbb+sEWWzg3rbiU90wqt2a+lH8LQ7rxbjbS2fMgjKO7PGr4fdcEMSFV2j89CKQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781056; c=relaxed/simple;
	bh=Ua4hB6ZB7yjJO3B4WNFzsP6vzs4xxjJPlgY4HlGomMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+hd/wDUUhTkUzKtL73SUBPOzyjXvyTJTTs6NrXbeIAsrmuHpxKhPIJmgiH6JPF9LTegQH8P+pjWXz3VXrz7TZhCcHADnPKy+W1gkxy/3Fxy15fdF6PhevAWZTLRaLlTDeuhS0M1nZQbLvSve7VGARHEwEctdb4VCT3eqH3XTJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdDpPFPp; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdDpPFPp"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c6bb8a5980so5702195ad.2
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781055; x=1782385855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCcNg450A5ExAdoklD+/H48BhvI0tIIxQXlFkv59V9c=;
        b=VdDpPFPpTi7X/6BmcW+WQiAQrjPyHIO8cW7QmCzOySsn7+oTSEEvQppzrYjOLWM81L
         K0J2czUQiJ4z27pZ3FOCmMCktuBZGnU0tld99ElhPve6UCvcvt2Wjwjihml8Sm1YF0eW
         7rDZZPmQAhgfrokzOxCn60lF5z4d9FexNyqR4zPK394RefKr5b4W1uvosddnpzFgxiNX
         FRWaRTpSBoMUawX3qjWTtnU8uZ1Jtgp7dvOUFhKzPfMWUKZpj5CoannO94rR4KfSrSNR
         EoegD2s7tCHp1dv8btJ1Q+xwcU6Pb9ljBB8pTZTIrWOs7lA27xb3P1vOrWV27TPqTjpg
         3SWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781055; x=1782385855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MCcNg450A5ExAdoklD+/H48BhvI0tIIxQXlFkv59V9c=;
        b=hAYaSeEeYILERxPKTUKtqBFZhhJqzoFEgfKzvCl2u1f7n6WcDZTDRC+ig4RYtOuw7W
         aQaPf2+XbDccJEfIendKSo0XjNRFuBQZsNgh56mvKSLlEZMFEUvKmr2fwGp6pswM4tDC
         8oXAAJ59ROEiii4NVxXmAbbrIFlrK6eUaM6zXY8xkt/7V5ir2JL6Fp8rryTn13aO2SQ6
         MUNhGMCiaj8Qk5pXnY4rXMq4P8a3cJOfMW8g143GoplWOh1w5/u0m5PCx8JTzt3VHAbD
         lRuwMDNolwROc4jYouZvQx723+/DB3VQgWh3iD+8+pGA20IIHRVKnsYifCOGuPwkwkks
         ORiA==
X-Forwarded-Encrypted: i=1; AFNElJ8cU16i+0OQX8MUQ7i90oh6FUX9wdKG3EcN4MEvadS7wvntjEntMZp/8CxZVO3eb2uXez/lug==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKFpZQOFN87epnifz7TasU5Mos3wX1GEmJBLeF9nXz+mN6JcmO
	BAjjmKK+L9gdoyVbb4rl1G5uTX2nsM5UVsy9U5AHtsMvUbcFNOl3CdRy
X-Gm-Gg: AfdE7cmqedtg8/NrL6x4RnRi0gUW8ukAOWxljiPW9jwsQLElQ4dQclff5QTsahmfnXN
	54pXaZsFbAXAarxRO5gilqX+0CFaUPbSuyNAei4o+H3KoIdaqIJEfcf96FT+08MRk6nB5KooeIB
	lpyNTEgdQX7qst/hGHg9IKFr/ssIeXoz4+FvEktO90KpuBBR6cVD8L0q22LwTfKbt5XGUrA/K6t
	fK60m3OwxUWX2ucI3KoPBhIgmtNXXklXr3fYj8BwI1D7+D8JAFlkYk1EpkeNnmWUqvSdzgMXJ75
	2Yld3lR1es0BkVAatG6AuqxCDS6qkSNGVRukKLODQvB6Cp2HZTAa5J1SsrkKHcE+4hBbj1rCgAW
	5Ce3GeZJM3xYUWaVkRvHg/tuSHEFCw70m2rF6yD63PSXX8eKXv0kasHJSBX58yFkjQfnf+CD84H
	+agKp18A6IJXbOD5AisBj7PAocfOKg8YfVRcvIjTaEksOrVAY=
X-Received: by 2002:a17:903:178b:b0:2c6:a487:f431 with SMTP id d9443c01a7336-2c6e5276170mr34746725ad.23.1781781054643;
        Thu, 18 Jun 2026 04:10:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:54 -0700 (PDT)
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
Subject: [PATCH 71/78] ASoC: codecs: wm8731: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:20 +0700
Message-ID: <20260618110827.232983-15-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8731.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index a2f0e2f5c407..ff004c9e01fb 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -115,7 +115,7 @@ static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8731->lock);
+	guard(mutex)(&wm8731->lock);
 	if (wm8731->deemph != deemph) {
 		wm8731->deemph = deemph;
 
@@ -123,7 +123,6 @@ static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
 
 		ret = 1;
 	}
-	mutex_unlock(&wm8731->lock);
 
 	return ret;
 }
-- 
2.43.0

