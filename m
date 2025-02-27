Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E5C22F166
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658173; cv=none; b=itn8F8d/BcxQfA2Djm7KOLpEYI5fOjln59+NIGUnuAMemFYXdtUCrZTE+/B0GgfYPVxWDWUPy42EI5RwV1bRHiKH3+zsbV547zVirakncuOCpGVLvnT33FDQeQ6blLIZweUjtW+uY6fCSQHh+em9LNgIu2pLQOLfI4pkS9NU+fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658173; c=relaxed/simple;
	bh=y9R3gC4DcFYDFbAgeXOJCoKDJMqg1SlzEiGmhUycXwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PCcjwzah84QuxPkG/IaEdqUb7RAR0I0Q+rrs2AXqGEE6GElkMTjG44MOGcuLErqK5KJKnW1P2rCmh+ub70o/n1vE4gu8RYX26n/7IgyjWIswtVD+zt4+OVCapW7i2CA8F1su0lLFSNiUy3sDbaZvw3ysskFpYWymRTb3kvYj+3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=an/v20SI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="an/v20SI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2211cd4463cso14181995ad.2
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658171; x=1741262971; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeoXHbMNaZZnZxWSox36s26riivTYQEGCI8dhE09lK8=;
        b=an/v20SIqbh69TggvuMx8sZakcSzn7afwfNMqWfVgHiO1RtYP9M9nBwQgyCUIodc2E
         PlIV/I+5WO8RFfW57RYXk8Lum/XdUvkNcTb6hwYsVgkJMfTzwhNhF1ThL+kr7PSY9jpV
         5345GAvZSnnAHgE67A71DtDvoGTfj6ywCYXA67tr46f0PNzNWxg2g6stme8vSHwV8Izz
         4vjq+HVXkz+mvOTd30+9VQucYqMwjrJjCa+tl24KLZC21UoMRzuIIkv0/yAxIlAJTb6Q
         T8ycN7gobDliIRjpWtDyuv3+q9mIB3s/klkWSYm+vl+I+3IWyM1cnzBOpMNQDWl2YyZa
         tUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658171; x=1741262971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EeoXHbMNaZZnZxWSox36s26riivTYQEGCI8dhE09lK8=;
        b=KJOeyCkSLXJ8cYDXlCQjv+K52RHHShmwQ98wlEnOCxoUzsA0N9aB9O4l1SqgsXmhIU
         bPa77Jcrk++7qwyDItosBELDwBVYPUvF7Lj/Va1cPWclKwbj2E3Y1vENBSi+OdEV7lm0
         CuhXRORrJebjkOVkR0yZFLzNTsye2OJeQiWoHlM0HLQ/Gu6GwHEru+FthOcMKpmTrSgP
         HOvk/vYG5AdbA3WSzRJPtNxXQl/nR3+tkb/wsSsG4J3iiF/JZPqjSjaWFcrdRxW+W/qx
         9XcsP/9Ta3s5f3zz+2vGTiFh2cqN5mBCT/+e8NvEgx/m2JxA46cQ3LKEubRf0A4Djhrz
         M+AA==
X-Forwarded-Encrypted: i=1; AJvYcCXaMOBXJm2k0OKKrvNGotXpGjbd5pD7csI/qO1/GrjdspTNXuZ+95YzH5WyuixnLPr5zDHE5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlJruAoKV+0C2cB/xKZiurVxHJ3sbhZO8gydOE/pOCXuUosTWB
	h2yi5JNbXQUsrlmScambub+LtnTkVPx2SYYw9qypsmLJNYeCDoJe+LH2CcJj
