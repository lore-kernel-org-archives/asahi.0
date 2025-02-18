Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7089022C336
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867811; cv=none; b=AuHzo5l+pKqX1o66v59Aqk0hVHYsBnfaQbt0rB8Nafaw6vbDf3JHVvtnFAJfotBVIc/brfm9Vlih/INkOPDD6evY9ZJy200uc2oe1MSJvrT356a1QvWqhvXItyjZaDKc759uLxDOjJ7MZole53B1kSyDwr/d2Jv58M/R2cXL1ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867811; c=relaxed/simple;
	bh=y9R3gC4DcFYDFbAgeXOJCoKDJMqg1SlzEiGmhUycXwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aiS4o3jPLwimLwN9wSeanvsjPkRobEak+M08U9nKipSOrGwx748UoWrP2Kutw2jnGrFSgiUjj+z0GWFuJhCMKFeMrH3N4JJbozrYIvflU4/gD+EcxJhzaSylb53dFIWH6ONiM5wg5ZpSW/Vaajl6stmPB7NUJirJ7634l4hEUko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBfeRv2q; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBfeRv2q"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220c8f38febso93471085ad.2
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867810; x=1740472610; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeoXHbMNaZZnZxWSox36s26riivTYQEGCI8dhE09lK8=;
        b=NBfeRv2qBbss4FC0cHQw4LjKQLvk+Qgq/vzG0eJSOtxDrNyfAAOZCQO6s2LDDcKvN2
         n928fj0sRYmJ4tPPHLvNg07g+ZXQdu87ffGDn/lEYL24vbgkNTzpyAvH+32dfAMUcZOF
         MjXpxtghcddypk7iT0/c+6G0fR1lW4xJAjWhHlQz+ktvMo1VmGP5mCrq2ixbzqW1CHp3
         N/AY60i6KIe0WZyRE83hYh1xeFK5BNs9YZgX63v5Q1EwADbDDxDfXGV2Fnvg4MhsuhFj
         JSeB0Is/tUG17ZlKL108rucHdjo26pUb6xIRYaQP4E3m7mhBg3i8UsRGKGqbRi8viM+N
         jn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867810; x=1740472610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EeoXHbMNaZZnZxWSox36s26riivTYQEGCI8dhE09lK8=;
        b=nycY4Te/mP7HJq4gy2EC0ieY/RdSVnE22A7cmZA/I262WPx0fCh5hIzDj4XjJ++gs0
         vT9EgUSFRd9qcwhcrwTFmOCzLn8UcPfsN2HqH558wPaPYTwJkatK6EaCQmrKbpMAyWzq
         6S7u8v/Ulgz0h+P+/nUG5wl3HXZPJM5DgL6b7EtlR29pqV9xDr0QQ8rgwVF6QXhsIHEZ
         YGFvTlkbqw/gsbhk+2DKuq8obAkx8dd9o0DzfnpIZEOu3MVZGVmae5/oITEWmbdZuAgg
         pZzty0vgvHYndwfkibMO54h1Ax8n3hOPXT6AdxjEVavv+M1Xa459rUUYgUWgRjKkQIGv
         CAZA==
X-Forwarded-Encrypted: i=1; AJvYcCXjbtWP/42SOkrs+jCGopnc1M8VtubVmQGvq4jcfzumwKvbl+LhlLwe1NWlWkKZJNfkwW/Xmg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6hWflSESR5wnlX9kPBAzAGDIfmmcrOBlyWpqqV0qbImDsCqX7
	VDCF+T/050IeF3Z76u9vWs7+eeP+U42PcLNvFhK0UEbNbtdpx5gtAy68JrtQ
X-Gm-Gg: ASbGncv4DxpEdcOIN/mKMe2W0P7Ty3GycUp1rCHm6zcN5jXiMC2bhhtN0f91UBb4tUt
	04VCXTfBCcbGxmEUGFii/oqSOWF/ts1ivTjOyp8bp8uVP/VMxUFJPOxoeaXxrXdZLwt3ZY7ovDQ
	mnga+12F29t+/C5EzFmFE9p9PShp19yCNUQnglWjHyg1nqeaduVe+NpLhmxqhe95xgy9WSkQ+K2
	DkNl5VsRjMr7uWWoZrFW0ABhdWUtKzSNQRel1PAY9fZ6Gb9k1/Kt7Y8sQLa55VV1e0jgveKa86b
	4OwqN2nUy0IhRNwdRJ4SRYlfo5/SjmsbioWxVmoKBOlrrtqLwqVp4iHB0fJkXaAxQCIpGf7YqKg
	WorP06l+wiA==
X-Google-Smtp-Source: AGHT+IGPbLuqbipaBn28ukI985CLtVT8f1ut4Ayk1W47T5tA6vEIHMLymg1VfjkuDP7Cp+W7NPG/cg==
X-Received: by 2002:a05:6a21:7a4c:b0:1ee:c8e7:203c with SMTP id adf61e73a8af0-1eec8e7219amr2930381637.24.1739867809711;
        Tue, 18 Feb 2025 00:36:49 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:36:49 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:41 +1000
Subject: [PATCH v2 07/29] ASoC: tas2770: Factor out set_ivsense_slots
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250218-apple-codec-changes-v2-7-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2333;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2q7/AnA+S3zg5UY6950rlfHRPwEmvXdr4IHaVW0DiDY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3BJqftW3cyx71y+yON1BqfuC5sJ1L3iiLn+6UlFmX
 eVVoOnVUcrCIMbFICumyLKhSchjthHbzX6Ryr0wc1iZQIYwcHEKwEQeHWT4K949b6/VTqVLzo+Y
 JSVPFcbNEjTnizrl0vqu6EvtZ6tbOxj++3Wl3axIK7fZe8hxsd3C50HXRBt2+WvMaS+dFVRmc3k
 OLwA=
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

