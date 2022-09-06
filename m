Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB11746BC
	for <asahi@lists.linux.dev>; Tue,  6 Sep 2022 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Vby8juuAVsxuLw4jJID4JNcPru+I7KI07gwaNAFsVNg=; b=Iee1pdz686BPqymc4AONYI6et8
	uDWXpoYWBcNNEqhLQAkHfob+YXLMCy7zE6GFvYFGyLJKuY/WsaQ0Bv6+hEF6sej5NEZfH5v3uh73Z
	M8KFdfwWJ94K9WiAnxmezg2OpKSZD1BR1AkzRrQkpgvK8/3twgwJZdF6vUna+qlmxcRcX9nQIpONT
	jtN4Bt6FIbRok6rPMI7UVrtR80TY6qsPyhYdUhGH5gZMbvmgbH7dalOiC2clOesZtnmfbaxVKjCMr
	7gNxYOWLJIX84JL479gj3zWK37AEntYkl81bHqbr0mZxh59CtQ89QiyJLayaT1J2iXLLb8avfs8JL
	KRkk0hXg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53692 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oVYUI-0003r5-VY; Tue, 06 Sep 2022 14:19:34 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oVYUI-005CmB-84; Tue, 06 Sep 2022 14:19:34 +0100
In-Reply-To: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>,
	 Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	asahi@lists.linux.dev,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	devicetree@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sven Peter <sven@svenpeter.dev>
Subject: [PATCH 2/7] dt-bindings: gpio: add binding for the GPIO block for
 Apple Mac SMC
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oVYUI-005CmB-84@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 06 Sep 2022 14:19:34 +0100

Add the DT binding for the Apple Mac System Management Controller GPIOs.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../devicetree/bindings/gpio/gpio-macsmc.yaml | 28 +++++++++++++++++++
 .../devicetree/bindings/mfd/apple,smc.yaml    |  4 +++
 2 files changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
new file mode 100644
index 000000000000..ee620fe50ca8
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Mac System Management Controller GPIO
+
+maintainers:
+  - Hector Martin <marcan@marcan.st>
+
+description:
+  This describes the binding for the Apple Mac System Management Controller
+  GPIO block.
+
+properties:
+  gpio-controller: true
+  '#gpio-cells':
+    const: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    smc_gpio: gpio {
+      gpio-controller;
+      #gpio-cells = <2>;
+    };
diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 168f237c2962..47e3cd58bf19 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -37,6 +37,10 @@ title: Apple Mac System Management Controller
     description:
       A phandle to the mailbox channel
 
+patternProperties:
+  gpio:
+    $ref: /schemas/gpio/gpio-macsmc.yaml
+
 additionalProperties: false
 
 required:
-- 
2.30.2

