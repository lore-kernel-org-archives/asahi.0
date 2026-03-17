Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB6433BBD0
	for <asahi@lists.linux.dev>; Tue, 17 Mar 2026 06:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773729683; cv=none; b=RbgfdyhzMxxxN3c/QZshWqvaHnDEEHi2cKH0uA4vmG//YEOKJicvjoI4Z+U/g3JqTfSTEhb1McZmKt8+TgISHHcpNr3g17A6/p1KqNp7tqpPnQLzHUdUqpzoCRs98zVjZ6crhviZD1YJr5lr1ukXQjZ8jATGzdVaKX7Ll0iyhd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773729683; c=relaxed/simple;
	bh=D/gw1r2j34lv0Obpyc96PLFrVbcbQ9vRoATGRk+3awY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eo4M2li/sU8+WVmONGHr/jTs/Qu4Q/09BfSGrgoedZTnZJ1RPkvS1vcdKJjKGMLxkWs5coUVhNZLF66kYCq4piBKde2G0Ts5BxMbrXjxRBDW2gpeX7Xs4ORvmJFJAYgkk2Xeb2W2rWlmFQw5EwxnHX4+ntq+QlitZCSEeYnXXow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CWF8dBeK; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CWF8dBeK"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ad21f437eeso4155685ad.0
        for <asahi@lists.linux.dev>; Mon, 16 Mar 2026 23:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773729682; x=1774334482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1Qal9owEWmx10nMbdaip52xdARaCO/YU8MURG1lRk8=;
        b=CWF8dBeKs0VVCcaYLvrg0fVcAHPSZqrp5M+cZ4J1Ok8TT8eU4G9bj68vVtcRxIQi8+
         fOIishlDLx7OWG1fHJTz6nyf1MkJdT99EYyJxxS65M9lub8Zc+9o/2I7Le5Xn0Kx8ieC
         cVGSxOBTrWB/GqOJ2N+SyDyYm/q6ZIj2uL+Sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773729682; x=1774334482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m1Qal9owEWmx10nMbdaip52xdARaCO/YU8MURG1lRk8=;
        b=a0DFltRpytTWYeLZB0kXSGmmoyWWUq0wXDuyq7RUkNMpxthdSqKDZoZ8gOQfnyVyA5
         EKWjXZPoweS8JURLuOJm8WEROv7F9PC4egCn0VQVxAzuUFhRXlXo8apMy0IdPPBiY2H0
         Qr8xgXkh//Sl+OATasw0PFE5GOaQqY28aUEHxyPT1g2z9q9WUt8bTY7Odk1sH5NoRcys
         XI8zXc5X2Jy9qrip077pOG+gUjWkJn0nCrNLbZE7BV35mvXZFnWZbzAhN9gW8ggaAW/V
         SzGBq0QCt2M6i7QJ0RJ/3SjreZzTjFBvlO+zvrh4hBXrH96AlL1Zy0f6aj4okyIdalh1
         fLUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk2qLM34XkThBVOLHoLQnqpG2DWNrY2DasqtH9FxxhCSCbrs+588TvteAb4Tux8HdvESS7GA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt+mv9JXStzqtaoT8S/HalwpJk/Ya7z3h26+8fHZMGlMXUOwCX
	0mB3yXSzd7KpcoU7vg0hOI4h81LB+myTP5tLgDlA7JCZRp0uAffyJTXxIbeRmN9Qqkfa98Wpkfw
	K79k=
X-Gm-Gg: ATEYQzx0AX0rxYJS3krNMgOBAFH6ohBp9UyYCY9P8ZHS77viJ37Hmm6E/h/0KovU8rl
	YuBSpr3fvWktpplfhQbg+FrVpBrwumHOhxXOsietr3k1ZtYEwPtq/3b7rEogPRsnPPUA5ovyo9J
	o4rZqokJAA5CuqXQxDw69ZbnbpUnv0uZ5ewZ9maxgig9Z/kG1B0uXducfVlTQhXDTPdmncSVmeU
	JdeRitDrAx9cyx/KuTwLsv/7oCwbStS9fieuNQjPjGDfYjvDnCuoCrLT6XxdyCgOSTD6Af+PB47
	VJkUwF5qGu/NlUELaQs4EI07Pnylc/zzghmrVE1w1wkTDgRpXBLoK5K/BbMKycuMvO04sjOVlzx
	wBXRxyV1EbteAsbPbYFprbfN6TRZMDNiYWjm0wL7tD+4CYOVfRKHryBm7kWyqf9oZpzeiL/ZtcJ
	haFUQOrLaPBguPFcH9+mkTXoU7/kzeuWzDj05SzvmfsvNbguKvGQfVKP0gDpPLyxyl23bZdP/rT
	0/efLfF
X-Received: by 2002:a17:903:2411:b0:2ae:cd2c:8f30 with SMTP id d9443c01a7336-2b06357ec34mr19215525ad.1.1773729682153;
        Mon, 16 Mar 2026 23:41:22 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:a064:c65d:a199:5cb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece605231sm124269425ad.27.2026.03.16.23.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:41:21 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev
Subject: [PATCH v2 1/4] drm/rcar-du: Use drm_gem_dma_get_sg_table() helper to get scatter gather table
Date: Tue, 17 Mar 2026 14:40:43 +0800
Message-ID: <20260317064049.696795-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
In-Reply-To: <20260317064049.696795-1-wenst@chromium.org>
References: <20260317064049.696795-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rcar-du driver is directly calling dma_get_sgtable() on a
drm_gem_dma_object. Not passing the dma_attrs field in may cause
problems when DMA_ATTR_NO_KERNEL_MAPPING is added to the GEM DMA
helpers gain support later.

Instead, use the drm_gem_dma_get_sg_table() helper to get the scatter
gather table.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- new patch

Not sure if we should add a helper like drm_fb_dma_get_gem_addr(). This
seems to be the only driver that is using a scatter gather table to pass
DMA addresses.
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
index 94c22d2db197..6a62608ee3a9 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
@@ -291,10 +291,16 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 				dst = sg_next(dst);
 			}
 		} else {
-			ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
-					      gem->dma_addr, gem->base.size);
-			if (ret)
+			struct sg_table *ret_sgt;
+
+			ret_sgt = drm_gem_dma_get_sg_table(gem);
+			if (IS_ERR(ret_sgt)) {
+				ret = PTR_ERR(ret_sgt);
 				goto fail;
+			}
+
+			memcpy(sgt, ret_sgt, sizeof(*sgt));
+			kfree(ret_sgt);
 		}
 
 		ret = vsp1_du_map_sg(vsp->vsp, sgt);
-- 
2.53.0.851.ga537e3e6e9-goog

