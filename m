Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFE33D091D
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880248; cv=none; b=W73cAZ9c79BcYHTow9BuUptZ1FnzLaFG2g/kw5a0WI6n+51L9YOIoRapSChylB4maommVS/x/QiLGM+eu/IPa/hqDegeU+oV89olaIZ4E7OQlIawqctmvSwp1hyY05qL+gr05aTNks1UfmLmjjI+14LHr1qDKve8vEL1yJ3E4Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880248; c=relaxed/simple;
	bh=fow1KNfeFBOwUBq/AuCok83xrJa9sG69vnUGOaB1hgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yt7aAx7l8B2DbuPxC0B8JYT5+sjQyS+uHs2y8i2J4ertRPIuWVE6Zow6HLAXp5mfKZ1K+YQjzTQXn6OyIksXO9m9k4UjD7Gx2MS98yjRU4NjYuFOVNdFdq6n7v85ilAorWDDJp4k/9GkKv02/zlnjzQO/A6xz02dsHxkgtoSfA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gam3TwUy; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gam3TwUy"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6188so11904465ad.3
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880246; x=1790485046; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhSaVgPZF5rm02UijUctP+1GziT6CoSBtc+R2AKZdGQ=;
        b=Gam3TwUyjNE/UNZsEZ7nxmjeZ9LDhQAnROQm5i3nkEsSuCC6wHhAC7L0q4+jsI7KBh
         8Y+aBnxmf/7KGTZK23DBn2Hxwsd3fO15HGGxUglPdcqAu4fNm3CDzuZWQWQDfPLDIDV3
         3blgxcP59pNE04VAYWLwknMuFfZJ88Y3GV3yZuI5DLx2nNDX1Pru3/Y5u1vD2Qa26EhL
         YudwjsUAppVkwD3wLBAldQsMKKxoERj0PxsNdWHvRjGo94p2OHEqtm2Vinm1BZPHHhNN
         m0LKDtnnoLhORoaUt4p4GwBRic/muCvAQQFNPSSPEvxVfn0gDnM34BeqiT4Nm7DRh45S
         cHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880246; x=1790485046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhSaVgPZF5rm02UijUctP+1GziT6CoSBtc+R2AKZdGQ=;
        b=I8lhkhczxlwDBiSqsrb7RvAWl/dKVTZ/EqN+CdgS/a8BBDkK+E9bJkhWt/GciP2DOX
         3XOY3RT5EtZkE4uKjEI1KOXmiJzj9oOMMa5e6MN1Ya+EdnWzgmckrvy9jBoDhWXTl7uo
         og3xD9SQ6lW351S1ARH+pBFskRvgZWv5uE6IybKDGGxEZ+8fRg0juuwCAYCKKsZ+rVE/
         tgPqgIuuBRxOuSSs8Sxuhf4L0KNXp0XFucbK7mBTL6DPMjJKtnsJjTw+mUhN9Mt4QNL7
         t7kaI5ta+Z1cjM1BnDpUqRD/Vns5/LeeWJyJC5imFaMKzjsv/7HCeeLZz/YmWIjEycuc
         biZA==
X-Gm-Message-State: AFuF++k/U/vDRR6W9Pov61xP9sBwZZaqQq0WXWoDeYat5aOYmKgaePp9
	UmmcVet6hzJxL9NQ+A0SP05kKcKj/kHj+CyKBixfUHtg8Duld1ijq6ja
X-Gm-Gg: AYBFou0th9AfEvEpr291PDeJ8NcJiJa1+Tza5b28CD0crghV9Vuim/WaeOnwSHPO8Vf
	VPeoFjp1ULtvAC0Z5akxEpP/PJw5KFX4AyQyvqfB/tyrETkHJpW6ThAhDILCGPp0dx+WpC7NxG7
	J9Ltn7ksge9Ps1s/d23X6iuufR2uYYOyexXLmPdmSMDT/0AwnuKtd6CaL/0YjUyrqJXYFt8y8oE
	0/qRy0xtBLIF/3pNuDZdtagXwd1CuX6n66LgltBcoaBWfpn/bASQ/mSaBEVOB6NdJBOgnQg5jQS
	48+ymZ6ilBO3M1pK3+26I10Yh+3xCzTMbqeyPBNf+ByE6G7zQiv9AAwn9kcW1Sv02zb7qLf7680
	s56syVa9p97YWY2WC4oIIMGuZxub0fKXtxG77UTgbdNQxWMm4ObMBGiHfy9kII2gjWCnsGI3k2H
	1kDthrVup7SENWAriL1AusEUtkydvbpHDtuM8Hmv3ndga2IPqj7uOjgzt9q3smMaPC1cxRGe3rC
	7lsuKxrXkHYnzh/RizjruJho+fhCwewyOUzIjXxsgPFf7uxsosY3sjSqjo2rFk88aiohSTJtmXr
	P2/GK5Iydgma+AD5l0cbZ2FEwZp3Pw1PmncWaiDcRVKtKxs=
