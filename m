Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB741A4AB5
	for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 16:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762585; cv=none; b=QZT7oiFtJpGBM25Dx7400kExqtpNxm3xFx+NGJ7MH557tDm+n/SYV5gPpWF5UgoAnXZiabwRnYN1ER6Rhsw8iSY1Rmnx8N4x1dbDYKPnbF57fD4qv5/Dm7kIjcFkCwAvmcpkCfjP0ANKoCM/lw1ackpb9vOXJGVh094GyT4jcNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762585; c=relaxed/simple;
	bh=yX9FGeOAafgayJ0c4XDJye7eSl+sIm8pgWg4SGBRWHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tr6oX85ozBPxSpDS0Bu7t75uypdzbFAgjsDTCA+nvoBWtTZIXQO3wAdKTyHgrAz4kjEfSN6It0CR7ETctPcpBZpcvwnVuGuU+BGbpl8/yffYtgKW/YaUd7x1d/W/cZL9qgtBbU3+3o9mf17ubn9aoyZV4MVeMXaKJMfmSBAYnH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHjVnZ8u; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHjVnZ8u"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7db4f323b12so580354a12.1
        for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 09:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762584; x=1727367384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxoytMjm/HXsXb2InFhsXewedzAR4yfvch8/uf3Wzb0=;
        b=lHjVnZ8ukCv0lPHGp1mt0s/2/1ivjlj+rh6iq0F34KT/jPmYcvS1ugUaVbrDAQ+LjB
         /HXyaeZIw29MDAFZW89v1lJCSYaVaA6Jj+vUrewqFf9qfkWdL5b7dpVGSXZrY/8lvG/c
         916gG3iotg555uQsGDGNWvt8xYW8NJFAcNEzDgOkZ2SghRgbH8qcPRt285a6aBW+kd3C
         a4D+STOK37M6/4sck7hes9iQ/Bnj/d71twg8QRvv4bmRJpdSs8k+IkUCb8HMzz3sxtKr
         LfN0P/uDArqHppZIzy1PifwHxhbrfy66ecCtI0prp1srBDPlgXHciRC+Iq/ZNztTexCA
         BuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762584; x=1727367384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxoytMjm/HXsXb2InFhsXewedzAR4yfvch8/uf3Wzb0=;
        b=QPxYUpqRroGsg5t++2c5HRA4QXh8KqVBy+Y2/uSXnMHoKdc1x7KUMGpqCCd6vbezwF
         vLmflAqeO4irpODVfyrevx2O6LAzDWwhyHDaq4qhLjFjuEwmImKYTrjzhNk1XHBg63DT
         C2DwRoM0ghwntf7J1fu6jc50KNcow1nclnSnz0EcWC1lIaall/5se1H5dK3c3L3e7rww
         S2AoroA4L91kxZRRzvd6sM5lT76AS/+l3962Pppv4i0Unef4O9/lt9+zleNIv3OYsjPt
         qY74ZVx78pQO65vxduYM5Ol2k4lETRtHdL85PpPUQgWVOdZgoGYQDY673Ru1nHFlzRew
         Hf6g==
X-Forwarded-Encrypted: i=1; AJvYcCV9PjBz0mU6bWceg6r4s9/Xkrw2tYH3JwZrRn+wjEeFi7DeAN/YEQYlmgvsYyeuTLYDFhZUUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPObFZpuuGLIu8kFnmJFxs1DOw4JsR8ZSCkThfIqfthuNYjZfC
	c4I2Y7ydqfB5TlsaSk4HAitpvATYvG2vwZX78361qoZdDGkyy95y
X-Google-Smtp-Source: AGHT+IFRMpng/YbZnXcqjdDyySe+x1hLs/kbmol2k16G7QkiAxl2R2k7DP501VtCzDXSISUcF8W+9A==
X-Received: by 2002:a17:90a:9e1:b0:2d8:8bfd:d10b with SMTP id 98e67ed59e1d1-2dba0067ffamr27168183a91.26.1726762583570;
        Thu, 19 Sep 2024 09:16:23 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:23 -0700 (PDT)
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
Cc: konradybcio@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	towinchenmi@gmail.com
Subject: [PATCH v4 10/20] dt-bindings: arm: apple: Add A10X devices
Date: Fri, 20 Sep 2024 00:05:59 +0800
Message-ID: <20240919161443.10340-11-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919161443.10340-1-towinchenmi@gmail.com>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the following apple,t8011 based platforms:

- Apple TV 4K
- iPad Pro (2nd Generation) (10.5 Inch)
- iPad Pro (2nd Generation) (12.9 Inch)

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index b6a2916fb0f6..96efadad15a6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -51,6 +51,12 @@ description: |
   - iPad 6
   - iPad 7
 
+  Devices based on the "A10X" SoC:
+
+  - Apple TV 4K (1st generation)
+  - iPad Pro (2nd Generation) (10.5 Inch)
+  - iPad Pro (2nd Generation) (12.9 Inch)
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -188,6 +194,17 @@ properties:
           - const: apple,t8010
           - const: apple,arm-platform
 
+      - description: Apple A10X SoC based platforms
+        items:
+          - enum:
+              - apple,j105a # Apple TV 4K (1st Generation)
+              - apple,j120  # iPad Pro 2 (12.9-inch) (Wi-Fi)
+              - apple,j121  # iPad Pro 2 (12.9-inch) (Cellular)
+              - apple,j207  # iPad Pro 2 (10.5-inch) (Wi-Fi)
+              - apple,j208  # iPad Pro 2 (10.5-inch) (Cellular)
+          - const: apple,t8011
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

