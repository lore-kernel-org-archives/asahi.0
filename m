Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC002071EE
	for <asahi@lists.linux.dev>; Wed, 16 Oct 2024 10:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729075345; cv=none; b=HLyf4dul8Yp3mr395FYOtwTEN2xmUfHlrJ0EJFfgdNr+GsoLmIxeF0iE2wsmtVdKdPyUsiDV6O20FkKiG0YbvExn/8jAfIP/ZS2dpVNm2jFy76WDcY+J9wqdCBnF44HRMKgLgv1Fnxhk8ybg8boKMx7ly/cZNCPX+Ja+3AMq9wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729075345; c=relaxed/simple;
	bh=DxM55qAuJVLJ56rkaMYQvYFQ1y/6QKJEizLQtDgKJD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LmXo7QLNYxbbP4r/MWzi6F5OW53vgbrlJm7JbGeL4u2ia1J+yjsL9U3TIV0lJ2TiDkDpeSq+ZdCt3vA61ttxoe4jV2KOxzV6M7ucYtwh9SapvYSPedSBFZLn0hM7MpaBruYpxwFzf4fUAjoa3LNsmqeUFY5wFeP5Liu06zs91JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IteCbNlz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IteCbNlz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c805a0753so52404245ad.0
        for <asahi@lists.linux.dev>; Wed, 16 Oct 2024 03:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729075343; x=1729680143; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWFXTKeTH7RgE3F6l0NRgDfeJ3cSqKL3g04gUQ1u1OQ=;
        b=IteCbNlzQdvFeBze33K7sTM6f8QQzcJPfi4gAOE90v+u14ys/gKxsWaQP1VCEHlIU/
         EHVUHoB2M2hpGCtaTknJzUIDs4DXUiRS7enepP2WK8f9ZNFG6CR2cjpNSfr+doQsclIF
         3WVkys7bYlxukfyDHJu9jlkRFt++USnluftEFVIyS9JqBy0AORuJJ1zV6gupZHHJKExo
         bsgheh0KlxCSc9rqV5KK5cKX8bluvMU1VRylQE4EXthxhricyz15JT92Tv/AvJ+/QO5+
         YYGA0koGg6QPMOdUJcBr6hXRMSdk8qHwIONdB90LD3zDllP4eKE1X8VW/rVF6OUTGNPl
         1TDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729075343; x=1729680143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWFXTKeTH7RgE3F6l0NRgDfeJ3cSqKL3g04gUQ1u1OQ=;
        b=q7Q48ZoVA8XC8yAdqeVx3nf1pHI/6VX/HHWUK/1/N8cum0ZyWcC6WV25hjOMGmX32O
         +sU3hkYgwEJ7uh/WLa9QOZYzLraZSoNJWlUbiArbV5ET6eFgEwIlaqDr6FBu69EhOW/u
         JHEWGotu5nYkTDla7O0sLmwF9ToJmXQBZ9BcckOe1qIXDBlOgB4ZOLydY+WoJ/hhG+Ib
         KSgw/oo1XDQ2di6HYrCVSw8sQVTheC7QQTUayYvl7sqOi4pcBnm779mfP/CKPcC/1mio
         Nrx3V3Xhg3DerNppsgvEtgH6+3zKZ9SbGvSmh/BzvpYKJdkul/jqP+TrNfsKKmP99dSi
         AJHQ==
X-Gm-Message-State: AOJu0Yz//E1ZuDWr5d89akI9aOPoQq1fgPw2dJznMqZ7l4U5yiaG7B8k
	EbmA5GGNIDc2oafFwPNJBjVBocAQiBCAocydcfu1CUeNlUgUoJjd
X-Google-Smtp-Source: AGHT+IErQ5tKfU2htn0tUHC4Jifcww5wToA5v9tphD4rJTGKDd2vhRKlq2gdzwjSgsuFu3IAYiWVwQ==
X-Received: by 2002:a17:902:ecc6:b0:20c:83e7:ca51 with SMTP id d9443c01a7336-20d27ebb734mr49525465ad.26.1729075343000;
        Wed, 16 Oct 2024 03:42:23 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1804b2e4sm26319645ad.182.2024.10.16.03.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:42:22 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 16 Oct 2024 20:41:02 +1000
