Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B201D6DBB
	for <asahi@lists.linux.dev>; Sun,  1 Dec 2024 16:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733070006; cv=none; b=FnnvvPd4Uj24F0Jn1IZbMkWsQXEwz/IW581M68tk4Gp+xFEfliqiPmMyjA5Yq2fpWAFJUNcJviNHwp9jAkOjrUSJkFgz7If2LOSQTkXLXTXdkJYAFMETEM3s+DGsViO/Yc1MJpYdalT4mJLU47loIp2+9DBtFUkcSxmwRZIqGZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733070006; c=relaxed/simple;
	bh=Xty3yyG4uw16PQiYRVBL79Q4Zlkljc4oAAhNz8vKzKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5NhAma+Ecrg3Sgp15WQKOHsWjxTM7q9dExpvW6BcdDeDKRRxPxuiYZuJ8U82GVKKp5ufKl7WP7vF4neugbFIUEYWbSQg/m9rECZ5mtunIo8WblFh5jkUWdWJaylg6H4vWp++97iT+AvZt5eNaIgZT24bPk3WXOCrbaa8vQsxLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZqnn3FI; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZqnn3FI"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee6c2d6db0so1494109a91.1
        for <asahi@lists.linux.dev>; Sun, 01 Dec 2024 08:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733070005; x=1733674805; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzpydyWYDeRq3YCadaVmg/DECTRQ6H8rjbCBdAJ5buk=;
        b=YZqnn3FIT75kujY1l+ACc1WTwFoOYvFhVp6pyRXA15bgtcGKQcUpPkxt/UrM0rYlmf
         QAHq6Z7Cfy0p2M8L1vXzMijeF4Wgs3H7gFOaWfXAPdZoOHtmGyyafb7BzK0e+jdULzSq
         j1wJl+Qr/c95vP5nX1hHaM9PmKgoBwoFMrDmTqXvUcs7JFn1DRY9HEcemrQR7BOiLg0l
         IRRizUp50zIgfxlVsR6d83kCuYfvHaRwpvIftUrCmlsvHw6G2qhNcl4x24wPEj5KYYlv
         /zVJ8pbfdxFAFLSCtlxeKlhWFgY130IWC2rPgHJhC6ALjEHaTViX0jk5lVksLqmpeeX5
         B51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733070005; x=1733674805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzpydyWYDeRq3YCadaVmg/DECTRQ6H8rjbCBdAJ5buk=;
        b=ei5iEFABhDja8kb318JDtN5WLRrikgXxIe1FxTnVJ+y7EmO1R0i9sSmNBc/KiEgC8h
         lQ0cR78oP1uBvPjqZ4UfuH5YBJ24N03T/BcUoI30wJ7YPjE58kZlDKLRn92E5FK3M0v1
         MiP3xynyKMKoQpeJihNWSV871KIdBjxnkWDEE8Jbh2cDuJFYhgkNv3VC6E68PprnlFWh
         7XDsI4PDE48Z/LOYcpXQg3ok425ypzxb4p4NUyljcsI2HvZtKJ75xpKKYoqdT/Hr0G19
         hP0B1YrpBuN7JIRgv750/3TuiCfMp2lGgp76MC+efLnlGxl3IFkH6/s2Mit+BLeT6eB4
         vLlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3s/gw7tuFoLGmD+MsRXFaWIiYO0BIlG/i1ZdyX8HCSVckmTCsjBbYf9+0OTPy7JweiGpCVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTnvgfDBeeO7zT6035x69AiFafi/epy918oLv+7iqRG79IqVxx
	fHe9Y+EGBoygWaSWXFBt5/fS98JMJw1IWm+ZgjNMS34TZVwWAzzAvZXqTg==
X-Gm-Gg: ASbGncuGJkg+eKvT/lEWKMsQmGfmQdnyOpnNQ5Aoyq4edMpNPRBrQN7TrEuMnVRqbwk
	E5ZmUUO+tXmMTMKxnpiJZGnVL7LZ1zGfRuqnbDl9Dr5h2Las53DlJYp9b5XxU0WD/ucmFKlzjqm
	AUKZ5ZKGM58giFrgvPEVIw6PAsBS5/o7NXISadED7bzYkqS4SwPRW3avwSWBzDlutZUQzHE50ef
	ytX+sbbTzU+a6tR5VOPrfv0oORTkAmGR0805ShMPpmCJxg5h6EeFNbdV3EXCxmhAw==
