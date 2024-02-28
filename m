Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489AA3FB9A
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 23:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709164027; cv=none; b=ekLPUYH8sCdgWl76i3h0YR1e2OvFkXNvEV+pAA3+erqjzo8SeFQcnlf4Kh7oWAtjUKC5ol6FbhlY5JWqNIIxXNTVXgTIXz2IxBg+vTq1X7PZt2yexZfCOfL88yv6KbNSCznc4UN++FwOZ8C0pR0zfd6Eb6G6dXWzdJdcGYTFw+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709164027; c=relaxed/simple;
	bh=Iw0U/wUM1+yMxiscJOs8z/bCPBSNs/GVj+pC4sHqtTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqG7cIhWzWH1enJkMOgIkQ/3x6t+R3ljAIGBqXfuNGo6ZCK+GpLMkdslUc7X/10R2aqsCM4GTqDx07315X/oYKetOagXd/P2IvSgSNk+EIga4dGq7Q/fMifCVcxN18jeg3YL/s5RSSvQpUGtswgQQET7GDwHZCjaPy/rs7YGSEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YX1GuIO7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YX1GuIO7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40125C433F1;
	Wed, 28 Feb 2024 23:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709164026;
	bh=Iw0U/wUM1+yMxiscJOs8z/bCPBSNs/GVj+pC4sHqtTw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YX1GuIO7YsgB26124n/+oHjWUsFJ1oJ2S9euupNWVCae+OfN+HfkIbs5nHbRk5kCT
	 PTHrSWF3juaURCSELQ8Q5qHMkdN7uu26KCXlQ+1egAXUji0t8gJNFXLDihuzUOtaRe
	 I/rexLzK7HQk7EaVYv+WjhgNotAxOqA1Gj4Yd+GQi1skTyopsz3wOUHt2kZnQVw5ze
	 7+ab1EHR4G3dfZLVQKMtYdgegdhvKleHZb3B2TVMTXeXhxyoj58O3HFKysbYo4imjR
	 5C2k0OII9Br91OPdw7vmafhyzcGVSzV5bwPKVpUwFQdOlJLdVddZtYR7kPyDKQumBZ
	 pE/I04W3EvUOg==
Message-ID: <9dd3ea59-0394-484d-809c-37cbdce8a6c2@kernel.org>
Date: Wed, 28 Feb 2024 15:47:05 -0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/21] nvme: remove nvme_revalidate_zones
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20240228181215.873854-1-hch@lst.de>
 <20240228181215.873854-6-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240228181215.873854-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/02/28 10:11, Christoph Hellwig wrote:
> Handle setting the zone size / chunk_sectors and max_append_sectors
> limits together with the other ZNS limits, and just open code the
> call to blk_revalidate_zones in the current place.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

[...]

>  static int nvme_set_max_append(struct nvme_ctrl *ctrl)
>  {
>  	struct nvme_command c = { };
> @@ -113,6 +103,8 @@ int nvme_update_zone_info(struct nvme_ns *ns, unsigned lbaf)
>  	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
>  	disk_set_max_open_zones(ns->disk, le32_to_cpu(id->mor) + 1);
>  	disk_set_max_active_zones(ns->disk, le32_to_cpu(id->mar) + 1);

Not directly related to this patch, but I think that since you moved the max
open & active limits to queue->limits, we really should rename these to
blk_queue_max_open_zones() and blk_queue_max_active_zones() to be consistent
with all the other limits. and may be same for disk_set_zoned() while we are at it.

I can send a patch if you want...

> +	blk_queue_chunk_sectors(ns->queue, ns->head->zsze);
> +	blk_queue_max_zone_append_sectors(ns->queue, ns->ctrl->max_zone_append);
>  free_data:
>  	kfree(id);
>  	return status;

-- 
Damien Le Moal
Western Digital Research

