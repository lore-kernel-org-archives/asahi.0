Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C69378D6E
	for <asahi@lists.linux.dev>; Mon, 23 Feb 2026 20:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771879391; cv=none; b=U1jAI8q+tnoCpJrBH1pib4HeH8M0DFjGscJPR8PIPQSsC1ER+cpx+OOYVHYadaRM6r91mYNdGAHYba4uTVvlcDu1PEwclPcpSDldARlrS21IFI/VCaVD1kznXP2fvhDjLUJvm+EUVGnyJF1Ez/zPfNq4iB3mPSxhzt6QHdzEcCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771879391; c=relaxed/simple;
	bh=VPp51MAprq4SHwLYa4jR2tbamWpYsJBUnZwXCjFFHyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lK/vIWuPZ9MxJIWGzp1uA7Y5Av09CLRu1ZUoWgtjSin+wpBwZDU2ySe/Yy5T5en+XtzwT3ZrVwpbqjKaSryTyRGfjsOqPKXgxWDLnFXJG3IFe1BUSiRMS51oHynfXpCnMdnRONtg/12naeDzQHxBrxCYoMmC+mgR8N9mzQR9Z6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=uV/BhH9o; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YtQOho/S; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="uV/BhH9o";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YtQOho/S"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 2DC4B1D00010;
	Mon, 23 Feb 2026 15:43:07 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 23 Feb 2026 15:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1771879387;
	 x=1771965787; bh=2t5MYacBIJ0oSRfavfmF+oEY6KVP3xbJMjc0+IDtQiw=; b=
	uV/BhH9ogWryPEni6gAnTAOISlDntYY8JDMttaqznKVHQKXJWsl+l35+lTA2PegL
	uzHjKRCxj26dpNelCDyf6S0MIDtU6esJkqHQ/xIWRlscF5E3UOEk2y4iMTik6eso
	2cJ4Wg6QbewzJx+cXiVUSP2czzOS+Gv8L8VqgqKO0EV6KmZ7YjIUoum/xXnapoSo
	JpRCsxvgvZq6UwXZqghEZpKZOFAZljy6Hf+QoHkUiUTpYN712BOuKDi297A+TZXL
	O3IFHxc7sdWdvyOGSgPJG/ISwtp5FchONhd0o+4rAk/OtMX3IorSBJF/R+KBC3Ge
	2kjO/poyNpptBU0jbHhj8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771879387; x=
	1771965787; bh=2t5MYacBIJ0oSRfavfmF+oEY6KVP3xbJMjc0+IDtQiw=; b=Y
	tQOho/Sqwc8yPbTCt38kF/twb6zfmUCHfutAQ02EbUnBEr+cqPBrjdyLJyptstIi
	7lWPOTPBRuU9822C4qEoUt19aAnMKcQRjvWm3521CoTnmUrdZ3db2COSDY8gflp4
	6jznMiLl5wn61+XcNEMcxeS4ubZaaCIDeWHRT9HdKKCU0frcExcusCqB9DKotQqD
	AaJ2gKf0XQSynvW1o/nIeuUd6BX1Fcx1FGxDBtI1xOqgSxw1qP/u4bcq/aZDqUHR
	KFhXWAZhAyrmflfjj/HbcFzBGV4+oRiPCrTXW2eoIGd9v1fV20KwNTYe0RZA0w3a
	xH1N+CIZw/nhMMbFMw9pA==
X-ME-Sender: <xms:2rucaahWfSI7R5qCWsb87ov0ms-ZuvGhuSLhm7RxtcVWRk4h331Dxg>
    <xme:2rucaW1ASpsW_zi-ZQmm3QIgSOmHru4MvX0HFGpqELmpN5TBdL9gWIpp_CpuREunU
    _V1v9LI1haDIbIEAKd6_Kmajza1SXrNS4_NEBahaCLMqFXg90MCdgY>
