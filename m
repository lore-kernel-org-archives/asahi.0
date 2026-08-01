Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A540A3D1A82
	for <asahi@lists.linux.dev>; Sat,  1 Aug 2026 21:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785620500; cv=none; b=t6b3NaoYfJXyERJBCtdddJctfQ5AaPGI+5MOd4jt3IFHJBjyGTDs+nuN9Jr+XEZXc7Siw6duSozq/6RM0xvNzU+SHczlbhvvEHSs9P792y6uy1TgDehFa5bIS/Pk9T7UIQAL/Lfb/oo29X/At6rZ6yzVJsL9cw698+8/amU1DUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785620500; c=relaxed/simple;
	bh=16/IQBiW659eKUP3JuGp4+b6DM+b9yBzYf8WnTo78IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uMD03WOvD9caXWt1cfbgvEdK1XzrNg2g6yGkhgmjhvjbAbOGxwzkREBuNP3GnC9/uquGYiU4ElwC7l6DpJdi+67hNjZ3uZ/4DDLis4Iq1WrF+XG5MIuoFMU9C+iCeo/jse9O9v5is5sKJJYHvUC/8sRZJawKKDu6dom+PJQBXCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=OYgp6U1I; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="OYgp6U1I"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1785620496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CGRI0yKrp5VIRC7CP/TE5VvduSX3IVkuXzRMbTq63wE=;
	b=OYgp6U1IZAHoSbhr0ESmdU+YzF9VK1XiM4+0hmvqKtUTClSeeagpPgTbjl3MZwLNUsIMWs
	PHLHTXQlFp9K2jm+bh5e2OlTmjBzAZf4Mo2m6Jb9yUjWcvNLlki5m28P7IMhHZEVShU1Uz
	lFKiv8n0LkY20clrSKpBC/hla8HM2Hk=
Date: Sat, 01 Aug 2026 23:40:38 +0200
Subject: [PATCH v2 8/9] dt-bindings: arm: apple: Add M4 based devices
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-apple-m4-initial-devicetrees-v2-8-5cb07cc275da@cyberchaos.dev>
References: <20260801-apple-m4-initial-devicetrees-v2-0-5cb07cc275da@cyberchaos.dev>
In-Reply-To: <20260801-apple-m4-initial-devicetrees-v2-0-5cb07cc275da@cyberchaos.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Hector Martin <marcan@marcan.st>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>

The Apple devices with the t8132 SoC (M4) are very similar to their M3
predecessors.

In addition to the MacBook Pro and the various MacBook Air and iMac
variants, a Mac mini is offered again with the M4.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index fb277c96f341..5d87a4fef193 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -103,6 +103,15 @@ description: |
   - MacBook Pro (14-inch, M3, 2023)
   - iMac (24-inch, M3, 2023)
 
+  Devices based on the "M4" SoC:
+
+  - MacBook Pro (14-inch, M4, 2024)
+  - iMac (24-inch, 2x USB-C, M4, 2024)
+  - iMac (24-inch, 4x USB-C, M4, 2024)
+  - MacBook Air (13-inch, M4, 2025)
+  - MacBook Air (15-inch, M4, 2025)
+  - Mac mini (M4, 2024)
+
   Devices based on the "M1 Pro", "M1 Max" and "M1 Ultra" SoCs:
 
   - MacBook Pro (14-inch, M1 Pro, 2021)
@@ -323,6 +332,18 @@ properties:
           - const: apple,t8122
           - const: apple,arm-platform
 
+      - description: Apple M4 SoC based platforms
+        items:
+          - enum:
+              - apple,j604  # MacBook Pro (14-inch, M4, 2024)
+              - apple,j623  # iMac (24-inch, 2x USB-C, M4, 2024)
+              - apple,j624  # iMac (24-inch, 4x USB-C, M4, 2024)
+              - apple,j713  # MacBook Air (13-inch, M4, 2025)
+              - apple,j715  # MacBook Air (15-inch, M4, 2025)
+              - apple,j773g # Mac mini (M4, 2024)
+          - const: apple,t8132
+          - const: apple,arm-platform
+
       - description: Apple M1 Pro SoC based platforms
         items:
           - enum:

-- 
2.55.0

