Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC511DD0D6
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867804; cv=none; b=VZdl5sqLHInBvpzEumAgN6RSMKWNJuF+OHZQnBuCZ/Rx7EUu2DnjF144rO6Pc4R+G2jGnQ3J+Gj/MDgTfuhfBmHd4sO4Lj9TXsrhZ6OrIdjrzuuovt0qGxE8UcaVMHiZetRLl1mch1GItGfcQT8ZXuqPYvoV1yMSKSQSjAfkkWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867804; c=relaxed/simple;
	bh=ZLfqHGEmmRxWDvQqbGo0nvLtr+jQRIPyVh/jCgvqHm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DuxHuxX1tBlJv4EDvoGUiSniGxr7p4Lo8LWTRLgSPx4T0HmVliRsuZTVqlnpsOkw/J7jzAT1Dnvt+k3iu7Hg/7rKnReZAcjRLBNWg/49OVRTNMhKOK4cRmWK6sZeGWid5weZc8a6Ci9YeUxN5mIxku9AvSHV1MwFRBKr7nx+pj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxd6D5FO; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxd6D5FO"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fc0026eb79so9705637a91.0
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867802; x=1740472602; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ln6BBxQvoa3BwbYmzNm0cxjw8OAeHcLG9Mi/U3fzc+8=;
        b=hxd6D5FOKes9xZYy4ZFxv5c3sUF4jmzfo4wXNxgFK0+fzHHzRL6Dq+jPNZQ5pcOW3t
         biNrYHxV1czEllZEb/KP8n3UNpATQPWx4Dbi3IiubA9s2MczdNlR/Ob5L38oiUDumurY
         Q+kTkXzVxRV9MK2X3/AaTZuYxZsmBiARELAlbBXi91Rx0B7+wY1qriiPXl78/n4yv6uv
         kAkqUxzIgwlMQ/A9itOnjzar7WAZn/LV3On7D7B9bnHkoNuWTwnE045J6+R58hYhi3jR
         AdYatBrNxgHW7auN1q5DVpZbFq+6Df3S8eRsOigIoELsIUsctQRz8OikYpTjflxI9/I0
         jIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867802; x=1740472602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ln6BBxQvoa3BwbYmzNm0cxjw8OAeHcLG9Mi/U3fzc+8=;
        b=IuNq2I9DgdwObZELwMGrxksNNjqIDQrt+0kO40KcWh9arJ9KCExOXRkVJ8DOXpHZ/w
         xYVwtXelYPimxN66B5g4p3cpCNvByLnRI8ZUMhRoFhW5td1rOC1Ipp9yvNA7RWyU6444
         W2P7jX2rr2XU4rHFYf75GtFSgtfsgI0GRj00T+PPoeEMKEW4aAeRpNA4PcAfAynDg9jg
         3QzqmEuY6pv/NoBfGMd4Ss89JE0OrwRUDZ/NxfgOxNKs3sMFfIqq86tWe74BkzgsEDRT
         2NGyHXXDTFQQ1vk68uib0XGW7SBbJh7JB6kkUou7Z71LpNmaOONiflF9x22t4fsHUiKV
         XdoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOvPOGF1+Er37rAZHNcXhxZc2xemAQT3HGHA9Mk2V/nzkG7hpmKeqFzzoZcPg47IZ6cTMhEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzR3HH2pilvMgFnCtSF1nSAO51Y/HbWbHMtLQvR/FZkYMXGurjG
	E5LzgGfb7EDI+hKR1cDGNxB9nT5cXZNJdxVJ7VJilI2iwdD7J22k
X-Gm-Gg: ASbGncvyANAWMUbCW7bzPyi8wtBTn4ew0lC3q1p3rxdJdXANIbVvKGA0/XVFp5DR7vP
	/Yf1Z3mcI2lzwByILw4JbFM2Y0ZyjZryvepX8VLZFChYo04/nAEXWXv8SftP1PSwduyK5lH8FRK
	gppzN5GRE2C9qPxmGlkiiKaiNO9B+RbZb/7mYfHoG5r5/4YV25SK70ov3n1nIAEwXgn68qWh5NM
	QmrpGhkH/v2U58R1AjPya8i4JDNMHoM1Ume/gnu9KNHpBOvop83LC3Pdk18Vko6wlmibz3H0ycx
	8jElAZJYc//BSdmS/gg+SlrheN4BRoinYGqToFK6FkB1F+caeRZefwKEX/KRBQx/QGBSft6yeGu
	RXjrsLLgeKQ==
