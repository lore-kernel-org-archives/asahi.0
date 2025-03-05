Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D61F155342
	for <asahi@lists.linux.dev>; Wed,  5 Mar 2025 02:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741140372; cv=none; b=f2mKcQOXuBqbQXUrk7WGFH24phWy9/0C781/axgJEsQBWLo3vKruxG0QrQwux3Oz+0iaDhUMLFtp+bDvxeSgSekbt1pbzjBCPt41+lC11U/nUnM9Ln12qeJurFLvOAK6H9gxO4Ljo1gJBRjWfOxGVDQ1vK0PjTgHHIahQIUA9Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741140372; c=relaxed/simple;
	bh=t8x48EmF0+TpzK71MnOEzqfXvvnmv1F8xzBHAsJqg5A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R26K+cnI1Awa95LINulJpM1+YZy7ryNokMuMrVhVeUjYWlbIxTknhcfTPEqr210e9cNRNjXQPOtCyRRvmTXW/8J3jYGF9O9P92UPnGxuRq7CigR//6WPKWzYfktulY4jQ+O9pPD0bT4+5sFIjtNeXOZAZKPHyeFzgnNyBtGN4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=K0AfcpHV; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="K0AfcpHV"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1741140361; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=pRK4bd+Uu1FKHV8nOIix+G9vPECpr4JTmDRvSH2QUF0=;
	b=K0AfcpHVBqYsZz3/uN0ReeLP0beXJkDj96laBYbQkRlMqh6+g8/qh+YlmGRaeth7BQtrZIxRwM38WyixmkGNKhNSkN+dmOUWcpFNC3olZSctmZ+nzXlIKYs3MDa0sDCBBae18EMwmJ/4UH6oFNmbF62Na2JU7xVZLMgxUGxiAt4=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0WQjmW2l_1741140347 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 05 Mar 2025 10:05:58 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: fnkl.kernel@gmail.com
Cc: j@jannau.net,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm: adp: Remove unnecessary print function dev_err()
Date: Wed,  5 Mar 2025 10:05:46 +0800
Message-Id: <20250305020546.96564-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The print function dev_err() is redundant because platform_get_irq_byname()
already prints an error.

./drivers/gpu/drm/adp/adp_drv.c:470:2-9: line 470 is redundant because platform_get_irq() already prints an error.
./drivers/gpu/drm/adp/adp_drv.c:476:2-9: line 476 is redundant because platform_get_irq() already prints an error.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=19211
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/adp/adp_drv.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index 0a39abdc9238..0eeb9e5fab26 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -466,16 +466,12 @@ static int adp_parse_of(struct platform_device *pdev, struct adp_drv_private *ad
 	}
 
 	adp->be_irq = platform_get_irq_byname(pdev, "be");
-	if (adp->be_irq < 0) {
-		dev_err(dev, "failed to find be irq");
+	if (adp->be_irq < 0)
 		return adp->be_irq;
-	}
 
 	adp->fe_irq = platform_get_irq_byname(pdev, "fe");
-	if (adp->fe_irq < 0) {
-		dev_err(dev, "failed to find fe irq");
+	if (adp->fe_irq < 0)
 		return adp->fe_irq;
-	}
 
 	return 0;
 }
-- 
2.32.0.3.g01195cf9f

