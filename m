Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029A0393DF1
	for <asahi@lists.linux.dev>; Sat,  5 Sep 2026 08:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595473; cv=none; b=rUtfBbtpkZagafTND+I+0NR90cUexNvw3siJ5XoJA1VE6RkS72S++XKyrY6Ku38/KIyFn7uZHLXcgB7iozoS8NsA6px75S7deidHE5Bf7DsKWuVAEEBuQpD5UwEVoUxiX+moC7LhNdVRo3DYmdtExJeAY0mS7iVp4Is4qS6LOok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595473; c=relaxed/simple;
	bh=K4huxOZ9oO9kmk3tdxCPoKHD04VmjTzxbvqPSWtbDgM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XgRYZrGBl4aAzBUdytde98F9ixAuyJ1VnxZVdbq2YkgLG6ctbnB0qVzYOh+BeLegXPduILY2cbNE80iTOvwYtT63UFSBXKRM4WH95AuZ/Pm0pk+80FIh2TcbRYE+aZAEEEevWDGE1ViYpGxTYeLPvWlktnZUCeP+SI/MKlG3gHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCk1NwvL; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCk1NwvL"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48584dc164fso1733641f8f.0
        for <asahi@lists.linux.dev>; Sat, 05 Sep 2026 01:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788595470; x=1789200270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3aAKAsF8AwsDem/eK9L5mJ4rLY5jdRGrl/F/Zd/H9PA=;
        b=NCk1NwvLYujFp2DlWy0qkcWahRm0SePJgR6Efn7S1hKiEiTMi+fzhLQhGgs9Msekwp
         hBcXiWjB4dIahWy3+thMM28xv0WQwbUPVJsx1HWqrO+3TwS6ClBq6mKoNV11N59W3CXv
         nWmpYS4W0VI2fcHw4y7qadRNyjcAxz7i2mFQel1rSFpOYHCaxgKPzeU++juT3+KyMxTt
         i/bbsMoIjGx/lqj2kz9ZjomNLq32sKNarPdKhN3vWF4NPwvzCV1V4DKDGbPNxPwLLfE0
         /cWmSbFY5Vgi+24LzQFDm3yKRrWHqZUB6o0BUwWUNtB542cnnGdlhwcDK6hlYVq4PQyi
         jY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788595470; x=1789200270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3aAKAsF8AwsDem/eK9L5mJ4rLY5jdRGrl/F/Zd/H9PA=;
        b=lOtbo4pZ6fXPm/TV29rzaKyYhIktgB+EzKt39n2uRH0keadp8/v1cn7p4U9d2T8CeX
         WQsZzoaEQ8xzQygi/1vH+DzWUCFtLliOY3EE/LAPEO3tMWwEQ9hYDV7glkbz+keXXLfN
         2TJMGoY91qYExPQbpR3MRNhynNuuVsr68WgUFII3c4jb3QzmpC+P5w6pN/CZptQ/ZW1o
         OjdpeZGSifx5WLgNlmZjmzYII4ALpPJyoLRR2cCmhGZjcj7jvl/5P9QBJQoCV4Dw8P7K
         R6YdDvoJ3xOzS/PFdC15XNiuGNe3p1Pt9C+noz15Tl6yafhN9KXzjHkPXlPomCPvdKw+
         KEnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwIn8n5w5J6hchKvlkZkHSDcA5NGPo9JCKx3TpY1Y84xozYGy4j4Md2IBnRCK8PTxQWyOhpQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kjur8dqQQiuhJYdc//QR7P1RFu6F8JaO4ZBsPWl/2LwGiQxlyn
	f7aUX0HvN0884RGuYOh68HutYc2cywZd9KUSgqckz20E5PB26rLqulKU
X-Gm-Gg: AYBFou36HTINdnzSr2P43LNYgitUwyS6QYBDmPhAJ9bDWLTtQUrW51nSAFC7L0pLRUI
	HQiJlEJXwlqQU0pVcJAE0fTQ9bvOCt8GYqec2zxHwADdNC2qDjocH164bkR3dk8okBmQGArw8Mb
	543slywTQS4gZe5KWij0ZTX9gIQfmMi9LFxSFoqcQD4hZBUrb5SKgoLU5l8kloCrtOwM9kBTwcy
	Tc+cjhj3OnJxIevGWgHEr4Co5VhDW98vpX118owzUO4x5QZY5m6ToOFFR5Ldsw7+sp9I2iLXT3q
	2RyvJO+ixA2Gw3XGE6iz+Y0lD6W1IO1b6dYYSykylo0ThlrKcJD7eoanVnEXF7HvOJ7lKThsKeg
	Jox3DkvxX2h8RBzjh80K63goD5Koas+XwJZOyI/MnKwiMrtb5lPMSqyYTQZJLnOHN8UZx4FoGRE
	Kz2kWUPCQfqa9e/Blv868VUABYust4eqSi8pm1UjI+XMmRDitn5SiHjRzB9L9ykSniJ3ahxIfEO
	xSpabw42Iblptcf0zYn+uADBuc3B2mR22FL001tF44flJXgL2dKL8JMR8XhSFmg7kveK7uN0a1E
	mbYFsyTnzIAgOtqAmCAH8JiLrq4R5OoMBC732UhZqXKeHrjVyh/uYSgjhr4TMM5bCsY=
X-Received: by 2002:a05:600c:1551:b0:49c:fa21:1c89 with SMTP id 5b1f17b1804b1-49cfa211d5fmr91911335e9.30.1788595470025;
        Sat, 05 Sep 2026 01:04:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbe5b252sm96770125e9.3.2026.09.05.01.04.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 01:04:29 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Janne Grunau <j@jannau.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev
Subject: [PATCH] drm/adp: Drop the select of the nonexistent CONFIG_DRM_KMS_DMA_HELPER
Date: Sat,  5 Sep 2026 10:04:26 +0200
Message-Id: <20260905080426.34224-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no Kconfig symbol CONFIG_DRM_KMS_DMA_HELPER. The former
CONFIG_DRM_KMS_CMA_HELPER was removed by commit 09717af7d13d ("drm:
Remove CONFIG_DRM_KMS_CMA_HELPER option") before this driver was added,
so the select does nothing. The driver already selects
CONFIG_DRM_GEM_DMA_HELPER, which is what it needs.

Remove the dead line.

Fixes: 332122eba628 ("drm: adp: Add Apple Display Pipe driver")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/adp/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/adp/Kconfig b/drivers/gpu/drm/adp/Kconfig
index 9fcc27eb200d..acfa21ee06d2 100644
--- a/drivers/gpu/drm/adp/Kconfig
+++ b/drivers/gpu/drm/adp/Kconfig
@@ -6,7 +6,6 @@ config DRM_ADP
 	select DRM_KMS_HELPER
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_DISPLAY_HELPER
-	select DRM_KMS_DMA_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL_BRIDGE
 	select VIDEOMODE_HELPERS
-- 
2.53.0

