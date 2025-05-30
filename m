Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6802135DD
	for <asahi@lists.linux.dev>; Fri, 30 May 2025 02:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573514; cv=none; b=M0I18nCWO7aOmc4naINezIoVP5cTWAJGgJA4/3KDuQYP7140L3CJ3+d5zcUe7LmCEzYZwuk48zX7xcJnTS6+JWovANfgl7JL19M7t0km55Fyh9XVAvbAaKLnM+39cyLhiKwEF2/bnmBdhXpkarhu4/GPIA4KRFi3JnPugy/3WHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573514; c=relaxed/simple;
	bh=mOydvWxhgCz8Daz0E6kkR/U2cY12XZilDTWu1Ewy/O4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B49wi7UiVYNGSEltvgnLOmVf3ZXRZA3FuM+btGplGTSulGjOjVHcQBp5+qOpqU5tCcdKpgP7GwHNBs81RWowxmcoWMMBB4gTeZDt8y0SDmFsL2Cv11dXAIBGXIi449DDdo82+1phdgGpdSx8c/N5OUIa5/vpRZKP4p6UREmkcaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HGH6W0Nt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HGH6W0Nt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GyvvJOkIKbLTvBeRzbJji4RMPGPkXp1Wy75edFdkPdI=;
	b=HGH6W0Nt9sqbi2iovtWMC6lJNLKukBs4CAyy7HNraLamDn6jLTVM8eIaDaGLdx4H4tiXJv
	xommxBw4ZYvaP8DWQR31/qxdhm8Hmve2JeivMHLhPaQD0zNDzEQvBAfY4lPUBTyAPwR/zQ
	9Emgv+1ZAtClRWQEJVx7yh7f2SW7BjA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-Qe3ENpAKN8mNR20en35DWQ-1; Thu,
 29 May 2025 22:51:46 -0400
X-MC-Unique: Qe3ENpAKN8mNR20en35DWQ-1
X-Mimecast-MFC-AGG-ID: Qe3ENpAKN8mNR20en35DWQ_1748573504
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EE156180036F;
	Fri, 30 May 2025 02:51:43 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 90A071955D82;
	Fri, 30 May 2025 02:51:39 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:25 -0500
Subject: [PATCH v2 23/46] panel/seiko-43wvf1g: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-23-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1422;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=mOydvWxhgCz8Daz0E6kkR/U2cY12XZilDTWu1Ewy/O4=;
 b=rNV7KeUaUvFdMuFPWRmgdrWy2J2zTBKFtpXT+owO19C5it2zySt5rLynzuCO0bFP6cBGmK7GJ
 6AyUTwif23AA/L1wFT2FhamiEcpcllHMGMBV4IWXz2alWSXwYkM+L7Q
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: Use the correct connector.
---
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 7d1b421ea9ddfcf84850a2fc589f7a43e24fc167..0935d83ee2db3cbec5744adfc6d1ad933537e580 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -204,9 +204,11 @@ static int seiko_panel_probe(struct device *dev,
 	struct seiko_panel *panel;
 	int err;
 
-	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
-	if (!panel)
-		return -ENOMEM;
+	panel = devm_drm_panel_alloc(dev, struct seiko_panel, base,
+				     &seiko_panel_funcs,
+				     DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
 
 	panel->desc = desc;
 
@@ -224,9 +226,6 @@ static int seiko_panel_probe(struct device *dev,
 		return dev_err_probe(dev, PTR_ERR(panel->enable_gpio),
 				     "failed to request GPIO\n");
 
-	drm_panel_init(&panel->base, dev, &seiko_panel_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	err = drm_panel_of_backlight(&panel->base);
 	if (err)
 		return err;

-- 
2.48.1

