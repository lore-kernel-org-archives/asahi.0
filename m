Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625731A317D
	for <asahi@lists.linux.dev>; Fri, 30 May 2025 02:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573471; cv=none; b=tbarrGS6jVjabxrHjMaUmZ6VincXqgt4FyayVhskCiObJKrybNVnpa4Y8rBAVxcUcLQ/0NazZBd9YQPpITh0YrzfoS4pxfuHDpFraQUsGn4bvlLUvjHan+Z8Zh5iYWyYlgrYlkHeLKrtuKBPwt+4iS6amMu6JCkxC3S+/iPimu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573471; c=relaxed/simple;
	bh=ABSmLaqTevu5bfArcP+tmAyoAR1v9+OT0dG/TK1RDlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XQFmpI4EOxVfZu78ficGHF1gZISTJFtEK2nNEO+IkMl6twgKitLzefR8hvAOjAU9dXlT807cJIHxx0ZR9wZfm4SJNpKhh2MHhvu/is4ySqddPFtYsR1Tc5EUVycZcSCxJLWicKpXxl//2P1q9JORY0/lGGh7TbE2G2dAX+2BUtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g62IE7cq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g62IE7cq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AS2hIKd63FMg+Xp6dwNrhHPlNwnhHlscb4h/zsB8+mk=;
	b=g62IE7cqrAnPYK+ld/3HtJOXshc7huJaCW642yl/X/ng9vfLXYnGwdCD/KNrgDv+RTlc4s
	FaWGH3JnupWSS7X/m6KtAFoTjJTW5Xf5FyEHDyKqFm9ZpCZ9QsjeWr9b7qmBz5dKv58RaL
	EfURdFmncewcbDIS2XSVyyxu3x2gmiw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-189-cSLiObOeP-OoYfG_s1JU6g-1; Thu,
 29 May 2025 22:51:04 -0400
X-MC-Unique: cSLiObOeP-OoYfG_s1JU6g-1
X-Mimecast-MFC-AGG-ID: cSLiObOeP-OoYfG_s1JU6g_1748573461
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 683EC195608A;
	Fri, 30 May 2025 02:51:01 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E4C5B1955D82;
	Fri, 30 May 2025 02:50:56 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:16 -0500
Subject: [PATCH v2 14/46] panel/samsung-s6d27a1: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-14-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1388;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ABSmLaqTevu5bfArcP+tmAyoAR1v9+OT0dG/TK1RDlw=;
 b=HcXAarqgk2xOHzy/8jLwG150yE3y6BecPL5wAoGN0QkF316Ue8oZzoSgWeOKUJUaRK3BWDo6Q
 s4+PijjOM9zAmvYrYXPy2+6HrQN92GGPRZ8zhi7CfmgW88DuC52RVdB
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
 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d27a1.c b/drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
index 2adb223a895c9c89703abcf1148fbe9bd6c0da41..300dc19bd9d135ec889f9604fb14637bb60fc250 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
@@ -247,9 +247,11 @@ static int s6d27a1_probe(struct spi_device *spi)
 	struct s6d27a1 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct s6d27a1, panel,
+				   &s6d27a1_drm_funcs,
+				   DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->dev = dev;
 
@@ -277,9 +279,6 @@ static int s6d27a1_probe(struct spi_device *spi)
 
 	ctx->dbi.read_commands = s6d27a1_dbi_read_commands;
 
-	drm_panel_init(&ctx->panel, dev, &s6d27a1_drm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add backlight\n");

-- 
2.48.1

