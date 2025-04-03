Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C394E1A317E
	for <asahi@lists.linux.dev>; Thu,  3 Apr 2025 21:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715383; cv=none; b=Y3T9uL72xNFz1qPKlgiEDt9voDROhCBGGXDcout4ceN8hOF2azYARzMztZwtlNWJo5tADOV7Nyyr1kPaNhtCS4Y7DXLgoUvsFr3KnZbWjInvgd/nwfIibyA7+G8Prr+f/rx2D2+NdqOJmAeQXzgSpWEMHDqXOCS3ZVxbmgdOmyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715383; c=relaxed/simple;
	bh=/vqyN3k+np22srolUD8Q1vCIyJIBYZ5Yz5oSVK5UePg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SkYw7uXztr79At8JaBVeLV7tl8UweeEe0pbjXnmBQeoqH4m+babEPu6pWvsMvlZHVfl9sV0yPak8TrI1+H8ELUCg3wxbMNaliQvi+EFdEzbbvM5M5RTW6Jgyh2NGR2lqYYzS/58ltwWAxtcovs2unT/klajyFVeXqSC27EW5sIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SQ8bZMMF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SQ8bZMMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OyFM25wusHZuAOcZ/PCc4thyrS3+dZMcXF1uIFgQSgc=;
	b=SQ8bZMMFzHZTnzWZ3yPlGgsb/EEuQNgLvuXYNYH736krXODLDWPnCJVElsHjE8qVhdw5XU
	45hmmgNcJavbuEjgrWT+l3fFzuVNGSMzar9CcUF1jk1BJLWcXtCCPwB6KHMyT7PMyR5NLZ
	nhz2r0Ff6i1DgskTnuQxgzR8ag/I+dI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-463-wiw_BGoXNXebZiPPYH3vEQ-1; Thu,
 03 Apr 2025 17:22:55 -0400
X-MC-Unique: wiw_BGoXNXebZiPPYH3vEQ-1
X-Mimecast-MFC-AGG-ID: wiw_BGoXNXebZiPPYH3vEQ_1743715372
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DA949186096B;
	Thu,  3 Apr 2025 21:22:49 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DD3661828ACF;
	Thu,  3 Apr 2025 21:22:40 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:38 -0400
Subject: [PATCH 07/46] panel/ronbo-rb070d30: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-7-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1483;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=/vqyN3k+np22srolUD8Q1vCIyJIBYZ5Yz5oSVK5UePg=;
 b=RQsELTyP2EOdMF6R+bbjKWhHP4tr5W6C3+qtcvwlG3WfI6X2dU6kT5GxRlpxl5/1YA4JPtrbL
 jWzxW2THkr6CqrvxnnbRv7WSkL3F9DiO5iz5C7Sn9xMSPMJG9c2kR2L
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index 2ef5ea5eaeeb2062372c594d077bd070975119ed..ad35d0fb0a16787ffb87c365c9939c78ff42d67a 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -143,9 +143,11 @@ static int rb070d30_panel_dsi_probe(struct mipi_dsi_device *dsi)
 	struct rb070d30_panel *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(&dsi->dev, struct rb070d30_panel, panel,
+				   &rb070d30_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->supply = devm_regulator_get(&dsi->dev, "vcc-lcd");
 	if (IS_ERR(ctx->supply))
@@ -154,9 +156,6 @@ static int rb070d30_panel_dsi_probe(struct mipi_dsi_device *dsi)
 	mipi_dsi_set_drvdata(dsi, ctx);
 	ctx->dsi = dsi;
 
-	drm_panel_init(&ctx->panel, &dsi->dev, &rb070d30_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ctx->gpios.reset = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->gpios.reset)) {
 		dev_err(&dsi->dev, "Couldn't get our reset GPIO\n");

-- 
2.48.1

