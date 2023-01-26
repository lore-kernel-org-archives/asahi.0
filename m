Received: from out-210.mta0.migadu.com (out-210.mta0.migadu.com [91.218.175.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DBA23B7
	for <asahi@lists.linux.dev>; Thu, 26 Jan 2023 18:38:40 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Rayyan Ansari <rayyan@ansari.sh>
To: dri-devel@lists.freedesktop.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	asahi@lists.linux.dev,
	janne@jannau.net,
	Rayyan Ansari <rayyan@ansari.sh>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	devicetree@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 2/2] dt-bindings: display: simple-framebuffer: Document the panel node
Date: Thu, 26 Jan 2023 18:24:35 +0000
Message-Id: <20230126182435.70544-3-rayyan@ansari.sh>
In-Reply-To: <20230126182435.70544-1-rayyan@ansari.sh>
References: <20230126182435.70544-1-rayyan@ansari.sh>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new panel node and what it is used for.

Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml  | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index dd64f70b5014..4e10a100b6c8 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -26,6 +26,11 @@ description: |+
   over control to a driver for the real hardware. The bindings for the
   hw nodes must specify which node is considered the primary node.
 
+  If a panel node is given, then the driver uses this to configure the
+  physical width and height of the display. If no panel node is given,
+  then the driver uses the width and height properties of the simplefb
+  node to estimate it.
+
   It is advised to add display# aliases to help the OS determine how
   to number things. If display# aliases are used, then if the simplefb
   node contains a display property then the /aliases/display# path
@@ -110,6 +115,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Primary display hardware node
 
+  panel:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Display panel node
+
   allwinner,pipeline:
     description: Pipeline used by the framebuffer on Allwinner SoCs
     enum:
-- 
2.39.1

