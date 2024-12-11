Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88672211A37
	for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 11:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916938; cv=none; b=K9Jy7nef740H6/KgY/u0fGH8321BZM5W9Lncah9oBk8ruf7XQqG3We/O3ZswaQaaMhCP7iKdjy4xF2Y9xKRjaz72wv4ll613x5+a/33LWCDjBICCbRbwQzzba33rk5JQEybVjDCWjtjxtN5mlk/CjyD2pKKe3U9NQgR6oidkTj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916938; c=relaxed/simple;
	bh=dt2bprlcCPOxA3vEWtu0Pmv4h5fSClLCYMNbBSaXJ+E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhLy4IQoR+Dbz7S6o+4OXtAX+OF70IzKvWdTk4ymJEPhIwRKwZOpnCnoeIv7Axyg/0y79T1JhdqfF2LpEV+58gRyNayseMGELo0tKQ8wHgzLQZ8gT4x/CaYQjLerdXrxb5A0hAG8Bz0S3w3dVfNlzoXhcW7Iwr70prWF19o66mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkuBVwvk; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkuBVwvk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216728b1836so16219645ad.0
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 03:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916936; x=1734521736; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGkzbcqvOFspYq5q3MXmaYRhS/5bP5b3n/UA7OPeKfo=;
        b=QkuBVwvkbTUd5lFtmMZtB3YOJL5QAvd5X11jF8nb+WMehDK+DUikKx76fkaqpltY96
         gYlfNkM/lV4Xa1tB2D+hIguTCbliCc5d9HFwi0lY0CZ70FDe7KkpuptCX0UED9EJYzom
         BnDiijIRgdpvLWHBAvM7Tv6ywl1Q5YimZCBmxgfWA1O7OFk7ftLp8v51V4dhY7Rdwwgy
         d7LMKkmdpTruBg7ltNYjzg6Fw88fg361TDs4lyNlPWHHwcK6+zAdwHYM0lQWPTdvqFUB
         TVolEm0erW1PmHNfzU5Br5kO9OD1YfKK8iv6wBrne/gtHOOzDRbAtW6JhcGNH3Ar86Wp
         /YXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916936; x=1734521736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGkzbcqvOFspYq5q3MXmaYRhS/5bP5b3n/UA7OPeKfo=;
        b=t9zNqe7Co2H4nmpnk5G9KNsmXIDvnl4+KXh/EX6z9JYvwQUMfQYQcJ09WqOJx1MKzX
         P4LgW4pXU975GFuOcl6tQNZmiEmT0jkndP5lLKWr/tCA/Ep5J+HWMkuA/a569dGgA+ZC
         KUBly/uPRFh1X6DF1kiJgQERWdb76HaJc0T7vifkqWMi1n9TBhXa1eMCkJ9ssyg5/XRB
         G4fjKC0dPupFc4Kcf4JMGr2YEY5NJZsqOlklwF9ERPBbI2BwESPITOb4OZDicFJMGXlw
         ashjoS5LNGVQjfcUi032sbefyhADrYluWW+FG3SiKcGUOKwwJpveCh5CgNMgqerCTBA0
         i41A==
X-Forwarded-Encrypted: i=1; AJvYcCXdvCGSYlPGwGCnCV1HxzfCgvpx878dbtofwMuYpZfknF8acvpFIsH6gObTpmUJSFFfljAQCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLGCfY3va30+DJt/U47Q+lu6yrGXwV39NADyOeWg9/cN8kNp+C
	l9Q4UnULCDNiLJS1+25iW4WNK+RNoIcMDaMEYlRRO5VvOKeHrBWb
X-Gm-Gg: ASbGncsZtzTY/mz8plnwFEzPTPJV+o7258I4hebsW6jMdSEaRz2Hb8jkJ1DBFWnLBzS
	bgT73vgtV7Eo/jfPUzK6Uz4uLm0oD8VA/WkbyW9R9hdhQDWtxDdRiKgSZEGdoGfGbOLiW26WAUC
	fP/9MLQvAF07cz4bDjgHuowucGiZdNMGEOqeh19YuSLoSAnqgI4WXL9FCOA9IPZublDMOxylJ4+
	xAxEbmg7XjbxN5oZBEO8Lo5ns5h65MEzNxMt0u7nVYGdfEH43OZ9HVIUrzf22a00LSU5Q==
X-Google-Smtp-Source: AGHT+IGMlkuqj5IDE2y2hs5ggKANhLCOeqY5ZZVSTXz3hSFIBTS9nP8blx7hzXomQHBVRniqPWetgg==
X-Received: by 2002:a17:902:db08:b0:215:e98c:c5b5 with SMTP id d9443c01a7336-21778390f29mr49010095ad.1.1733916935857;
        Wed, 11 Dec 2024 03:35:35 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-216404df131sm56765635ad.203.2024.12.11.03.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:35:34 -0800 (PST)
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
Subject: [PATCH v4 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
Date: Wed, 11 Dec 2024 19:34:37 +0800
Message-ID: <20241211113512.19009-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211113512.19009-1-towinchenmi@gmail.com>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add backlight controllers attached via Apple DWI 2-wire interface.

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

