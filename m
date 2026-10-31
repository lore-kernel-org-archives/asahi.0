Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417002;
	b=CG1Ecs5qGyRpdb2SwFm535gbvatPR4BBTMZaFA3C1z/pXoaCP4HLqA4cUOA5H+d6go/l
	 8uylKtr1+iXAzW77huRpzHr1mSeHBDBvLu9GtHt3BMA2iI9oj6znaElzUbNHCdVblpQny
	 SgFEvozarsJZm8IF6hx02uK8JjxZ9R9EHwRQw5bUbmxYN7i9m+rmH0xC20IbOxax/bA2g
	 uoF3xW+PpiC6XkJb5iCwQY51ccko+3W0yM4sScOv86Et/TpiOa6jt6ujUcWnRhazgLeJv
	 TRBmdwjxdDDEMTnW5TnCwvvXxVYDSQoLM6oX73y7sWvOZbz9TJaxssyxI9MTobTTa3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4wOVj5BkuVqeNk0QZ1pVDwZxFHvve0w3swvsjOEFbZg=;
	b=G3vmPxdjvB4NdgkS/IaRhLYB9xMKpBsGOuA5i6VV9SNb0dd7/to0zSSI6N4lpn0FzdUJ
	 4jq7FyZv0iJXn2lHR78Vo5lXkzgkEdgIG168OYf/U9tq6SmzR/RY71z0juWKd6xegPoio
	 FfcoUtQmTU9AdA1TxaXlYtiA91588E0UpGiwWnEmE1nI49xD34NJrgqTCFMv9DXr83C99
	 f0BV1LLi7Rqvwmw7dVW8CPbwx0sYmuVpNnVqPSPa7aya0ssokzPeNaq70EiX2qzOXZEQE
	 xHvEIJgzSUQzpVD3HqetSVNPrldU4zYbrrAwAb8q8m+fKF2lu1VlWtwHTp/sk+0Dfnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVlTyZTJ;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC0C606A31E
	for <asahi@lists.linux.dev>; Sat, 31 Oct 2026 03:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DC0C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVlTyZTJ
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514b90bb89so2557775eec.1
        for <asahi@lists.linux.dev>; Fri, 30 Oct 2026 20:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793417000; x=1794021800; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4wOVj5BkuVqeNk0QZ1pVDwZxFHvve0w3swvsjOEFbZg=;
        b=rVlTyZTJKBBi97su8+iQjFLOoRP0LJe1WQ0uH5P66clJozhH6w+aOjAGKUx7P0rHNQ
         ML2SO5Pc2M3FaZ3BNNRkvWUZNNLVPuJ+58JzXVhwaGch8FFLy1am6Aa5YVV+vItw7Vu8
         W+56h2uOBct87rfhihzlwy4J7IkywUUpTEYPtChd7sreNvnJlf/NW+bE/8emTGSCwXE8
         p2YHn8Rei3JS1ftAK5k5ywuBKUrt2JkBCmjcPHUIJ9wyRpCkl3T8OQouFB9QBYJBtPq0
         K5MUx+dEQKGO8YNdqPPpkw07Km0cobrjb2yxANBxTsSomjDS/5rZNG2wmWcrsvNRm8i0
         JtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417000; x=1794021800;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4wOVj5BkuVqeNk0QZ1pVDwZxFHvve0w3swvsjOEFbZg=;
        b=p/J8r0nCeeYkoJ4cPs38I2SE52r/J/PB8ze3/g8QxxDi2ESsjAHU76zU1n+RkynJwC
         u3XynZirCBDPjQL+2R4t/Yg/cdBWo+yUumcVn2R2OExO4ERBFnPf9WLgKdCoq/B1aom0
         BdtbNP1QX+Uc94Xl8BIQ74W/3WUwJcm3e1nzvUX2ag+3SfuzLpWt520YoFbxP+DpDxve
         9fHTX7Y/Fhek8lmpH/slPVky1io+pX45PiLKpTFzs5wWzFkivRazyfe663tC+G96qS2B
         iAopWwXv6TIPwO/XQxU+G5m69aa8XnL30j9deCAmlNL+sW7ztVhk9/J+taSkPMI/Rm2S
         G0sw==
X-Forwarded-Encrypted: i=1; AKwUvBxjqKL9Z1a7oTyUHKaXbZFt4xIPck9CefkzRtIO7qCLoPkxhW2+5ILoxP7OQkpFjlHTExGdhQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLTYT4ebZLwsmLMETdy6BCCC0qrEElR64irO3fWYzKZmjKfZISU
	BVysayeVYLpQ1PiEfgBCsk0qWKCCSMgOAIgDrOOQ7EiqkoiAOQ17g8k4
