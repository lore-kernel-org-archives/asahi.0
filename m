Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B101B24887A
	for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 13:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734129; cv=none; b=IkHJ46hpvcoZBxXWLqp1Fs2DCj9nv7CKJUmkBsC/VpwOz3PbiknuX5rWYwaA6rd3OHLbKkpNnlzz/LlL1+SLd9cor3CXGPp39wPS8tGHbmUFdNtc++YhX8WPSmbpwVHcU39c+fWYc4h8f8/SiW5CuN8TMQ9NWFDQYHJrMmXw28k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734129; c=relaxed/simple;
	bh=E5AKqRpmO9wPBzhaTRocu/BHU3xEEHDIC4VmpgIEqvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBtYOPNQ1jKC2XT3qpGPLCImCV07sXx5JYFN+Z/CQpedarpPrS0ghMS9S6xWZcJsXFda9MVqkn99nKE0yWj50NGnpiiyPHHjt7YTtLfRiVw2IZH/X26hWpaVRPw1MIQO+PzkThStzn3VybWvZ/f/jUiCKBoaguCm//MeRp4u+sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PJOV5yD2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PJOV5yD2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cf214200so8158145e9.1
        for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 06:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734126; x=1750338926; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rV66TNaxM+tRVm0G56yg1ZS+Xb8QC9jIEshfuDQ8Ajw=;
        b=PJOV5yD2QeQQlsbexunSaU1by08EcdGp3FfA+0UtxCr4RhSaJqsbzDX/L6z6PCoQfV
         7JlnepXgKUetWLSbVsc0loaLdnSeenMzatCFBaCmRW/smSxQq9K1OHccHXLFh6YfMWAp
         Bp9pduLm/mCA7fHiry0vd5fxPaogJ2s7jHLhUXXblGAODTYP3NMk8O29bg7sa1LnttcB
         ArQvgbQnFRRwYahuvJXYBXVUWlucu4OCcYp9uE8TNxo5/5EfG+Wjbjt6FjIUykjLBrdL
         Ecm/hSEdhcSYNlB2VV+VIFIEVEhqWfQWbJFaRebr1qxERFEgX8ArJuwR/XT+x2ixlV2b
         l2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734126; x=1750338926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rV66TNaxM+tRVm0G56yg1ZS+Xb8QC9jIEshfuDQ8Ajw=;
        b=HTVV5E58Z93YHuuPP22NJVd1Kdwv/EGkyBQEAvImv0pBeUfNhzoWK+/de8khubhtRL
         l0cH+P0rIi/emk9/hLMbXepQFXB1gzQDIaJlGo9ws7eQE8Exf1MavH8JTp2HKI8mhCT0
         rwWRDJ7F3eFD4uyVVIu9O1WHq87GAXbGLMXRVYl+ALff3KNqJFnpPIyUQT23YaXEEOyH
         9sH0nqhD1fTbGgaOpEr5n4c3NeJLc4b+x6/O+8VPb+sYvEFjyyFoZq+GsSDrlIK8Mvk+
         66v51/TY2zO4SrDsPDU3fuMp2QLPMsowT82VDUtZ4bD9CMUTLne7h6YTrQXazWJJOwXa
         mVlw==
X-Forwarded-Encrypted: i=1; AJvYcCVS8XM2UhcFz9fSn0vreh8LtpLxTegAomQR8uj7Jy5FOn3Z1kpOmzj5LFn5JDovVOz51yoVbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8jeLkJtlE8eNJPx37Q/HKQweCavTWBSwZ/uu5psstepoKpeVH
	XaOluaC/Ja65K3IyLg+4bosWITSOnHDQO0zgTcmmwoCokgCZ2c/Efb4cdvzZclNEB5k=
X-Gm-Gg: ASbGncusopXS+dEa51ZJNzyIGGmD3J4DLpVzRtvVo5sXWkVxCWrqA+xWjMZ9y27GzJU
	+4Fw3f+k5oHV8ZnNSMqdCdvIHws05Vhs9pr0Hlr4Ut9IF4peERk1x9iheixpYwIKbxVDfUjxNrh
	8XdqB4UpfAIhpavq1B64cz/UqCQPfeOf9BtteCTIWQR4YCtpdBw7a/Wgv0SxgUHJPTUZ16s17GU
	aP2IdbbdolmEuJp2Q3cAvD5082VauAcxmEQNKS6oy7lP3pduMHU5TrH1sF3qihkJHbSHRBNI/5j
	xpqLooUKP3fpMuk1EyR0i8YQmFDwcYyM+5/h3lDEhwoUdAaha78L2lo=
