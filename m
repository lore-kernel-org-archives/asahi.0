Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F463FA5D0
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 06:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093940; cv=none; b=k/xDXyBUgSq0zSNhCJKH4fe/FdjWNV6zOqWDt2KS2/YOiWi3jyCaORGI4enAHg+7GJR/Lz4nxv/XYrV9vImq5TmK+63ZKI1fl3LDJNJUEyIVW2GV0a5Y12qD2Wq9faxdAHs0oIyhV3nUTAdiX7i5C85zEcUJ5Jxzsg/HW9iJhio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093940; c=relaxed/simple;
	bh=zDu5vJd6sfeXYn8zauBK//VBQImq8vA1wPLHgVDUDsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9SCPejeEoQC5n9B9vdq4ZKlEMBi1zQgBDgRR+E1mlpSy7S8ewam92G+Kw4V6VEdM9B0VWX4E54gF9xeZndK3rekKAhzuPdjtvkxgoH8TPFLqYY/DdfOfR79bPDJOma2A9s8PjhSrYAmDdProiKlFECo93F/Qdey7/pi7Yp+yLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dk/sb0Vu; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dk/sb0Vu"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso529405a91.3
        for <asahi@lists.linux.dev>; Sat, 03 Oct 2026 23:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093938; x=1791698738; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=dk/sb0VuLcguy5OqYRHIiXMK5MyGneabTYwcAH4GK6rUmg9qBi9ijoDqsEXvUBndwN
         0z/EsGkp3GLqZURecA4njYPpttBwOkyjvUbruA7P6ugNXXscRbvUem6jCDClb4tGqVzz
         tcCuIAVefKLR7F4I2PuKmojdbF2Fer4ZpRqcoyBEREJcKrZA1TsMuWU1kHYfJFiUvqRI
         NYNfD65b3JDnrg5p6eNHzkVJQ6tFDncRjYmeOA2o3t6sBdMk5Y81IrIROhbNfqOgIlmv
         ZTbuPlAdDo1kuYCRKxCSLDpZt5ePTkKQpEZ5xNBS97NnCRatsLG44UoebfhbqeEByw3l
         FspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093938; x=1791698738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=gru0hdYUAHSRSvrKAk3UaDZJqKArb9QdRTP5HkIIblfNq0wXuOrQIVoBp4Chns7ESy
         Ghs+WH0QZS6OfBpjA/0eMaDuLJgtxYZ6Bei1lp+LZnzLh8X7FNDMyTJVl9vmNmZ9eiv5
         upjpbD3YleA+Z/qJlobEspzRDCU5zyXJZIvgd7jAAKbtIRGqV9lu7sgXPOVOPi6PIKx7
         2Ya6Gjqo5aPJtz8w/5NhZBxpihu9ueF/hVCMgqJp0YSqXxIBjOfRlWY2+I+2LwPQe1G8
         cLU0yTx8FQOP0+5ZAVavwlEhzpnV2EjYe7FayIJzsyCdXBL+YYNQKWUE8XRXa4cQ8Qx8
         VbQA==
X-Gm-Message-State: AFq9FYIgG60Hc0p+RYY3uTfV44MHxNreR8zRkhYXUVV9RH4c7GyBTUK3
	oRFrcMeeo2fB7EXWSapzFatSgqsPYOHnYR6aLcRPT0bX7aHjhNj17gJr
X-Gm-Gg: AYBFou0gk1kr0QVinX5tlPSWgkyasMPi2LEWJlh9Mcp4HojrN8SlcrcDHe8Juxy+Cwb
	LICw4+ZnjrS9ZKUoFCPy9rvond4F7Fgg5SnbjEAozQWmJW3ioANcFMyUz+c0Dd6ZDGQ+wg1BoSN
	JoC3mTUApVO2ICCmKyiLz8XlgMGFrWzkshZfSGNy3PPhxJNSAWirDg8ee0fVrzh24OxHKSwlyz0
	uAQ8OZoRynWSxMFxqvqPTqx5bv8npzOUp5XJXY13OQyMmeIpo/L+wtqS5rYYZ1JX1lAVLsxbsW6
	GidgffyANvKMtwf0fDG1nVcjf/VwwF71ItfUp6rl6awtvgL1Ebj9CsTxthZ0DwvprNEaURodypK
	EaWl6719lVPcpvlEieKJbBlENJZauHjcIcDZENyK9hPL6hJFNQp+eKs4Q34Pya1w/Qw7oeiErhT
	c2EVsFBplO7uQ6CAOYJkNIpw5uOkcop/j0YuGD8Qn2P4puR5haxTdwEtb/eUHVQyQ+sMOZiXNn7
	xhHpXBBOBmebPPDXjGFT9MpGVPEwujG5PFjfKRpdyknIcAsjtRb35zXcXCw02mjEy6Po9xPbIw8
	1yv8GFrsJqMb2vKNJ4dX00KGTdmjVunj++zWiPYjPJtDKdU=
