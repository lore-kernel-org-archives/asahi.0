Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F8378F4A
	for <asahi@lists.linux.dev>; Tue, 17 Mar 2026 06:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773729681; cv=none; b=gD/ouiQ0+Jb81X2ZJ1bG+Tjmk+Yi5V+RmKWCyXdzA5J2jE91cgIPjhA/JJgI7vTBQUzSxbiiyyWWI6bTgrRJwuXolSk40FAz1O4n+uzstdHAI1AEHj+JX2UOX7DS5geGgA0owzjtzNpjUZONACdR4x+CY5zRGkgFAknL9cIrwAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773729681; c=relaxed/simple;
	bh=o2Nnjp45J8XFW4OWyJILf4MjDxOL/y5fVrADgQA/aSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l2kNqXKemVYBwAJ2LMpHJHjF5kqbl66v8d/w3eEQyWBSU8R/8Uy2F14cWZX7fKoA7u48M7I4Ejocam9fbeD8OzI8m4YdP5h7cFgz+LonEHM2wXXxQ2/vfj9ublVRaGrbzYZn+nyjVCTf9HfdDrfaSF2LL+m7xPn8Rp3+f1BVxNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WLPI5v6n; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WLPI5v6n"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a871daa98fso40534295ad.1
        for <asahi@lists.linux.dev>; Mon, 16 Mar 2026 23:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773729679; x=1774334479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KlUueF1GSw5ohqS7H/vwWeUHzvF9pIfX9HHJ4AwXcpg=;
        b=WLPI5v6nOPmBty4tKLxdjylrKljFaLc7swv95nkmBapRvKs8uWzC55TersAd7ScZPa
         rj449vMcZWFoMdkkRoJZT9a623ykBwo6VpCGskAPfesqHFjAne3Q7fDK2jsRttP0GsSh
         6T2XyDHBFGBbBY/pNvr4wJbksl5Bodn026qM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773729679; x=1774334479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlUueF1GSw5ohqS7H/vwWeUHzvF9pIfX9HHJ4AwXcpg=;
        b=eqf8jLk1QVsZWd2diBdVPNsKZYwmpNDWGjqBI21Mt06r7qGu4K3vt9fxi4YlJmxfNO
         8hV9jZ04AOPUIAhOcz5j+FyGd27Vln4B4JWjFRQ6Zu4YzVs+djf1p/RbeZ/kg9SX/T9f
         sujcHWqzFJwc4AH+/I0kmtDpy2zpH29Vu//6r7/0DlOzs3BYjUdjgUHFwmUky/lX95/F
         UlWleTCvXfZjvxBuUSWE1hOAvn2h3gBSFzcKzSj05RUBrXtZ4bnW3YcJKI0xBYvHt0wJ
         cQT5a+Gi5yAEiG1qxFT4gFVs3OAOVUEYHrDA2jqeh2a5YSy1AradBjhCSpfkKalvidtx
         MXLA==
X-Forwarded-Encrypted: i=1; AJvYcCWjMRZqeJfX0PGEJooUs0mQpGqS7g7/JHzPUlAZqd9Lz5y9CI6BPb9Ue+9xgOVZSPqQ9MJ6/A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+ntzOD8Pw5yZDiJwo3A4CQWC6UThYX0HkROa2nkUdNafd8Yp6
	tzJkE32mI7ZnJJ4wg+blxwLYW1n0TMHukV6hjsVwa1Hv2ZF4P6q3M0a9I/ehio97MQ==
X-Gm-Gg: ATEYQzwRn2TZzYaf8NeJjgkvHDg+tIQqx7Ng7BBy3CIgihDC4ZiOakZUIEDGDwEchgj
	eq0KwAJ7COvo8PZkDfN/KXUVCASq5xEYaRj5HnVWdzz3dcsW2KIgxcBTsq/d9HVHDsA06w5055M
	fvDtHrlnx04zSF8mOE4Xgy6OBpnysJ+c+36kVU45xR+dSCLy4WF+QW36GEklo3LSU2p+rNwogsY
	7AVB6oHnEqs2GB1DTI+TWOOZAkYXnovdv1VhZgcyuXcc7uC5FlWFCTQalfbUZfMjgYx9LdKJS1A
	AtCg/9LVvrk8L7hTFIR82UpepGZ0tcJJNT5KUB7+XHpPHl2+Q3aCcNL0bUz7zaPCFGv4TVNBw2d
	Fv7RCSKH4Dp9puygWuPEQ4RzjTUmcMxi9tH/C/eIsl6Iosk8KBlPLRFkGjqJVUy9ckg4TTgawtf
	hkLqx/aqzgVoDrlkNxv2dc1GiKhgOEOAyK1P9GYzBNYFON1OKqA7zSKjww4V3OM64hk4xXs45Ax
	CSqLr5k
X-Received: by 2002:a17:902:cccb:b0:2b0:5903:140a with SMTP id d9443c01a7336-2b0590316d9mr69517575ad.10.1773729679022;
        Mon, 16 Mar 2026 23:41:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:a064:c65d:a199:5cb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece605231sm124269425ad.27.2026.03.16.23.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:41:18 -0700 (PDT)
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
Subject: [PATCH v2 0/4] drm: Support DMA per allocation kernel mappings
Date: Tue, 17 Mar 2026 14:40:42 +0800
Message-ID: <20260317064049.696795-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is an attempt to revive Rob Herring's "DMA per allocation kernel
mappings" [1] series from 2019. This series stacks on top of my recent
"drm/gem-dma: Support dedicated DMA device for allocation" series [2].
Many of the allocation paths are touched by both.

