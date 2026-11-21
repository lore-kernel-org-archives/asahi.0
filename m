Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266455;
	b=UwfEJXnZcgSv0m73KBNT/PGxigif3zUIO5nlCyA/N6U8T0j30JAg3TGxdy6FshPFwyfk
	 7mkd82BZ8OoNQzvwvs458NDut+KSdCGFyNCjBXA9V4Zk0pNYMJUb/XeV6pSOme3nyjFBa
	 D2qOgpJF5GMhyoDjsUcujz3I05qDMepKzs4TQ/6xCULQmYX+d7A3yHLf26kwMUe2FcGcl
	 xnkd9K9day8KH3JRbARSVD8t8Lk/wvz3+vW5iffFBsSd3YaCsW9Jd9w6tsJABETUOupwY
	 KI0bDcyC4TqNC8iwg9dsg0kpuETeosg6GtySx+g1e4BuplbsAeWnTaRK61hhf88IgzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266455;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=frQf8GLkcVGcswIAKYodbKDOsPiVF8c8ULwA4X1Wha8=;
	b=0/m+XtPgaG6nwYuNXvaC1kRP6CQGq12BI3ni2jMjCTBSCOvbAzu/9D/UMAdz2mxLrp4a
	 68J6pOcWrZSYW/LVwyR9p8JZgDZ857roxFOyCj+dFXMsCnVIQyNx8gJ+kRZa/T3ttmdjQ
	 6YmlWHowNTrGKSNewn7ac7uPw07Uz0dXKk+XkOJ7Ld8G2SC++xVsmOrQ/h5HL5B+RbTvv
	 3AmFpthK00WVDl9J3KJdZOgTQ6citN/Zsl6l7vpNGAyMEps1C4/EtfuiPQ4wl8mgeBacN
	 KnzbUJyEc+LC6NvmRUbJkW3ofONYYHJIpZ6AspGnIeaYrjkCl3WCvjVUzkMk2aGOCAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=NM3bT+I1;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC96606A333
	for <asahi@lists.linux.dev>; Sat, 21 Nov 2026 13:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC96606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=NM3bT+I1
Received: by chaosmail.tech (Postfix) id DB9391C8558;
	Sat, 21 Nov 2026 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795266445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=frQf8GLkcVGcswIAKYodbKDOsPiVF8c8ULwA4X1Wha8=;
	b=NM3bT+I1EL4loouUBDZTDD1r3cx3H8JOvtOGl2+TqZLzwBdrJbCJafG2vpb+JTWIHmLSW0
	22fr4YnfmGNkmXhWkQ7cZwlzDypdNmGny4Thumq3Yoxttv5sSY1KXXT8ELg1K1lBOYoG1x
	OE9BxO2KIOh6MsQVGPWaOoPYlzvfmok=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 21 Nov 2026 14:07:20 +0100
Subject: [PATCH v9 1/3] dt-bindings: usb: tps6598x: Add sn201202x/ACE3
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
Message-Id: <20261121-tipd-ace3-v9-1-9a2f1327a330@chaosmail.tech>
References: <20261121-tipd-ace3-v9-0-9a2f1327a330@chaosmail.tech>
In-Reply-To: <20261121-tipd-ace3-v9-0-9a2f1327a330@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795266444; l=3409;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=3D67anuuGjiqz8chLYGAhdIm3naiDe35Vv0iye7zhq8=;
 b=Tr3jCuQJnZNGFHPXKlk3HAJWMXpdSbBgvaqViBnok9cq2TS5vGn7iSlQod6+UhoUxI3Dkd0u9
 EVFA2dHNvN/Dl+iPAJvdHFQK6bYWZu1imvKNZEGJUR279lXL8WIXonZ
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

A variant of tps6598x that is attached to a SPMI bus and is found on
Apple devices starting from the M3 series

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 .../devicetree/bindings/usb/apple,sn201202x.yaml   | 78 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/apple,sn201202x.yaml b/Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
new file mode 100644
index 000000000000..133a71bbedb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/apple,sn201202x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments sn201202x Type-C Power Delivery controller
+
+maintainers:
+  - Sasha Finkelstein <k@chaosmail.tech>
+
+description: |
+  Texas Instruments sn201202x Type-C Power Delivery controller
+
+  A variant of tps6598x controller also known as Apple ACE3
+  present on hardware with Apple SoCs starting from the M3.
+
+properties:
+  compatible:
+    enum:
+      - apple,sn201202x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Primary irq used for tps6598x events
+      - description: Logical register selection completed
+      - description: Standby command completed
+      - description: Wakeup command completed
+
+  interrupt-names:
+    items:
+      - const: irq
+      - const: select
+      - const: sleep
+      - const: wake
+
+  connector:
+    $ref: /schemas/connector/usb-connector.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/spmi/spmi.h>
+    spmi {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        usb-pd@c {
+            compatible = "apple,sn201202x";
+            reg = <0xc SPMI_USID>;
+            interrupts = <11 IRQ_TYPE_EDGE_RISING>,
+                         <13 IRQ_TYPE_EDGE_RISING>,
+                         <17 IRQ_TYPE_EDGE_RISING>,
+                         <19 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "irq", "select", "sleep", "wake";
+
+            connector {
+                compatible = "usb-c-connector";
+                label = "USB-C";
+
+                port {
+                    typec_ep: endpoint {
+                        remote-endpoint = <&otg_ep>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..6bf3e8f35095 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2736,6 +2736,7 @@ F:	Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/usb/apple,dwc3.yaml
+F:	Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	Documentation/hwmon/macsmc-hwmon.rst
 F:	arch/arm64/boot/dts/apple/

-- 
2.56.1

