Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577103A3830
	for <asahi@lists.linux.dev>; Wed,  3 Jun 2026 07:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471414; cv=none; b=M1/ctK1PPPA1ksAxfa+h8oU07lNqHw/k3D8kOyImu1OtbWXqqNeRZWTQ4kuCY44kDiFazThJ7PA5hPulPtFmDqPjLG7wEzvVdVlV7oQNYo3M+9hebUQOvryBBcI6dXOT49je1H5LNj3HeGALapOdI4oMnXm/YZlHBMjo7kiecYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471414; c=relaxed/simple;
	bh=eNUZGu4Ul5z/qEG7X8KpOIA6vn2VIxBs/pdo4daS/CM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KmSETS8+kp7TKVIxGtPEbA+AIt7v8qLvCtukjPHjxtEauGygoQILMUwsRApbWpXPSpRPe9JkglnUCPtSV9sEil/wuU7BAnoPcKehNtJzz3sEFZHH7i0CzzIW5ksWhYXGfMK5kNqH9jdc24ZjeSH7pAI+ZwyFvHDcm7LKJvNLCks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwnTlWUr; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwnTlWUr"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso33242225ad.0
        for <asahi@lists.linux.dev>; Wed, 03 Jun 2026 00:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780471412; x=1781076212; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3LmA3WaTMG7OAWRgeiXus9O8phC2OkjC2j8xyhgOD/Y=;
        b=EwnTlWUrvG1FQuTP7QRkoniKNNn1oyLZF1K6lLlSH0DPtjQcmS7SAZqlxCHVYs+7Tp
         LZj+BT6plF9vVYFq+cpeZ/hQGWkDluyyyEulaUlfboY32m3c3qbXmhKJnrZ3hH0R7qUB
         Zgv+jkiu2veILKy3ORovHbmj4fW9c+x0kbCmvF5PIY3UE4Qk/xQDJgayLAPp6RKgNrMr
         OwqLVhPgNYyKzoSuan8f6HKxHgzgv/YoABYGvfcTZqFRQcCvLN6wwPr7UxWbVRgqihsW
         zdOvRg9V+wdvPj0UPgwG89rwX/z53o3RWY1wRK4i1uUMgvtPEceQVJsv+zi2ArhgbEIO
         +efQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780471412; x=1781076212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LmA3WaTMG7OAWRgeiXus9O8phC2OkjC2j8xyhgOD/Y=;
        b=PSiJb1TPu14vE4A7yVlugEnTeVMAy+U+L5WWwXyY04EsYjVvltthJNyWLQV46CeIy8
         b1pJuE6J3XjATdrL8PSwitd51k3RcE20ORuXPiA9sWeaij0qbvHUcixi4OoUz96UlRUE
         e8dKtdNtC3BQVi89UrZYxq1rX1cyxZ5Dw+T559ttZXqiq54uySmsyAUsLULvr9msJxqF
         A42XBoDk63oGOmHpPjNaK+YRj1kMpTBimiWdWVSgXX/DIA4J74jAuPNHwkFyTyHQuwUX
         zNcqLXNYMc+MOEx3FudhW79nql7lb6Q0Ji2QsFB9NJuSkJ7aVZLecDnaBocP3Ry83LmB
         BqGw==
X-Forwarded-Encrypted: i=1; AFNElJ/nKbjQl7HaCghOcphvNrlj+nEsavZs9GYSdazxepRhNWqRjnfIZQJh2luKXFZmwSzghgxrFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyX6+rA6gNTO8dyGxPVJZ7nZl0pyhBptjS9JOKkvdmkySczDMSF
	kM6cdJyeh0b6LsMACQtIX+LHLPO+ShRTOWV9NGqU09VB3TMXmC/KQPkZ
