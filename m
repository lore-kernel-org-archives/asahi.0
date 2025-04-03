Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5591FC100
	for <asahi@lists.linux.dev>; Thu,  3 Apr 2025 21:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715487; cv=none; b=GXuEHgXadaSxhJ/gm7alv3BNMh+f3CneNmw42MqgMJUqHf+uSbTJdyqvFfuu+U86MtoDFyKuInMc8Rlu2+jonkGhI/oCZ8O4D0jy1LYRKk9Hlb00r+bzw4dLuMjA5+f7Y79T8CJsfWCPZouiQa/NVDWI8HRIZCd8pn1TIlVsTKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715487; c=relaxed/simple;
	bh=5HF7V2Ynx0YxMQIOx0Nh2UoWUB4ldApTe4qTVFONEqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UmXp24LUYBFk/HXulFN3buyC4+wR1vQsT97pa4Nh2IAwG8ac4XONdDDe47rSpOS15Lfythmbyy79I09OCCEXhHQYNMjNWezg9KXvgeHAQestpIL4dwDjxXiONI1pRsmpav71WNyIrkDk5M7BKwqcMywvP3N4oPcVr3l7IvrA9p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=atr1s0D7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="atr1s0D7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T78FB7dvnX0BgLK7hP9hSE1L9ZbJkmZnc0hL6QTgquk=;
	b=atr1s0D7wp7eScKymsjVj4ePtHRq/G8ZaeSld5m1o/iEnDxvLTu2sqSQ0TMnVBBiEUN5Cl
	7KzVEHCh8xP8HVAx9S7jBcSHQ6rHSZsL2ZDgVqq6vPcTyndOtnHxVHzX49HNYFqikNxwfz
	bNiapYVdTXbo6qnszwteVpgPrhirqA8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-170-WEqA-JKYO1m7vfHuRGC-uw-1; Thu,
 03 Apr 2025 17:24:40 -0400
X-MC-Unique: WEqA-JKYO1m7vfHuRGC-uw-1
X-Mimecast-MFC-AGG-ID: WEqA-JKYO1m7vfHuRGC-uw_1743715476
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C35A01800267;
	Thu,  3 Apr 2025 21:24:36 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 83925180A803;
	Thu,  3 Apr 2025 21:24:32 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:21:00 -0400
Subject: [PATCH 29/46] panel/sony-acx565akm: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-29-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1262;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=5HF7V2Ynx0YxMQIOx0Nh2UoWUB4ldApTe4qTVFONEqI=;
 b=vHDfnpbZu8QqK29GXM1Zi0/MmqlfcRWLIjVMjEiBl4KCM0o9dHLLKEvc3GgOH+u/lorWIP1VX
 a960bDlmjXnCVbHWVWdCacnlE3G573O22IpRcAboGGxAyAkOQchLU5H
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-sony-acx565akm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index d437f5c84f5f0915ec9a3b3a899cb8bd41209c77..cf1c4c81fae757dcd4740bacbcd6b8a7eb04d7c2 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -607,9 +607,10 @@ static int acx565akm_probe(struct spi_device *spi)
 	struct acx565akm_panel *lcd;
 	int ret;
 
-	lcd = devm_kzalloc(&spi->dev, sizeof(*lcd), GFP_KERNEL);
-	if (!lcd)
-		return -ENOMEM;
+	lcd = devm_drm_panel_alloc(&spi->dev, struct acx565akm_panel, panel,
+				   &acx565akm_funcs, DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(lcd))
+		return PTR_ERR(lcd);
 
 	spi_set_drvdata(spi, lcd);
 	spi->mode = SPI_MODE_3;
@@ -635,9 +636,6 @@ static int acx565akm_probe(struct spi_device *spi)
 			return ret;
 	}
 
-	drm_panel_init(&lcd->panel, &lcd->spi->dev, &acx565akm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	drm_panel_add(&lcd->panel);
 
 	return 0;

-- 
2.48.1

