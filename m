Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D28554769
	for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 04:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739505849; cv=none; b=Lqn49DejdNFut9r5z1+I4yWoWoVSjV9WVpCRzzxa82YPu3J91feBHpoD7M7XhVRZk9PjcyfHMQzsBJewCr04bn3zy9XL7lqXvC7awr9JPakV1qRR80VrSJZ/SUdC+rkAO597jkjjj31bM5wa6znE57pxAO5mFNUYo1bO9NguxLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739505849; c=relaxed/simple;
	bh=e4LCw8b9TArgBNatCS4iPLDcnxNGjb099gyuFiAoxA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csZECs5wXoQyx/nlHk2X7aS0g6upoDetrPDxJOC8O6yleE0WTZvdR8NkD/cT489dOXIHmv0X7zlA8LE3dzP5QZYoau8ZyRpNTvbbWVmtsCApvOK7TrrctSktmcsaEjXBPfSNHEx7k1NzxGXo7IKaXHAR8cSGqSwej0IMNeQFONI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mV5sU63Z; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mV5sU63Z"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-220d398bea9so22036635ad.3
        for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 20:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739505847; x=1740110647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
        b=mV5sU63Z0YFNXZCI8MsjheTFvkfFgN6WeAgv4uBUUN1DnZ5cnm2eWQ+vuEDW8PeI4K
         8znY1U0g3Qpj4ADXXmrEtzSsOovK7AZm9YjtryY1YvFte7F7jdiV1kr2kOkA0RTDS80z
         h4GonCk0oxWLsb25uGQA1vgVi7TgCgSJjoyshjHIioU69tDP6JQvfO7qDhlIRkO5RGjf
         3owGhYed1aUtrHhzQqr2i3+Ay6wm2CwPFsA1NPLphWmRIBCJGdXec19dV/Nz9Sbt8r1m
         27FIGLxGdUEWKx0uQE6Zcpv8zpWY0d/MX6OprRnOblCKHwmp07Avq8j74Dd89KRyt8Nc
         i1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739505847; x=1740110647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
        b=koF8niCCDze49Vh7tjV8O6WiEpUcn9gpoYtNdeW8PwsCnW1ncCDL0mNZ+Qzdvu/1oO
         XcfQcS00yUBth/ApfNtrf6owtiEedoBT+JG2kO29fBGhyqedxeFwWbZIalqMAxPoa48p
         4jK2WegOIY56+bgC6z/ts7mnOf43t8/qbyWK9D3uJFwlSUcZQ4YwcLEYiNfcdro55UVY
         bm2rYEZ/5vtvG/brtiQy/QGszvgAMDOPX61A7opS+Pd3z5uOObIr0E7kNAGg6+XlU1x1
         L+nU+Nv3m5t1Piiowgc2cxUUohvhMRgQUbeIS6YM1crIYv2TgSDVI1kBZs0aURENUhJM
         7Nwg==
X-Forwarded-Encrypted: i=1; AJvYcCXGVlp4KjgGweNKcj1lENj+kY+SjGK3+gT6ohCiHegonPWXK+FlZvi4+nkVIwT4ozyAEct1tw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4/UysdB2iMuDC9N2HUCoteX/vXeOjGURLhEkwov/xEos6OcJS
	RGyHy3aedimQK9jsPmTHxeQCtEXvQ8UYxaOn7MsZ3naebFQM5/Td
X-Gm-Gg: ASbGncu9KrI7ft+TduYZuiNtmcD6Out8APZfCG6ox0a/1UlAI4PhT9iM3Les9/4Np0E
	qiIAu0e2ApN5NkkR4AKYEiIb1ri36x+9lpJW3xSovmnI8CsTTihliE6OxsPrMOx+wl81/RvM4As
	DJIIKp17+yEMYDg1Pvf3n60HinqSIl1aROEsYH0nA3Ua2d/H1fEbJ270cUMStK88Aeib7AyrpRF
	5msLiV1QscG1x0XKArpMj01zubUFgVGKCY24nPxITYKHzz+UP0zE/GKd3sRdihIhxi73rVx07q+
	Z0GNCRiW5klqh7c=
X-Google-Smtp-Source: AGHT+IGgz94u5dSaKE5PwBYaLjtoVurlg0X6dABIb3PB35R+FknVncdnfvcsPkYesVe9CLDNkNni2w==
X-Received: by 2002:aa7:8894:0:b0:725:9f02:489a with SMTP id d2e1a72fcca58-7322c3f4d96mr13423478b3a.17.1739505847127;
        Thu, 13 Feb 2025 20:04:07 -0800 (PST)
Received: from nick-mbp.. ([49.130.17.220])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7324273e3e7sm2181227b3a.91.2025.02.13.20.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 20:04:06 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Janne Grunau <j@jannau.net>,
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
Subject: [PATCH v6 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
Date: Fri, 14 Feb 2025 12:02:12 +0800
Message-ID: <20250214040306.16312-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
References: <20250214040306.16312-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add backlight controllers attached via Apple DWI 2-wire interface.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
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
2.48.1

