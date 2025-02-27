Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA6922DFAC
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658282; cv=none; b=oSs6bQy7+GCVPj1QYHbE11un4UqKpajukQjn9E0cW3AVC0YoeFtwEeB3lG5jKwxsFwsUEdPtF3uoZNUIftIsZN9+MfMjOMRmJfse26AjJVkoCBvVtyszO1mI36mLp8g56WdAeyp7mk/0qcsmgipYOxa8LnBEklL3UGSYSQT5Kd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658282; c=relaxed/simple;
	bh=FmMYAaS0g9J/Y51FxpyJGJEmlvFEqGFqqETx+r/xGj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P+xK7Yuaf0vsRltPX54BkwqcUTosAimTbqipx+fg5g4GCAlzb2NQQKmB5kgqYGejatzsWeoc7B7ZtdG/dHUjSJmxMLiPc4TlWWMnZOQ+050cUzKRP+qdCjdM1cy70WCW/0KNEfBDFDWHK2RVwwtUDBJuW8mkIUwpNT7brw8OS9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/2kS/jQ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/2kS/jQ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fea47bcb51so1391677a91.2
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658280; x=1741263080; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dp1zmiq9Lyv1s5sJ8tXVmv/9N0Pmr+pQll2ckpeefQc=;
        b=e/2kS/jQZaAkFypph3rDw1AHtBsK8ghoxi7MScHMe2mBhMJxDM3ANxg+Esj+RAHmTM
         OpdzQEVaJaxOdYuQxCKVc4Fy/2B4SGZIN7hDqEwk2bZhCeLXXFSxQQz8u3IDL96dZRll
         wvb69e3dzLEOLkfDHLg072SiMjEuVnEE2ONtWqh72ATGD8Vr8TEOsJTTj6XxiM4ZlqG5
         45OKQUs/JjkVutIRqyaOBZZe7FNGxbWRR4scFoQ2NDdYBv1dkWwC+T98P5BJmOo0LFKC
         w2HOlBPFtLm6B03VXWQ9/dPX0GyZo/K2SYhRUX+TassPn2EMi1XYWNOGETOhauiz7bQA
         G47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658280; x=1741263080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dp1zmiq9Lyv1s5sJ8tXVmv/9N0Pmr+pQll2ckpeefQc=;
        b=hO1lwJ2a/3R7jebeXrGH5HY7wg1h7lUQQfQUn/LWD3ZMz1HRF/kpFIc2G27NSVeSdn
         piXKTZhH6g3+lRsqVfXVLuHp7R5up5OMw1KduzZ4SF0iqm4/+Bqr6fn0yXPiLM4osKvx
         D1Ipx79HjwWerz0FsRBddCvt3YreD5ORQ/MvZX/jbPVNilrp0E34VBlvGTVoRgtyPrzH
         jFVvd1YF3nhZue+JBUsUa+XChc7ienklKs1I0ic52PomKVGKGPnGkM2B6zap2uF6bLEj
         Ao9LHe0innbRDLx1nctGbJrLVU7PAMJLM36gdoGXMfGb9lr5BL+k7Z+g87QJfQlWZyY6
         1oOg==
X-Forwarded-Encrypted: i=1; AJvYcCVfRdP1OqgHuH2HlQBIDltPmBhnHZcuDlHb1pw6uzXbfS4BMurkeEDCG/oFttNU/4VOJePnUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxT0yqXezzBjrNC4w5IkK7egiaOGcZd21NZQhBD0udbNlYS68Wf
	4BOtIKxyYOLpoTp/mAVMF0Ql1cHK8epZ9zNS2SgSNK2iy6iRN8+avqw1yoU0
X-Gm-Gg: ASbGnctBWU5sSlkXP5JFCi68Rlb3Yo73Prj/CnRxngHkhbicXVlLTIolhbaiuppWwye
	0eusGFAPYy0pXEDM/gWTKTPRgFh9lqDp/mGoqD96/GuOO127kjnZIhwDkZi3n/eyPuN8Z0BDt4R
	iFWpeyrVyhwdxrMO+ldGj1TUc7SzqSnqPwo4uWGryXZ8bQ+y1Q7pfweRGIzvf3fWOwUvBRUlPXq
	AvpPs+MrYt9SgGwvpBXIRN29uzj8PXse6VidhrFbrS7gaKwfOyPVHFWAkDsj9Wkmp2J2xZ9BRda
	S8s3D8AnpzSaXau9SqwaJNRzD5fSeCj9cVBks6ofo1gPemKsv18HYQ7abKfFLB1wL8/4pBV+AKa
	hVj7FAFteOcfZAqke0ZO/
X-Google-Smtp-Source: AGHT+IGpceu1tOQHfCnl0k/McKg/rkJIBO+eKPlsv8uvLRXGOBMSYn6SVeyGkAGz/eHQjVjMJB/HMg==
X-Received: by 2002:a05:6a20:6a1f:b0:1ee:db10:a4d3 with SMTP id adf61e73a8af0-1eef52cc902mr49320507637.6.1740658280280;
        Thu, 27 Feb 2025 04:11:20 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:11:20 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:46 +1000
Subject: [PATCH v3 19/20] ASoC: tas2770: Support setting the PDM TX slot
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-apple-codec-changes-v3-19-cbb130030acf@gmail.com>
References: <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
In-Reply-To: <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
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
 bh=aDEXw+GguL10lbhJbopfCU5mJGnX7ZIfIEW40Bd3gCA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk/XN9RO4nM1Wn+n5L+D/obNbm1Syw68yedUdnRZe
 c7AdVVXRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABPR2sXI8FnO6HjCrgl/upP/
 mr00mfN4/fziAFfZ40yXGfgsZax4zzL8U/2zRif2wZwpk/b073qa/0Ym2bEsvugex9OGyQt3Vfk
 HcAMA
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
index 252c65ae839a28fdaf7aaa39faf49891905741a0..58f36cf471a6b7dd15c1b0600710396de4e2f61e 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -241,6 +241,19 @@ static int tas2770_set_ivsense_transmit(struct tas2770_priv *tas2770,
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
@@ -632,6 +645,13 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
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
@@ -785,6 +805,11 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
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
index 7da60d2746e8b03faa9d17319c4c41cad7f8cdbd..8a208cee8712cb28422dd10cc5d80c460666728a 100644
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
@@ -149,6 +154,7 @@ struct tas2770_priv {
 	struct device *dev;
 	int v_sense_slot;
 	int i_sense_slot;
+	int pdm_slot;
 	bool sdout_pd;
 	bool sdout_zfill;
 	bool dac_powered;

-- 
2.48.1

