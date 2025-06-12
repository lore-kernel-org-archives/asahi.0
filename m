Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2C324728D
	for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734128; cv=none; b=U/b/4GB1/GgQviU/1e4oIDk6VscjfP4SzyYZcSrH2bCb4PPUdDlvU+aLBn0wHUwHAEGBnAMwprmWulW41jExa2rdUjTxyT7WsNSCpb4FZrKDq9ELUPQx5pWBQCN9h1vs8iXiMvIub/iR79eBlQU5HLTxUtSsXUgX579AelnXxIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734128; c=relaxed/simple;
	bh=UfAyi0SnKB7UNnDRolL6nwsA4uSdSBP9PbHYK+OpTMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/LxqtfMbX4EFeEoSrIa3hET6vqg2b5QxpIoz2y21k0LdeRlXS33b4G/96Lfhm99IyQ2GrdZxZS5kkzwMkmMV7DIvG3Bo5llNPk7ZUONWZaTi/ZJW/0033CbJ/41H/7nKP0sYIhLxV6aaSFIqES8GoJDc7WX45i7VAQ4a3Oaejg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uw/rwMeg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uw/rwMeg"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a36748920cso876206f8f.2
        for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 06:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734125; x=1750338925; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Xh9vFlYN2cjb4AoCZuPQ/5e61RjLZcwUz2fDo2ivjU=;
        b=uw/rwMeg3IYc+AxnNaQPmhV8j4CG9w1zq4/+8TA6OT4HESO3u2dyZfTHNx2YxZTt63
         UPErjgGj9S7iZyqF9v/6ZC1dJUW+N3qllOciQaAZS41YkMwMNluAIX5O+AAJBINqmd58
         /lNSqZ+pRX1Ibj4zRg3dcFC/lFXIf5wtxFucDGZv83i3Pw93RLpV4RYWZrsTkYYjgIMt
         uajNkDOn2f3RZ7TVN16XKf1F+5j7bkrkTBX3MyxVQdQ1Jx0Jn2U5CQR2jq9yfFsNYLoY
         rFG4K0u30cFeawux4o8sxCiIu31shyABKuU1VTbUmVzBJF02O82kqQv4rarieYCt95AC
         VJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734125; x=1750338925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Xh9vFlYN2cjb4AoCZuPQ/5e61RjLZcwUz2fDo2ivjU=;
        b=vKGyGgNNiVEC4uCXiAcY6Z1bSFboxZjtFiW5f3RPgtZDyNcvjYUTD4tRmOVebp+BeR
         vPM0iSfplQyu4CcLJUkU980B/MgvM99WFhC4HLroRY9Iy4zUPQ5yCRE+8J5bATviEfJn
         ZcZVsaZ7xNGXVm2kVPirFbBvI4Y5QVX17pRIGVQ/vSenwLpN+w+qmawsBdnsl4eIw2CZ
         7xCKmQfkFadJvHhD6GFhvhG2iMO+IjcaMblib6W3KUu+aPwNgebQc1M506IF+PbgOSAC
         //Tqb5VT2E1+DlLaKAkL41QvkjIKotwTK6g2KXrKdvlGWDSq+PhPP3Z5a2CW9fYAHrJJ
         Ulwg==
X-Forwarded-Encrypted: i=1; AJvYcCXkojTSEBPOKj9wDQ96m2JoJqqR62maztCjQ3qpyuBwbo35sQ4wPMKI0vy5zQB6Lg4FHgt9Iw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBBDT8K59uP275JtiDAJMCi5kdGyc6Bhfw1DsKElJSda+4l14R
	sUVqLSiFTJ5Gmdicr7P/e0cHUqlEMXaSA5HKKA1u4iIjwfGQkBbFKfMOtZf6k46Ed4k=
X-Gm-Gg: ASbGnctqoG61VCwYdArcnxIYpFb6lFPTssvTTTj4EGI1Dara/I0huktRZDyixoTwu6f
	k3sBRYU00Abwpa+4my1kEJnT9rx3zZU4614Ay0qRzS2hXj/QwLABSlwCNn2CJk78uliJEWNDdjo
	QD344phxl7nUrh9HIJ/f6rMG4wcg8NeeoFTXBNmbRCMyCMQdEW9CGwt+Tij9Wf2YtDe45nPrEG9
	3v+uigTK2NmD05I0sLZieVD7p2yU7tC5WWu4D0igYOw1GMaPafWq1EYDRIKx5Udpvtjl/uA9/ZN
	EwP8MFeC7tGc0xhuHMFrhIFKRAkQI/POlubymrrQVjsrXwxG9moJF6XdoZK91zaOuw==
