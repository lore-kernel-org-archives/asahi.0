Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6216B202C4C
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867772; cv=none; b=l0cqjnOSDMYcwHPlqhMseqSdthEUsdmGBoiYXAnRnaIB1Ah/BRRpcbVi2+x5egMDLlrp+z44FPNsdVe1G0y8D3lbjLxHGjm4ItwjtkX6SRFZth6KpAoh/YBFeeNpZFYLLcJV5ywPNCVb9drZjz+Q5POi3S8bhd1wEntO5Ne+E+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867772; c=relaxed/simple;
	bh=ihiPVhcMUYw/qHe10TgorGJcdQbOh6p+yirtw1hvn2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HRjmMjgcVKZA4BnLsGaXAI58MVXMqBa5aN/nE/9QoH92nafy5U6qtztWaa0Zg9Ro8vJJjGNEqZPVnJNLYYZx8KXqzOU3fDVVZTHywjC8/fq0sO71MK+i5LFRbgW8juUDr7N9L+WQxCz6vtJBsiwrTMe8vBjIsRA7wxQqWW6Ax0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIVP36Fg; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIVP36Fg"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-221050f3f00so50368795ad.2
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867771; x=1740472571; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OF/O/lP/mT4jNnw/OxFlvVpNX2pXzauUtJPaPsgZZfE=;
        b=WIVP36FgJ3TnOSxplXnyB8jKrbJubuPvA8pdKZdUvnnrsAHDPB8c/yIIDPlnb/lF6b
         fUiq+Qb4xGeY4nAu7PWGPSfCVUeg94PgYoFYQm3CsG5Yh8i2bohDWh6pzspZs4Iscwlp
         cZGHanIFxrUktqlrqDuWf+pbn/XN/SDgnj7KRnLId6+6PqZ5tJrxS+ti1by0P9Vk3WCr
         wgUM5HXjmDUKQ2i3k4zvQAUPrDS/AyGFzaYMFGx8kFKSuGtsIHS5F52cJn7zCy+u/yaj
         vLoGI8nLL4S7l+wf+/PrrlZRRjAuvQoNOC5so3ZSIPy7OcfRX1AmIWH1XAF0nXLSk38B
         mfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867771; x=1740472571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OF/O/lP/mT4jNnw/OxFlvVpNX2pXzauUtJPaPsgZZfE=;
        b=XxRS3YiysI2vsyLT8Jch+Fp57cv9P//R7ICby0cwI8WZZAVe4roIus1mXRX4P9zSSW
         WMuQ1TkkfwOjAjNATc9yKDroeqp4AyDJizeGR+DafB5E4+pxZpcFLv+abpdbpWxngrWp
         U683GUuAMMrJATRh3z/FJThW8xa+/z3oA6GTp6dfvBW0oLZYNAhBu//rItP3LI8GyHWW
         5ed+YPily9VhwL1OaOpY+RcGyadA521uE5vo5d7vcKaZqeDrrnuop4fnc8xU4O989JpX
         ghwMjJ7/TmLz2Ucmj+GmJ37bN79dbGHbThbrrZz9SqxxpHnDgt+1Kpk8DXAURIzioRIt
         8VLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9ybc6G/HvArM8+KU6pdcGqPXK0GFX/KcTPS3/FHLlG7cIshWC7O0+6NiXz46Zb9k0pRryEw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRlpawf/X240vbFszL7Qs/539IgTOVZpzsoZEiTrXDUHBGzwAl
	BMe2NIx3ij67/rYmsX7McBcCMXDMrD/tsAU93mx5LaYFxxCEhK4t
X-Gm-Gg: ASbGncs18DfwnKww9G/CoeDj6aHVf11Ul4cd+ZmcDhuNNj3gY12GEfHhE1Qd+n/vYJH
	vZsyWR+cStxxe2POiMs/FrjjkCauS22hUU8f17asBB9tLYz4cRmF3gNkAORJHqJLyT88ymdbVDG
	5sSeUkz4uiE1F8NkPy41yV/3Mt5JUlGDBttbAaTAzT624K38iZ4kEh1Ng1nldKg1Z1c38caQLFo
	Z1DWLd87qiSE32fdvtHqLKDpfXeHzjGY936ptXkAf8//hHfe2kDsxTesgjQguFKuH6l45hKphlS
	kQ77WZrAXo4uJxGD87y8yHKSVggG9/1J1ysKTizEM/Pc/8k/LEUDB6jPB27lc6gmTMq4xISnPLZ
	qdf78RsyKog==
X-Google-Smtp-Source: AGHT+IHmXcMPPPj/jkvfcToQWS9qO+2Zddin1cLKfo5/ytUB2jIw0pEXVc/F3aPgclBbVhcX4ndltg==
X-Received: by 2002:a05:6a21:8886:b0:1ee:a914:1d57 with SMTP id adf61e73a8af0-1eea914203amr13137022637.3.1739867770702;
        Tue, 18 Feb 2025 00:36:10 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:36:10 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:36 +1000
Subject: [PATCH v2 02/29] ASoC: tas2770: Fix volume scale
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-2-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=974;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=q30IbUoUVIty8Km4kUwzvng0oNn9XrUmBVn70mfZY4c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3OJr/xofZLycZvb43zrhaoccpZTlIc4TiwpcbpkKd
 F6++1Szo5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIkI9zP8T9NmfFgRet5Ad7n0
 71Mzb/Nfip2Tn9O6/qNGV/MS1pXRpxkZti4UfenQp9ffzVQTJScTs3xbqbGcwGKp0vUZqx+FXzP
 iAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

The scale starts at -100dB, not -128dB.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 9f93b230652a5dd05f325eb506220b17f5a4b91d..863c3f672ba98dd74a5ba1b15d650a90f91176a1 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -506,7 +506,7 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
 }
 
 static DECLARE_TLV_DB_SCALE(tas2770_digital_tlv, 1100, 50, 0);
-static DECLARE_TLV_DB_SCALE(tas2770_playback_volume, -12750, 50, 0);
+static DECLARE_TLV_DB_SCALE(tas2770_playback_volume, -10050, 50, 0);
 
 static const struct snd_kcontrol_new tas2770_snd_controls[] = {
 	SOC_SINGLE_TLV("Speaker Playback Volume", TAS2770_PLAY_CFG_REG2,

-- 
2.48.1

