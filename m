Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00CC1F03EE
	for <asahi@lists.linux.dev>; Thu,  3 Apr 2025 21:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715398; cv=none; b=RmLKfIlCJnjmw76eq2wRM7QoF5wwCEbk5XRFsvHoQL7RpqVvdoxzmkABy1f02s6vHnbfPPPYTWGbSqiVCnrRM5GWcrefekC+5ZqyPDkIkSw3TIxJLWfK8/sfE2BHE5ulOyFJ5Ga/fkhADeLw6qrYkNK1hisSxcDPSpsNzTthg6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715398; c=relaxed/simple;
	bh=nLkhEhWqxBkHr9HZAzxzL5N30PvbIzwllPLao3lK10o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q85HSj2XDFZuC95f4xkx0htWjoAvYG56IVXD9RYRaXomQrXmNt4xOk9roQTn9fJSg8Wyzz34nRip2KVmBvWWYjwKgUfTzWLGKUSJv1/14bNBzuL2aLBUetYlsFtxSL91syAVQHtVSLmF23HjRlamF9yPKnrFDSJB6hpHAoOVMJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O6c2tOVI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O6c2tOVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0euA2BNVZVmUNDUqSRsiptnpnBHJh1mpEHiTlqrUOyk=;
	b=O6c2tOVIQ449eHhf6g97QASnncDKn1YojAco0870B8IYUgRpRcb8gXywEbe4ZGluIaS2fg
	USRXZ++WfFh3OboYygSgaWWex02+V555VyYt2ac7eZzm9HteNbQIwYAafYhyiNHdKYirWs
	eKhYG7izdMHGxqz+6zCSKX6m1TUUmfM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-NolDOIazNgqqQsqUmcTSWw-1; Thu,
 03 Apr 2025 17:23:11 -0400
X-MC-Unique: NolDOIazNgqqQsqUmcTSWw-1
X-Mimecast-MFC-AGG-ID: NolDOIazNgqqQsqUmcTSWw_1743715389
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE303180034D;
	Thu,  3 Apr 2025 21:23:08 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7E5F4180B488;
	Thu,  3 Apr 2025 21:23:04 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:42 -0400
Subject: [PATCH 11/46] panel/samsung-db7430: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-11-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1306;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=nLkhEhWqxBkHr9HZAzxzL5N30PvbIzwllPLao3lK10o=;
 b=tSazrLQsPap77XsG9vkQWCmXMq1ufg/lwYpF7n+MaWoRRYRtv8DaSNuUXqGtxCZyU6ynW00yO
 qlKj3gbz837D7wvKy9FrZvpaR2BQBfQarktG31VNHqAXvdmdvQC1TjL
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-samsung-db7430.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-db7430.c b/drivers/gpu/drm/panel/panel-samsung-db7430.c
index 14c6700e37b30a58e7081423c18bff8db7896c5b..a97182f3c9907ad33ab6e7717129029e3bc4cd8b 100644
--- a/drivers/gpu/drm/panel/panel-samsung-db7430.c
+++ b/drivers/gpu/drm/panel/panel-samsung-db7430.c
@@ -267,9 +267,11 @@ static int db7430_probe(struct spi_device *spi)
 	struct db7430 *db;
 	int ret;
 
-	db = devm_kzalloc(dev, sizeof(*db), GFP_KERNEL);
-	if (!db)
-		return -ENOMEM;
+	db = devm_drm_panel_alloc(dev, struct db7430, panel, &db7430_drm_funcs,
+				  DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(db))
+		return PTR_ERR(db);
+
 	db->dev = dev;
 
 	/*
@@ -294,9 +296,6 @@ static int db7430_probe(struct spi_device *spi)
 	if (ret)
 		return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
 
-	drm_panel_init(&db->panel, dev, &db7430_drm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	/* FIXME: if no external backlight, use internal backlight */
 	ret = drm_panel_of_backlight(&db->panel);
 	if (ret)

-- 
2.48.1

