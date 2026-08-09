Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690FB37AA95;
	Sun,  9 Aug 2026 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786277772; cv=none; b=e1WK0mq2ICPsBByypCJjXgXfKSmNvB6KLjU0gMQAdzOSFqNmn1LvIHfzM/Ig3wGeHothj+NBNI/UB/PI9ClkKcjJIVEoV/+sIdnvHiz9rbTSyYbXUp2VoFsBsV26MP5qh8YCy8Je3/cUfoKHJDtSQSg+5aZArncCcGMfGS7CiGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786277772; c=relaxed/simple;
	bh=GS0706aWd/X1ewhqfLjE66a5N9etk1CxR3PFk3+EnSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n48cd5am7stWiQtQjDjhmHbtQ5aj0KlPHn+h+2btrTciDwZUYViQn59qRTJyVpbSv+tTrdUdPJEHLQMWzE4FMhibW2VFOshCKSX7IyJ7kn0trzFr1BKWG92PGu1SXuYWzutlCz6uUhsc8MrxDGXhaOXqR1+am5OTwvrZWLo1IlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvY8pJqh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvY8pJqh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BC77C2BCF5;
	Sun,  9 Aug 2026 12:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786277772;
	bh=GS0706aWd/X1ewhqfLjE66a5N9etk1CxR3PFk3+EnSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AvY8pJqh3v3kNHJdkubYRALiohycjtLJcod5jiU9oqnA/tIn5ebcBjh2aPjEK6jrb
	 XDm7IaNRSJnWH1i6YpteEZ1GvDEs2ZG3zEpqyl+lX9tvEQRMXoLILGM/I3HARSIiIV
	 39aPBIyxwtmNufh3xHV75gWBeUiOAL7vN5h5/E3/mLqmYEceWiW4620bmSZDMDQZiG
	 zfqJ/PHocq4+CyE0QMsd8s2w7pbSdRzxL/6n7eOeTpnlqCflgy7Gn6v3O12P9454sl
	 crYtw3BsozSluxL5/KB+SUHFlCSzTdQ0j0J8ozhoqAQh93diKKMS/eJcjyfCx+g/OJ
	 v2qqRJygyi3TA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF27C5AD4E;
	Sun,  9 Aug 2026 12:16:11 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 09 Aug 2026 14:16:02 +0200
Subject: [PATCH 1/3] dt-bindings: reset: Add Apple SoC CIO reset
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-b4-cio-reset-v1-1-4f33777d9b4b@kernel.org>
References: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
In-Reply-To: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4500; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=GS0706aWd/X1ewhqfLjE66a5N9etk1CxR3PFk3+EnSU=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1ZFfnvIvV2XKu9/dQityzjywVMjbFLbU1t2sTz2zcu/C
 vu3PDvbUcrCIMbFICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZhI+zKGf2bbsph/HAnbsvRP
 dYCOQNzN/F2x9Wx91cbr5L6pGP5/rMDwV2Ry7KQTYomhSU9zG2PiGVsCi99bMp98+DZf0PzbZpU
 nnAA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The CIO (USB4/Thunderbolt) blocks on Apple Silicon SoCs have a reset
inside the power manager that has to be deasserted before their
co-processor can be booted. On t8103 each port comes with a dedicated
register page, represented as a standalone node. On t600x a single
register shared by all ports of a die is located in the middle of the
PMGR MMIO region instead, represented as a sub-node of the PMGR syscon.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |  6 ++
 .../bindings/reset/apple,t8103-cio-reset.yaml      | 74 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index c67b67ba065a..2cdecc2c2cea 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -59,6 +59,12 @@ patternProperties:
     type: object
     $ref: /schemas/power/apple,pmgr-pwrstate.yaml#
 
+  "reset-controller@[0-9a-f]+$":
+    description:
+      Reset controller for the CIO (USB4/Thunderbolt) blocks
+    type: object
+    $ref: /schemas/reset/apple,t8103-cio-reset.yaml#
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/reset/apple,t8103-cio-reset.yaml b/Documentation/devicetree/bindings/reset/apple,t8103-cio-reset.yaml
new file mode 100644
index 000000000000..5f5be0636b36
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/apple,t8103-cio-reset.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/apple,t8103-cio-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SoC CIO (USB4/Thunderbolt) block reset controller
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+description: |
+  The CIO (Converged I/O) blocks on Apple Silicon SoCs have a reset
+  inside the power manager (PMGR) that has to be deasserted before
+  their co-processor can be booted. On t8103 each port comes with a
+  dedicated register page, represented as a standalone node. On t600x a
+  single register shared by all ports of a die with one request bit per
+  port is used instead. Since this register is located in the middle of
+  the PMGR MMIO region it is represented as a sub-node of the PMGR
+  syscon with reg used as an offset into it.
+
+  In both cases the reset id is the CIO port index on the die.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - apple,t8103-cio-reset
+          - apple,t6000-cio-reset
+      - items:
+          - const: apple,t8112-cio-reset
+          - const: apple,t8103-cio-reset
+      - items:
+          - const: apple,t6020-cio-reset
+          - const: apple,t6000-cio-reset
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        reset-controller@23b784000 {
+            compatible = "apple,t8103-cio-reset";
+            reg = <0x2 0x3b784000 0x0 0x8000>;
+            #reset-cells = <1>;
+        };
+    };
+  - |
+    power-management@28e080000 {
+        compatible = "apple,t6000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+        reg = <0x8e080000 0x1c000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        reset-controller@1a034 {
+            compatible = "apple,t6000-cio-reset";
+            reg = <0x1a034 0x4>;
+            #reset-cells = <1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..4b78528324c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2606,6 +2606,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/reset/apple,t8103-cio-reset.yaml
 F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml

-- 
2.55.0


