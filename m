Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1430A190068
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734888793; cv=none; b=MkWEuQOd5ElnlcIXHBKoMXLBjMcvWXo2Ose+qcge+zY0mihp44leTaOACg+h8/88YrlRaYLd9UW9Dd9H/DElJIPDEDlTvMZxhDbNiyCW5Wq52auQiGt1qDcTqPdiHu9/ZP0B5/6BkEVcC5UMFpAJxhT9Et3G49l1X0CyYFOP0Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734888793; c=relaxed/simple;
	bh=kBlnPxGq6ChsufaUKBSLw6uMgtG56pxCd36D5k6/w5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JkrGZ613Bt2hl0yEWHAawGi5Yn6jTqo/9oAW9OTNXL5jlBmj6vER1G2/5BLIZImExo39NlGMOBqMcQWvbVEEkYhxNWEtL6yO/fs/Tvqnau9IGEzU5f9AKVQhCExzF5+aBcFDXFG6Dt8ehXBWbnG6SLWHtf52WfWqAOuZTjsG1/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acvQUkCZ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acvQUkCZ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7ea9739647bso2241851a12.0
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734888791; x=1735493591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbp/SL17C/U69/mM4spr+KWpbV3+Jo5FoO9b1T7Q5mk=;
        b=acvQUkCZzCdGB4gC2/FOb12Zj5BeXixw/VTOPZVDeKmJT+Lbnvw/uo5C8zljJpKPaU
         5aykBeNP2opEEUp6ynTbvMhgoWroTktdk9WKB2dDZFAS9BsSZPgBO1wEpCET76e0ejWG
         Xw9CfKgpni/X2hOiCVoTNnN3Gcjl3nuk1WZXH3rvE/0uRPSFA4l/6A9Uk2T0LpKzpzpM
         QW74rvZNnzxs3M542WQ1PWRiirM23ksGgMr2/h2ho5zgeB5ZbRJs/LCDD9FxO5U17+f2
         kLogc8yV95jfOi/Xis9CJ6+OuAv7IY4f+5xe15Od+u3v0PJmXhIjDuzCwG+zdZYsAly9
         WNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734888791; x=1735493591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbp/SL17C/U69/mM4spr+KWpbV3+Jo5FoO9b1T7Q5mk=;
        b=Q5buxXMpiSWBDRpjMESqi2O1bALZcib3lq/lsejfJnlnamnJc0gV28l6eU9LDT3PLZ
         jnGOkcR9DOroKAtbAWtZS8QmT007n0bB6nRDhrqkWg3UJzxC7vTBfmuJEn2h0suzWwVq
         Y44GarrB9OotR0LIcBGyeaXrrScE2OuyIXYNa3+UyPqtfrl0zDsHRkm5XwoembGNS+62
         5dugLZWqVcFOiwIW2iuSAv/P2k/NNdMwEvZmMquLeUU9YyWc84/W80XvFOFP92rx9s26
         g69khzsDre1oNGXbiPw7Tdb0ygFQap/2ygFyALn34Lj8/r9WrHbPop2Us+2BbewogakL
         1pJg==
X-Forwarded-Encrypted: i=1; AJvYcCXlndg0X58SrsUlseiU/FIpwxT7BqSxwwVLAZ8WaLYg4EGGNox4fesP+IWXvxa9buPruLsRAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBQMRZbnezA89dEbDGlsWJWBd1lolCB/uE8sXcK0/qFycyT8bD
	01T25XWKVUWqtXL7RZ9OHzT4bnWZ/drTVW6hoa9G+2UT0HgFTFA06eqyz3Z/
X-Gm-Gg: ASbGncvBT6QIhwxgaBdUOQN9OoDCU3qzx1w0fkyKDKIriJ9+l0qLkHejWGhJNuWmC/D
	9UVsoUTeROeIIM1vUGl8z5HTJVgsplg4g+CCA/WSQM1IywinNYS4PITyReUaoV1JKa2aiuqbOS5
	DqyD1DTZPw+Thht63C1epOTDuSr9EvRWDJIBDa3aExv8IeQpck/Pr9EHXtF+sPFqQuCbimlahCn
	cWnNHGDrv74X0z6n/Xb2YeSZilreBhwRebvgXnZ9emRE4Z/axZf/yA5fw==
X-Google-Smtp-Source: AGHT+IF6wbar4suVMRQ0O12h3Yid2CT3e7XUhszkGbE1EDv1XAzZ3CHXjwf93+a2afmynd1CqIFgXg==
X-Received: by 2002:a17:90a:d004:b0:2ea:5dea:eb0a with SMTP id 98e67ed59e1d1-2f452dea366mr14830664a91.4.1734888791364;
        Sun, 22 Dec 2024 09:33:11 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f4477987f4sm7567552a91.2.2024.12.22.09.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:33:11 -0800 (PST)
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
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: arm: apple: Add T2 devices
Date: Mon, 23 Dec 2024 01:31:47 +0800
Message-ID: <20241222173240.147675-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222173240.147675-1-towinchenmi@gmail.com>
References: <20241222173240.147675-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the following apple,t8012 based platforms:

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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

