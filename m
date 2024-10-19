Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FAD189919
	for <asahi@lists.linux.dev>; Sat, 19 Oct 2024 14:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729349373; cv=none; b=qL//L5w1GFrb9WyuK5rGGxKzNLS/PHWRNbunNMPtlalgGbZ9n4vOW4pnPs0z1popwERBmCFZ+lDulmvR3vt+ZZDFbL90tNQrl5eswcoOHvYmzXP7FWK93x546yEN3Ldfan6PpVUwvvXwKJGtUE1wil36Iv9+VUmn5L+uG7tZjAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729349373; c=relaxed/simple;
	bh=lDlV61mroRzIlujWetckRIUy8B8nZZe627wwntKelnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uKgS3SijqCRjtuxW7ATK99KJFgPiR6mu8ymmTtfA2tuoMYpkVQLjfReRHm3uRYmyqU4kXDVe8l6A4aTaiBhiZmUwiYgD8dQ3TQbUhatsx2w1LN5hDw9/F+1zGuX+oIxgYRuj1JUOktHv1703fpJl2hYSzvNisIMUhmjDQMlYCb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcqsG3HC; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcqsG3HC"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2eb9dde40so2499912a91.0
        for <asahi@lists.linux.dev>; Sat, 19 Oct 2024 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729349369; x=1729954169; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCBi+Tkuz2vfn5zxirkI6XtllxMZ3YptUkrP6xEh49g=;
        b=AcqsG3HCJoFMYwu34ZxcZtat3Km/G+9DAJICSidzpDklqUohQbuwT7v5F8tF2awKqU
         1xWofeGJ+TQRZizZcOt/R93kBkTTrYUGIwCFxyOmLKTA/h7OSK5K8BiwH+Vd1YEdiFZG
         IbgQdnz2y0SmD1jEc6szXMCLgeIrsfUnnL11oX04IvhRlrOOFNhi7wdMWatcgGJZZZpf
         17RmR7HFSuIppYeRWLt5yBcHQgfsFK+RpEb02LziGNkSmCS5/EltxMxK6IH0WXdV/fHp
         5CylnsK2GMcRPDwmbeSs3pqVUC7vz/uc5Y7Ih4fsGPl7dKPGYIDoCYophATzCg3cyi1j
         RVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729349369; x=1729954169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCBi+Tkuz2vfn5zxirkI6XtllxMZ3YptUkrP6xEh49g=;
        b=p0jho2Nzz4gmwi2YPFMFJVWIbT9h6XWjBiI735xkUkTEJcJjVl6a1HrZrd3H2o1UB8
         QQ9LR2J7cXDLWU9IuqI6A+IEgMghkR8TskDVjLzASJh42cERQi7sBe4uvTx3I+e+3uT1
         SEUBUcFBlGlYIziHUXD7+FYkTIYt1sLO/IR5VlsDquaRFlp/mmrK/ZCpe31bEik36s+w
         f9rdxUGx6hYlvUZ19urAZCx/K0D9nyGMfvql683XyG3qWRXQx1dv+19kesrLGn0nmmNx
         MI3EhNzNeGQeCi/Lmv8EKYIBVely+s+qMG9DpOsvL3AWg08empLMgLqVzrqZaeLYbem3
         uulg==
X-Gm-Message-State: AOJu0YyCuiSTTdEaD6pL0IsPPfR07xgT6SFzr2xdqCjOK6CfEg8U88xI
	Octz4ZsFbKCVWFOq6sdZGqePKPy3WfxtXVCYbIH5pSmSEi1/oh0v
X-Google-Smtp-Source: AGHT+IGlCxkoDhM6HEr+S+rgsxOpKvnpQ9SRH1hRgPkLVcUZkymKR7F8QH98IJvrbROWTTg1sKIJyw==
X-Received: by 2002:a17:90a:ce95:b0:2e2:c40c:6e8a with SMTP id 98e67ed59e1d1-2e561900e24mr6568416a91.26.1729349369005;
        Sat, 19 Oct 2024 07:49:29 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e58390d63bsm1325747a91.0.2024.10.19.07.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 07:49:28 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Oct 2024 00:47:33 +1000
Subject: [PATCH v2 3/3] ASoC: cs42l84: leverage ring sense IRQs to
 correctly detect headsets
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241020-cs42l84-v2-3-37ba2b6721d9@gmail.com>
References: <20241020-cs42l84-v2-0-37ba2b6721d9@gmail.com>
In-Reply-To: <20241020-cs42l84-v2-0-37ba2b6721d9@gmail.com>
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
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6532;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=lDlV61mroRzIlujWetckRIUy8B8nZZe627wwntKelnY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnCx+5zCtUa7bhR+HEOX/DHAu6gJi1r/qdVrbE1K5wY2
 UwWv+7vKGVhEONikBVTZNnQJOQx24jtZr9I5V6YOaxMIEMYuDgFYCIaBowM3+YFXn7+eoa0Yr9o
 cqrho+xdXsvbHTSO3my0v7IlIm7rB4bf7FovnrznDGJyWbH+nbK+y/ObegsaEibunPzvlmF1YYA
 cCwA=
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
Reviewed-by: Neal Gompa <neal@gompa.dev>
---
 sound/soc/codecs/cs42l84.c | 90 ++++++++++++++++---------
 1 file changed, 60 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index 84a1e8ac818cc21be6da3f59af6da1a2fc4ed223..47731cdc0e67f4921051ea7130299eb6fffc5fd7 100644
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
@@ -798,13 +799,23 @@ static void cs42l84_revert_hs(struct cs42l84_private *cs42l84)
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
@@ -818,16 +829,24 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
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
@@ -840,47 +859,58 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
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
+				break;
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
@@ -910,7 +940,7 @@ static void cs42l84_setup_plug_detect(struct cs42l84_private *cs42l84)
 
 	/* Save the initial status of the tip sense */
 	regmap_read(cs42l84->regmap, CS42L84_TSRS_PLUG_STATUS, &reg);
-	cs42l84->plug_state = (((char) reg) &
+	cs42l84->tip_state = (((char) reg) &
 		      (CS42L84_TS_PLUG | CS42L84_TS_UNPLUG)) >>
 		      CS42L84_TS_PLUG_SHIFT;
 
@@ -1017,8 +1047,8 @@ static int cs42l84_i2c_probe(struct i2c_client *i2c_client)
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

