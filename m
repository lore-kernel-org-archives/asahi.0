Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD00222DF9D
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867827; cv=none; b=HS5AUsh657n/XgwvbsA7l20viE2TJB4t/AwG7fTxghJZBjbN0bjQfb2uBoc8zZ1zXaCQE2XRVp80EeiZ9HJgd/N9Ss18s91Z9dXyE06eZz2pYPa1li4PvAjpMhv54l/NRZSOFUWDRSY4AIQM3UbRaWEWEfDJo/hhv9IJdwYPKk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867827; c=relaxed/simple;
	bh=zMDQYtcRpt+4jFNPlg46tVCzKTkoPkLv+Vy2wz6r23U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bT8bAPddTRWbd/Zal9o7PgMa7dQaTWUiQHN2IeRkINPsDTWuDZHca4igP0e2i0utzcHzF09Ecbg7DLYlKWmDhQ9UE1aut3KPAko5pSakhDJc4QvQyiNKOvIDA4O4aXZTddlrEi0S35blJpj88UvcEf/LHGTMmrChELhQ7taVF3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COm0HFE9; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COm0HFE9"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-220bff984a0so91891235ad.3
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867825; x=1740472625; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1gmUMyFrIcKimBewI6q24dJKcEuoHIJdBxmZAwxaaE=;
        b=COm0HFE9+Q6Pd5mkeUSup2MhBxGh3+Ry3RjqJoLMa6aeNQfV9y88xkbk75PbDGp1gt
         wKZhTnl7vR6vrtPIr/LTL8oeERfbf2zVI03BNQt7G29u7aVwIML6DUDDS0ICFEgMit3/
         +m9mX+Gl/wqmq5U/55nHLGhU0EXeoQhD6BT8TW11HbXNtci8speSqsCeE8XZ16BIkiGT
         kvAm0BF4hySVRY5Md73s7ubU0BMIxgxFfsm//x7qsuUplR61E5G6o9IGkuNJLbcOGQgc
         Y0W8sg5tLOiqytPzSNym8N9KT5VUhdz3g2OflH3bKVx0yGH17iTxfo1cJJfgxGNm979E
         pYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867825; x=1740472625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1gmUMyFrIcKimBewI6q24dJKcEuoHIJdBxmZAwxaaE=;
        b=HjD6voiLg+nH1LOX1SatdH7GGOub5o6joEPdpfeIKOzqe4xVnxyANYTKQMOBgztet4
         jA0GuUHZtvsdkSyN/UZ3cYAJIA4aAI82qgNyqMV3k3DtTWnbDpxSGy/NWFWcxm/IxEoU
         oSwRVv+79GfEB0J266We+tu9tS3BY+K75phR6RRYhoxQXN87NWQn/HuDTL2y6PqRTlUB
         8O4xW8y+SmLnsJE37GloWUvIfZNrxeKfhhlv1BWgN4fp78SZ1fI1qYx4fm8VMg+FIyP4
         ipVObUlIU7RoE97IyXS5wJGNJjPhSP9W850q1kJvd0w2v8FJ0m239VIFUDy8YPCVnSPD
         hwRw==
X-Forwarded-Encrypted: i=1; AJvYcCU+CVbHic2XIL3gPUFY5E6mgoMU3fEI37fNI2K2A3gob9a6A+acn6gsSFS4ettxAmLdWyIkkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUwiJr9FmHC50Xb9D3aHsk+Slfa/oSHuuOab/Y1/v6PZl9DV/u
	geTs+XK1KgyXiIw+TaCPuAExLteVFzKZCVz3TsF5oaMdvFCF9+Wt
X-Gm-Gg: ASbGncs88+jFvZqPH1ejXo2WYYxE0lgloT/dn4tUdFFzcOsYLGbGO5FYUjkcGpp+nMi
	Ls8GEqy0Anp3u3PJjhgHU1u7kMuStd3SajO29MzPDPrxq8kK8gePEVkFyaApv/4twA8BYBFwktc
	dtsLhj3N1QwSbM1Naosr5ZaOUzMz0Q7Pq4MqAuzht5qweapYjDLvaZvzq2RpgePGxEUuOEBRNH2
	t2QcgvKOEXVcBNeQ0gWb9tjdFvKRn81oULb176Qtu7PczqwUPmSDO2nrGbnFUxo94pRMPHssu6G
	fYz812IyCf3E9/Y1s9nHG7+JcAPMakAJ7gm6rNgYZ+x+N+Mafz9ENDoPy8yFSiCDQllnyoJ0UUF
	ztcAKjl4GVw==
X-Google-Smtp-Source: AGHT+IFizoKmwjh9YN/ziweMuIVCIJzBsJIb0KmtkfpxkeL1KJmMlF3+L4OpNBzmyQWeoqE2IU22YA==
X-Received: by 2002:a05:6a20:9148:b0:1ee:ceb7:2b54 with SMTP id adf61e73a8af0-1eeceb72d97mr344927637.5.1739867825207;
        Tue, 18 Feb 2025 00:37:05 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:37:04 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:43 +1000
Subject: [PATCH v2 09/29] ASoC: tas2764: Reinit cache on part reset
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250218-apple-codec-changes-v2-9-932760fd7e07@gmail.com>
References: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
In-Reply-To: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=YUiXWU8Gf9wDtlFFZhIrrwCN5xdBOaHOAAxlNP/Sbtk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3BJcV0qeUf8syhDg+XJ+6qn1lu+DXXdt+ZgvxK83r
 /DblMseHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAExkBgPD/2R1VsbLohz7d052
 Xbxdb3V827QsvYKC2I/tLqf15suWejP8FfB97LYhcK/A2/VnprWuYP/Eb2VrbbRY98hO4dlfjre
 FcgEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

When the part is reset in component_probe, do not forget to reinit the
regcache, otherwise the cache can get out of sync with the part's
actual state. This fix is similar to commit 0a0342ede303
("ASoC: tas2770: Reinit regcache on reset") which concerned the
tas2770 driver.

Fixes: 827ed8a0fa50 ("ASoC: tas2764: Add the driver for the TAS2764")
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 05d025ffc567fac25110fbde2ca19337b8ee329d..e4003a724c8c09303882ee36fc11133cf5c78b57 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -539,6 +539,8 @@ static uint8_t sn012776_bop_presets[] = {
 	0x06, 0x3e, 0x37, 0x30, 0xff, 0xe6
 };
 
+static const struct regmap_config tas2764_i2c_regmap;
+
 static int tas2764_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
@@ -552,6 +554,7 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 	}
 
 	tas2764_reset(tas2764);
+	regmap_reinit_cache(tas2764->regmap, &tas2764_i2c_regmap);
 
 	if (tas2764->irq) {
 		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0xff);

-- 
2.48.1