X-Gm-Gg: Acq92OF5yeITmcVhkZaBlHFA2WvUrgUviBA2UoZW0aPdMdkhF8WpS4oxVhTim8l9lD6
	dM8Igyl7sAQqzo2SWZL4gUbnpI21pu0/QeMP021xnFl385ikO1XOHhVMFpdB5PIdCHXm4sm+YfB
	wGEx/KOTf/yhRFKdcWJpuWt4jhdYhtaPRk88yjFHrCKjZJmLMEYPcjGVZ8plw+FFek6pSIeOIuk
	S3VGaVWCrAEcv+Hj+E5n3do+MZBMrAqeAjBRmSMBMft6cwnx8rLFImdaILu+0i4kg18qcZdgzBZ
	LnVqgTeYwL386B/7hcsyV1o3sduvP15ebEgvsRpZBOhq0YTwrj6ItGpthvXVpHcf9q/fadAeKuW
	+2op82qnREUQn6osiT25MIIbr262Z6tJ7UTZh5elOD6ghDjUUsIykX6vB3hzYWUPoY4S0LhuFo/
	e53e3EjP1+iRux6ilBmh4HufcPzXg1TZpFW6qkkFNfDoAXvHgCFbVVmUGz7wJ5p71jW6oyxDPFT
	uZIRjyHQ06/5XAIMvPsUy47+u6wXzhBGUG3xu4hncHyLPmr4gTu9lPMqovN/pLHi6bn7ECyJSr4
	qk0=
X-Received: by 2002:a17:902:7b85:b0:2bd:8395:fed8 with SMTP id d9443c01a7336-2c1641b148dmr13579975ad.27.1780471412125;
        Wed, 03 Jun 2026 00:23:32 -0700 (PDT)
Received: from bass-virtual-machine.. ([111.202.175.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa072asm14750055ad.34.2026.06.03.00.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:23:31 -0700 (PDT)
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
Subject: [PATCH] nvme-apple: Use acquire/release for queue enabled state
Date: Wed,  3 Jun 2026 15:22:05 +0800
Message-Id: <20260603072205.3291888-1-hanguidong02@gmail.com>
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

The existing wmb() after WRITE_ONCE(enabled, true) orders the enabled
store before later queue use, but it does not publish the earlier
initialization before enabled becomes visible.

Use a release store when enabling the queue and acquire loads when
testing it. Keep the existing wmb() in place for the
store-before-later-use ordering.

Fixes: 5bd2927aceba ("nvme-apple: Add initial Apple SoC NVMe driver")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
Found by auditing READ_ONCE() used for synchronization.
A similar fix can be found in 8df672bfe3ec.
---
 drivers/nvme/host/apple.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index c692fc73babf..fcaf8f230b19 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -151,6 +151,18 @@ struct apple_nvme_queue {
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
 /*
  * The apple_nvme_iod describes the data in an I/O.
  *
@@ -677,7 +689,7 @@ static bool apple_nvme_handle_cq(struct apple_nvme_queue *q, bool force)
 	bool found;
 	DEFINE_IO_COMP_BATCH(iob);
 
-	if (!READ_ONCE(q->enabled) && !force)
+	if (!apple_nvme_queue_enabled(q) && !force)
 		return false;
 
 	found = apple_nvme_poll_cq(q, &iob);
@@ -780,7 +792,7 @@ static blk_status_t apple_nvme_queue_rq(struct blk_mq_hw_ctx *hctx,
 	 * We should not need to do this, but we're still using this to
 	 * ensure we can drain requests on a dying queue.
 	 */
-	if (unlikely(!READ_ONCE(q->enabled)))
+	if (unlikely(!apple_nvme_queue_enabled(q)))
 		return BLK_STS_IOERR;
 
 	if (!nvme_check_ready(&anv->ctrl, req, true))
@@ -1016,7 +1028,7 @@ static void apple_nvme_init_queue(struct apple_nvme_queue *q)
 		memset(q->tcbs, 0, anv->hw->max_queue_depth
 			* sizeof(struct apple_nvmmu_tcb));
 	memset(q->cqes, 0, depth * sizeof(struct nvme_completion));
-	WRITE_ONCE(q->enabled, true);
+	apple_nvme_enable_queue(q);
 	wmb(); /* ensure the first interrupt sees the initialization */
 }
 
-- 
2.34.1