X-ME-Received: <xmr:2rucadeVTIc0gSLYf-Zj9fO0F16EzK7LLdYuYXLdrp8fgDVGkIKgpfZz6NOuz_B7uYXXAnCcBg39HM1qcrTzHkS-t85lLGGDJ3guzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeekvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepve
    ekgeduheegtdekvdeifeegkeekledujeelkeevhedvvdejtdeuveekffffheelnecuffho
    mhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghp
    thhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrohgshheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehtghhlgieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgt
    phhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplh
    hinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:2rucacwzHTEe8eUQmU4u98UAfsFi65bXOkeiRAeMNh-DU0nWxkCBVg>
    <xmx:2rucaVzskhRsIwzXAWAOkq3rI3JHAANZYMHzeONxs9KrxdAMvpN7yQ>
    <xmx:2rucadYcuJoI3jOuHDQ2kmEVcyQERSI9J3disaGRfBgbTLl5cAxpow>
    <xmx:2rucae2YLT13pmvzYKkxojH4CoalgG5xTWNv7uF4Y8Rci1R9UzdXRg>
    <xmx:27ucaUPnkVdNdqtN1Vvzig2He4lRxSB9XJ23sqdQdw0KCq_nIsdrm6bT>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Feb 2026 15:43:06 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Mon, 23 Feb 2026 21:42:46 +0100
Subject: [PATCH v3 1/2] dt-bindings: interrupt-controller: apple,aic2: Add
 AICv3
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-irq-apple-aic3-v3-1-2b7328076b8d@jannau.net>
References: <20260223-irq-apple-aic3-v3-0-2b7328076b8d@jannau.net>
In-Reply-To: <20260223-irq-apple-aic3-v3-0-2b7328076b8d@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2843; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=VPp51MAprq4SHwLYa4jR2tbamWpYsJBUnZwXCjFFHyI=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsw5u69cLi94t/Okw9sWz58FOf5V068VdFUclOaoEpvet
 sxXaf2HjlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABNxPsvIcJ55QThThZWcQ/S5
 03V/l3dN6VaMEQ78tCMvT1P2o3uvN8MfDq7QydPPXk21WtU/K/nW9qwJGjukCjma58jdj+Pov3O
 BCQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

AIC version 3 as found on the Apple M3 (t8122) is very similar to AICv2
in its base functionality. It can use the same device tree bindings as
AICv2 so add it to the AICv2 bindings.
This interrupt controller is used on all Apple SoCs starting with M3 up
to at least M5.
The only apparent difference is the increased IRQ config offset. Apple's
device tree codes this new offset as property of the "aic" node but the
value stayed constant for all SoCs with "aic,3". Since the SoC specific
compatible "apple,t8122-aic3" will be used in the driver this offset can
remain a driver implementation detail.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 .../bindings/interrupt-controller/apple,aic2.yaml  | 30 +++++++++++++++-------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index ee5a0dfff437816056bda0de5523bf38be4f49ba..d0d9a90e96e7ba899bd7c73ca7622939e0bd3451 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
@@ -4,10 +4,10 @@
 $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Apple Interrupt Controller 2
+title: Apple Interrupt Controller 2 and 3
 
 maintainers:
-  - Hector Martin <marcan@marcan.st>
+  - Janne Grunau <j@jannau.net>
 
 description: |
   The Apple Interrupt Controller 2 is a simple interrupt controller present on
@@ -28,14 +28,24 @@ description: |
   which do not go through a discrete interrupt controller. It also handles
   FIQ-based Fast IPIs.
 
+  The Apple Interrupt Controller 3 is in its base functionality very similar to
+  the Apple Interrupt Controller 2 and uses the same device tree bindings. It is
+  found on Apple ARM SoCs platforms starting with t8122 (M3).
+
 properties:
   compatible:
-    items:
-      - enum:
-          - apple,t8112-aic
-          - apple,t6000-aic
-          - apple,t6020-aic
-      - const: apple,aic2
+    oneOf:
+      - items:
+          - enum:
+              - apple,t6000-aic
+              - apple,t6020-aic
+              - apple,t8112-aic
+          - const: apple,aic2
+      - items:
+          - enum:
+              - apple,t6030-aic3
+          - const: apple,t8122-aic3
+      - const: apple,t8122-aic3
 
   interrupt-controller: true
 
@@ -117,7 +127,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: apple,t8112-aic
+            enum:
+              - apple,t8112-aic
+              - apple,t8122-aic3
     then:
       properties:
         '#interrupt-cells':

-- 
2.53.0

