Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1571DE4DE
	for <asahi@lists.linux.dev>; Sat,  5 Apr 2025 23:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743894948; cv=none; b=UTbTVOdDWwlsjoqBYpE5X1qfhTneCxVW+FjX0oPbNLGVs/3YSSVD9XPGk3OonwhbnOxHSupxxreQ11YKIirKRJk8s+8ksvAyNkb4iluLAsGwIgac71LT83pRF1B/VsLd4gYZO/pH1sDKysMlgmnR+zMefzd31UmKq1CCFAjI6Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743894948; c=relaxed/simple;
	bh=/3vhqRp+rjiPGHeGrM8yyAU6vaDCJHkfWLO5hwwE4hA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mIry4wlbtuOQHgSYNQmiqMNVVmUfXdnuSDDOBY/HG+hEx4eBQ/XgPODsca6VUI/GPwSloSC3O66hqKFP2gNfDs7votv477+Pqap8EnWNJyGIxSvvyqq/MfN83RBJPL1BJwMrpU0MRfin06rqnxFUkw0xjEkRzs69TCrtPGTw42k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJVAWn2Y; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJVAWn2Y"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af5cdf4a2f8so2327254a12.3
        for <asahi@lists.linux.dev>; Sat, 05 Apr 2025 16:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743894946; x=1744499746; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+61GEBl1ZKDXz7eqvknnogiq5/rNWdXiMpBWTCFhnU=;
        b=lJVAWn2Y7wwZU0QD8QWn1fGbOfcZ9v/RMnqsdXF2esw5ZzknbvV/gx97reahjpKjc0
         1qMKB4wDrXeVDxrmIGIQFw49M505ZAxaX3v+oqPwYkLx5xq/QUDDMfAkWAqTJT3Bfjt5
         DNWxXzLqItIVUfVAkrugKITMlPreyA0qOblBBahdeXLKibxBszTcFufB78yn1VZvjzaL
         dYQFfZRVmgoiKzti5fUQtAr1hqk8JZVSG6D6wAfoADT4ANLQyUvTBr4cS73SU3ydbSUK
         ayZ4mfv9A6jRGOvyplAbhaH1U5xYk1maTVDY6UdD0FjLZWBoUlXApj6Nmfafthj3SQdO
         ubng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743894946; x=1744499746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+61GEBl1ZKDXz7eqvknnogiq5/rNWdXiMpBWTCFhnU=;
        b=CKbzL+VV6/YrIek/LmlK33Zt3QwOZZXklwfoUUe1gN8vG59x/shy5wTc4GnRyBTY06
         mhS5OHREA4m8Hq6FPU4shjtoVrldn4sslSUZUgfodIHNriT38f6oOIOOCAuab/OoXYFP
         JsapdSAX+shxlEO4enPCLDKgRhHaLwxklfJn1PM+c52Lc0usNyCeQMq1fkd2xB7I2EIs
         ihoa0H5mjHtOJsKE8FudQdvBT6WEUk0ZV0qYVAlMmRo86LV0cvEJwlA+UudvJOANpulC
         BH6fJkkGlN8KzZnBq9iMkh15rEB5Ra1kvRdwFXdev1vysvsPPG0EQsDBJu/MP/PuUJYP
         OLNA==
X-Forwarded-Encrypted: i=1; AJvYcCUHsdbO3FFZw68aXEffkoMMB70T4ZoxPAb2JcYD+RJloGY/zB2orG1Ryp/b6eXIwABM6S7sow==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDWEm0xVzS3LEynBVvWlhZf/iVeSusbOti09UCyGXIdhnn25qL
	h5M0QraXVlcgh7cgoPxBM8+kVMAIcLOIrnm8gGd6XW4MOclb1absxhw/uquv
X-Gm-Gg: ASbGncvw18YnJvl0QvXRwUvzviyr8ozi81nzgEFPgZI+tFwpqINGir9oPRLYE9wKJvl
	klK5Q6NpQKCe8Q2iNSjaH/sGCCGgTznfv3T1eE9A9irIq4NyNuqsAr/Lin/2S6+tniP/WJsw43S
	cDHEfASvbHyzoVvqCDW/lfTWMNBBEy5GMNrgTOOQhAdhYZn3mD6hOTqNKwHoZJ45BjwxKDT26Ne
	HsdyXBrrTPwOGsba2dyYfVVWVBHWCagjCMwWbNOnz18jWe8LYJs48v4s9IB/NtW+JV7KUmy6A26
	tEq2vY08a5eQb/bKTxVjAWvHmtff15hyUGRP8Di2RVV/WHI6zXGQGNwal7Cy8Wnoh/EMYfEgiOQ
	tNAFuvPgTJPkBmsBtl7r9Geqq9Et0ejuH/QlaubQ=
X-Google-Smtp-Source: AGHT+IEWO7gtti3PE85/TmgpHFUrQczmq00aBrD/xi0Nh7zI90sg0i8/SvZFs9lCaImsMEr/kuMdvA==
X-Received: by 2002:a17:902:b282:b0:223:2630:6b82 with SMTP id d9443c01a7336-22a8a04a7b8mr86804555ad.10.1743894945695;
        Sat, 05 Apr 2025 16:15:45 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c994esm55048345ad.102.2025.04.05.16.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 16:15:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 06 Apr 2025 09:15:06 +1000
