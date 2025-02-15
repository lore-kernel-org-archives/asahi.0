Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E56229D0C
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577850; cv=none; b=LayNVpKEiGNKZDqPOVQ2D8KzpI9mU9A/f3CXHm8I9eZ72m2k0XUHrQrEFhW24iXJ+UW0h3logt6iYz3vZnCbTp5RjgrKF4WhVFqkYKFx/kVYXM/X4LnULPb9TOQsYIhyrZ+FdeKL/CGQYFRn8ko8EPqyZEQu8Y2SbO899xI7dkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577850; c=relaxed/simple;
	bh=x3X/J7jRRdV3oXpM/nwKMeoCk1MEJMElH9Do++utVEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d2YKM8rrjXe4jb+Yc7Zea/gzLx/jsva3JdV2RCG0WSD/nvqLhSQN6ET7cXQ7lIJnm5eZngVAMmHpk+yiQmHww3HodYwaDH1hU7E66gV9R9YBB+nHNZMGk7qC74hZ+FmLH9qoAfaq/kNGSY1OfGz9cmZpYaAJ0WQWToDHbpwiNjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1+98djf; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1+98djf"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21c2f1b610dso64167615ad.0
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577848; x=1740182648; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZlnAUEumL1snBEGJ4Y34sXZ9QMbvLdlHubepbtqR47I=;
        b=W1+98djfZAE55b9rNlhyXngMwHXoSnim+DUJR9+hW9sc8bwE5vEZK3vgONQiEML49j
         4r9DMUB11BTcZUBHqIEBledMJtJ2W3fmhi2tw15BL5ucjA5o6wvOcNt1QWkZ4ZrsCbYl
         u5ErsZoficHsJcArQRODWrV1WIO4F9PuwzAg48wqQzgnJHWiayT8kHf10E2PwYOELdHj
         GGkoNDOjJTtWCCddq/hYZ2m6cJ22WI1bt+H3n9JQUFhzdF7kek5WCPo653BgZTv47sXd
         Yq976piRqGkKNCL5Ir9Qhg+NekTwxkJWev+zj2SDBAAJuqROSfRCzhT64I1Lm0QsCtgD
         XtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577848; x=1740182648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlnAUEumL1snBEGJ4Y34sXZ9QMbvLdlHubepbtqR47I=;
        b=fROiXWzEFms58s8gHCl9udw1wTM5yCpBaDYErdlyhw9VEPDFJ6RRp2/I5CWw723YN9
         Ktsp8VwG7EYcnlZm5b0KBiGY0KgPS6QKoggcejN6QQNIUOHHIcdo8Tc7Aqye8vwwu0GM
         36T/QwcQFjleTW8tIMdp5ZbtiGQvsMFRH2whXDNkig0i7Ebg9caJs5ie3DdTX8r4RuJJ
         jCEC/Edqx+ShBHaxD9/WAQNyjDdQslXqlmln9QI1OoJRrCRZ3cggosPuDIprcObBcS+J
         9trsf4TFdxrVlH8MavmHB1ImVpNgM1YwNeWuZKCX6WbeTwhq2D85ZUGVvDF8Qi1yyY5s
         89RA==
X-Forwarded-Encrypted: i=1; AJvYcCXwG5jwV7ww5RmbDKk24jLAGYMwlX63tkwwOqzEnYRT0qstQemJELbF+OcdXINsh3bB0S0JKA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3UjjNUOC7nhKujlnyRJsWhhaxo56N77PGcEy4hANLDVEFmcB+
	lPC7+lJxJ3FRjSkYb/FG8jO4hnB6x2fAWhfhk523Z6oC9mbMswBp
X-Gm-Gg: ASbGncvErq2Tx8zkrLKG50Mc8atZEmqoqaiXKPMpuLztruQGtseeIhFWFa4mUTCtFwE
	LDbE6/tbUXpBtl7a0+j/jg+TUc2LMlO9NYDlp9kH3xt+uyJgUMHg4E/KZ+zQ/g9Fh3nGO0brhfE
	X4zccjtvjsB+UUSKn2YjhSxTNq9EqPC3a7x+Zi+QcmPFfhAs+bHD0IgiQ6ZexcgoBhP8pTYMAU7
	yNXEN5RDYkqo7WizHIxkGnISQyV+CYn3RRVp9MHQTjNQefATxrGltHlw5uFrb//3XPO5OFpvG15
	WfwKkhWIA9R723zWL1kg+PuOzVLC7NsqXNE7krb8eHwvIZkfZ6udNrIsF2NLTkqDsYpJmKgpINK
	iliObQaVAmQ==
