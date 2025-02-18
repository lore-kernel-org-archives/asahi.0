Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD8D22D4D1
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867765; cv=none; b=RNNGghnWEvd+2bgAK6o9BoMjzlCHlSfKpTsRUWWlJYNvqkcyKZJvfE87LKiDrJ36RAT8qQoW2M7b8y34Kh9JvvN/nPZXCofNLx6wiJBBxe6/bKz3tNrSY6c+2tPeSQLh/U7idokXLT4r7X5IONBy0GHHzsUKT6FLM1atV3W2o50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867765; c=relaxed/simple;
	bh=JjlvOPqR1QdqJhsMRRHhvT8COSrKfIPpL8mmZWKayTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nAUzLktwFmXZ0mesgnMdBVBRrbvCvvDtxNWuL9hecEuWMMgt0jFdW9E+KVI3bNjh2NtlhbNKDtOfRC6jfWTFrWylwA+cEOqDNShXttPKDZCisEWb3gEU4HSFx8ew0SP/2SeaM2l1vL1jXHlscN4WRKJYTWH849tJ/NlVzGmZ7gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzgMTFPi; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzgMTFPi"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-220d601886fso67180495ad.1
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867763; x=1740472563; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BceYlCX5vbozGNFMmQiIjW33ZPH5I7W91a3fTwyhgQQ=;
        b=MzgMTFPisUnyabFT32b/dKzwC2r0gHPRkDgt5++g/WoS/PMwlS1YCriHF2vEL9HrEv
         kGyMtb0XbSUrtrsrsx9RRrNnG/uV3hUie1jb6LrL7Tz3jFmNJqy75pdDQqzpXrcxogRF
         ZkLmb+k9ZUNujfPw5E6u8U8p5qZTlztAs+sE4DDGSGfW6gnJhUIZCrT2V2JIkPIyzgtU
         t8hio76ulD+j1oEvzjECTWwoAtKZpmgIaGB4XF3VZuS66C4x3Aevl1cfJmgOPbCpl1MJ
         jYuYIBM+N6CP9qhd6W8PcJzMKU3xnhdqK8sALgqR9zR8XYbEKC/7S4JW2pbvXhieVt6E
         3nCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867763; x=1740472563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BceYlCX5vbozGNFMmQiIjW33ZPH5I7W91a3fTwyhgQQ=;
        b=eOkr97s2DF/cJ3mMHo0ve0LH3YoxNNuFixYI0d9Dw8R1pGWsNVUClA8Lh58ZboKNL+
         rdgkkUg/u9o8hCtae/weyJOA1gd4qkUAwyPqgp4xCVeUOr861s6uQG+PAW9Vu/finP5w
         QkSg4O49ZxkryVNutsfRLM8RJk58/x3XIuhvixghglRFw/zvqRWfLSpUmiAjBHJHI7AJ
         tFDyTsbZl6P+xcRDvbIOJb6RzbbWCFOXryEG8Enmxmwtd39rYhnblYEipl1EZRCHfUNI
         EYUpN1fgUJGyWvJ5piZu14ozfXlZWeJD8C+NxNu3PMfaUa+/PjbeoiYUlUqfpv9aWyfZ
         7rQg==
X-Forwarded-Encrypted: i=1; AJvYcCUH1j4MnYdMJe0RIYiItmXTs+Cn0xeYNeJZ22YXq6rAb/UZHZu7DH7ZSjaHGF7svV8gNi0y7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwldCReLHkPEVPhUqrRQJ8qcVPuXg2ojMKR/IOIWPo167m5BfgE
	cd/UTH26DtX9WVHU8uOJwvSNLSX/Y95UFc2C5zI7Av/hCMsztbA4
X-Gm-Gg: ASbGncu7ZQ/KTBp1HaXkFH2Wegr4nN68XNRJ5fILX3D36NeBi1vvY8OYd2Ad7RgBIb/
	3iqpVeKhH/Mdt+VaeuBSiMCIE93vCeRyu7vGY+PFUHBfndhIeWJjmq6Ww8VpDJJ3oG7llL/RY+o
	pG+sIvlE39wc+QUBrpdKZUoJlwYPAUEs03AunVf0j/QyHC+dN8Uvm/8l05bsjgTksuB3SHpxusE
	w1k/+5/6gJ6HcRoxXmnZhspcBwZg7CNZp+EGluoOsdzmjVBgB5mMPXO+whrZbt0m8Wu3eU0VVhi
	L2+y+o0YFXQbskV6Lh0JzBxUMDjtW96O7v0/S8Djb9L8q6RWhA5u91DKEdI2eyGEqfhAwG0M2k7
	+huv1/ztZAg==
X-Google-Smtp-Source: AGHT+IExe1obOg6JdhqaMeZP9BJnI/sbek9jjVND4C34Fb62dH/AuT4ztTLKvkL9heLj+cU5Y+13Yw==
X-Received: by 2002:a05:6a00:3e0c:b0:730:75b1:7218 with SMTP id d2e1a72fcca58-732618c1ec6mr22056568b3a.16.1739867762934;
        Tue, 18 Feb 2025 00:36:02 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:36:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:35 +1000
Subject: [PATCH v2 01/29] ASoC: tas2764: Fix power control mask
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-1-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=802;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=3C7DOfIHda8WjgBc3ejixI8wNYha3fB9QmWCFcWPEPU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3OIF+d793mUl/67UftksU+dWFj03dY0LHw8etclyq
 Vn7lP1hRwkLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABM5ysvwhW/foRXV/cLFGnsK
 bHf/EDc3Xrrpk5u47RGjL5X3g50SGRlmLKhnUFc981p7S/gro5hrUXnzPr0RYXuUuejkcruEV+l
 sAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index 168af772a898ffd1c5e96c50df77ff6225f704cd..d13ecae9c9c2f57853db70bb1eef2380f6fec45c 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -25,7 +25,7 @@
 
 /* Power Control */
 #define TAS2764_PWR_CTRL		TAS2764_REG(0X0, 0x02)
-#define TAS2764_PWR_CTRL_MASK		GENMASK(1, 0)
+#define TAS2764_PWR_CTRL_MASK		GENMASK(2, 0)
 #define TAS2764_PWR_CTRL_ACTIVE		0x0
 #define TAS2764_PWR_CTRL_MUTE		BIT(0)
 #define TAS2764_PWR_CTRL_SHUTDOWN	BIT(1)

-- 
2.48.1

