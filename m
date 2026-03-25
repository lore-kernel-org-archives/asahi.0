Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8731313A86C
	for <asahi@lists.linux.dev>; Wed, 25 Mar 2026 06:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774420422; cv=none; b=padSY/22S1gIILT19107+mQdinwYf2Z9x8COscrBKuaaNnMTBfDiJfQKklrWNbeRgyYintWr93Bnlfhg1anvobV8MOhdvtBEijM7T1Y3jLGDOWEWihsMRXXlxQJEhZU51IBv9FD//K0p5j7oNfamzXB84VOkf7xzPx6geH/7MZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774420422; c=relaxed/simple;
	bh=uOWGOsEyZTqTyeLci5k9U+135PM3Si30Ap/GUpfb4JU=;
	h=Mime-Version:Subject:From:To:CC:In-Reply-To:Message-ID:Date:
	 Content-Type:References; b=SVUVXgO6eqyMbZ5L1SnS/U0U4nlD/DeRLfFk6Mq8wIz0ecg3Ipien5qelA5EQaJVO6YzKsdYn8WkQhNPnQ4W+0Qu7IaSNZLXF/hfx0H9LyDrYdE17yAjt7CVbjSp18O/DWl8sz/nlPmM2dERdjdmRwYuUnWA+dZlgjqkjfLI69A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=AIa9ubkb; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AIa9ubkb"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260325063335epoutp030ac10090c1a8cc21b0c2e7e8ca3af99c~gAfdZ64nt2512025120epoutp03W
	for <asahi@lists.linux.dev>; Wed, 25 Mar 2026 06:33:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260325063335epoutp030ac10090c1a8cc21b0c2e7e8ca3af99c~gAfdZ64nt2512025120epoutp03W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774420415;
	bh=ppnKZEdmmJpbM0b/Lc5OQLwmcCK4ODIOS1qyAKpRn6E=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=AIa9ubkbqSyV/CU7vI8s9yuxyuKC4Mk+jHPbQ0Pdzi1aSSJQCwx2QISgrv4q+Qwy7
	 3BaTq8G38+VQktZ3JQRhGq9Dq8OvzWFtl2D1JYMVomxgo8Oo03CP+awXv4sjboTPJF
	 DLeq1Qfun60bmjJWjXZQqqJ6wXDDvvAuWSAI4FK4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20260325063334epcas2p40f15a1f6ffa1ffda6628090b5f3068f2~gAfc4teNk0894508945epcas2p4E;
	Wed, 25 Mar 2026 06:33:34 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.210]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4fgcYV12prz3hhTD; Wed, 25 Mar
	2026 06:33:34 +0000 (GMT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: [PATCH v3] nvme: Add nvme_setup_cmd to host_path_error
Reply-To: hmi.jeon@samsung.com
Sender: =?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
From: =?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
To: Justin Tee <justintee8345@gmail.com>, "kbusch@kernel.org"
	<kbusch@kernel.org>, "axboe@kernel.dk" <axboe@kernel.dk>
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
	<linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c@epcms2p6>
Date: Wed, 25 Mar 2026 15:33:33 +0900
X-CMS-MailID: 20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6
References: <945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com>
	<20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
	<CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p6>

Hi Justin,


After your feedback, I found a simpler approach.
I've modified the patch to add nvme_setup_cmd() inside 
host_path_error(). I think this patch won't cause side effect.

Please leave a review. Thank you.

- Before
nvme_complete_rq: \
nvme0: qid=0, cmdid=0, res=0x0, retries=0, flags=0x2, status=0x370

- After
nvme_setup_cmd: \
nvme0: qid=0, cmdid=32777, nsid=0, flags=0x0, meta=0x0, \
cmd=(nvme_admin_identify cns=1, ctrlid=0)
nvme_complete_rq: \
nvme0: qid=0, cmdid=32777, res=0x0, retries=0, flags=0x2, status=0x370

Regards,
Minsik Jeon



From 98af885be8314dc9093983c531fc36b454b78e81 Mon Sep 17 00:00:00 2001
From: Minsik Jeon <hmi.jeon@samsung.com>
Date: Wed, 25 Mar 2026 15:58:20 +0900
Subject: [PATCH v3] nvme: Add nvme_setup_cmd to host_path_error

we were checking host_pathing_error before calling nvme_setup_cmd().
This is caused the command setup to be skipped entirely when a pathing
error occurred, making it impossible to trace the nvme command via
trace_cmd nvme_complete_rq().

As a result, when nvme_complete_rq() logged a completion with cmdid=0,
it was impossible to correlate the completion with the nvme command
request.

This patch add nvme_setup_cmd() to nvme_host_path_error().

- Before
nvme_complete_rq: \
nvme0: qid=0, cmdid=0, res=0x0, retries=0, flags=0x2, status=0x370

- After
nvme_setup_cmd: \
nvme0: qid=0, cmdid=32777, nsid=0, flags=0x0, meta=0x0, \
cmd=(nvme_admin_identify cns=1, ctrlid=0)
nvme_complete_rq: \
nvme0: qid=0, cmdid=32777, res=0x0, retries=0, flags=0x2, status=0x370

Co-authored-by: Beomsoo Kim <beomsooo.kim@samsung.com>
Co-authored-by: Eunsoo Lee <euns212.lee@samsung.com>
Co-authored-by: Steven Seungcheol Lee <sc108.lee@samsung.com>
Signed-off-by: Minsik Jeon <hmi.jeon@samsung.com>
---
 drivers/nvme/host/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 766e9cc4ffca..378d28b2c971 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -512,6 +512,7 @@ EXPORT_SYMBOL_GPL(nvme_complete_batch_req);
 blk_status_t nvme_host_path_error(struct request *req)
 {
 	nvme_req(req)->status = NVME_SC_HOST_PATH_ERROR;
+	nvme_setup_cmd(req->q->queuedata, req);
 	blk_mq_set_request_complete(req);
 	nvme_complete_rq(req);
 	return BLK_STS_OK;
-- 
2.52.0

