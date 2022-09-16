Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16835C81
	for <asahi@lists.linux.dev>; Fri, 16 Sep 2022 16:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vuN8zb6d1gSMbyOMfzwYTsEwMhMACez3BjzbPzroncs=; b=u9nKpqmP5jAG3qk5q+RQhhwEN2
	jV+LVQl7kr6Jh5cVT5NK2CC86y458UA6WER0gb4IKYwozP75qezQjoHWH5jvGHuoz5623g7UWuMkD
	rif40LKPWr0tYcnj5evZG6lo9xvVjO0z7ooaw16QjM466GdcV6JYiLAp36QCEHcb0aDry+wO2/jzk
	MSYOYhxmCWsFPytGoEyrSAYSEF8xAiKq/thVgXHBBg4GApb2Nocb6WWKhyemp24owr+3KWKd278ON
	G+nZRnvhYbAt/rlYEUc4NXA2Nj+WZXbVjQ3mU5/VMOACmgR4JWoGsWIN1mxJgRR5VNnfqsGLkIVvX
	wO4ZgQNg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59238 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oZDnO-0006t3-Kn; Fri, 16 Sep 2022 17:02:26 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oZDnO-0077Zy-18; Fri, 16 Sep 2022 17:02:26 +0100
In-Reply-To: <YySd3pASZKUh4leX@shell.armlinux.org.uk>
References: <YySd3pASZKUh4leX@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: Arend van Spriel <aspriel@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	"David S. Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Hector Martin <marcan@marcan.st>,
	Jakub Kicinski <kuba@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafa__ Mi__ecki" <zajec5@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	SHA-cyfmac-dev-list@infineon.com,
	Sven Peter <sven@svenpeter.dev>,
	van Spriel <arend@broadcom.com>
Subject: [PATCH wireless-next v3 01/12] dt-bindings: net: bcm4329-fmac: Add
 Apple properties & chips
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oZDnO-0077Zy-18@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 16 Sep 2022 17:02:26 +0100

From: Hector Martin <marcan@marcan.st>

This binding is currently used for SDIO devices, but these chips are
also used as PCIe devices on DT platforms and may be represented in the
DT. Re-use the existing binding and add chip compatibles used by Apple
T2 and M1 platforms (the T2 ones are not known to be used in DT
platforms, but we might as well document them).

Then, add properties required for firmware selection and calibration on
M1 machines.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Alvin Šipraga <alsi@bang-olufsen.dk>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/wireless/brcm,bcm4329-fmac.yaml       | 39 +++++++++++++++++--
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
index 53b4153d9bfc..fec1cc9b9a08 100644
--- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Broadcom BCM4329 family fullmac wireless SDIO devices
+title: Broadcom BCM4329 family fullmac wireless SDIO/PCIE devices
 
 maintainers:
   - Arend van Spriel <arend@broadcom.com>
@@ -41,11 +41,17 @@ title: Broadcom BCM4329 family fullmac wireless SDIO devices
               - cypress,cyw4373-fmac
               - cypress,cyw43012-fmac
           - const: brcm,bcm4329-fmac
-      - const: brcm,bcm4329-fmac
+      - enum:
+          - brcm,bcm4329-fmac
+          - pci14e4,43dc  # BCM4355
+          - pci14e4,4464  # BCM4364
+          - pci14e4,4488  # BCM4377
+          - pci14e4,4425  # BCM4378
+          - pci14e4,4433  # BCM4387
 
   reg:
-    description: SDIO function number for the device, for most cases
-      this will be 1.
+    description: SDIO function number for the device (for most cases
+      this will be 1) or PCI device identifier.
 
   interrupts:
     maxItems: 1
@@ -85,6 +91,31 @@ title: Broadcom BCM4329 family fullmac wireless SDIO devices
       takes precedence.
     type: boolean
 
+  brcm,cal-blob:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: A per-device calibration blob for the Wi-Fi radio. This
+      should be filled in by the bootloader from platform configuration
+      data, if necessary, and will be uploaded to the device if present.
+
+  brcm,board-type:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Overrides the board type, which is normally the compatible of
+      the root node. This can be used to decouple the overall system board or
+      device name from the board type for WiFi purposes, which is used to
+      construct firmware and NVRAM configuration filenames, allowing for
+      multiple devices that share the same module or characteristics for the
+      WiFi subsystem to share the same firmware/NVRAM files. On Apple platforms,
+      this should be the Apple module-instance codename prefixed by "apple,",
+      e.g. "apple,honshu".
+
+  apple,antenna-sku:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Antenna SKU used to identify a specific antenna configuration
+      on Apple platforms. This is use to build firmware filenames, to allow
+      platforms with different antenna configs to have different firmware and/or
+      NVRAM. This would normally be filled in by the bootloader from platform
+      configuration data.
+
 required:
   - compatible
   - reg
-- 
2.30.2

