Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C3C364038
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058265; cv=none; b=qNiTnENJZ9mQugCU+TvwzAoV9tektAYOypGeoZ27PFxb9xUTIPTlVB1nNGBwGdwZ8SHR5fQ3xrCvMAth/GDvqN4pdK/tIfsyw1D89FvqnLW2v+2HC8FBX1Jf0miKop53xyulqr0X80xDzfvF/IOSNedi/nilCOjSrTPt+8i2/QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058265; c=relaxed/simple;
	bh=Ni3jeRHp4DlPy1RmzG7RK/kEkCNuXoOAzxu39VyTUzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAFjXKFggdUfjciUMyGbbmkAMICJ/Y9VD6nawYJ0pQgMcpKwLiMKs9uDF2c41OR+2YatcbeHWaTpcnAyAprw1MUegPQCJ3uz9EiGCOwaSbCMSLy6pjgmKLMbJ9FSf9Y/lOTPg7oODv5yPLeioOk/NpYuJc2vheAxEmySOYcieeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVr2mKjf; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVr2mKjf"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84783bce476so197754b3a.0
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058263; x=1783663063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UdRFOubd4wsuDFKn4A4oZMqcKCsz7f8Lmrh1PllTRso=;
        b=cVr2mKjfodMn0FSMV6nfRCAmglyusy1TtomPUe628HgRbpz9PoUY+ILOjGuFMWP2hQ
         kosxMpFDjtDQh+h/sGjrQdFlNaugB1il9j3HRN5A8zZFCIbiDtDdX4sNmqjusg+XQ2hA
         wotOa2KuS5CvMNcVDeT9W4QkxDc+OsD12c1XqXtDBySdBG4qwy8C0KYqYq/r+LQeudAn
         pVA3ToVl5BLhNHNRqbzzl9ZCkOzZX6g52MxZ+nYB029nEweGXn8bCek97udnHDZjJ/6c
         tE6Mbu1pTIJmnb60GjxPyk/hDTSADseVapuksQ62vnzzFy88MVjZWSHkNkHkEiIFuO2a
         hTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058263; x=1783663063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UdRFOubd4wsuDFKn4A4oZMqcKCsz7f8Lmrh1PllTRso=;
        b=cIIa6M0mLkCozwtF1rx6IYmRQkDBRkbFcz+eu181zPFfAgsWWFS/h4STLWCrHO5OMz
         quQI6BZ8ESXL+KRWxNceqc0yc+fp3hpuK6+41eX+nw2hgx8I01fteMsQXF3oGWZaFgqY
         XVXpAXemMub/ibmLmZ5ORinnUvcV0OOSt0YFVK6TB1ect48a6hiD1/KOo7Vw5VFKs0IZ
         E05Cw8yZepR2yQP+9iDVUcauzaAZDbay8CMCdURQtJd0oKA7bx4FS7+3RkB/IT6Gcv3P
         SuiaVDO9y0waCmv/IoUdl5vP41qdxyTlNPlNYx1oChhbeqWCbXETB7d3NT8DS2BUp7SV
         fF8w==
X-Forwarded-Encrypted: i=1; AHgh+RrVEhAE3vcNSR+TiB1LiTAqMu6wx5eB/0Z3MjsWhIwsJbtgyQ7qaVgbJh4Ko7PySyCVzpKQPg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNUuq2S8XsQvh+Cw0dtTgFGQ7Up9l9atxzafOKUYcOvRw15hqg
	kUQ5HXa4gRXWqpTc8jZy5kr13Kceb85vLD/eHEUkaXhbHakvpHkxYJkN
X-Gm-Gg: AfdE7cmW8ep27ShzTl7shxIf+eiYw0zLZDNIvVgg3vYWCPAIJkMRw+WrT5JJ5euWpgX
	O2YlqtsprdovOrfLQL5ivLXK//cvvyrlzQu9lvWI6BVAb8rIjDrk12NJfGcisbr0njGn/W9ArAv
	1eP0VBHMcENN5RoMPnie4x8XT2pOosx5ncrZvMoBD+3YT1QTztWjPf55TzdDNJ1yMpkesjoSjT1
	vqyzN+B4R/gUd2uuXSosWPxaO1hYNt31BYkVqImF6vVqDncSNkyqPtnLhWv34E5cGSSJhwaL1M0
	SAebR8/H/1SkmHThxDhEptw57+vRgYM0gxunktN0jndy3o5vo6TXUOdGjXQNw5POKTmmyhyq/oX
	D4AX6quX1x9cxtfAIQ8jb8nxhEX2bqAUYkh5kPdhQpLcN7QJQAv44oY4AwYvuAJGHE/uNEL5JTo
	DHtRkzqC0+14CajLNXvSmotBlIwFZYEg546zQ/E+sQRPkBUgc=
X-Received: by 2002:a05:6a00:420d:b0:845:d286:1fa2 with SMTP id d2e1a72fcca58-847c0a399b8mr9016889b3a.49.1783058263154;
        Thu, 02 Jul 2026 22:57:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:42 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 22/24] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:53 +0700
Message-ID: <20260703055355.244898-23-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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

