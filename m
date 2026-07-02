Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CAF47DD48
	for <asahi@lists.linux.dev>; Thu,  2 Jul 2026 12:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994017; cv=none; b=m8iR9I4NVb4V/1po7Io3AadPHfBkCDGbWlR8tagWmWyQESp0SzK/T+U2brXfoFYSoke+1hv6J4ait8rqyFWZ3I0eX0HE7we2TTOLNeDkdr8XfNkVc0qe7EpBhX3CCjWYGrljskLPmIOop9siUEkuDY7YOJYAncanEyfCdfO7iL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994017; c=relaxed/simple;
	bh=j5hsB19O/gI7PDghu/Bk2CyHrRFqcTcAEEQaPelKHJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQjDMfwjq2laV/ed7QtDcdfxVE7TcQ0da1ALUkPEmZO/GiXBDGq4G1GtRbBXCAvdOe1Y1KdgiVYGxWubdt8tskQ8dT6/1KUGpdBiXOHwX6KoTsK3K/NfnoLBe99qBPTdTa7yKRNukDnOwrnRCvOFom4D2GQW+uNeIcZP7OoadfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=VnTaLvsX; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="VnTaLvsX"
Received: by chaosmail.tech (Postfix) id E1E821C99A5;
	Thu, 02 Jul 2026 12:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1782994006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GUWb/CcjSnuu/zRrdol4Fbo696rxkegMYGydXx0/eNo=;
	b=VnTaLvsXZc2mgE2EesD+PcyFIGgOdjzA4N9AfutsVKw5VIrm3Hb8JqN19r6+67+9qEu1IM
	SnImmgIZoL5F5dEWgmKBjgxIljycXDzATC8XRmfhYmGICD9lEa0cI3CpvrWuEnplj+P8D2
	c+5wohD/hcZjQ/Ix3VoKZYiCNmVoqgg=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Thu, 02 Jul 2026 14:06:26 +0200
Subject: [PATCH 1/3] dt-bindings: soc: apple: Add bindings for apple PMGR
 misc controls
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-pmgr-misc-v1-1-4f075a3a95c1@chaosmail.tech>
References: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
In-Reply-To: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782994005; l=2562;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=j5hsB19O/gI7PDghu/Bk2CyHrRFqcTcAEEQaPelKHJU=;
 b=mzWNSVgT0DW64WULlkv9oCBP5q5bXWWfYFP0xYpkwqasNXDDkCs5aXz9Tq/ppm1J/a27ajoDY
 n8A3h/PyQwLAklkWWSjiYD/ljhr5+bY+/LoGtr3lDEFLMcfDnQVhS5O
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Certain Apple SoCs include additional PMGR power states that are
controlled via a different "misc" control block. On existing SoCs, this
includes the fabric and memory controller state.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml | 45 +++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                                            |  1 +
 2 files changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml b/Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
new file mode 100644
index 000000000000..30abedc67fa4
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
+  via a different "misc" control block. On existing SoCs, this includes the
+  fabric and memory controller state.
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
+    pmgr_misc: power-management@8e20c000 {
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