X-Received: by 2002:a17:903:3205:b0:2d8:f965:7e48 with SMTP id d9443c01a7336-2ddb1ab3990mr125558885ad.1.1789880246135;
        Sat, 19 Sep 2026 21:57:26 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:25 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:54 +1000
Subject: [PATCH 15/28] ASoC: tas2764: Set up V/ISENSE on codec probe
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-15-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3680;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=fow1KNfeFBOwUBq/AuCok83xrJa9sG69vnUGOaB1hgI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xVrK2bPvZvHF6X2dCXrwu1KRTPjZ9y5ViY06av2h
 xdHm9cVdUxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZ6+UyG/6nut++9+/rpg8y69fskunk8ZVavXr+WVdSMRfcYq+WiK0sY/qmdUP2
 7/MWbypxjaSUxbA7lme6/Pk5q07ZaOU/qrPlOZ3YA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Setup V/ISENSE on codec probe rather than doing so on every hw_params
or TDM slot call so that it is configured at the same time as the
rest of the codec.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 61 ++++++++-----------------
 1 file changed, 20 insertions(+), 41 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 6654100ac91d..39372d0446d0 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -266,8 +266,6 @@ static int tas2764_mute(struct snd_soc_dai *dai, int mute, int direction)
 static int tas2764_set_bitwidth(struct tas2764_priv *tas2764, int bitwidth)
 {
 	struct snd_soc_component *component = tas2764->component;
-	int sense_en;
-	int val;
 	int ret;
 
 	switch (bitwidth) {
@@ -297,32 +295,6 @@ static int tas2764_set_bitwidth(struct tas2764_priv *tas2764, int bitwidth)
 	if (ret < 0)
 		return ret;
 
-	val = snd_soc_component_read(tas2764->component, TAS2764_PWR_CTRL);
-	if (val < 0)
-		return val;
-
-	if (val & (1 << TAS2764_VSENSE_POWER_EN))
-		sense_en = 0;
-	else
-		sense_en = TAS2764_TDM_CFG5_VSNS_ENABLE;
-
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
-					    TAS2764_TDM_CFG5_VSNS_ENABLE,
-					    sense_en);
-	if (ret < 0)
-		return ret;
-
-	if (val & (1 << TAS2764_ISENSE_POWER_EN))
-		sense_en = 0;
-	else
-		sense_en = TAS2764_TDM_CFG6_ISNS_ENABLE;
-
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG6,
-					    TAS2764_TDM_CFG6_ISNS_ENABLE,
-					    sense_en);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
@@ -452,7 +424,6 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 				int slots, int slot_width)
 {
 	struct snd_soc_component *component = dai->component;
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
 	int left_slot, right_slot;
 	int slots_cfg;
 	int slot_size;
@@ -499,15 +470,26 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG5,
+	return 0;
+}
+
+static int tas2764_set_visense(struct tas2764_priv *tas2764, int vslot, int islot)
+{
+	int ret;
+
+	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
+					    TAS2764_TDM_CFG5_VSNS_ENABLE |
 					    TAS2764_TDM_CFG5_50_MASK,
-					    tas2764->v_sense_slot);
+					    TAS2764_TDM_CFG5_VSNS_ENABLE |
+					    vslot);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG6,
+	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG6,
+					    TAS2764_TDM_CFG6_ISNS_ENABLE |
 					    TAS2764_TDM_CFG6_50_MASK,
-					    tas2764->i_sense_slot);
+					    TAS2764_TDM_CFG6_ISNS_ENABLE |
+					    islot);
 	if (ret < 0)
 		return ret;
 
@@ -821,15 +803,12 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 			dev_warn(tas2764->dev, "failed to request IRQ: %d\n", ret);
 	}
 
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
-					    TAS2764_TDM_CFG5_VSNS_ENABLE, 0);
-	if (ret < 0)
-		return ret;
+	if (tas2764->v_sense_slot != -1 || tas2764->i_sense_slot != -1) {
+		ret = tas2764_set_visense(tas2764, tas2764->v_sense_slot, tas2764->i_sense_slot);
+		if (ret < 0)
+			return ret;
+	}
 
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG6,
-					    TAS2764_TDM_CFG6_ISNS_ENABLE, 0);
-	if (ret < 0)
-		return ret;
 
 	switch (tas2764->devid) {
 	case DEVID_SN012776:

-- 
2.55.0

