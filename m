Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4C3C8ED
	for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 08:21:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: linasend@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 9DFBF5BC3A;
	Fri, 14 Jul 2023 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1689322902;
	bh=2fvwzfS8YmheCobPc2+Jok2ymjxw2dE4WFuUm89CeSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ul6meaIpNeuWcJCwpAYhbbiGf+LI7dxOrwbWECurU79oGo8mKIXGq/PpwntwxYhL6
	 3jZjBXVRBxLBudEsjD01rpTbvNsZQqsHexszbM+UPx65RHtHxKoWh3iGQDbZhqac0c
	 THw+fGYmeqS407Le8VwRRLJzQcnsrUsKmVYXvE4n13iIuHOL9OUMhyaPV+s7f27n66
	 xcSXZrePdpYH2rzOqGGsDd6GDt1kdlSQxj5s+Ptu9W6UFTqHEg7NdBIB3mTJhyIwCP
	 mSI2w2bgT6Q3HAovBrdpzKF/wQmls6tyfDsWUyEiInhAtHI5ue5ZUTnuLnKUKSOKyZ
	 KvwjJ2D3DjJ1A==
From: Asahi Lina <lina@asahilina.net>
Date: Fri, 14 Jul 2023 17:21:30 +0900
Subject: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
In-Reply-To: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
To: Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689322891; l=3041;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=2fvwzfS8YmheCobPc2+Jok2ymjxw2dE4WFuUm89CeSo=;
 b=cGIqcU2xLXIEnYceEA1R5m+dM1c4K6uQypwIVQQxiA9kE8cWOkpsy03Lc3UmPGdJzzI4sez2N
 D0FF7Vk7S0VDhI+z11BCCD/UVgnFr42ZSzTeAuiFCbjqPftu2mpb7Vf
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=

A signaled scheduler fence can outlive its scheduler, since fences are
independencly reference counted. Therefore, we can't reference the
scheduler in the get_timeline_name() implementation.

Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
dma-bufs reference fences from GPU schedulers that no longer exist.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
 drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
 include/drm/gpu_scheduler.h              | 5 +++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index b2bbc8a68b30..17f35b0b005a 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -389,7 +389,12 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 
 		/*
 		 * Fence is from the same scheduler, only need to wait for
-		 * it to be scheduled
+		 * it to be scheduled.
+		 *
+		 * Note: s_fence->sched could have been freed and reallocated
+		 * as another scheduler. This false positive case is okay, as if
+		 * the old scheduler was freed all of its jobs must have
+		 * signaled their completion fences.
 		 */
 		fence = dma_fence_get(&s_fence->scheduled);
 		dma_fence_put(entity->dependency);
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index ef120475e7c6..06a0eebcca10 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -68,7 +68,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
 static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
 {
 	struct drm_sched_fence *fence = to_drm_sched_fence(f);
-	return (const char *)fence->sched->name;
+	return (const char *)fence->sched_name;
 }
 
 static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
@@ -216,6 +216,8 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 	unsigned seq;
 
 	fence->sched = entity->rq->sched;
+	strlcpy(fence->sched_name, entity->rq->sched->name,
+		sizeof(fence->sched_name));
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
 		       &fence->lock, entity->fence_context, seq);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e95b4837e5a3..4fa9523bd47d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -305,6 +305,11 @@ struct drm_sched_fence {
          * @lock: the lock used by the scheduled and the finished fences.
          */
 	spinlock_t			lock;
+        /**
+         * @sched_name: the name of the scheduler that owns this fence. We
+	 * keep a copy here since fences can outlive their scheduler.
+         */
+	char sched_name[16];
         /**
          * @owner: job owner for debugging
          */

-- 
2.40.1