Subject: [PATCH 3/3] ASoC: cs42l84: leverage ring sense IRQs to correctly
 detect headsets
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-cs42l84-v1-3-8d7e9d437d2d@gmail.com>
References: <20241016-cs42l84-v1-0-8d7e9d437d2d@gmail.com>
In-Reply-To: <20241016-cs42l84-v1-0-8d7e9d437d2d@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6541;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=DxM55qAuJVLJ56rkaMYQvYFQ1y/6QKJEizLQtDgKJD4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOn8M8p5mVrvF13uP7/18rSq945H9WuPBJe78ntu1hU6n
 nKk5JJRRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABM59IGR4elBdyW/l3EymZee
 u5wWiG2tPjmB+aqW587Ojl5miZvc4owMu/qkNJ/lt3V/v3zo++8HmyyWt3Q7TGl4J/F8r4XLfFd
 /JgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some jacks integrated on devices with this codec, such as certain
Apple Silicon Macs, have quite trigger-happy tip sense switches that
cause a tip sense IRQ before the plug is fully seated. If users are
unfortunate with their timing, this can lead to headsets being detected
as mic-less headphones among other issues with the codec's device
detection routines.

Introduce some rudimentary ring sense interrupt handling so that we
can re-trigger the codec's detection routines when we are certain
that the plug is fully seated.

This seems to differ from what other Cirrus drivers do, but is
necessary for devices to be reliably detected properly here.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/cs42l84.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------
 1 file changed, 59 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index dbbc76f41ccb958b068848426d1891b16aa84866..8711968a38e24de221e32066739cc4d60964fdef 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -44,7 +44,8 @@ struct cs42l84_private {
 	struct gpio_desc *reset_gpio;
 	struct snd_soc_jack *jack;
 	struct mutex irq_lock;
-	u8 plug_state;
+	u8 tip_state;
+	u8 ring_state;
 	int pll_config;
 	int bclk;
 	u8 pll_mclk_f;
@@ -797,13 +798,23 @@ static void cs42l84_revert_hs(struct cs42l84_private *cs42l84)
 		FIELD_PREP(CS42L84_HS_DET_CTL2_SET, 2));
 }
 
+static void cs42l84_set_interrupt_masks(struct cs42l84_private *cs42l84,
+					unsigned int val)
+{
+	regmap_update_bits(cs42l84->regmap, CS42L84_TSRS_PLUG_INT_MASK,
+			CS42L84_RS_PLUG | CS42L84_RS_UNPLUG |
+			CS42L84_TS_PLUG | CS42L84_TS_UNPLUG,
+			val);
+}
+
 static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 {
 	struct cs42l84_private *cs42l84 = (struct cs42l84_private *)data;
 	unsigned int stickies[1];
 	unsigned int masks[1];
 	unsigned int reg;
-	u8 current_plug_status;
+	u8 current_tip_state;
+	u8 current_ring_state;
 	int i;
 
 	mutex_lock(&cs42l84->irq_lock);
@@ -817,16 +828,24 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 				irq_params_table[i].mask;
 	}
 
