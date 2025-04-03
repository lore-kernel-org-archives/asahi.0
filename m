Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B1D1E5B91
	for <asahi@lists.linux.dev>; Thu,  3 Apr 2025 21:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715472; cv=none; b=qMe6n4B4f4uFszgBarlzIOPp4Z+qI6HmMXh5OAnkMypk5WpEbA3spDpLHdXALMT5PZx+sQJDrTxELEygmxqiFZMp7i8Mk/zep3fFCAsNcmWyUrv2lbzZNvtICUTnuGUW2as46NjbIhhP3E+WMLcYK+3KGHM7vjJ/fqxuFSzSl6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715472; c=relaxed/simple;
	bh=V2E/oy4I9619a0A4Y/q88mbe4D7FPStb5RlER26uOJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yb2NLt43ikhuX5OlVRDMPF6io9E+hlWxJNd0XKokoQ7vnvPH6qYtbaHMy4VCxOkDK9M5eKdM0VctEhfqOVQR8gXJx7kglhIZr5WNMG0IvHvBuNbeulbQgHWctskUqDp9VC4KoAj0uxkwIhQ5NnpLd/cdajSlejxgGPOYPOawhUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TdoXstDg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TdoXstDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=prhxRbMWcQEe4Um2m8Gu+S5B2Vc6o+DVlLumeainEJ4=;
	b=TdoXstDgShXymGIzGL0it6X2cVALjmAV8TPmGsmUYRRBWUst9q73ICvjZ+9t6A9C8c3yTG
	IreqvxPk9cOxoWerW1g6l8zNoy1cNegZlYoAsAUVQliP17J6kB9rwFF8tcLAlkoLDmJvlh
	oiZtaiBqSPO1dl9oOYiRWBfUtgTs7RQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-iVU9k4L4PaiS2M1unpBIRw-1; Thu,
 03 Apr 2025 17:24:24 -0400
X-MC-Unique: iVU9k4L4PaiS2M1unpBIRw-1
X-Mimecast-MFC-AGG-ID: iVU9k4L4PaiS2M1unpBIRw_1743715462
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CAFD01860970;
	Thu,  3 Apr 2025 21:24:13 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4B29A1828B97;
	Thu,  3 Apr 2025 21:24:08 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:55 -0400
Subject: [PATCH 24/46] panel/sharp-ls037v7dw01: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-24-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1308;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=V2E/oy4I9619a0A4Y/q88mbe4D7FPStb5RlER26uOJ0=;
 b=4L4ieRiNfcBlseZ7/pwYabfhU090CEA3dg8EW30F/74RHB2J0dNPISk+70WhSCMM0lmBd5xrn
 +Vfy3svr8b3BBUuWZ8ExkpJ+40miPrCyctJ3PtkjPTEmjQ0FL2nQnEK
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
index a9673a52b861553792c9814da54a08043eb773e8..938beac4655d0bad6deaf93c7c1957403a446f20 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
@@ -138,9 +138,10 @@ static int ls037v7dw01_probe(struct platform_device *pdev)
 {
 	struct ls037v7dw01_panel *lcd;
 
-	lcd = devm_kzalloc(&pdev->dev, sizeof(*lcd), GFP_KERNEL);
-	if (!lcd)
-		return -ENOMEM;
+	lcd = devm_drm_panel_alloc(&pdev->dev, struct ls037v7dw01_panel, panel,
+				   &ls037v7dw01_funcs, DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(lcd))
+		return PTR_ERR(lcd);
 
 	platform_set_drvdata(pdev, lcd);
 	lcd->pdev = pdev;
@@ -181,9 +182,6 @@ static int ls037v7dw01_probe(struct platform_device *pdev)
 		return PTR_ERR(lcd->ud_gpio);
 	}
 
-	drm_panel_init(&lcd->panel, &pdev->dev, &ls037v7dw01_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	drm_panel_add(&lcd->panel);
 
 	return 0;

-- 
2.48.1

