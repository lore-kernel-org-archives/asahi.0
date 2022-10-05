Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CCF365
	for <asahi@lists.linux.dev>; Wed,  5 Oct 2022 05:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1664946753; x=1696482753;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=t4Ggk8JN7aJqaDrHkVXVhSu8+EOy8cvFecQ8rYNiwuM=;
  b=gGEcgvz0x8Of8gFjO3doEQ0umh9qPKtZeCcJBlWK+NqX+Ka/wtv0MEPY
   ilVRPUmLCu5I4Txjaf1s5JmnbGWLGXKipaddsLVLhZcurkGr/6gOXCI6l
   RUgaOoamdVd4x9ky97hJAqqzYRqTdcno8NilI5QA6wPZWD4hmMWizub0V
   pCSTmmA4Vgdqe2F0L0SdXLUnS08Xyh3RgXAA2aObtn9Ut8Qy4esA0QF2S
   9eDyTTNhtuln2T+OpVYugUfT1V4Ed5pQW0SpnG/CkI74Za2rnkHr3aaZ9
   2F6reBIjMVW3Ow6yPlWBFcw/RZyCSg4wwlTYMD9ycYuj56oVxMZPVSWVn
   w==;
X-IronPort-AV: E=Sophos;i="5.95,159,1661788800"; 
   d="scan'208";a="211366247"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 05 Oct 2022 13:11:22 +0800
IronPort-SDR: aapNBG0URBMhD+yLK0GTEsyYLAIKN6r0qQhCjy6YuyvHyakIYkCzE3C6zNu+oTFOF15EBSVv/b
 O6iTOnNeSo0yVnIYBw3uGEktUD8AveRfJFZsLJbbwUhdJCx/xVOPc18t1MGpaq3O1ewDA1Jx5L
 MU4ei/tXl5DmhdqSFg4MUDaK5czx0PYFXnPyfnzbwzbatPjR6sZW62ySU0Hm5RIxuath5Yo5vO
 H3+YXnwQX3hI40IgGBZaNbvmRxBDbDG3XQAgpazp0IwFaKSqRXj/4oyBui3Q3DF/S56izdys6H
 DpTv5RSlIAIjmE+yL0uYqRSB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Oct 2022 21:25:36 -0700
IronPort-SDR: 2/Ij3Q916hcPrU/CkRvHLl40Sgh1YvJbbVajrAMQcWZFizJDDQIh7avmWzEa3/lCsNj/L0JL2E
 iwb+2WjtJbuU14WW2Uz7d54mN5giGqNFgmPQ20vS58C8AS4+zLiGlVe491mLE09TRyF+OJ4LU2
 8gQoHY61Yji+SegGj/qaZHa/nTe9Fe4EjGySBV0VsEACoowLQifq+3rBoGl+FA0msX4y8PG0fV
 na+F1l5qTTeF1WprU6jpIE2UDyAwnBBo4tM95E0ZkabsGZRwD/R26+zTCm8TxGxGmSQAmaayl8
 dL4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Oct 2022 22:11:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mj2jQ4tlgz1RwtC
	for <asahi@lists.linux.dev>; Tue,  4 Oct 2022 22:11:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1664946681; x=1667538682; bh=t4Ggk8JN7aJqaDrHkVXVhSu8+EOy8cvFecQ
	8rYNiwuM=; b=ZDqz60FopxyzCutuGHmbDuGcnjF9Zaowc+9QVNZ1gsxPnQNLL07
	2LeUqGyZWy6murMk9CJq0dSfGpdv7hFjv7qZpO/gjJFmTdQ/1G2TiL116cocIjkb
	grO6znvwHoEwT+dluohJoM47o3w1vpFmMJX1X7r4zMfAQybreEmZdya341yaiWNR
	3ni69BNJ9UEavwoPp4PRZVYZJpV53NvNCH0BGt2p/vwIJZiEkV7Zxbsv+7mB2i/V
	9kywFWK7/yMWpOW2rC9040NIqBGUB5DOC1lio58C4vXwS021UZTeAHLylAJEZrD/
	DkUIvDVm9Nn75OIq0+QtVGi4Fd4fDt+Qesw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kEkgQhC32emA for <asahi@lists.linux.dev>;
	Tue,  4 Oct 2022 22:11:21 -0700 (PDT)
Received: from [10.225.163.106] (unknown [10.225.163.106])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mj2jD37C6z1RvLy;
	Tue,  4 Oct 2022 22:11:12 -0700 (PDT)
