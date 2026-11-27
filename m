Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785204;
	b=N5ep/b8f7HdvJTZOg9L0tqCc1jXItiJb9/xiLDeT7ZvnsXZMZ2tMb46YFw+qkZOY8g3d
	 y/+NChjZjIKRgCp9axjYfSwEmUoAU0i9lJPyg5oVDmPtmCf19glNTwMpfOSHlxUEs856R
	 0S/tYtIz1AG+h6k+b74uR1OHuCIkYkMBo7NVAyWnWwgGLTcQ9HC6gb9mLFW3H7FnFnufX
	 BX9dd0o0ARQgM1X0RawRXVxF2DTHcfLlqLxKXEKfHBg+B6Ip9l9AQ82MOnakQkblj2MYe
	 50Rfr0LModyj94Yh+FJzqgxIqkhn3ayM8BFSx9ojoUU/G7lk759oDazqGmH3SB6EVdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785204;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ecXKaMO8m+L3M1n1GPbEUhGNBTH54VF2vdfloCEyxpA=;
	b=QZX+yV6uxB0T6ISzGoNEiXMdBfxwReM8FnhYpeKoV4E6CajgMp6aJDnULSInvd0zZbIC
	 GEQlgh1Z64zOGzG+iPOOXCydrwcUpwZrp2cgOCti1xNFFpSSSYvDu8/ViGmOtB06vIiPF
	 BusBkv/283ItmnMAhWGYUU0ggZvZ1Jxyp/dZFl/XILIgz3GlTjnLuZhWiUUT3vXqSGG+p
	 /4G3svkga9CaFbveHhYu9lH2fs0koKmWrbq+FoQBTiNV2KXlQZlI3rQFU0k7NHnn7ZXBa
	 U8Ve9IQPVtB+G+nRu6U1/NaCjcDKTDJVz0SdiTRxkIyB9EFhVq6ceLKNpRrlkah0Wcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZgFpDlK3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CED0606A32D
	for <asahi@lists.linux.dev>; Fri, 27 Nov 2026 13:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZgFpDlK3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53401F0089F;
	Fri, 27 Nov 2026 13:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795785204;
	bh=ecXKaMO8m+L3M1n1GPbEUhGNBTH54VF2vdfloCEyxpA=;
	h=From:To:Cc:Subject:Date;
	b=ZgFpDlK3RSqpP+aZw3F7PeD8ohRFc1txch9dzsHYIUWIf+DMx7zM6uRHnpul++7G/
	 UacJsitJGFCWsZYRz5OnOKNfrq70P8ZV4dim5ONPFaBje9C4qeqzoC5GNNI9TflUxr
	 CJudKNKkVg56kzx4Eyb034D3LAIIfuRsfv6IiJB8qlNOE1vMEi9Kszsy+6yYYGVNNQ
	 iBQyZxtP1qQ3DjAUpYtM8AkVe9ac4ToA2wNJzTTKwnu+Xt7eL0T7iVwz6Ck3c1+42e
	 1/c9hWV6TKchC72BoTNLOI79rli8/baaUm72uQ5UEO+q3Ap3hKCVVZys++YqDff5O+
	 2mP4EyRchDtQg==
From: Thorsten Blum <blum@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>,
	Janne Grunau <j@jannau.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Nick Chan <towinchenmi@gmail.com>
Cc: Thorsten Blum <blum@kernel.org>,
	dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev
Subject: [PATCH] drm/panel: summit: Reject out-of-range max brightness values
Date: Fri, 27 Nov 2026 14:12:59 +0100
Message-ID: <20261127131258.682952-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039; i=blum@kernel.org; h=from:subject; bh=KmT0Qr/2UMIfq+v0t/AvB3pGAm+nPOlQo/hh2qri/ow=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDNmcjbeOa7ikKb7rEJQO/ifYsnubf+SlhSXVIf/nT7vz8 F7grYRDHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCR5t0M/7SClEsc2QSml6c3 uderbXNWLK0oi1n427ar29iu+s9nBYb/wSGZn48sS3PpTV8t5npa89qMKUEXnmUtTVvTPy14Wa8 7EwA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

device_property_read_u32() reads the "max-brightness" property directly
into the signed int max_brightness field. Therefore, values above
INT_MAX are interpreted as negative.

Read the property into a temporary u32 and validate it before assigning
it to the signed max_brightness field.

Values above INT_MAX now cause probe to fail with -EINVAL instead of
registering a backlight with a negative maximum brightness.

Fixes: 40115947b59f ("drm: panel: Add a panel driver for the Summit display")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Found by code inspection and compile-tested only.

 drivers/gpu/drm/panel/panel-summit.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-summit.c b/drivers/gpu/drm/panel/panel-summit.c
index 84435be52424..2d6fb9e08ddb 100644
--- a/drivers/gpu/drm/panel/panel-summit.c
+++ b/drivers/gpu/drm/panel/panel-summit.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/backlight.h>
+#include <linux/limits.h>
 #include <linux/property.h>
 #include <drm/drm_device.h>
 #include <drm/drm_mipi_dsi.h>
@@ -67,6 +68,7 @@ static int summit_probe(struct mipi_dsi_device *dsi)
 	struct backlight_properties props = { 0 };
 	struct device *dev = &dsi->dev;
 	struct summit_data *s_data;
+	u32 max_brightness;
 	int ret;
 
 	s_data = devm_drm_panel_alloc(dev, struct summit_data, panel,
@@ -78,9 +80,14 @@ static int summit_probe(struct mipi_dsi_device *dsi)
 	mipi_dsi_set_drvdata(dsi, s_data);
 	s_data->dsi = dsi;
 
-	ret = device_property_read_u32(dev, "max-brightness", &props.max_brightness);
+	ret = device_property_read_u32(dev, "max-brightness", &max_brightness);
 	if (ret)
 		return ret;
+
+	if (max_brightness > INT_MAX)
+		return dev_err_probe(dev, -EINVAL, "Invalid maximum brightness: %u\n",
+				     max_brightness);
+	props.max_brightness = max_brightness;
 	props.type = BACKLIGHT_RAW;
 
 	s_data->bl = devm_backlight_device_register(dev, dev_name(dev),
