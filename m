Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274191A316A
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577960; cv=none; b=gFY2m1bV+NJ10+4+rNNG0FLElW+GQEvlaMJHTAcoyFN4lxgQ8rIbDxIM8jkMcTtTi5CIKcuO2If+69ojdY+AC+csR3+e2V8463AdhgOeQ/K8Jc0I5XJ1XfSSoIvC7wozB4QUlCJOuSsamZjU042r2yVd5kkoHF/e3xRI+GUV7Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577960; c=relaxed/simple;
	bh=yRGOaXntFcAUP7G8Ig5QNnIqk9YZXl0nfFSHyW0Mwt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svWCw4ysgc/8p/ZAMLn5gG2s5VonW4nFJdWZ2Vu4LPwfE2fadFtzhNTOEi5MDpgOOrIlmD358gmfp40mJLRPjuQhXhdxxGF2k78IR4m3JSindb8PxMM+V7eCqBV0RjDchi04ddcqa8QAdORdE1Czzh/I069zv/PT+T8bO7p6RXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2HX+uK5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2HX+uK5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f6a47d617so46145235ad.2
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577958; x=1740182758; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvcPqQygxLwJKAjZAsvRvzstw7HN+nfaJbAbMMQ2hVQ=;
        b=T2HX+uK5TL5+MDcQ6KJ+V/UiCXpgkrWFHOg/o+NldJEQvQQ8kIYzcaHxvB6fQwVch8
         jDCNeCcRXYz2Z8oxZdR3u+uJHj5NWZ49zoeQSS7P4XQj2MYc36/tURkC4NQa5iLhyCDQ
         CK1m6DhD8Ze2rPJXSlCNUhPTBbHPrLVUxPVJZwggUid3XY/YS2tJm9o1PQzOzaeRdAsv
         Nw78qe1s4k0O8P/tLrGjc9xfm45yJtvgt58adsUvRPrpPs5bC1tDFvjXapPPHUzcixKz
         vc9wiKADlDDayxwOrl6+jq5OciWIDehIni+9gtlHKbYKcpek3cnSoXwnsBAXA1pfor9R
         4vTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577958; x=1740182758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvcPqQygxLwJKAjZAsvRvzstw7HN+nfaJbAbMMQ2hVQ=;
        b=SrFa8kHm+oYNeYcWLUccyFe5UcXk7EWaYENDEZx0Ws+B/G4lElhoa5+zI1HakjSc7v
         VahaLBO8gowZJ6Qg28UhUFEKRe39GIt/lq9bA0obHreiVFIyUJHOjqQGsPlv/xmt+ScE
         Unei9EmurCQ1f4Oeg+HE++4kAo0yroFdx/x1/RiRFF5QfqZf3X4cf9iV9QYk8Xgj5vtm
         mv8+G1vPdYzQaKQ/vWPcVuA/E2lNaTYhMfIz2wbIzFsGwCBbf5CYAUKdR8sW1BPo3nOT
         xLxnK0ZbVgecKI3ASXI5Zr4FomK5ZGsCIMeVWEvm9WccHFUsy+mdOtEsnsUFmiqk9Ocs
         8CsA==
X-Forwarded-Encrypted: i=1; AJvYcCUvQmjMo4qypfb77CVnG3rk60z1iUFQcFxLkIR0TbUrtBFFVkH2/3Ek4Xx1zfJbCQtV85yM9A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3N0h80DZnoganwx0n5bptiG6MoRTs9WvSJfeh7tjGhAGzFExF
	0A/hw+QjINKZKCnHQpWK3fp1xbXfHqvWWo7HAUEKU0GqxWXmgJf0
X-Gm-Gg: ASbGncsXlq0dn6evrB9YsNYli3r1VBvZLZayu1IsH1chPoTTebIOIIPhgnOocugWGkW
	RuqUH+338vyCWoqQpxB0wdRv/db07W2PnENq5PtK5RACVgvOoDm0z03oGNcaLhi2m6cf7+S5ype
	Mp+xSCnQxKaj4anw3mVHmcMdbXXvyV0RFhQKvxSLvdCTvHQJgr2cVqJT3gDEs0ipM3bv7FJmTMe
	0M2MjqHLQ4g3nRFdFd1r4Vsj/vs9PNw7N+NQEPbdQKi1FlQ8OjoMh20Pw7UM+pUipZW7WNveJHC
	wHhX99FE1KWWHK8JwpmR4DnPE/U0qbkr4JjbWDCLYURJK7hVSQ/btXagNxz0RXQ9yO4D2A74K2E
	TbYpK5VAV8Q==
X-Google-Smtp-Source: AGHT+IFRv69gAw2fRJoZG3kyG7EwNhQXkCZqOctEOFul9MREID8wtj+8ZoKObs4bUkkFVHzmedsfJw==
X-Received: by 2002:a17:903:22d2:b0:220:f7a6:a02b with SMTP id d9443c01a7336-2210406aac0mr17325665ad.30.1739577958269;
        Fri, 14 Feb 2025 16:05:58 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:05:57 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:57 +1000
Subject: [PATCH 24/27] ASoC: tas2770: Support setting the PDM TX slot
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-apple-codec-changes-v1-24-723569b21b19@gmail.com>
References: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
In-Reply-To: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5008;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7Dfog4ukmvCbrAJFblLGt8FQ60ffyBvdFlYgVThiPWM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb+7o3vA5pUraouFG4qtz9YIaGl+X+krMl+eYpPwm5
 ON9++jbHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAExkXSIjw7GJstcfpPeua/9i
 9rBcTYOpY8a9nsA98tcXhiqGS7MJFzMy/DXiOfJe7LDhN5/WKybSQh57YnMvcub9nKU8pT+FbZ8
 iIwA=
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

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 25 +++++++++++++++++++++++++
 sound/soc/codecs/tas2770.h |  6 ++++++
 2 files changed, 31 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 7ac7ccb32b4db2050a8543b950a9872b7551845b..555642d5c53533d9959314f0384c4dfe91ca799b 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -247,6 +247,19 @@ static int tas2770_set_ivsense_transmit(struct tas2770_priv *tas2770,
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
@@ -602,6 +615,13 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
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
@@ -769,6 +789,11 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
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

