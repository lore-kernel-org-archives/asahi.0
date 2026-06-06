Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D1C391E66
	for <asahi@lists.linux.dev>; Sat,  6 Jun 2026 14:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780756175; cv=none; b=BcMVu+jORNImxCWG11crE0A7ufpJwbUd6GGGDYH79f9K+K/SzagUTjYb1CsZbNo5D/WAHn3/SRJCuCpbxx+FREXcErs2uzmgipt6vcTAqzFLEIC2Swvyer84v7V9sTOgJNOiBV32fU+TckWpESRAlMyl7rFgSnllb3t5PzPLYGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780756175; c=relaxed/simple;
	bh=SMQTvcZ6BrmhlMD+3mEMoKUn2owCl+xIUyOb10rwEV0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n/rjY2FnZJmJg988p94Q/8AshYhVNkBUSemMrpoF/H1KMt4vF5QadQ5XEBmzub/b7fHn2RK32JrujyXJ0R1Q6azMepe22Q2uG4tq27jO8jj4ApClrQ5bfuO/szszXVS3+yLCBNPR9dLkYh8flhW7auH5c/VXRfeZrzCCHEInh/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0UKzFtX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0UKzFtX"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b12270b3so17216905e9.1
        for <asahi@lists.linux.dev>; Sat, 06 Jun 2026 07:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780756172; x=1781360972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGwj67mAdvjyet/J2nHlIYGQH//k5ItlM0+5UXPSkLM=;
        b=I0UKzFtXnzvPRZEZ7tJUMeS7ckWsO8Lw4AfscAcD8N/9aZKJtf3jW9/1WohyfTDS8z
         Eoo9MkxoamGxMAOJUY7mWoQB3UKf3AH/OmHRpX6RCOrhW1wW4TP6s3eHQ++BeUJCQdAv
         brOiRjGdIZo5KL+VF1b5vpusCB3b8Pq5Q8ilmZBKrKVTTzUZcQYthjKrjeyNtE8+aJsR
         eyc6OCX4f8VhsvIOS7xxBoODcopU0ibxdO+1j3ZlSGyXznRx7Qjl5Lw4yjMscl9pHX4z
         5T6U5qY+KISUuG50tDtxS2PW/d1NZJgJ4g1EqjU7d7BQ6WoGRIVo6vC0iPt8WsdMvNef
         oAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780756172; x=1781360972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xGwj67mAdvjyet/J2nHlIYGQH//k5ItlM0+5UXPSkLM=;
        b=ZM6qHAXKhwC8ULnGl7kv3niGG3OtTqJnpHA7ck0qhm0m7z79rVhb1Dzlg9rIT4Q2IQ
         UIpymkMjYlTm1gSJmtyvdrfYFshaAJHjK+SpyHBaUrEmQG9OwhUrDKHLo52wxGeSKgVD
         8UfMM0ciNrn2wRlbv7prtX+uOkmvZC9pE133MmWenRxvobVlVULZWNp4i3vtPh1/284B
         HyQNfxZ7hIy4d+S4JZYC4YWfuPRXgkIoVCtJnuaJdC8c0QbBb8o8yHhjqiqngYAktz3z
         G7JHsyLFs5HbW8h/Iy+ZeX3niAOUW8s9fjdbXasrBee83ZeuXj0xqRLC5382c5EBBBya
         upuA==
X-Forwarded-Encrypted: i=1; AFNElJ/UPI2ZMUP9VMmvo8LTiW05X1HZQUVL8pnOSc1kJchgKcRsKCGowJPk5OM001bpckEG0sWT9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyORl54fVOip3MInHw3f/GySfMt9HxwVilbcP/Ul7YXqF/RRrLF
	WZSQjI36CFGEl1abF7mHSBKdb2QYoreT+NceWtkzm36dFihZwvlc3Lam0kFdGK0A
