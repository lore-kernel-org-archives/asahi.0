Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E7432AAB0
	for <asahi@lists.linux.dev>; Mon, 15 Dec 2025 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791538; cv=none; b=UvSeAhRi6FDjOT5Xvb8hEseyYdqY78uIMRQvhgM+FGKsmKS2Ms2EFnUPz3eKX103FlDmeprWsxRh9mLSpwDasXxobfgT3L23wDZBnh+jc9+8ks1pJY/GneqxhAkA1DUO3nadACfuyFZFh5mFTNnxOfXnI8I9gwNKgt6wNMcq2rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791538; c=relaxed/simple;
	bh=QydWi+DoiY9Z64QzfXeb7huM2KW3vZ6y+zBjHRM0skY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWZT+XjTsV1OcnHAEc45Q9FmgNRCknWjulz+gVg79Ezwn2Ih01811WQNtLRrsxGhHXhtkozShKSajisy4PITx6tChu6EnzhgrQw00U7CQ/tT5BENPAlecVo4BQsXdUbvqUurIGMCfu/piy41PWHhP2Qagyp5JilxTBGLN6AkqP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PD10IReN; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PD10IReN"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-298287a26c3so40557675ad.0
        for <asahi@lists.linux.dev>; Mon, 15 Dec 2025 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791536; x=1766396336; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pK6jEIYP2YnHjgeCSwjCYgueG0ykJpebH64ci6c2Og=;
        b=PD10IReNdl+12DtTKglPEKjZWqxVXfkERkTI8GUby9KHTWcfKB7c/5eSFkVH+jv+sj
         u01BmGHrD/Cf8lLTwQAlTTop/3ZIVv2J5mk/oCdPcduHCW2rBNnnkeBeaLrtJNyVeFpW
         b44+nCs7p/IxaLWIIyJVgPzoA1xr8CY3QOe58Eb22TOTOGa54xMWR+C4r9YkBmvemWaX
         o09vsRJLrKr0OUMfXphQBn+cigksQODRlN/HB0Ws/Heg5tLpSZy8S3lEvmmmrfDZVHHf
         irTK5nUe45uiq3eZRzj9dpvQcxkTecRytWA69ZFUDxPc/BJa8UrtKnM3geqU2Dcq4ZiH
         9Oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791536; x=1766396336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6pK6jEIYP2YnHjgeCSwjCYgueG0ykJpebH64ci6c2Og=;
        b=EAnOWIww5U926/G5YsmnuzAAHTTkxI+Hx3KJGSrki1kpb5C0LjfS2u/G3J8d7FcxVe
         ssWUowvDT2Sukeri2XQaURydlC1tE/cN8dvU7ayp5jWOJtIgiqkut0gpr5FpcxH9DADH
         wXgAj6xouRFqsWOn6qojFz/2i8DZNr3bGkyt1XY9W4BlKJRr0j73Z/EbGjGVGTQGvSfg
         w9phodlcRiP5hQryNtPNNhmtXl/awNvcQfnKr06dNqU7E4NmMJCzlMIbHT9RN20boPKq
         pQaiVGu7d+AdYOajIWpF3yUqfh4fKD7R//qXT1ehMZCTHRt2W+7KexB/Qx3Xf8C6YbEz
         pjkA==
X-Gm-Message-State: AOJu0YyLj7/9ZPo4pSI5fa2QZXobkqOdamFLLPwYS4H2+wh8xqUo0aM0
	nf8H3W6tCIyqDhfMYPM+jtVSmmlXsB84oBL/VT/nKa7+JsVQ52hBAivj
X-Gm-Gg: AY/fxX4d+UpmU0oY338fLf8g5epZI3+DwyTTrAnm0lAJ2MIC6N5Y+9H7rYfUw76VOQb
	Y1HHiTo6hab4129YpoyeJhFMYLpmKm8KpwTJkv4iNcKD3yQWZk3HPhWfkRPZqeShd/Jsyq1c3Op
	nA/mh44BP3gTBfOrhZw4NLb/Wof0mHXHKqTQ2t8hwu32JJ/2Ydwjw3OGVTzqnysoTjr9pMw0Oms
	eJ83ZXT9s4s4h1aSWVy6gSdiO+2A9GFLymEeyyM0XL2DxV/orAgjFO+//FbXznGSeR3EgECUkrS
	AnMWvesDb2RWihg34uqkRlVayXzo2+A1Gvtu123Le2ZePCOXvfNGlBu1+wMMxV2boXarw7Kjp6I
	tJQKhIna4ojA0AWkUc0JWv5L4aZVXEptRmR8PhxDMkfemz2fkkDcSNu7dgKJxYMWThm5nzvpAzu
	LJyrN8Vv6rbVhx49D88g7vvmSGJAkSLe+ttjU5H8jwwGxan0JUaMufaMJ5f6FXdnkP9F/zKKc4v
	rKVssaWDQYJ0b7/2Qw4/o18Ev1zIE8H3aIBSm+gItsaue+R6CY4vxwA/pOLY2qlr2xV6P6qcPcf
	Je8nXiGBGecRL3BYDP6jhN9rYznyDFPEHrKnwos+m77G2z5/1UE=
X-Google-Smtp-Source: AGHT+IE7R5Rq59mcZglu2dMbSmwzQA0DuoEDw9ET7Cf1MleDlYYipJlEUwm/OuRe6KJQVxXlQvBRNA==
X-Received: by 2002:a17:902:f70e:b0:2a0:97be:61a9 with SMTP id d9443c01a7336-2a097be6574mr64303105ad.35.1765791535968;
        Mon, 15 Dec 2025 01:38:55 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:55 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:49 +1000
Subject: [PATCH v6 5/7] mfd: macsmc: Wire up Apple SMC input subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-5-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QydWi+DoiY9Z64QzfXeb7huM2KW3vZ6y+zBjHRM0skY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215ktRXclLcr81bZJ/cztR0mm1/JFf93fenKz6+6l8
 py6fnM3dExkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0FDHWMeIgYtTAKY6uJGR4amuWV/mXtO6mp0XihoUH5fHRSRaVhe2f+TVfXRAQXC6GyNDh446+7P
 CrSess8xtlknsz/4hc33JghmFvFFfQ2ffZbvLDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC input function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index fa7b822d55bd..85410f357603 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-input"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.52.0