X-Google-Smtp-Source: AGHT+IE5mT66pzqKyfIajfIGyDumyvkC12XEvq6ZyTsCS1EDLoE+BveAXbQvq+KfiZgQjZVcNrQ5EA==
X-Received: by 2002:a05:6000:2890:b0:3a4:f744:e00e with SMTP id ffacd0b85a97d-3a560749228mr2745803f8f.4.1749734126031;
        Thu, 12 Jun 2025 06:15:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:13 +0200
Subject: [PATCH 04/16] pinctrl: mcp23s08: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-4-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tEFYQzYr4zlLCNgvVSEeoX4S4CSsudf7dYRdU15AU4k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLk00prsnH+1kwtr0kzg9zSLDkGxpKTnd0jQ
 2950YwwAduJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5AAKCRARpy6gFHHX
 chD4EACJYOau8Xi4fN3Ov3TIfQN7He28eIvwgT5/E20lExaBUJ2RaS+UWGxHsqkMw1AmYmlWwWe
 t7Y93zOUENY77UyolkyLKRIUoxa/rU5H3OHrxR2lzxEZHJGH1YIWDeKInlkQCAumxB/LbXOunlZ
 0Y/7w5Jm6gYhBq0c1lN8zx+kW4v6xH/BPTgfbz69NBHIg3q1m4abQQAxZdZBBJmludNlRPCel6C
 UJPsLmXvRaKumW5SFMgO3g+EZmXP2+/9JPy6FjxR9s3ZudFN/Q/24bByS4PGOuwEQbQZ/bQDV3e
 kY5l+jCwcAmU1EVEx4qQGBtNC5fa/OK85yj1wOzyr/uthH7vQFFPbLUWpiccyQsuRRTVamFc12M
 QWX6OnGRjMKwUyfEtqgwONiGC7b8/73K1ihlB1FWR+V4d8DntIjO2Hm31hZNk2K9HHs3Tnoye/Q
 V2Akk29iY+g1pd6DQ7ZCeFDiZ3/mYjrgr4SVc8LRVbOn2YBqrTBHkVgXNnw/Vf2SePZy/XjLuLL
 JvbAmYmTxkDQvqDfg3xmLI6aVfLuOLlvIbEY2hY8lkxE6oPurqUc1v4mNapXqijdfpMojdcUefE
 KgPCcATeWN6UEPqxC1itvEf6yH+135QoxRLH+32f39jZeN54TE1MjPkkwy1eeo94ZR4lkUBs+CL
 R0R7Nzt1LEuaeUA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index c2f4b16f42d20b0dfb0e1e6c79f8336392307c70..c8027ef03eccdf54809dfcd76ed8c07c424b41c3 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -341,24 +341,30 @@ static int __mcp23s08_set(struct mcp23s08 *mcp, unsigned mask, bool value)
 	return mcp_update_bits(mcp, MCP_OLAT, mask, value ? mask : 0);
 }
 
-static void mcp23s08_set(struct gpio_chip *chip, unsigned offset, int value)
+static int mcp23s08_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct mcp23s08	*mcp = gpiochip_get_data(chip);
 	unsigned mask = BIT(offset);
+	int ret;
 
 	mutex_lock(&mcp->lock);
-	__mcp23s08_set(mcp, mask, !!value);
+	ret = __mcp23s08_set(mcp, mask, !!value);
 	mutex_unlock(&mcp->lock);
+
+	return ret;
 }
 
-static void mcp23s08_set_multiple(struct gpio_chip *chip,
-				  unsigned long *mask, unsigned long *bits)
+static int mcp23s08_set_multiple(struct gpio_chip *chip,
+				 unsigned long *mask, unsigned long *bits)
 {
 	struct mcp23s08	*mcp = gpiochip_get_data(chip);
+	int ret;
 
 	mutex_lock(&mcp->lock);
-	mcp_update_bits(mcp, MCP_OLAT, *mask, *bits);
+	ret = mcp_update_bits(mcp, MCP_OLAT, *mask, *bits);
 	mutex_unlock(&mcp->lock);
+
+	return ret;
 }
 
 static int
@@ -626,8 +632,8 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	mcp->chip.get = mcp23s08_get;
 	mcp->chip.get_multiple = mcp23s08_get_multiple;
 	mcp->chip.direction_output = mcp23s08_direction_output;
-	mcp->chip.set = mcp23s08_set;
-	mcp->chip.set_multiple = mcp23s08_set_multiple;
+	mcp->chip.set_rv = mcp23s08_set;
+	mcp->chip.set_multiple_rv = mcp23s08_set_multiple;
 
 	mcp->chip.base = base;
 	mcp->chip.can_sleep = true;

-- 
2.48.1

