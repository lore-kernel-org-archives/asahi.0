Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87DB24A056
	for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734131; cv=none; b=BpEVLMAL9Hb8g1AD6k1bJElFEyQ0K7PQufSZrECSJDjS1T/JTccb6EJBu7eqCfzyvPW0M9SgpAA9Nz5mmTHrTwhRJemzotB4i+1s/+curlvagEEW1tVxdPGqQxG6NdeI/opkSAohkdphAT4VibG8d9OGrDWn9osYhACYdkkJpcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734131; c=relaxed/simple;
	bh=kcI0bfI5H/Hmf5yZdyf0QMbThFtI4nWGLfbZ3WK0FlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oRNn/UOUXUmTgt23LDs29VTcrZlHG1B7qFazDoc9wMjyzA4LfmvvFxMe8+T3UsL5S5jRHKE/ArmW0xpkqllPKAqbJGVj3zCoG+Fh9cAKj6a4MG3k5VIDAT48yWP+Wx9VqlhZoORuP6SCwHSyegkhyVRvB6S2u5chv7CTDXXRBZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RXbw2e3w; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RXbw2e3w"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-441ab63a415so9884785e9.3
        for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734127; x=1750338927; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPh64evwrzs2XEZo26akT0hL+LXbpDIaNfa8zeCvhbI=;
        b=RXbw2e3wbhGZG/1esiG9QpMS90A0Pyh6pofSrE+J444wMt78zf/0ZA6uQFrv/a3/04
         /eTRhvdtZsowluhlxJRnwELDDPl7GLiieYUPFGlyBdPgA+HMVK3pyH4i8iqKthmyeGN/
         FFThbqBeIH2UMI8DSwoeA8OQIzaD0lc9dNn/1O8o2cv0WnkXqO3SxM1wEGsaznwjxV6U
         zsEMr9bkyKoBOMANkwFSA1KPatDgidi7TK9aviRrgNk9/xX6KP1Lv0nSwBct5lSIuseI
         BGGAemv5CFdmygH+kf6tCyx5pcYHrbAIvHF7USWslWHr2Dw2TYKb8O4e2owxzSUZUQBG
         pgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734127; x=1750338927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPh64evwrzs2XEZo26akT0hL+LXbpDIaNfa8zeCvhbI=;
        b=C/gykp9htYJAaYUs4ewKc4P7ebEEl8dlrkAlmcwKayNig79GDC/3eGzIEdgqAv2g8l
         0LJPQk4E3illzrpyqmSegFdG8GaksGdZe/qauFLQyo2Z7L649kKGykHbnQAN93K+IRER
         55xHEEhYpgCBWrYnVog+JPHz04rfHCiy1unkd9Gqxqc6PjlUcL9RzWZWtkfloLgrrN50
         sABNY5B2TH9tGe7Tyh3JzulMaEhb5OZAz3inE2Rdk7b5VfescYpuRQ5ds1IHq4WkEpqo
         clYMfcKh1cfsndb90GyIDf1+aB4ToEhxaddXAMsdn/dRe+lFEnZtPkON26TMpbQZOoHT
         02hA==
X-Forwarded-Encrypted: i=1; AJvYcCXihv2VuzbQumSSRs+DGLLRGrvcoNwNGmRoTQPDKEc5sshX1ZZUZqwXivpgL5dB27jUEO6qjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmKJReBBAUoIOtkRyV8uP0Odxx6yYVd6zpQVB5CpByHnPwDJdD
	a/7J/EO/M/Ud4djlUWYPZhLKvAfJKcwXoxmE9aECmGIEmU93LTTSpLVfirzMsJh4AAQ=
X-Gm-Gg: ASbGncv8fNR+rp0pj0bDJqqkKI/lUSFZ1a+UHPqFhW9YOEcnPQ0a0/9OsnDHQWNSAQK
	ZDoQgiPVZzFMRrvnoAzlVkKrOvCpccmFdGMkl7bCrdhl3kh0Hp/Kdjo+uLYIQWijj9uVlSrLi7y
	5m8smedPsD6hYniqeG5w/CAYTDOpG/A4CoNc9QkMSDw3O4/PiRIf/NYPk6x2Hn+45FNmWcGzqgh
	bq1+252NIpRmjtqRh7AZK2H/8Qqb4ZAy2/wp9qcRBRSnCZMxxF/PCCtB53AxRJtGnSxCh9vqHYV
	R3903qOtAb+Vgbb1xJuiIfCe6QMYpB+Dag4wCDcV2n7FFmO+w7MgSI/9mEdZvLsfGQ==
