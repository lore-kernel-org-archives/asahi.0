Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30B81DF72C
	for <asahi@lists.linux.dev>; Fri, 30 May 2025 02:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573458; cv=none; b=OLd7TEzW2aXmn7+ms8wdeftsEAQG9PB0RTrJcjGv9Pq0MRRYG+fdfJdsc6H9xUny+v4b958jBjcdhrWXUHpJ2pwub4KjwOFuyJagldJkUjiCseKgSyfJ2SXFkIzhcIW3Svq7ORW54anOp5n83a2LskL8N0UOtJfrmXPfu0yx1Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573458; c=relaxed/simple;
	bh=oBayIUXvN+8iaTrRGPTJL/IiRpz5GnM6FozSWN71S1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eeZk2tPwJtthVrZrZtB4N66JPK7CT0fh++UiONzPkd9vVyY0i1na149Sp9nMsb2OIQiNjRmS74xxk4cbUUSQIwwuuNPUnXULpU8bTgsK5x1PW4zYWIvKAju/XZSDzaM+h6SjI7eQBY99PQ5LQj9szVZg2YcOA85kv4x261mx5gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IiW1bGlv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IiW1bGlv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LOfzl2fViUc37WFFbCGqSq+lDITqKThl0M1kYhsXbY4=;
	b=IiW1bGlvlQcFbpKZ0paInc7nK3PWV4L+fdZPv0Q8bg9sA539mL+CQeVLmPp8Ly8eOEiD5n
	7A2q3z7NCIlChcNeQSbekEfzWWhSWjUk/LzOUtmzXE+53Dkk0ItPj/2WtCH+JvvqdSQAyY
	Zq5OdETmdA1ndTCsBsFVVb1cJV2DNNY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-107-C-7X_f1BM4ahBtaNPzmopg-1; Thu,
 29 May 2025 22:50:54 -0400
X-MC-Unique: C-7X_f1BM4ahBtaNPzmopg-1
X-Mimecast-MFC-AGG-ID: C-7X_f1BM4ahBtaNPzmopg_1748573452
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E7C2719560B1;
	Fri, 30 May 2025 02:50:51 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7CAFB1955D82;
	Fri, 30 May 2025 02:50:47 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:14 -0500
Subject: [PATCH v2 12/46] panel/samsung-ld9040: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-12-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1372;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=oBayIUXvN+8iaTrRGPTJL/IiRpz5GnM6FozSWN71S1s=;
 b=yMIiYe3dkjvOJ39O6lXU5e63/GS1MA3ySa1APV4TIFHkLfpQ5ibWhuqACfoShJiegeq6Ab64/
 0bGJkT24OHhDzAalt+Jplu+B3A6teACGmKiTcaNYxVRbL1shKu2XnU7
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

