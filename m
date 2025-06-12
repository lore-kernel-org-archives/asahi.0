Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5554125A2CE
	for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 13:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734141; cv=none; b=Y/b5emJuLVDt+fT5F25ox+H+VA7U+03IHmr/s5Bd7zHE98MIyWNaDyr0rim3mVpQBbdHcNV9TghXq2EEpUCnwPfRm/JTleS5qdx5R/hxc+69bLy0dTZqP24W2gJc3Z7dgLmcEykjsZYT6qsaL2xEj2DkWtHdJrvAszfcwNP+tRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734141; c=relaxed/simple;
	bh=smpoRJPqTgqboXPBnMexqjWTEKSSiuerFWJdx+xG4jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DHO95Y7AOuVTC6CmXfAKQ6GByU2zZzZX298uKef0fmfo9r0XJvD1O5IDBwXfQTV7Ztgsfxlmt1fg5yk7gBHBXu4lP82U3dx7voJa5dMIH7AAxU4rosFzq5ZCwT2Q2cy/pIQgv2ExWpOZI/u/OhtXiX3tSj4uLD4UBfbVTaiy3rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LAftFmWl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LAftFmWl"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441ab63a415so9887125e9.3
        for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 06:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734138; x=1750338938; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsO/RfPfPYEcGu7pzHlaE+05FqNn0lPn9H16RQ8VcEk=;
        b=LAftFmWlT0wadGBfKB/HcDUOmE1UPvl2TlHwZshWU1LSxbt1XBF2Nccsj5FBVgE6b0
         rjAc9k1f0j9L4TBVgvb7GPcuDChgHCOwk8ONLQgjwWRo6qd2z8tFZQxGYqMWq7Mn9YXN
         uHiyy2uF7YUEP1w81PiP3bKXBJDDCVZWOUQdd+lvUEIgnzo2Da3opivKsdgAgRJ5tqjo
         kHnteFYecd4hgCX9imR8hsWf7daZa3R2nRkTL0xQzVpnr+6j7tA+oLx0xgSWLhWFpRVW
         6QC+BtX3V+uLfHIR8ThsHvowyJ2HXxd2pbZdq8Eee1WkOiIGVwxVQbuxk3oQ1BOjI5kR
         EGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734138; x=1750338938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsO/RfPfPYEcGu7pzHlaE+05FqNn0lPn9H16RQ8VcEk=;
        b=ayISMXC+17Gvv8UqS60D6iDeIXZ0dSlJg33qriKguW1Frh0MkBpV6TXkuzHmjdJawh
         4rkkFOHxN3r/3cpQx5RFdM+5ebg1C2uW7HjrvZgINOAQQWUfyvVd/KM2OI2I+4sZf7Dz
         Ber4iSTW36+5sHOWaePi1Fmls/JlpnbUkkGzo8hX9wuwS1QZZVFMvnpF7fnJMDDsYZtH
         QR3D8wytVPixEhxUtec44MJIaPjudkwXcO7V/Lz1WFLZLWd80MkreuE1MK7Cm/Zf7Mk9
         4e0ROPhObY7lZuGnwL8HJzpKc9XIfmcIm2vVxFuH9ci2jEqW9j0QDqX0Gi1cBJ56aatE
         lvjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU99Sg/I5VEnGsDNpa5ZMBQ/itJQ7Xvo3GflPrh76kc8ON07iAGREiCpLSamcih9szCXOT7tw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwupCnL6tkVMtli1CFOxgAimBODg9+3jWVh6d+UIsPsI431Io1u
	fVyxL1K80jBgTmVOmfsXvdeH0jdSZzD/3SrKlYkrkUW0FWtkyIHbF8FiO6vV0aFy51U=
X-Gm-Gg: ASbGncvAOTHUFNSp89PhUHFk15qYzMWTiOYFPz0UfhGQZso1wDOLdHlZ8Hgcm+hH/38
	UJCXqBhauJPt3mlfMx7RO1jhfeHNdeiulrwzsNgdQStNElyrCItDTKV8yPCiOEnrLyPeGPbP5vL
	JASAhBf1FCL5KZ7qXhjMmNeSjFav7qOYC+w0NeaOzbSsKjewN3UExetxyy0xXdvBmgVouZEPpPg
	ZQul41EJAtAJuOASZfXG5mi9J+Hl/o450K+tnjqtzPtSQj4j7Rgu8A2QEljG+ITkptmha6wnoFR
	eHB5yRwqjihYnNXC8yWS6B0H8HK12AU7my7r5bA3xv519bHFIxe0+7g=
