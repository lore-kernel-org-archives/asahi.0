Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C731FECDB
	for <asahi@lists.linux.dev>; Thu,  3 Apr 2025 21:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715524; cv=none; b=c5aXNdKNV3BOHyRmCwGTFGo+Ro9UaEN8C0MGgp/3lc6jA2mGNw0Abdpr0MmdUVYsKS1IWkMFOy8LODbLrOwXIUtFOVbdTvgpy1uU2y/69e36vBH+lLytJd1scTrML3xo38mG61Xn7sR5tbIxgViQ8LaGCzK2GmcyD9N2t+fnA6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715524; c=relaxed/simple;
	bh=w+qxvuPGpSVbQugCSxy4NGN0pUw7kPAHuuLKPxsXbDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MgHgT1zdZZQO//FWbDbp/tZG5Rfk1OpAA5HIGJ9MtXCO+ZMr+opKNND+RaPnjwupYJ0+Wa2R6l9dyr+pTeQ9oHX8+6fSSG32gTPZP2EzkDUNcLkHseIDAlaEjkGXUEg84kpiRdABrKb41d19NIbSDeqxhaGXjPcgVQUSxpch0/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AYmZ/Yze; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AYmZ/Yze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hi2ORnBSLli+1bh1ed4Bn0wRQE+sdXnlG776tMGiVU=;
	b=AYmZ/YzemEdeaa4LvmjIUEhcLiRVnb6biv4hBYqGiNDvfAvfl9fe6EIS+jI2wHMAflpTYi
	DRFjk7ueilIPqrXAuGZZAQy9Sl3I+eLyfnnUDw2Qbm+fdQNQxp+7lX4grjWDotWShFWL2m
	Jf6oWtsIXKmGs75INHWTzHauPGeF85M=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-101-hRGvBQMROWCBxJjKwthB_w-1; Thu,
 03 Apr 2025 17:25:17 -0400
X-MC-Unique: hRGvBQMROWCBxJjKwthB_w-1
X-Mimecast-MFC-AGG-ID: hRGvBQMROWCBxJjKwthB_w_1743715513
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 901A619560B3;
	Thu,  3 Apr 2025 21:25:13 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4943D180A803;
	Thu,  3 Apr 2025 21:25:09 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:21:08 -0400
Subject: [PATCH 37/46] panel/visionox-r66451: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-37-965b15ad5b8e@redhat.com>
References: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
In-Reply-To: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Chiras <robert.chiras@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1491;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=w+qxvuPGpSVbQugCSxy4NGN0pUw7kPAHuuLKPxsXbDE=;
 b=oUCdSAcY+oTjczj9/YFiiCUogHeLBXfVd1Vo0dHRF27W34qmIDJS+bQ3eZUKvzO/Gp28N9kLj
 uJs5HnndPXBCshTwgp7yPK1dWxqnxKGdIl22QnqxmIiILFmmgZdlozL
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-visionox-r66451.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c b/drivers/gpu/drm/panel/panel-visionox-r66451.c
index 3ea0a86f6e69f3cf0c759d38a21582797bd379bd..690cccedd438fe000ab9b7b4e912988d64a9ad35 100644
--- a/drivers/gpu/drm/panel/panel-visionox-r66451.c
+++ b/drivers/gpu/drm/panel/panel-visionox-r66451.c
@@ -255,9 +255,11 @@ static int visionox_r66451_probe(struct mipi_dsi_device *dsi)
 	struct drm_dsc_config *dsc;
 	int ret = 0;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct visionox_r66451, panel,
+				   &visionox_r66451_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	dsc = devm_kzalloc(dev, sizeof(*dsc), GFP_KERNEL);
 	if (!dsc)
@@ -297,7 +299,6 @@ static int visionox_r66451_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
 	ctx->panel.prepare_prev_first = true;
 
-	drm_panel_init(&ctx->panel, dev, &visionox_r66451_funcs, DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.backlight = visionox_r66451_create_backlight(dsi);
 	if (IS_ERR(ctx->panel.backlight))
 		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),

-- 
2.48.1

