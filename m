Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE40413D51E
	for <asahi@lists.linux.dev>; Tue, 11 Aug 2026 16:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467242; cv=none; b=U8Go58pUkOI7MtDiQWLC9iXBc2JJxA+o3vGxxScrnLbaUc0paKjDuQoJzGWJQslxEAazY5hFtPUUleBMxsAV+shNcGlAOqXccCGHUZx6O1/AX5xij9WiYBJXNYuhpPCkUHj9x0tDLyuIh1B1K5gCCKogBkeSYYxHiGCmBj7COxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467242; c=relaxed/simple;
	bh=qyVa+MAENSFAbpBkkSwEtfctG6nIQwKr+YQH+NXpMUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eBEXe33rMtse+yzcSUfxklaGAhLvoAVF7hirnlCWq3QjgrxzJDKfLDKEYYugwik/wwnJzFmT/nrw9NqV8TScyzqhtyrF+omDkF6381unO1nl3eDovDs6CIvCbJk+AJWA4qKKT60GVpR1tc7oeUXScpCA07SQBpCd66ayvlRDOhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smDDWxMx; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smDDWxMx"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso532691f8f.0
        for <asahi@lists.linux.dev>; Tue, 11 Aug 2026 09:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786467238; x=1787072038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ksgenC6faa2uaiFtlpQfvuhc1ILqEPhv7NVF7jOjzek=;
        b=smDDWxMxkL+4ZWjOyfiPEG7Ns8yK3Y3sQjWtPfWCkXA+5qEeewYQehjJ1H2+zyYAvm
         OLjyuWKE6ofz17gWZdrHlhv5xchaSVd7qk9mc0HuDJcIxnrFuShFcahkvlCC3KCLZZt1
         9Z/2Lr/tG/QshxNMf9ZswoSzfbwe8/BYKF0ohfkkewGlm0vpA4c9GLCoiMdLaU44r89o
         05ByRHG+X8avSgTUYrAOHGMZOaC0ZLeRl/+0EXozjeyI2ETLWGySIO+cX8MjbeIxKbBQ
         qlXzUSru8u8Ddom7bLN0hQx9u9TGue4KU+44V2LUmnjaiB1RZN4//K8R4PwOtvJ+q8Cz
         D+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786467238; x=1787072038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ksgenC6faa2uaiFtlpQfvuhc1ILqEPhv7NVF7jOjzek=;
        b=DC0u42WkH8khVGoNRGgf0uHcPeWIhVx90OPdRD7SW/KLEuntlchrvwqkxsEGQrEKQO
         JVZeXHGXsB0Q/rs5OiaLU4c4pJe8dAx0J3HhMSGwX4AbUzM+wF4nHupgu3OlzsYoPX0A
         p8wW7HB6frL/OmOFrCZ06GQ7fyCRfneqoK/U/bh28u4VFjTMci7HwLI0WMHJ2deh2L7N
         ZMLEN6nxo52dVowLwE13+PAAGI4pUmqsDPmAK2sNUiUo2f6KyLAW8E5HfrTvEOCOKV5d
         zcoHjbV+BPRAhU/71pB9q3v6O5n+SOF9RfUWxrPIo35xexfvQLfuqvIM+1hVEs1iBEWJ
         CURA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9oXF8NnnOIlhfX7tckuoLZChx4XK13qeDqbiI5vzMjOuYB8J7QZeTc0J+ZnWkJRyAg8kDig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6OUdWiy/j/WJlV9aWsIJPSrYVXxEIxLATUDzVvh6NDw0/41Gq
	i7KINebs9WhEp/BUYCH+vy8n/PknwOSi4lcNXVVP48SRNFtInqqwJ/Zq
X-Gm-Gg: AR+sD10QqTr+ly9e4LozIKTq/1YVkR7cbKCIpYgeHoJJ0JvAfGxEgsYPNqojrv+6Y9W
	UacNpEaygMFU01MhBTi1XgtklTk4xKaqV1v1vSv0qI10XpR6cCvteMO2dJkmQd2ndOmv2PGzqw+
	A03KvJYJ4SFYACWfhfmzEqygetR6HtZWbn1nfOI5xNBMA//H8DJnUW8e90vo7uRrzru81wP+Xva
	NyLEqcUK9+XQ6YPJwUJ/Cs1yXXCRpjwMMlbPkNRuOeNI84xCdF4GUFwkd2L5FdrSddnS1pFhG0h
	XZ1D+/0PNQYnj6m1+mPvYZoFNFV55+XCrktuk6/HOoZCG99487i/Tpmv6IJqbfbCt7wjsdQOUOw
	aWl/LfOgZUhXsCOaRlIulzbptsXGJUUUfHK18Yuw4XPqnfRedapSUdvgO8FHEQMLQETFzXRSVAg
	HbV8M/Dzb+7NC+py0xVW+siT5rskJ6wTfjtk3AHEEqY+ZzhcuOASOR4P7CcxIm4pK+/8+3MZG1F
	fKBTopeIVLVB0uCGTVuGgvrX0Di6Bcf1ps=
