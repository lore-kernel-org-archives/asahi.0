Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318E13672A9
	for <asahi@lists.linux.dev>; Sun,  5 Jul 2026 08:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239407; cv=none; b=NH096Zt1V2vKeGVTMZ1LRST7KEhuvpX7qbY6cY0AV5dvzTQBfwaiEmfOtSCYvnZ+r+4bd2jJGaaycxSGfK5dzwV16tkIo8ODu2hXUQl4S9LEoowswRVwpYO6G263zPdj7204rN+vpjYiZSmTaHehL2iVlGE24DT/qmGZf9+Cn4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239407; c=relaxed/simple;
	bh=P24n1VnjIAcMi/bOzGDdsOVAqL1wKs/zn7VIp+SXEA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ea4J2wjvwO/73sG+ZckP6r9cyEdva/TsXaUEOCKqBK/GObH39q3Xjwu4kUDeKfYaKbIfVDRLXrbfT4IsYX/EryKuLN66UlBytr1XJoJV1OXTefafqIM0QKYrXG/zK/oGKDxYrnN0s79NeAwaIfYh14JXuhzhrhGB4lY5Fix+8kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=rNPxMRq3; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="rNPxMRq3"
Received: by chaosmail.tech (Postfix) id 6A2B71CC220;
	Sun, 05 Jul 2026 08:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783239399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FY5V3ybuTyP3BCRlKYUCOlT9nQq4kQeCRIYQZC7cP8A=;
	b=rNPxMRq37Gd5Jk+HFJ18Ai2gtJZXgxNd5DLMGUbQaqmV5spNOEE29KqHrJwRsu/YgGKF9D
	YmzmDLZN5kSHUNZ+tti1zIlczbVvw8QkBbldI8UXh3rtKFcPGPQJc3It+VHOoC8gBZOUIT
	qZQ5TDiQwplpFR2tbKohmMEnnEWZZYo=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sun, 05 Jul 2026 10:16:30 +0200
Subject: [PATCH v3 1/3] dt-bindings: soc: apple: Add Apple PMGR misc
 controls
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-pmgr-misc-v3-1-51b75fed6f73@chaosmail.tech>
References: <20260705-pmgr-misc-v3-0-51b75fed6f73@chaosmail.tech>
In-Reply-To: <20260705-pmgr-misc-v3-0-51b75fed6f73@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239397; l=2590;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=P24n1VnjIAcMi/bOzGDdsOVAqL1wKs/zn7VIp+SXEA0=;
 b=f3FzkoBSxFnmOl7AZ/a6oqgJaBjg6PUUGT37JaMOMChlcglgwqrKx2e0aj1PAvce/Qef+rT7I
 mNnFr+4ejaaBqDNhUCDcpGZvmhVRKI9vGDdPV9mE0CzrfH2DtkXsL+X
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Certain Apple SoCs include additional PMGR power states that are
controlled via a different "misc" control block. On existing SoCs, this
includes the fabric and memory controller state.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml | 45 +++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                                            |  1 +
 2 files changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml b/Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
new file mode 100644
index 000000000000..588100222f89
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SoC PMGR Misc Power States
+
+maintainers:
+  - Sasha Finkelstein <k@chaosmail.tech>
+
+description: |
+  Certain Apple SoCs include additional PMGR power states that are controlled
+  via a different "misc" control block. This includes the fabric and memory
+  controller states.
+
+properties:
+  compatible:
+    enum:
+      - apple,t6000-pmgr-misc
+      - apple,t6020-pmgr-misc
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: fabric-ps
+      - const: dcs-ps
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    power-management@8e20c000 {
+        compatible = "apple,t6000-pmgr-misc";
+        reg = <0x8e20c000 0x400>,
+              <0x8e20c800 0x400>;
+        reg-names = "fabric-ps", "dcs-ps";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..5a29bb86499f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2607,6 +2607,7 @@ F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
 F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
+F:	Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/usb/apple,dwc3.yaml

-- 
2.55.0

