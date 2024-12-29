Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B3E7083A
	for <asahi@lists.linux.dev>; Sun, 29 Dec 2024 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735470847; cv=none; b=EHltvDnH3cvC9dDfS7bg9x6s3uz+iJT9YTUvFuP3bJg/vHQ+RFNxGkueZmdD0TVF0TFb8DxoFZP2ZiYk3bSkW5a5Lozaj20UYcvwJUUkohhDP06hVnU3Shx4i13SjK9noYDMHY2Amarcwh9pIkJrjxUVefauOnpwuNKQlIfpmyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735470847; c=relaxed/simple;
	bh=WimL86Ee7sTDRb3waoeawAMTramntwTiB7N8weugKA4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=aOwnfj7RWftGqUyI2VZoIaAHVRNSAh5tz644lHl4bNWZzWiqCvF9TayClRGfTilP46N7eXYGy6jiRrmIcsXh0DfEoB5UYm1xFujo6bY3DZpcEFoN0/YMAcSjseNZEU31iU0vxoHL3u6F0AQLgvkFcgyN+JJCx1LS9dv7wQUYHY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jg5qA1mr; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jg5qA1mr"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2165cb60719so107361965ad.0
        for <asahi@lists.linux.dev>; Sun, 29 Dec 2024 03:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735470845; x=1736075645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQ2IkiBTPwiZJOx3g0L64WXeGUqnnVHn4KyvGu674w8=;
        b=jg5qA1mr8walCoPTymui8cpt+tE7sAbuLDZ5KV+P+O5vizb9/LKlXq6UQrIlwPHIYr
         n9RMTSBPrKlFJk90rz+ZhqPXAwO22NUHJitLyLt57Mk45Fd7WyaBoQKzGjvpJsEAQi9w
         Nnksvyf49CNG0be8wFUIopTSmhdDLWZdmTDDm3yiMy0go0VfbDw/n/h/ZP1zspUKQcyW
         YDVfH0jb3xsju7snL9IRWkZ+dVb3vC7oST/5gaI1kFYEC28mj4IlGucJUCm7JGbi4TGL
         26YNMsvZ8mlJtuxbbDps7oOMWh2VH3O0Kqa5CRoCyP5//bXXqbmYLvhBMj4n8bdVUSZK
         wQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735470845; x=1736075645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TQ2IkiBTPwiZJOx3g0L64WXeGUqnnVHn4KyvGu674w8=;
        b=ON1lMogUP1v8/lgfogeOTD1Krj0LzcfEYqyWc3N5yf5KwoR0qFwxiS/KjZCVMMVZ9p
         4NJkaM9fDH4dt+qP7jYcywNDWwAhE/ZsqdSLfIj6+mSrQ9yNHxHYrjltJg5e7kAsqMqH
         JjZ/InO92xys1OEnaxWGtAlXqSoJWuFKyQ7TC4jkBe4J3R6bIRr34hDQ700B9yFb2rY4
         /cO0QpDkN8yJp7G1ERzLW3P3ktakJyP9Hq04ELv8DNl2AjXzwJhWcOycX8C9keQSe0EL
         MbNtCYhuPEf9XsPBSMWBpVDax7vzBevd4HcyQbRSsnfWunMC519KAV2YZTfYFJ2OZbdT
         WC5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlpKirct/3MdvOX4cf4thwKmULkvR/5m+rmRlUsXzOU8cgVdqrfkf6n4OH6ygLjYqhyiJbMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJeM3iHfDDW+iXugunO1taxFtjYrgeNlmZQw+86/bcxX0+uCrM
	U5TtE6atpRuhv1mXdbOFwGhnc424yrADUlC8uC5zKBNMrlO6HXjN
X-Gm-Gg: ASbGnct43Bfue/n6CUrYS265OuzWksdp9pxDZbZv5Q1Z6/K7sjGx+8JZ9F406RrtQE2
	R0WqFZMbWFkcokKYrI0rYgeFVyhNu4V2gt+aurcXjyiykVYBthABG5GxZIZVuJ1YACvrhNHFqvs
	bn6lTdDEt2yoZ1MjRuagLL2us+NR+TH70N0zdiJ3RHZ05+EXceUhZWjxegZb4kbkat+H0VnwNsw
	C272pkosLAFX0Dwi5so/sAR53LeRoqRhQtfXazdeWhX3NKhy5HjskRzwQ==
X-Google-Smtp-Source: AGHT+IFC1QZJfqXlyjwwxcIAnkfum3t6MQ+L3yuYAABJDnspWgtVfFsqagRUXkgAgDc1Jy7GWtwr8g==
X-Received: by 2002:a17:902:d48f:b0:212:4aec:f646 with SMTP id d9443c01a7336-219e6ec1340mr390222995ad.33.1735470845437;
        Sun, 29 Dec 2024 03:14:05 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca02544sm161655895ad.255.2024.12.29.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 03:14:05 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v4 RESEND 0/3] Apple DWI backlight driver
Date: Sun, 29 Dec 2024 19:11:16 +0800
Message-ID: <20241229111322.4139-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches the backlight controller is connected via this interface.
This series adds a backlight driver for backlight controllers connected
this way.

Changes since v3:
- $ref to common.yaml in bindings
- (and then additionalProperties is changed to unevaluatedProperties)
- Use hex everywhere in bindings example
- Use sizeof(*dwi_bl) instead of the type of the struct when doing
devm_kzalloc()
- Use devm_platform_get_and_ioremap_resource() in driver
- Fix sorting in drivers/video/backlight/Makefile
- In drivers/video/backlight/Kconfig, move config to right after
BACKLIGHT_APPLE
- Explain this driver being completely different from apple_bl

v3: https://lore.kernel.org/asahi/20241209075908.140014-1-towinchenmi@gmail.com/T

Changes since v2:
- Add missing includes in driver
- Fix file path in MAINTAINERS

v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmail.com/T

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T

Nick Chan
---

Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  57 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 122 ++++++++++++++++++
 5 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
-- 
2.47.1

