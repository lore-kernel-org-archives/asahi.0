Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95BB20371D
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 11:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583116; cv=none; b=S5u1LNRlpdQJMJPkXO6KohnlBaa3QnT7OgaHFsRTLHj4htyhapeYIIxDHWGGPZM+7bX7J50ujHQQCqGSVP+q2h+BkOv+DARJHVivxJK6iiuvDyhIZYadJz3dxbyIGAPKRciDttqQP9O4SxZ8y/DfOhCoXrAH10Lic+EcPbUUeOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583116; c=relaxed/simple;
	bh=Xv/IvcTb6EDLOIXRTfoQ1wIHxjilUWznCaYG6P2I/gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pedwqBlSv2yd8Y2TcSGcg8id3tB3XObiOqpf+QwGijWggM7rTg9eC5wj+uYmsPCYpaXT+vPtdB1gsdVx1va2aNECVJlqcQGvWpViGIUXjH0mFcaTu1prPkkgCjNnrnwSOinWOWE3R0CBnlbrJ4tDiiyiPvYPCHpSxJfw6qYxZLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnl8/9eo; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnl8/9eo"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so5397367a91.2
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 03:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583113; x=1739187913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j94Yf4ZljPIn55Egi5iO8+J8Nze+hzJTmB3wDQVymRc=;
        b=hnl8/9eoaw3ePX8McJWst8CCKgKI3JjX1CuYi58h+9ZzFWdaKh4Sc+4iDfinp4VKUJ
         24F5Uk/khhyKndIuDfD57bJlxZm4XsiKO5aUFzyLOiijRhzuUqalQKiw2QEuQitcKG7N
         kPfsvxMdqwsom6EB3YKsyN7dO2p4xS1nKcUH7YKGYmK46QkE2b5ZMeljASJlkKaSDu+J
         YKeV1rGnk4XiXb99hSP83W5lac9JJHX5sQ0fL5NCzzqy/X60IEtI1pFMfdVNaI138wPE
         77yXaq1uvK9eCf5ScLSo6wPqUmRuzofGgCXKWZynSugnSGzdJ+NlrdXz9eQIuyGfa2e4
         cg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583113; x=1739187913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j94Yf4ZljPIn55Egi5iO8+J8Nze+hzJTmB3wDQVymRc=;
        b=Y0PA1J3cnvt1kctEV/QO/c8WhV3BN8b3glCKAVqumZInkQQZ4nNE5HWYZ7K8rR9J1e
         gdLW+0TZ1JuSGYMEclm8PtzhSBC1zuVYy+kfSIdT0zG5KEWQTjRwzcxzn9GiXVXsMqjs
         z17zGYa7X3Hk+LbMtqrhHW0YS3DFoZr5vxnWeDJxKzpeNJe+cND0R5gA62ti9SYOfQX9
         kcWbbXLHkfUoV87nr4e64GmlD+tBeHZQfHQ3gGM8QhqJLarjqRVwOLQPViQJLi4VZTdt
         1f3oeLsRbexkC9pwbFYF/0D5ADXMi+XrOBeVmChDHxBjggG/gvRU2aEKOS0i4/nNFRMO
         Ih+g==
X-Forwarded-Encrypted: i=1; AJvYcCXCfhxdnX+R2lpAsTzcd86hb0muUrcwd+0WLyVB609zxN/a4/y4BBHKGiaznHVj8oco8gT65A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi8hXa5XxELx08q5fJoUSsuqVevXCf4SVTkuLj9VvfiPBy8+nB
	Fwr4fgOX4WyINaN6uY29N8pXbFOVmR+2mB3n52Qc6UaacxrDILxl
X-Gm-Gg: ASbGnct9dEUYyO05fciR3gazaSlEfQ4ZQLWya5hXLrJBaTkerLucJmzIuhRqG0q/+pG
	E5BndJSLMysJxV0paWIK+qWYJ+IltKdQD68Q2DTt0UoIg69fQTX0Y67hC4Mi+h4Fwqid4Qj7o35
	EqaPeuE4B9NopQQ62JYiljC7cWghKV5bHeMMfoT+mWSiJHDEDVTHyo5u87KUFMzOQXTTUMC4Qkt
	INnM1g4oWTcV3RXBrDuChy2In2na6sYXtCNm/Dj4pKaUo15K0iwB4vUk1agcxObZpHJtO2TU93F
	jgrLP38wVQDisdTn
X-Google-Smtp-Source: AGHT+IFnveO9s5+KK6gY4LWAb4g+uJSFbjRZNtLOZaf363lRPvUyR79U3NW2XRf8Dv4Bb1w/KxOYGQ==
X-Received: by 2002:a17:90a:c2c7:b0:2ef:33a4:ae6e with SMTP id 98e67ed59e1d1-2f83abd996dmr37969938a91.12.1738583112982;
        Mon, 03 Feb 2025 03:45:12 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f848976d1fsm9712490a91.3.2025.02.03.03.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:45:12 -0800 (PST)
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
Subject: [PATCH v3 RESEND 1/2] dt-bindings: arm: apple: Add T2 devices
Date: Mon,  3 Feb 2025 19:42:52 +0800
Message-ID: <20250203114417.16453-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203114417.16453-1-towinchenmi@gmail.com>
References: <20250203114417.16453-1-towinchenmi@gmail.com>
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
2.48.1

