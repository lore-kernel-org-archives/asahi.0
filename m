Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C9C25B2E4
	for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 13:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734148; cv=none; b=MI8Wiww53ax3ikPvoqQwZlVI0yM3U8fDaXVknUFvm8FKJ+19/BCR9P8O3N0fRbdLxOxnfw/HWdWtFEmIqtcsK5zZD+gMwtVIdpvLVRZFH9iONR8ZQX4s1PTanzbA4ojbDDutnoXd/bLnpmK1SxhO8Wx6G2+o4wYOxwn0xHsBiyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734148; c=relaxed/simple;
	bh=5pAhRcgO1+EuPNUIzj/fNOn0kIQ0uu1BHYpfqb2hKXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRkS3/5eL3U8gp2zqVZlkrimErX9wPCZ/Gk66Nowj1UBoHJ2kqz4E8Ph/NjNXsxpd+D3ZkE+J7GIPwj84RrzASHOXn6n6UKBMF1WH4bXh2Rs8+mUK9+OcilzrqCivIUB3LGTIBHkPZe2lQtZFHs0rMlHYgtlReylqdxqRYYW9Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AS1iJBJN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AS1iJBJN"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1396958f8f.0
        for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 06:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734144; x=1750338944; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXOeSoBKwd4+haJ3JvgSLXQF+sIOgqi9Fow9Bw5pk0w=;
        b=AS1iJBJNvfYiQyewJXnqZRNsg8rkLtsMYDg0cXZq6akZnGaN/VLc/0YdgpYPrwgrpP
         JgB+lRg68H+eQmdEAxZUyOOf2597xCduTG1p/peUFao/91b8fXhHr8NkhXorNQIHT9BM
         SUxLxebeYe8+p1aA+YXloT8i/rFCLpN3B5JVHWS4BJakdwLd9WYZ1jOkiwK4RPS9IJnL
         xavbNP/3m8A7GAIEqtTqdXe1aykJ2dIHJtPqhOi5g/jPCqO9AdV6NlXl3S3Q9byYww8X
         y/YDwIqFp9svbyyywiGCa5XYrUzgFpCuOZo3LHzPGEMY6kOSFTshbXuczVV3UTRPfbf3
         jpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734144; x=1750338944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXOeSoBKwd4+haJ3JvgSLXQF+sIOgqi9Fow9Bw5pk0w=;
        b=PFZBJ0nu4hm6ojNjzvypILOPmJZHpal3RQ9el2oqZ+5d62R/9rdJG36HWiWdYr9Tq7
         /ORjApNqABtnFoOLlNZtniMxwK4qvjIMEAX2dIf01kUNd7o5Y7YvybJEChZ/rSF45HxB
         hZRjCOIYsCBxvDgFma7hAj+XhtYyXxZr3rbhHV8MUCih/LOPSBvHaJT+mUCgkXAIePXD
         WwF2VCGfg1GMz9p2u/LW+xcvKuTSguKlmPPpAaBCuWtRg4j/n3kRq5W080cWeE+TvpWk
         Ey96fRomjeSrbTRSnoqXJK2CViuq4y9t6HX7e/Ih4SiI9n6csAEY+lbH6Qhp3tzApj0b
         tt4g==
X-Forwarded-Encrypted: i=1; AJvYcCWm50ZGihYXGvZKOWkDIv1CMmrkBgITLFXkCKqkB+Ov3ApGMMm5rsPUVhbHz1g743biSS5xWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEjywVK8zdW+Lu9l8m83H2rgSyVVJ/LpJYlGlaAhOK2V/XT8Ft
	9gEDFpuJTmlrYhLRnFGV6UqUNemXe//NAvi4JrhqT5deeUkK59KamUiFcwNG3YcdBvA=
X-Gm-Gg: ASbGncsT7t61Fa1ApVrQNZjgpflhbZddGrcnvQL4aBKzD397qm38uR3D2dlEzMORmwS
	SUERFAPWKO9Z2x8/RI+5+drN741UjQYorGqlCNdY/N8vCascz/5ABOlQt3vQpRXVVpQrw84otex
	IQpdn5racY8/51FEXhboxWwnOYOgfdMHM9/7Wy5v3DgOpQkCDxet8TX/yFwfpSK6FluBh6BAbUz
	S4trRmA+QBemFqKUi78Pu3Amljs1paqGPWy/aipZQ75Ttq8+zpsOh61ZZVIVq7Rkez9zGAIkF70
	+x2c0YfcpW7RYIhwTPEMLci+0p+efiyHwZBWidE/gH8nZwe4td/EmfU=