X-Google-Smtp-Source: AGHT+IF8dQFZu3267rnqS9T+MlnDpsGMNr4UhOIVEWZlRhW8ilrSLXmT3/L/LQod0dJlLDDEHru6ig==
X-Received: by 2002:a05:6000:2505:b0:3a4:f7e6:2b29 with SMTP id ffacd0b85a97d-3a5586dcc29mr6204277f8f.5.1749734127149;
        Thu, 12 Jun 2025 06:15:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:14 +0200
Subject: [PATCH 05/16] pinctrl: wmt: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-5-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zZBlMtHKzzXioPhlG1XBi+lA5WvGdR2KtCyPxbjRVIk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLll7sZrjDKxB+yIfzZvsGDAzsgGsNSphici
 P1S3FHTYBuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5QAKCRARpy6gFHHX
 clh4D/0eejaFFeaR28Vf6ymty4cRxtkyHHnZyl0oNIAQK4k2LKxfyvv1Uvm5rcDeJyn5YwvFLUM
 63wQ/V8f3n0FvrZ0akyzb4OoY/gTGr9TqBrRvfmdw3r88RstUyCq+LAePz4qg737URegvsmvcqD
 d0sTmTdeWFE8SJUqM1Rthnrc32nwNGmdogrzN3Y3ZySLnrLIrGYKfwRv1uaBnPxjdZ92ZZp7S3u
 EkfpWxLbbosC+cqD7juqS5+lazxS8yOH2tC8dPPUxwYFwlA/yuIElg3a5eB1sSMrR4EGmkb2RuG
 omLdr7y0eoOfBmNyoHulUJeZERWMiUDyTpZuVWgKEfCYdzgb/Ti1935juLv1SrhpTfvkpL369DG
 saMpzPev+8uD4fKF3iWymk7Rpdk2zZ+93Ey4bGlSG2YDdgz5qd31nsBMFhvQPWVdVKNty0XtRyX
 mt0+a9PFIVXl1mjGeDhyldfzWKuR1cd3kDzod6bLGisrs3zMUq+/Ru0yBalUAzuB40k9boYhvhv
 jfa8sc/Rp5eAZ3YSb7LDTNEf9m5zWmWu2wMBGWlQIS0JyYZqtY+6j37fbI16nOHQgPZcd9zGGG/
 cvIur8XbL1wPUk8bK7ZObQF8wT/Nu0GAH+UK2fj/hAJAIHmRY6Vy2gaw9fAM0vxRT/AEE2HSZfC
 45zRTemNQslYrtA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/vt8500/pinctrl-wmt.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index fce92111a32e4976bd31c7e9845e4fd08a7affa3..767c6808a463ede61aee61b63f28ee38185b7633 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -507,8 +507,8 @@ static int wmt_gpio_get_value(struct gpio_chip *chip, unsigned offset)
 	return !!(readl_relaxed(data->base + reg_data_in) & BIT(bit));
 }
 
-static void wmt_gpio_set_value(struct gpio_chip *chip, unsigned offset,
-			       int val)
+static int wmt_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
+			      int val)
 {
 	struct wmt_pinctrl_data *data = gpiochip_get_data(chip);
 	u32 bank = WMT_BANK_FROM_PIN(offset);
@@ -517,19 +517,26 @@ static void wmt_gpio_set_value(struct gpio_chip *chip, unsigned offset,
 
 	if (reg_data_out == NO_REG) {
 		dev_err(data->dev, "no data out register defined\n");
-		return;
+		return -EINVAL;
 	}
 
 	if (val)
 		wmt_setbits(data, reg_data_out, BIT(bit));
 	else
 		wmt_clearbits(data, reg_data_out, BIT(bit));
+
+	return 0;
 }
 
 static int wmt_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				     int value)
 {
-	wmt_gpio_set_value(chip, offset, value);
+	int ret;
+
+	ret = wmt_gpio_set_value(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return pinctrl_gpio_direction_output(chip, offset);
 }
 
@@ -542,7 +549,7 @@ static const struct gpio_chip wmt_gpio_chip = {
 	.direction_input = pinctrl_gpio_direction_input,
 	.direction_output = wmt_gpio_direction_output,
 	.get = wmt_gpio_get_value,
-	.set = wmt_gpio_set_value,
+	.set_rv = wmt_gpio_set_value,
 	.can_sleep = false,
 };
 

-- 
2.48.1

