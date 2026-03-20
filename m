Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663C42C029C
	for <asahi@lists.linux.dev>; Fri, 20 Mar 2026 05:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773984069; cv=none; b=EhtiPcqMez2HA42euIdLsGIsXrhuQ7raYsJBEsX87RUPg2E2bWM+pZP3NYrxVs5SZ2IbNa/+j9UMwOptbBHMkZwJPGEs2sDjIq5mphrZEMRaIWFaW0fDLPrStpKj9HZcy7Yjl+sWTjw5Ya12y7codyyC0JeBJrSVBQfTBAUknbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773984069; c=relaxed/simple;
	bh=1NHrQbpdqJFs296KNhIy6RkV8pX9yw66Hdx6Buho7uE=;
	h=Mime-Version:Subject:From:To:CC:Message-ID:Date:Content-Type:
	 References; b=hvgbiBfkv/25iKDcVtWPG2rrHXrYWSA5BiDVUGGdJIWhhZ30k4/G6UIQ0QZ3oEpU+M82tvVHBai0zKbDeaNb+8yA88uS2sQO3G2OboDno8G+0Tbl5TDd/NZlG9D/bWr9zonBin1qHpPbG2jFY/SXgWjtc3zSjMmABevbo7PxF94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=FRp/O6Bw; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FRp/O6Bw"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260320052102epoutp0345a92a5d2b2b0263c0a37b1c69dd00f3~edRsjDAdl1131911319epoutp03x
	for <asahi@lists.linux.dev>; Fri, 20 Mar 2026 05:21:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260320052102epoutp0345a92a5d2b2b0263c0a37b1c69dd00f3~edRsjDAdl1131911319epoutp03x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1773984062;
	bh=JxQ7E6F74uxBXrdFidaGlt2hT0tYDUqE1zgU7CkwdSI=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=FRp/O6Bw4gYbxIYxd1SvWpFdWWLjFsz1bE2c5E1obVaxhf3HwUBwa1x+O4clUgDKy
	 o609i5mJPIEFuPXEi3fviJcz039fgMfxWEYrgLKsB1f2SdzktUtbrVdd7/xmSsmZrv
	 3VhpyAoQ1bqUD0vKaD9i/B9QCkJUP4iVFNkA4ZYc=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20260320052102epcas2p1bad6bc6c6805325c5d09c69067ba6274~edRsHPBob1038710387epcas2p1E;
	Fri, 20 Mar 2026 05:21:02 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.210]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4fcWB54z77z3hhTB; Fri, 20 Mar
	2026 05:21:01 +0000 (GMT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: [PATCH] nvme: Move nvme_setup_cmd before hot_pathing
Reply-To: hmi.jeon@samsung.com
Sender: =?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
From: =?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
To: "kbusch@kernel.org" <kbusch@kernel.org>, "axboe@kernel.dk"
	<axboe@kernel.dk>
CC: "sven@kernel.org" <sven@kernel.org>, "j@jannau.net" <j@jannau.net>,
	"neal@gompa.dev" <neal@gompa.dev>, "hch@lst.de" <hch@lst.de>,
	"sagi@grimberg.me" <sagi@grimberg.me>, "justin.tee@broadcom.com"
	<justin.tee@broadcom.com>, "nareshgottumukkala83@gmail.com"
	<nareshgottumukkala83@gmail.com>, "paul.ely@broadcom.com"
	<paul.ely@broadcom.com>, "kch@nvidia.com" <kch@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?UTF-8?B?7KCE66+87Iud?=
	<hmi.jeon@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
Date: Fri, 20 Mar 2026 14:21:01 +0900
X-CMS-MailID: 20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6
References: <CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>

From e54937be5ca0a2b38fffe6611c360625dc0a8903 Mon Sep 17 00:00:00 2001
From: Minsik Jeon <hmi.jeon@samsung.com>
Date: Fri, 20 Mar 2026 14:48:07 +0900
Subject: [PATCH] nvme: Move nvme_setup_cmd before hot_pathing

we were checking host_pathing_error before calling nvme_setup_cmd().
This is caused the command setup to be skipped entirely when a pathing
error occurred, making it impossible to trace the nvme command via
trace_cmd nvme_complete_rq().

As a result, when nvme_complete_rq() logged a completion with cmdid=0,
it was impossible to correlate the completion with the nvme command
request.

This patch reorders the logic to first call nvme_setup_cmd(), then
perform the host_pathing_error check.

Co-authored-by: Beomsoo Kim <beomsooo.kim@samsung.com>
Co-authored-by: Eunsoo Lee <euns212.lee@samsung.com>
Co-authored-by: Steven Seungcheol Lee <sc108.lee@samsung.com>
Signed-off-by: Minsik Jeon <hmi.jeon@samsung.com>
---
 drivers/nvme/host/apple.c  | 6 +++---
 drivers/nvme/host/fc.c     | 8 ++++----
 drivers/nvme/host/pci.c    | 8 ++++----
 drivers/nvme/host/rdma.c   | 8 ++++----
 drivers/nvme/host/tcp.c    | 8 ++++----
 drivers/nvme/target/loop.c | 6 +++---
 6 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index ed61b97fde59..2a28c992d024 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -783,13 +783,13 @@ static blk_status_t apple_nvme_queue_rq(struct blk_mq_hw_ctx *hctx,
 	if (unlikely(!READ_ONCE(q->enabled)))
 		return BLK_STS_IOERR;
 
-	if (!nvme_check_ready(&anv->ctrl, req, true))
-		return nvme_fail_nonready_command(&anv->ctrl, req);
-
 	ret = nvme_setup_cmd(ns, req);
 	if (ret)
 		return ret;
 
+	if (!nvme_check_ready(&anv->ctrl, req, true))
+		return nvme_fail_nonready_command(&anv->ctrl, req);
+
 	if (blk_rq_nr_phys_segments(req)) {
 		ret = apple_nvme_map_data(anv, req, cmnd);
 		if (ret)
diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index e1bb4707183c..8ea37102a836 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -2762,14 +2762,14 @@ nvme_fc_queue_rq(struct blk_mq_hw_ctx *hctx,
 	u32 data_len;
 	blk_status_t ret;
 
-	if (ctrl->rport->remoteport.port_state != FC_OBJSTATE_ONLINE ||
-	    !nvme_check_ready(&queue->ctrl->ctrl, rq, queue_ready))
-		return nvme_fail_nonready_command(&queue->ctrl->ctrl, rq);
-
 	ret = nvme_setup_cmd(ns, rq);
 	if (ret)
 		return ret;
 
+	if (ctrl->rport->remoteport.port_state != FC_OBJSTATE_ONLINE ||
+	    !nvme_check_ready(&queue->ctrl->ctrl, rq, queue_ready))
+		return nvme_fail_nonready_command(&queue->ctrl->ctrl, rq);
+
 	/*
 	 * nvme core doesn't quite treat the rq opaquely. Commands such
 	 * as WRITE ZEROES will return a non-zero rq payload_bytes yet
diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index b78ba239c8ea..ad0363f7e681 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1376,10 +1376,6 @@ static blk_status_t nvme_prep_rq(struct request *req)
 	iod->meta_total_len = 0;
 	iod->nr_dma_vecs = 0;
 
-	ret = nvme_setup_cmd(req->q->queuedata, req);
-	if (ret)
-		return ret;
-
 	if (blk_rq_nr_phys_segments(req)) {
 		ret = nvme_map_data(req);
 		if (ret)
@@ -1418,6 +1414,10 @@ static blk_status_t nvme_queue_rq(struct blk_mq_hw_ctx *hctx,
 	if (unlikely(!test_bit(NVMEQ_ENABLED, &nvmeq->flags)))
 		return BLK_STS_IOERR;
 
+	ret = nvme_setup_cmd(req->q->queuedata, req);
+	if (ret)
+		return ret;
+
 	if (unlikely(!nvme_check_ready(&dev->ctrl, req, true)))
 		return nvme_fail_nonready_command(&dev->ctrl, req);
 
diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index 57111139e84f..96248d81237e 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -2005,6 +2005,10 @@ static blk_status_t nvme_rdma_queue_rq(struct blk_mq_hw_ctx *hctx,
 
 	WARN_ON_ONCE(rq->tag < 0);
 
+	ret = nvme_setup_cmd(ns, rq);
+	if (ret)
+		return ret;
+
 	if (!nvme_check_ready(&queue->ctrl->ctrl, rq, queue_ready))
 		return nvme_fail_nonready_command(&queue->ctrl->ctrl, rq);
 
@@ -2020,10 +2024,6 @@ static blk_status_t nvme_rdma_queue_rq(struct blk_mq_hw_ctx *hctx,
 	ib_dma_sync_single_for_cpu(dev, sqe->dma,
 			sizeof(struct nvme_command), DMA_TO_DEVICE);
 
-	ret = nvme_setup_cmd(ns, rq);
-	if (ret)
-		goto unmap_qe;
-
 	nvme_start_request(rq);
 
 	if (IS_ENABLED(CONFIG_BLK_DEV_INTEGRITY) &&
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 243dab830dc8..1a3640e81b8f 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -2705,10 +2705,6 @@ static blk_status_t nvme_tcp_setup_cmd_pdu(struct nvme_ns *ns,
 	u8 hdgst = nvme_tcp_hdgst_len(queue), ddgst = 0;
 	blk_status_t ret;
 
-	ret = nvme_setup_cmd(ns, rq);
-	if (ret)
-		return ret;
-
 	req->state = NVME_TCP_SEND_CMD_PDU;
 	req->status = cpu_to_le16(NVME_SC_SUCCESS);
 	req->offset = 0;
@@ -2768,6 +2764,10 @@ static blk_status_t nvme_tcp_queue_rq(struct blk_mq_hw_ctx *hctx,
 	bool queue_ready = test_bit(NVME_TCP_Q_LIVE, &queue->flags);
 	blk_status_t ret;
 
+	ret = nvme_setup_cmd(ns, rq);
+	if (ret)
+		return ret;
+
 	if (!nvme_check_ready(&queue->ctrl->ctrl, rq, queue_ready))
 		return nvme_fail_nonready_command(&queue->ctrl->ctrl, rq);
 
diff --git a/drivers/nvme/target/loop.c b/drivers/nvme/target/loop.c
index 4b3f4f11928d..475b532d08e8 100644
--- a/drivers/nvme/target/loop.c
+++ b/drivers/nvme/target/loop.c
@@ -140,13 +140,13 @@ static blk_status_t nvme_loop_queue_rq(struct blk_mq_hw_ctx *hctx,
 	bool queue_ready = test_bit(NVME_LOOP_Q_LIVE, &queue->flags);
 	blk_status_t ret;
 
-	if (!nvme_check_ready(&queue->ctrl->ctrl, req, queue_ready))
-		return nvme_fail_nonready_command(&queue->ctrl->ctrl, req);
-
 	ret = nvme_setup_cmd(ns, req);
 	if (ret)
 		return ret;
 
+	if (!nvme_check_ready(&queue->ctrl->ctrl, req, queue_ready))
+		return nvme_fail_nonready_command(&queue->ctrl->ctrl, req);
+
 	nvme_start_request(req);
 	iod->cmd.common.flags |= NVME_CMD_SGL_METABUF;
 	iod->req.port = queue->ctrl->port;
-- 
2.52.0

