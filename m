Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F12318EDA
	for <asahi@lists.linux.dev>; Sun, 25 Jan 2026 11:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769339335; cv=none; b=J4B7lEKidm5xnHJCMsuP8mRNW+UDTNzafjl47Vw3HA27s5fJKXalm8igY9U8Ea/SVTMN9QmhY8pbjC4rKqEmyYwEafghFpkogXWFcCJRXsybDuixS2QnM9gxfVa01Liw3eQBSlRrH6LOalNXKaoqVEBztJZH1QJP2NoyqtxYxF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769339335; c=relaxed/simple;
	bh=OGf/6Av6ZnPvenFYhFMArFcQMVsd6I41zueCB57vIS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAxHLQaF+gxDfNMLR3Y8WMz2b9LgUYJyRJcdMLqZ2uCqKOfZnOkyrY2RsNJMkXwlHMDnRzSx70+dGKSw9SYBSCNXUH2ypdvLNsXncITAEJXuP8V+2R44t48T8boQtpgk8pknOec6of5J//YzY2CC3Q05Zzp9wgkoY8+l+vD0iXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=kvLkia+e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Aus89Iwl; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="kvLkia+e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Aus89Iwl"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6E2D87A00CD;
	Sun, 25 Jan 2026 06:08:52 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 25 Jan 2026 06:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1769339332;
	 x=1769425732; bh=5kpH4wQV8PoTtsba9S5RoxQovxZYouvp9+g1QSdN7QM=; b=
	kvLkia+eXac00RfidtCy0+LfjVNVwLfow7V4j8LmKxAnyNRmkv3rODHdDkKgRFzB
	kNvZMWnzpNZzomfrTx5VDHKW+JyVxcxHIQEObhNV5VjzQ1ThhuCNoG3fv9aByz6z
	a6bG/1TCawDGxrDztHmVnUOJsWiV9Jgru0ZQwkYSb+2ZSg4HKVgkvDQIJ0MiUg4l
	Wbd2qJQSr+OBohFdV9qYgBdr7eBMDbccLD7VKqBvMvbAT890jHv13zO2o5Ila7BY
	Fex3j+ZJrF2f1orMdRHiol2Io0Gn5FalzTj9Mo2BMJ+wSHl1S7pIwTDcf703Wn9z
	PuDpj2UWzIUtNb2vu3vIJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769339332; x=
	1769425732; bh=5kpH4wQV8PoTtsba9S5RoxQovxZYouvp9+g1QSdN7QM=; b=A
	us89Iwl8J6V7/xs3bzVv+Pg7zCzMuX4ItzIYQzfcD+o4M8wBF6uzILN2SC8K0452
	7oZcTxp5HBwUDWC7kAkmgZQ7VF5QHrht/huARMeXs2KWm20Q/cLq11AKGD66hmLb
	QWD6SJqnlnHYx8ca6704SrZ+oog89mBbyDQu4/4EtAy7S68cl/cE3s5+SIfGNJK4
	BjCPt7hWtBRBD/4/SsemCwL2p42+9lji8t5lcR2wMDGF7z4HRUYz1DPTJXgJ+mZ/
	YsauiJTEwc0C3VVxfhaEe41ZYanRZOvX/VABDiPl6CxRhRJtnytrEAq5gYS9vBHD
	VMbDMXgjbzpJy9bEm322g==
X-ME-Sender: <xms:w_l1aaC2Th1QBcFLOys5yEqazrYUa4LxBLYkaTmRB0Ovy221BDDDcw>
    <xme:w_l1aQXtSAsyBdlC0Ockou_AYIGwJblfClY4QjM1G9WWeTUwyZO1BulCyIQwcdJuP
    IsSCg1RKjx-heLgIpMIHuJuXcaM-jY3zx6STqSkdIUfMwN1ZCXnkhnn>
X-ME-Received: <xmr:w_l1aY-i7PEuSMSPluQIk3PeDZgwDIaVFb-2ucVuwpxYTjdz1Qei3hewLEsWsOepVbMhKhGVITGtHAEqZ5iI4OhehXUpahZadAuMQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheegieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepve
    ekgeduheegtdekvdeifeegkeekledujeelkeevhedvvdejtdeuveekffffheelnecuffho
    mhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghp
    thhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtghhlgieslhhinh
    huthhrohhnihigrdguvgdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgt
    phhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:w_l1aSTuT6xqv9959zaUgLb_bSUNe2Nc_LtttEhoH2Pq87369sl1tg>
    <xmx:w_l1adRTtzWqOnAwkJ2gn4fxQ4MV3M6fHr4FZsk2AOJfefmbJcie8g>
    <xmx:w_l1ae76zd5u0b7Jir0h8WwBtWBQjfqnzxtyBVyH6ct3e0ftlHhw4A>
    <xmx:w_l1aSW5Jm5XNkdwTy5Kv_j4xLKjmxIlqMe_2GSKcbZ5i914bskuVw>
    <xmx:xPl1aYBes0_TxMjRIDjCW37lhdQUAp0TMFNHA8U3srovbruNYc7QbVOP>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 Jan 2026 06:08:51 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Sun, 25 Jan 2026 12:08:45 +0100
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: apple,aic2: Add
 AICv3
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-irq-apple-aic3-v1-1-a2afe66a6ab9@jannau.net>
References: <20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net>
In-Reply-To: <20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2809; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=OGf/6Av6ZnPvenFYhFMArFcQMVsd6I41zueCB57vIS8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhszSn/scbp7J2PU4hLX0/jaNHWm7tl0t+M7wUcxD9cO64
 Ku/Dl7O7yhlYRDjYpAVU2RJ0n7ZwbC6RjGm9kEYzBxWJpAhDFycAjARN1GGf2aGf0NNvLM8OuxU
 JRKE+gwO8TzklS8+1Ba3ZHbBpvZ9XxgZFu54z/nv/9O6tcXtc3nkejzYkz13PdKUenGJd9eyRg8
 zVgA=
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
 .../bindings/interrupt-controller/apple,aic2.yaml  | 29 +++++++++++++++-------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index ee5a0dfff437816056bda0de5523bf38be4f49ba..933e134d82bb599a68707ba34e04ea55d61050b9 100644
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
@@ -28,14 +28,23 @@ description: |
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
+              - apple,t8112-aic
+              - apple,t6000-aic
+              - apple,t6020-aic
+          - const: apple,aic2
+      - items:
+          - enum:
+              - apple,t6030-aic3
+          - const: apple,t8122-aic3
 
   interrupt-controller: true
 
@@ -117,7 +126,9 @@ allOf:
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
2.52.0

