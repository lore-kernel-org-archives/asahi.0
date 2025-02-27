Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3178D22E004
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658165; cv=none; b=W2AD8fwGKu/fW7mC/ZCkw3tBF8tpGaAwwVfCrqPMlPJpqoF0lJxHIrCFZuz5E6Ivut1tw4uHXONFusaORNN0Kk10t3cX6VcCmR1ulFIKDcm/y8mkC4G2qQIEV5A0/8v6NKrVKopirbSjWN1wXOu7F27zQ+8xvykUd9LaZ9sHAao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658165; c=relaxed/simple;
	bh=Io6kDR2zBBh3aBpK4VSy+F5NUnkYFLQhjOt7NCyhIZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UbHy41SZXdtBNW1xden2l2+bAuV6NsqfAema3oAJMn+sHzAJxnxZYASVEFOtsC0TUsVwsPyehy4DjsHxWIz2QSL3GjG9WGA2IbAbQOw9WsmO2wTmVnH1cIX33jiYXOByoFKc1Xa6+bPvBD3GuRspC22sYZsJEVeLPS3JyD7J46Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt6The10; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt6The10"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2234bec7192so20837635ad.2
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658163; x=1741262963; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzpCBkvNFe+4cxCFesd8njDke2bm077RZxzjdl44kWk=;
        b=Vt6The10/qvtnXtIETL5PZcT5TUon0kK2qvgC/nCBz5ZkoiQDe2CfoH+YZw078R9lc
         A5cAB0NS5CpPuuuq1MNkNxHLnWlNY9I6Lur+ZHsa0Xm5QaNebfS8Zj7k0Q3+JLmIliSD
         mP0ghA6waKq5bXleZ4LfY20FB8YEDUx67Qkj2U1s8USU1+XrV+JFYzgXzCV22+TkrJ08
         ALnrBnvyQWziWwxO6MmY8x7Rz2KbXZkgqDmAukt9Wj7HlrXzElYXjPyucNwvDsZ37ywT
         HXUfeIWPhQeujOtMMxSbjNPoyKpgtRwFbtiuaWrrAYMfB97+ci1T5xfNCAT9sem/uEg1
         W29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658163; x=1741262963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzpCBkvNFe+4cxCFesd8njDke2bm077RZxzjdl44kWk=;
        b=bWGywzrhElDgmp1Dvf7fmT59/g2dPLCRUGke2dZhfFsTOGX1nJLu7SHBEGbGcAzcAk
         Qwl52iU4PJGq2jfWFLUOs93xugCuolQ1mMsL4nWlhNmJU5JpemoMNUlKM4GtmZS+oGIe
         jBpupsSnYfoC+hm8mj+mTGHzJStfU0e0b+EucyBK8TvDqgTqjfUn9YpI5mf9JQ8OPxXE
         mFealXG+Qh2wG8WRZqnJEA2kS3zpIxAdtdnj8gizL8R0qRZq1PwS1H3JfoTS5OMOAWyp
         KiUaohTGYMHXXau477rzJYcvtSjMz4aKN+fC0QAbMeVDj2Q8DyttnoSXLrKt61Wwo3rA
         dgGA==
X-Forwarded-Encrypted: i=1; AJvYcCVK14ml1iUDs/qaW3lvlBzSAhH35yYs90zo7lbA5DsM8C2e8uKwWQQNw8skggtJiFgYSavmdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIadUgjPTuyWsSYHV6bbigz7GNt2HnM/bwd9U17JPDGXkf/Yb6
	75JMSQ2fjZyJ+400iJoH3uJayeaRggGkSlxy5gTJeCkUREL3ICCU3wgclqwI
X-Gm-Gg: ASbGncspoUSewNh++ienRUBeeuLbQtwF4MYJrcBtSMvrqnAUtgpi1lBwW8jrhsinGs6
	XGzFPLuykHeJqYujRZwt8r18nng2xcFDV4qGAdZtSZjLBmHDaD1hjoW6K5EUUuNI3YGjSKr9DqA
	DcvCq57AJF2Mh2shQCu0mcm52kKM9ho8kYSz58zvf5p0Vq1a9ddItKWyrGuYUVcpx1j0oj5kxiM
	2CCF80R72qARVwjqDd2mGAfmkWbChTWQ+V1ZBmgM/GEWOdk5LWEe/ufAQeccjDPyRJJXNOmCiCN
	RmGDHFk9fEkjuxx6Ai2AVh8tJH1Erl0CPzVW63/C1I/zfVfesjINRmPkNt8ihL+Aq9PEM6weubX
	pEOXGRe1A64bUtVR2b8OC
X-Google-Smtp-Source: AGHT+IFmjn8gZmsAiVDDh0ytBwNsGDZKLbshMCoMfcZDZX53iA6NwZyLI9KPUoJ8hC8j1OBKRPgFng==
X-Received: by 2002:a05:6a21:348b:b0:1ee:6d23:20ab with SMTP id adf61e73a8af0-1f10ad33426mr10797861637.10.1740658163129;
        Thu, 27 Feb 2025 04:09:23 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:09:22 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:31 +1000
Subject: [PATCH v3 04/20] ASoC: tas2764: Add control concerning overcurrent
 events
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250227-apple-codec-changes-v3-4-cbb130030acf@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Edes/eOYgyHscimA5rczgRo/u/EfWQDXOVtLP4SmgoA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk+eSplRlP06a+asbVk3RG4v45kS3HlD41piy4Ebv
 I/Ptl6Q7ihlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAiM7IY/ify85+1OLTn+g61
 jQ82TjrzaZNH0PSLXa2n89e6KNl35egxMryN8lyzreNViu5qp4aSt1GKu19OFN54eqtyg/Kyq5F
 HF7IAAA==
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
index d9b4f898789fa9b59c94c97e3b130950b88c3a76..08aa7ee34256896915f3ed6438b8b8827ce240c7 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -634,12 +634,21 @@ static SOC_ENUM_SINGLE_DECL(
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
index 69c0f91cb423986f7f0ded0b2160927f024d957d..3251dc0106e07862dd69efd69fa0e40c3858ecb7 100644
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

