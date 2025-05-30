Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CCE1C861F
	for <asahi@lists.linux.dev>; Fri, 30 May 2025 02:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573638; cv=none; b=VIrSrUkREkNJBjXiKi/I9Y2eqhcBmpXc24efXo4BqfnPaHIJgmEBhc6E+SP2TSfCxh/pS3JRSb1bZljNHJniJwuE8g187dw3LSTaUGJKegI6bTUoAHFPsEefMA2aE15Oamn1Scna0ZHOMUHMMVfthM3tR9Iuj8JOYTUJBgV8uFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573638; c=relaxed/simple;
	bh=k6xcBrcjqleZnQdzDWNa+H5TX2zZYm4KLejiUJ3CeHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mXEyBK/tZchPfB5EtBwCQFHSO9F3n6UESM1Fkcq8AEs6yGG5UV8KRfCYC9AUnwdMIK/Wvw0DfKV3BM9FlebugRaCprYgu7I753JkYJMmsFUyFZ+RRmN8tEq50O0nxj5wqvF76nOk6Xd9bpTkOQ/nbgRz2L1OW1/ilUnjx3hVChY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J3InIcqm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J3InIcqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JZIQ7E466bXnslXSEUgJ5DD5EHDB1GW1m+jviSQ7lLg=;
	b=J3InIcqm+zSbcbwyfHqXT/tv8DhOvkEbmVCM/bVNnI5cxJ//hW4Zfgfjdc1cT2V8x+aocg
	KxDIaNX1C81DbySTIXQcpYoIMOvCbK5X7Tl9OCrlJu1bD+WJrVDu4YR8dkDGDENT22e1p9
	YyrqJKOTN9EUiII0E0jppYgsdUOSpJo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-150-SvqrCgbLOFOdD7cWgLqzVQ-1; Thu,
 29 May 2025 22:53:51 -0400
X-MC-Unique: SvqrCgbLOFOdD7cWgLqzVQ-1
X-Mimecast-MFC-AGG-ID: SvqrCgbLOFOdD7cWgLqzVQ_1748573628
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA65A1956094;
	Fri, 30 May 2025 02:53:48 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4DF151955D82;
	Fri, 30 May 2025 02:53:44 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:47 -0500
Subject: [PATCH v2 45/46] panel/panel-lvds: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-45-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1341;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=k6xcBrcjqleZnQdzDWNa+H5TX2zZYm4KLejiUJ3CeHU=;
 b=SY9Mh+vQcoTUhXwIh3Gti5CFO6tD/B+DWrq2Flu1UAsxVU0AWqpjDKKowb0dV9PMKd5Ic434A
 LcCJnfQXw8IAWcY6rsx1stnw9n/JTuVgIZccPYmLCZKoyEW8aoVipwS
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
 drivers/gpu/drm/panel/panel-lvds.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index ba6c015aabba9e03a37058e0fcf7cb39d1595d70..23fd535d8f479045a87b0f51bec17cd7c66b0f75 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -164,9 +164,11 @@ static int panel_lvds_probe(struct platform_device *pdev)
 	struct panel_lvds *lvds;
 	int ret;
 
-	lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
-	if (!lvds)
-		return -ENOMEM;
+	lvds = devm_drm_panel_alloc(&pdev->dev, struct panel_lvds, panel,
+				    &panel_lvds_funcs,
+				    DRM_MODE_CONNECTOR_LVDS);
+	if (IS_ERR(lvds))
+		return PTR_ERR(lvds);
 
 	lvds->dev = &pdev->dev;
 
@@ -214,10 +216,6 @@ static int panel_lvds_probe(struct platform_device *pdev)
 	 * driver.
 	 */
 
-	/* Register the panel. */
-	drm_panel_init(&lvds->panel, lvds->dev, &panel_lvds_funcs,
-		       DRM_MODE_CONNECTOR_LVDS);
-
 	ret = drm_panel_of_backlight(&lvds->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

