Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE9C33EB1A
	for <asahi@lists.linux.dev>; Tue, 17 Mar 2026 06:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773729686; cv=none; b=AXVQ/BnC/HFiKPQpyTZc+gxvLfHfIsw1yUcfPH99X/ucygN5xKSCO3AsX9H6bsPkZXP5UowNJXtEiJkt2SnNOPbp+ZC9Pm+QtTywPXWId++CBja+cnyaM0tX9gFL83GjNl4/5N2ucusETMR3T+8dQ2i+wugbxz/QPe9XEmXefRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773729686; c=relaxed/simple;
	bh=K5zbRFeXpdZLY5xv8AuAeuYSYs9BVhm6Sj6nRcTzF6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8v9ShTpRnaY4lCfyURl8Nal8IPPXD6x75Cqir7tyAUq9qJOLs71akl3/P1qRy1yH8PwDmb88u+/cKccW0i1MP4b01CGDbPjQ0G46sUs4zR0P+E5ifV4begrvHBzMpjfCsQrncRnElE1tkeTnkEXYOQHCn0QSjlDMcIkJC85aoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=leomXpH8; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="leomXpH8"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c2af7d09533so4300176a12.1
        for <asahi@lists.linux.dev>; Mon, 16 Mar 2026 23:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773729685; x=1774334485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvknyLemjW45Ap19tt73jCMr/JsVlCyt3yofdVpnnZw=;
        b=leomXpH8oUTjZPuaS/U/mhKs7Z52eu8SbHI/qrI238GG1ZIYEmPhBM0IVyA1VuKGWb
         kn+n3GO8mRIC9wT9lI8+4bDKMTPm3tstBQkM2Bo6pwpaeoUO6weBg9VelI7wF0pSz9+N
         XjKZMlSMs9DSDVbpaWpUQHwuPCoDR/GWCWero=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773729685; x=1774334485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nvknyLemjW45Ap19tt73jCMr/JsVlCyt3yofdVpnnZw=;
        b=mHtMYQ54hWMDE3S4x5yYe+jajFpj9bWWWtCGtyT0VlOjCE5Tufj3vK90f4f1FHSJ19
         PNyeeuGLsSIKf0MudmesXpoBLntwsyl3ca45Nu68fKx/il1eL0WUFpWgx832p0Cu6SLx
         ZHQTfnt7tcxsNRqLRJi6jNS5j8uMsQE1hxvAF7Dzc70fpBh7opKiMCEH0AVtG5kCwaQP
         ofzWng3uqQnjo4C54ClDr3D9Q1ElKetPUdCNDzRXS3a4y0YPyOQd9/0fdzsWR2n6DOnN
         SlRrBvDLKfyymIQPj7KSixdtxzDbE61rIP6TUSKW7yV+8j1mTHhfaXlAqiaReSvdlMc2
         OaVw==
X-Forwarded-Encrypted: i=1; AJvYcCWE5i6mmibLMsmX/uNnqdjKwcYVeoCSMUeBdHexWKbxPnWzO73hbSnKuKMunb4C7cptv3s0tA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyoz3xtf0UzX0WAM7NxOrYS1TTs5RHBP/ndDtFEEc2XUzevLHzO
	ABS73zjan/Xa0d7Q8R8H+e1YocTLGud3kxtJLndL08B/0badoLYWqn8OIV8FTFDZMvMRRx3PdNK
	TS7Q=
