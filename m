Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EB1238E01
	for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 11:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916933; cv=none; b=PCmlbqBeNVctmveCTBMfdBfGulQnl3wxD+vvA06IDp+K5GqR0XhLoR+NX3CYxOw+oDBFxpab2/vgtdhGLCF4ACAVdDhde0R/JDphwvvP0Y/NKObCVcifWFuVUrTY41nsTZ5L/qmbu5hoCyZRwCoz7KdODt+Bu1+3qyJN6qAxlAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916933; c=relaxed/simple;
	bh=YyxaXuufcIt0GgfSjrhWJiVObWb/Mkn9OBVuggRuJN0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=uwHFA9zvUnhyVHCKcirg1nDngduTcS+PqKFqAXAqfHMzPODbkrczVPzpL+pllGI+srfqYBwKB/p9W5A7whW3TqTUCKO21MUaRn0vz54E+LVV38RTgff6Q1sPYauQAyyUd8au3aI6MUIII2jyvutDJaJT/odyqJHxqeJZaj72pyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlgntLrz; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlgntLrz"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-216401de828so27683475ad.3
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 03:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916931; x=1734521731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jfzckOZQbltxC6H30tDEw75Y4uZ6lGIUQBcpNCwyAy4=;
        b=YlgntLrzArTsuGIvltlySMAa2ND+JGXBe45tYmjwqaiBo6xBHP2s1u2ZsS/isQokpF
         nnZn+7Qcj4RNicAzmARMvMd3ovDhzLDX3Z7MEnO3KtBFZn4gHq4yU0yRCt96dpMkLOfT
         yr0t38z1ASj8OJGaUfSaf5vTIDzDhVKT5vUAyI+pjUnjkujACauFOm8JliSIqHLL+WIF
         RVB38pB6ozZBzOhqlna67baopA9JaawsCdA05MHky592NuhbaWzpY15sLd7s9JATrWok
         cmkHGfiOFk1V7KkJAAuv8jxXqn8H0YCM+UlKhnABBP3+PwNfgheCwUvFxw7OOHbxV433
         SCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916931; x=1734521731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jfzckOZQbltxC6H30tDEw75Y4uZ6lGIUQBcpNCwyAy4=;
        b=rIsIsAx2lyGVggcPthKQ6mb9AtdzpJDbg5OSx29Ge7j77aDq+WzhQR3F4x9WFiYMgb
         LsF3qXQyufqBhq6kVhmA7s5GKVpHgZTdhMtij8iXeWV5WvJm282Qols05bvkCjXNKcew
         1GgAPnKA9lrM4AO3/0D5RaqfpQO+Rl4Yg9OpVy2xvuaMN3bQOuxWFj3WL2WyOK0k6vtB
         FK0z+YDP4TwG5RxV3OYXVCqow/z/L70Jn+uOZkHKIjC4AqYSfYCD65xZA0ExLSuK5jM+
         NIWBaV5/EmXhyVdNtUU31Djbtfn6N6xHJ0z9MVt3Fr2BvGuLlwdk5U75Q+UJ7zqvoNQj
         DyxA==
X-Forwarded-Encrypted: i=1; AJvYcCX3Lfn464DSXACyVqdpKU/AogXbxV1cE7zFbYHdanLQ/N8m/yZNaL/t+BIds8iTTkhdzhq3Gw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4ebQrbb3fptm8oV7n6gmgxIEv8IqlXOUk80Kidgd22hung1zN
	2467ZlLDW7DZpRo+o9sY4nCyHcAprb4z8rkdrbvER+KEUWWadWwI
X-Gm-Gg: ASbGnctIqpR3k/wcwimMfB+d3EwXLIaO30EEo6c4mLh+BsF8N9m8PZk2u9uDTkL/AoX
	np+E6Oa1PtWYrlOB5ynO/x/AZssTtxXpqlJ5JAFzEtnB1lVyV7FUQTiiT6sAuSgiKnL65GmShKq
	c9qgJnaTX7SsObW8shzkiAISltTPh3+vXCS/IYjTcYod5McH/PznjP8mukEhwTRNTYATif88SE2
	CXIxqrg9H7TI1Ps58dtP0RLhrIwoQb2YPp+r2gcF0n+NI80ekbJvS2w0jYxFcrVUNcj5g==
X-Google-Smtp-Source: AGHT+IFh+SOIc2pSK+oc73lJ9XAuJ74bWyxa1vkuaFSPTypJbOqSoOBkbcihWmoq5jPUmTdegrgTaA==
X-Received: by 2002:a17:902:dacc:b0:215:b75f:a18d with SMTP id d9443c01a7336-2177839599cmr40156315ad.11.1733916931480;
        Wed, 11 Dec 2024 03:35:31 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-216404df131sm56765635ad.203.2024.12.11.03.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:35:30 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/3] Apple DWI backlight driver
Date: Wed, 11 Dec 2024 19:34:36 +0800
Message-ID: <20241211113512.19009-1-towinchenmi@gmail.com>
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


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.47.1

