Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F0CDF60
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577822; cv=none; b=FnPZb1Kjt8D6jlosKDH80evlyN71J3ykkfm9LV+6oiiifNIOO2eQt9EC1l8FEALE8deHUWge/wdHEt+1mQIa7qlKVm02FyjhhkRY509nmz+ElI+QncX2gq9OdpMaW+oehaVh7eW1V8agMWwzBodfi06EmqQrkIs0SbAYE9RUBcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577822; c=relaxed/simple;
	bh=l4QavxH/AnxLsGFPgX4G1Nwz/B0QgpuehWgSTj26p0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fe6CbO2N2dDsB3UIeYMX1BH53OE5zYVhqbiCgdfoMUOmo8C0x6yGfOoi2VLbRUjFDe+PVyfltlj76uly097Mx02bUatNmyronWDTffVmQ6RORaCsgHupPhpGJWkhHkB4kRA9xL+dk4mrJf0KuBnwRUoR0CSPTO20K1KpClHz4Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSpmwzsu; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSpmwzsu"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-220d601886fso34667305ad.1
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577820; x=1740182620; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNJt0vNuEkV51zynYZo+HyYzdHqqBPC2Q3Ik+52LuJI=;
        b=MSpmwzsujBdCzYUf6bBZXvRgzrBzWSBvHeM6x6e+C92yq5kbsSMjQkhpVV3z+csmaz
         Zcbi6l4j+ZM0EFkDSqZMj88Zm+SEEJZ/YlGt3GMqmwjjMgJhwEa9g0oy3WWdad/d4wms
         asDxv14MvxevyvMx4xzyer57TVSOdPmb277goLRpoatZn3mR3ZFsI0KxqSfPyJnLqbZC
         OYUCOSRovZW9BFmflRSj5iRr6fTcRo1nSrWv9Z66v59EEHcKxk3C+faND+m6t8Gr7Tx6
         tnDlgXnFfccRxsdailVQByStGjdlBxPPpe3KiPde/2XDGPn5Fzh14kNhcxyCC029JZft
         ay1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577820; x=1740182620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNJt0vNuEkV51zynYZo+HyYzdHqqBPC2Q3Ik+52LuJI=;
        b=k07fRoMcOtB0gRmeTXZjy/puKllEpzNCEdvjyi/DJd2vqcr3GJj+wvZ+Gu6eiImMMm
         iE4w2xjxtltf9u5WwyYisBV4NX+VCpmm3SD8eAcnhQD7eCABsJFLG/AgOHl1xt3U1K08
         f42LLRjumObDu62pZtIv68FfMYnG6u5TVf1VfH8/TcZnLAwWWdIj/bZQJ1uAknFFGMUv
         338FkTnniNhi+dCgVMCtxZTQjY3KuddX9Um+mNRhPz1POfZ9c/HQ7wm9a81WW1vUlXmK
         qlW+b9eR+YDSW++Z+NehDp08syEOv94Xr5qHpG6CBvgidDdrxKxTMVoHlyiQ54VD9dsb
         sQww==
X-Forwarded-Encrypted: i=1; AJvYcCVIAKq6DdZTX5N1KYOthNtELiCmqM80k0B/JawJ7S02bNJEwrrCmc7G0RDFXFocXXduniz7nA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsD/mRQWAw9ic1vTELdPiwujNJVouveU/ryhCcR+pg0p3S+h1e
	GfkJvTxrsy72sLnP498Zx/y3gvaI4M2oGCZoNchHIok+p9modJ0A
X-Gm-Gg: ASbGncuQCZ+cyx5mxKOJa8PMyekya1jYgH1NvPoBWO3x3F00DfevomDjJtTfEurm6Gd
	2rUMFfGctqMetyNHWZAgqS2cqB78dfrWtwMrMXFsQlE4VvmAqL16IfxyqwGASS66tiSy0nU2rYw
	zK+Uhq9VN/cyV5f208NFyTuvU9sUtOkK/HkP57H3tWFaL/Wex7WuBmsku1hv2Npzaw+huLiSh+F
	21QZtrz4g/6ZrV6WxqpvG57xYtsP5wcxpNv0bxaFIlsXFhmRZON4qWVh4qct+U8dU7LnbCbyrvc
	H/7KMNZIDmchc4EhmECjtESmHPSQUPt3s9y143WPSyI5tuw8tmizhZ6pbWu7BB6LCUUNgpF8ezP
	25a8+cY/cBA==
X-Google-Smtp-Source: AGHT+IH196Eueol1g8kBTIGWU560rg+TCAzrZwEk5wy2aAGIGo8oIpQrrLzEAnIzsvQ0XO1c52riFQ==
X-Received: by 2002:a17:903:2f8f:b0:21f:515:d61 with SMTP id d9443c01a7336-22104028a15mr18838735ad.21.1739577820409;
        Fri, 14 Feb 2025 16:03:40 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:03:39 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:37 +1000
Subject: [PATCH 04/27] ASoC: tas2764: Add control concerning overcurrent
 events
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250215-apple-codec-changes-v1-4-723569b21b19@gmail.com>
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
 asahi@lists.linux.dev, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik@protonmail.com>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1972;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ckryqoK6F5gfX0Q2xqupCAjDXnKZm8KUzcE+xjgsqAY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb25VNolcz/Z/ncYlix/vdrAXh15b7H7oRerMeXxHn
 qXu+vXDu6OUhUGMi0FWTJFlQ5OQx2wjtpv9IpV7YeawMoEMYeDiFICJaEUxMjz6z3zjUZDswisH
 9kxKOa2ymJnrWaTnmuYDa3tff8qYZ3aUkeEO755O/s1B26Ir82QXR+6wP1IVYJW2pd46kcVj9+G
 SPBYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik@protonmail.com>

Add control to expose the option of autoretry behavior on overcurrent
events in the codec.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 9 +++++++++
 sound/soc/codecs/tas2764.h | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index e04b8ecab819402b8c3d2b81a2a447730802e968..503bb7f8b729d3760194a6f6f6996ff6469c580f 100644
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
index 0a40166040e7e877ca5d23db6cb65531af12c40b..20628e51bf94f047e3dc7cac73ac01519ada1852 100644
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