The 3 driver conversions from the original series are not included, as
the changes have landed in some other form.

Patch 1 makes the rcar-du driver use one of the GEM DMA helpers to get
a scatter gather table, instead of calling dma_get_sgtable() directly.
This reduces one location where the DMA APIs are directly used with
drm_gem_dma_object outside the helpers.

Patch 2 adds the kernel internal DRM_MODE_DUMB_KERNEL_MAP flag.

Patch 3 adds the dma_attr field to drm_gem_dma_object, and converts
the GEM DMA helpers to use the dma_*_attrs() variant of the DMA API.

Patch 4 adds support for DRM_MODE_DUMB_KERNEL_MAP to the GEM DMA
helpers by setting the DMA_ATTR_NO_KERNEL_MAPING attribute for requests
without the DRM_MODE_DUMB_KERNEL_MAP flag.


Existing callers of drm_gem_dma_dumb_create_internal(), with the
exception of adp, all use the DRM client API, and otherwise do not have
any direct use of the kernel mapping. Thus only the adp driver gains
setting DRM_MODE_DUMB_KERNEL_MAP before calling
drm_gem_dma_dumb_create_internal().


I have also started to convert the exynos driver to use the GEM DMA
helpers. I also plan on looking into the rockchip driver, but that one
has a separate IOMMU path that needs to be handled. I might copy the
approach used in the exynos driver to deal with it.


Changes compared to the original version from Rob (v1):
- Link to original v1:
  https://lore.kernel.org/dri-devel/20191021214550.1461-1-robh@kernel.org/
- Rebased onto renamed GEM DMA helpers
- New patch for rcar-du
- Patch 2
  - Make drm_mode_create_dumb_ioctl() emit warning if args->flags is not zero
- Patch 3
  - Made vc4_bo_purge() use dma_free_attrs(); this is the other location
    of DMA API used with drm_gem_dma_object outside the helpers
  - Expanded commit message
- Patch 4
  - Added kernal mapping check in drm_fb_dma_get_scanout_buffer() and
    drm_gem_dma_vmap().
  - Made drm_gem_dma_print_info() show "vaddr=(no mapping)" for objects
    allocated without kernel mapping
  - Dropped existing DRM_MODE_DUMB_KERNEL_MAP flag addition in various
    drivers
  - Added DRM_MODE_DUMB_KERNEL_MAP flag to adp_drm_gem_dumb_create()
  - Added flags field kerneldoc for drm_gem_dma_create_with_handle()

I dropped all the original Reviewed-by tags, as it's been 5 years since
the changes were first posted, and also because the code has changed a
lot.

Please have a look.


Thanks
ChenYu

Original cover letter from Rob:

This series adds support for CMA/DMA users to skip kernel mappings for
GEM allocations. The DMA API only guarantees a kernel mapping at
allocation time. Creating mappings with vmap() after allocation may or
may not work as not all allocations have a struct page. As virtual
memory space is limited on 32-bit systems some drivers will skip kernel
mappings when possible. This prevents those drivers from using CMA
helpers and the generic fbdev emulation which results in a lot of
duplicated code.

In order to distinguish between kernel and userspace allocations,
a new flag, DRM_MODE_DUMB_KERNEL_MAP, for drm_mode_create_dumb() is
introduced. This allows drivers to override the default behavior for
CMA helpers of always creating a kernel mapping.

Mediatek is converted to CMA helpers and Rockchip is converted to generic
fbdev support. I also have patches to convert Rockchip to CMA and shmem
helpers, but they need a bit more work. Exynos can also probably be
converted to use CMA helpers.

Compile tested only. I did test fbdev on Rockchip, but the h/w I have
has an IOMMU, so the CMA code path doesn't get tested.

- end quote -

[1] https://lore.kernel.org/dri-devel/20191021214550.1461-1-robh@kernel.org/
[2] https://lore.kernel.org/all/20260311094929.3393338-1-wenst@chromium.org/

Chen-Yu Tsai (1):
  drm/rcar-du: Use drm_gem_dma_get_sg_table() helper to get scatter
    gather table

Rob Herring (3):
  drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
  drm/gem-dma: Use the dma_*_attr API variant
  drm/gem-dma: Support DRM_MODE_DUMB_KERNEL_MAP flag

 drivers/gpu/drm/adp/adp_drv.c                 |  1 +
 drivers/gpu/drm/drm_client.c                  |  1 +
 drivers/gpu/drm/drm_dumb_buffers.c            |  4 +
 drivers/gpu/drm/drm_fb_dma_helper.c           |  4 +
 drivers/gpu/drm/drm_gem_dma_helper.c          | 93 ++++++++++++-------
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 12 ++-
 drivers/gpu/drm/vc4/vc4_bo.c                  |  2 +-
 include/drm/drm_gem_dma_helper.h              |  3 +
 include/uapi/drm/drm_mode.h                   |  2 +
 9 files changed, 82 insertions(+), 40 deletions(-)

-- 
2.53.0.851.ga537e3e6e9-goog

