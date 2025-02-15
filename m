Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A9E64D
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577919; cv=none; b=dpzyeCA4+a6Dxipq0jpS7AxT/PTP5JZY5KmqPeaYFoEEePmiQLw0TpaPBY/hPpheg7SVxFX0Kk0jvEQg0KsA9b6dI1Iczy9dIZ/LrS1bmOzdyh8vzLX6pu6ueQLBGB/O57SQh1JPnYeTkYCQwbhdKjUJ5s/qABxCR69gw4V16Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577919; c=relaxed/simple;
	bh=tlnUo/drZpD4RYOQifGyN+9OXzAuy3Y1DCfVThMu564=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ac5BmLTdQq+0YHJDJi21TOfOoNqesVM0NdUAa+7/Tmb9gk/ecb7SqI2LkrfEDEVMBjaeBi3Q+gnBU7wX7sdbKPzP9LxOKV03I9jCaO03n7kXpeBcepllxFUv9DLe0K3hhjOw7UVpadCtewQ7HzRArHuAn0Mx6prMYh3nGqFWi0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5G352J2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5G352J2"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220e83d65e5so35554245ad.1
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577917; x=1740182717; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+lScSJ9LmSRe7+AuGkyAbW9KCT1yWsEyguU2zwFGC4=;
        b=N5G352J264ApuY0ncvbfqJP3qKdQGyIc9ORiXCmHqf6i3MTL3789PHe6ai7+F2faHg
         KyMsG+W23o7l5u6tjvtMYNV6lqCUX32teNMWqDl1FTQNdE70Gr5FpuUzy1poS7QigDnU
         relb3ITolnJ3ZnVVO+nSXnT7JSJvMnzAnyiUzzIcVao325ztSavrjPuh8JcVB6KwOwU3
         ok/NQ/dRzjngiz8BMCW2wfjZvCd4TcBxJfBWmthpE2KUzT9ymPHT5zoxPyYSOp5sUgNA
         njd+DfA2GaNAFej5xN/rpJanRtaVAGD/L6T+dnSFQCncYl1tOr9lfuadwpXuRbJ40gGL
         EQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577917; x=1740182717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+lScSJ9LmSRe7+AuGkyAbW9KCT1yWsEyguU2zwFGC4=;
        b=vr6mMSVTecWxpQ8Zio6ynlJjBq7mnL8oWHK6LhQjXVgtNhWd1CE+yrzjumlXWa/+Wl
         DZotwOwqKmNVyjqxaiN/uz5T2suRPeTQlMtsulOKSbG7suFrAPD5/R0OWcYhkE1v7QRZ
         3kL2HriUYYI/GL8Y0AjGPVKwILVO5vdkOHwQefIy+dJOjO/7AAN5cvJgv681kwQvhQjG
         OewfrQ5ZWGB8F8v9ijK2oupz1FE+GdyU6qOxVXViiinIVjfdRDXK4EBfRgiSGHKaGmSs
         wQOFMf+rQceDQT9wwxhBPng1gOFclxSy0Zqlnm3/05po0pOdBUZWxZT6y/yULCD3WWhq
         WryA==
X-Forwarded-Encrypted: i=1; AJvYcCWxv1b0RQQqdqM8Vg8RSA81mkJ/AaVDMdiHYvaai1eMUiOwal2cMYFBjRTAj7+bqe9XAo1VDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIT6EwvLX6eR3I3evmw1/NgHvulx0xomhk3/VrqmeJ4cjICpue
	0waUFTMfvWbBnrvmOO2kqP3k0YFBRQzxXtbodVSGoWH+FFlRM1zM
X-Gm-Gg: ASbGncutMeEcdAzcWFCFyjRz4fnfeQdIuL0cDHC5ZiZqY1ryBEmnZz0leL/OeJHKd2A
	l/BXcLmkn5QMElJX7gy4Lm3P6Opuxc0tVVxGFb+4vu1+bxggbeQccwiI8rkHB5LHug3VT7/MuR9
	HDwmrUl1MvKaN01Ra77tDc78Ge/HVW3dFOMBuOdKD6AI5gF4ZseSFbqU1DOpwQEQhfWVConYdhD
	uB83PnOKIiAr10lxUFVaVFraY1gZ6ATDEqO80Ff8jIJ4NW9/v2Fl+fvJyWbcri7/3mPAjVXxUWW
	4CUUQ8mbMpbOjLvzQ+fZBQ+2qMVuXXRqimyqQJ9w6Yhag2f7sDPelO5cDb8+DOpMaRyDcUIfCpB
	Hp+TA56l3Wg==
X-Google-Smtp-Source: AGHT+IEPIjvw4cmYTL9Hx6XsuDxSllH8Sdas9RtipG9OjZroTgCKr+EB27/N3ZXZNUXN3FaxP4oW+A==
X-Received: by 2002:a17:902:fc86:b0:220:f140:f7be with SMTP id d9443c01a7336-221040ac2eemr17296095ad.41.1739577917217;
        Fri, 14 Feb 2025 16:05:17 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:05:16 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:51 +1000
Subject: [PATCH 18/27] ASoC: tas2764: Mark SW_RESET as volatile
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-apple-codec-changes-v1-18-723569b21b19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=773;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=qo6yyujNAiynPY1OTmsJRYpCReZVUv81PffdNrMKl0A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb24/07OueJ6nTubXp1OsLdxDM42N/Bn1eY5dE12v/
 PZgbXBGRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABNhO8DwvyZQv3DHAbveo37r
 dlVNn5GxZcOvRQxb9XnZDpj+c+jmbWP4Z6l543L85KlzMprOrv2s9o5v48+1gjvmPcqcuTKEfef
 sB5wA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Since the bit is self-clearing.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index f8cf64c1777ad34fa7a42ca5316ffb980c63be29..409c54b41dda41d33e8501fff9de421c98f2541f 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -817,6 +817,7 @@ static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
 static bool tas2764_volatile_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
+	case TAS2764_SW_RST:
 	case TAS2764_INT_LTCH0 ... TAS2764_INT_LTCH4:
 	case TAS2764_INT_CLK_CFG:
 		return true;

-- 
2.48.1

