Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CB429405
	for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 13:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735876; cv=none; b=EOeUvHV22QqYVNyAuGiM+0YfZvMwZ65UzHAxDaoiKdouhwsdh3Ndj4ZZC+GjiQkutKjlzGc/KbM+46IjdalJuHiSXpbn23iTTv0Bsq0WWd1/Q7eiWU7R0PqJYU/8WgyspqbrDi4rqRve7gG7NxjSZeTJBUNKk9/FPGYVk87zdE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735876; c=relaxed/simple;
	bh=KY0F8+kc7mm5xaiPKfTg64NGT6LMQadpTVG2dcSzIOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nW3qEvzujOSU0ns+Hpnu0UM6Pn1RyYaqz+2MEjOkUoWKeYw2HngxMhU2KyT4kk847ceMerzugjsuB/ePk7L1PCB7vQ+Wr+I+QP2O76bKNH4YnzuoszI19g74uKFu7dvAj25doQTGAKAk1dwsrkkb8RifDk1iP7lvqQyxTevMCt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TjXuJZXR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TjXuJZXR"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a52878d37aso193483f8f.2
        for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 06:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749735873; x=1750340673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wLh0Bfznwrpy2ODyPunjDZzKz1nyvlK3wv3RxF8avk=;
        b=TjXuJZXRXL630iczZL+XQ2SaocivRSQ42150rLLreAldu7ETxUDxueCC12orksWomu
         kzhqrXQYtXhZu0LDa38J428jVVxpAtnalJ8sbJ8lGrHcJ3Qnduvt0+T5vMJl50iYdmGL
         I/gqWTLXI5DHQ78exLtEWrqtKpNvCz2cQX8XLTwCY+uiXVZ5UZA8nE3MVHYC9FJAYyk8
         lcU0LrZVhVBnhBmOUUisUnbDnvgM4+t8EcrzyVFyhrVo+etvIrK+JFzamECgJ5emLQ9J
         V0tnEmswaM10KnS1pHK7J3ccKxwDqpXf7EGr621vc4BeOaRB+Yk+BTSB2dciga8PrqP4
         oghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735873; x=1750340673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wLh0Bfznwrpy2ODyPunjDZzKz1nyvlK3wv3RxF8avk=;
        b=rsnsPcbQxhX8FBQymBHD7AxjtVPB7lFggXz+1s76yBVjvgskfEjNGyZEyz++1qQxIb
         Q79KMeNxMFL2vHCoXHgudSzvhvt2Bp1E5h9ulUcF0Ue2XQyPZprnZebaunHF/kC4CsIr
         eZEqLbI6Is9VqbWP2gpxCaRGzwtpwmVsTLXwfTXCG70eIXJPdEGN2nC6YeN6rGcHsfLJ
         +rqak2CZwcFOm8MxHZRWwMsFz8lEiB76pR9Edd/svxjN1A2HaUlZ2l704tlkJfrNE0np
         Bh5ppyJPB8bM0zDInsglODaL4UBXUYvqN2Ne1mDOhVjf7BYR7l/QXrIinyQPY9lnBwSt
         Fa/A==
X-Forwarded-Encrypted: i=1; AJvYcCWWGY5ZpihAJkn1x9LVJ9z31fyon2E6vSbVE+4VmXKwfcJHQaG/u/5cgA7zzwLZWow96BA/VQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzsh23Friw74z+tzz3355Av3GZ71XWuUncep/IaZUAbXMP1zWmf
	v/iuhjUrXwLT1Pt397Xiyy1xN4B4TELHqESYXz8Z85qdOHeoLlgzXtUowbHjN091eGM=
X-Gm-Gg: ASbGncsFv09B4SSIiHXQyjeKcpgm8bZML+nZnffrfT5CQPE/PJVXmFy1UuJ58g0APoL
	n9MvJPYqQUYHz4qYCfluf0YIMufvGuuXcAcyzLTCf87WCwZhm3zwqUjc37QpDDsp0RVGj1hPEeA
	Y9IUNJboaLQ4wBDOV405f77hghtWAp8dolRjzE+kuGt0jlQjv3U2p5wGSll1VaF3ANZn05E5vIC
	7yiKdWz8EMb3E+35/0bLIUZS8N5qK8bkppamk1sibaC6ig+2iObaZuk6j3Oyt0F/3r3Vhf0LyK1
	NCVkGdI+nKdJKhjvV0Fe2EbTVFXW2qWRVmxi8tvCEn7vJ8c7C9SpWDiVff7KKMQ/Eej+TgIAtQ=
	=