X-Google-Smtp-Source: AGHT+IEnpJ6Q4AZ8oPyYmaUzcDZGuReMq7lbniJezZBAPId2TYPV/p2NnMGPvdWDp/pysd3sY6Avhg==
X-Received: by 2002:a05:6000:1acc:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a5607fa6a9mr2707038f8f.16.1749734143769;
        Thu, 12 Jun 2025 06:15:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:25 +0200
Subject: [PATCH 16/16] pinctrl: amdisp: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-16-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ME7t3PhskqpuTEodGS0joNb0JvX701e6DVecRBqhzik=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLn8MZgPfXtIzTahad3jneTgIaic/QOkZGyI
 SGVy3H/f3GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5wAKCRARpy6gFHHX
 cmoRD/0a+ixlOlllZnxdQ3IwiZjofhYGTNWzylVmVuilwkjx74Ac0WhwgNOgk5uCmmF2NGn47Lz
 E435pD4buRkFabuolt2o9TL8wMz/0RDBg32C9bjwz9fezuo6zTgzSwOjEh5cRd647C84rRl0KWc
 YHu+TOoz2o4uLlV75o3nQTqLM3l1jFVZ3+VSt31kn1Zavk6/31+PgUYiSjgTIsxlT/Gdps4VRtH
 wa/aiQgsQsiFHtCM7iv1U583mqmt1fyy3DcZukPCRuIyWOIBMDvi/gqk9leFU29A9h0srxVog+b
 2atd0fQ4ad1OubxK41SjP79dMWtYCixfFespdF2IrwaZrVN03CtyobPyUeIkzlYqy+j+XcVocDO
 NjjWKIYMEYJkruZsAOCp6RnA720dgwIaPMSHCb9EL/t1FuLODewQSnenP5FeWSZaiw/y0s0HNWE
 u5xsj/scBHbfLBGmsXxgSr7mOO9hzjyNxYki8z8+PdJQHiEWRq0F1D+FoXcIHUqQ4YrQK5Dawhw
 aQuOGjzWqV36vIoUCA26atb3hiQS/pIePKqxAtnWOg9w2ghzZB8deMzBPTGDg632LEnQYGzr5eV
 2jZt4jkSxcUYLzAs2RNnPoiDh546HzSIvkw36qrNT2LHX7VrBQPLJOJDSZX0Wb2L7MnN8xnEan/
 UkQWDDMnqWN8GnA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-amdisp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amdisp.c b/drivers/pinctrl/pinctrl-amdisp.c
index 9256ed67bb20e9eefef6c6574f1b60d71814cdc0..2e706bf8bcde0536b9e09614665d46130e12c406 100644
--- a/drivers/pinctrl/pinctrl-amdisp.c
+++ b/drivers/pinctrl/pinctrl-amdisp.c
@@ -117,7 +117,7 @@ static int amdisp_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(pin_reg & BIT(GPIO_CONTROL_PIN));
 }
 
-static void amdisp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int amdisp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	unsigned long flags;
 	u32 pin_reg;
@@ -131,6 +131,8 @@ static void amdisp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 		pin_reg &= ~BIT(GPIO_CONTROL_PIN);
 	writel(pin_reg, pctrl->gpiobase + gpio_offset[gpio]);
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
 }
 
 static int amdisp_gpiochip_add(struct platform_device *pdev,
@@ -149,7 +151,7 @@ static int amdisp_gpiochip_add(struct platform_device *pdev,
 	gc->direction_input	= amdisp_gpio_direction_input;
 	gc->direction_output	= amdisp_gpio_direction_output;
 	gc->get			= amdisp_gpio_get;
-	gc->set			= amdisp_gpio_set;
+	gc->set_rv		= amdisp_gpio_set;
 	gc->base		= -1;
 	gc->ngpio		= ARRAY_SIZE(amdisp_range_pins);
 

-- 
2.48.1

