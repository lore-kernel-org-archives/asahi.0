Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5280826C39E;
	Sun, 23 Nov 2025 21:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763932816; cv=none; b=KJ1mNJ2xM1XKgrZQvwCdYUxyQW427a3eHh10uNqmpXoRJUQ1V3Bc1p01LkVMmg1oFGAUebShMpFXt98cVWXN0pP+UHF2jjZESnOF60C1nQQnpRfuWP24m1oD9qkDJCYFajHipLxlCZ1ZEs97iAGoW6PETKt3ZLcHHlDj6zTLgUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763932816; c=relaxed/simple;
	bh=UY7J6VyGGrEhcO5ZtexRvHfQqxIEECEg7cNeJiefLlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2qmqUZ8IsacCI5WNhzCEUGEjV9XI06kEvRQtopyOUg7g632GNoJhOMjLrp4bSMjKQ2HLdKPnXSAlnep68IUpyAk1CVSU9Bvia+LbueG4d6oYAGct8a65tneQ7EiQyJE5pBKsV6QHYNKe7uAz/kYyEWEc3R1vRHCcvOQeWEE63w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLNC8xRP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLNC8xRP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF993C19425;
	Sun, 23 Nov 2025 21:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763932814;
	bh=UY7J6VyGGrEhcO5ZtexRvHfQqxIEECEg7cNeJiefLlM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WLNC8xRPFLQUADN0lPZ3/V6+Eu84fYbu+vVeVuXzUyEZs5FeFTLQU9kOMYrEE2u13
	 XB9OOymaA9lru/lqOyQtSK8sl0+SJKbhVaMjyd6aOecUcgy2mBSvr42CFxCeFJYTjW
	 Ja29tAibvbZmr6fXukq8uuQo8nU6BiRIOSnw2NW6j5lLi7A0tVppqkHX6OazkUJYdX
	 N7ge6G6qoS14evlbY5GAt+l0EbAmZFYeTWfWq4U6IYonaEaX90qSTn8zC1RH/BfRG/
	 LJTw09bfjCJ09k/6/WQoNVjpa/DKZiUoAlDq/CAg52y9F9JFebEoM5c4DXPCAIArzX
	 2AhyOwxMNdMSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AD0CFD31C;
	Sun, 23 Nov 2025 21:20:14 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 23 Nov 2025 21:19:55 +0000
Subject: [PATCH v2 2/3] dt-bindings: phy: Add Apple Type-C PHY
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251123-b4-atcphy-v2-2-34cc7092b22a@kernel.org>
References: <20251123-b4-atcphy-v2-0-34cc7092b22a@kernel.org>
In-Reply-To: <20251123-b4-atcphy-v2-0-34cc7092b22a@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8195; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=UY7J6VyGGrEhcO5ZtexRvHfQqxIEECEg7cNeJiefLlM=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ6ZyVWfc8Y/Relu3iVS0TFz/5NJftevi4Z7VFT90vpQo3
 T3VV+vRUcrCIMbBICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZiI4EKGfyrN85duT78Z7qO8
 LUbeKsfZSpzx92y7k1GGXn7OWj5rkhj+8Jw8xhcWc6j+iNeNLkXRDad4biQ2/vYNf7/otWzx8eP
 2TAA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Apple's Type-C PHY (ATCPHY) is a PHY for USB 2.0, USB 3.x,
USB4/Thunderbolt, and DisplayPort connectivity found in Apple Silicon
SoCs.