X-Gm-Gg: Acq92OH+BpGdMPP6cOyjagbtZDL1IXkokJkKA0MJpT3gyoPFM5zjZ51bJamJNkGVwx8
	XyKU2/38AmVB5skPqrQkK3G4mGFfyhUDu+A19/7uXIbGhvJqGUuY1CFDu0/0/KyA8Dx8XmfZGLg
	LbaHoal3UkZUxmuw3J29D+uE5oabPouelG8VG0w0/SxAeBMocjWXnyV5HDz/G4EmNmONVV+8ttw
	qPGEozWcuooLMKtqzP7JDGfrML0yJvlKmWgy7Ms51wfxa22ZR9qVc5SqI5OwOwUL1PMmZGIHiDg
	x5a/V08Uykcw79ysuHOPtTfwBdFH5pg3GiAC81Yl+qSN90Uk+EIHjjBx/zAQJNc+15PMAEZz8c+
	gl324KlGHkiou/32uhn87HnjIdEsqBsSiJG8ZPUYdDvE6b7WL7TOnAvKqlT6dZyInWvId+coLCc
	a0aajO/Gljh7XlfdKb3Rxh6rJfE4YZhEXjAciBXFnLltBmzfXwGplmwEvGmbxm8+HRNJ+StWo=
X-Received: by 2002:a05:600c:3153:b0:490:b8c0:d46a with SMTP id 5b1f17b1804b1-490c2604790mr138043675e9.22.1780756172286;
        Sat, 06 Jun 2026 07:29:32 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2ed944sm36003622f8f.13.2026.06.06.07.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 07:29:32 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:29:30 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa
 <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>, Jens Axboe
 <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg
 <sagi@grimberg.me>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Yuriy Havrylyuk
 <yhavry@gmail.com>
Subject: Re: [PATCH 2/2] nvme-apple: Prevent tag collision across queues
 even if tag space is shared
Message-ID: <20260606152930.6f2bf4ed@pumpkin>
In-Reply-To: <20260606-prevent-tag-collision-t8015-v1-2-93ccf4eca550@gmail.com>
References: <20260606-prevent-tag-collision-t8015-v1-0-93ccf4eca550@gmail.com>
	<20260606-prevent-tag-collision-t8015-v1-2-93ccf4eca550@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 06 Jun 2026 21:25:26 +0800
Nick Chan <towinchenmi@gmail.com> wrote:

> From: Yuriy Havrylyuk <yhavry@gmail.com>
> 
> Apple NVMe controllers require tags of pending commands to not be shared
> across admin and IO queues. However, on Apple A11 without linear SQ, it is
> not possible for either queue to skip over some tags and must go from 0 to
> the configured maximum before wrapping around.
> 
> If a pending command tag is duplicated across queues, the firmware
> crashes with: "duplicate tag error for tag N", with N being the tag.
> 
> Instead of partitioning the tag space, which is not possible without
> linear SQ, prevent tag collisions by keeping track of which tags are
> currently in-flight across either queues, and return BLK_STS_RESOURCE to
> temporaily block command submission when a collision would have occurred.

I look at using the atomic64_xxx() functions rather than the bitmask ones.
The for_each_bit_set() loop is then an atmomic64_andnot() call.

-- David


