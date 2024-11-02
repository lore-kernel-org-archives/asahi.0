Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49EC3B7A2
	for <asahi@lists.linux.dev>; Sat,  2 Nov 2024 01:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730509841; cv=none; b=QlytIfL0t8G4DZFccYcdVjSTs33bejpzymaVpRhOGnfK18pX5l3/QUMcFmJi4RoL/bMaqbKY9zlD6GtLMnYGf6JfZE/oWCBvgBIQn0z5vi2fpoe6reZJD15OzUB+F5EpB/T9gWj/VWD4PMbSQDRAE3jJH47N1/8grkga8McmhVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730509841; c=relaxed/simple;
	bh=XEarR1V/wSScu1ltyWhNi5l0HHJogogwRXsmiHTLBfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TEtvcOTWNIdps+NQBXTsDbB4S+Qlk+82vTRxbcV6wrxsHStja0eEwIhzguF09M8nmDLRHJmL/nwD5j3TGPiOH3HxzpyYYyoxO/WHmFuOVfq+ooPiJMCneoGHTYQ9fHfMUcOtiZl/5x22J4AuUnOErnWpsuVwmgsTM0Pi/0yeMeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PL0eX03M; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PL0eX03M"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-720c286bcd6so1824180b3a.3
        for <asahi@lists.linux.dev>; Fri, 01 Nov 2024 18:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730509839; x=1731114639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7y+F0NAVhdE2hhGdAP0Oqd3utvxnAK6BbO2jtHkbzc=;
        b=PL0eX03MD4Fnr+emzCoXON7XUBpzB1ClcbrdwOi1wyRKsBSvTi+5kaKSHwFPC4AR0I
         cxuoBgnb2v1KhJOmECTeI39GrnPKpi9OFbwpE4b8kolT5Y06BU4wgxCSqh9RUNZAFbiC
         0lipPWkRxAOqoEu3Eu4uK0ODDh+yLuZthI4fHw6qciTZm4cWjtzbuG4K4OibY6VXxUG2
         JZRmyqq43Lzgl2IA4x2CtlkcTbOS5ZuplEm8wi9MiEzUMAU1W8jsZ2RJAL8NtYPUxUrI
         h/iMY4ICMfYUdqHDhOM2Y8H3PbYdZlm5Tzpwu7D2Py4ipLf9U4p0dg8pDTRzXpVZCWs1
         p5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730509839; x=1731114639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7y+F0NAVhdE2hhGdAP0Oqd3utvxnAK6BbO2jtHkbzc=;
        b=GSPy2TLv1Zs+0WUST9ZkS8nQKFLpA6kn3UQp2nmdbEUrthdx+8fkXdXZoI1sga/Ing
         7El+QutbLlbfzpWZbIHskeI0KbV8Nwh77q5CVYlS/3sBusijD/6d39YqD+rPT8+M9a/a
         ji3T0GW8fprA5IJPgGHE60v6N239La82/8mS6ZbLF7D/A4HlezHBLePyxyW1scpoAtrq
         mIB0clrf5aFFPJ4w4GepAuyubsM8/wBeeCwlc0aU0x7TNsTjZ6QcRNZ0p88eDbTPjJCD
         BcbXfFglLjIqm7QBMH91qLZzJiD7nnj6CyHPpk8iy8y5bU5/l667WxPeKS4QtZqmdG76
         aM0g==
X-Forwarded-Encrypted: i=1; AJvYcCW0ptPt8lQXcP7dEl5e+PCDmUfXnxQvt76+aNOVeRoX4U8M6MUX+mQtGH/y+d9letJl+cwnbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYCpUFvZqxj2V66hj2DLcjwLsi4jtD0rkRHkov07slbistCJrb
	DdyJlKnBrQ3rdvCPmNZPMc3aiGDaEFDkAUp1opwVAuGkUFRhQl8J
X-Google-Smtp-Source: AGHT+IHcjcSgjEuTU6hZ1FVroEwjdUbcKF4FmsEf33q13uuam+xyJW6LtKMG454Bq5g6GFRLp/acrw==
X-Received: by 2002:a05:6a21:6801:b0:1d9:3a26:4396 with SMTP id adf61e73a8af0-1d9a83d6622mr32470596637.12.1730509838976;
        Fri, 01 Nov 2024 18:10:38 -0700 (PDT)
Received: from localhost.localdomain ([49.130.42.137])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-720bc2c38adsm3287708b3a.133.2024.11.01.18.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 18:10:38 -0700 (PDT)
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
Subject: [PATCH v2 01/10] dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
Date: Sat,  2 Nov 2024 09:08:23 +0800
Message-ID: <20241102011004.59339-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241102011004.59339-1-towinchenmi@gmail.com>
References: <20241102011004.59339-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 673277a7a224..5001f4d5a0dc 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr
+          - apple,t7000-pmgr
+          - apple,s8000-pmgr
+          - apple,t8010-pmgr
+          - apple,t8015-pmgr
           - apple,t8103-pmgr
           - apple,t8112-pmgr
           - apple,t6000-pmgr
-- 
2.47.0

