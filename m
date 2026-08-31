Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4762B3CC7DF
	for <asahi@lists.linux.dev>; Mon, 31 Aug 2026 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168309; cv=none; b=pZENnLEN0Ho2tDcrff4E2RJL3AsDrLs/S5iZEo6KiZ2rrzCtWRRe+vze77jGWjKM8ZtpUNRbgnZMfDEtNQAiOM6QcCcdxE4UosHJBP1NvgcL72Ycl7LGuCjX40PLoWZF3wpcD6zp8MJhno9u8DrugbCsTaPS4RuGYnx14C3srmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168309; c=relaxed/simple;
	bh=qB8s8hgLiwwzQUS/BjiiGt7iGpPiuwlo6zbKh3mEro0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M/T3+yiB7Qs5r1HYEN0A+Wj9ypb6t6mbFk89irq4ZRl1qHoZsT9Lp3QYmw+g5a/ud2ijiDKiifWBG1SnfWRKcRqjRbQtl4i6A6R8+61vETSM2rkK3BxFiDqcZ5j1MgBr7W7UyJhNnHtCNooojmuSRUNzsmusi+gYgEgD9SlRW+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxZ2WKRZ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxZ2WKRZ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398ba166ce3so1288389a91.1
        for <asahi@lists.linux.dev>; Mon, 31 Aug 2026 02:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788168307; x=1788773107; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k1IRmhTgtgps2WH28DrYHzZw8IYzte0O10wXaGr0CRE=;
        b=KxZ2WKRZlijTqupaJ7t8qUsv6/pLnYqXsZjlNReemZmQ4GevHFYOQEI3VXZ5jjFyv9
         iFV7t3eKIeDk75p19HUe9DMixS5P7KcMTT6sSZ4DBxBMYL50Dj6Lp3bvigSj1h6R91J0
         smFeyuPz1m2zuTZzD98iJMWIg02Qqwmiu9oM0Ef1MBxdhw6QtU+IjsRlG+EvpIGLCqu+
         pJ/stnZjzg1gAnAZ6qLw0ICUIUWd5Ikwc5YZjxIftfZdYhBcPdimOJb8MrajaYh0Z1RM
         D1cPmdKzlEM0QYvWi+cPKew2wdDpij5bXATC/rKxzi5+YfHazdQl9UK1/Lb0s7Uqor1v
         yUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168307; x=1788773107;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k1IRmhTgtgps2WH28DrYHzZw8IYzte0O10wXaGr0CRE=;
        b=P9jdS7L6zjGfoUEo4R+NYazteM7AHvg0EThCN+1cHcgi7hk+tZzcWq7iOJtDZjbARY
         rdEM7yKSbmFMYxE7sX/kBCgLKX1lYbjxwnMNU6XRZc0enaSIptrusCFJ+s/x/qlc4vt8
         sr5zour08DoDhIShb/AwuJ5Sy3ds0ooMGtLpSicrmbHTbQrKVxFYSiRrC/rMWxelxuOW
         u0aA0Klx+HGuyK5HraUsfC7rqUK23eg4aqs7nYBBjZP6/TY6xb3et1XRhfPlVJekgVkY
         +O7wAU6Rkvw16k+4m2n8nWEA0a2fk/a4vmS9s9Vy1UCI/saaxi7cgfFOd1LmMyCoY0zg
         eNNw==
X-Forwarded-Encrypted: i=1; AKwUvByisWjATEwS7PwzU5ifSjevRNnSuD1Eaf7xu1pSQq88lAIU4aeZ/6PfEr4ajzGkAX2A0yxe/Q==@lists.linux.dev
X-Gm-Message-State: AFuF++kiJVFgMjUNBqK/G9c0YXY/AgfORAwHiN9deGB4KIcehJmMb/0w
	8iw34eGdgxcuBPiHfKlTR0KsU+ZU9NM8suyxSfyYizgY37VkhJNMHKUh
