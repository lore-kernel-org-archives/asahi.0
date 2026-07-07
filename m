Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE7737F8DC
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401215; cv=none; b=di04g5/+MTL1klr2px4M6RvylId3jr4P5vaQY0yNuTJ7Dbj92BLnrmce6Zr6Ao+RmQTIgohCbdqd/R4fTXUFAjPb66gxIrCkxVN79CPEA2vDGb9a747wKCIvFgjIwRaHWQ4CL20Fw/xL/7XRqz0ps+3nsP235PyzmjjLLTbL4Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401215; c=relaxed/simple;
	bh=U8XvbxSxSkTA8/Iu4yHaWeEwL/aIo8CQltei/BWFXwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2qkbmNI0LqIspJeCAmLJp6e6AdcwGpABtUZ8uMu6ZvpKlqYO0s2ULrwWcyDtR5Ply9jpZ2YXxkvx1HEiaZz/DJA4i8L4OY2Eq4U2ls4RuxS4dqfRVMQVvO/MwyC/WKB4w9JYduEyJMEHseBkYEbWUyfsWCTbwO0MH3MVF0mNWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcxgXlPk; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcxgXlPk"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso3751317b3a.2
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401213; x=1784006013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ov7owr1xn+j7m+V91q4r4G+6t07sw41en2G6nbW7Mjg=;
        b=IcxgXlPkP5d0r9JYy+91N9y4ovDVJDb7CbyPsHg+y1xL3/bVdZ04CzLV3CqWcxHPRj
         JpoZAQfjRSPMd4ke3RW77YsRgBHb5q+4lNy1GD3r5SO7nh9HEW0PCKTM1er8iOq4OqWv
         23Z1CMK0m7Ppr10egJACbTssf7dhnbo1/hGJpjs4QlNZxIJAic4YOpP+cC3VbgR21w3z
         bs/0hadwKVGJCuKCznvi/VZLbIGR/Os0Mr6oYRuBIpwORsjsDRhvIqcNkU3jBQa51FSu
         cWKjDMqRtqhSMGqti5LqF2bDdJ6czB2ZOvoR48xnhlPaclKJ26S2gI9RsZLTTmGA/QE1
         Ucow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401213; x=1784006013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ov7owr1xn+j7m+V91q4r4G+6t07sw41en2G6nbW7Mjg=;
        b=kVJDBZWQcDeDuSAjemPuhFIFrRdUx2Uh8TWjiB1rehZjk3VOAkI5GoVOwndDc69s22
         9AiY6bK+7/+Ol0voZ7KiTTihSWRWQyqap0xpvSeXpEQ9nKlhRTUb1/5TKhJVWoFrZmKx
         BLV9ysLZHSu2CrvRGIqbs9ZlsldGUYM/nIWvc7M/awK1AgFVqMYDEai6Jm6RmdY4Bfpd
         5k2bSlJcbNLMxYJsaxTCZFzcgaNcMeeBojzc+TzQUd7aq0hMhIR4TN/3YygvuJlAihuz
         Zqri7NDpgLMkalmq9HKS5Raev6JPhR5QkF7Ns9V7VRuUnx0L6oCHIKEBE7RNtcE3isQb
         pIfg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0cU8jwm5gECSDsmP/sT8O+5OjlnhGL1pf6kZtq7u5+b8e7sGS4zOViVNYFXMbxnk/2bstbw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+ZIWLAimmPnmFeTxQS9AFDgJS9T1Argi/CTKqKFPuCd8hFn16
	1Fb5943/Z2qoKPfH7EBtbQ5mv4yb37pqPjN6K5w+TlthZ9c966nz3YGX
X-Gm-Gg: AfdE7cmMv3UjlKDJwxVMdmyxPn9FL71+FzMXRjxGuWVxm+eHookUCRAZ0CV23oojQGQ
	sE1QRXze7hGBSiOQVaqCG9PQKNoD3I8EiSfB2m3DKnPuou3yTUgTo24ioigSoKCwBZSvIwX0hWQ
	rhEztQrNx8nApvXhPdzWyBPe2MB12fbo+wQZQhOJUQWCfL8G+vN8BklynqnAFUphezg5cAuqwtL
	5ZwmwM6TGqBqGiuiXnvbVltefh9+Ad+APBECqx2Eo/fsAwdUSTlOFKi0rmOz4cxROyJsaWwwtz2
	jXHZVVNp1AFt60uHJhi0eGm6HkvAHjfoJxY1mj2ozblrBRiHTgAetAIZcruP83YCDweulKm6d7k
	AODfEMjdRgrQZMlkQdiocwPpc8L1NOGifcwQlPUiJ7lq6D/9L7xOlbwFXGeS4tQWUeQTutMilWt
	KwQ0DKoYNXeJ1/2mezCl/wlvSJ9sQVMMxZGgmPA7NzWqUXKtw=
X-Received: by 2002:a05:6a00:3cd2:b0:848:2f84:f428 with SMTP id d2e1a72fcca58-8482f8504c4mr1181064b3a.65.1783401212749;
        Mon, 06 Jul 2026 22:13:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:13:32 -0700 (PDT)
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
Subject: [PATCH v3 18/24] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:00 +0700
Message-ID: <20260707051006.20058-19-phucduc.bui@gmail.com>
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
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l15.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index da64e0a1db28..2f30dd834709 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1285,9 +1286,8 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1317,9 +1317,8 @@ static void cs47l15_component_remove(struct snd_soc_component *component)
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l15->core.adsp[0], component);
 }
-- 
2.43.0

