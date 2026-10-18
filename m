Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2015348C6D
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302933; cv=none; b=RnRf1qZ6QJZD9UHzCtmV8p6Y1rHvjLV87oY03k7Va3I8RwpzuDtlvdvF3Y1lWmkL6++VYIIt+Hw933E1tJDxUOdF94OW3SDzOxFUTQPkQKMd582rCriGbidUfJaaMjZs8wDRhHk0EX+Vwe5azI4F3UPlaXkJhdsAzG8avE2B218=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302933; c=relaxed/simple;
	bh=L/QlyuMnLBDV61JQRkgIlDc1IxU9ojp/9m+G2x+efgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K3zg5yxfKhC5kzWjYgnFA1yd71OJPlwM1ksV10JMTknPGQFo75BPqLtRrhIdlWmp5ml7uPtULxPE/xaqWHXYNOE3v/QojQ0HIvszVMqmi9o1zGdD9FMeiVjgdfmyhc8+hiu29nA7A7s1M177su9k9SMKdZPo3fuMq1c/BBfuKI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N98dp94f; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N98dp94f"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1098941a91.0
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302931; x=1792907731; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8gbur1ARV/hJRgldNVfFQEJ716Dcvui6UIUaLYcvaI=;
        b=N98dp94fvdQ91ld7V678g1E+ibKZtRgeuYBRGuatrT1bMs30iV7xTmNypchYrvyEos
         k5U5DfcYwNYEBk4HmxlWCd5oDG1cfqblIL0SlUKNnlqphwZjxEqFk2ljl66TufSBytdS
         Cm0OpUACxvQQoAV9m/lLe2Qk9PWySLZQKRlYJoJDYHjQbDIlDzzfO43i8wxoHhum8N/Y
         JHPtlcNe8cHN4dA2MU6N6RTRsBuTLmQ6QJjTy9XK9cEiDVVehx+etxkypI25hSGaRsW9
         5ly1eU0gUjcuHQ7QlkGAf0u11x2YH7P1csu0N5qymvWDyrRqrZN8gS6bJBRv3BxqMKr+
         603A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302931; x=1792907731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8gbur1ARV/hJRgldNVfFQEJ716Dcvui6UIUaLYcvaI=;
        b=g9Z5f1GnGKflzU17d37xxv+cpjUeBAe5FYpEAMTkBjgQt6y3Ki59lbuGSsmUtw1cOJ
         egipP3gEzHWMGRVFPZgPGNvR+Rc/D7XPLRUxw/KSC/M28ITT8WOcjnQZmzhSrDsiu/VE
         YTDyiGFgui23Njw64QihvJFEHDOW31qhZlLRmWCkf8EfCfLN8MeWfgfJrmgb3GCaYvv4
         ueJ8kw/DyNZePxFhABem5d3qsscinOuDIo2DihbpRDy+NlpqhiQuBzMk+MFtnjLJRyw3
         hUGdc5Vw/J2qC86dsNXkI3vUqgMzSWYN/kCWywfY/YohxgBDtKvABb98iQVnrohYZpUJ
         NJMQ==
X-Gm-Message-State: AFq9FYKeDFIMNfhUeanpI8qm5r2nwE0wmtqQ9gLXL7InGUcUACsryTnG
	LXLQEYXr4YYSo0lpt/YPjjuSJgZDplV8n5HU80i49pfVO5C4W4SQJgrc
X-Gm-Gg: AYBFou1JlbkRXmHKFBZlCRexlDcQHuxIDL2g28EQmpDUySjjEkvZ55ynBXQvaZOOqyF
	AWy4z+hPURwcy14Mmpr518++Kiq2OPfQXWxF5574AtXFt7ovbt9/2vP8LDd9ExOcRGDekkIjzFo
	snA5mkG3JCGBN5oJt5vlTb57EZ8NuenahGnb/RXMw8rVWTd7N1zEzghpRPxxV7QkECZJ8xJXMS4
	s++YWV8EkRkBdQ2jJVif4lUQtEoSLfRcLIp8g9bCIKm03Ji3w7EkXVbmAY70aLH4Pd4YZoQdNtx
	K1qEc8mRZPKEI/kVbOF98/raPQWKJgUFnLk+lXlOem4LwihlaWNWs5KExG6n+de7S/d1bjN/+eJ
	BHqG6PYQ+7o7R/xsQT5TgFCw5z4bCO8zSprI0oLxr4itgcy8rkRDdSsGcqIzlv1BX7PvTup51f/
	yfwFarh0GtRRNJ3NK3kW6/uchLMBlHv0r/MwESNANNyHbvqawjiza02Gvc8wYEjNGXfgIs0iKv1
	kINPbQZyEQkR6QGyykR2ERU43LHIRe7M2giq6zIQHX1Z8Z8BW+XAo+rtgTXZFtVh3SCSRtdPwwk
	nMWX3DejVD2MLttpqBAYPri1iXmLQZRV69GGysASoobjSQ==
X-Received: by 2002:a17:90b:388c:b0:3ab:be66:ddbe with SMTP id 98e67ed59e1d1-3acef17b443mr4199337a91.28.1792302931040;
        Sat, 17 Oct 2026 22:55:31 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:29 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:00 +1000
Subject: [PATCH v3 06/21] ASoC: card: Let 'fixup_controls' return errors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-6-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=WKyXFBYrRnpsdpBs7slDgKqmeLl5GkYhostLo7OTo0E=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nl87T3eH52yiC/OL4kx8RDDVXlZQf9lU9a6vbxw9
 +IPh/hjHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKne8ZGRYX/F3ut5WcfvqE5O/rHN8cD3KUEB56UknrrOjWb/crB7ricjw2Vm9hK
 RRfx77sqoHRCY9KBn30OXzQzajz/9dbPNujk9jgUA
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
index dcfd706a73ad..a3b9d2610514 100644
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
2.56.0

