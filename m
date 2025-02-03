Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C2420409B
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 11:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583551; cv=none; b=oLNm99WumxKQhZkswxdJc26rxwF7MScjzuVCRezki3ee4eKHYltm3da6rWLZSQXwQanSwlhfRH4FZrxW5+l9QYdmfWU8TibB5V4MeFMp2JouVZ1EeKuyd5G9E7Ac2hnAewjouCeqpqB+rY6eRQpdu4XBVOnh92kL4ZchJcu6eFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583551; c=relaxed/simple;
	bh=e4LCw8b9TArgBNatCS4iPLDcnxNGjb099gyuFiAoxA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eaWNlhg9TCFCvLwjy9IwsNeYZsPam+2+0pv5T8YNPfh8FdTSZztO+dtxYFwUIFDD+Cx960AVaOq1CbONlDcPe2LHVh/ezm07/bLKXgxu0545/wR0OIXsc5t19NoF9Z5cqxanpnJrZa71b7soLyN809hpVQdb6ZsYKSlakCVhkr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndY7iwt2; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndY7iwt2"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-215770613dbso55713215ad.2
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 03:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583549; x=1739188349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
        b=ndY7iwt2NtZYqhG+R/k9yyKCMIjdGjHR5KH07wJuaOzkcpqmlZRu6OjzJaCBVpjSeC
         PycvMR5vInAo2kus/PMjjcBSt+WsDnR9nnm/h7e4wEd5Vz1y9CAlOvidFb+ahzfE/tMm
         Xop4RG8QyvASh/WUBPGlEQSQ0UO0MWaWnsogFo/YvGKDeKpS8b5viQy2OtTtJAPya8uu
         sIltfB0RqWo9d4pJCICwL63nC6Z9gdT+5wSlZFHlF+qct1n1uDxsk4RmMoGe/Fq2OQtb
         xZXgYQDL958ZI/HJEgHZ2V/D28gjpRL5y0g1TfQ6RhlQ0UOYEadf94oc/Tw1K6VRAQbT
         t20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583549; x=1739188349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
        b=GrCU8Yq1ntGS3kuQlyYTm7JHM3TZjkZRctiSvQxIlV4mLJL+T1Gf+G7wNBdYT4k8u9
         HKgGZpHR0Sxd9HIXI6urfLOaJ/yuGr6RjRSrnrDzE3aKGuY316ilWD9OtdMyKH6aKMuY
         GCrlE6z6UPbFdq5lbCV9ATIFvNcHzVQ8cGBVIVuXMPOzIwQrDK3E3MkAAFPRgHXjt41b
         vFolgcVd1srfQJJWviwRxbIwdFbDtOzZ4tWji6yYxlRDv0jGCMkuN5WKQ9vm2VYoOjlv
         qgGs1OqvoC3hIcLBfgeADGH9ETZ77jXKnkSso71a5xVGVJaCpmfFQOisNxTdxwQzsvJc
         US/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwCvrnLAAkj9SZAuXfi6IPtu7TEzp5RG8qWwPN2paGrG6HsP8MPr9Zm6ASgcHdBB4KI4o8GQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1brndTVwwqedh3gvnHvaa/AjfJhiuRJ6jx7SnUkT9AioUS6Fl
	6NNoZaJA6sUA9sWoYIRkIgtk54YKtlCL3gQT+Gnwzwek6mZjWIlu
X-Gm-Gg: ASbGncv5P0PQ4rjWaZPWrCehWsHzkJajODdz7sejVJae2b+eQjTCJc8tuiT1b3j+OiS
	Emr1x6JhpH+aH8zTaA5YxI9kJYhtR5paj/zH1+aZggi7dZDWTm0qwAFSofdYEI4wcU/vUweu7LV
	HSda2Ar0tidsGmjknToOwSdWfa+g4Pgv+LCEUWcdYJnF9OdUvMgcKncOCFno0Gn/y8lyhsQn5YV
	0VTYnz20wf2yeE5BjgggvQzSoqNWZp3qKhuNgCSgrMbMEaYDulnsxdBfdSypmpOycnhAhzk9amN
	lX6qiyJDJGCna0Ba
X-Google-Smtp-Source: AGHT+IH1MtQsv7n9+03TmRQLhZL0KNOrrS14baU7/DtFKLh1qhS09XchSBq/EFGuV307S9+ypU09rw==
X-Received: by 2002:a05:6a20:cd93:b0:1e1:afa9:d38a with SMTP id adf61e73a8af0-1ed7a48c85cmr32676039637.1.1738583549287;
        Mon, 03 Feb 2025 03:52:29 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72fe631c039sm8262408b3a.25.2025.02.03.03.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:52:28 -0800 (PST)
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
Subject: [PATCH v5 RESEND 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
Date: Mon,  3 Feb 2025 19:50:32 +0800
Message-ID: <20250203115156.28174-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203115156.28174-1-towinchenmi@gmail.com>
References: <20250203115156.28174-1-towinchenmi@gmail.com>
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

