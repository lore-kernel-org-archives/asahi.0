Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2377A13DDB5
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 04:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658706; cv=none; b=J0rNT6pFXq1zkC4CYrlv6nLuoD4OJs+tONZ41VWs+rE29KUXmHZslyQwNCCDbdsswJJBFP2Lo42BO58Es3C5+k3oeesb6OlQOqBohAH6e4KWWgp9yUk8HEvSbL5MdCqEF5NnuivKv4BRKtc28DkoKrzVmlhFBRYOPgXll3atyqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658706; c=relaxed/simple;
	bh=UlYlVeLWj1/jD4Wc+V8YqMdxC72e0nUCkBxTnqcmimI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=krr561RUu8GyXVrM2MB/0PkCy7PjbM3enSVmg6RR2H6BL0gfsKVIHsqRV9Z+RwowkFxR7blwbn7woNFg8zu3EpsBQaoqngCatfDuojO4ktalHsSC3wOjdkuOY6z3B7G5G7Ko3r1uavVpiQVepcGDduVdIKN/jMhutfD7yx1C7zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVL56Ol9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVL56Ol9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-207115e3056so53727545ad.2
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 21:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658704; x=1730263504; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0oa/ZitNLoZMPejVfhkyWaBLfp6DNfNYv6Lewc+8d8=;
        b=EVL56Ol9gRyrTP/ZPC3i699zL+bpAD3KbhtBP/FKj1/+YSPhZVZGBWgSRDIsLLcaok
         MzOlJn0KDVCazHXqOohK5IQhMgdVLNvbBjkuwg8wDf4D0IYktZBkdqTvXi5taXT+AcnR
         FqiAcLfNBxu8KyGH/m+I3rFl2y50TqHRqbj2qGanf0aWTNX9UUL/Ma+2AAaV3fcqQwk1
         eKQgYd43AvcSwFdfVFL+KfEPBc80EiO6wZvCtHJ1shtdRpSBZTQ64cDg2vAFSeW5khpp
         f46p9DxPf6CNMV31ALRoXgUF+mjfp74o7vfJFevBkHhYOA8emFNfyBGmCHcvjLtpmAN+
         sO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658704; x=1730263504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0oa/ZitNLoZMPejVfhkyWaBLfp6DNfNYv6Lewc+8d8=;
        b=FZK5LC/BLDRPJWW9wGssmppiCLjH0Bq0ieMocbiE3ud+Lwj7+Ck7dIYZLPdwSBtVhu
         fyc73j8mBiwS4nZsEwUa/3jhtK+1Cx6EWt50v05yO5PHqBu56kO+hUZRZKCyXXUFrcob
         cgp8iU2+ot3RYYVTKuPn7/qlmrooY//qdTP2V9uG5HT95kGaPUUO4qQ+C1mh0rwgbXS4
         KqU+yGQdaOxdKMX9X1Xco/haFSXfZ0qfYu6BO9ct4iTuXrWsrNsATbd5r8YfUYm9E9CW
         gTs774G7G7bGvVnOYIgCgES1P0eByuTueqgv/A0tsQ5lY+qoEGObklZ55Od0Yd2PwteD
         2lJg==
X-Forwarded-Encrypted: i=1; AJvYcCXQUwKObVioprGeVUiDMqMfVO6aPKb4RdtgM6ByIax6eTcsefJzqsjckZu6hYaWjNalUmqq1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzL3YYxpvcTGARdSQGJWbxx16i9C9jzc6atCaRRMfqf39K7fflc
	SaT5JMioQqorrvDtfdgQDDdaNmAi/+6usL1PCDCrUKpmArSpb8kl
X-Google-Smtp-Source: AGHT+IGCGpL8XgY9O4we1vfDkxsryUCPguaJHl/7uD/PqNglBhxVGjPdAOM5ExueRp/VXl6sB8J85A==
X-Received: by 2002:a17:903:2308:b0:20c:e8df:2516 with SMTP id d9443c01a7336-20fa9ea159dmr19234095ad.42.1729658704219;
        Tue, 22 Oct 2024 21:45:04 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:03 -0700 (PDT)
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 RESEND 04/20] dt-bindings: arm: apple: Add A7 devices
Date: Wed, 23 Oct 2024 12:40:39 +0800
Message-ID: <20241023044423.18294-5-towinchenmi@gmail.com>
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

This adds the following apple,s5l8960x platforms:

- iPhone 5s
- iPad Air (1)
- iPad Mini 2
- iPad Mini 3

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 883fd67e3752..89c1e35e404b 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -12,7 +12,14 @@ maintainers:
 description: |
   ARM platforms using SoCs designed by Apple Inc., branded "Apple Silicon".
 
-  This currently includes devices based on the "M1" SoC:
+  This currently includes devices based on the "A7" SoC:
+
+  - iPhone 5s
+  - iPad Air (1)
+  - iPad mini 2
+  - iPad mini 3
+
+  Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
   - MacBook Pro (13-inch, M1, 2020)
@@ -65,6 +72,23 @@ properties:
     const: "/"
   compatible:
     oneOf:
+      - description: Apple A7 SoC based platforms
+        items:
+          - enum:
+              - apple,j71  # iPad Air (Wi-Fi)
+              - apple,j72  # iPad Air (Cellular)
+              - apple,j73  # iPad Air (Cellular, China)
+              - apple,j85  # iPad mini 2 (Wi-Fi)
+              - apple,j85m # iPad mini 3 (Wi-Fi)
+              - apple,j86  # iPad mini 2 (Cellular)
+              - apple,j86m # iPad mini 3 (Cellular)
+              - apple,j87  # iPad mini 2 (Cellular, China)
+              - apple,j87m # iPad mini 3 (Cellular, China)
+              - apple,n51  # iPhone 5s (GSM)
+              - apple,n53  # iPhone 5s (LTE)
+          - const: apple,s5l8960x
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.47.0

