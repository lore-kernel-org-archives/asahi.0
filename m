Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C753D567E
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454583; cv=none; b=OhZEIQFR0UGZrDQew6PNbf88JYW+Fc7ViNwUJGNRb+Y6Bscp3rJON+wZUdK96tfYC7Pamv6F6z8KvlhCIOg6VO+xSj4kn8lIpmmVvy7pO3MvJBFth6jSmPNUKFd+CcGNXOs+RDbB2TPBdUoN+UzaXeZFT90s3OngROV43g7LiuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454583; c=relaxed/simple;
	bh=dHVEgQtwHDKoTcZP1GtPLCEn5TCpT4LbHpwMrUJxxes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=No324vKdUyunAKSZAEbiSFGRwH8MnXv3wp+XW3u1RzbvazRw3aBkJsTWd3gT4GNyo7QP1cprJA7RYbe1m+Ikbm5J8fbcQdsXuiobOxXNGhgKHh5zj4m/rr+hpdQEY+0WaC12voUlmVezEV+czkXvmNz+DKbCWECEEwt6tJq/b/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=St6B0iDD; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="St6B0iDD"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37dedd62b90so376238a91.1
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454581; x=1783059381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOWrg/LzI+sfMKMDm+nskCSh0mSa7CPZNcb2b72/26k=;
        b=St6B0iDDdaKeaZLb71s60EylAHQxBQamhhmXHZyIt6O7eBYrnMZ5ztnOD3E4Q7xHW8
         zONaMADhEM6dFVjBrCxcsZlt4U2gJfz8ruG2X06bZyKp4Bun4shUvi5FEYSVHsmhAgaS
         VxRyuoy7T/Pcmh10FxFnv046Tm5hdXW1vkgPpumjJiC17oJNn5lr6jcynV6u3nqDkH97
         UnnSuHWsQep/PgRnoTBZLBdIvNleorDSVmI1sbBIzJ49AvyOKhEyy2hRbTbG3BCvHmNk
         5uL6kCopLkVtJRJp1ToL092q1rlDOF61PnOKjWfkLGlKb4xUXd1kv+gcL2Iy5DgxFVLz
         kZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454581; x=1783059381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SOWrg/LzI+sfMKMDm+nskCSh0mSa7CPZNcb2b72/26k=;
        b=Ji7i8H42EagwxtRhZPdSD1Xw8XsjKylbQ1QClcck+Hd5cVIXNVzy1vWz9P/xzjjwVq
         7NQ7Z1L5t+I19ejW5klxDPKQifcjY3BZsHab4x4NukhzZ62Tn9fvlN6Ih9VzstXXbays
         SvU2hFatiLKs/h6MdG2dxQEcA8MKaR446ZBOv2lPQs6x+YnPPZW/EMwFWL7oOJw4cdkr
         8GQdODPTb/6IFGISbhaARR6uT444lQMHeRo/N6YGqzfuf6lLKd3wlmsSq4TZ5lw1dVPI
         RJw2tNa+gXaPTsEHo9Afq/+uSJv5H68aCROt4YYICONFMlAixMszCvfpHlJ7mWLpQRi1
         ozMg==
X-Forwarded-Encrypted: i=1; AHgh+RqWvA5QuumSi3gdllr5h8oe4XwIOHAj4Inmlxje20bN7gVuzQOqBilCS8/87muZemqBnQVXGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZEPZ5fo7KqW0QLriLd7dBIsaf70u5ILFRhLZdZQOfMophDqeP
	bTsTnLUMuTgIjC5dJoYp/uAl0PDJhp4ljiTf5sViE4MmHd86cN75vMGG
X-Gm-Gg: AfdE7cn/0a0cDmk5Iu8lC1mAyAJMIfkIwY8XgniZFm72QyvRQJ3ASolrcAzCPzY8CT0
	VnZOuOqu2y4Zkezz47F3Z4PcfYeoFfGj8yCaTKlRRdz3SsO9ej2JrhcY4abzioNpw6S+Abr6HCl
	gzgtntvEo3AeZ9RB0wGPz261XmiJTwLydM/xRzMDn4nIOtxRb8shDDPjuKdUmxR1MPewXAFRsJX
	th2YW6rMs6ifNadS3tlNoUr5TSz8qiMBwcYaeVufQ7RqG/eb8Fav9s28X3z3IO9UcamX2+0a2co
	NEjLyDLUVssNDJsjVL4uYGX3I0t6d3gTfem7X6MyTyMme+oTZs5Q+EYk2p3dtcsQ0I7BLm0zNoD
	nQs6cvD3ZnT7gNtNTUHD7FztmYCtRt4jEw3oLJyJYllyvpxrbWph1nZglPJnlIHanIj87sCTXhU
	sf3cjQgP4rruW4lN0W9n5IM1TgMwJtITcKXlKZvsrHvyJYzjw=
X-Received: by 2002:a17:90b:3d8f:b0:37d:9874:935f with SMTP id 98e67ed59e1d1-37dcd701ea1mr12987997a91.11.1782454581360;
        Thu, 25 Jun 2026 23:16:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:21 -0700 (PDT)
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
Subject: [PATCH 22/24] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:27 +0700
Message-ID: <20260626061329.23264-23-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l92.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 868237bd6d91..07bc303d9797 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1892,9 +1893,8 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1922,9 +1922,8 @@ static void cs47l92_component_remove(struct snd_soc_component *component)
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l92->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l92->core.adsp[0], component);
 }
-- 
2.43.0

