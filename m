Received: from out-108.mta0.migadu.com (out-108.mta0.migadu.com [91.218.175.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8F9322A
	for <asahi@lists.linux.dev>; Tue, 24 Jan 2023 23:01:35 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
	t=1674600125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=36Vs8J0xhZS4TyMPNV0MC8jbKBVP8w8N3cOPO33G5Wk=;
	b=NDz7l4pPA+sUvoQ0mDQNcUtYzr72ERejOPwyYOT4DtmFUwQqUNTU257VyRO0+JF/FswAXH
	o+DK4x7vQ2KpVpyASwIA8gwOmP/oGcIzYvE/zqTEcqeFrGuPgG7NvzXYM8TEz1lj5rJldo
	K7Dqn36RngXMNaaFLCEqxRHj8zJe9GU=
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
Subject: [PATCH v3 2/2] dt-bindings: display: simple-framebuffer: Document physical width and height properties
Date: Tue, 24 Jan 2023 22:41:42 +0000
Message-Id: <20230124224142.7133-3-rayyan@ansari.sh>
In-Reply-To: <20230124224142.7133-1-rayyan@ansari.sh>
References: <20230124224142.7133-1-rayyan@ansari.sh>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Document the optional width-mm and height-mm simple-framebuffer
properties.

Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index dd64f70b5014..4ae33a4d2da9 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -106,6 +106,12 @@ properties:
       - x2r10g10b10
       - x8r8g8b8
 
+  width-mm:
+    description: Physical width of the display in millimetres
+
+  height-mm:
+    description: Physical height of the display in millimetres
+
   display:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Primary display hardware node
-- 
2.39.1

