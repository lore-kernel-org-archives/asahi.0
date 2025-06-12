Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ABB24C07D
	for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 13:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734132; cv=none; b=nL1mbYKNWi2aJIwDxA3XywIumC9gk2smD+v5EB+A79LFev0TVHQA6rBD+MVj8YZBCcVrizmh1y0DbSIqkKYH1D50ejO2ou/IeoJjYjWpkWwkoS01RXzF8rQjfqQhR4mBiVHD3CrRq19HPcpwBF0wTGNqWGFkJpgWl+6zN2uNzKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734132; c=relaxed/simple;
	bh=w0yxq9GrB5wxpDo1vCkzUf7jDpYrthjvxTQ7Cy2YDBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HM9IrDN3wG2K7d5FTc9ewxNupFV2Ue+nmob998hVI3ZRQKUoU0arqx52pbDYV80UFoXFj/Cs71bvw44VBrCKuC8bIsfdQvw17uK9pwXaoO3BiDRbHpfU4M+9WN9/yxuOk/fQgIj7ByWlVWsZPy0WbS/OaQ0J96abna96XbCDSiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qlIQPKEe; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qlIQPKEe"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450dd065828so6901385e9.2
        for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 06:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734129; x=1750338929; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGXLWLYyw9ZyCRb8Qq3Tm3IRZiXBZ5znvzTh5cF4+vI=;
        b=qlIQPKEez+Ogm096FWZRjoc0VTYBU44qFwTb1RTtoJAaIowmEDVtwkZBgA4EdWY6Z0
         6088VvDJ0BTR2m/8oYGbV1mIshFVh6Teel92ieWeKZWIecYm7P95j5o/yUr4RL6Cdb9P
         LUj0NnqpOH/PwlqEo3sOBj+DovJr7IaJG/LKfokwXs+uQK8OYp3+imEIUFRLYF683sz9
         FGCyq6EGVDjWNL5R4lsKdPtykKD0PkbxBksahE6ZNrLIn18hfKNKofR9A3uqgl1tu1aJ
         2azvgign7z/4bR5jYey0u+s9nW3MOJ7ehsgMylVPt7jMSJBhUrqhTQ93sRcjZQ1cvXib
         /jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734129; x=1750338929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGXLWLYyw9ZyCRb8Qq3Tm3IRZiXBZ5znvzTh5cF4+vI=;
        b=nmMfrTbeDfYbAqAjm2PSjLdKSMXbNRNdrDWsm3jJVmChxSAVX5SIsFG3EFLkwp8A+D
         vakwv0Iam409Vowm6jafcn36N5iPQn597qVBsDpDdg7XLp3pSF9ETm/1tp3JpcYmo+Y+
         qkvit2ofsNlRPsB+diHvdkUQUhQ8cPNZ2RcDBQDj/MrEf20aBrHCb9zw0xoGqHD7pa5b
         k9hpwRTRUbKlOGbQiJD8J11oXzj+Pj9ZLbLnvqj/irKlaHogfEfacLgErfMOdRsdG724
         tSQ2D3/b/tT9LkK3SN6iETO41iZf3ZS1MFc2pTW4n9udRnr+HqlqoVaTS8mvnHET4PRq
         37eg==
X-Forwarded-Encrypted: i=1; AJvYcCVMJbHgSQPec/PTeNfJl91N6m9Xa3eV3CWE5TZcLQLyhhiPjfBNm0pEQFR1hbVSrlvpvKVfsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVgfAhNtOW1g43X1oDpkt3rO40vvI/ZU11OFzPDKYeZRFDVemA
	ZggMwVq9sLtbs3PsUBvxZMyVrpTUNF98rGDMxwa3nBEO4HTWmCfEm5OZ8IeHE49FmGM=
