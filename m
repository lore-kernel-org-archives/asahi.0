Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033BF21517B
	for <asahi@lists.linux.dev>; Mon,  9 Dec 2024 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731177; cv=none; b=AvZTdbUn7eaX3s3FRH5c82Tus/IsoRwFHAmfVCkXypwG+AQDkFnLF8wGw8X3OX0CM19S6xKkJt9PaJdPBFIjTGC3b8ntIjNEdiFEqz1GfYteysPt5kYCNCyLL6ht3oJlSwpzu2DAvxZEbylbAcGpApkYAaCEp8oPK9GcxPDDXJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731177; c=relaxed/simple;
	bh=a+ffvi8Pvp87P/1lPCLBagqzbCZkXpLPTrqcZ5m6KYI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGhh6SW4yPUvLvXlL0KS1dTQ4MCvEQ9Tj2dd9nAFmQwa+bEVgzay5XOS8I1I0vuza7jzTTuhF4naRb2jbWfss1m4I7VLr2Yg6JqTJSbc58AQP4MtLbXc2LnbuXbTV4wUuSikRVo/VQ/l8RK8xIdY8HL9XWk6FLkYP6C4qKYkMUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i305t2Yn; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i305t2Yn"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2161eb95317so20706975ad.1
        for <asahi@lists.linux.dev>; Sun, 08 Dec 2024 23:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733731174; x=1734335974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
        b=i305t2YnV2DtbvP1U5eBEnKV11i0SA/clB0A46UPzefUpXazTIw24XN7VBXB3EXir9
         B+XytCsjr8QObjLruq/H+R95uw7E5Bz+fkcAvJiVPbjdL5a9Ah7i8XEd+xx6BbDLQPKf
         EwF8OQRTSZpN81HrFyZ9Q9jTGUFcXZkV8OWboLMsgkSgN3daaqnHQ9VOq5p8k65jJZVY
         Hdv6l31gyijt21PzobP1B3PTkQIc7Z4NKGBIiAVo6YmbconBS+EIwsRpuR9/p7nHehwF
         H0xI+f1gRCJjT247Ydufa57QFaFdnobBw5v1KI6uUGU6nn/2I5fJVxROGiiXqaBAwV6f
         QQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731174; x=1734335974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
        b=OUNqgQwGVZhpdBMtnCajziuUvdJ1NyarRMY2bqf/sHPn/pIomnDtT+ywcxkx/kmRyR
         Tp67Hhf+Fwfq5x9RaM5aTDY7qtPW1TxAsjj/4H3+gD17iY9/x+nRLHBLDLCzS+Cm2IV7
         zXEd3ABTZbQSHV6oLAgEoydWsvgjsvwVFPLV1zmukX9pKZHhCCGDMCF6IgPjbOxrSkwY
         xKXQFNErnn+jxJ28mziRR2ck/6srRdRru7ERQ7JAQicx/hVZGChIW08vlHEgltkZzH31
         RjHJ8Vlf6Z3+vXlAXyedJm7WYUFgfli6TEZNG2qSCIbPIyRJML13NVWy+ZYWlkizD/Cd
         kxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2mTltLdJqO1oIxqHTd32xiKn/Tg9xK85bgbpZIDpQtF4f7Fu1LaS5XkcCc2jmnrlfKgF/yQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YywjQ/L2mpe1d68wNpfrGeNop1+4frbwf+wY8Ue+fo0sskzwVYH
	NzBRbSU9MHBwjcaRTVUmWZzXeCEBB4Pev3C9bWp5KCHSX8rFWMIs
X-Gm-Gg: ASbGncuG1AlIdgZH5a7Npi3WBmOj2efMuM08j9KGCeJfkkpIe6NozIGbX4SyA1nxMbu
	zsqe2bLUJBm67776/aca4mf6DjVo7kIEBhAbXyoKI+DnmHBn5XhLwaCL8TSONeIIsp6aWsA4I0f
	2iD6Lv/cEwNCiapRgIocG1alRG0R49WgU3zU84zr53ass9ZCPKXJ4tX01mQ9z4kTbRkJCXEejYh
	5dV3ffPS0I+cjxBX3TItfkV0mmX95Dhw7moZQEEllM7dGFYYKZriMoq7XbrJugqJQ==
X-Google-Smtp-Source: AGHT+IHAz1igIUyVxn7/F31nUUXielqAW/wiAuTMbEeQeNxfmCtQzSeNLB5DvIv4dcsvWo5CidKtsA==
X-Received: by 2002:a17:903:234b:b0:216:4943:e575 with SMTP id d9443c01a7336-2164943e7d6mr35625795ad.57.1733731174215;
        Sun, 08 Dec 2024 23:59:34 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628b6588csm36508025ad.235.2024.12.08.23.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:59:33 -0800 (PST)
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
Subject: [PATCH v3 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI backlight
Date: Mon,  9 Dec 2024 15:58:33 +0800
Message-ID: <20241209075908.140014-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209075908.140014-1-towinchenmi@gmail.com>
References: <20241209075908.140014-1-towinchenmi@gmail.com>
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

