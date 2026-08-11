Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C71E4746DF
	for <asahi@lists.linux.dev>; Tue, 11 Aug 2026 20:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786481402; cv=none; b=MpuWk7aThwtF1EnoBpUaq8U2izPWRywHAiNmR4jLu6wHrUdpQHpg9ANP0TYJ1RBtLCw06zSn1dmU8ErPTeBt7Ch8Hw5j0wRWVzkiXkX0Xz2RV67ojQRDg+ez5lUAnLCXb7K6WqRkJm+Ax/Ru9Y7Z7zLgB4s/P7sWKMEh3zOo2G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786481402; c=relaxed/simple;
	bh=35Tt0PNbKahNCGU4k4xMLPjJIWxKVW0sgdcX/9WVW7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+wVF0w+RaUtuCcOdCG9OvTEvlxvQAnGwAgOAoSX6C0DEcVh8rzQ54eOUC9KMImkCSDIdgi/whq3fKA5v48sXcLo0ib1psXnQxKfn19W/n/8fVaBYLOJKytU/E5wNKGkHybbhtLiHhfKBK5clJrTkP4DOXBKkRFTsgPxVn9kpG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=xcpNcv6r; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="xcpNcv6r"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1786481398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zWgebfTo+zH4rv/0W8syIrgWklYULrmOZZ7dxgV0NL8=;
	b=xcpNcv6rP+jccLZRxcyOFlFyrH4cftZpwiJx18fsx6YQqQYXjMVqlsMoAARkz0Kbpj8v9U
	ycsmSy/a5LE2YS7WiEWc+VtcH0LzaVk0P3HFZ+f3WE9kOitSPaWRCyyBnaYb/hfEVixaWF
	ceZ0f8Qni0OhT6qno+2bxrRSoETMYow=
Date: Tue, 11 Aug 2026 22:49:47 +0200
Subject: [PATCH 1/2] dt-bindings: nvme: Add apple,t8132-nvme-ans2
 compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-apple-nvme-t8132-v1-1-865be32e42c3@cyberchaos.dev>
References: <20260811-apple-nvme-t8132-v1-0-865be32e42c3@cyberchaos.dev>
In-Reply-To: <20260811-apple-nvme-t8132-v1-0-865be32e42c3@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-nvme@lists.infradead.org, Yureka Lilian <yureka@cyberchaos.dev>

Add a new base compatible for the ANS2 NVMe on the Apple t8132 (M4) SoC,
which uses a separate MMIO base for its NVMMU.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 .../devicetree/bindings/nvme/apple,nvme-ans.yaml   | 77 ++++++++++++++--------
 1 file changed, 48 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
index 4c0b1f90aff8..c8a41b268b9c 100644
--- a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
+++ b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -16,6 +16,7 @@ properties:
       - items:
           - const: apple,t6020-nvme-ans2
           - const: apple,t8103-nvme-ans2
+      - const: apple,t8132-nvme-ans2
       - items:
           - enum:
               # Do not add additional SoC to this list.
@@ -24,16 +25,6 @@ properties:
               - apple,t6000-nvme-ans2
           - const: apple,nvme-ans2
 
-  reg:
-    items:
-      - description: NVMe and NVMMU registers
-      - description: ANS2 co-processor control registers
-
-  reg-names:
-    items:
-      - const: nvme
-      - const: ans
-
   resets:
     maxItems: 1
 
@@ -68,25 +59,53 @@ properties:
 
       The SART address filter is documented in iommu/apple,sart.yaml.
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - apple,t6000-nvme-ans2
-          - apple,t6020-nvme-ans2
-then:
-  properties:
-    power-domains:
-      minItems: 3
-    power-domain-names:
-      minItems: 3
-else:
-  properties:
-    power-domains:
-      maxItems: 2
-    power-domain-names:
-      maxItems: 2
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: apple,t8132-nvme-ans2
+    then:
+      properties:
+        reg:
+          items:
+            - description: NVMMU registers
+            - description: NVMe registers
+            - description: ANS2 co-processor control registers
+        reg-names:
+          items:
+            - const: nvmmu
+            - const: nvme
+            - const: ans
+    else:
+      properties:
+        reg:
+          items:
+            - description: NVMe and NVMMU registers
+            - description: ANS2 co-processor control registers
+        reg-names:
+          items:
+            - const: nvme
+            - const: ans
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - apple,t6000-nvme-ans2
+              - apple,t6020-nvme-ans2
+    then:
+      properties:
+        power-domains:
+          minItems: 3
+        power-domain-names:
+          minItems: 3
+    else:
+      properties:
+        power-domains:
+          maxItems: 2
+        power-domain-names:
+          maxItems: 2
 
 required:
   - compatible

-- 
2.55.0