X-Google-Smtp-Source: AGHT+IGMbVf+oIvKO42Y/8NEStakQJ1l6kBwVqtO/ZePkg1SGRKsak1GKPDunnaaDh6kBSNw0x7W/Q==
X-Received: by 2002:a17:903:41c3:b0:21f:baa:80c1 with SMTP id d9443c01a7336-221040d74e3mr19468095ad.53.1739577848518;
        Fri, 14 Feb 2025 16:04:08 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:04:07 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:41 +1000
Subject: [PATCH 08/27] ASoC: tas2764: Configure zeroing of SDOUT slots
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250215-apple-codec-changes-v1-8-723569b21b19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2864;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ZrV0a5IsC1OB9lfc0Tl9W5OcpAjXMhwf4kd0SmKIBwI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb24tqq/efntJ1w/hZmUFr+w76sufdd6XT9SwLVRIM
 V94csffjlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACYyq5rhf4SFZrHOKUn/CQd8
 YrPlhL8c/Pyxc2KJerWNcLlP1P+/eYwMd0uNT0Qv4VrqubLuNvdW2y2fN0y+N884vrQ0aF+Oos8
 fRgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

The codec has an option to zero out certain TDM slots on its SDOUT
output according to a preconfigured mask (otherwise the output is, for
the duration of unused slots, in a Hi-Z state). Configure this feature
based on a mask read from the devicetree.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 23 +++++++++++++++++++++++
 sound/soc/codecs/tas2764.h | 11 +++++++++++
 2 files changed, 34 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 6e91ad9229cad62860adc1f446fffc8872d32ca0..811f4f54cc26bee05d717552c360fa50e7d6c7fe 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -40,6 +40,7 @@ struct tas2764_priv {
 
 	int v_sense_slot;
 	int i_sense_slot;
+	u32 sdout_zero_mask;
 
 	bool dac_powered;
 	bool unmuted;
@@ -594,6 +595,23 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 	if (ret < 0)
 		return ret;
 
+	if (tas2764->sdout_zero_mask) {
+		for (i = 0; i < 4; i++) {
+			ret = snd_soc_component_write(component, TAS2764_SDOUT_HIZ_1 + i,
+						      (tas2764->sdout_zero_mask >> (i * 8)) & 0xff);
+
+			if (ret < 0)
+				return ret;
+		}
+
+		ret = snd_soc_component_update_bits(component, TAS2764_SDOUT_HIZ_9,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN);
+
+		if (ret < 0)
+			return ret;
+	}
+
 	if (tas2764->devid == DEVID_SN012776) {
 		ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
 					TAS2764_PWR_CTRL_BOP_SRC,
@@ -736,6 +754,11 @@ static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)
 	if (ret)
 		tas2764->v_sense_slot = 2;
 
+	ret = fwnode_property_read_u32(dev->fwnode, "ti,sdout-force-zero-mask",
+				       &tas2764->sdout_zero_mask);
+	if (ret)
+		tas2764->sdout_zero_mask = 0;
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index 20628e51bf94f047e3dc7cac73ac01519ada1852..10ef7d4a490e1dec3ba9c824479a6d35ac57f33e 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -117,4 +117,15 @@
 
 #define TAS2764_BOP_CFG0                TAS2764_REG(0X0, 0x1d)
 
+#define TAS2764_SDOUT_HIZ_1		TAS2764_REG(0x1, 0x3d)
+#define TAS2764_SDOUT_HIZ_2		TAS2764_REG(0x1, 0x3e)
+#define TAS2764_SDOUT_HIZ_3		TAS2764_REG(0x1, 0x3f)
+#define TAS2764_SDOUT_HIZ_4		TAS2764_REG(0x1, 0x40)
+#define TAS2764_SDOUT_HIZ_5		TAS2764_REG(0x1, 0x41)
+#define TAS2764_SDOUT_HIZ_6		TAS2764_REG(0x1, 0x42)
+#define TAS2764_SDOUT_HIZ_7		TAS2764_REG(0x1, 0x43)
+#define TAS2764_SDOUT_HIZ_8		TAS2764_REG(0x1, 0x44)
+#define TAS2764_SDOUT_HIZ_9		TAS2764_REG(0x1, 0x45)
+#define TAS2764_SDOUT_HIZ_9_FORCE_0_EN	BIT(7)
+
 #endif /* __TAS2764__ */

-- 
2.48.1