X-Gm-Gg: AYBFou2GZu4d7+WTRSAqTYGL5W/5Uvztu1/q9X+QJJBWv5s7p0gXLtovoXLAX6EuhST
	lI3CmexD7X3EQN/yNw9JGkoSr9UR+tjn4Sef7Y5KyEJwCOEoG/3u9RUs9wwIj3sTGUcngeAJrmE
	YSrQYmoz2xJCPukEmgJEV1hrbr9hJ7tQaP1WVQiJhzP+NNQY59vl7Zdom/4s2Q2fXWabpSll63z
	i6vX8qaUrNAp0isP8YlfeAOYigpDV1HHSmAJRX4VE6innGKmuMKXvyBOR1mL1KrrmDtfldQDp/w
	JxQB7mwKVf64z92vAg337Aj+cPF+p5LCjTIKDk6JEqK+qmok6Dc8ywcwVEsp6SkN1D6xva5COE7
	ti9kEgvAbMMtP0ddWn0cq38Mo+TyGYE0WJ4Vk1PMKGkZ6g9EK/5/Wi4rlI4EPkC83sgEVlCmI6V
	bdZ0gNL0eEZkxRcBg+YrJ64TxeofYSjDw8pNJkEa6Gk5gqzMqZsOR5VMeYVmFeUtpntl94JD6C0
	Rlp/VQf28IgFnqZDGw9s7oVcWxv7XFBXGZBlcDNaK6y88Qkqfgd3kYjHAZN2kXHfcC4drMtbQgG
	yTYZj6qTBUzF0pl/pV4NaoVB83+jhPI0tHRH2IEudC3p0D0VdOmFxiRI7C16GHqsqOCgC37jxI0
	4Mi5aG3NSEFvfAfpot6oydK+iA2taCKu61734cFYuGin0PIJbS6wZ0QNhNqtWK4mpJaSTCFIlgt
	cyoQ==
X-Received: by 2002:a05:7301:4242:b0:358:dfed:d0fe with SMTP id 5a478bee46e88-36a42219d4fmr6026478eec.5.1793416999929;
        Fri, 30 Oct 2026 20:23:19 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm13399064eec.22.2026.10.30.20.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:23:19 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 31 Oct 2026 13:23:03 +1000
Subject: [PATCH] ASoC: tas2770: Fix VISENSE at sample rates greater than 48
 kHz
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-tas2770-sdout-clkedge-v1-1-5266daf35f4c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrA2MY2lsryIuTDLq2KIlE0tBv
 HvTuvzgvX8H5SiscC92iPwWlXXJqMoC/NQvIxsJ2UBI1wprNKlXshaNhnVLxj8fHPLIXbi+Bde
 QJYT8fUUe5PPvtt1p3dzMPv1icBxfMuDrOXkAAAA=
X-Change-ID: 20261030-tas2770-sdout-clkedge-b4e39db82720
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Shi <shifu0704@thundersoft.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Neal Gompa <neal@gompa.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2455;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=fiqDQ9C11prPwEgLHZ2ImZCTzidS1bFS1JQKAWZHhfg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlP45Un2Zz1v3/148GPa+O+FO7/yBvMvOmeknM/z4ZFv
 M8jw4Svd0xkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKb6zxtGhk1XMrr2Jm66fXzW1WvSz7nuGPwp+h7YaGgQM/uRsl+eigTD/7Ti2lT
 bO2Xn5+a6X/k/63bjtZNdG6O0+n6oG0Ss8w8VZQUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

On reset, TAS2770 is configured to both transmit and receive on the
falling edge of the I2S clock. At sample rates higher than 48 kHz,
this causes strange artefacts in any transmitted VISENSE data which
manifest as corrupted/nonsensical readings for voltage and current
once decoded. Transmitting on the rising edge of the clock instead
results in correct VISENSE data at all sample rates.

Unconditionally configure the codec to transmit data on the rising
edge of the I2S clock when setting up VISENSE transmit.

Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
Fixes: 6553ee024b44 ("ASoC: tas2770: Factor out set_ivsense_slots")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 9 +++++++++
 sound/soc/codecs/tas2770.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 882e19857697..41e4fcf09c25 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -222,6 +222,15 @@ static int tas2770_set_ivsense_transmit(struct tas2770_priv *tas2770,
 	struct snd_soc_component *component = tas2770->component;
 	int ret;
 
+	/*
+	 * At sample rates >48 kHz, transmitting VISENSE on the same clock
+	 * edge as receiving seems to cause artefacts in the VISENSE data.
+	 * Send on the rising edge of the clock instead.
+	 */
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+					    TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING,
+					    TAS2770_TDM_CFG_REG4_TX_EDGE_RISING);
+
 	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG5,
 					    TAS2770_TDM_CFG_REG5_VSNS_MASK |
 					    TAS2770_TDM_CFG_REG5_50_MASK,
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index 102040b6bdf8..45bbd75fb09d 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -75,6 +75,7 @@
 #define TAS2770_TDM_CFG_REG4_TX_FILL BIT(4)
 #define TAS2770_TDM_CFG_REG4_TX_OFFSET_MASK GENMASK(3, 1)
 #define TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING BIT(0)
+#define TAS2770_TDM_CFG_REG4_TX_EDGE_RISING	0
     /* TDM Configuration Reg5 */
 #define TAS2770_TDM_CFG_REG5  TAS2770_REG(0X0, 0x0F)
 #define TAS2770_TDM_CFG_REG5_VSNS_MASK  BIT(6)

---
base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8
change-id: 20261030-tas2770-sdout-clkedge-b4e39db82720

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

