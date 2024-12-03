Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1FA1779AE
	for <asahi@lists.linux.dev>; Tue,  3 Dec 2024 05:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733202731; cv=none; b=Y2+U6Y67RGpj76qQwHnBkZQ4UHsksslg/3iSyF6+INmddedqA9eSDMA528aarL+8UTR8hXXBs1YGJ9ytTz8sDjXJ5O15/r91md3Vuc137dFhj4PYUpJh6Ncyl/CrhAwQmAHLIWJSfsb5kFpL+xv8IWkdhFi79Dk5NDKCgTZ0L1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733202731; c=relaxed/simple;
	bh=kBlnPxGq6ChsufaUKBSLw6uMgtG56pxCd36D5k6/w5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bANQjvMoqE2DLr0nS3CvUDEHZEW1ih0w5RffhpTyYZIiq3V9W3f6xvOBExJjjNtVkNXZe+98raCzsVo3XMVsr1SJ0i1NPDBLCbUFQMLWu/ryuVJXuLSnn38CCPVAJbEeH/hHZQ00LEXMMwIwqTg2xsf7S9Fg0x/cavVzzhZLyYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXdWjyyM; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXdWjyyM"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-724e6c53fe2so3783934b3a.3
        for <asahi@lists.linux.dev>; Mon, 02 Dec 2024 21:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733202729; x=1733807529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbp/SL17C/U69/mM4spr+KWpbV3+Jo5FoO9b1T7Q5mk=;
        b=BXdWjyyMAwEJTYhsnqgGI9hjpi3/+phbqQ9dIQGCau0qNt4/yFrr9Qc9eDeAYMwzhC
         uU+icXP3B/DL8sVl3/2SFjsWHvZDyb8z5utUzABRGDSIfnzM2OHRWDgSjk1chDstzkcQ
         2WoN7en3BcZeAQGhVEDGtMwrL5HkOfFozMBH+I6ZcJriZJeP7/AoM6x7yzxfPFakF0rt
         2vFUydsG8lzbGbuyww1wl69rab6h1gk+ivjBHtkRzI0dTpr7Uni1EB76wdwhlav6WvmR
         OgJDPhl871cVoaAXVFxb77IYqUkWxp4AHAfuZ5ExloTFXBPlHtBft8jrWgMWZBtL293F
         FKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733202729; x=1733807529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbp/SL17C/U69/mM4spr+KWpbV3+Jo5FoO9b1T7Q5mk=;
        b=JusoF6oQgrsi8r9zN/Nt87v654eSo9PneYi9BF4lzZWhgKkLWJu4+POVp4JaPei+oB
         F6WL5Vm8LdjiDBaGxpP9DhGNa1b37+6II191Vr52Xdqcux5QYC8GbR7yprbIP5lyzdPH
         iiHKzLE+iGbOn6L+PDrEwnfYWpbrJV+HqQP6D1LpCtDIn1oPjLnE4DA8tjjGrlTdYGUy
         WgjQUbgklXqgE4gTVK/5Jdf5mo/oXgC3wl5VSDqdpNP70Auz6dx3sCX0M+DABWpZgtgO
         /h364p3U4OdfkaWfpFt/Qa81xODelj/710hPsa/Z3uI3pbMDB9Bcb4Imuv/30j+k43VQ
         j19A==
X-Forwarded-Encrypted: i=1; AJvYcCU2RT/haN7sIMrRTfqmmnR9vxmai+Kcs3B2uBWtI643HTioTqe0iX1iiVt86qsRqSjyEbnrjg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/IRN89/M15jW5iVn/1E6KLnQobAFoGokAXN4pjd8CGfvuLycE
	IjbiQC+O0h12OAC+9tczzQTpd3l15kv9zTrjUSAD64pECrxHwo3Q
X-Gm-Gg: ASbGncuS9+WkZb3nJGJ2Ai5Ax2NmrLKFPsSn3c+ob6OuCAS6AXwa87UlPakfuTBBPi4
	6v1am3Wb1lCAK6ySIFQ2h/yFWVO0zvLnYbSebJel5OrpX92H3cEhyJYvEDCJt0lt2sxnbBJAfZz
	TWeohHQBlpXagkkwgz43wYpV9PccpqgghxXNU3KLpvp2Um9w16c9ZlYP/gaANFZm8WpNfl/iqVH
	WhsCikTttPxKGPn8OFL45mkIidUQwILEk02iZ9FGDmgvpJupuTe47Y/8B7FvU2wDQ==
X-Google-Smtp-Source: AGHT+IHa2D6F1wVcNR9basJsPDGbsJTvLncGUr3XXRt4xi82659gCSs3b7qvxB6i6firh4TNGuWY5g==
X-Received: by 2002:a05:6a00:1893:b0:71e:7294:bbc4 with SMTP id d2e1a72fcca58-7257fa753f8mr1643490b3a.13.1733202728883;
        Mon, 02 Dec 2024 21:12:08 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72541848916sm9525047b3a.172.2024.12.02.21.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 21:12:08 -0800 (PST)
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
Cc: Aun-Ali Zaidi <admin@kodeit.net>,
	Paul Pawlowski <paul@mrarm.io>,
	Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: arm: apple: Add T2 devices
Date: Tue,  3 Dec 2024 13:10:27 +0800
Message-ID: <20241203051147.110980-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203051147.110980-1-towinchenmi@gmail.com>
References: <20241203051147.110980-1-towinchenmi@gmail.com>
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

