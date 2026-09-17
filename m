Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00603457E41
	for <asahi@lists.linux.dev>; Thu, 17 Sep 2026 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642203; cv=none; b=mYfxr9pb3AIGXi8zwosHEeDSkJqumFGs7b+pcsp/xYseCaYIVUoWjgAW9vaaOiFAUHUzSKB/BHhou2wa7gloacM3F0rnmVjma2QNlc90sImT4nEEW/U4d0xLDCC9JVIgPADWtJQ3rNwWCm9sdTkCx2YzfBBVF4+rxI2hEPOgXHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642203; c=relaxed/simple;
	bh=X1GV84Wq/vFzYUv/sfCUjMI1OdVSf5hhLntbftA070c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cvS/O0hFw1PXG8TQ7+GLB0VeTIWa3m2Ss3sooSGrEGQGa/y8n7v0uL8McjQ8C6HQtChIjhcOuynlx4rBYYc76D/dpCcIGcZ0QblFe8IlzN49dXVHCkXviypC4j6wwvqxrLOv5WCf8epxnq5mX6ytIrXtNKiQgnC7R/vZeqyiijY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UX6tzemg; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UX6tzemg"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso549407a91.3
        for <asahi@lists.linux.dev>; Thu, 17 Sep 2026 03:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789642191; x=1790246991; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JgGGToNc2v5pflrpzy2awJuFvrt52U0TkSLrIqd2nHA=;
        b=UX6tzemgVpq5LSPvKE4JUSavRpAi1DNgtYqFE1fuuk+NAsQovjehluoJE4O95G4E/c
         T1r/NE9xItfO+4LqFhi18LxUeguHVwP6QMwY79zX7TBqLNIqhw9bozrJMKe4nhOfa8WS
         pzZQyGkEJPRRNqA2FtOTq16saWvUrRDTCfN+JD5WH5gJya3/R8C+n5M9Swi7J352p2L3
         pT9eYVhDHcENkbXCMgSRLcb8zPRaMB9Acc3xWwQGXr9hRp+mXQhfLotfZuvEIPmBVk6J
         0W3tnENGSxkKrkYTBGjHm04oOZtScPpG4KEdtxD/XsDNfOnhN3wJLyNHnepGh+iIS5NP
         wAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642191; x=1790246991;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JgGGToNc2v5pflrpzy2awJuFvrt52U0TkSLrIqd2nHA=;
        b=N2g54i41DTTKpo5aALiKVA5NnZ5JW77fUVjQ6OJmY/HKVGXc8HAVQm5O+LtdPclLKF
         9rdBBITtjEsgvhngVUSpdSWZkJsx2+yGOSBSFGYyZGXggytAQjRKfbXo88dlo4MDbt5q
         j/wwMIkhHZRMjzk39j4WwPdQq6IP/koQdCaxEtq8nqIsfC+QcZiKeXX8W/pquVOXSROY
         dRdeRhr3BXlGOYjhHx6Fs5mqohadn78SJiDkMfDTJsW8GUe7eFcwfbSWF6UN5/VKPgQK
         DxAJKVBI1SY9uJd4XqvVoH0ThvoplS38RZh+bUFfREJBlH5OANx5YJD3iF4MSCfh4ObN
         T3HA==
X-Forwarded-Encrypted: i=1; AKwUvByYRYBaqUjwH6J9Dp0qacixkyjvJN7fUw2UT4HXsm8LrTr0qIn+3D6bRtv9IcXNaHl1jFy1Rw==@lists.linux.dev
X-Gm-Message-State: AFuF++nXDkGQBZcquK665oOQuo+/StgofCcsI13qE+E/ft1DWQ0CmPwi
	hn3IjKCAbYy3iO6mBlPUaQ7i5hEBL9PtSvoegD2IWEA/LDp4AvwCHHEl
X-Gm-Gg: AYBFou1kVT8m1Dv9KTb+PmxGzs5WBVXEQYLW/SfF4lAYA7JfuRea5Q7aOR+ZyBSnv8R
	rLvziERMFUSzdHVyxpsSABQJdijiUegdGWu5MFiuBitip8IiEVgMeSKefNvRpNxG4KsHI9WsmFb
	QZUiSFteTAkz8w/Bhi0pqn0LalmhO7wWlr48WOog+62fZOSrL8ZyB7PWg7vMf89BGriWPnv5SMW
	57WxxTc7GvYaMEvaHXtbLU8Moq7DGSfYlVfAhNfjE6myIkWmm2uW6Mc/Hj0+aaSAon4w6BvEdPN
	D7QCpv9y7wBJ9Thj4vMoEY9EfZzf5FmFZ0/c+ZxUZWOuVRQ4e7470Br6MYWov9GmotiLKPk9AxV
	+TS2fHO0j0ke0N7J7tJV95ad8ZIehXSTHeN8iY7cQrMf3dkbHsA8xwFg/oMR2V5dsO8+Jc8e9G3
	l4NMC57d9na80/xNh0f70ADiALfE4xlGOcrmQFimg0S6eTv/RqUrc3f2keayYdlvp8aNf0gNeLK
	ITZX/gP8mXIzp5/TBfVwplsgrsYEGV+lnUfzYfzMtJDOeAvBugoGsYGL6NyTCk0BLyVstNuCI5R
	ouDS8eXgzOgBlg/+nuKh1dFM/osF5dVjsAh7RMNQqaeZKco=
X-Received: by 2002:a17:90b:4e88:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39e1e30ba45mr15259032a91.11.1789642191459;
        Thu, 17 Sep 2026 03:49:51 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e39bb3f1dsm1062109a91.3.2026.09.17.03.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 03:49:51 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 17 Sep 2026 20:49:29 +1000
Subject: [PATCH RESEND] drm/fourcc: Add Apple Interchange layout format
 modifier
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-apple-interchange-modifier-v1-1-875294689c48@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Oliver Bestmann <oliver.bestmann@googlemail.com>, 
 sofus <sofus.c@icloud.com>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=X1GV84Wq/vFzYUv/sfCUjMI1OdVSf5hhLntbftA070c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmrjx7fMcmxc0PVGZ9HIrxaxg9nG8kejncTsVz6OcDp/
 Jn8/9vVOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFMdFsXIsF1l057fpy2nK83nbVmU9Ex0n02S09e+U2nefeUd59dNymdkmHVg1ZT
 sJwbz/M/uleJP44+qa6q95nTvsPtND7dLJmuaeAA=
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
-- 
James Calligeros <jcalligeros99@gmail.com>

