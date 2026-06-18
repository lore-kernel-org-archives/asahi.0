Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EF9211466
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 02:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781749010; cv=none; b=n6ptIKFkkBB3g55RuXJwYTpm9O/rAxpyotJzeALWi03/rnCc6qTSa4frsLz6lmvqim/lrnS6VGnTaOES5EHjSx+j+yr+qD2lizKabNVpth6I0wd0LU7I5k6rcyLdy5ZNzvALsx3hu2+eEQFKX1hElQ1O5ufQCU9KAVjGPFdG7iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781749010; c=relaxed/simple;
	bh=MsS0KDl7YWx1slEsJmktzRF9IWNN3CLmS1v1KYJV9MQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ty4pGoZeYy1LYWXl11VgP12FRymjNI4ABiCiq2f2zuZBN8HI5MzBfAidH+nLifD0oih2wjRcacAUoNvYLb7CNdccrg2DdVDHrq0hVh8poEgkU/Id9FfUwdKM5qBrTkWMKbimxQuH/1Or+3sjnfNks1cZPXm91sVtxKcvaxNhCRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kW7mUlwj; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kW7mUlwj"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf125989f2so2696475ad.3
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 19:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781749008; x=1782353808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G6bgdFP6eQHqUIHYA197THpQx8Z+j/fXy0gSUXkLpxo=;
        b=kW7mUlwji1uf26bg7yu8rzROS43b5WQ56sxFlOzGqFj4GzboeTt2IjwEiqa25j8xHN
         9CH0/cdCRYv8jYsly8YTXVcu5EIpYtaixK4VkbHsQXmcGglBKVS0nhsuKhFWbUASMJ8/
         7h/q+2OFbinyggNy93aS6MNM+Fsphtk8d+BfGzhJn6nm4s7dlRN3EmxHK4Z8ZbFKdTRv
         8JJPlJLos0f52c6ou8xUoPs0GAsKnBxPgjns+ZXOfkoFS1cFrTnd0yO9bZUa6OYTLrRC
         i8Ab2XdwU7RKgXIWb9hG/EOQ3u4pivQmkccQFNyXVNCg/6w/L6GtBZuiXRuyLLUWXwkn
         D9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781749008; x=1782353808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6bgdFP6eQHqUIHYA197THpQx8Z+j/fXy0gSUXkLpxo=;
        b=lNKTrLJ4hNhTOxmOLwKTTjsw4gnbCCwNyAdjoBonZmbGKnDdCLp1i1xrM3y4QHLG2e
         6cS+tpBTevJ5Q90TFXP1Kb3+ixGXHhpz6PiER9vWiSzGzdnKtiXHgPKGa+cRIwOejrxW
         hCvITfzzf+mEZ/4HCwfQK0d16fPv6+Gfec1L5MMH9ZaJCIzVKMNsgMNdXGvkWx5STpHc
         D0FTslepU8Rl3RxoGXC9FOzVI1zOgWZUCA6vNI9iUgV3T679E95kTiHJiGFZNwtdyS7y
         q+jmJkcZMY8wZswscVpxrOe5AkleqXIkiMo80fPgmHcd0VctlluWobl0TntUpA1IKgUd
         dz4A==
X-Forwarded-Encrypted: i=1; AFNElJ/3tWSKbu6P3Yc1JXiIS7wV/OoKH9G/5Os7oS5OuLS/8nForOa63yQaXcE17jORuIsuBiVYnA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEiVBuM1bri6iZsBh7nxM6pxA73zzU3GjVMIpx5XUupCwUCqeL
	oItGo3+j3rxIpEEgJOMJtuSt3BOh4f1Fd4pSo+PuJTNwg0IeeEsg06RX
X-Gm-Gg: AfdE7ckJHXKrlZWhry2FDyRIzHb3OVLcA6WU1lFIWH4XzLbrnImur4/d9lLgQaEdt5S
	GnEglmM9MHoTQfptd983Tj86ge7BGTnxMcfOxrLeZiazSNQLlp6ro9IpI9fpHScVa+GtuYXYySO
	/gKuIwMrjoPSbKeOm5lS6zTxflNinb60MGHCigpIZgIJegA0Mz4yxE5lOWoo2t/2TDHG40ieJyL
	838eazI8DwRshhYfhVRbkIo+SYA4BnPEJUYzuu1IfyFKK/883+gN7M5r9wcVVUKYcOiaiVfriRM
	mPVocYnAUQiubNrTBUYFbE0/LRQ16qF64fF+5aci8YLLbqL/PZvXRQtL/hVG4e97G+0GkydwtmN
	dvAlvcBxiLTSheOSdHnNDEx9CYalKmEThBd8ZRCPb7JQ7xhgRP5mwrTNNOIaC3GmPcxxFkZFFvX
	ipqiFk3TjrKXGMqQPHB4ChnvAXu0nsZWxzLD5INHR3rAIwtQp20uVPB8Rhizs3+HCtx5PvbSLUA
	gMWLzJQ1mpOW9VxVrtLfGieqS/3BLOvgBHEWTPRJxl1TNw=