X-Google-Smtp-Source: AGHT+IGMRtRZg0Gc9H3HwG54sh1h0dYs9F/qv3aNYDQGeqt+afKytli0IykEtcy4SHr1bGklOsV/0A==
X-Received: by 2002:a05:6a00:198c:b0:732:1840:8382 with SMTP id d2e1a72fcca58-7326144b0b3mr21937466b3a.0.1739867801963;
        Tue, 18 Feb 2025 00:36:41 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:36:41 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:40 +1000
Subject: [PATCH v2 06/29] ASoC: tas2764: Add control concerning overcurrent
 events
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250218-apple-codec-changes-v2-6-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=x9ToLkkem0IkKdzxIQq2uXS0i2qLVjJ6tDhcGqRC18k=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3OLnPKg68/OoqOP7V1+6X9Y8OHyEf3ew30KduqsvL
 iecOz1vQkcpC4MYF4OsmCLLhiYhj9lGbDf7RSr3wsxhZQIZwsDFKQAT+T2f4Z9R4aEjDoLhqaym
 //J0nnj7xfSc2WhkczqhK3/ym0M3GCwZ/hfPDi7RZ9107PsspQkqGnfLJa9xasy6+Vubu/vwjKz
 UYm4A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Add control to expose the option of autoretry behavior on overcurrent
events in the codec.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 9 +++++++++
 sound/soc/codecs/tas2764.h | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index cda75b7f270377dd7af1b163d38fe2f28e1f7484..05d025ffc567fac25110fbde2ca19337b8ee329d 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -623,12 +623,21 @@ static SOC_ENUM_SINGLE_DECL(
 	tas2764_hpf_enum, TAS2764_DC_BLK0,
 	TAS2764_DC_BLK0_HPF_FREQ_PB_SHIFT, tas2764_hpf_texts);
 
+static const char * const tas2764_oce_texts[] = {
+	"Disable", "Retry",
+};
+
+static SOC_ENUM_SINGLE_DECL(
+	tas2764_oce_enum, TAS2764_MISC_CFG1,
+	TAS2764_MISC_CFG1_OCE_RETRY_SHIFT, tas2764_oce_texts);
+
 static const struct snd_kcontrol_new tas2764_snd_controls[] = {
 	SOC_SINGLE_TLV("Speaker Volume", TAS2764_DVC, 0,
 		       TAS2764_DVC_MAX, 1, tas2764_playback_volume),
 	SOC_SINGLE_TLV("Amp Gain Volume", TAS2764_CHNL_0, 1, 0x14, 0,
 		       tas2764_digital_tlv),
 	SOC_ENUM("HPF Corner Frequency", tas2764_hpf_enum),
+	SOC_ENUM("OCE Handling", tas2764_oce_enum),
 };
 
 static const struct snd_soc_component_driver soc_component_driver_tas2764 = {
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index fa2ac38de78b457263be2e72e02a9a3c47c2762f..b814715b41ff6e9a714c30ae204e7792351428b6 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -44,6 +44,10 @@
 
 #define TAS2764_CHNL_0  TAS2764_REG(0X0, 0x03)
 
+/* Miscellaneous */
+#define TAS2764_MISC_CFG1		TAS2764_REG(0x0, 0x06)
+#define TAS2764_MISC_CFG1_OCE_RETRY_SHIFT  5
+
 /* TDM Configuration Reg0 */
 #define TAS2764_TDM_CFG0		TAS2764_REG(0X0, 0x08)
 #define TAS2764_TDM_CFG0_SMP_MASK	BIT(5)

-- 
2.48.1