X-Gm-Gg: ASbGncvC1rM7131jhj9DY4LnsguZUX8CRjoJUpgvDqX8DIT3VkxSe5FmY5DBRgGkMAo
	Y4HMl7yfb4OQBJafTLYdi7pOWKvyRLSJPIAA9VvQcmw9bc+br+AlfX+igUaHlnpZVt+vVnDtZj8
	hnJpLrIYiQNlKGzKC4v8BozCN6OpHSnRuAFU2WEbusgwEHvC6M/MLAUSR569xBn/7ejP1h7P+Qo
	Ee7sY1mxf8+958VBfzZOfa9PSUr75+oatwwFchDsa8LkREg9ZMMLIX+AoN5B8QQn+uH8g6qz/nb
	Nm8mkykXMdBavjL9WyuOjZO+IoA0w1L47L2/y4CaRGf7VK6wMSZgMM8=
X-Google-Smtp-Source: AGHT+IF9IZN2MS+sYW2ouGCv5DMbUlGfHcNRSDur1nJMOJwR6mhtfhHbo2K0m63hGJZ7Lzm9t37Sjw==
X-Received: by 2002:a05:600c:3586:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-4532b8c2c9amr37528825e9.15.1749734129300;
        Thu, 12 Jun 2025 06:15:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:16 +0200
Subject: [PATCH 07/16] pinctrl: xway: statify xway_pinconf_group_set()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-7-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9Q3bm/CeNxC+8oeWa7fm99HCVraMx1u7Zl7EzaVQzgw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLlNqDuphL86C99UAAzPjSE0SJSMbsWkwcvS
 zysyjdjnZKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5QAKCRARpy6gFHHX
 cim+D/9Yvh9pdH0HyHsSxQ03GvnN1C9sg0macmAjL6e0GEFn8NRgOxEnXwKbStGp95OJYoTJ66D
 jGvdoiWzR8UqF6TssAx9xGFIRvMWV6PZ5DknaE1I8c6T74vJmoJhu93H/sDuwVLrTn+/DU2mCFA
 jnPNftQI2C9KH4WKcwsW6p88+VkRHVVojR71vHqEly1CvfsUDt1YHdfD0b/i7sD4U6wKsdF5Je8
 dfcENemlDbwdAwAgiGY5Fh8LbLSRWPLeMG7zzrMuVwW4epppnpeSJLV6UKgrCgz/czoIVYNPyDs
 Rf87bKBsOdzu2II2sLqjC0FpkgsgGpfEK4Y0cgLsAHYSnu+AzsTWVPKtM7UVYZ05GRHLuxcKgXU
 PjLnEUr3bR07xBoubOEXOjQKtoV2wcZ5/dLlfo+MaNMT3ub0nw+qNhQMbGGSdNBqsTZcCLcG81u
 qxqW/N41epJAzbgUyQziedQdsAi6pZtSYrCG/HNuuBhbMSTwQTKr9mA5lODj6UwJC1c6owybPjp
 cPVB2E90EJN97TqqmSlpCm5As6SPt63bD+uj0RihsW/Y63BWIS9e33rzwyS8251w5U21iErEzoU
 pk8qWDKqMb8tuCs1JuJf5+bZ69qI1UzCzDmGyaad1Ncn318qefMNQozIPqs0Jk07IWgHAFzqn7Z
 KLFaSAY7+IyRMHQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function is not exported and is only used locally. Make it static.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-xway.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index 48f8aabf3bfa3ae18f3eca8ea00c6e796faf4500..02e65d25e72911b812446ad4b90bfd611c9c1714 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1228,10 +1228,10 @@ static int xway_pinconf_set(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-int xway_pinconf_group_set(struct pinctrl_dev *pctldev,
-			unsigned selector,
-			unsigned long *configs,
-			unsigned num_configs)
+static int xway_pinconf_group_set(struct pinctrl_dev *pctldev,
+				  unsigned int selector,
+				  unsigned long *configs,
+				  unsigned int num_configs)
 {
 	struct ltq_pinmux_info *info = pinctrl_dev_get_drvdata(pctldev);
 	int i, ret = 0;

-- 
2.48.1

