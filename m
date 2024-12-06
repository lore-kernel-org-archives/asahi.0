Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4DB220682
	for <asahi@lists.linux.dev>; Fri,  6 Dec 2024 17:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733506092; cv=none; b=uY4oqnaDnMdUOxdFZbTOVO7i9crfmHHwWj7HDsUw87l0cc21ugLPA6PQYc3GKa6omvPa3m/exvP4Z99HnqIfmqHLJEZEHkSFjWfYJ2JS1P7v7Z6lOzzKxFzi3sXMYTbo+E5FA+z7MBxMY9gI71E2dyonlYrC8NYSPoK/JPIZzrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733506092; c=relaxed/simple;
	bh=qfw9yW8p9gRYkvburwWaazwJ4STlL9xuMWKwEqIvHLo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B7jan5WIzn4N7r4pO9gBvxlAy8NihyHVgCQq7NkXA67kdN6LnzNPex+cFQy62/5w5IuKjVhaRClCJ/pj8eX3YjUAHhgeAX3EHkCUiubeSycADvaS/1q533wZsA3h2J66lVGT1kPguSkZ85soTnAUKHW4ie/CQjIvfIJtdoEeqP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DH/3Y5Nf; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DH/3Y5Nf"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7ea8de14848so1860388a12.2
        for <asahi@lists.linux.dev>; Fri, 06 Dec 2024 09:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733506090; x=1734110890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKs6SqWvOBPQFDy0xdKVrrMMEBXzqiAL0Gp7ECA7uFA=;
        b=DH/3Y5NflWtVJanpbi0yZlpSmBFsfvh8FsQ3hRO6wW2BG0J4slxXGASuiY2ShZNMwN
         5124pm6V5is6ziBXUQ6IGJkKppX8CJOmdt//Ov4iw4t6HvYLRhziV1TSeNG8QmQN+ugm
         uJq0QXlacZYjhpctr637RloBV4rwOUdEA7ChGBEjYpPvTUkT9mTN+PcdarL23VFjvr/X
         hUtC+82cw63JBRyw4iw/qOb5CTdJq0lB159CJfM4SC296NpRixxJOy2ZeU7hDDf5UD1/
         rV5cVtDnrL/6AgrEAeRHs9NoefaDk9XyHr4ghcOb1SGLW9HtitSoiQxpRJ32bU1tlwO1
         XbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733506090; x=1734110890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKs6SqWvOBPQFDy0xdKVrrMMEBXzqiAL0Gp7ECA7uFA=;
        b=RNLbCOhyYJFTM5lmyZZKlNx7Qug2/9DxdlSuwfdeb86I7NVBFpBjuPldAd+WYH+8LE
         QHEO56uXAEJM3ATANkMGlSVaMVzTxsw59nI2P4aXwpSTBtULrzsnFcrY8j9bKFrogn5I
         SwOPD97jxbyZt/0ySTH16Xmu40sIOD6TiGaORDQ8rgV4MrLMgM1K9UsRyDoilfc0GpRH
         hXCvVkhi6v1xQrymBzP6Lx8P8REXqvEFIy725NThgTuKvAZNiYK7BIasnpcYCdT74XPn
         pNJfQPMiycdYQDtLigEXn6gw++H7teHpsAoLWQh3ljl4WVVRjFAAf2FO6QlnqNp7SWJn
         bpnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlpLBBRQb3mGxzjZf0vdR45c0nAflToBTsyp3xH5oa8R4vudOPz9eYT9TcoBieQeE0m2C7ig==@lists.linux.dev
X-Gm-Message-State: AOJu0YxC0aa6864isS/cQemxNM+8eqI3tfwETcuKctpFb1LTlyG5rm6M
	fWGKmV+8kt0+/a+6z+mvF8MWdUDktZ6tJHl4htPL2BfW5SGWtuuS
X-Gm-Gg: ASbGnct1wq2tgoePQjrHtiK7375hLirqSA2kGD2sfdkuCTBjw1bTy16HslFlOlfM4jf
	tkggin+Bx49TPXtI0wCUPQwrVSvjeFvumsVKsLTgeZSerEUndPFDzfmMmsbCU6lc+hiwVf8PU+M
	JcoQTcQOuB0If3xgM01/hvTJQiXNoaAvS2Qzr2zNj+CtnfYPn6suDur5wZYv9cbbHuWPA0BCcRA
	FcAONVnYs7yWntmnK0+D/eIS4QBAzya7tvJkkztM9tpOClkY6yhIZS+pNB11dK/
X-Google-Smtp-Source: AGHT+IHkO1RmdNJpR/98buAGJm0YvKeK4V7vOM0AkKSIB8tDWbwjkVo05dKTym9p80CfxeZrKTxMuw==
X-Received: by 2002:a05:6a21:9a01:b0:1e0:cc8c:acc4 with SMTP id adf61e73a8af0-1e187136d40mr5795557637.37.1733506089650;
        Fri, 06 Dec 2024 09:28:09 -0800 (PST)
Received: from localhost.localdomain ([49.130.54.203])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725a2cc6950sm3204512b3a.173.2024.12.06.09.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:28:09 -0800 (PST)
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
Subject: [PATCH 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI backlight
Date: Sat,  7 Dec 2024 01:24:33 +0800
Message-ID: <20241206172735.4310-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206172735.4310-1-towinchenmi@gmail.com>
References: <20241206172735.4310-1-towinchenmi@gmail.com>
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
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..fa3789b0b043
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/apple,dwi.yaml#
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
+  - power-domains
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

