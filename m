Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBB71F12E7
	for <asahi@lists.linux.dev>; Thu,  3 Apr 2025 21:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715404; cv=none; b=Kn6TkJDIahs7WtuEdrbbZI+Au4v5e7ZYE88ZfeIFdzmi3MCBxTrI1rYgUgXVXyA84AuJcT0CWwC1QQPEwsmYBjRTBrro0r2EVQWghb7xpsfgFffj7SLKi4b4SVKMTNP8hOjjCturhdxyuXbb6GCCrNdHNkmTmsE0Cql/cvCPAXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715404; c=relaxed/simple;
	bh=kHEU0vbK262UK39wDcA9C4YEifrauAz8Eo4OSOvMFe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gR9kwqjx+KkB69xm6xsVI0xSfLqs93NjvgOO7jhyq/tG8jF4oEVpMufWBAbfghb47Jxp4b+PNIDSbi0AGh3azbM6yKbPjDVuqipPwM1tSJnOSvOeAkiOPW/wUH8ndNCW3EiQTP4EiDZBhR6veDxJAflvdr9W7rcee7+5rYb+YPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M8GUVQWP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M8GUVQWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WtDD4psvehMqoPDauFzp4quAlC/Z4QtnPL6Yv3xQNKs=;
	b=M8GUVQWPsMileTu/coRBBjJ3ozB+gw+q27U2vDh5mX1CfHt1T25rQExBKXs1zlkYpr7nEi
	0dr/Z/ATMM7VvhMOe45ouC6bpkAQFhTvfRchfZ7tIT8MWOYyVB/nqmXc7nsIxnhulW7rbN
	KsS6emeJGG8Jo1q5ihDCMVbCzEEKUM8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-130-RXZ95Cb_M9Kdsa_mn9az7Q-1; Thu,
 03 Apr 2025 17:23:16 -0400
X-MC-Unique: RXZ95Cb_M9Kdsa_mn9az7Q-1
X-Mimecast-MFC-AGG-ID: RXZ95Cb_M9Kdsa_mn9az7Q_1743715393
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 623191800265;
	Thu,  3 Apr 2025 21:23:13 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1CFCA1828A9F;
	Thu,  3 Apr 2025 21:23:08 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:43 -0400
Subject: [PATCH 12/46] panel/samsung-ld9040: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-12-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1299;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=kHEU0vbK262UK39wDcA9C4YEifrauAz8Eo4OSOvMFe8=;
 b=WJwxQLGvnTjmM7c6QsiG14lD9YrjfLGxcAMSj0hZFhUmSPRBIfwOQtNtB8dwqHIb2EzXWWdqK
 3v2QnGYK+mKCNLuAkkMiMuvfHXzEz/ukYePQxnjfKm5oSi2SIJz8J2X
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-samsung-ld9040.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
index 9f438683a6f6e872317af879d1d9518551b08987..c7f2241523a07dfeb7c1cb02c4b4e4758382ae76 100644
--- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
+++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
@@ -339,9 +339,11 @@ static int ld9040_probe(struct spi_device *spi)
 	struct ld9040 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(struct ld9040), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct ld9040, panel,
+				   &ld9040_drm_funcs,
+				   DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	spi_set_drvdata(spi, ctx);
 
@@ -373,9 +375,6 @@ static int ld9040_probe(struct spi_device *spi)
 		return ret;
 	}
 
-	drm_panel_init(&ctx->panel, dev, &ld9040_drm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	bldev = devm_backlight_device_register(dev, dev_name(dev), dev,
 					       ctx, &ld9040_bl_ops,
 					       &ld9040_bl_props);

-- 
2.48.1