X-Received: by 2002:a5d:5e92:0:b0:481:98d:b24 with SMTP id ffacd0b85a97d-4814fd76afemr3018131f8f.19.1786467237713;
        Tue, 11 Aug 2026 09:53:57 -0700 (PDT)
Received: from osama.. ([2a02:908:185:7e40:434a:d6cf:4fd1:90b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a7097adsm5967204f8f.23.2026.08.11.09.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:53:57 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: luca.ceresoli@bootlin.com,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Joel Selvaraj <jo@jsfamily.in>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	Purism Kernel Team <kernel@puri.sm>,
	Ondrej Jirman <megi@xff.cz>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Janne Grunau <j@jannau.net>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v2 6/6] drm/panel: Use devm_mipi_dsi_attach in assorted panels
Date: Tue, 11 Aug 2026 18:53:48 +0200
Message-ID: <20260811165355.14530-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the managed MIPI DSI attach helper in the remaining straightforward
panel drivers and drop the corresponding manual detach calls from remove
paths.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

v2:
- break long description lines.
- add Signed-off-by tag
---
 drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c  | 9 +--------
 drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c     | 8 +-------
 drivers/gpu/drm/panel/panel-dsi-cm.c                  | 4 +---
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c             | 8 +-------
 drivers/gpu/drm/panel/panel-elida-kd35t133.c          | 8 +-------
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c     | 4 +---
 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 4 +---
 drivers/gpu/drm/panel/panel-hydis-hv101hd1.c          | 9 +--------
 drivers/gpu/drm/panel/panel-innolux-p079zca.c         | 8 +-------
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c      | 4 +---
 drivers/gpu/drm/panel/panel-khadas-ts050.c            | 8 +-------
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c    | 7 +------
 drivers/gpu/drm/panel/panel-lg-sw43408.c              | 8 +-------
 drivers/gpu/drm/panel/panel-lincolntech-lcd197.c      | 8 +-------
 drivers/gpu/drm/panel/panel-lxd-m9189a.c              | 8 +-------
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c      | 4 +---
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c       | 8 +-------
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c      | 4 +---
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c    | 8 +-------
 drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c  | 7 +------
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c          | 4 +---
 drivers/gpu/drm/panel/panel-simple.c                  | 8 +-------
 drivers/gpu/drm/panel/panel-sitronix-st7701.c         | 3 +--
 drivers/gpu/drm/panel/panel-sitronix-st7703.c         | 8 +-------
 drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c   | 8 +-------
 drivers/gpu/drm/panel/panel-summit.c                  | 4 +---
 drivers/gpu/drm/panel/panel-synaptics-r63353.c        | 8 +-------
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c          | 8 +-------
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c      | 8 +-------
 29 files changed, 29 insertions(+), 166 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
index db006576d704..63359416944f 100644
--- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
+++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
@@ -264,7 +264,7 @@ static int tm5p5_nt35596_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&ctx->panel);
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
 		return ret;
@@ -276,13 +276,6 @@ static int tm5p5_nt35596_probe(struct mipi_dsi_device *dsi)
 static void tm5p5_nt35596_remove(struct mipi_dsi_device *dsi)
 {
 	struct tm5p5_nt35596 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev,
-			"Failed to detach from DSI host: %d\n", ret);
-
 	drm_panel_remove(&ctx->panel);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c b/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c
index 562dc573528d..783ea9e9739d 100644
--- a/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c
+++ b/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c
@@ -292,7 +292,7 @@ static int ch13726a_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&ctx->panel);
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
 		drm_panel_remove(&ctx->panel);
