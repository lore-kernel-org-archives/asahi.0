Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140273D5676
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454519; cv=none; b=psoqkJOmFbvqb/5FRev1oWxppLKWeAdTz3OxHWf+2KUVa+OvZZzj2uFinvPua4HUrzYTM33YMbULsJoIzmyjiBZzErPJ9sgVS+5eKYVb+vwWKsa04uZV2yU+CQ2aEshkJnjDIbUHj5AbheCw34kkDNyJDXrXt7LnUXEqsSPXQaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454519; c=relaxed/simple;
	bh=hI8Uif9OWfUC9nJ4ryYn5lVr61cKx+hjtfZlpJoMJ0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZQncGtTZoHjJchRBqHTN+mBTUeblY9YVm5qitbeb2GS/Mr5gMAZJQiYd3GEN9YlungbFa8vUaYwoddPE9rHFNMbRQRtRjhPe5PoiyTeRnsv7+Kw8Lm42+3rBw4PwDIxUrubdmi6l7iCRJAzBTKWLYD7lyxHkxqgWi81je1hgAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEhZLBIp; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEhZLBIp"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36b9d265355so293196a91.2
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454517; x=1783059317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUaUW9hyC9Ct9STDjbyAspp3HtPck/9M1aAPJx5Uwvs=;
        b=nEhZLBIpfnCXZlyb5uYR0WF87yGOU9H66eUPDqqLw883IGTbY+fRYnZ1IWJeaXOdgr
         EJ4lRi6aBfzWbTgYxHVTdklktRrLCxCKfZ8JMHAbC7bAZLx7gHsotJOTDRRv8zM9Xmqg
         kGOWXHte4EYn3niCFyrVysPB5f40dqj4EVpL3wN/dCDCGyT/M3gXb3CHEWDnC1HrLRFP
         je4/rIwz0V4KPNX4goBdnhHMQ5OOmAjNNEIzA/gQh8wkqWn50suCb/FrjkKA2U8c7KaP
         ZFifdDldGiZYnzA/bCoKYZJ60NxvF3jAcm375Jk5H+0IZw5TxgkOJ67K6uu70XUJQhbN
         ZSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454517; x=1783059317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUaUW9hyC9Ct9STDjbyAspp3HtPck/9M1aAPJx5Uwvs=;
        b=cz7epKVd/0D5A7zQ1BYLXxvXtKeMMu3NN5CHs+mrLR12ZhMZlgJkBW5/4wJEfA0mKy
         YvBui0eFaJ8WopIAn0V/IPTwye3haAQJKaqJzIMVE4PZYPL4wIkJwYeB6ur5NHfD27mi
         D+/7DCCGQ73iBxoaTtvSesqPBJNKU6tTlcIwPMKvL3BTTROIrq46wbhavmZQUX+/HcyX
         5CjDBO4+Z6aAfItAHfyHbPYkAudrO36urh17jyKn+02hWcLYGlwlJpodgMmiuiuFo70h
         IWieEPZUjha43bE75jNPSzkP2SKtXJHy77vomDZ9cA7wAQzgO4fKL4n4r1j4NX5H5ij3
         qd0g==
X-Forwarded-Encrypted: i=1; AHgh+Ro/L/EnScmlP99lkZSLLcepqssalFuVsJwqBcqQBL3kjj2mFq5j+rjtS8Qok2/npGtZag3a8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwadHl3rG6IJY90stfP0WxW2oIhGxYTBjVB9Jj8g2pgm9i7GC+
	L/UCgbdrynxd75QjndU3SYH2Tod/XLWcrZJcPsy/32usNThhb6Ff91KT
X-Gm-Gg: AfdE7ck8DIG+ZnC2BJHB09Zmw7l2UgTgFxprE7CIjytqOasOI57JwMvikJZA3ye54m+
	5tJOkvvowXGkoTuw1FbkcRMo/lL25OSxhBIEFwrQosTbrzuQmzZG+/wvRl+q2qtrMAYcHNDYQIz
	AlBZrekpn9t5K3K2RgO+zg0ouSpnZ1G+X1XSsdY7+UHZVvw8rXa5DrgP8cW/OJDFTnkFec1fR09
	+P8D02SM3rG12mUsXzYo/9bT3AWLOtlnOezDQfhHXpXclDxNAEWc5CbF+RbR5shYBxDJY8QS4v5
	/l9nFnhKbGsOaSbayQJgSc4HGNCQqoEQoVpPI9jCHuYVIUj5UPfDCoWbGFSBa/2FG9RFH0Felc5
	y3vIYA3t6hFh0gwO4vzidKZp7MRpmA2K2IVJdbI5+zlrHkfffEcmu3v4U20h0WlgostEp1PsVq4
	S9iEkLfWnaYa6NYcbbpNG0rTX6zSBsOMFsGWdkyNcFWX4aW6A=
X-Received: by 2002:a17:90b:4acd:b0:36b:93f7:a903 with SMTP id 98e67ed59e1d1-37dfa25a0d4mr5820315a91.18.1782454517324;
        Thu, 25 Jun 2026 23:15:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:17 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 10/24] ASoC: codecs: aw88399: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:15 +0700
Message-ID: <20260626061329.23264-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
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

