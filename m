Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C9E189F2A
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 07:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248884; cv=none; b=k4hIGni6f68Gt8ECJ8QkU3eMyE/LFmvkWWooO8MLwVPEiffMjnG12t6QVbFSnHA8YnBGUdikniJQBMJRCQtlXDj2vAzmAvyW/RR5QDeP8WXDs2xfkvX5wvPO0S2mjk2eFMi4bm/J/SroWUbJhVoyNmdGTe/x1OFkV5L162YS3mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248884; c=relaxed/simple;
	bh=6UE5luBJ4zEL1AXe5UiNe+h44DRAjdXD3nJ4OxS/kog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvAGLSKJedQI+7O+I7iGRMi3HcetNDvG7YcARQA/Jp2avcggm+ScsYo7rb41lTzhdaZeVXL31Ku5I45UmrSaW7DNaJ/lmw31Yb7/8bzIfyMj18g0dYfQc9QwM+8hzJXazN5QbQeBfJnCDRnnM/fQofMSD6o6rOksueRjRHbMvjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOjo59xb; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOjo59xb"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a0c8b81b4eso23254555ab.0
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 00:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248882; x=1727853682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORCGcbSwKgWFHAVRm/UYQifm4nQpWQfHLfuPNDrl1Eo=;
        b=WOjo59xbc9sfzLkScyd6I/mpjCB02ium5obvywPitK5ceKexBL3SdXB9iR2g7x3+XU
         idR9FW8KSLTtlz66m5TMLlC8vGS3d6J60oxyaAFVGpdmalHPp5bMQAPlXLAe8VeyDd0N
         O7ufFDfSghSqckr9v7AwalahblvB456tgxGt85stYnzAxABwajlcR44TcCLpCJfjx/DI
         SyY7Y/EKt4RbG3ZIcrz+pDzroRCw2ap7GZwLVAZKXbmk9Q7Bd2wchAaOdEln4p3wRHoM
         isGZw7oeOY3rytwUA5DIOH4iAVdB0qbDQFIRjJGXJPIMmKOg1myr1aVyp5yzUVP6LM6q
         cykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248882; x=1727853682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORCGcbSwKgWFHAVRm/UYQifm4nQpWQfHLfuPNDrl1Eo=;
        b=Y+VTk2Lf2UKcY9f/HqfC0b15uYBHW5WQl/lr5YTY+wbO+JWbypmEdeddd1IPR68b+6
         r4VO/pbLoq5eCqBNwe9akNQ8UsSzFJcstMdK8lz4NufLPvJ/mOLobZkp8mZ6lmf9XNSw
         XHyRuQWdCFMOasbAVGVFzzr2Pkx4wQA+lFSbMSgkkVqf0e5rVCyd1qBqVAggvlSv5d0o
         UvJjJbMerP+i81SvqKlJyKiXOqk88njcnY14zxcdNrAJv/hJBAc3Wz9OTW/l6d/Qbh5Z
         RmFr3jB1Id7x9s4dQrTb9jKOuEdn4JzcM8c9sEMW3mbVY+WtXDENOaByoDL6WqlGcRwd
         g0kg==
X-Forwarded-Encrypted: i=1; AJvYcCVtXHmKzIR5DP5u4lthjFiUEcTxJJNcwjgerW6ZGdL69CyVDPDYYvswC5P/3nhZI2hEbfh8dw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyjJgSY1xOE4mtjdbfRcC1UhMEcmeJAvtwHUZ+uaUTbZsZrGzQ3
	rxM5EYu3fB0W0fSOBbv+VPNLBDCU4nDGV6++QPfdZLIf0ClXVelz
X-Google-Smtp-Source: AGHT+IGz+nBPKU/0ZQZRn4iIi1Zpl8XNNeYysGdEscn0nqTGqEHb35M1Eb0BgRB+lLd63nxO2NUglw==
X-Received: by 2002:a92:cd88:0:b0:3a0:8eb3:5154 with SMTP id e9e14a558f8ab-3a26d6ef162mr20639305ab.4.1727248882421;
        Wed, 25 Sep 2024 00:21:22 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:21:22 -0700 (PDT)
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
Subject: [PATCH v5 10/20] dt-bindings: arm: apple: Add A10X devices
Date: Wed, 25 Sep 2024 15:18:08 +0800
Message-ID: <20240925071939.6107-11-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925071939.6107-1-towinchenmi@gmail.com>
References: <20240925071939.6107-1-towinchenmi@gmail.com>
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

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
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