X-Google-Smtp-Source: AGHT+IHQX+Ej9HN4lelzlLvXYSgEkOOUk0QijevexRqGIQJCq4lgjLqOhwOf+he5IAKWkE6Gfii7JA==
X-Received: by 2002:a05:6000:40cb:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a56074913bmr2816635f8f.9.1749734124811;
        Thu, 12 Jun 2025 06:15:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:12 +0200
Subject: [PATCH 03/16] pinctrl: da9062: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-3-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2018;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gwxSylPIbPGKwi/smPHfzBU9AQqt6xWeX1IRJSlXXtw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLklRnjxne2O9+BScgNIbdaQOQ8KBJv22AEy
 OvQ1Poa4/yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5AAKCRARpy6gFHHX
 ciqcEADP8OlzO6NOQIzIT/qqVAp3TDw0XWzO3xI33euUn/a7LW3bOC5krWIHRmgqL2O3X9ROPwy
 8pz4JQq0eNG//IFcZicNDy4OI/1UXmVX7q6CTYBRrYTSHn9MSK7xj7ewNxtxNs7ICz64+F6S4z6
 /Se7jc0CQ3+r1opnL11YOXKKagRki+iK+jyb9M1JOxbj0Tgo4adZrx19lS3VMhZOI+iDMiNO5DH
 p/BDCDHQz7LVzxYAaSRH4gKrjFW2Lu4YdlRvFpVQUh0MPPte0b3fJZWWM/2W2rWSJZXC7VQihcM
 sYjsZf8F9PccsfTurbyxNG4+uf2Jkp5qZLGr8jxajXwhCzCb+dIbiEkG8b+tQRkAsEddqLTWMXu
 pHbF0u9YUFROoTwzyjewSEVDLm0ef5KMRrMR919B5eD0+Gvv51hg2ISZQl/Ul/ifkNOkubjn1cj
 eOrF8/vsmxM/hUgNHcaXZLKXrg29O5KiZTlsW/oC9FKdRjVXCgRZCZCt1eDKD70aS1vurl57yZ8
 qqz3aHv0xXNXD4dOXrILpcZnJM9wsqnWEHpOVEhlEJlMuCs+JjOQsuOJ5agwuTE5BzgxJGpDjVy
 f7SN3HIJfkiYibBq4+uvAchWPc9l3G4GtUTbeTyVX7EvbSLzHv069LGspheGTOvXTiJ7OvFJuj9
 eNUbMRFae+k53Ug==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-da9062.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-da9062.c b/drivers/pinctrl/pinctrl-da9062.c
index 6f44a13b90ce56dbb00fdbedc28b0377a42d3b0c..3295b09dfc3daf8feb6de0082d95952e1cf25d26 100644
--- a/drivers/pinctrl/pinctrl-da9062.c
+++ b/drivers/pinctrl/pinctrl-da9062.c
@@ -102,14 +102,14 @@ static int da9062_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(val & BIT(offset));
 }
 
-static void da9062_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			    int value)
+static int da9062_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			   int value)
 {
 	struct da9062_pctl *pctl = gpiochip_get_data(gc);
 	struct regmap *regmap = pctl->da9062->regmap;
 
-	regmap_update_bits(regmap, DA9062AA_GPIO_MODE0_4, BIT(offset),
-			   value << offset);
+	return regmap_update_bits(regmap, DA9062AA_GPIO_MODE0_4, BIT(offset),
+				  value << offset);
 }
 
 static int da9062_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
@@ -172,9 +172,7 @@ static int da9062_gpio_direction_output(struct gpio_chip *gc,
 	if (ret)
 		return ret;
 
-	da9062_gpio_set(gc, offset, value);
-
-	return 0;
+	return da9062_gpio_set(gc, offset, value);
 }
 
 static int da9062_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
@@ -235,7 +233,7 @@ static int da9062_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 static const struct gpio_chip reference_gc = {
 	.owner = THIS_MODULE,
 	.get = da9062_gpio_get,
-	.set = da9062_gpio_set,
+	.set_rv = da9062_gpio_set,
 	.get_direction = da9062_gpio_get_direction,
 	.direction_input = da9062_gpio_direction_input,
 	.direction_output = da9062_gpio_direction_output,

-- 
2.48.1

