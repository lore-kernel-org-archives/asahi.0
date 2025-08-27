Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8C4350D60
	for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293829; cv=none; b=TJkGEGk5U7RyVbREVPuffqabpZj0rnkSEZ5cod3e+b2/tnNhmZrjPKZSw9uz2XRUcxbJSa7+FoSt/9ooj9unpPFVRnpmtY5HFVWO5ne/v/r/7AD6U9DqBt7mRHN2UBRBeCDEYFa+y6uGwfbYcD9wVmnRa6IOynzkt0h7rbmAO54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293829; c=relaxed/simple;
	bh=xCTwt54W2CQBJO75F2Lvz2paGIMG/Mf6mnXKlTqhQ4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RxuXGqVmaoO/LqyvVQpzqOnxR7HAe16nbjjRtDCEcqjEEjkpzC8AZ/MjWyczLV57fA9YqwrfZ86nf0eb+jZWnqP39bSSy9W9WWym40Qoim5DUZAlO5CUR3CC3k9D786P91QYtdhi0Dr+N4j0tTCC/IaPr/9UF0ZMfnW+UxQC8lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADGoQ705; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADGoQ705"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7720c9e2900so354649b3a.0
        for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293826; x=1756898626; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z529y29TIOOGxyh61oY2BQwbjfmwK/ol2lbcYwZ434w=;
        b=ADGoQ7052Fqw2QzDtNFXfCRED3YWNX1rqbQb5AVGvrUk0MdG3pz4y7zLS8ZPcAY2rc
         JIr6PxvrXrpUANhqhCT6oKnefpcCPCjvGx76pzx6rUh8NZZXG6cliBVP0rh/0xUbpZP/
         FNah+ZW3/e8BsnUfqYIu6ztxHJpDODTvnWs1FKh8CcOSc2KTosuXofEIMveDibXKVqjR
         w8Ylhmoxeuf+HNPvRZ/dBQccQidTcSngh/rQQXHQI60oSBqXckNtqpV9pg6bid4Y/Kdb
         y8SDF/a1g7EjrTVWQa4brT0yrTWG8Ofw+Xelj9dwrRnasyPrPTswwtb0BI7eIUnuWn9B
         7W4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293826; x=1756898626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z529y29TIOOGxyh61oY2BQwbjfmwK/ol2lbcYwZ434w=;
        b=dWIswLYut2LNOqtP8q80xOiOh/E7I899XY2VVPywntC1/kn4imts4MRBNlnNsmDQR7
         UFtTmZWN6rw/m4QfU2CVeyuKPf+Oybaxa+JYNMFaKFgjO9yXSfIrRToQyfxt/nsFQXIc
         pjQ56N9wS6M39I+FfqXq+CZGKeJR7VNmKKqmb4Z5MC+JwHSpim77Z0xbey6Bq9IY3/Or
         AfP2ea8Xds0ks4nh8FD8cQrZJZNM9aG7SrZn0onnFL4PZz+L4vRgp9wCU1ALMoiAURo5
         Et3V+nfaYGRT0bGr3AopeWVAyCiJ8GGWKsDx2RNJ57fcMdXMOsstiWzfUvv/CRfN+/+v
         YfQA==
X-Gm-Message-State: AOJu0Ywoaq8AJEy1plpoycP3EEceMXTBSgvBEZiHfA2Ds+Pa6wu1yx4l
	n/YwMIdN1iPB7LO3nRMV2iMFaPn5vWwRo/k4wkwyZDSYKvMG9Eyfap3T
X-Gm-Gg: ASbGncteKs2EGqQTEA2stWDTINjV7rVSdroR/rj96Zb7LWZLUfW6r6sdYGZ9ibIkdzR
	iHyv3rl/2qt4R5sLx8mckbdKFQ0UOViC5koIRM5PPRG63uMvlVizzRNL1DP+VMTdozJyKZbWr8O
	tqInGklgIc45ws562VFURUTjjcFkCbHjxLvxrk5VM1ZpSi/wiwgp6CrAHwGMdXp6gin41SI5Yej
	9S782W7hyksWfKH5ix6LE+Xf360TCuDBPShR/Se5ZGQVDlOsNyqBcluDV8ZMDN8q96FptK4h6Jw
	jsOOunLUL+YJamTX2qWEouJFPVZUUz1vV+xhSNOZvqUq6kIkm58cuh1D3chtkFtQgcaDNNM/V3A
	nauIZfNIbjc06i7d8RpQw/oItJSjF7K5NF3w/piBndENLB/CXe/inJkc0JWkiulI31hJaXFmaNZ
	4B/VFHcVVyCJ4/KweU
X-Google-Smtp-Source: AGHT+IG1I34LBUT0TKwrF5NX7fXsjRB/PM9YKtCnoAQa/Vc6sojIb33NnLwLORwxlipIekaFiHkkCQ==
X-Received: by 2002:a05:6a20:72a0:b0:243:15b9:7660 with SMTP id adf61e73a8af0-24340d6e2ddmr30868600637.58.1756293826022;
        Wed, 27 Aug 2025 04:23:46 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:42 +1000
Subject: [PATCH v2 08/11] mfd: macsmc: Wire up Apple SMC HID subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-8-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=xCTwt54W2CQBJO75F2Lvz2paGIMG/Mf6mnXKlTqhQ4M=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjVrS4q3nWUJLd3+9z83o8Gb9w8fnvFzvL7gvVyM+
 PLnXb4HOkpZGMS4GGTFFFk2NAl5zDZiu9kvUrkXZg4rE8gQBi5OAZjIN2FGhktv57J8Yqkzq9oQ
 5RByS8mkQ6ZLSuX01I/+idKtkRcitBkZPisUKE+Zo3y1/VqA0Mon/Xapaf3bOKWX5m7ivGOp3jS
 NDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC HID function to the mfd device

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 286dc150aa6cfdd6d29f769094278daaddabe7c3..893fc47d62b2c956d966d1841895a3fa2b9a3005 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-hid"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc_hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.51.0