X-Gm-Gg: ATEYQzxX9dro8od+8PMPDEeL/jhJYU1870OS4vFCQgFwhKXViizeBRO3NLmp7Odg5ir
	gcqkLhYQh5mnjRXHZUofYUV15teZ7DcSgJO3l/ZJt3WSLOSFeOZ2Cv5KVZQ7KRLPoBb59z2dwFB
	EAF0FEfzZcYUGjcMiaXl3JCjsYW91XgVX6fEmFhB7JmZtx4k8bWCgU3f02INjnAggUa9HK4tQqa
	/6rMgdnE6j6soXUq26LlommPpNbHzUlNGE+YJg3zcogVQa3e/JGvBKNUUtioNW1X7e3F17yDRCv
	APtIcutMRBxbooG+1QzIkhu3aZSLNZRQ/X8yZsVF+QTB8uDkNfTs25VlNPmDJ47mHJrjX51Wsll
	Bcvgy01QWVp/x2M9w1NIFvWTuf7rc3sLLUJM/jinwANE2nBJZyYY3MHebgEVx9tZEjavSGKpeWN
	FgHhNFXdDQedPBBgMvm/9W9ODL+0SqGoLb9aKZtZXCgumdEOGon6GQdXnvaCO829wbtXERcNMTl
	z7GFR0w
X-Received: by 2002:a17:903:2a90:b0:2ae:5628:a18a with SMTP id d9443c01a7336-2aeca940e72mr180774555ad.2.1773729684962;
        Mon, 16 Mar 2026 23:41:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:a064:c65d:a199:5cb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece605231sm124269425ad.27.2026.03.16.23.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:41:24 -0700 (PDT)
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
Subject: [PATCH v2 2/4] drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
Date: Tue, 17 Mar 2026 14:40:44 +0800
Message-ID: <20260317064049.696795-3-wenst@chromium.org>
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

Introduce a new flag, DRM_MODE_DUMB_KERNEL_MAP, for struct
drm_mode_create_dumb. This flag is for internal kernel use to indicate
if dumb buffer allocation needs a kernel mapping. This is needed only for
CMA where creating a kernel mapping or not has to be decided at allocation
time because creating a mapping on demand (with vmap()) is not guaranteed
to work. Several drivers are using CMA, but not the CMA helpers because
they distinguish between kernel and userspace allocations to create a
kernel mapping or not.

Update the callers of drm_mode_dumb_create() to set
drm_mode_dumb_create.flags to appropriate defaults. Currently, flags can
be set to anything by userspace, but is unused within the kernel. Let's
force flags to zero (no kernel mapping) for userspace callers by default.
For in kernel clients, set DRM_MODE_DUMB_KERNEL_MAP by default. Drivers
can override this as needed.

Signed-off-by: Rob Herring <robh@kernel.org>
[wenst@chromium.org: Emit warning if args->flags is not zero]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Emit warning if args->flags is not zero
---
 drivers/gpu/drm/drm_client.c       | 1 +
 drivers/gpu/drm/drm_dumb_buffers.c | 4 ++++
 include/uapi/drm/drm_mode.h        | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 46c465bce98c..1a57e7eadc0f 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -404,6 +404,7 @@ drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 heig
 	dumb_args.width = width;
 	dumb_args.height = height;
 	dumb_args.bpp = drm_format_info_bpp(info, 0);
+	dumb_args.flags = DRM_MODE_DUMB_KERNEL_MAP;
 	ret = drm_mode_create_dumb(dev, &dumb_args, client->file);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index e2b62e5fb891..ccdcc401d4dc 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -233,6 +233,10 @@ int drm_mode_create_dumb_ioctl(struct drm_device *dev,
 	struct drm_mode_create_dumb *args = data;
 	int err;
 
+	if (args->flags)
+		drm_warn(dev, "drm_mode_create_dumb.flags is not zero.\n");
+	args->flags = 0;
+
 	err = drm_mode_create_dumb(dev, args, file_priv);
 	if (err) {
 		args->handle = 0;
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 3693d82b5279..7d5f50e4af70 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1272,6 +1272,8 @@ struct drm_mode_create_dumb {
 	__u64 size;
 };
 
+#define DRM_MODE_DUMB_KERNEL_MAP	(1<<0)	/* For internal kernel use */
+
 /* set up for mmap of a dumb scanout buffer */
 struct drm_mode_map_dumb {
 	/** Handle for the object being mapped. */
-- 
2.53.0.851.ga537e3e6e9-goog

