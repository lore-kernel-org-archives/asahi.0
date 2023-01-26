Received: from out-139.mta0.migadu.com (out-139.mta0.migadu.com [91.218.175.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0C4C92
	for <asahi@lists.linux.dev>; Thu, 26 Jan 2023 19:14:22 +0000 (UTC)
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
Subject: [PATCH v4 1/2] drm/simpledrm: Allow physical width and height configuration via panel node
Date: Thu, 26 Jan 2023 18:24:34 +0000
Message-Id: <20230126182435.70544-2-rayyan@ansari.sh>
In-Reply-To: <20230126182435.70544-1-rayyan@ansari.sh>
References: <20230126182435.70544-1-rayyan@ansari.sh>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse the width-mm and height-mm devicetree properties of the panel node,
and use this to set the DRM Display Mode instead of calculating it
based on a hardcoded DPI.

Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
---
 drivers/gpu/drm/tiny/simpledrm.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 162eb44dcba8..f8b18441cfcb 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -599,16 +599,12 @@ static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
  */
 
 static struct drm_display_mode simpledrm_mode(unsigned int width,
-					      unsigned int height)
+					      unsigned int height,
+					      unsigned int width_mm,
+					      unsigned int height_mm)
 {
-	/*
-	 * Assume a monitor resolution of 96 dpi to
-	 * get a somewhat reasonable screen size.
-	 */
 	const struct drm_display_mode mode = {
-		DRM_MODE_INIT(60, width, height,
-			      DRM_MODE_RES_MM(width, 96ul),
-			      DRM_MODE_RES_MM(height, 96ul))
+		DRM_MODE_INIT(60, width, height, width_mm, height_mm)
 	};
 
 	return mode;
@@ -622,6 +618,8 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	struct simpledrm_device *sdev;
 	struct drm_device *dev;
 	int width, height, stride;
+	int width_mm = 0, height_mm = 0;
+	struct device_node *panel_node;
 	const struct drm_format_info *format;
 	struct resource *res, *mem;
 	void __iomem *screen_base;
@@ -676,6 +674,13 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 		format = simplefb_get_format_of(dev, of_node);
 		if (IS_ERR(format))
 			return ERR_CAST(format);
+
+		panel_node = of_parse_phandle(of_node, "panel", 0);
+		if (panel_node) {
+			simplefb_read_u32_of(dev, panel_node, "width-mm", &width_mm);
+			simplefb_read_u32_of(dev, panel_node, "height-mm", &height_mm);
+			of_node_put(panel_node);
+		}
 	} else {
 		drm_err(dev, "no simplefb configuration found\n");
 		return ERR_PTR(-ENODEV);
@@ -686,7 +691,16 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 			return ERR_PTR(-EINVAL);
 	}
 
-	sdev->mode = simpledrm_mode(width, height);
+	/*
+	 * Assume a monitor resolution of 96 dpi if physical dimensions
+	 * are not specified to get a somewhat reasonable screen size.
+	 */
+	if (!width_mm)
+		width_mm = DRM_MODE_RES_MM(width, 96ul);
+	if (!height_mm)
+		height_mm = DRM_MODE_RES_MM(height, 96ul);
+
+	sdev->mode = simpledrm_mode(width, height, width_mm, height_mm);
 	sdev->format = format;
 	sdev->pitch = stride;
 
-- 
2.39.1