X-Gm-Gg: ASbGnctuayr6G/2+GzeQFMEp905MXqGLXXFhrbyVTOX9dWU0wDhmype1AcUnYHykByA
	UydOZQf0i1L6nyMA7WCcyQV6UdYejlRL8NlEEOP2vxd7Hv57Lqh5WfJ1NiNkRulMvY+dI0fQ3Av
	qSvl41ntYs6x4RPgx7m6adrW/E0SLt48FegIOtRGpq8NOOJqC2k1gQS6PhV83ax7db7fgDkD6xh
	N18y0t9V/5OvsazSZO76DpSJH8zbaexd+NYNKn4Wkp7WpuYxjsg/3SEaGQmcsWI9Ymi3w29b2fR
	BguYccVHhKTasnHMUitmX7IZt2yXnLGiT8Hl6SBd2nKZqTiJwhzuqeOoDwammmNm2sv5xxhn9hy
	mN0Xj/fXyxgpHsWbIv1Tm
X-Google-Smtp-Source: AGHT+IGQyu6iPi0iwFfK9ojHPFOpbCezULBKbxEBCo5/jEYx233lkSxpnDwz+L55Flf/FLjGS3vkww==
X-Received: by 2002:a05:6a20:840d:b0:1ee:c631:6057 with SMTP id adf61e73a8af0-1f0fc78fac2mr22023526637.34.1740658171206;
        Thu, 27 Feb 2025 04:09:31 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:09:30 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:32 +1000
Subject: [PATCH v3 05/20] ASoC: tas2770: Factor out set_ivsense_slots
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250227-apple-codec-changes-v3-5-cbb130030acf@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2333;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2q7/AnA+S3zg5UY6950rlfHRPwEmvXdr4IHaVW0DiDY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk9GbI52PlW/wYJpQ1Kqw3N9Q3uzmV4qBWX3j2Uxr
 jaufnO9o5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIlEfGZk+HHQ8qHWhOWFF6pe
 X03j3udy/d1byenfb6ptFj+Z0SO+dzkjw+HgpvtlrD+EUi0n+vw8vS98Sf26y0GJjsl3V3OsWL9
 0LwsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Add a new explicit function for the setting of I/V sense TDM slots.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 40 +++++++++++++++++--------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 863c3f672ba98dd74a5ba1b15d650a90f91176a1..4a86fcec0c1ecab45b9ebcdfc90c78f3290c6fa6 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -189,6 +189,31 @@ static int tas2770_mute(struct snd_soc_dai *dai, int mute, int direction)
 	return tas2770_update_pwr_ctrl(tas2770);
 }
 
+static int tas2770_set_ivsense_transmit(struct tas2770_priv *tas2770,
+					int i_slot, int v_slot)
+{
+	struct snd_soc_component *component = tas2770->component;
+	int ret;
+
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG5,
+					    TAS2770_TDM_CFG_REG5_VSNS_MASK |
+					    TAS2770_TDM_CFG_REG5_50_MASK,
+					    TAS2770_TDM_CFG_REG5_VSNS_ENABLE |
+					    v_slot);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG6,
+					    TAS2770_TDM_CFG_REG6_ISNS_MASK |
+					    TAS2770_TDM_CFG_REG6_50_MASK,
+					    TAS2770_TDM_CFG_REG6_ISNS_ENABLE |
+					    i_slot);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int tas2770_set_bitwidth(struct tas2770_priv *tas2770, int bitwidth)
 {
 	int ret;
@@ -221,19 +246,8 @@ static int tas2770_set_bitwidth(struct tas2770_priv *tas2770, int bitwidth)
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG5,
-					    TAS2770_TDM_CFG_REG5_VSNS_MASK |
-					    TAS2770_TDM_CFG_REG5_50_MASK,
-					    TAS2770_TDM_CFG_REG5_VSNS_ENABLE |
-		tas2770->v_sense_slot);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG6,
-					    TAS2770_TDM_CFG_REG6_ISNS_MASK |
-					    TAS2770_TDM_CFG_REG6_50_MASK,
-					    TAS2770_TDM_CFG_REG6_ISNS_ENABLE |
-					    tas2770->i_sense_slot);
+	ret = tas2770_set_ivsense_transmit(tas2770, tas2770->i_sense_slot,
+					   tas2770->v_sense_slot);
 	if (ret < 0)
 		return ret;
 

-- 
2.48.1

