Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E023ECBE4
	for <asahi@lists.linux.dev>; Wed, 26 Aug 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741620; cv=none; b=OUg9dRCxGukQ51tjHX7qo+KyP7i/g0NnAo6Z+oTH5acsObRhqoU9LiPqaK3TaTXRPOkHhgS7a9aLuSzUWm/7rAZ7W05DXfVnEvfJSql9bTribzHKlMzSjzhETW1xhFovnYTYcThZI24aaO5QIMjCv5pTyEBxjq/YieUpyLc3cJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741620; c=relaxed/simple;
	bh=S8rAFC4kXT2BBExVLVQG2pMHEqohecFIGxPB3nprXVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o3L09twKJWCZ/r4P3hCzVScEXxhA+ydBgpU4ISVhTeMs/icUN5wmxeJQ87JKrv/ISa80qc/woK6J9I0je3Qw/SOEQXv29DGdkzceUEwdpTuEZPQbrivnTkLSsbi798YhtsiCGJJSq5uf2iRTlJIJu85Dn1DpW/JPERNCiVFS0kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=unKI4LXC; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="unKI4LXC"
Received: by chaosmail.tech (Postfix) id 8BD441CB869;
	Wed, 26 Aug 2026 10:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787741583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6AjHsz8ywMeNWf5nPv3DrZzyk1diaThBgEcH9zvlRBQ=;
	b=unKI4LXC7CMDfZ5z59N1Opvyw/dI3Kt6FWtzR9XLipVSoeTa8gGvd2vEbt176Enh11gjij
	SgnWFJ6rQzxVAQ4fZhl45Qty8bywolB5LSvnGGhTCgrqNz340tdQ9jJ85v4V355yfO6zux
	yxIXFxVjMRpTMalZ109eugYvaLhaitA=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 26 Aug 2026 12:52:57 +0200
Subject: [PATCH v6 1/3] dt-bindings: usb: tps6598x: Add sn201202x/ACE3
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-tipd-ace3-v6-1-e919f39a93a2@chaosmail.tech>
References: <20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech>
In-Reply-To: <20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787741581; l=3467;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=S8rAFC4kXT2BBExVLVQG2pMHEqohecFIGxPB3nprXVM=;
 b=jeBwNWUxb5QTmeLK4sMYR7rUtXPX6JfpxozSpEMhd/Q3QwUqkrlgElqiddw/9E97CA6LI/2cG
 quJDcUeFwMACrb0RpChdrPjAnubXIUPi9YFtBnAI9LKWKdpCKPIYvjy
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

A variant of tps6598x that is attached to a SPMI bus and is found on
Apple devices starting from the M3 series

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/usb/apple,sn201202x.yaml | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                                |  1 +
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
index 8014b9f8253e..62030ad60baa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2610,6 +2610,7 @@ F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/usb/apple,dwc3.yaml
+F:	Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	Documentation/hwmon/macsmc-hwmon.rst
 F:	arch/arm64/boot/dts/apple/

-- 
2.55.0

