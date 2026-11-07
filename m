Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794083800;
	b=M7gqhMsd9fYYK37mucygdBO7TKa7r/QZgh+xc5SEklt+An8YbiQwltGrmneNbIChB8pR
	 nXvp4A0ZNABwBu71E42kLtF1D8V+u8yqIwu1/6HBUK4q+JVh/4ew1RHOz2E9vtx+T+a2g
	 XgERJ62a4sQmf4YxI10HJC89zzmKlLJXxaRZqx0KFfY8wh07w45NfE3n24bKPfer+xuiA
	 6e9Iyo50DatagnDE7CkxQy3lMPfHGXDIdVvA0jXFBqGbNdQhOR9dMnsOo1OJtrgIi0XJ6
	 BtLWoijMAAz/fwABjYBrhHpFEt8m+ivnS32ywXlo8+yNwHYaPUefVnEhs2q2hEiUvTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083800;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=C2sizMumrU6ZkmgLRCVGfCVsT99H5CNjhvx5bAA7wsY=;
	b=kRODCXrZFqG8qtuKWY7M4q6ZjuOodXWFlVZHaTV+/Zbytxdf5LI5I/rV5iI86uoRP/ud
	 rDTXQEECDLlnqLRCYNCDbsERPgJNsZyZwha1YVNwATwKka5GdbwoHTiYvcr5T7ydMT5CV
	 Y9alLxVRo4DX3U5iX/6Pgddsf5hjCEMZR2ufUvaUi4MuGKGN/LOb0fJ3IEAp3F19tb5WQ
	 3TISEH776+hvD8B1SnbeLwYb8fa9PLxqoyJS3dZoZNgyh1DQHy4O6seJRH7dpbByIGbQF
	 6xVoil4uVgbvZqzMUK6LvBB0rP+kMvsGRNsqvDJDQ+OCOy9rtlUHCcZgYC6u4c1t83g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=LkAf2X5V;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C15606A332
	for <asahi@lists.linux.dev>; Sat,  7 Nov 2026 20:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C15606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=LkAf2X5V
Received: by chaosmail.tech (Postfix) id 629471C9690;
	Sat, 07 Nov 2026 20:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794083791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C2sizMumrU6ZkmgLRCVGfCVsT99H5CNjhvx5bAA7wsY=;
	b=LkAf2X5VAvOKqnQ8ej4NhLF2T582iEg0Xdg3J3OdDkbnb5OcMv6GiICLgK8ws8zLmir1G3
	1ynBCFF8ZJ2er4uttL/UAe1krJIPy3OdgpBv/ByOgNfmYLli3DQRNZlVSPsEg2uhg8J3Qt
	Kp79yIshf6+Hbnji4LMfSAU3u3Jy0Pg=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 07 Nov 2026 21:36:23 +0100
Subject: [PATCH v11 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-t603x-spmi-v11-1-322490215f58@chaosmail.tech>
References: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
In-Reply-To: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794083789; l=1683;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=w1uF1sHRL6ww/RmxY7obycFKrx9sLGMqFsMCKG2iCz8=;
 b=9N/LH6P0QJldMuPlVKH0Ue9dShBgGSQnDpOga7GZ6ZFr7rPuW/5OlcJMjd6VEI7o3FoJ0GPc1
 M5MMtV7pyFxAKHuvJ190sSg1GGV/LnEIZzJCn+dVdCv1/NvopChg1q+
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add t603x and t8122 compatibles, interrupt support, and support for
SPMI controllers that are not always-on.

Reviewed-by: Janne Grunau <j@jannau.net>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 .../devicetree/bindings/spmi/apple,spmi.yaml       | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 3e5b14bc8c31..4e73083ecec3 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -20,8 +20,11 @@ properties:
       - items:
           - enum:
               - apple,t6020-spmi
+              - apple,t6030-spmi
+              - apple,t6031-spmi
               - apple,t8012-spmi
               - apple,t8015-spmi
+              - apple,t8122-spmi
           - const: apple,t8103-spmi
       - items:
           - enum:
@@ -34,10 +37,36 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+    description: Optional, operates in polled mode if not present
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - apple,t8122-spmi
+          - apple,t6030-spmi
+          - apple,t6031-spmi
+then:
+  required:
+    - interrupt-controller
+    - "#interrupt-cells"
+    - interrupts
+
 unevaluatedProperties: false
 
 examples:

-- 
2.56.0

