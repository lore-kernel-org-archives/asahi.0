Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE6325B692
	for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 13:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734147; cv=none; b=CMnj5m3BoEOQeq7brpU4g12cCPKiE3l2MnaEbEnk7QjWHCH4AjRPbzdiX9Tz1pBv6eyWnEOwJFDQM+01wL/Rka39RViTjJIvEP7SVuiLn7Crem141AkFLZYO64Ebo+G8jJ7smGNQ5Oee396dwYIynYteFDhB3MGNVTT20FqGa60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734147; c=relaxed/simple;
	bh=IWzffuaXPTlvob8B44ZyI57c1fGd+CDDEQUCn3zwQG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZqHnxj2Dgg4chZEDi7ju3nCHMclDgs7A2O0XXVrjx9MIOJmlh0GHrsj+rK5sNdEkaEoWCEANffdYIw19D39mQXoyD9Jkp2N9Al5DgukltUjd1tS7o3yX0tHnAzVZ19+MSlcc1qJo911kh+zlq4cYuEEi3V936hXqvPKQPOqUYYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NQrR5jrz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NQrR5jrz"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so11656295e9.1
        for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 06:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734143; x=1750338943; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeMSlNL5v7plT+CdY2CAH8xRYdEmWgOgE7l1ThlWmy8=;
        b=NQrR5jrzr//KsGhOKxd+RTBgr41Ia6s5u1d0vIBP5IAx2txmYRPNBRbN6P+pgzvZQn
         yKwbjPATj/j8TM/fheVoASikcw8R7JWtBkZiivKa+iSxJmLun722eF15xi73EAUy8GTY
         56DR8lsiy7qU+uDSxmj7PhP/jzfeCKUcGpdOcrc4TYaBtyLzcmuJNnzKtDjCgW3eFHvF
         LvrORTEgWYil3djYswUu5M8Byr56eNUWTB0Ib9Oa65yhGWHKJWveBuBXaGzdQBZ7jHrN
         PPX1nC7XFMlGaUnZbADrW0uo37WJDLRoi1xCwodoI8aYP1BGUrPNW9045/mn5mRGP0Re
         Ondg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734143; x=1750338943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OeMSlNL5v7plT+CdY2CAH8xRYdEmWgOgE7l1ThlWmy8=;
        b=I1ekYVA0CaYaoL+ER3n4pyenTpmI0Frl0eWdRE30SmwApFdJYH1ll2DyR0p7iPoHnq
         uf2h18IcBvsUuSJzb4uVbeP5KWKvB3KUwfDWgQQ0fk+DJXo5ioldJkRZxiuJHZQm973E
         HdcJUKLcqobR49zIICtK55FiW8s4kBLMEZr7JjY+FIVHtDASsIKYmAbvd2Q1cRg5lOpw
         UuXtYA3T/88nBdMCn/1N7zxTejSKDeOnzHxhvA2qG9gcmFTVwIfwFvhRsYnEISCrxyvV
         ObkbjeX4rx6JRuYAKPNjAvsK+E8sEBAlhRKEnOubng/w+iPuXCKAFyxM4n9pSk04Kk8D
         XiCA==
X-Forwarded-Encrypted: i=1; AJvYcCVjAsTRQ+WoSNYwZkFGwGJjpk1+QXPcc7riKu6xaqtg6HeAiFPIEa7aqvtn/pFlF3Af5aFwOw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3i9gsyBBwEo4TJdSuEM8XLmYIWXSq6oTvDmMxREhZhthNEYMv
	t+JcgUIBY76LR50hm9NYpnd/H6Wf5uNyZrFfpbu2ovv3dy5AsCyzfk5UiPsXBQFZYfQ=
X-Gm-Gg: ASbGncsBwMWEbhV46IKBJQcIWYjHhfBPtAjAC2RY89UaNTKUTDeWZIY/G1sk2eutvR5
	D/ocr3HW3EE0npmUOwQx/1WQIhFqGdV9IisaoWPXFfBpe21XL1YJuAAhLCfTobiiuIKXcPiZHpO
	1npGEfBvX/BD9Z5Hm3HiSMMKlJ72xZoqYcnbF0JY7e7XD/tPUCNsUsq+bPrnHdx67oXq02nAZWt
	b3l9bwqdbqB2nF9p5NBP19nixawtt2eX0WMRKYCt8R+2FNZcaI71iQQew0KWcrh4kdgc8C2dyUA
	1mEtmwEm+GDHG1EcjCUV3+Mljtyi2iWWJjC33jhrSX4jmg76oPyQZPs=
