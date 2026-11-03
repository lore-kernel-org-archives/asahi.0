Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691671;
	b=Y7gme4WCwmSdZTX9blT1mL5ustrcSbSK8nlj7wz/xgIA/caGGTAlx0xMJ36d6nX0Bq06
	 7WxzTzFH/DpHVOICZXxsAo+NCycyDY8KaIwQ6upiy0f5WBXlATs9UC6DMROX9tf48MChV
	 +lRwlHzuAE/rJ11ZH4JqggUGy0rHkS6xVuF06prm3svt4TZtNnE9IcVW6hVB3VMVhs8gw
	 voQD4hl3oTsf8sFVp1X2BJy15ysZnR4Ee3cVCYIPks9XSI6+t9keE3rJW+ejxMb1BSzuq
	 i3Z5k2ndNKCqKg5XDxoZQH8OnV9bGEJZtTCs3jPcXeZxd407zk0YJ0xHCUbgupchbAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ZzVZd7Sd5nTndrVxkEAfFRXwZl3Unz5GPtpn9y+HXD0=;
	b=RWB4pOrwbzWA31gqn6HKgbKIFog/O8PPmAnEdP1RXFfCkYM9+C3P9G3X+CPu4ZX4RJYT
	 P2W6F2XlTQa/0hiMXgHoEDKoUSWQialmfJ3Mnu2XJN79PrQSJInCwilF9bTQ9CtMps9ej
	 T/Qq8Qv/94tJiEAkkUIyrgtq2F0B1yU8cHm5ccY32rEzwZ86UNa7NM0G8vaS20rIDquC0
	 utP5zWXoBGF+SbR5vPl6pSSp46dKpBNZkSXHmT8J+2cCVo2/9U2CuE0m2MveUG+cuJyX2
	 I2HGKem1coxxBTW/7wwxe4t2mR4I8DVppiidwVSCkY20aDz82uBGtUBCyUow1SFH5mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lK9f4qdG;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8204D606A330
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8204D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lK9f4qdG
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1723297a91.2
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691671; x=1794296471; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzVZd7Sd5nTndrVxkEAfFRXwZl3Unz5GPtpn9y+HXD0=;
        b=lK9f4qdGKoi+kjjyGUiHx0lWLW+yF5/cScftz/tC9wVvIGK5ecdm1bhOxRdk7idxdc
         uFBfLxiwOE9TWsxhXWGXKHGRMPvEbMb2DRmDcadKy/CFhOoOqeIUdcNPHqr7Qc1YpQIr
         Yz3w2xz0GcmHIVu6C18+Us2jscBuKGPUF3jeyaKO2L9XChd1B2+vXu5kAIquIavV2FTE
         417NkfLG4FIEtnT6gE9P6jCFFFrOJ7CGotCa6ECGxYjumHQhWu0ka3bxtCbnOqiGgeLa
         3jWy1BcQ4x3FbjQrFpjAdRZQxvZwCDbgRB/YBeuDY1MWwiCZ9neGs3VFx1egUMFc32Ht
         GjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691671; x=1794296471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzVZd7Sd5nTndrVxkEAfFRXwZl3Unz5GPtpn9y+HXD0=;
        b=cR9EmvZMjtYmFrOqxLZ3PR7JIDyHltpMYFA7AFtVlmoXWdQ7qSdESCOemzsMbKXUeh
         2sv/D7lQPElhEcULf/8fRakE42Nh8wMGtSuoQGctd4k5CqomC2+e0ipyQTFcq+m33aE3
         MYmyhZlAVhD3FcOOUpp1cXhst39auxRrBRMqZ9V5FZG+a7K6DnYcU24VntmtJxfzHIeP
         8umWfqN2qQlZA3PeVFuSethjsurM1ImJIWcfGK4sv2HbMYneO8vczetGHgoXbUkT53+j
         Vj0TMMjav9vwTadsuuMGEuxDcrbiY0kyV2VAjORGPKoilyrIiyAlfvWZCtUiiZN4Psj/
         6UqQ==
