Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5E5227EA8
	for <asahi@lists.linux.dev>; Wed, 10 Dec 2025 22:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765405464; cv=none; b=VOIfq0vHrZSOiq/F0oLAvNvZpBi6PFbc5TOpMcW7mU2DINU32qRBCvIabTsjDJvVSx9Nr5DeqDxZW9/vCl7M1zYClrlMKVJkMdz7sIR0S36/4W5/1jdtDkp240doT7L/ch4qAfM0vLSJ3TsyruoPqNp4v/qdvy17PVTGbK7c2TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765405464; c=relaxed/simple;
	bh=Bq/wfj5VDw/HpYLrn1U6wpTKsioGcrmuR+7RfrskKEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ot79kyHgJhPYGERNWuXwbw9Eu3to0zSkMD3TaZlXf56wr3J+WT3JbGlLqWFzUCKJiql9OUVCG5Jv/C/RZzUG9od8VZWGmKVb6VwqAMz+pGC3561L6eHDXEIY7kXWIndJLYAGHiGbnK9uJvKPyv8ZImc5+2MVp5zEwkI5dd9BKOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 000E71F80041
	for <asahi@lists.linux.dev>; Wed, 10 Dec 2025 22:24:15 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id AAF59B12739; Wed, 10 Dec 2025 22:24:10 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 5A35BB12723;
	Wed, 10 Dec 2025 22:23:44 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Janne Grunau <j@jannau.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Randy Dunlap <rdunlap@infradead.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH] drm: Remove remaining DRM_KMS_DMA_HELPER users
Date: Wed, 10 Dec 2025 23:23:37 +0100
Message-ID: <20251210222337.3751485-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DRM_KMS_CMA_HELPER config option was removed in commit 09717af7d13d
("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option") but two drivers were
later merged with the option still selected.

The dangling option was later renamed to DRM_KMS_DMA_HELPER with commit
6bcfe8eaeef0 ("drm/fb: rename FB CMA helpers to FB DMA helpers").

Remove the entries in the two drivers, which already select
DRM_GEM_DMA_HELPER (that was previously selected via DRM_KMS_CMA_HELPER).

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/gpu/drm/adp/Kconfig     | 1 -
 drivers/gpu/drm/logicvc/Kconfig | 1 -
 2 files changed, 2 deletions(-)

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
diff --git a/drivers/gpu/drm/logicvc/Kconfig b/drivers/gpu/drm/logicvc/Kconfig
index 579a358ed5cf..11aae1626199 100644
--- a/drivers/gpu/drm/logicvc/Kconfig
+++ b/drivers/gpu/drm/logicvc/Kconfig
@@ -4,7 +4,6 @@ config DRM_LOGICVC
 	depends on OF || COMPILE_TEST
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
-	select DRM_KMS_DMA_HELPER
 	select DRM_GEM_DMA_HELPER
 	select REGMAP
 	select REGMAP_MMIO
-- 
2.52.0

