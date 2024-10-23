Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7892148853
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 04:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658711; cv=none; b=BJnTQSGiFs3Yu/d6k/+gPjAeVSHt+vI27ICqhdFW0qVNmwnjHyIrNwP6q64a/bQzJ/wz3l5izRNbWZVyEy5XSboo9EEID2yhovYMy4NQcYZtsXWYdVgzXO8muogBjj+f9mIpYkkr9625oArnzcgX6mIG5ES/K3Dwr/WETuAkRv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658711; c=relaxed/simple;
	bh=/xF4mdxwIhmk8HMPBdMfDFiwL7SS1YLTggmotvU3r/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/UmmI8LlxqQjOugXShpb6+BaGC8+N4MZWLuN5Cu7ToPJi1nweK47oRU5b0oKRzzyqvpBdfmZNKJh9mRL6lclKuHhomGOBCS8+mNHN23ecW/YuKVXAzFP0R5Y3AFyhfH9DDBxN3fTCmt/lxkb/AC8awVsH61kx9WaXTiktpH90M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g374h/Te; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g374h/Te"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c805a0753so55563405ad.0
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 21:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658709; x=1730263509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+4zDIBqpXebMTzDFpDT9eRBDvM63w5V4mXYWQhuiHc=;
        b=g374h/Tei/JtsDtTrxtkPiG/wrcXTxZY6qJX2E46sdKK4zDF3Li0THtJBflrnCnp7M
         i23QHYJroBHW7BCQ9VM10LU6ecKTIq9qQZN2rkOBQ1Yv2Bbdw8CX05sKSVWC/54vnmnC
         X46WbA6wsN5DEKHU+hV5M8ysq8yeHdmoBfrBKCqE/A87YQd1U4hV7PVB4T9tAHWphAgB
         1fzNfmiuEoDq2J07cn2vafHMV4N2hklM3JMbjOx+NTkUby0SKyX0VL84/xeM6emb+P/5
         XXKPh2pPOW2z1mgyp/5aalWHMwC3JVj/TOZZgIOJ881uq03wUim+XJh7UE3HEbxN4FnL
         CVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658709; x=1730263509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+4zDIBqpXebMTzDFpDT9eRBDvM63w5V4mXYWQhuiHc=;
        b=Hy9MCdDo5Ko0tWQuOZ6sp03jZJ98Ztbon9Fzt6CuCaiRK5k9EpVT+YLVusdaoULkKq
         fCTzhBV3cDwclu7yfEp6Ea7DiYzjnBP6ALtu/SEhjCPTalAb8CWweRcv2p3n2hfeAerC
         Oyj3IphoNzMj6DvmfkVas8JTFg03WXKbAAqgzb4oXBNdfXFhWjidn/hkCbcsq2/akahQ
         nhfWM06rjFO5mgFKEhGZ9lsE/4L6POCnLd8Fui8HXmwoylrXsycnbqoYeNCrJflR39bo
         8PuhkaqXu+ZDgf/ISt2JFP05O5rq12w5xjmOuLIthSip1PGsBYw86PumVZnPn3rKfYot
         LAHg==
X-Forwarded-Encrypted: i=1; AJvYcCUY/HvrS42VvTa+KBD5RJLZCzLN7Uw7C0n8I1pQhjS6AWuJ7KdE3Fib9CZPozX0aTYJ8qkR3A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0GrImh5EB6MrkWO9X/hE2fyDf0n6jHFJuyaEdOh9qXjxqMmBI
	5IvKE/svGFRxkv4VYNH33Tsh9OKe9oOGSwmzWfMjqvQUzpE17XbO
X-Google-Smtp-Source: AGHT+IGkZ0YiYKN/wZ33oPdz62pyzHKEQvLTlWCTI8o78RTGv7e5bqySL1yDyI7UrJA8DguKMMVqOA==
X-Received: by 2002:a17:903:18d:b0:20b:6188:fc5e with SMTP id d9443c01a7336-20fa9e5feeamr15742345ad.28.1729658709189;
        Tue, 22 Oct 2024 21:45:09 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:08 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 RESEND 05/20] dt-bindings: arm: apple: Add A8 devices
Date: Wed, 23 Oct 2024 12:40:40 +0800
Message-ID: <20241023044423.18294-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
References: <20241023044423.18294-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the following apple,t7000 based platforms:

 - iPhone 6
 - iPhone 6 Plus
 - iPad mini 4
 - iPod touch 6
 - Apple TV HD

The remaining HomePod is not supported as part of this patch.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 89c1e35e404b..c05a4414c8b6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -19,6 +19,14 @@ description: |
   - iPad mini 2
   - iPad mini 3
 
+  Devices based on the "A8" SoC:
+
+  - iPhone 6
+  - iPhone 6 Plus
+  - iPad mini 4
+  - iPod touch 6
+  - Apple TV HD
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -89,6 +97,18 @@ properties:
           - const: apple,s5l8960x
           - const: apple,arm-platform
 
+      - description: Apple A8 SoC based platforms
+        items:
+          - enum:
+              - apple,j42d # Apple TV HD
+              - apple,j96  # iPad mini 4 (Wi-Fi)
+              - apple,j97  # iPad mini 4 (Cellular)
+              - apple,n56  # iPhone 6 Plus
+              - apple,n61  # iPhone 6
+              - apple,n102 # iPod touch 6
+          - const: apple,t7000
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.47.0

