Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC4237F8DC
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401044; cv=none; b=NCrXiFccPjk/KPQGXStfN+I8O/FGTFD5Q9Q9fTJVA54q4vEXWGu4D/HXbA36NkNK4MldF9gygKDprMSUsKAxxhmREDPTniNWli1dpGtuk7xWCaN/cUH3+puF4J4D97pTfEHole93GLTRFGn2pEmBws2yZoXKkLD16Clw9hPW+O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401044; c=relaxed/simple;
	bh=MN7hjUlOeJc0FO8mu3UrzRrAKjy8hB3fiHLBiWptOh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocZLmcaj85Nz9v8pmPR+lP5q1gL2Z7x9o6tv/htng0YgnwjOxWSbKfsUsT2Ssk273PsSIbbm1OAJ+jJKCJLOve6xxz1auXZCpDN8OR8kMQvldwFVroP8tlT57wKj5iBrXYwF/HhwZyxHYRLpvbQM7pczTsp8UKzeTxUNpxuf86k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/S9whzA; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/S9whzA"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so3919227b3a.1
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401042; x=1784005842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//ABcZnuHlA1g5iBkAP8i3Vry09H6XD9kKuii/9o6as=;
        b=G/S9whzATwDbLrodHpaQynm3FZH5Q5Tt1S0Dbtn/rAAqtIFe5EbzL1AdIr32hhWT0Y
         DDVi3U1svWYzP6xdhniHALlJo4hHM6AtNqtePEjreZMyBPEHlGQmBjGSwdbR5r+ah/sw
         0jyAwVp6xmOUUT8ylXeRTFQlC6OM8qV0F1ExM7P6xx+qTGlh0LhehwT5Jg1G7ZUnbrrB
         A+ZnfzTV19qNGqpghvx6l14JhF6oqn71Nro9sBoh/5oOUY7AYHCi7rlUIRW2RRg+9+Lw
         X+Qhd/FWG4KxLIDqp0yxf5cyN0XStwIFp86RnT4X4ui1bh0KW4Yfer0vKt5bhXXRLeph
         RDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401042; x=1784005842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=//ABcZnuHlA1g5iBkAP8i3Vry09H6XD9kKuii/9o6as=;
        b=kbdwpqo7+j6U0tR9KrY2yfTzGf8YFc0cXqPOLN/KohEZoohq7sVDtcg47twcX1jcRk
         7iESokNBUkoX8b8ZCZIXF+IBw33z/8UwzEvX9Um00Fimghn3VaTvSjx4NwbFZRIeNTbV
         P0tKW5iv9gyrXTExgrv+ygueSPSQXkIT+AV3J4CoewVY5+umj7DfAcFYMUJag97q79pP
         nN1HZ9b7/ix/JZVrx28Vi41bmfhe+e41LlFz6S2vyxgKnpFiXAi5qYbgeXJodgpI7P9G
         24ASFF4HeVOO+PKLYdVqGNLoG4tpEILSOoP0jXnbpDAYaw5/DeaJ4nLP1zf4MGGWcO5J
         7uuw==
X-Forwarded-Encrypted: i=1; AHgh+RqlQ00w/IOWyuCdIN7AqunpJk0AzujlPE9sbU457GB2+EbuPRXb6ih+Wdm9oJ7urSV+3Vq6oQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf3QzbUqi1p0Tj3LKzlBolC6ler+DgnpGt4fIj8jvKfVbvkEcn
	Ie8m3t3xSbG1K0un79pRoL4c6sUl78FCB4O1lU6gdtiUlFSBSTSy04in
X-Gm-Gg: AfdE7ckkRdHja3qCHf6biD+cOFf3Ik4Mm7AIK1Y12eShOvAdD0/8FR8ajiU3UJVI8QL
	+QurfO4uiOlKb9P242LM5AlyCTMBXjGZq2gwrfkgMlBG8Ib0Ohh0xOHRMjqC5pIM5pNxQe8oW/c
	l7c1SdB87/eMMuWxxxEWGEthcKab8m6kXLE392Fgs7MgQ7ByyKe9/y02U8QGKRsKexedbHJL69f
	LV9feUuiol8msPzOHK5P+ByjGY65fh5LKPGcNv1JVl4EDtcENBX/uQoXm2mI0rAjTx4w6k1bprJ
	s2RnDxf/6hNj+6j2YUP1cVCkEyOq2EmX7KRcfyqAETqbhGLa12XRgwkZGHH55753f8MknP5r74d
	/IeB2GoVqHxkTVOtf2oFPGDNDu4CTUXw6sUhM8K/mV561/RDHpNiBw5B51e+cUTclADPrEDRTcU
	k9Q/518Z05P/KoIqWbFkdlLXnmWVFoPj4hENtPlxSGqIKtXWE=
X-Received: by 2002:a05:6a00:3409:b0:845:d284:9dfd with SMTP id d2e1a72fcca58-84826dfe4a6mr3637636b3a.55.1783401041829;
        Mon, 06 Jul 2026 22:10:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:10:41 -0700 (PDT)
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
Subject: [PATCH v3 01/24] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:43 +0700
Message-ID: <20260707051006.20058-2-phucduc.bui@gmail.com>
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
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/ab8500-codec.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 6e8ef9cd1b31..2cf96cbdd294 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -14,6 +14,7 @@
  *         for ST-Ericsson.
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
@@ -989,9 +990,8 @@ static int sid_status_control_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 	ucontrol->value.enumerated.item[0] = drvdata->sid_status;
-	mutex_unlock(&drvdata->ctrl_lock);
 
 	return 0;
 }
@@ -1014,7 +1014,7 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		return -EIO;
 	}
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 
 	sidconf = snd_soc_component_read(component, AB8500_SIDFIRCONF);
 	if (((sidconf & BIT(AB8500_SIDFIRCONF_FIRSIDBUSY)) != 0)) {
@@ -1025,7 +1025,8 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		} else {
 			status = -EBUSY;
 		}
-		goto out;
+		dev_dbg(component->dev, "%s: Exit\n", __func__);
+		return status;
 	}
 
 	snd_soc_component_write(component, AB8500_SIDFIRADR, 0);
@@ -1043,9 +1044,6 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 
 	drvdata->sid_status = SID_FIR_CONFIGURED;
 
-out:
-	mutex_unlock(&drvdata->ctrl_lock);
-
 	dev_dbg(component->dev, "%s: Exit\n", __func__);
 
 	return status;
-- 
2.43.0

