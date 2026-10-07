Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80AD471437
	for <asahi@lists.linux.dev>; Wed,  7 Oct 2026 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365631; cv=none; b=ITe47e38/DFyoXFHfz2D8fYJBOXcpbga2Kbs6hnrsSyKPu2h4UcRfl0n7nb/tXS7oFRKVvWhSwL7/j/e+KlN7twaz3z25oTAjQu7OO9Q55s8Xr7ABbBg2Su1n7pFJeUn4VvoNZy6wZdp1ftJOc99ooeX3ck+HiHuKtOviPx9X8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365631; c=relaxed/simple;
	bh=C3V4UXgsMyjfls0kAgGHGbnZQnqSrUwTQ3JG/daKfzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Dz8G0CmYMz32V9LsUuBnCbC1PCDPFJ/COVutW9Wbk37bDq9OVsT9nPweABW96xBaCj+/Y748XeG60D/vt9mikoYFw0yCtSnmUiqoYMYAVFXY9ZQ0dVxPZQSDvW/JKRlbHIY9sEifAlUAhCaYbR9T6f0DydClcNXc87I8w8BS4sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOh6Ii2r; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOh6Ii2r"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so2126433a91.0
        for <asahi@lists.linux.dev>; Wed, 07 Oct 2026 02:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791365617; x=1791970417; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vy63mdqIPndIk85N+xwyTXgE3amsDxjtRy55K/v9EX0=;
        b=QOh6Ii2rHMQLChJbY1+T551XiPVlWuIWtGTrpwUgG/2AhxyMpYvZ6omy26MJG0gFju
         6//rH7IVz6mfYotvRd/AJm4ethPo7C7hPgH4ebVwQ9i+ZEQgoMsEdCXySkXYcp9TYT7i
         2PkYQOVkpiZI41h1b65T19vg1lB7anvVztjUPxMYdFhlpYZ7BggPt1Y8J+TPrzDccUzP
         BuWLB8eftLgSp+itshgmrG1k2MXuHlLCevI356172Ts+DsBzzlPC5JBLuN0BFUPKkqBt
         CpJ55O/Al03mw05q5aJzYYEUf2HYB43KrUJIPMDlkeJ0PAkrtygHJjkvW3e2qG7r7mDt
         BIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365617; x=1791970417;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vy63mdqIPndIk85N+xwyTXgE3amsDxjtRy55K/v9EX0=;
        b=cytJvl77YKrs4EWZvvE1OicX+dZAUMLqqa+v14TvQDLaSXV/cR78VUIss5fHHFh/oH
         cF6aIMP+RyJm+VyLFPifTQ3WtzDfF1cdzhpq3DVfK8CPfmPLhvnHEQH0zMrvqsfmHsEu
         Eg+HAwWbuGt0mdWQiRsm4Ny7skJc9fEcr9qHDP6ssj4qMjYWuLxDFaoaNVephEUpND2M
         /JN539dhMf/LOoul41ts/aPdPlVKdtman4lpSX6tetji3ePKIWLKkMmGdHy48mbl0DxK
         BhC4Yq1FvLSMCGKwObExtdBICq/7Mi1z8d5PygWFlxMHwDfLboRnen2UXBRk4V9jkbTt
         uhIw==
X-Forwarded-Encrypted: i=1; AKwUvByZ8AyLL3WaIdTWbUC2KMQGbNbZrN9sVN5yaI7d6kU2VPe2rvhipfIyfFi17mqsSf0hnGs0GQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKkXLQ1IOqub+lFs1nJpqAOgeAV9cCE/YwjgXWA/YtRAVtFujYp
	1OQgzc+XrLqQOihbZ1isOQLLDiKjG3ahG68wBSFjW+OSnkI3WzVIe3T3
X-Gm-Gg: AYBFou1vpHHmoNk5Vv6AzXob/8jaCV+hGa/qV7OUTHDjyv+7yjC1LF5YLsJhxsivK8B
	fYi12OnrySD/1Qo6Ho84Bsj9bzCoZKbMITv7ZopD9cgX2TOQp4dKLcFROhR/kb9/vo9WhahCTlR
	FiAEy2A8hsPT5qX0doJ3rU3MJwUTpFtCusMIifQmZ24ze7TfScIkWiveq1YmD4YsDgFZnSI7KHK
	O7t08mlqFjCvFydro4f43XfT+VSLfCjvOuZ8WiuGRxWqoKmpM/vmP1s1CXXe9uPMPDKTORODuo/
	Gh/uY3XozD62gCcOvfhWDShK/cFBC0mBQwLmSFUcaVqacG9k+p/uOQWGw7ED+LjT00NCvnAxjhC
	WoHyABdpG+RVxMRgXknMnxt5h+Q9LKvKYWUDlm/9PPbaY9aE4HjKBRcqyUiTZu37o3OzAH9HpHo
	UfwjVnOke/dqCORm7wzI/4168k9wgRQqFIi9eDeSeTEQOWWiHB5lDdHWIqrW6Ia3Az4MjxPCwal
	DscAg8eTjKsrvJpS3rWJXffF+mnvnx8KJn8ekYiQnm+IC8Un4WxAsKyxPEFPM5cVXXlD2wmJM0e
	CFnKZnpPB2rMRw5pxwgznoDQajHhRJTT+JbKWXw6uQvflBQlQpxVb/UAnw==