Message-ID: <6fee2d7a-7fd1-73ee-2911-87a4ed3e8769@opensource.wdc.com>
Date: Wed, 5 Oct 2022 14:11:11 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 01/21] block: add and use init tagset helper
Content-Language: en-US
To: Chaitanya Kulkarni <kch@nvidia.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org
Cc: axboe@kernel.dk, efremov@linux.com, josef@toxicpanda.com,
 idryomov@gmail.com, dongsheng.yang@easystack.cn, haris.iqbal@ionos.com,
 jinpu.wang@ionos.com, mst@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com, stefanha@redhat.com, ohad@wizery.com,
 andersson@kernel.org, baolin.wang@linux.alibaba.com, ulf.hansson@linaro.org,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
 kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, sth@linux.ibm.com,
 hoeppner@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, hare@suse.de,
 bhelgaas@google.com, john.garry@huawei.com, mcgrof@kernel.org,
 christophe.jaillet@wanadoo.fr, vaibhavgupta40@gmail.com,
 wsa+renesas@sang-engineering.com, johannes.thumshirn@wdc.com,
 bvanassche@acm.org, ming.lei@redhat.com, shinichiro.kawasaki@wdc.com,
 vincent.fu@samsung.com, christoph.boehmwalder@linbit.com, joel@jms.id.au,
 vincent.whitchurch@axis.com, nbd@other.debian.org,
 ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 asahi@lists.linux.dev
References: <20221005032257.80681-1-kch@nvidia.com>
 <20221005032257.80681-2-kch@nvidia.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20221005032257.80681-2-kch@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/5/22 12:22, Chaitanya Kulkarni wrote:
> Add and use the helper to initialize the common fields of the tag_set
> such as blk_mq_ops, number of h/w queues, queue depth, command size,
> numa_node, timeout, BLK_MQ_F_XXX flags, driver data. This initialization
> is spread all over the block drivers. This avoids the code repetation of
> the inialization code of the tag set in current block drivers and any

s/inialization/initialization
s/repetation/repetition

> future ones.
> 
> Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
> ---
>  block/blk-mq.c                | 20 ++++++++++++++++++++
>  drivers/block/null_blk/main.c | 10 +++-------
>  include/linux/blk-mq.h        |  5 +++++
>  3 files changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index 8070b6c10e8d..e3a8dd81bbe2 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -4341,6 +4341,26 @@ static int blk_mq_alloc_tag_set_tags(struct blk_mq_tag_set *set,
>  	return blk_mq_realloc_tag_set_tags(set, 0, new_nr_hw_queues);
>  }
>  
> +void blk_mq_init_tag_set(struct blk_mq_tag_set *set,
> +		const struct blk_mq_ops *ops, unsigned int nr_hw_queues,
> +		unsigned int queue_depth, unsigned int cmd_size, int numa_node,
> +		unsigned int timeout, unsigned int flags, void *driver_data)

That is an awful lot of arguments... I would be tempted to say pack all
these into a struct but then that would kind of negate this patchset goal.
Using a function with that many arguments will be error prone, and hard to
review... Not a fan.

> +{
> +	if (!set)
> +		return;
> +
> +	set->ops = ops;
> +	set->nr_hw_queues = nr_hw_queues;
> +	set->queue_depth = queue_depth;
> +	set->cmd_size = cmd_size;
> +	set->numa_node = numa_node;
> +	set->timeout = timeout;
> +	set->flags = flags;
> +	set->driver_data = driver_data;
> +}
> +

No blank line here.

> +EXPORT_SYMBOL_GPL(blk_mq_init_tag_set);
> +
>  /*
>   * Alloc a tag set to be associated with one or more request queues.
>   * May fail with EINVAL for various error conditions. May adjust the
> diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
> index 1f154f92f4c2..0b07aab980c4 100644
> --- a/drivers/block/null_blk/main.c
> +++ b/drivers/block/null_blk/main.c
> @@ -1926,13 +1926,9 @@ static int null_init_tag_set(struct nullb *nullb, struct blk_mq_tag_set *set)
>  			flags |= BLK_MQ_F_BLOCKING;
>  	}
>  
> -	set->ops = &null_mq_ops;
> -	set->cmd_size	= sizeof(struct nullb_cmd);
> -	set->flags = flags;
> -	set->driver_data = nullb;
> -	set->nr_hw_queues = hw_queues;
> -	set->queue_depth = queue_depth;
> -	set->numa_node = numa_node;
> +	blk_mq_init_tag_set(set, &null_mq_ops, hw_queues, queue_depth,
> +			sizeof(struct nullb_cmd), numa_node, 0, flags, nullb);
> +
>  	if (poll_queues) {
>  		set->nr_hw_queues += poll_queues;
>  		set->nr_maps = 3;
> diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
> index ba18e9bdb799..06087a8e4398 100644
> --- a/include/linux/blk-mq.h
> +++ b/include/linux/blk-mq.h
> @@ -708,6 +708,11 @@ int blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
>  		struct request_queue *q);
>  void blk_mq_destroy_queue(struct request_queue *);
>  
> +

No need for the extra whiteline.

> +void blk_mq_init_tag_set(struct blk_mq_tag_set *set,
> +		const struct blk_mq_ops *ops, unsigned int nr_hw_queues,
> +		unsigned int queue_depth, unsigned int cmd_size, int numa_node,
> +		unsigned int timeout, unsigned int flags, void *driver_data);
>  int blk_mq_alloc_tag_set(struct blk_mq_tag_set *set);
>  int blk_mq_alloc_sq_tag_set(struct blk_mq_tag_set *set,
>  		const struct blk_mq_ops *ops, unsigned int queue_depth,

-- 
Damien Le Moal
Western Digital Research

