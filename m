Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE72317171
	for <asahi@lists.linux.dev>; Fri, 20 Mar 2026 13:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774014235; cv=none; b=mZi2zDeUsZ54Qh8HavyGksuBn5NFYGuVQSR9vM0vU2h0yYkhqysh1199D8kLWLeghTwrQxQXA6LhnVKZVx/rLSQtUqsvR3t35kzGWe0F+TF5XCKe/Y32J60IahJ2a2lPgFwNwlLMpn24U2cqc6db2MU7zJ3W3MppuQoOm7lXpLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774014235; c=relaxed/simple;
	bh=zu/u9jt+G7URWOYQrP3tMoDCzcX4DaPwxU4iAQ7Bd6E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:In-Reply-To:
	 Content-Type:References; b=NbIZoWuSmwgH7jm/1kXW+LmBEuO3LL+id+467NjHoTK2M0BGB09xILwWLWyWpxox8C60726VxA5B+0gYrNs5a3suZFfPN7HeK4nV7LqnfOEvJgBHAux+QPutF5FyWPel9EMkIliB+pIgbnFlO4muygEXmsU+JlZUmiHG/IWw6KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QMxTm4lE; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QMxTm4lE"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260320134346epoutp04b4d8369fec311c97dc2140278b59470a~ekIpIZgoF0693506935epoutp04h
	for <asahi@lists.linux.dev>; Fri, 20 Mar 2026 13:43:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260320134346epoutp04b4d8369fec311c97dc2140278b59470a~ekIpIZgoF0693506935epoutp04h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774014226;
	bh=MdghUPigXgAiN4GE/7Na10kf5cTjIUitM3/aJKcENXs=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
	b=QMxTm4lEL7LZwvqdO42KN7MlalX8KctIsCp9gZSqSSV2pANF0+Yh6LLoJub9iL0o2
	 nae4/1W/8Mh6B9VZhHy/VmdDNUWLsxZz04BqlPe5ugW026eyFmX5nNA/yuzBcKCBLN
	 PNHu7Kfvhymk5NQgBqeVtw59EsbKiFI2hzedtuyE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260320134345epcas5p4d620667c0fa53957456ee6ab431b74be~ekIoV4r-j2223622236epcas5p4C;
	Fri, 20 Mar 2026 13:43:45 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.86]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4fckL86bmPz3hhT3; Fri, 20 Mar
	2026 13:43:44 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260320134344epcas5p2a47663a9878904f47ac842e234b5d3b1~ekImvLOVo1040510405epcas5p20;
	Fri, 20 Mar 2026 13:43:44 +0000 (GMT)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260320134340epsmtip1d05d29f64a4175bad458c87c0cf02519~ekIjPQ7Rf0949609496epsmtip1f;
	Fri, 20 Mar 2026 13:43:39 +0000 (GMT)
Message-ID: <981ab856-9c79-4e08-9906-a81ec298a688@samsung.com>
Date: Fri, 20 Mar 2026 19:13:37 +0530
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kanchan Joshi <joshi.k@samsung.com>
Subject: Re: [PATCH] nvme: Move nvme_setup_cmd before hot_pathing
To: hmi.jeon@samsung.com, "kbusch@kernel.org" <kbusch@kernel.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>
Cc: "sven@kernel.org" <sven@kernel.org>, "j@jannau.net" <j@jannau.net>,
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
Content-Language: en-US
In-Reply-To: <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260320134344epcas5p2a47663a9878904f47ac842e234b5d3b1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6
References: <CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
	<20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>

On 3/20/2026 10:51 AM, 전민식 wrote:
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index b78ba239c8ea..ad0363f7e681 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -1376,10 +1376,6 @@ static blk_status_t nvme_prep_rq(struct request *req)
>   	iod->meta_total_len = 0;
>   	iod->nr_dma_vecs = 0;
>   
> -	ret = nvme_setup_cmd(req->q->queuedata, req);
> -	if (ret)
> -		return ret;
> -
>   	if (blk_rq_nr_phys_segments(req)) {
>   		ret = nvme_map_data(req);
>   		if (ret)
> @@ -1418,6 +1414,10 @@ static blk_status_t nvme_queue_rq(struct blk_mq_hw_ctx *hctx,
>   	if (unlikely(!test_bit(NVMEQ_ENABLED, &nvmeq->flags)))
>   		return BLK_STS_IOERR;
>   
> +	ret = nvme_setup_cmd(req->q->queuedata, req);
> +	if (ret)
> +		return ret;
> +
>   	if (unlikely(!nvme_check_ready(&dev->ctrl, req, true)))
>   		return nvme_fail_nonready_command(&dev->ctrl, req);

The intent is to improve the observability in case controller was not 
ready, but the patch may need rework so that it does not cause the 
memory leak for this scenario.

Currently nvme_prep_rq() calls nvme_setup_cmd(), and in case failure 
occurs after that, it also does explicit cleanup with 
nvme_cleanup_cmd(). For discard request, this cleanup involves freeing 
memory that was allocated.

This patch moves nvme_setup_cmd() to caller (i.e. nvme_queue_rq), checks 
for controller not being ready and asks block-layer to retry without 
ever freeing the resource.
