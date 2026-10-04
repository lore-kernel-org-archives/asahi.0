Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F021F156F45
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 12:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117781; cv=none; b=OMAsOqUVSz571QLQZu1euiiUqdG06Rn2N9qTJTP4XKgyA943ObSZhvrhTqgvaVPeVT9zLkZmgoCP2N73R8S4d6IMXunfM4kU1WshKbcMKfzyCKu87G8wYGrDb0X7C2bHtFqlcg7IXLKFRkiKymwOHjMx6ygllJE+nks+83K/mOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117781; c=relaxed/simple;
	bh=nlCjiAzhkYiQ1nYPrjHibWe7jNID9lKUBjiluobqAug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P7KwR5IPNMqZFMCVUi5rD5S8oud4zIAutC7eq7Cq4TNmtXfytztl8Oz0dhZv9eVYc7T1RC88EBqNEacRx/CO1SWdGIKxMAO/2TbKu87Pu0uBYT9CkM/0OMMu1sW7lpirN3937Qy0CO3C2H36NVUpFeZpS5N9YVPkVQTf8qEcldc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJHc+yxI; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJHc+yxI"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a7e13e2a77so114099a91.3
        for <asahi@lists.linux.dev>; Sun, 04 Oct 2026 05:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791117779; x=1791722579; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=96zU+qlaXFSgWiLmhC8ZDksn5OkhGICnqsZNjrDt1Ew=;
        b=pJHc+yxIkvQjaqsKATbCGOn717Y91aith1XU2cMZZmEsIWBtKPlFa9HbNIZj+XWT5N
         9A4kKlfA7Zcf64KaZqgh1pBsHBSbUZkbQvjiJQxUoOXDMJBN7MDOlHG4ErKO/Lo/VZ3c
         y4pM+h0SXm76VmZsH5qqEG05JToP8k4wxcIQE+Kxjo5KZWVago1zOe6NNtNhVXvteAc+
         YeMuvPufw7m1nlw3QWvlEO2OshM+h1FjMTHGxAqkO6jyD2OLgQURiNr7EbxmdPqkfsTB
         T8vC4ZnUnDdQt3Q1pqt3oe7v72NA2YQiFvzvGzRoHg1XB/X4gMIgXZ26rojYg5DbLBkS
         8mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791117779; x=1791722579;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=96zU+qlaXFSgWiLmhC8ZDksn5OkhGICnqsZNjrDt1Ew=;
        b=1JHQ5SoBqTHrFwnhg/fNCvsRGofhGSCOkYWThDfEZUpOmjAkfsGkvIREF1QAZ9cArt
         X5PdChpEMe8uqjiOT3MsnkGXbx2xjgHPbZSwQjHxJR/90WH9n1Y+Syy4uYnJ4Szz6Oq8
         C5A16ghtI2b5yfjuVxd0vkN9TVywTKWh7v1L+RNbsvrpXFJF5JddRmxM2nFUf/ud9BOH
         L2pa4R63cz0rMIDJC2u6Enouru7OTDQnDbuBoybXFXUIg1SdCUQ8R09FhPUCm6uw/MgY
         sK1L4m3ujocM1sdN1NLq9pBkq/4n50hF3huSlT3uUYmSdp2dws8s58HWupjgRMe7sIK3
         uuZA==
X-Forwarded-Encrypted: i=1; AKwUvBya91h48kPy+XN6smLCwBjVqUNbNlVXqZowW2GWTw/Do7DWs06BFaHUjz9g1iTh/1FWTNLZKw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJMt9IbrvZIMVUplV3dq78aR99w4fKP4jOLPuoBsulOJEt/f2op
	/xhs/fyRIkwwnmNJ89I/xeDqtLO57kP/36XodZ0RK7+XdKLkTdqUSCOh
X-Gm-Gg: AYBFou3BekdZagILNWzjRvvrTq32o6hjMnPFWcfRixJxnIRhxPRhDzIM4Dw8MxljuSg
	bn933IIKiULonOytIwYSDqbEQM43gSbH8Jo8u6tHXpt+xL3ze/MVCld33Gb9Ktt0Rtt9tgwDsEI
	qZc1q/IMZbtWxsUYY40tWAcg0SoBefnLB1hbG6EHxwEiDK4mBynb8YedhO7p44XlATZ3GoBGVYC
	hM5zp8FE7bywlJEEOm3Iz4wcel9rxGDzoVdugzyRZfzScnsbtIES8aXFQzF+/3aQf9AdtkBAeJ8
	+TkNxehd7HflAKvIovVTSpBbzSwiPHsteyi6xAk79Eg2sGA4ISb8E5iFkZD+OJxyfJRrAyaF6MY
	+YCGQ0YIUYg+xvkCr84TNFgjK9E+rV2BVz5cE2hA3hnj/Q0GehzAQLLVuRntuhE9HtUCBvl+W/A
	thj9nNvBjD3R11xd2g6qEthx2twCBS6Pdrcs0kEFMiHfnPhYF4Ji4JEcWm5R6qVtGIsAWkL9vfa
	RQOCie9+1jK2LZyE61EJp4EHF1NAgCzRF3jPFKQQj4kFASD3SspZ7LmAIBqhdL8H00mmYwrbPGG
	s+9qrszkPBQF2umn9ziHLtuDm7f3TFk6JNytd5GfVqDxh20=
X-Received: by 2002:a17:90a:d64b:b0:3a0:c22d:fbe8 with SMTP id 98e67ed59e1d1-3a6ce7cea97mr5790108a91.38.1791117779256;
        Sun, 04 Oct 2026 05:42:59 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a5150sm6599177a91.1.2026.10.04.05.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:42:58 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 22:42:29 +1000
Subject: [PATCH v2] drm/fourcc: Add Apple Interchange layout format
 modifier
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-apple-interchange-modifier-v2-1-410a3d0541f6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4XM2po+AqIr/8OwgHYKY4A2LRIN4
 d8tqFuX5+bk3AUiBsIIl2yBgDNFcmMCechAd/XYIiOTGCSXBS8VZ7X3fRrHCcNXGJwhSxiYbrR
 WQuhS5QZSwAe09Nzjt+rD8dHcUU9bcTM6ipMLr/19Fpv3OxL/jmbBBMtNgfJkz1bx8toONfVH7
 Qao1nV9A+HaPonWAAAA
X-Change-ID: 20260830-apple-interchange-modifier-cbcc311c835d
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Oliver Bestmann <oliver.bestmann@googlemail.com>, 
 sofus <sofus.c@icloud.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Janne Grunau <j@jannau.net>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2440;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=nlCjiAzhkYiQ1nYPrjHibWe7jNID9lKUBjiluobqAug=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmHPE9PuJ/F/EJMgFuYfdPiDvPE3GuOx7PCrG+Yb+tW0
 uQrj9XtmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATLW/CCPD6Xkfzy/7amBv+qe3oO+KQs8S+13n5dJW155a96lHXkL1PSPDw1kc4Zz
 h942PObpoK8e+yIp62zmxYl1VO/+aFxMl7y3jAgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple Interchange is a tiled and compressed image layout used
for buffer exchange between Apple hardware blocks. It is
similar to the already-supported GPU_TILED_COMPRESSED layout.

Add a format modifier for Apple Interchange so that it can be
used for buffer exchange.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
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
 include/uapi/drm/drm_fourcc.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index a103fdc0b3a3..d304ee5c614c 100644
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
+ * Unlike the GPU layouts, tile size is not dependent on bit depth. RGB
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