X-Google-Smtp-Source: AGHT+IHq9b8W+oSYCY1CBrS1ggU9W4leeGRpQXf5UGHbqBGatazOzI4Ta2e2XSmCmZ/hxVKKjaERsQ==
X-Received: by 2002:a17:90b:4ad1:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-2eeb2e64643mr3056803a91.27.1733070004725;
        Sun, 01 Dec 2024 08:20:04 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2ee78834450sm3007392a91.6.2024.12.01.08.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 08:20:03 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 1/3] dt-bindings: arm: apple: Add T2 devices
Date: Mon,  2 Dec 2024 00:18:41 +0800
Message-ID: <20241201161942.36027-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241201161942.36027-1-towinchenmi@gmail.com>
References: <20241201161942.36027-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the following apple,t8012 based platforms:

- Apple T2 MacBookPro15,2 (j132)
- Apple T2 iMacPro1,1 (j137)
- Apple T2 MacBookAir8,2 (j140a)
- Apple T2 MacBookAir8,1 (j140k)
- Apple T2 MacBookPro16,1 (j152f)
- Apple T2 MacPro7,1 (j160)
- Apple T2 Macmini8,1 (j174)
- Apple T2 iMac20,1 (j185)
- Apple T2 iMac20,2 (j185f)
- Apple T2 MacBookPro15,4 (j213)
- Apple T2 MacBookPro16,2 (j214k)
- Apple T2 MacBookPro16,4 (j215)
- Apple T2 MacBookPro16,3 (j223)
- Apple T2 MacBookAir9,1 (j230k)
- Apple T2 MacBookPro15,1 (j680)
- Apple T2 MacBookPro15,3 (j780)

These devices have no offical names, the naming scheme is from
libirecovery.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index dc9aab19ff11..da60e9de1cfb 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -57,6 +57,25 @@ description: |
   - iPad Pro (2nd Generation) (10.5 Inch)
   - iPad Pro (2nd Generation) (12.9 Inch)
 
+  Devices based on the "T2" SoC:
+
+  - Apple T2 MacBookPro15,2 (j132)
+  - Apple T2 iMacPro1,1 (j137)
+  - Apple T2 MacBookAir8,2 (j140a)
+  - Apple T2 MacBookAir8,1 (j140k)
+  - Apple T2 MacBookPro16,1 (j152f)
+  - Apple T2 MacPro7,1 (j160)
+  - Apple T2 Macmini8,1 (j174)
+  - Apple T2 iMac20,1 (j185)
+  - Apple T2 iMac20,2 (j185f)
+  - Apple T2 MacBookPro15,4 (j213)
+  - Apple T2 MacBookPro16,2 (j214k)
+  - Apple T2 MacBookPro16,4 (j215)
+  - Apple T2 MacBookPro16,3 (j223)
+  - Apple T2 MacBookAir9,1 (j230k)
+  - Apple T2 MacBookPro15,1 (j680)
+  - Apple T2 MacBookPro15,3 (j780)
+
   Devices based on the "A11" SoC:
 
   - iPhone 8
@@ -211,6 +230,28 @@ properties:
           - const: apple,t8011
           - const: apple,arm-platform
 
+      - description: Apple T2 SoC based platforms
+        items:
+          - enum:
+              - apple,j132  # Apple T2 MacBookPro15,2 (j132)
+              - apple,j137  # Apple T2 iMacPro1,1 (j137)
+              - apple,j140a # Apple T2 MacBookAir8,2 (j140a)
+              - apple,j140k # Apple T2 MacBookAir8,1 (j140k)
+              - apple,j152f # Apple T2 MacBookPro16,1 (j152f)
+              - apple,j160  # Apple T2 MacPro7,1 (j160)
+              - apple,j174  # Apple T2 Macmini8,1 (j174)
+              - apple,j185  # Apple T2 iMac20,1 (j185)
+              - apple,j185f # Apple T2 iMac20,2 (j185f)
+              - apple,j213  # Apple T2 MacBookPro15,4 (j213)
+              - apple,j214k # Apple T2 MacBookPro16,2 (j214k)
+              - apple,j215  # Apple T2 MacBookPro16,4 (j215)
+              - apple,j223  # Apple T2 MacBookPro16,3 (j223)
+              - apple,j230k # Apple T2 MacBookAir9,1 (j230k)
+              - apple,j680  # Apple T2 MacBookPro15,1 (j680)
+              - apple,j780  # Apple T2 MacBookPro15,3 (j780)
+          - const: apple,t8012
+          - const: apple,arm-platform
+
       - description: Apple A11 SoC based platforms
         items:
           - enum:
-- 
2.47.1