X-Gm-Gg: AYBFou1SYTvAZELXKqw+n34z4fV4VM947I3Ytr0k/ILUe8ZhGMhIFg7MaT8POuf1nUl
	EaqnyLAemqjRK1DtqRWT/gq7+Yy16+8VCxFcpM4tQvyr/1ggXDL2Y1uEwQhOdDbvBX0ome+t4Fi
	D/uRxrQvhnKLO0YzZZHaQTqOnl89YdW9P4pKf8tXXFiXLbaayk1FonY3aYmGZbobmVqCzNVB74v
	3Jvyp2tVOY9aYGyNBMUld7v2UQpbnR8xqkZHtVvtjW8pSEoRwqWHhGhvkVQYKTv1KX1lGZ9oLyM
	wgzscfCNzj1krMv9dFehu36EUc0l0XOQLKx49cwITSrFl2dA6+qMVmvzabNjR0LARI0yZRlnstB
	K1NflQmyCo06jJvzwxm/BHLOcw3AVglVep97g1xkT5Okzf/b/rbyJNjiXHwgEd3qHfORPIoemeQ
	Qj2Ef0AGFu/7ydHuwBiw8/nEgthR6x+sEpH2tEFF/VwBczlt6m6ftIAi4CeaERcVbaJ61z36lfj
	VbUI2/j0nCMTot2mJ7IE5GHd/b/JHpukTaWuu/m2maQGIDaLHwOqoFdm1YfVDBJ6CvRBNwXfB5/
	0ToYbOcAu8czKJddcmHOflArW2fRXUEdcB5sNaICK7XM5zA=
X-Received: by 2002:a17:90b:4ccb:b0:398:c0fc:6ea0 with SMTP id 98e67ed59e1d1-398c0fc7b03mr16400154a91.5.1788168307412;
        Mon, 31 Aug 2026 02:25:07 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc854dsm26587955c88.10.2026.08.31.02.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:25:07 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 31 Aug 2026 19:24:28 +1000
Subject: [PATCH] drm/fourcc: Add Apple Interchange layout format modifier
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-apple-interchange-modifier-v1-1-5d6e27f9f308@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3MQQqDMBCF4avIrBtIDIp4ldKFTkY7RWOYRBHEu
 xvbLv/H4zsgkjBFaIsDhDaOvPgc5lEAvjs/kmKXG0pd1rqxWnUhTHn0ieR/mBfHA5Mo7BGtMdj
 YykEGgtDA+xd/vn4d1/5DmG4RzvMCO3nK/34AAAA=
X-Change-ID: 20260830-apple-interchange-modifier-cbcc311c835d
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Oliver Bestmann <oliver.bestmann@googlemail.com>, 
 sofus <sofus.c@icloud.com>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=qB8s8hgLiwwzQUS/BjiiGt7iGpPiuwlo6zbKh3mEro0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlTPfL+avkx3Lp3UlD4xNInzHP+ep1t2Xy+ZacqK8Ovu
 ake23786pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1aTtGhmvcX4O+sO9pyQnYlzOjtWELp0FX/mlX46W/J0yxUPBLOMvwP4j9i8e
 i1ihlbpvvFgZL3dec0HANYF/Xzfj11ZyXzpbFTAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple Interchange is a tiled and compressed image layout used
for buffer exchange between Apple hardware blocks. It is
similar to the already-supported GPU_TILED_COMPRESSED layout.

Add a format modifier for Apple Interchange so that it can be
used for buffer exchange.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/uapi/drm/drm_fourcc.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index a103fdc0b3a3..aa51c116cd7d 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1626,6 +1626,26 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
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
+ * Unlinke the GPU layouts, tile size is not dependent on bit depth. RGB
+ * images and the chroma components of YUV images use 16x16 tiles. The
+ * luma component of YUV images uses 32x32 tiles. Compression tiles
+ * are once again 16x16 with 8 bytes of metadata per compression subtile.
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

