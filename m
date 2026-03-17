Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B761833F8A6
	for <asahi@lists.linux.dev>; Tue, 17 Mar 2026 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773729690; cv=none; b=XQysuG5KgHTP/2ilg6I1l9jrgeOXQLN20lh6ePT2+HFxhcCXGnrTAqzz5HoXQoJ+FrHdq8+tnXbBuFcfGiG4WoUaYs2Gt4QegF/7P0VpHmt60x8eaa0MPz7dfwpB4beZ/oWlqd3POK0edIVdCk6KDiCnNuOzTjhNPBuMUSu8Ous=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773729690; c=relaxed/simple;
	bh=MBgJA1Xwf/X1DLoh3ax7tabp8ViIY1hzcXxBmKVvQqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uimVZiITc74x5EFRqSPKEnFbwVA5P+vKDjnlJ+/hTyLYQy5BFx4BuONApBAeszG2KOoieZfOeSDs5qfJc1utDzlAmjLSdtb1ujskh9w2gs3/VmjPZ2mJuqM0Iy4+2YZ3YFFPDIg11epOnCyIG0G9i/2cs3smPS6QtCfF6hZdLJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bop6YFxn; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bop6YFxn"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b04e6a989eso17395525ad.3
        for <asahi@lists.linux.dev>; Mon, 16 Mar 2026 23:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773729688; x=1774334488; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beYKL+KpJYqTN09SlrzQ/IJhFB/kZtPqCQ/2b0LTAW0=;
        b=bop6YFxnLC14sJPls+7BF+scLGLEKZ/kyNTPlvg3yUSmFpTg6NgsH65wDewdKa//BT
         J524Zbm24OWHD+jKNjqOcRTfGxFH9kqENJDHZhlAmp5t0/A0rbuP3sf3dT+Fq+dM37cv
         eT49OjBKLHPJoml7+QuhTQVGGpQ5AipIp/c4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773729688; x=1774334488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=beYKL+KpJYqTN09SlrzQ/IJhFB/kZtPqCQ/2b0LTAW0=;
        b=cigGK++kG+/2T+1SYE/GkorPn2I9vNBiIX7dLOBNDQuD23shtadCNvFRUkudZcretd
         /l7osP9bRnGVFFDBbJ6MNs8YTuxIs2Cm6mM6MIdyjsuWwauSto5XjuBiEl7XH2m1EWyk
         CtKB3H8ZCFGil9llYKlJ2Jn4ZEDSKe5AGxXSx8GhttFPJAlky6kIN/0TVy+5h19t4O++
         KWA1NvLBeZ3zxfwOB9hYnXcmYmudOkrYqXmwYkPzyUvChVP4AASRpxnL2zjF9qLn7pNS
         9bP7DJTE5GkFXulLEgQNIET/5tC1E9ixFo0S5coG0hZCOdyfWKRasYivBQP36Wzpv7WZ
         GSGg==
X-Forwarded-Encrypted: i=1; AJvYcCUR9PWQJc7fYaHwmKbBpq+9KwMCH5bMsz0BbLH4ZF7e3ktS8OsBEm1TlO1ZxVzzjsAeymtc4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlLytDMq7EEB9PG9Hcr8JbLQ05ag8NAx5kbE6u5p9bad3HfXri
	yQ4WpI9oGgYtwrgbjOB/zDdBMObdL88r8OClA5W5xnIvrV2z2cUCC2c9aII64qukvg==
X-Gm-Gg: ATEYQzzTM3120/jFSwc7JGNqEnX4mdTMWdUvx4aG1SS3IunKwYC444Q4NsKqe1keJ8L
	mtD1SjLNphVOkeDBonXxuXOgcdk62829/xh3wJb1tdZ/U0pL6yVNh9VptpJsel653ucDsbhZ+Pc
	35iuNJFlHRHSXATrKQBnKe8QzaTi36Fa5vFbtGQv6fAgUeWOuE2A44oiRG1P/hAopzXSmM1q9zY
	t+hI3NA4BmF7SXlQ4eDu6TET1Wz3cY28R4f2bv8MRDLiUehEHfoXIHgzOpJwLFtOOLAqfDdE/XS
	OnmlFQozwzw8qZwfauz3K38Pms7/ARtV210Z8mqYb+023+P7f8qv0oyA3SMY6p65KBjkk+SWdrr
	Dc8g6VTs8xX9coN0e54Szr2qQGoa47HyQytVcUy2oObSPQM9y11kryhOTy5l/Kjw3hHUYpqYYfa
	I052JA78j6LEtfdJOPBjFES83lWMMWezO/1uX2WC6jAt4ST+wDmg9mCFlfRVMdErgPIrc7wk713
	V34Xwkf
X-Received: by 2002:a17:903:37d0:b0:2b0:4a57:e498 with SMTP id d9443c01a7336-2b04a57e8demr100300115ad.15.1773729688017;
        Mon, 16 Mar 2026 23:41:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:a064:c65d:a199:5cb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece605231sm124269425ad.27.2026.03.16.23.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:41:27 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 3/4] drm/gem-dma: Use the dma_*_attr API variant
Date: Tue, 17 Mar 2026 14:40:45 +0800
Message-ID: <20260317064049.696795-4-wenst@chromium.org>
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

From: Rob Herring <robh@kernel.org>

In preparation to allow DRM DMA users to adjust the DMA_ATTR_* flags,
convert the DMA helper code to use the dma_*_attr APIs instead of the
dma_*_wc variants.

Only the DMA_ATTR_WRITE_COMBINE and DMA_ATTR_NO_WARN attributes are set
in this commit, so there's no functional change.

