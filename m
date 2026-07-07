Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A30382376
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401241; cv=none; b=M95aIBizQZGXnrXeQz6+LJ4vi7RwsF9OW2yrnfecCDQKcMTWndITz9DH9HmVgMfoLRLCW09RKSrDwTsSoGBxJ1pjOvUJ5OIOnf0zokeOdhesHtfj/+GLtr/PtQmRiGylnp9P2sr9hQpsJfgvE6TOghuORJBi/LM5RJC4bNwdm4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401241; c=relaxed/simple;
	bh=Le/mCnMQIax2AIs03vo6Mt8p3Vs/8n/EDxeqb34NEkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oyuCppcU8iTLhyyFk+aGSXblJlZm7ChHFYigqwnQXx63SyCxmFjh+cRqMEhIKAeJRCWXF0CKwkjEXkvTtsPcTOq27GqhLYkdHApTd8kOyw18kqbg3m8J7kVGP2bHNFCJ2I+NIOuuYuV2hU4FLKYuXqJGAfxuajF194PFvZfYleY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThQPgLnK; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThQPgLnK"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8478cc93299so4129378b3a.2
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401240; x=1784006040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCksePGNWGl91KCBVw+zp9IPALzIPsi0R5pb9fP1JRU=;
        b=ThQPgLnKPI95q1SqwMwKQgOp2PhhVXLR+m7or3SnYZxVCCDs2r8gFMTyN7wj5geMSB
         LrlHXIpvLn2TmPCTM2NrPfcvgQOeSZQS2XKTvoC06FW29Yhj1iT+YVjDU/lE8djeFpU7
         gz1uKXB+T+QzOPzdnkTNjDzFWf8IYp/+rQgOEb0jvJFvV2A8WMxYRHybO41bDtByw4xv
         IcCPJ/Mak8PKtaqAEdmbdWCUG8kj6AAt+vX4HlJWBIsCZ8XNP0FdMOdeijyAhMoimknr
         Zl7ttH+JSve360PMdsJWCWsb32zefvltF1znnkXJj10lBJPqfvEov4gnVXkPswWqNneR
         OUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401240; x=1784006040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZCksePGNWGl91KCBVw+zp9IPALzIPsi0R5pb9fP1JRU=;
        b=HxApwPX6pw//9486HYNPJt5ZkXV+AVb7lcBu+fc+K7g6fMXPsJD98nsmADPLaYK6o/
         PShj3MKX30H65CuWmR3WmAnDUVGQjekpkK9n6/aIbVvSgGbrWjtccwZeZUPjbNPEX/6X
         73RfjxUkqz3Gf39qH/qtx3NZ1RDAokkcEjHT7VFLHeS7gQqWjSqyEVGf7jLDgFFBjxku
         f61eDttNamxVHI3gX/bfV1r2obWFNDsJL3+U8E0UUC3LsQ8pla+kR5S5+ly9Tv3fhaza
         GIUFHqqpQAEq2IFAANNcqxASNgZxxbv4U1DuU6agvjsNstXeCk0qNl6EIfDBZvfcIy2P
         hBeQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJJcfKidNA0dK/Bb+VVIkb0sH/xqbbEwhxKFtt1Z3lmqUzhGCsMjSgXiQyXfmqn+UA6xbXug==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0/l49Q0m0JCa8c2I5YtgxM8vPpifYN4Uj0u0b0HrkvYiNWBT4
	FJB7HK43WfQJaGOfod9h40vUMoYyhRCpvCvhkvTLzfnoInG9Mvd9ySaP
X-Gm-Gg: AfdE7cm+O2czL2ZnRUHoJH5RLAuiAKu1GAz10nmq2UzlJg2MGHuhprmqsYFYJKz67cO
	6RQOheorSZwAdSSXOigQx6g95+XYdLh3TpnJnfRz6y3jxmPu8fpGePHygX0tLGAFbhGiHF7zmBl
	60Xz2IednkEpq6YXG8778MP4vMxUpip+uRRDGZeTReeEL3xQqdVu9COYZRkR75BTmZKPMlfVx0o
	T5aaKwdc8CRHEsSqT9lmLsF9wgmw5YCDB5KwUBr07pYlOm757rnqU2HxeFJcgBwEzeLP71h3dhi
	66vUJNSApFjSBMZUi7pZWEn5qGkq0qgelr+PQokVw1DDU6zx7LOoL2m4it57Jo3SJttB0BbiTdt
	GFdt0G7IIX88t/kxT7/jewF5zCnQT7LGEw+WIjiyH9nJvva4EnYjiJ0FFPlbGO3NFchZ3yrrGsl
	GcHsead4YBVk1bTXk8mC/k0vQxPntuUHOu+mm2REtfH+H814M=
X-Received: by 2002:a05:6a00:14c1:b0:848:2f73:8fff with SMTP id d2e1a72fcca58-8482f73a0famr1242874b3a.72.1783401239673;
        Mon, 06 Jul 2026 22:13:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:13:59 -0700 (PDT)
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
Subject: [PATCH v3 21/24] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:03 +0700
Message-ID: <20260707051006.20058-22-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l90.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 77e8aabb241a..6ce603bfd500 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2423,9 +2424,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2456,9 +2456,8 @@ static void cs47l90_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l90->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L90_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l90->core.adsp[i], component);
-- 
2.43.0

