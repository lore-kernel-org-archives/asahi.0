Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B19151998
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577844; cv=none; b=LagLk/hlVHU4jQbX5rMjT+1Mb4rDLCXlc4gDD/hbgi6FviiKroTdsT4f/rAzm0cLbf+xcNEh6LF+MuVFWEvunCJdbVN9IIZ7cjwGrWRKG6NQwQv7vKS/L0mZb0AKkoOBdH+eLC/l53qLCIykpvd2D5jnLfSZNtD3vG7Zohdt5NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577844; c=relaxed/simple;
	bh=Q0SPl5JH9LaHvgfDJ96M2NZKrxwY3FINQN2Up2ZYVLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hrvUikMyoPKcnxCAb69sN9uURYVSJjfFa3UuX9fmlte8iTxZcXvEFPiaqI+Fn+Gu785rvnyRUTvOvOQzeOt/0LvhMrOcnsVxEDkv2T7vDm0Hul9Fo5Tt4nTuYfUNL217WWIuV4ZGhrGTlIHv7KSR7ghCxXBlhgrZYgUf4Va7kkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JU7nC2zI; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JU7nC2zI"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21c2f1b610dso64165725ad.0
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577841; x=1740182641; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03VCERuRQd3sonLjwX2xR3AgSfd5Oyw98QEf0M2noT4=;
        b=JU7nC2zIeCXzJIvB506qeSObBLi7yogvQPEAsYJ+uFjHudmP7lAqvSjL5E8NGZd5E0
         m0z6MEhHRkoHD8B7jas+ThEIMNXPC0WfwL7qD9wt1fleWvEsXbjiPkVM/fQ3m0RmUILx
         js4WPSbEw1Go/WsQp03O8WFOKxFeDOn+6/D8LEGn7yywZ6utod+XyNlG+RuitANbWEEc
         6F2XFC5pky4CuSUObSyhw3LKTcqm3qhclL9EXQj/edP44IEbAwRbicpfMucIXfA7+wA9
         bAchI72V9/oKwpX+K7vyXyA815zWnLveMdyNKeegf+VtYlf7AbZK+X0dvAwnDQF2B6gP
         mRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577841; x=1740182641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03VCERuRQd3sonLjwX2xR3AgSfd5Oyw98QEf0M2noT4=;
        b=jwn3UHKbt49sc+eiv759mKer48Y2+SaTdejjTsUHmheBfLhdTmsnwghUPaQVsdM+pW
         6npv/Hq8y72a4t3E1d2nIhPfm0m4WQd8hq38cLXnpa5j5LDaRRn2nl7nq3TCcesHvKFw
         6MHXPNrUWeLUFEgOjWTH27Jd5L7yoXxyIvMw4+p9dmxg1YoI1BBJ1o2l/uFNWrKRrb86
         gl2I8x6eF/Zne2Q45Ajrz58CeV/vXIWct+11y8zATd/rD6/OiveqtjNpmyNIKYJ55y/t
         1ZKLGrp9t7POFidirCFt/2BeSh3loSuPrkqSyOtsyc8S/xU+wL3utkSygCQ+hMKPLOE0
         OU6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIAJrLdQLlgTSZA36MSNjkcrofd3KUIHUFdWJaXA31XlMNmkSVhy45J/XXjqPoUK8yKUYt+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuTOOXCtc3jJckdkJfmW7izKEfqMSbk9c7xuM7VUK5P3Mx3ZM7
	T03VOFTsvN2idfXDAe80FKkzqZiLVPVQ2hndkauFpvnK0YkGKKaI
X-Gm-Gg: ASbGnctUUNvNp9d4kvNCeAv8qw0k1T6kllZ+/5HFqGZ95PFHyRg5NoPxTvaB/Cqbdv9
	1wquY9CjZAaGRwUWgxTf5JiWhprrQwGdBxmMsgI1xHC6uczdRi53TM4XUOUs3RShIcTiVxk2kYR
	00E+1iJubbSa36+das7tW88LP3yd60w6bBqSjo/rMblehPvlXGlfd0ZdbYLQTP+m0Fal2TFQMy3
	M/bcRXQW00DMYxfx63HzQ0udJg5Xou+pZpr/93MPe6EVZScDNvWcA6NgvsUilQiJK6Z0qbNrSg7
	H0LWkSor79QXQVtxgUeJ5nTYJyQbjG/2oHVub2WNyYostDd6S1jD57AK2n+drp8MT59jv/dxIRw
	Li7896e1PuQ==
X-Google-Smtp-Source: AGHT+IFEbbW3BAtsBgFCB9kBQKiM4ABgJn5ph4HV9zVEO0mqabKPwQqEDNW4omoAqNlYhJuWy8T6ng==
X-Received: by 2002:a17:902:ce06:b0:21d:3bee:990c with SMTP id d9443c01a7336-221040a99cemr16511975ad.42.1739577840941;
        Fri, 14 Feb 2025 16:04:00 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:04:00 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:40 +1000
Subject: [PATCH 07/27] ASoC: tas2764: Reinit cache on part reset
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250215-apple-codec-changes-v1-7-723569b21b19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=B1Sb5itjHDK3h5ZHbLewODahZLkXBqkrwz4IxIkfeXw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb261Fz3vOn+1fEP22nlTIuzP/Ap23/14z4oJmSFOV
 TqJQllaHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAExkhgMjw+1vHUck4v6af+r5
 PD/iU+ua4Aszgt5nLLVSb8/RuWHXXM3I8PBZfitrjEPuMWNe3TlbP1uxrk570vRle1GfcMibrHg
 zFgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

When the part is reset in component_probe, do not forget to reinit the
regcache, otherwise the cache can get out of sync with the part's
actual state. (This fix is similar to commit 0a0342ede303 which
concerned the tas2770 driver.)

Fixes: 827ed8a0fa50 ("ASoC: tas2764: Add the driver for the TAS2764")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 503bb7f8b729d3760194a6f6f6996ff6469c580f..6e91ad9229cad62860adc1f446fffc8872d32ca0 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -539,6 +539,8 @@ static uint8_t sn012776_bop_presets[] = {
 	0x06, 0x3e, 0x37, 0x30, 0xff, 0xe6
 };
 
+static const struct regmap_config tas2764_i2c_regmap;
+
 static int tas2764_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
@@ -552,6 +554,7 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 	}
 
 	tas2764_reset(tas2764);
+	regmap_reinit_cache(tas2764->regmap, &tas2764_i2c_regmap);
 
 	if (tas2764->irq) {
 		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0xff);

-- 
2.48.1

