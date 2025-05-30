Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3111917CD
	for <asahi@lists.linux.dev>; Fri, 30 May 2025 02:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573619; cv=none; b=jqoLNV+0tI5/W+R/pCYhjhMzgAmqTTyzI47Ybo6+8qyElMWfsd+nPzH0VcCxp3rpGtDBl1aAiZFnzlrnrph1oumVU4p6nCF3WGQLq/KHw0H8NuIpSWitGJFX5bDhcOaYCvCkfrRw80kUCrzmVayq3zn/B+kmiOxQjVqY/TPmMIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573619; c=relaxed/simple;
	bh=Ns3KZcCScqLIrOWJtSVXuxhBcf9g20rHBbpNHaKBi2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQdyPGBwreN4yFWv6fBNrD2w/noAaZDQ+bgyL2OqfbY2bc5fnGffsB15dov+r5OflNirxCWCeQUhbTPcoqQ2RfbZWfYYI5QAykW8UBDhK3Pf83apwp3VJDHYouyJRsvfqfnsC+OzavTEokI8ZVxpYrkzd37/AJaCtAh6yV36zIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CGLFyDpP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CGLFyDpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74SclIvUl+rBYfZpkAqBGlLwXHIM9kixx60f/Kisefs=;
	b=CGLFyDpPwrOTZhTH3hth4X9PSvvx3LfcSSYEY/2Rb+AtT/Gdw/bP1adTb2F9uFNROgSmrc
	fI/36nObr8dl44t2rApYwfQfRy3XqDrSEZMoVHXCncBGwu46xQVhzxsmphKtwQPIW41du8
	WV/rhwm6ir9zHkH/yT8nlR2ueusAE6Q=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-437-I8ob_dAUPKaOWaxPgqE1vw-1; Thu,
 29 May 2025 22:53:32 -0400
X-MC-Unique: I8ob_dAUPKaOWaxPgqE1vw-1
X-Mimecast-MFC-AGG-ID: I8ob_dAUPKaOWaxPgqE1vw_1748573609
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C8C781800446;
	Fri, 30 May 2025 02:53:29 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 251681955D82;
	Fri, 30 May 2025 02:53:21 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:43 -0500
Subject: [PATCH v2 41/46] panel/widechips-ws2401: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-41-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1346;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Ns3KZcCScqLIrOWJtSVXuxhBcf9g20rHBbpNHaKBi2M=;
 b=2/HL+x7i79ks4wAeZzuuoNBzIs54bkIMhvjDAY576CNmaYOiwZmzoT6so8E2HLayp3FFkyIP2
 KhFcIQn+8w2AHMNI0hGJev4NaYDpp2wGhjDrsdT/sK8j7076UI6Ys8x
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: fix alignment.
---
 drivers/gpu/drm/panel/panel-widechips-ws2401.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-widechips-ws2401.c b/drivers/gpu/drm/panel/panel-widechips-ws2401.c
index 2591ff8f0d4e8b84b7283718bf05684e8d44d1f5..dd74610bd2eb870bbdb74bfce7a1b88ee5d1abc6 100644
--- a/drivers/gpu/drm/panel/panel-widechips-ws2401.c
+++ b/drivers/gpu/drm/panel/panel-widechips-ws2401.c
@@ -347,9 +347,11 @@ static int ws2401_probe(struct spi_device *spi)
 	struct ws2401 *ws;
 	int ret;
 
-	ws = devm_kzalloc(dev, sizeof(*ws), GFP_KERNEL);
-	if (!ws)
-		return -ENOMEM;
+	ws = devm_drm_panel_alloc(dev, struct ws2401, panel, &ws2401_drm_funcs,
+				  DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(ws))
+		return PTR_ERR(ws);
+
 	ws->dev = dev;
 
 	/*
@@ -379,9 +381,6 @@ static int ws2401_probe(struct spi_device *spi)
 	ws2401_read_mtp_id(ws);
 	ws2401_power_off(ws);
 
-	drm_panel_init(&ws->panel, dev, &ws2401_drm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	ret = drm_panel_of_backlight(&ws->panel);
 	if (ret)
 		return dev_err_probe(dev, ret,

-- 
2.48.1