> 
> Cc: stable@vger.kernel.org
> Fixes: 04d8ecf37b5e ("nvme: apple: Add Apple A11 support")
> Signed-off-by: Yuriy Havrylyuk <yhavry@gmail.com>
> Co-developed-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  drivers/nvme/host/apple.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
> index c1115e27a0d6..6354edf27225 100644
> --- a/drivers/nvme/host/apple.c
> +++ b/drivers/nvme/host/apple.c
> @@ -203,6 +203,20 @@ struct apple_nvme {
>  
>  	int irq;
>  	spinlock_t lock;
> +
> +	/*
> +	 * Tags of pending commands must be unique across both Admin and IO
> +	 * queue. However, on T8015, unlike T8103, without linear submission
> +	 * queues, it is not possible for the either queue to skip some tags,
> +	 * and both queues must go from 0 to their respective configured
> +	 * maximum.
> +	 *
> +	 * Instead of reserving some tags for the admin queue, use a bitfield
> +	 * to keep track of pending commands on either queue, and temporaily
> +	 * block command submission by returning BLK_STS_RESOURCE until the
> +	 * tag is freed on the other queue.
> +	 */
> +	unsigned long t8015_active_tags;
>  };
>  
>  static_assert(sizeof(struct nvme_command) == 64);
> @@ -290,6 +304,28 @@ static void apple_nvmmu_inval(struct apple_nvme_queue *q, unsigned int tag)
>  				     "NVMMU TCB invalidation failed\n");
>  }
>  
> +static bool apple_nvme_reserve_tag_t8015(struct apple_nvme *anv,
> +					 struct nvme_command *cmd)
> +{
> +	u16 tag = nvme_tag_from_cid(cmd->common.command_id);
> +
> +	if (WARN_ON_ONCE(tag >= BITS_PER_LONG))
> +		return false;
> +
> +	return !test_and_set_bit(tag, &anv->t8015_active_tags);
> +}
> +
> +static void apple_nvme_release_tag_t8015(struct apple_nvme *anv,
> +					 __u16 command_id)
> +{
> +	u16 tag = nvme_tag_from_cid(command_id);
> +
> +	if (WARN_ON_ONCE(tag >= BITS_PER_LONG))
> +		return;
> +
> +	clear_bit(tag, &anv->t8015_active_tags);
> +}
> +
>  static void apple_nvme_submit_cmd_t8015(struct apple_nvme_queue *q,
>  				  struct nvme_command *cmd)
>  {
> @@ -652,6 +688,8 @@ static inline void apple_nvme_update_cq_head(struct apple_nvme_queue *q)
>  static bool apple_nvme_poll_cq(struct apple_nvme_queue *q,
>  			       struct io_comp_batch *iob)
>  {
> +	struct apple_nvme *anv = queue_to_apple_nvme(q);
> +	unsigned long completed_tags = 0;
>  	bool found = false;
>  
>  	while (apple_nvme_cqe_pending(q)) {
> @@ -664,11 +702,26 @@ static bool apple_nvme_poll_cq(struct apple_nvme_queue *q,
>  		dma_rmb();
>  		apple_nvme_handle_cqe(q, iob, q->cq_head);
>  		apple_nvme_update_cq_head(q);
> +
> +		if (!anv->hw->has_lsq_nvmmu) {
> +			struct nvme_completion *cqe = &q->cqes[q->cq_head];
> +			u16 tag = nvme_tag_from_cid(READ_ONCE(cqe->command_id));
> +
> +			if (!WARN_ON_ONCE(tag >= BITS_PER_LONG))
> +				__set_bit(tag, &completed_tags);
> +		}
>  	}
>  
>  	if (found)
>  		writel(q->cq_head, q->cq_db);
>  
> +	if (!anv->hw->has_lsq_nvmmu && completed_tags) {
> +		unsigned long tag_bit;
> +
> +		for_each_set_bit(tag_bit, &completed_tags, BITS_PER_LONG)
> +			clear_bit(tag_bit, &anv->t8015_active_tags);
> +	}
> +
>  	return found;
>  }
>  
> @@ -790,6 +843,12 @@ static blk_status_t apple_nvme_queue_rq(struct blk_mq_hw_ctx *hctx,
>  	if (ret)
>  		return ret;
>  
> +	if (!anv->hw->has_lsq_nvmmu &&
> +	    !apple_nvme_reserve_tag_t8015(anv, cmnd)) {
> +		ret = BLK_STS_RESOURCE;
> +		goto out_free_cmd;
> +	}
> +
>  	if (blk_rq_nr_phys_segments(req)) {
>  		ret = apple_nvme_map_data(anv, req, cmnd);
>  		if (ret)
> @@ -806,6 +865,9 @@ static blk_status_t apple_nvme_queue_rq(struct blk_mq_hw_ctx *hctx,
>  	return BLK_STS_OK;
>  
>  out_free_cmd:
> +	if (!anv->hw->has_lsq_nvmmu)
> +		apple_nvme_release_tag_t8015(anv, cmnd->common.command_id);
> +
>  	nvme_cleanup_cmd(req);
>  	return ret;
>  }
> @@ -1165,6 +1227,9 @@ static void apple_nvme_reset_work(struct work_struct *work)
>  	if (ret)
>  		goto out;
>  
> +	if (!anv->hw->has_lsq_nvmmu)
> +		WRITE_ONCE(anv->t8015_active_tags, 0);
> +
>  	dev_dbg(anv->dev, "Starting admin queue");
>  	apple_nvme_init_queue(&anv->adminq);
>  	nvme_unquiesce_admin_queue(&anv->ctrl);
> 

