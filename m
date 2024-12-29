Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1842156968
	for <asahi@lists.linux.dev>; Sun, 29 Dec 2024 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735470851; cv=none; b=gQ6ZnKgbqqa86OHrGl/c88W8ukVO9tZIGtFdG47xb78NvG7cAV7loUDAhdBn1dLgQkb7CoWkSkPUYdSG+ADnEztEzYkHxDDsVLZOGU24Kt+jkRTe8wpCLNWjsZmFJQ9wAuT7f8m6DtDdo9DYV7OwEbsGajqN0Yx8s0ljcPEDkAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735470851; c=relaxed/simple;
	bh=O3rKEWl5r7FbliJwJ7bQIkLZxxlXeVzYgSqaveO1SG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ie9F5gVKnWkaIS/5TG07Kmr9v8pDtifOTs/hgivuryhjMcofJy6zFKe/SjYBtMWnJutCnlxklHaVanGlBeYNVufV6jaN58ZCPIxvPlLOIHljsOcjBHt2m3DjI/zZ03a8nD8jNTXwF6kLhxEl2xIZxNRvvBclUAcm0i3LSd7TecY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWL2KUlM; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWL2KUlM"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2163b0c09afso104182105ad.0
        for <asahi@lists.linux.dev>; Sun, 29 Dec 2024 03:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735470849; x=1736075649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0h+wOrNYOq1rWia66zWwU+kYGms7B8E2S8S2isesVU=;
        b=OWL2KUlMQESVWMZi5xQvMN5KPE/GAUxmkGTj2wBuT6p26cLvBB6TP6Zo3EU1IzzCBI
         zC09BZo8NR1JYjyprOOFek3uIUevFMwAZQKp23Xm6JPp5VvfUF529WnUYrEWd24Fn/Hu
         +eYStqDGOdWVukyAlYIkTAQBJVkWRhYvnrJS5gzxIz+i4trruHog+dgES1agSwARVgaG
         AVDnv6Et0aeXytFk2bJRKonfgYAT97Fe1ys6VkNoWF8CGTRo18+XZIBz8JizzDHhB2in
         ozrfQ/BzvALyF6gskG1UjPL6CZ7ndct2KMjhPTLo8jc+t7h0W0oo0RRnkPjgMYV3ypAX
         Xv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735470849; x=1736075649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0h+wOrNYOq1rWia66zWwU+kYGms7B8E2S8S2isesVU=;
        b=ekPgwYmlFPRHvr4y8D+cgyzuP42fuHfj3Q69bCUSrOCky2rypeklRVShI1zPYp/XQy
         vBra8wr3b3aAIkQ261a7mS+m0zUObZ0Qixxc4PlYyxIl8OWMCKxj1yEhHmsKgTYTPR/L
         hbGNfeeUgwfSctJyeHq4v5FCzNXjJALGkk3n8vzk6A8tleKkQgDjB459lAR38PEo2vhF
         3b4q1TLzo7/Hx8r+m4rudPOah/LvX4lcarfAqBsMPFHV4W/gTgNseAXPShu+Ol2Bjct3
         rUF8KWKH6PEPiHvVE9L741Y4yZMUS5dcmHVpxnaoQjxfQoqOzY560PdmBKx0dDbhiSPa
         UPag==
X-Forwarded-Encrypted: i=1; AJvYcCUwP8BOR1V0ZxtKGKpZseHgWo6KCHEorD7l219b2nh6RNvYRpTXDKkl8uLUNwag67LvDXKCNg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7TlZ0J3kZmUj3lzLoSaFTniIj+llpFw4H3rvRSgJk2IBjYyfx
	DbzWVrdW0khAQa/ujsbGd9rNK205c/OeaVTIXttusItu1ym/eYrT
X-Gm-Gg: ASbGncuscZFDn4jT4/prDC+CbzF4ppDSIF3PKXXMVOiiGgPYZ5Ec3KMiIOPucDSQhdA
	9716EylHbqn+paJEkVUJnDN/sglC2ocarcDAXSQUmSoZLbx69D7IVtMT50qRHiKBb9L5nla6KJl
	AxQtVlszhzt6ZfNjsc1uyljM9PVx9y+MxTX4pfRHui6ebd3EasD7pfceVcG2QVG/N/VJRLchbZ+
	IIrvrF3gZZO3kZnyacheCOwF5gR447aFEqboHRAJPSi8TXdc9py2r0ULw==
X-Google-Smtp-Source: AGHT+IHw2F+g8azy9+A2CTTjFUe3/G4dCC8p/k0dOHQU8Dj6MYf/830XflujqJ4t4aGM+bWVkhywyw==
X-Received: by 2002:a17:903:94e:b0:215:96bc:b670 with SMTP id d9443c01a7336-219e6e9df70mr420824845ad.18.1735470849111;
        Sun, 29 Dec 2024 03:14:09 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca02544sm161655895ad.255.2024.12.29.03.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 03:14:08 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 RESEND 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
Date: Sun, 29 Dec 2024 19:11:17 +0800
Message-ID: <20241229111322.4139-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229111322.4139-1-towinchenmi@gmail.com>
References: <20241229111322.4139-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add backlight controllers attached via Apple DWI 2-wire interface.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..29caeb356e6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/apple,dwi-bl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple DWI 2-Wire Interface Backlight Controller
+
+maintainers:
+  - Nick Chan <towinchenmi@gmail.com>
+
+description:
+  Apple SoCs contain a 2-wire interface called DWI. On some Apple iPhones,
+  iPads and iPod touches with a LCD display, 1-2 backlight controllers
+  are connected via DWI. Interfacing with DWI controls all backlight
+  controllers at the same time. As such, the backlight controllers are
+  treated as a single controller regardless of the underlying
+  configuration.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,s5l8960x-dwi-bl
+          - apple,t7000-dwi-bl
+          - apple,s8000-dwi-bl
+          - apple,t8010-dwi-bl
+          - apple,t8015-dwi-bl
+      - const: apple,dwi-bl
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dwi_bl: backlight@20e200010 {
+        compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+        reg = <0x2 0x0e200010 0x0 0x8>;
+        power-domains = <&ps_dwi>;
+      };
+    };
-- 
2.47.1

