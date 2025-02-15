Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2638E1442F3
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577829; cv=none; b=Tp12kzCzfqkLRSxQ2wJf4wMl2ki8Rm2TeIZsKveMj+Jio7Z2E/Lcyk0GhQ3RQsdEjbh3CN5EkEugj2ETZJc5TWEJ508plV8MJmd+3EvvC2MkqJn5htyw0vaKIwo+bCJ1ZB6PlA1q8H6l5zJj5hQZ4j+zKOU70vAVY7kcUaUOvTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577829; c=relaxed/simple;
	bh=HdOUzZNF2Pmnypg58HHdjSM5E49x+d0F3QxO9cXe+GA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FkG0f9kOmcvOSHkJ5v/6QfnVJKHkeQCwvGR2+wuDDCXlpQD6K8fDJqWbVogREX7JuteD+HNOVofjkCfaivBLOojfRBcD+uvo5m/PJstVVPaIccF6LDiEpi2KkxJWuXlG/vo+mAkJY0sKA+nEyJm9fDXgxuM6LNtAfqOCb8iC3u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iG1h0uSD; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iG1h0uSD"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-220d398bea9so37533655ad.3
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577827; x=1740182627; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSfO+VowtOqUTrjFAcOWpa8HkJSqbuMrDyG+/l9mYPw=;
        b=iG1h0uSDSMbxYo6Em33IuE+ot646pnx83/WUHtq4KPlrN/UFvYAaEyP6dZh4s2W3sF
         WKcd299IQtBa/A75Q8Mzir5mrIz0WUad/q3DZ2bduy0Wl05u9goqbjGqR5Z7uDT0IQdj
         wOPVlwacDjLwO1RSi0uvXOumhVRIzdRvVNFL1lEJu31L3hSOTT5yJKw4Ww4FyQYfHIY3
         6fhYhlDbUZGMV+cA0KxJcGucQytFnwgi29NdMitidsX38BiEkmm6ZH4p8M0qcPsd5PJW
         ukdPYQ0SgNLDq5ieJq/OV3mFB3UIGJ3vWxbr9rzGEgn65XOojn/Iz5rmJp9Dr+Hfh6uy
         P/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577827; x=1740182627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSfO+VowtOqUTrjFAcOWpa8HkJSqbuMrDyG+/l9mYPw=;
        b=rA/NWMXf5qGdmJvmkEUTDViyxYmRP/060OLp5rwb5FiG9QWmz9UHGvDDJYwQv1gaD5
         rLrnQs88a+8TBC1/CXUViKUjS/TyWT+Z5rRQXrtz1x5P6qZZo5BBhOqTXGPqgB1yVXn4
         M2+fuMocVrpYkoBsqwxN2lAd4zDeRzLMjM95oGxTt0bkLJuNaNlltm8wYiiOPfv38+1d
         k2vvg/qOn7Cr6yM0xdixvhRhv3zoD7xk1wwxfCiCJlfX00UsFc9LeKZxMSWoA3SIyAo2
         IM37MXs3S4BFjQOQlVjtLcGzQsQm6EUCeXmVEXXYjGHIhunaFObyDWKc0Rr4nCBkYVnG
         G+KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWeZ3EjDCqKp+LH+gk2ox0I/dKpypj+UXGS1Yjg7gGDx1gWqYlRag6hHOKKpwpeQphQbZ9yQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo+NDTTn4EwNisrqZat0OmHgM2qqXsg9wjNRRJV53qZ8QAnuzp
	PwL8uh3uEG31lbfzkBqfC0p/+5BhWE326uDC6uFs28qxNyWeC4bm
X-Gm-Gg: ASbGncuqxDRIJWTEd90zZHmpb1gkW5rOqu9Wqze6InTzOuKA1ZpLoQwMHB96lGW1JjO
	eU+gUYPl9weqDT2xXx4kFiElyCrImkqHNi4Cowx/cL1wML/A7DPWVQjSDTefpTNDpZg/MzjzKZo
	neChekdseKIyHfFlPNzRbX5GAa1iNrNy6/8GK2/cGW3Uj6KNMMAEKF7GCz+OyQb1HrqtWsBV2dZ
	b5+4kVBH/FbaECiXlPfeMAM88Mv3ey+0Z1/q4w0uZ4ovmdsyPyA5ZhKLqewu2MppovGLO6z4vVD
	fqz+M9WnAEOa2QmAoCqnOw/EyPd4xVpitCFGdHRLfoOiBwcHQWte8oicpwB8ZPKnx1zmOiRi1G5
	QAldq13DvgQ==
X-Google-Smtp-Source: AGHT+IEVEmQ40FmDn+CfAUaadDKXT3q/Mz8plbwvQ9yvvlPi5yOo06GC2jozTAovzEvNDFO2homiqA==
X-Received: by 2002:a17:902:ea04:b0:21f:4c8b:c511 with SMTP id d9443c01a7336-221040bd73cmr17269215ad.33.1739577827311;
        Fri, 14 Feb 2025 16:03:47 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:03:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:38 +1000
Subject: [PATCH 05/27] ASoC: tas2770: Factor out set_ivsense_slots
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250215-apple-codec-changes-v1-5-723569b21b19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2291;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=f/J3i7KMIWxmruabP9W+++oGD5wdnj1RJnl1ABfMP9s=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb26d4LKSQ4BVccp6zeu1+dY741bmPVMX/C3TKqofE
 LKwMt2no5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIlsU2X4KzafQzNpwfLf2493
 3y9r31Xe133DQv3F97cn7s44+1/lYTzD/8TQnVdYc15tXOZRECCnbVP8hEeE/eHJ2YkR7A2MAhV
 6PAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Add a new explicit function for the setting of I/V sense TDM slots.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 40 +++++++++++++++++--------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 9f93b230652a5dd05f325eb506220b17f5a4b91d..0c8a02ac2c0db10c449a68d9365e79576e24abba 100644
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

