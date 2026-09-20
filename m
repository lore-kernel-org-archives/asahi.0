Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E8D3CFF6A
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880231; cv=none; b=ga5iMzYY7aaZG5objMjCFqXTkpQMrcmh2LLk3GnMXLsKnM9MPFUuU50lZC/F4bM1Zyj6b3Bie5iOsmZQTQ4lWCV4A4hh9SPIFjp3MOCbK8Tl2daLgjfBj4AlzmiW5S5Nu3AXSWZqDlmyaBIZpNok1k+hDtiuYyG+RzBvOkLmXRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880231; c=relaxed/simple;
	bh=zDu5vJd6sfeXYn8zauBK//VBQImq8vA1wPLHgVDUDsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kUBIdJGW2332zknXsX7AZ02K4iRfn8nY/ymLodRRqiWyphNMIKSRLiYwuFChxOKMeLoPer1BXJ9hd1t9QmbJSG+Q46JUKqnKl4/AU42m9joIPLq37s+25esbPpxCt/diPcds/OJ71ncbcscs+/aOAL69T2CG729fZHx7TnLkA7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXc2Im6a; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXc2Im6a"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f066d8so6963895ad.1
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880228; x=1790485028; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=GXc2Im6ahBD95aBg57Zq+wDPCvfpbUDOD7EktIYUEZCefv0Tia1HGCArLZh9loVTjQ
         vs2G30OV6Z/SzdkKpm0006k+/vioJzoI3S3dS80/g70aepBLMRNlrYJ6sKadzy3J/ygz
         8OjNXJLZrZIfLNYjXQiWH8SgZBnDGzW2uADvQlAc5hx8OxZvvEgrXfwWeoBLPs2/w93i
         tmhKBAY4uclqKp64nUJmcRcFWkahHYt6vRlUO9DHJ5E5k0TTxO36lv6lzlRWfNxN6GdL
         nk2zd21TDTnvzYtyybKioAPz8C8LSb3f63BBq3jeBOqp5d3HVFKo4e1NbegJxTBfr3DW
         X7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880228; x=1790485028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=euIoC/W7DBYI4M9epGYhUnKv21vSl7ZaAW9CQdzSK60nc37pxYTFR5fPCNp/sLnxyJ
         zxkw8wcuDN4caFG5CNfJLw+TvfC8YIp1DLJFUCEriteySOBeUb/XtxsM0oBtdjK9EHNw
         3tAhbHo0TVsBiH/fVxhtSunMY+eA+jD37r8YT6BD+W4LZqpb9I5yESLisTp071zhWypb
         4odvj9FivDmqZwn4y8FRGJrwY7mQPLC+7AyzER1zuxpRE0w+qvffbwsfXDaBpXyMad1N
         yuUhik9omClMR/xf+6luY4gSoNJbZV+jh6BqmY3RJcIjpWJN6MrHmfcZcatlOyesinVT
         LQUg==
X-Gm-Message-State: AFuF++mwV8uzGgqrMuGXb9W/ciMm+1vqMkkN45r5U22J2vqjTaf/Xr29
	Vhlk8YeNvrOuuZo8z5jYhLIF528RZ+VbmIJf0YXmeeZce6Xcpvg7Rbjl
X-Gm-Gg: AYBFou2Ee6ZYGRQWpshYVhTCdZU5Ms93l06oGn6gGrG06oSuu34pcusHf1cNbh+215n
	rwoOpPPItLL2ot59STOd/BwcG3GIBL1S2JOLs22hHa20sstq175SkHNhK3FMaFOMEHzh11TMcIN
	47upyKJqS/tsV1VxctsDxPXbF8gejoDPWsdFgVq1w9ZWpdQe58Zsrq3/bk/Cx96JosWkXW47ZNg
	EXDrXTxrmn2tF1zxCDWNkPCEPkndy8YoF/duHT5EerYU2AKClqHr5USV0q8CigWt4iln6KGS3D/
	wKN5cupwN7A2SxzHKVZW4KLjF0i9iyfyM1XVXhHO/mR60uYueg0zfYmxHI+d4elhYmGhiKN4PwH
	fm/wozikri8gR+rzF1M+GBYwwd78+Oaox/IMoefYuDXXUCGPQhdHmukjNLxyi/WhKpAriGFVVBu
	d1Gtg1xYRZ81d2Qvo/S0U3PoLbDIibFADlvyx4Wj+uPxuFnYvOwsReGD92oCUysJxSqlRxMNn1d
	B6N8wUh7bKCu5XE6X5UUTa+lco9K3piPOJKPNrhN/30VNjoNEc+RCBt+9Ech7pbs5n65SIqWDY7
	JIn+S/ewdwsDcksWNOmIDjHElyzpmT6H0WyCAPHchPJTh+s=
X-Received: by 2002:a17:903:1786:b0:2dd:c053:b9c6 with SMTP id d9443c01a7336-2ddc053ba3amr47265835ad.23.1789880227909;
        Sat, 19 Sep 2026 21:57:07 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:07 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:52 +1000
Subject: [PATCH 13/28] ASoC: card: Let 'fixup_controls' return errors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-13-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2WG4d/8EDKjA/Ac+P1A9R66HR3H99W3M7nFvRZ5lYJI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXbV/kqyabeldw5w2j/zMmctyr9Nt7e4LXyl2qa2
 mN+iVsSHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKnWTGb4H9DXG5xQ1eBqtVFoYY2L8Brh1RZyjQeO3XsbkSDNPeXYd4Z/iu2mXVX
 qp19ZtQiuXdPgxaSWP+vVtKRV37rcbndO7dvPBAA=
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

