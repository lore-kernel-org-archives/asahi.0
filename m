Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846A814F9F4
	for <asahi@lists.linux.dev>; Sat,  7 Dec 2024 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733576697; cv=none; b=UbAG7Dc8cXM7X8yeNElreJr5tnqd9wu8dSdCN7kutSigCGBkhQzMLelDJ1VIVKggpsm+z4BHtcIOzgcIg0ZHoosHg51cc6ql+TQS+u8g6AcHpKo5yci73DEuF89kKURmnkbvuP/ktL4+jhLVbTF4daZWMH5ShwnUcHWoC5aQm+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733576697; c=relaxed/simple;
	bh=a+ffvi8Pvp87P/1lPCLBagqzbCZkXpLPTrqcZ5m6KYI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uk5txY5DBGBShNmkqQMBipEUTh1oAkHQgGAGo2ArNgL7/x3Bv62eYNKfjPrCxc1maW4iEAbulBcHJ1Akoc/0GZmKOicrJ0VKRlGVqVarewKdVWHYfhu96KZEEzc43iEUFTNLAQ2I+P8C/jszNPFJ4oc4s0hvtLUWl7tHIK9LTzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhr4981V; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhr4981V"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-215810fff52so32554075ad.1
        for <asahi@lists.linux.dev>; Sat, 07 Dec 2024 05:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733576696; x=1734181496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
        b=nhr4981VcfEj0lTgZeKP0JoDpJvX89kmnZiDjtPN5yp7Gs+G2ce4bwDDsyBUYINGlF
         YN5iL9JVukdVnuij1Niv0GcMU/Byq36VdxREY6iDFotRb6tGKdBSBZaey3W2D//SiNq0
         7o+JxYxXmZQIX5HUCqxuul5HGxOxy6sYUsEDg+HrSBIxh+8SfzCyGYQAGq37WGdggvGb
         hTd+yBkJ5xPB6dP9dGjaabaLGLObBtbgThGHHNSKrm6bKbDLSmYDLfbHU/i7bj9+j4Ky
         Lu21VgzQXOpWai55wqerS5GQ0n+wmJOECQxjanq6D05G8MQy1/YIriyBKvGezK/po9kp
         JuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733576696; x=1734181496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
        b=kkkuXg+OzvOtWhCQgH7TgLONF60/C7ZQ45EknKBw5AVoNDxsRdQSk+tS9RL4dHYs74
         +CFuPTaxI3mEOL6PgDNPhgVFt7z8GyLUdQ81NJtaAMCOE3wpCv7ztgreVSDSkDhQ0pZS
         8Te0Wc4dt0vMt6Lfq//cHkcORebC/yWced8M+uDaF+vQ0Rpq/LlUeAoGi8K5xsEIn3Ze
         pIXBw44YcMZLw5bGeKiJKCii78tRPuh8CI1GsMglAfeX4UILIZWWKvgE5uZWZsac1Uxv
         u9tkCJnsNLjPaSsz6nsgBM0XBhDqkRwcUgBQCFVq7663cGaaUA2580cAAKpO5PZKoI+X
         et9w==
X-Forwarded-Encrypted: i=1; AJvYcCWai2KHEAsg0wknRxGkzX5kiBXTCtNmdChJlQlhbVIw3ZuSo8PJcUaTpKuYYtB7yT0+EKr0jQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4jjtIukNpN3UtbEXdBQdUuVUSophlGqBurGE/PJlJQ4DnYb8h
	cvtXEoRS8pUvH0+GCRPnlqi1WIsXswK+WOolLN+ptGx9Kc8ynCIN
X-Gm-Gg: ASbGnctvdLRBv/IwMIUtrFCaPbHlQh4JqlwbNzghqttzJeYm3YiEEohvNfjq7If/nUa
	HFBer6VjlHDjJ+lc+UGbS5IChkk3lBD7NBCu7LcD7VaqPjWb3eL8C+rdMClae1iJHMP4zUaNhTM
	ceXIxJIrjQfw+OtjBp++8zLs1pU2TICO/UB1orILIa5eTYW0/tnlWVZla5B++JPbkkD/VD43yBI
	fT19QLvJz6wuU/uXQconvaZVKhoJlfz140BIMR6OaMJWOwDBqfVtdfuFrsqBYKk9A==
X-Google-Smtp-Source: AGHT+IHSBn/pq77OCjYDKU4tqjEmdqZd8B5Zl+VAbPbKPPsQr8JFMXWjlUkJ7t8BCQ5XsnHByPmm6Q==
X-Received: by 2002:a17:902:c40a:b0:211:ce91:63ea with SMTP id d9443c01a7336-21614d35675mr103444335ad.15.1733576695885;
        Sat, 07 Dec 2024 05:04:55 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628c59730sm12779715ad.105.2024.12.07.05.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 05:04:55 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI backlight
Date: Sat,  7 Dec 2024 21:03:14 +0800
Message-ID: <20241207130433.30351-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207130433.30351-1-towinchenmi@gmail.com>
References: <20241207130433.30351-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree bindings for backlight controllers attached via Apple
DWI 2-wire interface.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..9d4aa243f679
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,54 @@
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
+description: |
+  Apple SoCs contain a 2-wire interface called DWI. On some Apple iPhones,
+  iPads and iPod touches with a LCD display, 1-2 backlight controllers
+  are connected via DWI. Interfacing with DWI controls all backlight
+  controllers at the same time. As such, the backlight controllers are
+  treated as a single controller regardless of the underlying
+  configuration.
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
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dwi_bl: backlight@20e200010 {
+        compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+        reg = <0x2 0x0e200010 0 8>;
+        power-domains = <&ps_dwi>;
+      };
+    };
-- 
2.47.1