X-Google-Smtp-Source: AGHT+IHtHbOKUROa0ve5oP7CqlT0tuVP3Uhvzz+OcfUoUTB8LdEAWIqsjOFYSVDtkpJs1KvalbK6XQ==
X-Received: by 2002:a05:6000:2409:b0:3a4:e740:cd6e with SMTP id ffacd0b85a97d-3a5586cbc4emr2389747f8f.8.1749735872804;
        Thu, 12 Jun 2025 06:44:32 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976f13sm2053661f8f.4.2025.06.12.06.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:44:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: defconfig: Drop unneeded unselectable sound drivers
Date: Thu, 12 Jun 2025 15:44:23 +0200
Message-ID: <20250612134421.95782-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
References: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=KY0F8+kc7mm5xaiPKfTg64NGT6LMQadpTVG2dcSzIOw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoStm2S0PrTSvMJ4T068lWmaIsuO1xRYGmPZ7xW
 PrQgJMoVw2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaErZtgAKCRDBN2bmhouD
 17NtD/sG7Qwg74MQDSYs/mqC4KOD2fT4ykjXIqRK6biOw7HMjliCiQOw+XynSblUFD9TbDeyzqT
 wIL4LCWYQ6kd47NBX8GSUpB/ShaOaI09o8Nuy1Kvj8aEljhdiGp4ckeF295qq5RG3oWInFtoM5Y
 Ld1HGX2nOK137IibuLsWIZ2ZNYbWdHCfIu6ZJi2KGD016k91JQ7RHI5oe/O48vpG8smsfj88clN
 D+d+D7N3TACVgoKNVdvwcG++7BfJHe/0N0kc/KcYGAZHkZW0RxMRV5CRa5JTFFT8HcofN4enuDQ
 tAJvQkDehFT+nBaBrM7fcnC2yO1q7SPya558nohVVCvhDhTgxuZsMEkH+1HMhwKU9IrEePtSGLB
 kvhxRHRZkeRVjucthVP2BvwQTOyzfsdGGWN/h2bVSY03neVozbnN4xg1jtBDtGDYwQ09NmCpykW
 xuEhh8DUGiQXNfvIgZu2azW39j6MrXpfIPSpY3PUarMkn9Hu/YsUtylj9Nk85JewomYhwYmsdRK
 DoSNGbvJ2vuJG3IOsdCLweB/RzSo3K3RgXz1/OJMl5IcAnQX4zbf/k0QYip6Iz9mrwZNuP5asAc
 hMFMPaGNU2Lri7c8q57FPcMmeXna0xFDfiEBqGfP/ESJTFcH+68lzwGlgAhFImmUaNS3AcKdz38 7U6Cs+MlvUiIVcw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

SND_SOC_ES8328 is selected by SND_SOC_ES8328_I2C. SND_SOC_WCD939X is
selected by SND_SOC_WCD939X.  None of these are user-visible options so
their presence in defconfig is redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev
Cc: linux-samsung-soc@vger.kernel.org
---
 arch/arm64/configs/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 14fcd0a85f5b..a47e1616b4ef 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1057,7 +1057,6 @@ CONFIG_SND_SOC_DA7213=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_ES8316=m
-CONFIG_SND_SOC_ES8328=m
 CONFIG_SND_SOC_ES8328_I2C=m
 CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
@@ -1075,7 +1074,6 @@ CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
 CONFIG_SND_SOC_TLV320AIC3X_I2C=m
 CONFIG_SND_SOC_WCD9335=m
 CONFIG_SND_SOC_WCD934X=m
-CONFIG_SND_SOC_WCD939X=m
 CONFIG_SND_SOC_WCD939X_SDW=m
 CONFIG_SND_SOC_WM8524=m
 CONFIG_SND_SOC_WM8904=m
-- 
2.45.2