+	/* When handling plug sene IRQs, we only care about EITHER tip OR ring.
+	 * Ring is useless on remove, and is only useful on insert for
+	 * detecting if the plug state has changed AFTER we have handled the
+	 * tip sense IRQ, e.g. if the plug was not fully seated within the tip
+	 * sense debounce time.
+	 */
+
 	if ((~masks[0]) & irq_params_table[0].mask) {
 		regmap_read(cs42l84->regmap, CS42L84_TSRS_PLUG_STATUS, &reg);
-		current_plug_status = (((char) reg) &
+
+		current_tip_state = (((char) reg) &
 		      (CS42L84_TS_PLUG | CS42L84_TS_UNPLUG)) >>
 		      CS42L84_TS_PLUG_SHIFT;
 
-		switch (current_plug_status) {
-		case CS42L84_PLUG:
-			if (cs42l84->plug_state != CS42L84_PLUG) {
-				cs42l84->plug_state = CS42L84_PLUG;
+		if (current_tip_state != cs42l84->tip_state) {
+			cs42l84->tip_state = current_tip_state;
+			switch (current_tip_state) {
+			case CS42L84_PLUG:
 				dev_dbg(cs42l84->dev, "Plug event\n");
 
 				cs42l84_detect_hs(cs42l84);
@@ -839,47 +858,57 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 				 * was disconnected at any point during the detection procedure.
 				 */
 				regmap_read(cs42l84->regmap, CS42L84_TSRS_PLUG_STATUS, &reg);
-				current_plug_status = (((char) reg) &
+				current_tip_state = (((char) reg) &
 				      (CS42L84_TS_PLUG | CS42L84_TS_UNPLUG)) >>
 				      CS42L84_TS_PLUG_SHIFT;
-				if (current_plug_status != CS42L84_PLUG) {
+				if (current_tip_state != CS42L84_PLUG) {
 					dev_dbg(cs42l84->dev, "Wobbly connection, detection invalidated\n");
-					cs42l84->plug_state = CS42L84_UNPLUG;
+					cs42l84->tip_state = CS42L84_UNPLUG;
 					cs42l84_revert_hs(cs42l84);
 				}
-			}
-			break;
 
-		case CS42L84_UNPLUG:
-			if (cs42l84->plug_state != CS42L84_UNPLUG) {
-				cs42l84->plug_state = CS42L84_UNPLUG;
+				/* Unmask ring sense interrupts */
+				cs42l84_set_interrupt_masks(cs42l84, 0);
+				break;
+			case CS42L84_UNPLUG:
+				cs42l84->ring_state = CS42L84_UNPLUG;
 				dev_dbg(cs42l84->dev, "Unplug event\n");
 
 				cs42l84_revert_hs(cs42l84);
 				cs42l84->hs_type = 0;
 				snd_soc_jack_report(cs42l84->jack, 0,
 						    SND_JACK_HEADSET);
+
+				/* Mask ring sense interrupts */
+				cs42l84_set_interrupt_masks(cs42l84,
+							    CS42L84_RS_PLUG | CS42L84_RS_UNPLUG);
+				break;
+			default:
+				cs42l84->ring_state = CS42L84_TRANS;
 			}
-			break;
 
-		default:
-			if (cs42l84->plug_state != CS42L84_TRANS)
-				cs42l84->plug_state = CS42L84_TRANS;
+			mutex_unlock(&cs42l84->irq_lock);
+
+			return IRQ_HANDLED;
+		}
+
+		/* Tip state didn't change, we must've got a ring sense IRQ */
+		current_ring_state = (((char) reg) &
+		      (CS42L84_RS_PLUG | CS42L84_RS_UNPLUG)) >>
+		      CS42L84_RS_PLUG_SHIFT;
+
+		if (current_ring_state != cs42l84->ring_state) {
+			cs42l84->ring_state = current_ring_state;
+			if (current_ring_state == CS42L84_PLUG)
+				cs42l84_detect_hs(cs42l84);
 		}
 	}
+
 	mutex_unlock(&cs42l84->irq_lock);
 
 	return IRQ_HANDLED;
 }
 
-static void cs42l84_set_interrupt_masks(struct cs42l84_private *cs42l84)
-{
-	regmap_update_bits(cs42l84->regmap, CS42L84_TSRS_PLUG_INT_MASK,
-			CS42L84_RS_PLUG | CS42L84_RS_UNPLUG |
-			CS42L84_TS_PLUG | CS42L84_TS_UNPLUG,
-			CS42L84_RS_PLUG | CS42L84_RS_UNPLUG);
-}
-
 static void cs42l84_setup_plug_detect(struct cs42l84_private *cs42l84)
 {
 	unsigned int reg;
@@ -909,7 +938,7 @@ static void cs42l84_setup_plug_detect(struct cs42l84_private *cs42l84)
 
 	/* Save the initial status of the tip sense */
 	regmap_read(cs42l84->regmap, CS42L84_TSRS_PLUG_STATUS, &reg);
-	cs42l84->plug_state = (((char) reg) &
+	cs42l84->tip_state = (((char) reg) &
 		      (CS42L84_TS_PLUG | CS42L84_TS_UNPLUG)) >>
 		      CS42L84_TS_PLUG_SHIFT;
 
@@ -1016,8 +1045,8 @@ static int cs42l84_i2c_probe(struct i2c_client *i2c_client)
 	/* Setup plug detection */
 	cs42l84_setup_plug_detect(cs42l84);
 
-	/* Mask/Unmask Interrupts */
-	cs42l84_set_interrupt_masks(cs42l84);
+	/* Mask ring sense interrupts */
+	cs42l84_set_interrupt_masks(cs42l84, CS42L84_RS_PLUG | CS42L84_RS_UNPLUG);
 
 	/* Register codec for machine driver */
 	ret = devm_snd_soc_register_component(&i2c_client->dev,

-- 
2.47.0