X-Received: by 2002:a17:90b:1807:b0:39e:574d:3d2f with SMTP id 98e67ed59e1d1-3a786736764mr3389299a91.7.1791093937568;
        Sat, 03 Oct 2026 23:05:37 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:35 +1000
Subject: [PATCH v2 08/21] ASoC: card: Let 'fixup_controls' return errors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-macaudio-v2-8-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2WG4d/8EDKjA/Ac+P1A9R66HR3H99W3M7nFvRZ5lYJI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+S6/V6Rf+CQkZB8/d8Fh39Hzv1fkX9mK4PJDtM1F
 ls4/js2dkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKa6yZOR4U5dScnqLI/y+oajswwsflst1AkQninyhIsheYujw62rKxj+u63d4uq
 j8bA70sPo5VtB9qCwq6lvD/V8MKvXC368M6WDHQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Let the 'fixup_controls' card method return error values which will roll
back the half-done binding of the card.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-card.h                 |  2 +-
 include/sound/soc.h                      |  2 +-
 .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
 sound/soc/soc-card.c                     | 12 +++++++++---
 sound/soc/soc-core.c                     |  5 ++++-
 5 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 1f1e7d45f553..c392e6c4844b 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -44,7 +44,7 @@ int snd_soc_card_resume_post(struct snd_soc_card *card);
 
 int snd_soc_card_probe(struct snd_soc_card *card);
 int snd_soc_card_late_probe(struct snd_soc_card *card);
-void snd_soc_card_fixup_controls(struct snd_soc_card *card);
+int snd_soc_card_fixup_controls(struct snd_soc_card *card);
 int snd_soc_card_remove(struct snd_soc_card *card);
 
 void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *preifx);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index f356b553227d..d638fc69925c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1005,7 +1005,7 @@ struct snd_soc_card {
 
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
-	void (*fixup_controls)(struct snd_soc_card *card);
+	int (*fixup_controls)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
 
 	/* the pre and post PM functions are used to do any PM work before and
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 75c90d1d165f..14890af97706 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1280,7 +1280,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	},
 };
 
-static void mt8188_fixup_controls(struct snd_soc_card *card)
+static int mt8188_fixup_controls(struct snd_soc_card *card)
 {
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
@@ -1302,6 +1302,8 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
 		else
 			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
 	}
+
+	return 0;
 }
 
 static struct snd_soc_card mt8188_mt6359_soc_card = {
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 282d666dae9e..e4d81329cde3 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -184,10 +184,16 @@ int snd_soc_card_late_probe(struct snd_soc_card *card)
 	return 0;
 }
 
-void snd_soc_card_fixup_controls(struct snd_soc_card *card)
+int snd_soc_card_fixup_controls(struct snd_soc_card *card)
 {
-	if (card->fixup_controls)
-		card->fixup_controls(card);
+	if (card->fixup_controls) {
+		int ret = card->fixup_controls(card);
+
+		if (ret < 0)
+			return soc_card_ret(card, ret);
+	}
+
+	return 0;
 }
 
 int snd_soc_card_remove(struct snd_soc_card *card)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 06167a198591..2092373698db 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2109,7 +2109,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		if (ret < 0)
 			goto probe_end;
 	}
-	snd_soc_card_fixup_controls(card);
+
+	ret = snd_soc_card_fixup_controls(card);
+	if (ret < 0)
+		goto probe_end;
 
 	ret = snd_card_register(card->snd_card);
 	if (ret < 0) {

-- 
2.55.0