X-Google-Smtp-Source: AGHT+IF/kkUZmqJMzJYib645Bdu8k5BoQYvJm3jm3K7Cxkyey72KYBawXxzfCbRcLK0/hrXvvJy0SA==
X-Received: by 2002:a05:600c:3b94:b0:442:f4d4:546 with SMTP id 5b1f17b1804b1-4532486c513mr66058075e9.1.1749734137693;
        Thu, 12 Jun 2025 06:15:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:20 +0200
Subject: [PATCH 11/16] pinctrl: pic32: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-11-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=36c+wupdpQstMiyirn6O+A3D3CWfgG4Pu3KgyyFz9nA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLmawJ7WD6umM/5yinajp8MTMUCxK3T/5pvO
 NJPhif2mbeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5gAKCRARpy6gFHHX
 ctMdEACUmqcuKhVLteNNFsKXjhb0zQLkw4a2Fw9Tyn53Jq2evetPN4alNRZOafrKnN4EQaA2bjC
 rCflz4VMDSQ8DB+ExJ1dZMPiE47azhpnGrP2Ntday7+7iuRXGMWpM8ADbtGgUe/87ZPFa0KidXZ
 DVBXl4M3NXYsc5IWpsJnmoLdg5UyE+mW9JoofY+Mz04Oxd6n9fQ5bZeifkdllln4Q3y5qnNSjb0
 cdW1s1afOJlDtHkPTAbuP2RB+eGem60QlsIWtBpMPpWxv4eitSa3ucXGPDal0PCK9fSTCstU62g
 lrFrlnFbOaL7ZWcHtDDFy2m24jc1lIqxy0Azvs7DQWHF0D7SQDExoX8kLuVPW/sqEt2t8AoFs3v
 jXf+K1tgpr5K9xn8S10zcd7MNFEPWRxFLTb1T+GPZpPJ9kW51o0pp6qBvuDUrgf6N9wwDjtloqU
 knRNbrM431Biml5vy6a26Ze8NeXj9D9txpKR9izG2oM0yUdAS90qQqn8d8Gl4J5gwP28GB5WU7E
 7FYMcPwKodRzc69PaB4Ab4ULl+m160z7TQtvhZhM/bIK067QAAX5rXY8ZTyU/ZMnRRLh9VaBrr/
 V2zPICzcxe2Duc+ES9nlLO+6hTvzZ4Wrzz2cnxnr+exUfjvlrPHT1knIw87EtPiAZVpvG3qC7BA
 oo6HMlDJeALdzbQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-pic32.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index bf827ab081a1d672c440a8b4eccab539fdc215e7..6d64cab97e8116625c2efce29a3e5db8248bcba4 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -1828,8 +1828,8 @@ static int pic32_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(readl(bank->reg_base + PORT_REG) & BIT(offset));
 }
 
-static void pic32_gpio_set(struct gpio_chip *chip, unsigned offset,
-			       int value)
+static int pic32_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct pic32_gpio_bank *bank = gpiochip_get_data(chip);
 	u32 mask = BIT(offset);
@@ -1838,6 +1838,8 @@ static void pic32_gpio_set(struct gpio_chip *chip, unsigned offset,
 		writel(mask, bank->reg_base + PIC32_SET(PORT_REG));
 	else
 		writel(mask, bank->reg_base + PIC32_CLR(PORT_REG));
+
+	return 0;
 }
 
 static int pic32_gpio_direction_output(struct gpio_chip *chip,
@@ -2118,7 +2120,7 @@ static void pic32_gpio_irq_handler(struct irq_desc *desc)
 			.direction_input = pic32_gpio_direction_input,	\
 			.direction_output = pic32_gpio_direction_output, \
 			.get = pic32_gpio_get,				\
-			.set = pic32_gpio_set,				\
+			.set_rv = pic32_gpio_set,			\
 			.ngpio = _npins,				\
 			.base = GPIO_BANK_START(_bank),			\
 			.owner = THIS_MODULE,				\

-- 
2.48.1