Also change the dma_free_wc() call in vc4_bo_purge() in the vc4 driver
to use dma_free_attrs() to match. vc4_bo is a sub-class of
drm_gem_dma_object.

Sub-classes of |struct drm_gem_dma_object| can also set additional
DMA_ATTR_* flags if they choose so. For example a sub-class could
set DMA_ATTR_FORCE_CONTIGUOUS in certain cases.

Signed-off-by: Rob Herring <robh@kernel.org>
[wenst@chromium.org: Rebase onto renamed DMA helpers]
[wenst@chromium.org: Make vc4_bo_purge() use matching dma_free_attrs()]
[wenst@chromium.org: Expand commit message to mention that sub-classes
                     can set extra DMA_ATTR_* flags]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
Changes since v1:
- Rebased onto renamed DMA helpers
- Made vc4_bo_purge() use matching dma_free_attrs()
- Expanded commit message to mention that sub-classes can set extra
  DMA_ATTR_* flags
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 26 +++++++++++++++-----------
 drivers/gpu/drm/vc4/vc4_bo.c         |  2 +-
 include/drm/drm_gem_dma_helper.h     |  3 +++
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 1c00a71ab3c9..9722c9fc86f3 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -108,6 +108,7 @@ __drm_gem_dma_create(struct drm_device *drm, size_t size, bool private)
 		goto error;
 	}
 
+	dma_obj->dma_attrs |= DMA_ATTR_NO_WARN | DMA_ATTR_WRITE_COMBINE;
 	return dma_obj;
 
 error:
@@ -152,9 +153,10 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 						       DMA_TO_DEVICE,
 						       GFP_KERNEL | __GFP_NOWARN);
 	} else {
-		dma_obj->vaddr = dma_alloc_wc(drm_dev_dma_dev(drm), size,
-					      &dma_obj->dma_addr,
-					      GFP_KERNEL | __GFP_NOWARN);
+		dma_obj->vaddr = dma_alloc_attrs(drm_dev_dma_dev(drm), size,
+						 &dma_obj->dma_addr,
+						 GFP_KERNEL | __GFP_NOWARN,
+						 dma_obj->dma_attrs);
 	}
 	if (!dma_obj->vaddr) {
 		drm_dbg(drm, "failed to allocate buffer with size %zu\n",
@@ -242,9 +244,9 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
 					     dma_obj->vaddr, dma_obj->dma_addr,
 					     DMA_TO_DEVICE);
 		else
-			dma_free_wc(drm_dev_dma_dev(gem_obj->dev),
-				    dma_obj->base.size, dma_obj->vaddr,
-				    dma_obj->dma_addr);
+			dma_free_attrs(drm_dev_dma_dev(gem_obj->dev),
+				       dma_obj->base.size, dma_obj->vaddr,
+				       dma_obj->dma_addr, dma_obj->dma_attrs);
 	}
 
 	drm_gem_object_release(gem_obj);
@@ -435,8 +437,9 @@ struct sg_table *drm_gem_dma_get_sg_table(struct drm_gem_dma_object *dma_obj)
 	if (!sgt)
 		return ERR_PTR(-ENOMEM);
 
-	ret = dma_get_sgtable(drm_dev_dma_dev(obj->dev), sgt, dma_obj->vaddr,
-			      dma_obj->dma_addr, obj->size);
+	ret = dma_get_sgtable_attrs(drm_dev_dma_dev(obj->dev), sgt,
+				    dma_obj->vaddr, dma_obj->dma_addr,
+				    obj->size, dma_obj->dma_attrs);
 	if (ret < 0)
 		goto out;
 
@@ -546,9 +549,10 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
 				     vma, vma->vm_end - vma->vm_start,
 				     virt_to_page(dma_obj->vaddr));
 	} else {
-		ret = dma_mmap_wc(drm_dev_dma_dev(dma_obj->base.dev), vma,
-				  dma_obj->vaddr, dma_obj->dma_addr,
-				  vma->vm_end - vma->vm_start);
+		ret = dma_mmap_attrs(drm_dev_dma_dev(dma_obj->base.dev), vma,
+				     dma_obj->vaddr, dma_obj->dma_addr,
+				     vma->vm_end - vma->vm_start,
+				     dma_obj->dma_attrs);
 	}
 	if (ret)
 		drm_gem_vm_close(vma);
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index f45ba47b4ba8..981593739a0f 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -304,7 +304,7 @@ static void vc4_bo_purge(struct drm_gem_object *obj)
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
-	dma_free_wc(dev->dev, obj->size, bo->base.vaddr, bo->base.dma_addr);
+	dma_free_attrs(dev->dev, obj->size, bo->base.vaddr, bo->base.dma_addr, bo->base.dma_attrs);
 	bo->base.vaddr = NULL;
 	bo->madv = __VC4_MADV_PURGED;
 }
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index f2678e7ecb98..e815ff121e23 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -16,6 +16,8 @@ struct drm_mode_create_dumb;
  *       more than one entry but they are guaranteed to have contiguous
  *       DMA addresses.
  * @vaddr: kernel virtual address of the backing memory
+ * @dma_attrs: DMA attributes used when allocating backing memory.
+ *             Only applies to coherent memory.
  * @map_noncoherent: if true, the GEM object is backed by non-coherent memory
  */
 struct drm_gem_dma_object {
@@ -25,6 +27,7 @@ struct drm_gem_dma_object {
 
 	/* For objects with DMA memory allocated by GEM DMA */
 	void *vaddr;
+	unsigned long dma_attrs;
 
 	bool map_noncoherent;
 };
-- 
2.53.0.851.ga537e3e6e9-goog

