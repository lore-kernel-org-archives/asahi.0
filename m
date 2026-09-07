Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D122D879E
	for <asahi@lists.linux.dev>; Mon,  7 Sep 2026 21:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816271; cv=none; b=PjN57JhkrmcblVSDgxPY8LYBfPAt69A91SEIVDIJdEaWs3ixH3LO9sK9pxsg/O/Z7py86CQe7G4q9FgaME4kdeagBudl9nBY8XjNj4pFyGzKkEYjh0hk1PJoE7EKIEB9ltZ03H9W3c0AWZDkmYjIk+M2s583jh5WgRYS9ZPitmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816271; c=relaxed/simple;
	bh=ESxfzcPJSQgd+EG4I3mz4+YpdACrezLGXe/CMW1/FWc=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=gCUdO4JImggg/zy+PUd2qSo1RuhC+g48ymwpVZTq7KLod2rXJ4gq+agIynp1EsirerV1LbqzJUmh6tX+CKWsdUyfTnu9k7lhXO6BvA4RuNt95qtr1CdWZd1jKikpLyhPEfQcjS3Pe9GMVGUSpWBI0ViiRrfpUWLVCAtXaxwThzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=RsVMNezK; arc=none smtp.client-ip=195.121.94.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="RsVMNezK"
X-KPN-MessageId: 56dc52ea-ab02-11f1-b2a8-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 56dc52ea-ab02-11f1-b2a8-005056abbe64;
	Mon, 07 Sep 2026 23:23:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=IvVnuFeUbloygyYn25mc+9Gp/L3QtXZRWFkaJAOj734=;
	b=RsVMNezK9AXQMP0JV8alZqyfH5Lj0G5SrkPqxqcYsXzLhChDm12tk4HKFTeBt6pMhRN2frfPldUaN
	 dk4RLJXYr8HlYExQlZhlM46g9EJ4utIiSiD5yacHwL6QDm3kYMRK9UpheStHoMpuol4Y3yViXa3wQG
	 hEHYMIjFl7k5cbqrUVBlBy//mMhQx1jstQoGQ8+s2qAuUzodiGLqK/7rOKWrrL3a+brjVawigsXAi7
	 r7wncQm9OFpk1OUJLWgsxg5S+SQDzV2aa5UZxdQtiCIs3IcbpnmP9r+UXDTpvZUIg9Zk2nDxUiOAhu
	 s+x80tScQcjRLPd5BOlig54ypUPapEA==
X-KPN-MID: 33|MTWnIGqkllysgsfqHDR98i492UoaM4/A9cguGGH0YWEncjA5h//DzB91+IpzSde
 YeNp9NGsCroSmRCtRmqia7iV98bDyvkQqKgqP7If3f8c=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|HYbRrgTuKesxlP8v4FocLVQ44hkeQvDqXDyPINzYl4Zy93JwNi0EtPVtVNZ8Tem
 D6B2SWnz1jgAX7LOL+43ncg==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 5650de84-ab02-11f1-86b8-005056ab7584;
	Mon, 07 Sep 2026 23:23:15 +0200 (CEST)
Date: Mon, 07 Sep 2026 23:23:15 +0200
Message-Id: <87qzj4sqm4.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.u-boot-project.org, asahi@lists.linux.dev,
	kettenis@openbsd.org, sven@kernel.org,
	neil.armstrong@linaro.org, bmeng.cn@gmail.com,
	trini@konsulko.com, fberder@outlook.fr, j@jannau.net
In-Reply-To: <20260904-apple-nvme-fwabi-v1-3-f7ede661c469@jannau.net> (message
	from Janne Grunau on Fri, 04 Sep 2026 21:22:41 +0200)
Subject: Re: [PATCH 3/4] nvme: apple: Add WARN_ON_ONCE for non page-aligned
 admin queue buffers
References: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net> <20260904-apple-nvme-fwabi-v1-3-f7ede661c469@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau <j@jannau.net>
> Date: Fri, 04 Sep 2026 21:22:41 +0200
> 
> Apple controllers seem to require any queue buffers on the admin queue
> to be aligned to the NVMe controller page size. Weirdly, this constraint
> does not apply to the i/o queue where any alignment is fine. This has
> always been required on pre-M1 controllers and is required starting with
> macOS 15 firmware or post-M4 controllers again. On M1/M2/M3 there was a
> chicken bit to disable this requirement.
> 
> U-boot appears to always use page-aligned buffers for the admin queue.
> Add WARN_ON_ONCE to make it very obvious if/when that changes or wasn't
> true to begin with.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

Probably a good idea.  We aren't really size constrained.

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

> ---
>  drivers/nvme/nvme_apple.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/nvme/nvme_apple.c b/drivers/nvme/nvme_apple.c
> index f615f8fac4a..54821f80c81 100644
> --- a/drivers/nvme/nvme_apple.c
> +++ b/drivers/nvme/nvme_apple.c
> @@ -12,6 +12,7 @@
>  #include <asm/io.h>
>  #include <asm/arch/rtkit.h>
>  #include <asm/arch/sart.h>
> +#include <linux/bug.h>
>  #include <linux/iopoll.h>
>  #include <linux/sizes.h>
>  
> @@ -116,9 +117,15 @@ static void apple_nvme_submit_cmd(struct nvme_queue *nvmeq,
>  {
>  	struct apple_nvme_priv *priv =
>  		container_of(nvmeq->dev, struct apple_nvme_priv, ndev);
> +	u32 page_size = nvmeq->dev->page_size;
>  	struct ans_nvmmu_tcb *tcb;
>  	u16 tail = nvmeq->sq_tail;
>  
> +	if (nvmeq->qid == NVME_ADMIN_Q) {
> +		WARN_ON_ONCE(!IS_ALIGNED(cmd->common.prp1, page_size));
> +		WARN_ON_ONCE(!IS_ALIGNED(cmd->common.prp2, page_size));
> +	}
> +
>  	tcb = ((void *)priv->tcbs[nvmeq->qid]) + tail * ANS_NVMMU_TCB_PITCH;
>  	memset(tcb, 0, sizeof(*tcb));
>  	tcb->opcode = 0;
> 
> -- 
> 2.55.0
> 
> 