@@ -305,12 +305,6 @@ static int ch13726a_probe(struct mipi_dsi_device *dsi)
 static void ch13726a_remove(struct mipi_dsi_device *dsi)
 {
 	struct ch13726a_panel *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
-
 	drm_panel_remove(&ctx->panel);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index ae6e9ffc46cb..329252416aa3 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -561,7 +561,7 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&ddata->panel);
 
-	r = mipi_dsi_attach(dsi);
+	r = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (r < 0)
 		goto err_dsi_attach;
 
@@ -583,8 +583,6 @@ static void dsicm_remove(struct mipi_dsi_device *dsi)
 
 	dev_dbg(&dsi->dev, "remove\n");
 
-	mipi_dsi_detach(dsi);
-
 	drm_panel_remove(&ddata->panel);
 
 	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
diff --git a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
index fb9f9f42be4f..7b93eabbf65d 100644
--- a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
+++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
@@ -204,7 +204,7 @@ static int ebbg_ft8719_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&ctx->panel);
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
 		drm_panel_remove(&ctx->panel);
@@ -217,12 +217,6 @@ static int ebbg_ft8719_probe(struct mipi_dsi_device *dsi)
 static void ebbg_ft8719_remove(struct mipi_dsi_device *dsi)
 {
 	struct ebbg_ft8719 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
-
 	drm_panel_remove(&ctx->panel);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index d23002b5a2d7..fdc4bbef5f63 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -256,7 +256,7 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&ctx->panel);
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "mipi_dsi_attach failed: %d\n", ret);
 		drm_panel_remove(&ctx->panel);
