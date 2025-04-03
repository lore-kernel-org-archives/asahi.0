Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA7C1DEFC8
	for <asahi@lists.linux.dev>; Thu,  3 Apr 2025 21:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715385; cv=none; b=Wrm4Z1xKWiGcJuMEnErFIyPqqhhFBJ8ie8tWtR9PXCfCzNhdLZBxXXan3G8QXQQLolMepX4M5qQ5rOr7e5QZk2tD2gu0JkR3g4eV8mKXDb3giskEPLjQaqhvrtEenhQtQAs7ot/4RBa4clGh2hxTVdBQpgi9CTXCqsf53lqLx/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715385; c=relaxed/simple;
	bh=f19SftKY8vgIdNvqobVvsS/5dOFeIjJganC2RK5OJYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y+v1GHm2zv+HNfyJAQk6rwUw1pVBce9ZpeaHbiDMl+AXiwsqC4ZUz2ETjKF1mS4NtFqaFpioqL/Ug/7IbrKz2INBvAIXbNqf2KurjVC0+f7TJi2Lhl+aITb/xasetMRxr4ZvLYb4Ktvx8HifLJtEy5JkqKIpUMlLddnejfeuoxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dpqPhEb7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dpqPhEb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jox6hNUZFyRp1cv9ONmTlr9rD1sUNWRf6RXN0RJm5to=;
	b=dpqPhEb7ENCN/TRoaV3wDGfvqEgmWXANPydS1+35ZeOcz5dVaEeSCHBCzn1/ZNXRaFLAoa
	xjhmr6/9dNNt57yQS0Gq1Ao8KLkhrKa2puP8fF4z6ldy+CDJN8JVDpf3SGCy/JQpz7Y9Vo
	GzQ4B+lIH3Mhmt5FxZ5QTSPjSY+fkto=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-474-CWpZLvaiPEqu3bQBElrGDA-1; Thu,
 03 Apr 2025 17:22:58 -0400
X-MC-Unique: CWpZLvaiPEqu3bQBElrGDA-1
X-Mimecast-MFC-AGG-ID: CWpZLvaiPEqu3bQBElrGDA_1743715374
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 85BB2180025B;
	Thu,  3 Apr 2025 21:22:54 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 342301828AC0;
	Thu,  3 Apr 2025 21:22:50 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:39 -0400
Subject: [PATCH 08/46] panel/samsung-ams581vf01: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-8-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1466;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=f19SftKY8vgIdNvqobVvsS/5dOFeIjJganC2RK5OJYE=;
 b=+4jfgxl1U2VkZfBm0xAg1UOq3nAWouS02H5Xqu6HCieCsgrdTxJsA3KhsieeWAkSfR4g/8COh
 lCatww9SBAhCMP138l+VBvkn9FfSmvnt89Vhl+B3r9l7y1hD74kaxyI
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-samsung-ams581vf01.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-ams581vf01.c b/drivers/gpu/drm/panel/panel-samsung-ams581vf01.c
index cf61863122520ea1c2f6179bf51cef01d26db45e..188dd7cf0297f59e716dcd8aba3b03684d723bf9 100644
--- a/drivers/gpu/drm/panel/panel-samsung-ams581vf01.c
+++ b/drivers/gpu/drm/panel/panel-samsung-ams581vf01.c
@@ -211,9 +211,11 @@ static int ams581vf01_probe(struct mipi_dsi_device *dsi)
 	struct ams581vf01 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(&dsi->dev, struct ams581vf01, panel,
+				   &ams581vf01_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ret = devm_regulator_bulk_get_const(&dsi->dev,
 					    ARRAY_SIZE(ams581vf01_supplies),
@@ -235,8 +237,6 @@ static int ams581vf01_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
 
-	drm_panel_init(&ctx->panel, dev, &ams581vf01_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	ctx->panel.backlight = ams581vf01_create_backlight(dsi);

-- 
2.48.1