X-Gm-Message-State: APuU4Z/cW8Q5e5+Eo64V2qDVO38FcW+3nQoBO+2VLLZ9bi7NSbzNUQBB
	b1i5SR1O0rcFJsqEuVJWVY3F6Rg39RQLlzcmCJUwuC0Lki66TBfEBMR2
X-Gm-Gg: AYBFou2/ecCl3UREU7i6DZBnd3w9q/UQjc+ciAAKJ8Y2URbqRp2F6RrebX/WLKHFgfl
	3+qgPedTEj+d5JyIdfn6MVt+FDGuDEGu3y6TB/WsEJk/2Gdy1IWjULn0+96yKIm8KhEloR9bBVw
	MI5105JG2NF6MIxGA/vS8wJp5jRgmPbEmF+pgjHwAVESK0thDiVLqiTqWcDBmrlSz5NjEb7RSsC
	5v2R1HaX5ka4ua741nLA9R4uuRugsOL3w8b52GyHylrFhCtYpX+az5GUyzpJ8wiNgGQzeynyAzo
	zwRG/kWs2pYGVDleaZANjhskPk5ZYKTfFFeRp1JqllGnZIVpxcKvxx+FN55IbE32N2RvdF53Zdm
	5yaLSXuOC/wAvIfzx9veE8c4HBKK9V00E75YmgfskhlzVhxL92H6/wbFWcjEfv2HBwrsS3rUvCZ
	nsIyy2SvlAiMbNce6VU+Hf7x9uFeIeCTJX4xq5Dy5WM1eQ8DysP7pp3EL0H9eMVhNhJSufTFy+P
	xeC0rRQINRx+b+rgOzNR6pI3QbAEJC7Q28hOwbzL9Rr1oThE9gAS8jQ/uGTn8+Hw1KMC1AFzaFc
	Nes187XwedS6cbuhR9piq++NzHX6tL78c1nZSMs68Ckp/9ItOckH5Bw9nW98I4DUEVwrC6EvDMN
	xfRnkVsBcqaLn1WxFxpqr4l8dUj9u07GKduaR59+e2I1ZtQGhdI0Ee8Xpvss8RaeDxmy/Wd3oKX
	g86Tk=
X-Received: by 2002:a17:90b:1c07:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3ae897c9501mr9764839a91.19.1793691670795;
        Mon, 02 Nov 2026 23:41:10 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:10 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:55 +1000
Subject: [PATCH v4 07/22] ASoC: card: Let 'fixup_controls' return errors
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-7-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3703;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2OZVyHzqzH+8PcXoAdYlRjbU/QYAqY/WFwuuw7hvh0s=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88dv6PWURB1okEw5aSq8G7Wic51S16aXTmtcOFTt
 eLLV2z3OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFMdvpPhf2bIkuV7z5n6rp6tmH227+eD7Ie9ojtd1veKTHyVlxhwSZvhf+iWG13
 LWxZ/3KeeNcnGfUeJ1OWZzZXCR3bNaWVlULpzkA8A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Let the 'fixup_controls' card method return error values which will roll
back the half-done binding of the card.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-card.h                  |  2 +-
 include/sound/soc.h                       |  2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c |  4 +++-
 sound/soc/soc-card.c                      | 12 +++++++++---
 sound/soc/soc-core.c                      |  5 ++++-
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
index c77119f92dd3..771234028fd1 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -992,7 +992,7 @@ struct snd_soc_card {
 
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
-	void (*fixup_controls)(struct snd_soc_card *card);
+	int (*fixup_controls)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
 
 	/* the pre and post PM functions are used to do any PM work before and
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index f07aeb637108..f93e830ef4a6 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1283,7 +1283,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	},
 };
 
-static void mt8188_fixup_controls(struct snd_soc_card *card)
+static int mt8188_fixup_controls(struct snd_soc_card *card)
 {
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
@@ -1305,6 +1305,8 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
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
index f33bece378b6..d4743d68deb6 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1845,7 +1845,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
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