X-Google-Smtp-Source: AGHT+IFfk2JNW5+JEjAS4QGCHFxkYolSwpuwPG6mz1wRQQcTjF+58a/OlpyQ8Y8a8U04LXW/Ou6tzQ==
X-Received: by 2002:a05:600c:c04e:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-453249a1500mr45370855e9.15.1749734142562;
        Thu, 12 Jun 2025 06:15:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:24 +0200
Subject: [PATCH 15/16] pinctrl: as3722: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-15-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2237;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fTmHKsEYrKTNyxoNVzmb5kuSXiJl4noseL2AUv0JQqs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLnJzYKUbqVxOzi9/0Npp9vPvP9vlYV0ANF5
 rwLBnERYbWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5wAKCRARpy6gFHHX
 coSBEADHmODbD8gx++i43lj29SdaYhpz3ZGxHPtzCbpJM8Weriq+nhM6eLcP4+WvjNqshPbwg/Z
 n20SACuNZZz+S0+l9KGgSHzYrmCVuUEiF3DNl2mICCeEspJAxClBAGUA2y0Q2TpEV2SLxz2I4dv
 EtAY+a2ESleqNVnppDCes+DFZ5n5aP6K5VD8Hg7J2DLFYtNp6qHprkyCqcTsOnSb/nuo86E8kZF
 zDRkzeByIrj4z71f8Y4fLKzDGxq8krDXvhm9SD73b2UCvw6QXQosqznLheEz4+Z9CPrd1jKbE7r
 cDjRGZ920JYxOSVQHMaipi7GJZsBW/MOU8qI7Ox3HnQbMfHtmliB1rwYB4AhffpcWWuFNw/64se
 CQfZuf3MI8WBKHUHreGVFrkLIfa/dDyNdag0niMoHvtUfXOc5gdwfyduPuuRAwPEoy/gflanzKJ
 W/ZDOKFh3IPWI9cbeaKRzvYbJ4CV2OjtB5/gz+V9t7+aIOwlEnHvNhmcYT47t9LDEBkuOasfyVx
 HOartloAzNYSN3ytVG9SxzobpHzoH5MHqHi1q6l1kLVt8GWdw//Pyxa4Mi/53e/YSBADF7E5j/d
 icL7N29K4WriyHwptsCLWDZn/Wh/0d2q55xgK3Mjnea9jsemXZ7KgCgdZb4MJD9JsUi+EPUMeDp
 qq668JcQgjxm84g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-as3722.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 0d8c75ce20eda97627aef773342a0b63ff6114a1..0c7777a7669fe60d7ffd15263261a9f4d5d7b659 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -471,8 +471,8 @@ static int as3722_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return (invert_enable) ? !val : val;
 }
 
-static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
-		int value)
+static int as3722_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct as3722_pctrl_info *as_pci = gpiochip_get_data(chip);
 	struct as3722 *as3722 = as_pci->as3722;
@@ -484,7 +484,7 @@ static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
 	if (ret < 0) {
 		dev_err(as_pci->dev,
 			"GPIO_CONTROL%d_REG read failed: %d\n", offset, ret);
-		return;
+		return ret;
 	}
 	en_invert = !!(val & AS3722_GPIO_INV);
 
@@ -498,12 +498,19 @@ static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
 	if (ret < 0)
 		dev_err(as_pci->dev,
 			"GPIO_SIGNAL_OUT_REG update failed: %d\n", ret);
+
+	return ret;
 }
 
 static int as3722_gpio_direction_output(struct gpio_chip *chip,
-		unsigned offset, int value)
+					unsigned int offset, int value)
 {
-	as3722_gpio_set(chip, offset, value);
+	int ret;
+
+	ret = as3722_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return pinctrl_gpio_direction_output(chip, offset);
 }
 
@@ -520,7 +527,7 @@ static const struct gpio_chip as3722_gpio_chip = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.get			= as3722_gpio_get,
-	.set			= as3722_gpio_set,
+	.set_rv			= as3722_gpio_set,
 	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= as3722_gpio_direction_output,
 	.to_irq			= as3722_gpio_to_irq,

-- 
2.48.1

