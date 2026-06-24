Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40E813D891
	for <asahi@lists.linux.dev>; Wed, 24 Jun 2026 09:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291660; cv=none; b=aghJNo2VJL9dEa7tsJNZbs4xazKNcl2a0MdaNgux1anZIdXucJ5zAgJOFH3ewFTMZsjBI+I0OKGAJnywVVEGOH9+q4n7ISi7fK35kQua8KrN8C6HNtC31ZfCRzizUegYRqvYCtFVbs7peZ84/OLqgi/guHCsG5xSHJ0wqNfmGrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291660; c=relaxed/simple;
	bh=q3JDxPYJoffUZaBnBehSxpDR8j2xWuIlTCV7gTPM8Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gkJLZ/p2l6owPH7obNQbW4KvZxiMBYGPV5dcJ15DxX1oyEo9ERspZ0zOq9TG/GbolVCIU12S/mBwjNM6tvw0VpygZtfhgH7u2AaRBoyPgrqZIPbpoVvK9G+m/vzvb0NeqdGElpyzUjjarp8oCXu41bY/WMolkDcgUzuwjZ3obVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+mWvf7W; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+mWvf7W"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8453bcf7276so566583b3a.2
        for <asahi@lists.linux.dev>; Wed, 24 Jun 2026 02:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782291659; x=1782896459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cpWHohyYE9TWYB3P2wMAp3c2YwKiLndmTMYD9SWzcTM=;
        b=p+mWvf7W38SiMldMbpw40l68KTeEPvBabA8hTovf7Cx4b9uV+QS8H34pKs7njn3Psq
         +cQArX01wuzy/pXZWTvtWNdGc6rk3dk4pmmcT0J475iiw7FgNleIoRk3T1w0CEGPOH3b
         QGLt9skBTLxewGDLF4JHvlGXJlQSUaoVru7cmGodwtVUXvJjCHUIZA4AJQ8zxyPckxxr
         DslaSabNfbIMi9JalgwgjAVwBr7WSt1X3LcgC8io+fllUsrecHS3vTxLrWBNhKDMHbfx
         Sm65zImUCYoJPKaGC0fAm8xjZeyVATe5O+4GM/8WZ305aSAJE63cNcwlbJfmmaqoAT0k
         aAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782291659; x=1782896459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpWHohyYE9TWYB3P2wMAp3c2YwKiLndmTMYD9SWzcTM=;
        b=QsREuQoyg9pez89x3jD4iKHF3tN2rzIkP8vtk0W0rCHjctk6gxTzPg35f2n1+cznKS
         1gSRvGkXWoECH1GTKGIFfN5ZNXy+3yUdI2tVQwgF4vtnAlbcVJ5Jnl+7iBcadlrRzzPd
         7UW8tfSUWJ9mn3EEIxOJoFeo44X8nadpeyA637k99XDteb6LWXDGFhKmRpmoRNlDi5yi
         iRFxRp/EWbFoQNpnAoTBHCmLx3rLoj7KsDYNYfiivtMnbFPTpAD+uClGtoC9kCuRGjXZ
         Bq7czrivUguY4zcisZsPXz1hEpeQOo9IZAGIcLutlVTXORYCaaJHa/zWdIdgjw0giu1C
         MZZg==
X-Forwarded-Encrypted: i=1; AFNElJ+qQ6mPy2pPXUWysjQ0ozmM2XnD7XepF4AMK7NsXDtsv6dDOTq3RXozRkqlQJQ7S4rXIC/dZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEwc29AW55if9JSxbtlScAbdSU1mREEDd7JdV1psQvQNOYdz4Q
	1D2TWD4Xu8l7ozT0I7bcFp742Y7sz9bg2QMO24qObCSQmKv/mK1WVGY=
X-Gm-Gg: AfdE7clRHFpx0PuE6t+83cYKI++KGaUlSiVdMTCUfbI4aaBW9yd/8M9SWX3O1nawkRw
	TVrj/zI27kMQrx2X3659U1DXKTm1dCaxZ+o9QQlyWdwBzAKHEtFHYT0aVOHvPd70EJweQxS7V/I
	0qnsPMjqfQsCBwXhMErlqmkda5g5IaDHJu75ecgLfT4koO5hX8aJjB7jxxCNgmLCB4/mBW5zDDE
	ItsY/U/szIyXfm44jXJaaMLIhJ1FTt8Mq7i639jy8mTSfVzoCicYCMgbdxBf0OJ28xV4bimV9qy
	33SsyCFMBE2srgwn/9SlSSxcMuHDygFploca3S1gRkrQZQ5YIl2uBVKLgdyJXMOfCqvyxZmXsHq
	mp+p1AaT8N8ssxsqUOK7g4sg4dxbH05SrkQdSLXZ2t+7B+Gv5/qNRirWaP6v583hKsVfhS1u9z2
	uzmOSlMClAf3Yazxv8HxWtbV0wbeBbAw4qOBxMj+h8p0XmwFV95Pe6Fp4dB73n5p1RopZInpr4f
	IA=
X-Received: by 2002:a05:6a00:94f7:b0:845:4f20:3834 with SMTP id d2e1a72fcca58-845a2a9666dmr2947535b3a.5.1782291658639;
        Wed, 24 Jun 2026 02:00:58 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d1b0fsm1658035b3a.28.2026.06.24.02.00.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Jun 2026 02:00:57 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Janne Grunau <j@jannau.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] drm/adp: Free FE IRQ on bind failure
Date: Wed, 24 Jun 2026 18:00:43 +0900
Message-ID: <20260624090050.87051-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adp_drm_bind() requests the front-end IRQ before registering the DRM
device. If drm_dev_register() fails, the function returns immediately
and leaves the IRQ handler registered.

Release the IRQ on the drm_dev_register() error path. The normal unbind
path still frees the IRQ after successful registration.

Fixes: 332122eba628 ("drm: adp: Add Apple Display Pipe driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
 drivers/gpu/drm/adp/adp_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index 4554cf75565e..20f38543d04e 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -535,9 +535,13 @@ static int adp_drm_bind(struct device *dev)
 
 	err = drm_dev_register(&adp->drm, 0);
 	if (err)
-		return err;
+		goto err_free_irq;
 
 	return 0;
+
+err_free_irq:
+	free_irq(adp->fe_irq, adp);
+	return err;
 }
 
 static void adp_drm_unbind(struct device *dev)
-- 
2.47.1

