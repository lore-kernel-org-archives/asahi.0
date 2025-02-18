Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096BF23C8D0
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867967; cv=none; b=Xu4TiaT2lBr0gXFpYA/phTBGz3o2zgZ4Y0HykH1a5mPbhbmF8QJVa6WNrZK/ilbT2bF9HBjnMk/T2u+2uc4NWg3d78mkWTZSqbKFnzIy4cXGXU07LNYeDPDh9rltb1amwxX2xBD4aDelDlAnRfPxkrHYSvd0I3GnGjBJ/2SVXMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867967; c=relaxed/simple;
	bh=8ff1GLFJSH1XFuJHxqTqo2n8oq9C1G7biNgZMRb+Sko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OEHP0uyXbflQ7SUIAbPZQ3fYGAhWkkck2H5GuqDbdsrJqtfoSXpuzmvB+vsrETPqe6Yd4Ma407c65XR6a3cFU1u7CSr6lQ7uh908iQ8GAImMYZWOTOuDAAQQDKwOdQ0O6Z5FPPubUQHLItSXgDkj1tzp02b1uRBFs6HZKj2IQ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzBIZA1M; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzBIZA1M"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22128b7d587so34312355ad.3
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867965; x=1740472765; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43Tky4Akx6Ximp7XJZMHWPUNscdFFs1EIfbFGCX/210=;
        b=hzBIZA1MKvWGse4rEHjFPPnx+8iB2apZr3Z+Q4lAZx1kLoFEIyGSaPKi0Lt6wSRrCW
         QeB17evcLubRVvak/Jfvilx0irOzZVomOFxJK5KD/D2zG3+fyF+zyoeCuFnq6Jls7U12
         rVneE0U4zmKVSU7mrnIniJZNW0F+gXK7fGPK6snTk6WNtbbulkd9SgY+48zm7E8Pd77V
         NOUon3jTxRR0KoB2FqzNYshuKDSeTA0jrT9IHuzFlduZ74v/3CcztgqPdtqnWMKjl7Nl
         IaUtsaIxURBsvMTsqF7CzkudJd4X8IQVvinU8akSY1sFG3Snc7PkidbtRmTtPnN3tDMG
         4LdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867965; x=1740472765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43Tky4Akx6Ximp7XJZMHWPUNscdFFs1EIfbFGCX/210=;
        b=nkzRiOAZpHHFzOLvxI3ZS0AsnV4prj1a0S+dqRX5AWPuSTPnEH4B2fJjgCpKsO8MJC
         0W+fOt6itqpkLzt8Yj/ehQk1+Qk6rr52ZcS1nNJUe7LCDfLwSxr74+ybdlFX72W7BiLv
         l8sv3/NuCYbamL033enNzdsvVJr8NLLmQYnHjRlEJRj0eMdvrFsmplqzNQzKLXado0ue
         73y97JOyyQIM6jt8uc+K2QEKQhSJ7sI3tVHqkmFOxBICX1mYx5XTfwLztwa6uLoECscL
         lh4HURciMzBZ7KjuE26HejBRIAhE9E4bCvR5wUspvLr6PWwBxfiDKMmfuht5qk9V9UDP
         9Nlw==
X-Forwarded-Encrypted: i=1; AJvYcCVCLAvmDpSQ+0PMxcGFp4pqIxfbs5In1HoUVeAFAKdDy0rGgDlgNkIm2uVRYJdwyreQTz7OrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYvRnXBmL1DzVvcRXHBmDcxsKcsD74CFwOAQ1zb+ALMduImga1
	FY20ytJ0WsSTQm4rWIsUxVqSUy+EgRXL1d6w4NwKoJiCrNJCxfye
X-Gm-Gg: ASbGncvAJU2FOEhqfmEU1EFPc/iBSHmeYKL0nCnBJTcQI/ESryOfthKd5HGDfL3/sFR
	AN8FrydvGIOluU8T0wXicv2RUK07XzyyAv4JeocBPGo9qJ+UxojnkGcbUIGrvGWUGFuHKMIyMpZ
	VIQkot8r7rOFBZkQDqaDn1BUS0DUgGBWRpPHY42OQJM6Ptjs9ly+9Q7nDc3y8WCH8S2qRodV2+K
	51qTLGCO1GHNEB7BoQ8zSEB5llv1BXfVFu73E/Ifj3yKWU8YLhx9GwAaeI34XurUKf1riO9/PRa
	9m5gHAgwTq3po31XNOkAiEelqEsOz1mO2+hktEazlVy7/d0I0BPmF64L/ozPK0aW+sEHSh9SOPl
	WkYc4VnuykA==
X-Google-Smtp-Source: AGHT+IHNa++DvBF93IL8ikGwt+GXKPzSaW/MueognJN9Crhshcs/9PQZmE3fXkv/R0Z7oKx/w8ecXQ==
X-Received: by 2002:a05:6a00:198c:b0:730:7885:d902 with SMTP id d2e1a72fcca58-7326144b262mr22648246b3a.0.1739867965144;
        Tue, 18 Feb 2025 00:39:25 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:39:24 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:36:01 +1000
Subject: [PATCH v2 27/29] ASoC: tas2770: Support setting the PDM TX slot
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-27-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5050;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Ud6taGhvuu8nz8or2ySRZQRi+fer0UI7LxTM7YQKGiA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3JL9mU7wr1ue+/liBP+BWV4d7359C8+fcOORTs3L5
 H9PJ1ww7yhlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAimuyMDFPuxL0SfZmQeoHP
 pvZjtDdjZKHQs7YrSe2rVtuf+fKlYBrD/3r5WRLhf0+uufpcxo9nXchcJU3nhRz2fYkfrLsPe53
 Q5wIA
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
index 8adb558f9e89988e0decc344502da8226f8ff517..c4a5f4d1ce09a8e68759dd75d532d06d2a7f2d39 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -248,6 +248,19 @@ static int tas2770_set_ivsense_transmit(struct tas2770_priv *tas2770,
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
@@ -658,6 +671,13 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
 			return ret;
 	}
 
+	if (tas2770->pdm_slot != -1) {
+		ret = tas2770_set_pdm_transmit(tas2770, tas2770->pdm_slot);
+
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 					    TAS2770_TDM_CFG_REG4_TX_FILL,
 					    tas2770->sdout_zfill ? 0 :
@@ -825,6 +845,11 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
 		tas2770->v_sense_slot = -1;
 	}
 
+	rc = fwnode_property_read_u32(dev->fwnode, "ti,pdm-slot-no",
+				      &tas2770->pdm_slot);
+	if (rc)
+		tas2770->pdm_slot = -1;
+
 	tas2770->sdout_pd = fwnode_property_read_bool(dev->fwnode, "ti,sdout-pull-down");
 	tas2770->sdout_zfill = fwnode_property_read_bool(dev->fwnode, "ti,sdout-zero-fill");
 
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index 2c2cd777f4bcba8ca91f79ccdfd9f159df5d3a97..b309d19c58e1daff980025fbced506a1a744559a 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -85,6 +85,11 @@
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
@@ -150,6 +155,7 @@ struct tas2770_priv {
 	struct device *dev;
 	int v_sense_slot;
 	int i_sense_slot;
+	int pdm_slot;
 	bool sdout_pd;
 	bool sdout_zfill;
 	bool dac_powered;

-- 
2.48.1

