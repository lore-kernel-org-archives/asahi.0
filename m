Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815034A8A24
	for <asahi@lists.linux.dev>; Fri, 11 Sep 2026 16:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145967; cv=none; b=Lwhx8Fp3/fdHgHe/fl/uZ5ZrK5x+19L1UUOqjtOY5/t+shMILszSOrycg0XEgSKpT4zJW4ZyF9y11IHphStfs90aqAJnTtF9lKBv6z9NToy/DIZHLkjagN8vgHA98Sfwu6ODMR9/sLc1DHTIz5T5omfQYxSYudLESsvNt2FNTtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145967; c=relaxed/simple;
	bh=czeNJJdVNPL8UxOkum6nDyYjfN+WvmL6awgYK1zopGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TOH2Pu+F8H4X6zguvXdshn1k+EYoInJutYdvd+dZaiNBXXPCsyBHEdxOoJHTGDTIu34Jb9BTEq7InvH35Y3nOZ8+i9B49bPaTdI4rP26MZFcZqfjla1n2hgEYbxdLx8HWSoTTIIz1+w3UDqq431iP7HzM9ysSrRSG+iTA1Ergfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=QYU6ec2D; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="QYU6ec2D"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1789145945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QhaWFx61kHNCtJzO3v3Zb7ybhjB0BIEw4dr94SHhlkY=;
	b=QYU6ec2D+zraPFgfIUKBDhDG6DSmlD0le3Jh7cacdIo/7Sra2+QoxG65wsYQDJq2SIbpQC
	//yWU98B2G5WunZ/S1LeRpK20mnDOBY1sqNsxHu/jliXPgSGMiH/wlZF3D+BbUyYvfbZ3U
	fqw+x+gAk0/o96pTDg3ZziDeDu/i+c8=
Date: Fri, 11 Sep 2026 18:58:43 +0200
Subject: [PATCH v2 6/7] dt-bindings: arm: apple: Add A18 Pro based devices
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-apple-a18-pro-initial-devicetrees-v2-6-08d06cf011d4@cyberchaos.dev>
References: <20260911-apple-a18-pro-initial-devicetrees-v2-0-08d06cf011d4@cyberchaos.dev>
In-Reply-To: <20260911-apple-a18-pro-initial-devicetrees-v2-0-08d06cf011d4@cyberchaos.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>

The MacBook Neo is the first MacBook to use an A-Series Apple Silicon
SoC. The MacBook Neo is overall similar to the M4 series devices.

The iPhone 16 Pro is based on the same SoC, but Apple does not allow
users running a custom OS on this device.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 5d87a4fef193..7c3e7131a5e7 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -82,6 +82,10 @@ description: |
   - iPhone 8 Plus
   - iPhone X
 
+  Devices based on the "A18 Pro" SoC:
+
+  - MacBook Neo (A18 Pro, 2026)
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -300,6 +304,13 @@ properties:
           - const: apple,t8015
           - const: apple,arm-platform
 
+      - description: Apple A18 Pro SoC based platforms
+        items:
+          - enum:
+              - apple,j700  # MacBook Neo (A18 Pro, 2026)
+          - const: apple,t8140
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:

-- 
2.55.0

