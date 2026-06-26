Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8BC2E091B
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454467; cv=none; b=ZcArc/Era6aSA+3QqUakduecH7ZR9ZZDxWxy5fYa5LVZDMvpv53CZrdmR3t5I1Hkfxl8oqp960HpIdnGz9mLBd7MyZ8ag0zCUN86w6h4S0sGc1pv0kU3FG6VUyZg/JEQ2rnvTxR+qyT45XVUVveABxJBr3yEWJcPRoH0B1g90Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454467; c=relaxed/simple;
	bh=gtrP2bW1SWH+Wdjb3rDwdmnkXnip6p0Q8/DaEBD+ccs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xj29CCwGFMxFUpqc4pJu5KuGdjf5/XpzUg9OXYjb7WLbaaC25XmyI31azpNuLLTe7WEIOo0ihGIMkAFTN8lqGFSRKKhLNa+xKezhlYDt3Ng61hog3K4JHhUSTuodhIMFXDqLh2fELPq2CmuwTHbwHk+rPM2dzzw3PHhkSQV+Xug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8k39LGo; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8k39LGo"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37d55e8d3e3so320590a91.0
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454466; x=1783059266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hf6j86af5V0CMOW8UUCIPOBYEcGs8kFKB+l8jBsOWGA=;
        b=K8k39LGodkEuVKneOmbFTiduHefiEjeL5/DghpfgD6+YFnQ/5GvMCFdBl2fnE41O/E
         LyXZVnh8Q/DU+ayo2Mg/XZGt2jpeuzNOo4dtMVedVyrfKf89fGFAoQX6f4dCV2Xc0kNo
         UQ982/tR8KvUkhIi6qx44s5SMN26ODfatg9YJcQPmHkLCPlK98zuky39X9ucvw8b+3fa
         XrupQP5gfUQmP0xzEpf3OCwPrFZH+su60Kl+h8t30u4/5XP8ZkW2yVvMNCwAb/76bbOk
         ltsZXwaKcK1tGbD5m4w/vOq8zN49NovCseuJkxBNftAhnENc6JfbNi7ktNa0RW7NuBRr
         twqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454466; x=1783059266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hf6j86af5V0CMOW8UUCIPOBYEcGs8kFKB+l8jBsOWGA=;
        b=AuvXcr4RWEmhsFS/JMig3xfepejljE3juJjqZfwResFCzQoF5SOIVeSCM3svFMc+4A
         HLmkboRdTzpGxdudsvTZLpH/bfca9zyVSHOr2391u6cN0QenRKW1vXAiXDM8Np03wYmK
         uSNgVYCl6SwsHKeSP60v0RQaisY1NsYkMQkC5GuTqjYbcA8L+u2HgYtSzpIk69Imo/OV
         uP1HNlyBOg3YeNWuQIiQJPMNKD7AaIsm8x4Rf6cyIW/4rz+yKpsgHzatCWTQv08pVPRN
         J43NH1ZTjDE5yZtioz3FTlTU7RI/61bu/PUarq8tz6D14iniTK0Twcfg9IkLcxTqCgW4
         7U0Q==
X-Forwarded-Encrypted: i=1; AHgh+RovC91nuJAYsXsVQ1HuSQF030D2NxiU25amXOY8CB6MpDgmacXQ1NQrPrYzxV1+/OTTHFbnUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaxYAhc8ibYJYQkBJZzda1DacfryOO/ifw+hsi0C75BDJBCmr/
	7gmpAcYGkFQKpwKug883TwN42jKRSG+e0L2DSm4GEzVgqZ4vU4jOCGTI
X-Gm-Gg: AfdE7clhlNtd0S8WZcgX0h6CXX6vv5F229b+qcVCITW8or0M96BJUE6Kpl7PxfIQQiZ
	aZsqpsKL7JLqdXbTaF+vS27tvvh60yT3i15DqL+GG2df4n6IBU4+sgy08bivfY61bJtLd6y1rUu
	ZjnqvHnLOcBQMYjjrSqfNeQ8uN4L1RQw7kbBaul/tY9PGxFUvRYxoE0IiWMocfHDPJDcSXViv8T
	sz5oPolCGR5wllIAX9rPyU2/iWhrlsZ/c42zz/cskYFPzTP1eNdS/TqLjVnakQUMmmODPq/hXF/
	dAzpvXphpqaNUHxTeC2NC3SVcz1ZhVXV5id29TM6gYPLlenELVo/NQX0N9QiJ5geWtxNwLO5ZPg
	pR8kzS5HYmhYvdSPpzUQ9WflSg5JSoWbKnnT766LE8+voITQSiVUW3LIy+XCapro9i9BUx+D11X
	Zjq74ahtILzZUZtBFo55kdhU/TzrcWHSHZpMvWEGR3ADI7Fd4=
X-Received: by 2002:a17:90b:1dc3:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-37dcd66b178mr13297213a91.4.1782454466074;
        Thu, 25 Jun 2026 23:14:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:14:25 -0700 (PDT)
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
Subject: [PATCH 07/24] ASoC: codecs: aw88166: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:12 +0700
Message-ID: <20260626061329.23264-8-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88166.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 3f15f4ac51f7..b72f87f677dd 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -1173,9 +1174,8 @@ static void aw88166_startup_work(struct work_struct *work)
 	struct aw88166 *aw88166 =
 		container_of(work, struct aw88166, start_work.work);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	aw88166_start_pa(aw88166);
-	mutex_unlock(&aw88166->lock);
 }
 
 static void aw88166_start(struct aw88166 *aw88166, bool sync_start)
@@ -1413,11 +1413,10 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	ret = aw88166_dev_set_profile_index(aw88166->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88166->lock);
 		return 0;
 	}
 
@@ -1426,8 +1425,6 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 		aw88166_start(aw88166, AW88166_SYNC_START);
 	}
 
-	mutex_unlock(&aw88166->lock);
-
 	return 1;
 }
 
@@ -1607,12 +1604,12 @@ static int aw88166_request_firmware_file(struct aw88166 *aw88166)
 		return ret;
 	}
 
-	mutex_lock(&aw88166->lock);
-	/* aw device init */
-	ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
-	if (ret)
-		dev_err(aw88166->aw_pa->dev, "dev init failed\n");
-	mutex_unlock(&aw88166->lock);
+	scoped_guard(mutex, &aw88166->lock) {
+		/* aw device init */
+		ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
+		if (ret)
+			dev_err(aw88166->aw_pa->dev, "dev init failed\n");
+	}
 
 	return ret;
 }
@@ -1639,7 +1636,7 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88166_start(aw88166, AW88166_ASYNC_START);
@@ -1650,7 +1647,6 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88166->lock);
 
 	return 0;
 }
-- 
2.43.0