Subject: [PATCH v5 2/8] ASoC: tas2770: Support setting the PDM TX slot
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-apple-codec-changes-v5-2-50a00ec850a3@gmail.com>
References: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
In-Reply-To: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4896;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=EUPivI1e5lG/Ctwi0iED8gK1+8hCsJ53czJp1dml81s=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfd3ZOdpt7o/3wE23mHGVBx8uKt2Jv7Dq6+3aB+gZvz
 3lBi/dc7ShlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAitecZGQ5/W2WufKP7qe+n
 tyulhFJVnvq8tb0/eW11E/dn7cX9y1IY/rsVX5Qua/Gs2Z3kLqg4penmsoXn+tfumr6KoXJO3mQ
 JR04A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

We don't actually support configuring the PDM input right now. Rather,
this is useful as a hack.

On Apple Silicon machines, amps are split between two I2S buses which
are logically ANDed internally at the SoC. Odd and even slot groups are
driven by amps on either bus respectively. Since the signals are ANDed,
unused slot groups must be driven as zero to avoid corrupting the data
from the other side.

On most recent machines (TAS2764-based), this is accomplished using the
"SDOUT zero mask" feature of that chip. Unfortunately, TAS2770 does not
support this. It does support zeroing out *all* unused slots, which
works well for machines with a single amp per I2S bus. That is all,
except one.

The 13" M1 MacBook Pro is the only machine using TAS2770 and two amps
per I2S bus:

L Bus: SPK0I SPK0V Hi-Z  Hi-Z  SPK2I SPK2V Hi-Z  Hi-Z
R Bus: Hi-Z  Hi-Z  SPK1I SPK2V Hi-Z  Hi-Z  SPK3I SPK3V

To ensure uncorrupted data, we need to force all the Hi-Z periods to
zero. We cannot use the "force all zero" feature, as that would cause a
bus conflict between both amps. We can use the pull-down feature, but
that leaves a few bits of garbage on the trailing edge of the speaker
data, since the pull-down is weak.

This is where the PDM transmit feature comes in. With PDM grounded and
disabled (the default state), the PDM slot is transmitted as all zeroes.
We can use that to force a zero 16-bit slot after the voltage data for
each speaker, cleaning it up. Then the pull-down ensures the line stays
low for the subsequent slot:

L Bus: SPK0I SPK0V PDM0  PulDn SPK2I SPK2V PDM0  PulDn
R Bus: PDM0  PulDn SPK1I SPK2V PDM0  PulDn SPK3I SPK3V

Yes, this is a horrible hack, but it beats adding dummy slots that would
be visible to the userspace capture side. There may be some other way to
fix the logical AND behavior on the MCA side... that would make this
unnecessary.

("How does Apple deal with this"? - they don't, macOS does not use
IVSENSE on TAS2770 machines even though it's physically wired up,
but we want to do so on Linux.)

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 25 +++++++++++++++++++++++++
 sound/soc/codecs/tas2770.h |  6 ++++++
 2 files changed, 31 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 8de7e94d4ba478aa9b705a81e7276bd005c8a18e..55e4723044044338bd941763240d24ccfef6e8f3 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -240,6 +240,19 @@ static int tas2770_set_ivsense_transmit(struct tas2770_priv *tas2770,
 	return 0;
 }
 
+static int tas2770_set_pdm_transmit(struct tas2770_priv *tas2770, int slot)
+{
+	struct snd_soc_component *component = tas2770->component;
+	int ret;
+
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG7,
+					    TAS2770_TDM_CFG_REG7_PDM_MASK |
+					    TAS2770_TDM_CFG_REG7_50_MASK,
+					    TAS2770_TDM_CFG_REG7_PDM_ENABLE |
+					    slot);
+	return ret;
+}
+
 static int tas2770_set_bitwidth(struct tas2770_priv *tas2770, int bitwidth)
 {
 	int ret;
@@ -543,6 +556,13 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
 			return ret;
 	}
 
+	if (tas2770->pdm_slot != -1) {
+		ret = tas2770_set_pdm_transmit(tas2770, tas2770->pdm_slot);
+
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -682,6 +702,11 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
 		tas2770->v_sense_slot = -1;
 	}
 
+	rc = fwnode_property_read_u32(dev->fwnode, "ti,pdm-slot-no",
+				      &tas2770->pdm_slot);
+	if (rc)
+		tas2770->pdm_slot = -1;
+
 	tas2770->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
 	if (IS_ERR(tas2770->sdz_gpio)) {
 		if (PTR_ERR(tas2770->sdz_gpio) == -EPROBE_DEFER)
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index f75f40781ab136cccbe1c272f7129ddd3e4a22a3..3fd2e7003c50b6a4bae2d86681e9219b5a244a11 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -77,6 +77,11 @@
 #define TAS2770_TDM_CFG_REG6_ISNS_MASK  BIT(6)
 #define TAS2770_TDM_CFG_REG6_ISNS_ENABLE  BIT(6)
 #define TAS2770_TDM_CFG_REG6_50_MASK  GENMASK(5, 0)
+    /* TDM Configuration Reg10 */
+#define TAS2770_TDM_CFG_REG7  TAS2770_REG(0X0, 0x11)
+#define TAS2770_TDM_CFG_REG7_PDM_MASK  BIT(6)
+#define TAS2770_TDM_CFG_REG7_PDM_ENABLE  BIT(6)
+#define TAS2770_TDM_CFG_REG7_50_MASK	GENMASK(5, 0)
     /* Brown Out Prevention Reg0 */
 #define TAS2770_BO_PRV_REG0  TAS2770_REG(0X0, 0x1B)
     /* Interrupt MASK Reg0 */
@@ -138,6 +143,7 @@ struct tas2770_priv {
 	struct device *dev;
 	int v_sense_slot;
 	int i_sense_slot;
+	int pdm_slot;
 	bool dac_powered;
 	bool unmuted;
 };

-- 
2.49.0