The PHY handles muxing between these different protocols and also provides
the reset controller for the attached dwc3 USB controller.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 .../devicetree/bindings/phy/apple,atcphy.yaml      | 222 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 223 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/apple,atcphy.yaml b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0acac7e3ee67ef2f03ffe1e04b0ac0fb414af362
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
@@ -0,0 +1,222 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/apple,atcphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Type-C PHY (ATCPHY)
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+description: >
+  The Apple Type-C PHY (ATCPHY) is a combined PHY for USB 2.0, USB 3.x,
+  USB4/Thunderbolt, and DisplayPort connectivity via Type-C ports found in
+  Apple Silicon SoCs.
+
+  The PHY handles muxing between these different protocols and also provides the
+  reset controller for the attached DWC3 USB controller.
+
+  It is designed for USB4 operation and does not handle individual differential
+  pairs as distinct DisplayPort lanes. Any reference to lane in this binding
+  hence refers to two differential pairs (RX and TX) as used in USB terminology.
+
+  In order to correctly setup these lanes for the various modes calibration
+  values copied from Apple's firmware and converted to the format described
+  below by our bootloader m1n1 are required. Without these only USB2 operation
+  is possible.
+
+allOf:
+  - $ref: /schemas/usb/usb-switch.yaml#
+
+$defs:
+  apple,tunable:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: Register offset
+        - description: Mask to be applied to the register value
+        - description: Bits to be set after applying the mask
+    description: >
+      List of (register offset, mask, value) tuples copied from Apple's Device
+      Tree by our bootloader m1n1 and used to configure the PHY. These values
+      even vary for a single product/device and likely contain calibration
+      values determined by Apple at manufacturing time.
+      Unless otherwise noted these tunables are always applied to the core
+      register region.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - apple,t6000-atcphy
+              - apple,t6020-atcphy
+              - apple,t8112-atcphy
+          - const: apple,t8103-atcphy
+      - const: apple,t8103-atcphy
+
+  reg:
+    items:
+      - description: Common controls for all PHYs (USB2/3/4, DisplayPort, TBT)
+      - description: DisplayPort Alternate Mode PHY specific controls
+      - description: Type-C PHY AXI to Apple Fabric interconnect controls
+      - description: USB2 PHY specific controls
+      - description: USB3 PIPE interface controls
+
+  reg-names:
+    items:
+      - const: core
+      - const: lpdptx
+      - const: axi2af
+      - const: usb2phy
+      - const: pipehandler
+
+  "#phy-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 0
+
+  mode-switch: true
+  orientation-switch: true
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Outgoing connection to the SS port of the Type-C connector.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB3 controller.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the DisplayPort controller.
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB4/Thunderbolt controller.
+
+  apple,tunable-common-a:
+    $ref: "#/$defs/apple,tunable"
+    description: >
+      Common tunables required for all modes, applied before tunable-axi2af.
+
+  apple,tunable-axi2af:
+    $ref: "#/$defs/apple,tunable"
+    description: >
+      AXI to Apple Fabric tunables, required for all modes. Unlike all other
+      tunables these are applied to the axi2af region.
+
+  apple,tunable-common-b:
+    $ref: "#/$defs/apple,tunable"
+    description: >
+      Common tunables required for all modes, applied after tunable-axi2af.
+
+  apple,tunable-lane0-usb:
+    $ref: "#/$defs/apple,tunable"
+    description: USB3 tunables for lane 0.
+
+  apple,tunable-lane1-usb:
+    $ref: "#/$defs/apple,tunable"
+    description: USB3 tunables for lane 1.
+
+  apple,tunable-lane0-cio:
+    $ref: "#/$defs/apple,tunable"
+    description: USB4/Thunderbolt ("Converged IO") tunables for lane 0.
+
+  apple,tunable-lane1-cio:
+    $ref: "#/$defs/apple,tunable"
+    description: USB4/Thunderbolt ("Converged IO") tunables for lane 1.
+
+  apple,tunable-lane0-dp:
+    $ref: "#/$defs/apple,tunable"
+    description: >
+      DisplayPort tunables for lane 0.
+
+      Note that lane here refers to a USB RX and TX pair re-used for DisplayPort
+      and not to an individual DisplayPort differential lane.
+
+  apple,tunable-lane1-dp:
+    $ref: "#/$defs/apple,tunable"
+    description: >
+      DisplayPort tunables for lane 1.
+
+      Note that lane here refers to a USB RX and TX pair re-used for DisplayPort
+      and not to an individual DisplayPort differential lane.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#phy-cells"
+  - "#reset-cells"
+  - orientation-switch
+  - mode-switch
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@83000000 {
+      compatible = "apple,t8103-atcphy";
+      reg = <0x83000000 0x4c000>,
+            <0x83050000 0x8000>,
+            <0x80000000 0x4000>,
+            <0x82a90000 0x4000>,
+            <0x82a84000 0x4000>;
+      reg-names = "core", "lpdptx", "axi2af", "usb2phy",
+                  "pipehandler";
+
+      #phy-cells = <1>;
+      #reset-cells = <0>;
+
+      orientation-switch;
+      mode-switch;
+      power-domains = <&ps_atc0_usb>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+
+          endpoint {
+            remote-endpoint = <&typec_connector_ss>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+
+          endpoint {
+            remote-endpoint = <&dwc3_ss_out>;
+          };
+        };
+
+        port@2 {
+          reg = <2>;
+
+          endpoint {
+            remote-endpoint = <&dcp_dp_out>;
+          };
+        };
+
+        port@3 {
+          reg = <3>;
+
+          endpoint {
+            remote-endpoint = <&acio_tbt_out>;
+          };
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968e4f9260263f1574ee29f5ff0de1c..83487fea4e654171190f6e934203d3f6a881dd34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2431,6 +2431,7 @@ F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
 F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
 F:	Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
+F:	Documentation/devicetree/bindings/phy/apple,atcphy.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml

-- 
2.34.1


