Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEB63F0AAD
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781073; cv=none; b=LcXpjTPmhf3836mcqxTximm4tbg9Btsr/pRyGZZd5ftgUq6Wf4ExoFgrAXoyO5KgqjIVO6C9U8/de68WbOB7EKlrCUaxzHBzeQfRhDfXfok0x8zDTi0l2sxeVMYL4vRbiIImzyOBPcvKSN359VN/su9cAsjkDHuzJjzZ3f69fjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781073; c=relaxed/simple;
	bh=eziIqUM2ippJniFv9WY9EBHuapZTIBxPkHGk8fWEWcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TOsgYQNTt/xYn1dI7YFzKgOsVJUx8ySoCMPoCyVLeBQyOzGs/1R10oETJviNKFK+DonCZlv+xdw+nVfu7eW2s+EtH8rhO2wOTZXbg2ISXtwBKCp0SMsIel/o7lwY6ZcDy/N7A9/KdqlyNqEdmuoUOfl1/cprppyBkmdWoFrvHI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwuJaInJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwuJaInJ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf125989f2so5413635ad.3
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781071; x=1782385871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7Gk2MVQct5THK96rI7Y9OiiMBLGh95mss34zi4U46Q=;
        b=fwuJaInJeUkLueZz5awCASghOBkkTfYwCR/gRLMUCOXqPsR3PVix5FG5oJaC+6XyEd
         s4STePeBShxF8eSmtm5RzcvWamuEwKI3/aQ/PYIZCM/6zkSn4l9pn+wR08nCmNOxta7h
         /2+QmNI+hoYYl3btjKtAQsKqwAZ9fiREqSZzTX7t5W/mRDo+SWCPUFN69orHzNn1Sc3q
         ibyo5CIRxVYRYQulZMxqkCww0A3MSc0MFc62Gw0s7p0EuwPnfYdiosI1i4qI/569CjmN
         h7u9wVIHT9lz9V7oVS1HDUjpZkvgRFQKF8MDdkV7tNiAM6MuXtdUVPK4YghdCxKVyRaU
         Bd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781071; x=1782385871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X7Gk2MVQct5THK96rI7Y9OiiMBLGh95mss34zi4U46Q=;
        b=Jk8/EAWxUWq+BdvQPsQf71TB/TNGusLDGKMZVR3n9Qu2Eg2I7VSn5/CMcRBM5bbMpR
         xF4Vt7l+L4mL5x99IO1r9zEoufu1pYTX0aHs1KPY1EwVdkeOEElb+TDlWBGpb7rT2WTN
         WQR9wQdV7jiDJpY4ouBtKG9A9bEjpaAOUcLzGbPq2V9jOimZUICoAxDNjse+3LDKeYQX
         eLPhFz85VgVy1ld/p7MNuIjBk+GKI2YSpOeTMEKtW8SuyhL3ZqtZ7Hzw+1ycUfNRgD0U
         SwTFrBzZHz+GpAcljHeprPbWHdF4t/IfTL0XySuRwFCqwgG8dS5FMGq463u+1v38ZLdE
         2KqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MZqNWkppmpzyi+MXW0fk24SaGC7gd61+NnejZq+StVVYN3yEBCh+LWNvpndVH8Px8oDOEkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXe4zhCDZAAxRpl+OcvoqG27SFZWTy/k1VmAZYrA0tBdNo/IzG
	EajF5ODZukKwwP9jMw6VaUxoE/CJYxg/GLiYL296GLrqSgGV28DZs6V9
X-Gm-Gg: AfdE7cmE2Z1koLfN3eX46sTUCeOnIpqNJ7kXDBTpQmpYfQx4RLnp7hiySV3eb/Vk7xD
	2ITc4uNZQU2Ocbu/Jr3+d7LkOO1+sPpEWKUkch/6tuByxefvGCF8eJj2QNlkVIp2nspBCdyj3th
	S3hkDZV+oPmW9nXLc2UQrnTIE/JqG2Lpd6/80S4ziLZsWJgkjBVD2Uy+OfFn62KChXMdS640SrK
	HC94MXbrQbNroUcgAtxneHrYr9RsBRviEpxm7guX14qlblaxiy/tXbRa+N4fMr+NMTyVbyV5QHZ
	SlLaTECAeMYL7AGrudY3ydesBtcVs7TJbl83Yq9I1Gv/YiYUeYU+PbmJRkVLoQavroTNoreTpsf
	HrVtf6nWKhYiwhTKldkFXKgENKYOhYmPwtdSlbUNbO5HvSysCE23v6cS6sWTxQzELzUuJP+y1wH
	KHFfIfX/oBqQhYqF5vXX1YJ7qlcBC2i/UT5zJNy05oSP5PxNE=
X-Received: by 2002:a17:902:ecc1:b0:2c6:bb55:4078 with SMTP id d9443c01a7336-2c6bbfa1958mr84967955ad.8.1781781071349;
        Thu, 18 Jun 2026 04:11:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:11 -0700 (PDT)
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
Subject: [PATCH 73/78] ASoC: codecs: wm8958: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:22 +0700
Message-ID: <20260618110827.232983-17-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8958-dsp2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8958-dsp2.c b/sound/soc/codecs/wm8958-dsp2.c
index 8ff0882732e7..b6e5f1beb2b4 100644
--- a/sound/soc/codecs/wm8958-dsp2.c
+++ b/sound/soc/codecs/wm8958-dsp2.c
@@ -864,9 +864,8 @@ static void wm8958_enh_eq_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "ENH_EQ", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->enh_eq = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -876,9 +875,8 @@ static void wm8958_mbc_vss_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC+VSS", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc_vss = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -888,9 +886,8 @@ static void wm8958_mbc_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
-- 
2.43.0

