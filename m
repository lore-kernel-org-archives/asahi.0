Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344DA2E62DF
	for <asahi@lists.linux.dev>; Thu,  3 Apr 2025 21:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715565; cv=none; b=thmr3gK7gtiQBHGfMV5vRTFvaPG9XlWAKi5vTgXAlxsYz5/sHug4v4I5NMTJiCXsOC4cGSVoy/42vnRRoFtbwBA0oUKATnlcyROZESOFrinBCqdtVr7wckrjPfxbiO+YEMrOv3XZNJ5VY6r90IUpBMVgXAXgaTfa0XpVJ/DR5to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715565; c=relaxed/simple;
	bh=zmk7pM4zUFxP8zRUkY8Z6LycAMaLij94htuAzyPh1gM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CGAkgnPuxwI1oWb7i8ttFNEKBihYSzNWzf0byNR40pqM1gewQJuzQBPzT1Cjf2uM6G8C8THsHN1LsoafQvZhEU34b1vR8nQvbHd1xhRXCW0tVaNOb6siQy2HOiDpYKJwfRjf2I8+L42gWXeQxrO8zuyvxZ6n74B7RoCiNFDC1gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NmYnx+20; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NmYnx+20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQZmoEoHHMWJOWX6FSnXoplhBUtLobxJ6QjeQfN5Yng=;
	b=NmYnx+20HcNdgpNyZcKJYJ7CbOEIw99qtc7lSqW9kKVNEMXUp5bQ2LcSDHsx4KWZTZ5MWT
	/qCAeNRi2iz30CzTe8VhStVPNdvET0iRVnYpnJHDLD3VgwQMQgVxNJxEu56pdAnrzjz1yQ
	1uAxo63TwhIOCSXh3HcuLoqKVCITafg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-9LWrhFxGNUyv8OyB5kxTvw-1; Thu,
 03 Apr 2025 17:25:58 -0400
X-MC-Unique: 9LWrhFxGNUyv8OyB5kxTvw-1
X-Mimecast-MFC-AGG-ID: 9LWrhFxGNUyv8OyB5kxTvw_1743715555
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5101F1956050;
	Thu,  3 Apr 2025 21:25:55 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 05B2B180A803;
	Thu,  3 Apr 2025 21:25:50 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:21:17 -0400
Subject: [PATCH 46/46] panel/lg-lb035q02: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-46-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1245;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=zmk7pM4zUFxP8zRUkY8Z6LycAMaLij94htuAzyPh1gM=;
 b=7HxQoapcNJ/QWW1ObXq0uQfPoC2dJ23Wc1zGuVS0eU0EFP3OgFepBvQCXzMOl6CU1WTFmsQn8
 hgfbmMOGG0UD+KIZCsZSRhucCleVfoG6FFENAeEMq2bgwy4DwXZX+XS
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-lg-lb035q02.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lb035q02.c b/drivers/gpu/drm/panel/panel-lg-lb035q02.c
index 9d0d4faa3f58aa4950e48d082352e0013880ee30..b2be6727bf73d34c8a9fdc9ad2f52b11d22d3b28 100644
--- a/drivers/gpu/drm/panel/panel-lg-lb035q02.c
+++ b/drivers/gpu/drm/panel/panel-lg-lb035q02.c
@@ -178,9 +178,10 @@ static int lb035q02_probe(struct spi_device *spi)
 	struct lb035q02_device *lcd;
 	int ret;
 
-	lcd = devm_kzalloc(&spi->dev, sizeof(*lcd), GFP_KERNEL);
-	if (!lcd)
-		return -ENOMEM;
+	lcd = devm_drm_panel_alloc(&spi->dev, struct lb035q02_device, panel,
+				   &lb035q02_funcs, DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(lcd))
+		return PTR_ERR(lcd);
 
 	spi_set_drvdata(spi, lcd);
 	lcd->spi = spi;
@@ -195,9 +196,6 @@ static int lb035q02_probe(struct spi_device *spi)
 	if (ret < 0)
 		return ret;
 
-	drm_panel_init(&lcd->panel, &lcd->spi->dev, &lb035q02_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	drm_panel_add(&lcd->panel);
 
 	return 0;

-- 
2.48.1

