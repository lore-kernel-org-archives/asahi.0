Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310EB1C5490
	for <asahi@lists.linux.dev>; Thu,  3 Apr 2025 21:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715370; cv=none; b=cZvpJYuf8Sm08GZFD7ezJJi57ADYZm5w0IQ/zzE2LOC3iFj95LUGLqPNaDYUhoJzk8xuXxD1ComnKVy4t0HFTEv3MpMtrLg6e9mv5MkK9rWpCevwpFoKw6P4XNypLgEmQ5eBz1r1/Bphj7QtxuZoFZbVmqTPgVM7SrX5jbCWBLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715370; c=relaxed/simple;
	bh=Y60jr9eG9Rv65xba8qtENIK9RmbFrxmnFOqRsCK2xzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OG4NERNOaJyq30ZPqe8ykN4YGFQLuP/6k02pbXfFSWspwV3JzfkLJEcte8pjDjX3URl8o8C2O5p/O10oDSyxJZBftDs2Di4y0/Av5SuxFBdy+EiD1nFDDK8AI/Ez0TCIndKkxDJcAyVkbSI524BwIiCZDJovzHZA0ss6+m4Pj0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gKfW1Qv7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gKfW1Qv7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9KtWCZE9ZS+Tc5GMSTJncyHUFAPJ6/sYWa4+ceh8sBs=;
	b=gKfW1Qv7E3hhDM0NPuqi3xEym5OlbozlAtUjRlGD+OXHeSIQkmrSPrR+ld8vwW3lkYkg2w
	unkoQES93gOwKhv2+WDZVAi7UK50hqt1eGhkBYt1I7ZFHl8peM4pKNE7d+eOijQdu7r1wO
	Z+ECCAj+xgz7BsTM27pt2Azy8jxHAhY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-80-UOdHA1YiNGStEM4HFbMSEw-1; Thu,
 03 Apr 2025 17:22:44 -0400
X-MC-Unique: UOdHA1YiNGStEM4HFbMSEw-1
X-Mimecast-MFC-AGG-ID: UOdHA1YiNGStEM4HFbMSEw_1743715361
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7A9BE1953963;
	Thu,  3 Apr 2025 21:22:40 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0E8ED1828A9F;
	Thu,  3 Apr 2025 21:22:35 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:37 -0400
Subject: [PATCH 06/46] panel/raydium-rm69380: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-6-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1372;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Y60jr9eG9Rv65xba8qtENIK9RmbFrxmnFOqRsCK2xzY=;
 b=DOQLW00IQBXTRqPPBcUi2QA1SlhMRpOhQil2fAjaEnYm7keq+Arrm1E25KG2WUEVM8Tkw39J0
 ThuZmcTIOzeDx0WCl18MS1bsoyRBo/96wDHCiJYzJ5qKv1nnuR1QkGC
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-raydium-rm69380.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm69380.c b/drivers/gpu/drm/panel/panel-raydium-rm69380.c
index d3071c01aaeae92c8ff1cdec14a01f64a9ae6460..86769cadec972ff0e7f5ba5275a7d6f2afb37ee1 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm69380.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm69380.c
@@ -208,9 +208,11 @@ static int rm69380_probe(struct mipi_dsi_device *dsi)
 	struct device_node *dsi_sec;
 	int ret, i;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct rm69380_panel, panel,
+				   &rm69380_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->supplies[0].supply = "vddio";
 	ctx->supplies[1].supply = "avdd";
@@ -248,8 +250,6 @@ static int rm69380_probe(struct mipi_dsi_device *dsi)
 	ctx->dsi[0] = dsi;
 	mipi_dsi_set_drvdata(dsi, ctx);
 
-	drm_panel_init(&ctx->panel, dev, &rm69380_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	ctx->panel.backlight = rm69380_create_backlight(dsi);

-- 
2.48.1