X-Received: by 2002:a17:903:19ed:b0:2c2:50c7:58a4 with SMTP id d9443c01a7336-2c6bc223ee0mr64827035ad.22.1781749007689;
        Wed, 17 Jun 2026 19:16:47 -0700 (PDT)
Received: from bass-virtual-machine.. ([111.202.175.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a1878493sm61854705ad.81.2026.06.17.19.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 19:16:47 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: sven@kernel.org,
	kbusch@kernel.org,
	linux-nvme@lists.infradead.org
Cc: axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	j@jannau.net,
	neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH v2] nvme-apple: Use acquire/release for queue enabled state
Date: Thu, 18 Jun 2026 10:15:43 +0800
Message-Id: <20260618021543.3866850-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

apple_nvme_init_queue() initializes queue state and then marks the queue
enabled. The interrupt and request paths check enabled before using that
queue state.

The old wmb() after WRITE_ONCE(enabled, true) does not publish the
earlier initialization before enabled becomes visible. Use a release store
when enabling the queue and acquire loads when testing it.

Although the shutdown-side enabled accesses are not used for publishing
queue initialization, use helpers for them as well for consistency.

Fixes: 5bd2927aceba ("nvme-apple: Add initial Apple SoC NVMe driver")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
v2:
- Drop the old wmb(), as suggested by Keith Busch.
- Use the queue enabled helpers in apple_nvme_disable(), as suggested by
  Keith Busch.
v1:
- Found by auditing READ_ONCE() used for synchronization.
- A similar fix can be found in 8df672bfe3ec.
---
 drivers/nvme/host/apple.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index f9327feb87d0..291271c3954b 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -151,6 +151,23 @@ struct apple_nvme_queue {
 	bool enabled;
 };
 
+static inline bool apple_nvme_queue_enabled(struct apple_nvme_queue *q)
+{
+	/* Pair with apple_nvme_enable_queue(). */
+	return smp_load_acquire(&q->enabled);
+}
+
+static inline void apple_nvme_enable_queue(struct apple_nvme_queue *q)
+{
+	/* Publish queue initialization before setting q->enabled. */
+	smp_store_release(&q->enabled, true);
+}
+
+static inline void apple_nvme_disable_queue(struct apple_nvme_queue *q)
+{
+	WRITE_ONCE(q->enabled, false);
+}
+
 /*
  * The apple_nvme_iod describes the data in an I/O.
  *
@@ -677,7 +694,7 @@ static bool apple_nvme_handle_cq(struct apple_nvme_queue *q, bool force)
 	bool found;
 	DEFINE_IO_COMP_BATCH(iob);
 
-	if (!READ_ONCE(q->enabled) && !force)
+	if (!apple_nvme_queue_enabled(q) && !force)
 		return false;
 
 	found = apple_nvme_poll_cq(q, &iob);
@@ -780,7 +797,7 @@ static blk_status_t apple_nvme_queue_rq(struct blk_mq_hw_ctx *hctx,
 	 * We should not need to do this, but we're still using this to
 	 * ensure we can drain requests on a dying queue.
 	 */
-	if (unlikely(!READ_ONCE(q->enabled)))
+	if (unlikely(!apple_nvme_queue_enabled(q)))
 		return BLK_STS_IOERR;
 
 	if (!nvme_check_ready(&anv->ctrl, req, true))
@@ -863,7 +880,7 @@ static void apple_nvme_disable(struct apple_nvme *anv, bool shutdown)
 	nvme_quiesce_io_queues(&anv->ctrl);
 
 	if (!dead) {
-		if (READ_ONCE(anv->ioq.enabled)) {
+		if (apple_nvme_queue_enabled(&anv->ioq)) {
 			apple_nvme_remove_sq(anv);
 			apple_nvme_remove_cq(anv);
 		}
@@ -887,8 +904,8 @@ static void apple_nvme_disable(struct apple_nvme *anv, bool shutdown)
 		nvme_disable_ctrl(&anv->ctrl, false);
 	}
 
-	WRITE_ONCE(anv->ioq.enabled, false);
-	WRITE_ONCE(anv->adminq.enabled, false);
+	apple_nvme_disable_queue(&anv->ioq);
+	apple_nvme_disable_queue(&anv->adminq);
 	mb(); /* ensure that nvme_queue_rq() sees that enabled is cleared */
 	nvme_quiesce_admin_queue(&anv->ctrl);
 
@@ -1016,8 +1033,7 @@ static void apple_nvme_init_queue(struct apple_nvme_queue *q)
 		memset(q->tcbs, 0, anv->hw->max_queue_depth
 			* sizeof(struct apple_nvmmu_tcb));
 	memset(q->cqes, 0, depth * sizeof(struct nvme_completion));
-	WRITE_ONCE(q->enabled, true);
-	wmb(); /* ensure the first interrupt sees the initialization */
+	apple_nvme_enable_queue(q);
 }
 
 static void apple_nvme_reset_work(struct work_struct *work)
-- 
2.34.1
