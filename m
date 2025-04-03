Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692D61F4603
	for <asahi@lists.linux.dev>; Thu,  3 Apr 2025 21:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715417; cv=none; b=C0n4DhmKWehc29dWMxewL6RYUDB1spl8qiOEKnA03V0psFLTnN9uyK9K58WkCPmiUwXIToXrcVuVaOi4G90Kif5bz2Aoa/Fk13r0hIRLKELgQTDlITozvePE/Kjq8P52t43MlDwbiHho/Mwuq9S4yPPFMnQXcKRlFKrqwa8CK8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715417; c=relaxed/simple;
	bh=AUwsWBT7Y8Avm3PdBAdS2q5e+Sadl7UadPxhUHFmMOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LIPk7zhZN43dCInGY4oBhfJVBgdzbFXM733Pu82P90EO1QToP13K5ACREJPgnrrE9Sa0mdhFVYEtQT/dkQsTwT81kjecW2hfKGXkMqWWRA4ySq0751mZiu29CxGcejiEARUl0kAf/CpxblTVjL3yS4lzKrMVliuU6O9SGLD405c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y3HKDkR5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y3HKDkR5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N0t44LCNumBTiyWRR3E46ec0dPhnjgHHfy9ipawBLrg=;
	b=Y3HKDkR5dmwzn6uJm3aS/EvXeXYt8M3ghiVlGqFKi264qsepMDwRefg95Jgzq4ypin9B+P
	FCwpTwzHvtXzACasG88yXoKuZEqTMRD10PAsbPRplzFlq/Ll82DOZ4av8waqCw+hTW7wDP
	H2VMWVS6ltp3fFhkX3gtFI4CEe4gJrw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-576-psaehkSpN0yV44SxixjEvQ-1; Thu,
 03 Apr 2025 17:23:30 -0400
X-MC-Unique: psaehkSpN0yV44SxixjEvQ-1
X-Mimecast-MFC-AGG-ID: psaehkSpN0yV44SxixjEvQ_1743715407
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9D3FF1801A1A;
	Thu,  3 Apr 2025 21:23:27 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5AE721828ABF;
	Thu,  3 Apr 2025 21:23:23 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:46 -0400
Subject: [PATCH 15/46] panel/samsung-s6d7aa0: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-15-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1375;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=AUwsWBT7Y8Avm3PdBAdS2q5e+Sadl7UadPxhUHFmMOw=;
 b=KFfirhCnRKavnLv/zVi5dHp5VA0e1pC/FvdQzZkOmYywc75EoCxKDSr/TF6UmnDdAaNaFfrqu
 IMMmFGBoWLXAE6oowEwOyiWWKPTe/SIHqMHmxaa2HD7EIN1CfMi4OKp
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
index 93f11e2e9398782ed10c70159c25fbd5d9f4eb4c..b5b9e80690f66cc62acbd341865d8d47419e498b 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
@@ -392,9 +392,11 @@ static int s6d7aa0_probe(struct mipi_dsi_device *dsi)
 	struct s6d7aa0 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct s6d7aa0, panel,
+				   &s6d7aa0_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->desc = of_device_get_match_data(dev);
 	if (!ctx->desc)
@@ -420,8 +422,6 @@ static int s6d7aa0_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST
 		| ctx->desc->mode_flags;
 
-	drm_panel_init(&ctx->panel, dev, &s6d7aa0_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	ret = drm_panel_of_backlight(&ctx->panel);

-- 
2.48.1

