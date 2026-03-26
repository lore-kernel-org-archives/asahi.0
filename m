Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784882580F3
	for <asahi@lists.linux.dev>; Thu, 26 Mar 2026 01:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489477; cv=none; b=nEsYGe5tEvBnzxLjzc4ubli6NrUuuQPFiQRXTx3hmKFL4LNpBQd/VwdAl/mHN3bzYzKvqtO8TOez3GIxCunR4+j1/KnNdU+lMucT2fJPk86fQ2LXDf2eZbf4G4jv+3McfK1z2KeI/rmwaalnBu+RloTD3fjWKgdEgt4tKvpCT3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489477; c=relaxed/simple;
	bh=ZMCcAXpKFqDBsR914nXtymQFqLT+yTZjxAhGKmPLLUw=;
	h=Mime-Version:Subject:From:To:CC:In-Reply-To:Message-ID:Date:
	 Content-Type:References; b=IVWPkiQk0+ytO3WjdQ8rSpPoBCHS5Y3TDyBC8wJC2zLK1R88Xq9Kzkd/roBMZOu46G5qAhCG+7TZufpd5WtwcN0fHLhyRIxIpQuOSZyzFctBiAhi5BaUhLYuguehK9Ys5SJkq3vcmS7Ck6C5Y0AIgg0+9jrOr+Chxw48qmU0Kjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=JMZIznl1; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JMZIznl1"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260326014431epoutp025f4fa31e9ea40a86226d7d150495cf27~gQMW1qBRW1939219392epoutp02p
	for <asahi@lists.linux.dev>; Thu, 26 Mar 2026 01:44:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260326014431epoutp025f4fa31e9ea40a86226d7d150495cf27~gQMW1qBRW1939219392epoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774489471;
	bh=5IYFGg1UCPmPFLY2KOd+jdUPq6T6ca4Lx2iykpqmAr8=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=JMZIznl1aO7O7Xv5twWyBhBf1b0RQEUjKtnKv52cPgPKcGH+RIijvCxIjEKOCyRgD
	 t+in4gRB0Lhpe2okGzHFc66PECYkzsIdHjC5GhZ5mlUNdI+6RJmCqIH1mVbtMF1V58
	 e89LErauOU06FlJJ8gF2ai7ex0w89D1Zq7YKwLJA=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20260326014430epcas2p2421661bf9a868d815c1784a27dd8aae6~gQMWOwq2y3270532705epcas2p2S;
	Thu, 26 Mar 2026 01:44:30 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.211]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4fh65V0K4rz6B9mB; Thu, 26 Mar
	2026 01:44:30 +0000 (GMT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: [PATCH v4] nvme: Skip trace complete_rq on host path error
Reply-To: hmi.jeon@samsung.com
Sender: =?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
From: =?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
To: Keith Busch <kbusch@kernel.org>, Justin Tee <justintee8345@gmail.com>
CC: "axboe@kernel.dk" <axboe@kernel.dk>, "sven@kernel.org"
	<sven@kernel.org>, "j@jannau.net" <j@jannau.net>, "neal@gompa.dev"
	<neal@gompa.dev>, "hch@lst.de" <hch@lst.de>, "sagi@grimberg.me"
	<sagi@grimberg.me>, "justin.tee@broadcom.com" <justin.tee@broadcom.com>,
	"nareshgottumukkala83@gmail.com" <nareshgottumukkala83@gmail.com>,
	"paul.ely@broadcom.com" <paul.ely@broadcom.com>, James Smart
	<james.smart@broadcom.com>, "kch@nvidia.com" <kch@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?UTF-8?B?7J207J2A7IiY?=
	<euns212.lee@samsung.com>, =?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>,
	=?UTF-8?B?7Lm47LCs?= <joshi.k@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <acQxjZMOqj74yIJf@kbusch-mbp>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260326014429epcms2p135ffd3c2b2fface6423d045e9614c262@epcms2p1>
Date: Thu, 26 Mar 2026 10:44:29 +0900
X-CMS-MailID: 20260326014429epcms2p135ffd3c2b2fface6423d045e9614c262
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6
References: <acQxjZMOqj74yIJf@kbusch-mbp>
	<20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
	<945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com>
	<20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c@epcms2p6>
	<CABPRKS8-x6Tfr90inpz1fR0=8a5HD=mkujtfLJ1h9ikEUjTvxg@mail.gmail.com>
	<CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p1>

Hi Keith Busch,

If it's host pathing error, Do you mean to skip `trace_nvme_complete_rq()`?
If so, I agree with this approach.

Thank you

Regards,
Minsik Jeon


From c1f3c209c35233154bf5918092bdbb085828db23 Mon Sep 17 00:00:00 2001
From: Minsik Jeon <hmi.jeon@samsung.com>
Date: Thu, 26 Mar 2026 11:09:57 +0900
Subject: [PATCH v4] nvme: Skip trace complete_rq on host path error

we were checking host_pathing_error before calling nvme_setup_cmd().
This is caused the command setup to be skipped entirely when a pathing
error occurred, making it impossible to trace the nvme command via
trace_cmd nvme_complete_rq().

As a result, when nvme_complete_rq() logged a completion with cmdid=0,
it was impossible to correlate the completion with the nvme command
request.

This patch Skip trace_nvme_complete_rq() on NVMe host path error.

Co-authored-by: Beomsoo Kim <beomsooo.kim@samsung.com>
Co-authored-by: Eunsoo Lee <euns212.lee@samsung.com>
Co-authored-by: Steven Seungcheol Lee <sc108.lee@samsung.com>
Signed-off-by: Minsik Jeon <hmi.jeon@samsung.com>
---
 drivers/nvme/host/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 766e9cc4ffca..8f98d5220206 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -458,7 +458,9 @@ void nvme_complete_rq(struct request *req)
 {
 	struct nvme_ctrl *ctrl = nvme_req(req)->ctrl;
 
-	trace_nvme_complete_rq(req);
+	if (nvme_req(req)->status != NVME_SC_HOST_PATH_ERROR)
+		trace_nvme_complete_rq(req);
+
 	nvme_cleanup_cmd(req);
 
 	/*
-- 
2.52.0