X-Received: by 2002:a17:90b:4a86:b0:3a7:f64f:6473 with SMTP id 98e67ed59e1d1-3a8a1be69d6mr1440644a91.50.1791365616910;
        Wed, 07 Oct 2026 02:33:36 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e662a5sm9119994a91.4.2026.10.07.02.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:33:36 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 07 Oct 2026 19:33:19 +1000
Subject: [PATCH v3] drm/fourcc: Add Apple Interchange layout format
 modifier
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-apple-interchange-modifier-v3-1-721fc44abf6b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4V0bU2nBURX/odxAe0UxvBKi0RD+
 HcLPuKK5bm5OWdiHh2hZ6doYg5H8tS1AdQuYrrK2xI5mcBMCpmKTAme930dxnZA9zk0nSFL6Lg
 utFYAOlOJYUHQO7T0WOWX65v9vbihHhbj8qjID517rvURlt83BFuhETjwxKQoD/ZolcjOZZNTv
 dddw5bQKH8qECLeVMmgikHkyogkBpv+q+Z5fgEOhUYuIQEAAA==
X-Change-ID: 20260830-apple-interchange-modifier-cbcc311c835d
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Oliver Bestmann <oliver.bestmann@googlemail.com>, 
 sofus <sofus.c@icloud.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenz.ca>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2877;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=C3V4UXgsMyjfls0kAgGHGbnZQnqSrUwTQ3JG/daKfzg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnHBF/88+VblZ+1TMx8yeJ83+NmB837n12arO/f7q3Vm
 Xw0OO9/x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKpZKhj+Wbsab5+a0sgcHXn+o20uo7j+PPcyxQCZoK4qtZzv6cc5GBnuqXKZ597
 SvBPqMTfAw9O9rLVdyZO9I/oda4RefVNvDSMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple Interchange is a tiled and compressed image layout used
for buffer exchange between Apple hardware blocks. It is
similar to the already-supported GPU_TILED_COMPRESSED layout.

Add a format modifier for Apple Interchange so that it can be
used for buffer exchange.

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenz.ca>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
Changes in v3:
- Explicitly mention lack of stride and single-plane treatment
- Pick up Alyssa's R-b
- Link to v2: https://patch.msgid.link/20261004-apple-interchange-modifier-v2-1-410a3d0541f6@gmail.com

Changes in v2:
- Fix typo
- Link to v1: https://patch.msgid.link/20260831-apple-interchange-modifier-v1-1-5d6e27f9f308@gmail.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 include/uapi/drm/drm_fourcc.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index a103fdc0b3a3..0bb049f91524 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1626,6 +1626,30 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define DRM_FORMAT_MOD_APPLE_GPU_TILED fourcc_mod_code(APPLE, 1)
 #define DRM_FORMAT_MOD_APPLE_GPU_TILED_COMPRESSED fourcc_mod_code(APPLE, 2)
 
+/*
+ * Apple Interchange layout
+ *
+ * Apple Interchange is a compressed framebuffer format used exclusively for
+ * sharing buffers between hardware blocks (GPU, display controller, video
+ * codecs) on Apple platforms. It is similar to and uses the same compression
+ * scheme as GPU_TILED_COMPRESSED. There is no known uncompressed variant
+ * of Apple Interchange.
+ *
+ * Unlike the GPU layouts, tile size is not dependent on bit depth. RGB
+ * images and the chroma components of YUV images use 16x16 tiles. The
+ * luma component of YUV images uses 32x32 tiles. Compression tiles
+ * are once again 16x16 with 8 bytes of metadata per compression subtile.
+ *
+ * Following the example set by GPU_TILED_{,COMPRESSED}, Interchange images
+ * are treated as a single plane by software and do not have a meaningful
+ * stride.
+ *
+ * AGX has limited support for Apple Interchange. It cannot be used for Z/S
+ * buffers or array images, for example. It is intended for scanout buffer
+ * sharing only.
+ */
+#define DRM_FORMAT_MOD_APPLE_INTERCHANGE fourcc_mod_code(APPLE, 3)
+
 /*
  * AMD modifiers
  *

---
base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
change-id: 20260830-apple-interchange-modifier-cbcc311c835d

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