@@ -269,12 +269,6 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
 static void kd35t133_remove(struct mipi_dsi_device *dsi)
 {
 	struct kd35t133 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
-
 	drm_panel_remove(&ctx->panel);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
index 8c3a231c147d..13546faa07ad 100644
--- a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
+++ b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
@@ -474,7 +474,7 @@ static int k101_im2ba02_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = 4;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0) {
 		drm_panel_remove(&ctx->panel);
 		return ret;
@@ -486,8 +486,6 @@ static int k101_im2ba02_dsi_probe(struct mipi_dsi_device *dsi)
 static void k101_im2ba02_dsi_remove(struct mipi_dsi_device *dsi)
 {
 	struct k101_im2ba02 *ctx = mipi_dsi_get_drvdata(dsi);
-
-	mipi_dsi_detach(dsi);
 	drm_panel_remove(&ctx->panel);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index c1d8ca5ca6e1..8d16a7254d4e 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -219,7 +219,7 @@ static int feiyang_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = 4;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0) {
 		drm_panel_remove(&ctx->panel);
 		return ret;
@@ -231,8 +231,6 @@ static int feiyang_dsi_probe(struct mipi_dsi_device *dsi)
 static void feiyang_dsi_remove(struct mipi_dsi_device *dsi)
 {
 	struct feiyang *ctx = mipi_dsi_get_drvdata(dsi);
-
-	mipi_dsi_detach(dsi);
 	drm_panel_remove(&ctx->panel);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-hydis-hv101hd1.c b/drivers/gpu/drm/panel/panel-hydis-hv101hd1.c
index 0a96eb0fae1e..7c322aed7222 100644
--- a/drivers/gpu/drm/panel/panel-hydis-hv101hd1.c
+++ b/drivers/gpu/drm/panel/panel-hydis-hv101hd1.c
@@ -144,7 +144,7 @@ static int hv101hd1_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&hv->panel);
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret) {
 		drm_panel_remove(&hv->panel);
 		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
@@ -156,13 +156,6 @@ static int hv101hd1_probe(struct mipi_dsi_device *dsi)
 static void hv101hd1_remove(struct mipi_dsi_device *dsi)
 {
 	struct hv101hd1 *hv = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev,
-			"Failed to detach from DSI host: %d\n", ret);
-
 	drm_panel_remove(&hv->panel);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index 80afeeab9475..5eafddafe4ab 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -444,7 +444,7 @@ static int innolux_panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	err = mipi_dsi_attach(dsi);
+	err = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (err < 0) {
 		innolux = mipi_dsi_get_drvdata(dsi);
 		innolux_panel_del(innolux);
@@ -457,12 +457,6 @@ static int innolux_panel_probe(struct mipi_dsi_device *dsi)
 static void innolux_panel_remove(struct mipi_dsi_device *dsi)
 {
 	struct innolux_panel *innolux = mipi_dsi_get_drvdata(dsi);
-	int err;
-
-
-	err = mipi_dsi_detach(dsi);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
 
 	innolux_panel_del(innolux);
 }
diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 5202c1ffc6e1..92ad445ca70f 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -3251,7 +3251,7 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 	jadard->dsi = dsi;
 	jadard->desc = desc;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0)
 		drm_panel_remove(&jadard->panel);
 
@@ -3261,8 +3261,6 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 static void jadard_dsi_remove(struct mipi_dsi_device *dsi)
 {
 	struct jadard *jadard = mipi_dsi_get_drvdata(dsi);
-
-	mipi_dsi_detach(dsi);
 	drm_panel_remove(&jadard->panel);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index 67ca055f06f3..5325c0f86324 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -862,7 +862,7 @@ static int khadas_ts050_panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	err = mipi_dsi_attach(dsi);
+	err = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (err)
 		drm_panel_remove(&khadas_ts050->base);
 
@@ -872,12 +872,6 @@ static int khadas_ts050_panel_probe(struct mipi_dsi_device *dsi)
 static void khadas_ts050_panel_remove(struct mipi_dsi_device *dsi)
 {
 	struct khadas_ts050_panel *khadas_ts050 = mipi_dsi_get_drvdata(dsi);
-	int err;
-
-	err = mipi_dsi_detach(dsi);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
-
 	drm_panel_remove(&khadas_ts050->base);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 893af9b16756..af0a04a6374d 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -375,7 +375,7 @@ static int kingdisplay_panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	err = mipi_dsi_attach(dsi);
+	err = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (err < 0) {
 		kingdisplay_panel_del(kingdisplay);
 		return err;
@@ -387,11 +387,6 @@ static int kingdisplay_panel_probe(struct mipi_dsi_device *dsi)
 static void kingdisplay_panel_remove(struct mipi_dsi_device *dsi)
 {
 	struct kingdisplay_panel *kingdisplay = mipi_dsi_get_drvdata(dsi);
-	int err;
-
-	err = mipi_dsi_detach(dsi);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
 
 	kingdisplay_panel_del(kingdisplay);
 }
diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 293826c5006b..20238ad31567 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -294,18 +294,12 @@ static int sw43408_probe(struct mipi_dsi_device *dsi)
 
 	dsi->dsc = &ctx->dsc;
 
-	return mipi_dsi_attach(dsi);
+	return devm_mipi_dsi_attach(&dsi->dev, dsi);
 }
 
 static void sw43408_remove(struct mipi_dsi_device *dsi)
 {
 	struct sw43408_panel *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
-
 	drm_panel_remove(&ctx->base);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-lincolntech-lcd197.c b/drivers/gpu/drm/panel/panel-lincolntech-lcd197.c
index 24b34443ace0..22c7e94bc587 100644
--- a/drivers/gpu/drm/panel/panel-lincolntech-lcd197.c
+++ b/drivers/gpu/drm/panel/panel-lincolntech-lcd197.c
@@ -221,7 +221,7 @@ static int lincoln_lcd197_panel_probe(struct mipi_dsi_device *dsi)
 		return err;
 
 	drm_panel_add(&lcd->panel);
-	err = mipi_dsi_attach(dsi);
+	err = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (err)
 		drm_panel_remove(&lcd->panel);
 
@@ -231,12 +231,6 @@ static int lincoln_lcd197_panel_probe(struct mipi_dsi_device *dsi)
 static void lincoln_lcd197_panel_remove(struct mipi_dsi_device *dsi)
 {
 	struct lincoln_lcd197_panel *lcd = mipi_dsi_get_drvdata(dsi);
-	int err;
-
-	err = mipi_dsi_detach(dsi);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
-
 	drm_panel_remove(&lcd->panel);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-lxd-m9189a.c b/drivers/gpu/drm/panel/panel-lxd-m9189a.c
index baaf170779e0..bb64097d7bb0 100644
--- a/drivers/gpu/drm/panel/panel-lxd-m9189a.c
+++ b/drivers/gpu/drm/panel/panel-lxd-m9189a.c
@@ -202,7 +202,7 @@ static int lxd_m9189_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&m9189->panel);
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
 		drm_panel_remove(&m9189->panel);
@@ -215,12 +215,6 @@ static int lxd_m9189_probe(struct mipi_dsi_device *dsi)
 static void lxd_m9189_remove(struct mipi_dsi_device *dsi)
 {
 	struct m9189_panel *m9189 = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
-
 	drm_panel_remove(&m9189->panel);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
index 27e188bb2d7f..50f835c7d84a 100644
--- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
+++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
@@ -280,7 +280,7 @@ static int mantix_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&ctx->panel);
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "mipi_dsi_attach failed (%d). Is host ready?\n", ret);
 		drm_panel_remove(&ctx->panel);
@@ -298,8 +298,6 @@ static int mantix_probe(struct mipi_dsi_device *dsi)
 static void mantix_remove(struct mipi_dsi_device *dsi)
 {
 	struct mantix *ctx = mipi_dsi_get_drvdata(dsi);
-
-	mipi_dsi_detach(dsi);
 	drm_panel_remove(&ctx->panel);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index 22560384e48e..31b95ee49fae 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -399,7 +399,7 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&ctx->panel);
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "mipi_dsi_attach failed: %d\n", ret);
 		drm_panel_remove(&ctx->panel);
@@ -421,14 +421,8 @@ static void panel_nv3051d_shutdown(struct mipi_dsi_device *dsi)
 static void panel_nv3051d_remove(struct mipi_dsi_device *dsi)
 {
 	struct panel_nv3051d *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
 	panel_nv3051d_shutdown(dsi);
 
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
-
 	drm_panel_remove(&ctx->panel);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index 130520558a81..2a96acc96f2f 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -434,7 +434,7 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&ctx->panel);
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "mipi_dsi_attach failed. Is host ready?\n");
 		drm_panel_remove(&ctx->panel);
@@ -447,8 +447,6 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
 static void otm8009a_remove(struct mipi_dsi_device *dsi)
 {
 	struct otm8009a *ctx = mipi_dsi_get_drvdata(dsi);
-
-	mipi_dsi_detach(dsi);
 	drm_panel_remove(&ctx->panel);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index 63ae9dc5712f..c7cd7a7101cc 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -172,7 +172,7 @@ static int osd101t2587_panel_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret)
 		drm_panel_remove(&osd101t2587->base);
 
@@ -182,13 +182,7 @@ static int osd101t2587_panel_probe(struct mipi_dsi_device *dsi)
 static void osd101t2587_panel_remove(struct mipi_dsi_device *dsi)
 {
 	struct osd101t2587_panel *osd101t2587 = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
 	drm_panel_remove(&osd101t2587->base);
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
 }
 
 static struct mipi_dsi_driver osd101t2587_panel_driver = {
diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index d21d93a0700e..f37e069c57d6 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -210,7 +210,7 @@ static int wuxga_nt_panel_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0) {
 		wuxga_nt_panel_del(wuxga_nt);
 		return ret;
@@ -222,11 +222,6 @@ static int wuxga_nt_panel_probe(struct mipi_dsi_device *dsi)
 static void wuxga_nt_panel_remove(struct mipi_dsi_device *dsi)
 {
 	struct wuxga_nt_panel *wuxga_nt = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
 
 	wuxga_nt_panel_del(wuxga_nt);
 }
diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index c3fbc459c7e0..d9bb7066964a 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -198,7 +198,7 @@ static int rb070d30_panel_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = 4;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0) {
 		drm_panel_remove(&ctx->panel);
 		return ret;
@@ -210,8 +210,6 @@ static int rb070d30_panel_dsi_probe(struct mipi_dsi_device *dsi)
 static void rb070d30_panel_dsi_remove(struct mipi_dsi_device *dsi)
 {
 	struct rb070d30_panel *ctx = mipi_dsi_get_drvdata(dsi);
-
-	mipi_dsi_detach(dsi);
 	drm_panel_remove(&ctx->panel);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index c95964ba25a9..c52d30f472c2 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -6551,7 +6551,7 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->format = desc->format;
 	dsi->lanes = desc->lanes;
 
-	err = mipi_dsi_attach(dsi);
+	err = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (err) {
 		struct panel_simple *panel = mipi_dsi_get_drvdata(dsi);
 
@@ -6563,12 +6563,6 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
 
 static void panel_simple_dsi_remove(struct mipi_dsi_device *dsi)
 {
-	int err;
-
-	err = mipi_dsi_detach(dsi);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
-
 	panel_simple_remove(&dsi->dev);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index f16e0de1ea60..b45e2e683fe9 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -1347,7 +1347,7 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->format = st7701->desc->format;
 	dsi->lanes = st7701->desc->lanes;
 
-	err = mipi_dsi_attach(dsi);
+	err = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (err)
 		return dev_err_probe(&dsi->dev, err, "Failed to init MIPI DSI\n");
 
@@ -1381,7 +1381,6 @@ static int st7701_spi_probe(struct spi_device *spi)
 
 static void st7701_dsi_remove(struct mipi_dsi_device *dsi)
 {
-	mipi_dsi_detach(dsi);
 }
 
 static const struct of_device_id st7701_dsi_of_match[] = {
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 70f7282471e6..8b737651b628 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -979,7 +979,7 @@ static int st7703_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&ctx->panel);
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "mipi_dsi_attach failed (%d). Is host ready?\n", ret);
 		drm_panel_remove(&ctx->panel);
@@ -998,12 +998,6 @@ static int st7703_probe(struct mipi_dsi_device *dsi)
 static void st7703_remove(struct mipi_dsi_device *dsi)
 {
 	struct st7703 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
-
 	drm_panel_remove(&ctx->panel);
 
 	st7703_debugfs_remove(ctx);
diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
index 7f04b7b404e7..064e2d2e3045 100644
--- a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
+++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
@@ -315,7 +315,7 @@ static int stk_panel_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0)
 		drm_panel_remove(&stk->base);
 
@@ -325,12 +325,6 @@ static int stk_panel_probe(struct mipi_dsi_device *dsi)
 static void stk_panel_remove(struct mipi_dsi_device *dsi)
 {
 	struct stk_panel *stk = mipi_dsi_get_drvdata(dsi);
-	int err;
-
-	err = mipi_dsi_detach(dsi);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n",
-			err);
 
 	drm_panel_remove(&stk->base);
 }
diff --git a/drivers/gpu/drm/panel/panel-summit.c b/drivers/gpu/drm/panel/panel-summit.c
index 84435be52424..24db8a1353a0 100644
--- a/drivers/gpu/drm/panel/panel-summit.c
+++ b/drivers/gpu/drm/panel/panel-summit.c
@@ -90,14 +90,12 @@ static int summit_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&s_data->panel);
 
-	return mipi_dsi_attach(dsi);
+	return devm_mipi_dsi_attach(&dsi->dev, dsi);
 }
 
 static void summit_remove(struct mipi_dsi_device *dsi)
 {
 	struct summit_data *s_data = mipi_dsi_get_drvdata(dsi);
-
-	mipi_dsi_detach(dsi);
 	drm_panel_remove(&s_data->panel);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
index 3a74d48753d9..ea3fbd0c8662 100644
--- a/drivers/gpu/drm/panel/panel-synaptics-r63353.c
+++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
@@ -267,7 +267,7 @@ static int r63353_panel_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&panel->base);
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "mipi_dsi_attach failed: %d\n", ret);
 		drm_panel_remove(&panel->base);
@@ -281,12 +281,6 @@ static void r63353_panel_remove(struct mipi_dsi_device *dsi)
 {
 	struct r63353_panel *rpanel = mipi_dsi_get_drvdata(dsi);
 	struct device *dev = &dsi->dev;
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(dev, "Failed to detach from host (%d)\n", ret);
-
 	drm_panel_remove(&rpanel->base);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
index 13cfe252a838..92231716568b 100644
--- a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
+++ b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
@@ -195,18 +195,12 @@ static int tdo_tl070wsh30_panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	return mipi_dsi_attach(dsi);
+	return devm_mipi_dsi_attach(&dsi->dev, dsi);
 }
 
 static void tdo_tl070wsh30_panel_remove(struct mipi_dsi_device *dsi)
 {
 	struct tdo_tl070wsh30_panel *tdo_tl070wsh30 = mipi_dsi_get_drvdata(dsi);
-	int err;
-
-	err = mipi_dsi_detach(dsi);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
-
 	drm_panel_remove(&tdo_tl070wsh30->base);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
index fc6516373b5d..f19ffc959115 100644
--- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
+++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
@@ -276,7 +276,7 @@ static int xpp055c272_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_add(&ctx->panel);
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "mipi_dsi_attach failed: %d\n", ret);
 		drm_panel_remove(&ctx->panel);
@@ -289,12 +289,6 @@ static int xpp055c272_probe(struct mipi_dsi_device *dsi)
 static void xpp055c272_remove(struct mipi_dsi_device *dsi)
 {
 	struct xpp055c272 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
-
 	drm_panel_remove(&ctx->panel);
 }
 
-- 
2.43.0

