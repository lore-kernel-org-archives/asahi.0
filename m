Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8CF1A2872
	for <asahi@lists.linux.dev>; Fri, 30 May 2025 02:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573561; cv=none; b=NNhSY59C8Osu1VQRBM9ECU0EAOx5NtTyiqAu67o5WAz3xjaVuo+sG0mlWSdYh1qpTlgMtJZva+DiTFKkNLWE+LQmj7wJA65VfHz6BdAb9Ofxf2GrTv3x78Q2o5R0N4wewUwDTOtQXiHvby70mnRqw45s3J5/t+16oWatpaks3Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573561; c=relaxed/simple;
	bh=nQICs1jxitzDInMhmfwCuDqh/MQujXHZ7USZm1fdiSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9lNg0KpH6PAwhscY/kCslwP3UZHgYWOCZ61wECwvxyK6ZNZdtciBPSbmx8E9Wpch7eFs82l6JKaG2oJV8B2uqWNfAXVfp0QYTMhApaVxMMDfkFIl2BwRoOAeWiVK7vl6fRfcVZbG/Nq6KVmpGX0v+7wNZsWGz/ANqeIp4zO4Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C2a+3N79; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C2a+3N79"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vajfhnfHqawIqhOaSHsC1qlXFa4ZgW/NVqQj7pPIDeQ=;
	b=C2a+3N79H3zvAHcfoLgEsPBzKMFs1owIQT0FAHsh6nFiRH2gPT6n7i7KY2u0/wrWdr7YyB
	xpZCnZnsoOmKyd1xHKJyB//awZw68FsbojKbC+O64ClnUwJt7Mo3j7JbwbjNE24L5/DngS
	le0eV8Ue73BrjAtFwdYO4grEbb7K6ZM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-SkX5Wz_fPIG8bTTTDAQqNg-1; Thu,
 29 May 2025 22:52:35 -0400
X-MC-Unique: SkX5Wz_fPIG8bTTTDAQqNg-1
X-Mimecast-MFC-AGG-ID: SkX5Wz_fPIG8bTTTDAQqNg_1748573552
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 40EC9180034A;
	Fri, 30 May 2025 02:52:32 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B670F1955D82;
	Fri, 30 May 2025 02:52:27 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:35 -0500
Subject: [PATCH v2 33/46] panel/synaptics-r63353: allocation in place of
 devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-33-5d75a3711e40@redhat.com>
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1472;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=nQICs1jxitzDInMhmfwCuDqh/MQujXHZ7USZm1fdiSg=;
 b=4q/XAqqd74KnO/HyTG1x/jyQZA/LapSvfBAQp3GLlwjNS/3R9VTdAp1gorOXEu/j8Kd0nDKSC
 cGFuwIhj7SOBMKVs3U3c3hSLgvNWkykBfWpFBbyJ6RXXnfueXjwvpNW
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
---
 drivers/gpu/drm/panel/panel-synaptics-r63353.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
index b148e6cba9bd1184a8c3e9e264e31536ad78ce28..3a74d48753d9c55d4b5618fbc1167f28bc5f6c5e 100644
--- a/drivers/gpu/drm/panel/panel-synaptics-r63353.c
+++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
@@ -229,9 +229,11 @@ static int r63353_panel_probe(struct mipi_dsi_device *dsi)
 	struct device *dev = &dsi->dev;
 	struct r63353_panel *panel;
 
-	panel = devm_kzalloc(&dsi->dev, sizeof(*panel), GFP_KERNEL);
-	if (!panel)
-		return -ENOMEM;
+	panel = devm_drm_panel_alloc(dev, struct r63353_panel, base,
+				     &r63353_panel_funcs,
+				     DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
 
 	mipi_dsi_set_drvdata(dsi, panel);
 	panel->dsi = dsi;
@@ -258,9 +260,6 @@ static int r63353_panel_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(panel->reset_gpio);
 	}
 
-	drm_panel_init(&panel->base, dev, &r63353_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	panel->base.prepare_prev_first = true;
 	ret = drm_panel_of_backlight(&panel->base);
 	if (ret)

-- 
2.48.1

