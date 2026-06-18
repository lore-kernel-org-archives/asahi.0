Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794F13F0ABC
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781117; cv=none; b=SPDnCotciUe+y77QWC74brhBxRXQFOqhFKPWUWeK4o8Mzu6MqUXN0YZtKBjxRbsXKAEqLIYcPcZQhjAY7MGqjPmrOj98jZQ1b5o9wr5jTWHyg3Ma+VjKEkr7cID5SiONXxM/irrkVGuY4EAQoP65VfCZI2oqlYXpl8k2jV4JtKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781117; c=relaxed/simple;
	bh=AWgAFvAQViYaJeMV1jCt940qM9vOdEKhz9JyUk2u9dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPuXxx51O5GeSKXOxWKcumlQh0wwpYWI5lPmkWxKL6V3Pt9DmO+z6iiJpdleU6o7F/MiQ/+sAynyn0Q0iL7RXFBS4FHZ6PWM1/jdxJ+qViFHJqHNhSASVc9hUomvQUZoTZh7SIaYtqrA6CGmIQVV3RLnDjyWT5y5BmFIxmeQskk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEXvTmiW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEXvTmiW"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf1cda2b17so4854725ad.1
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781116; x=1782385916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJ9NJmLKLeH+SQoR6J0LdprGbIfcBLY+F247SPRpjXU=;
        b=XEXvTmiWq/Qbb6J85qwN+YEcWEZJCpBSJubdv3XCjh38V/p7xDae8aW+Q0GyFIz2JW
         IDpoyR0VR2Csb+qa4PnHrfiPyW+NSpoJ0QXYSAbOictr0N591fZVc//1wg6J5sJWoUWw
         ZrgXlPuoDhEHuSiMVr0cOnFDjixoDyN8VqAMny64L5qkMdLhIdCPDm69sR0bahGYzxjq
         sPKL6VpbBwh4w4dXAmiNvAMMIGsdDvV57PMcKc9qOYsUsxF0cKRvJCTgCrtcsonGDK7v
         KMdK9KbhWsh/EjLuNcMKJmzx8CaUW/5hIALKDTPZ390j7wjGOFib7Dt5eRhpHuk8bAlN
         omkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781116; x=1782385916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rJ9NJmLKLeH+SQoR6J0LdprGbIfcBLY+F247SPRpjXU=;
        b=PIHJ8913dIE/u6v/3xwrfG58KOg2HacNuCqm4Q/rxw1uD993C3INHanQM8T+PXOdpw
         dmciPWSv+hSzM97kOmZIzr0hef3ankcx9pIp2g5Zi3dZ1yrJLNEPcZ533R41I1fYf2bY
         VvrIndWDOlChnkd5YU9LpvBgKbhc3cQTPXRm4Nl2MHUKHwpg8FdmlIng8Dtt018UmjJF
         hoe7gn4t+u8wniZOsyHCNNq/vJnkq4ExdnixiAJCye4ul9SlbxEZE+ZoU+yX5apkQD7H
         IT4TsIuMRHYPGJmMKFR490oVxv1HzLEuM4rUAinhQetMkr6JY6Ai9WnvxdF4X/gJXb0s
         JQNw==
X-Forwarded-Encrypted: i=1; AFNElJ/31C7vCgYSTpgAMm/wW2NkbsqIFHbQrASf2oy2yisiJDL0Xjef1wQChxpxiPmdSUb6iYKQDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhHq7ZTlR8qXdv4vP6092I6VnjFVWBgR1/Uf1ONeGIZBkWjuYR
	DKjoC3pQq7RYDVJD1wVvqv9+uwor9IcZ8egfzUjVmKQN/hae2qpEnbhY
X-Gm-Gg: AfdE7ckT4vzj2i2hAiGp/Xoayxq1jX0yCtxhMauD1pd3GT6onNsJVpvsEhB7akZMM65
	OY78EZbsy/vjTsNFq+XZMkvi+vsF6ZtILcU2HsBj8DDeuafxYUsKo/hLra1oBDWKro6dlgCKfSm
	eOEpit1rhhAFfvNIMKwY8yXSQYx2o64d4ORAsWVaMX26hZr9b3f5KS0DO0pOO1B9nueni1P1WJE
	bNdeLtrH2tKgvipPK40MRlvHvfLyT+aMk1RoayHdkTiz74aR51DnHXptISlIx1i1pkFxL8/2IMP
	O2MstC6uEXY7cp6r1bv8GRH6kgNnbZ0NXy6t4t6R9eOs9INvx5YzVh9RGVQXizQ1Oo3pJOFCle2
	QHkgg9zvZdg0I2BmiFZn6pheNfVFY5tcOCxvb9AEXX3xmvc0A/RrK9bX4UFhJjyDc/5j0jpD5xa
	D5ZnzlM9ghG3ZUxFPxyKeyuRVOp5qR4HNKdRDq88GEerouX5c=
X-Received: by 2002:a17:903:3510:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2c6e00b0e69mr29505545ad.28.1781781115885;
        Thu, 18 Jun 2026 04:11:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:55 -0700 (PDT)
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
Subject: [PATCH 78/78] ASoC: codecs: wsa88xx: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:27 +0700
Message-ID: <20260618110827.232983-22-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wsa883x.c | 10 ++++------
 sound/soc/codecs/wsa884x.c | 10 ++++------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 468d2b38a22a..7d9e0ceba461 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1237,9 +1237,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = true;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = true;
 
 		switch (wsa883x->dev_mode) {
 		case RECEIVER:
@@ -1290,9 +1289,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA883X_GLOBAL_PA_EN_MASK, 0);
 		snd_soc_component_write_field(component, WSA883X_PDM_WD_CTL,
 					      WSA883X_PDM_EN_MASK, 0);
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = false;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = false;
 		break;
 	}
 	return 0;
diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 6c6b497657d0..89c560428a9e 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1701,9 +1701,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = true;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = true;
 
 		wsa884x_spkr_post_pmu(component, wsa884x);
 
@@ -1717,9 +1716,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA884X_PDM_WD_CTL_PDM_WD_EN_MASK,
 					      0x0);
 
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = false;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = false;
 		break;
 	}
 
-- 
2.43.0

