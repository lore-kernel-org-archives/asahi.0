Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BB233ADB9
	for <asahi@lists.linux.dev>; Wed, 28 Jan 2026 08:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590647; cv=none; b=RC6B/OwUSsp2iU8oi+76AFsfFLETbtjIqXcJgRkWWRZYVMeEhb8+oQVkRlkLOz8hbdcAQ6I95Dg7Cp0Ydtg2WxGR10bPKLRJvHgGvWGctlEVCf0dD0fvGYcMOS1QjnU0YiSMNB+eH8kM5uycua9h3lib02Kq5VZychGI2HQNIP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590647; c=relaxed/simple;
	bh=7rYWOaAxEQ+tfxwVBs89sgYINPPcGPnwXDpwGQLDa90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UAeVWhQiC3CFKOiBHoDseOmJh1+y8FLuNQAVVyrWLPlH5o4CBBzvLsWBe/pjetukU4HCuKTiU4eXNYFDHKurDCMiL7vElk0Bsmiay9hkQl3Jioz6AlXrT6DZ7IpasxlMiNZ80UxUCWsRoRY2Hh5hoyo4HEEhoi5ppbD8XUspYRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=dQB+h/Of; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LJ6XAOpa; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="dQB+h/Of";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LJ6XAOpa"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E00197A0011;
	Wed, 28 Jan 2026 03:57:24 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 28 Jan 2026 03:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1769590644;
	 x=1769677044; bh=twglajLaMcKJXIaeWkNCcw23EGh2UVEl1KqT873GAWg=; b=
	dQB+h/OfKyKIfKOIL+yt5oCxw2qAWjjDAMUhlCD7YcfaifcjnrMpdWaQ0Knwqcfr
	PUKqMOXRTY6dX5VvU0pMN0M4h4vcFag0B2sCO4WvZfmjk4rwqAsCFTppq9GVVpPz
	31470/pkwEvfToIclnbcBfZdrLijdRqLJ1B4SBLZ/cl17dKdNgfHJyju/7Z2QGQG
	E57PZdpN0DnlQZ3KxLnJsE+CrXqfgUACDTnnJq0PhrHV4C4XkZCaovjdJ0IF4uwx
	dAtZ8H/vfWd/awSgTTD/5l94+fEfJNOvhheEyFU0D9dTD9Zq9EYrlCugbf+bDUjR
	nfeGb6gMhtiTDS8vXcREiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769590644; x=
	1769677044; bh=twglajLaMcKJXIaeWkNCcw23EGh2UVEl1KqT873GAWg=; b=L
	J6XAOparXYU+YfrXjeZIG76paq/BYSr9yPONKDMfj5C5pHHNEzEbUBxTHRBXWhMF
	b3wz7PoLnoWrDRy4WGFnxO7QagCBV+XkFBM+Q1/CZCJ4THN3F8YSdXiqkDViEADM
	x3xlGytReJ9PFtCTmqCg7giJGlAC2qJA47LzgmCZk+GhnvfG4P2iYH9x0dzsUX7g
	xeO0m2viK0a8d5790Ul21fCjx1gs6N5oAGLT125hsotcklKSjDlD+8qFgSyqkstL
	aLICH9vKXsuhKFtOs6mYtWDAqJLetM5mMdwz5V65256jSmIdTckgM5j6u4edcK/r
	JfQ+34x+KBvGg4VGBaSWg==
X-ME-Sender: <xms:dM95aTbxr26LTsjltzMkLjMP0fNec6WaOc4lk7C3lruK4MKOSYAH2w>
    <xme:dM95aeOimSLd9EqpQnnnzUZ2n5Cn4OTObOXvOh5i85vP54KRO7RrgDoulmmz-bdx2
    PvxEg753ib7WLpwV7KqYB1JwUDkGfgbJ2idX1R09-EK0RSaNScgfnw>
X-ME-Received: <xmr:dM95aRWGV489QTlNFCNpLLaB4nTQtiHEc7wSNituzQx5Bt1bgvnevPUdVovoztrGuSMpP2MxG8L7j-0cqExNly8J-DqH0Rx-blQQyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedvleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepve
    ekgeduheegtdekvdeifeegkeekledujeelkeevhedvvdejtdeuveekffffheelnecuffho
    mhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghp
    thhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehnvggrlhesghhomh
    hprgdruggvvhdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopehr
    ohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghp
    thhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdp
    rhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:dM95aTIyxa6xz9Sqy8mMxePhzwqDf_hFpezUEGzpNnmKUTm9g_zw-Q>
    <xmx:dM95acrhsX2pPuYEQUuC9dCBSFBpTIQ_b0fa__AfvmPIXZKzLmxfFQ>
    <xmx:dM95aaxwz9I3wox1Io30bJC9xYltH3Dwg_cbl4PltCMEwEnP6gUWoQ>
    <xmx:dM95aQuPtvHTP__VG2UYErPWrfugKUwkjGPOljDoGxZE9Q-0LIzzzQ>
    <xmx:dM95ad7cRcyTOPVe4j56IUzmgd5d43D7H9mye5FdCqfirKox8MhmuoZL>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 03:57:24 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Wed, 28 Jan 2026 09:57:08 +0100
Subject: [PATCH v2 1/2] dt-bindings: interrupt-controller: apple,aic2: Add
 AICv3
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-irq-apple-aic3-v2-1-b4bc8e16c997@jannau.net>
References: <20260128-irq-apple-aic3-v2-0-b4bc8e16c997@jannau.net>
In-Reply-To: <20260128-irq-apple-aic3-v2-0-b4bc8e16c997@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3408; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=7rYWOaAxEQ+tfxwVBs89sgYINPPcGPnwXDpwGQLDa90=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhszK8wUR86+HPH6iki57Ki1E2rshJF9R1LQ2u+P/EdszV
 YE2VXc6SlkYxLgYZMUUWZK0X3YwrK5RjKl9EAYzh5UJZAgDF6cATCRDnZFhs0sLX+dWs/OsF+bM
 /y3LnmohUCv81DPcSnxuvWvpm475jAwXlYL3ud/VCf4cvuGTW0ddO8Pn3gvtCZPeaffaOBYx7GM
 EAA==
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
 .../bindings/interrupt-controller/apple,aic2.yaml  | 45 +++++++++++++++++-----
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index ee5a0dfff437816056bda0de5523bf38be4f49ba..a6e2251fcc111340c0a27ab6912452f6b1255be2 100644
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
+              - apple,t8112-aic
+              - apple,t6000-aic
+              - apple,t6020-aic
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
@@ -141,4 +153,19 @@ examples:
                   <0x2 0x8e10c000 0x0 0x4>;
             reg-names = "core", "event";
         };
+
+    };
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        aic_t8122: interrupt-controller@2d1000000 {
+            compatible = "apple,t8122-aic3";
+            #interrupt-cells = <3>;
+            interrupt-controller;
+            reg = <0x2 0xd1000000 0x0 0xc000>,
+                  <0x2 0xd1040000 0x0 0x4>;
+            reg-names = "core", "event";
+        };
     };

-- 
2.52.0

