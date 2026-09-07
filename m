Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A61434405
	for <asahi@lists.linux.dev>; Mon,  7 Sep 2026 21:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816155; cv=none; b=pZkV106l98ABF9yjxUYcPN6CzIb3l6SK0IZUFfeZgz/bG1+ADFvWyi8myoXzXUNw5DthEJxxe00RLX3g78lPHPpsxPBriLwafQYxKk6/1hCbw66jVW0MOnON4pK/YovSF9D3ADTKZe+WkoENd1GYQ5b+LVZOQ8aBswHU9FrSx8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816155; c=relaxed/simple;
	bh=RcJor6QxYkKQIhwRRuGkrIBE1QK9kT8f2KwI9GeTKYY=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=s8/SGXq8P0yHSIC1Cco70m2TCCui6wfKVJklK7TJu3Qbun1BpiKqli+cboJvlFbZjGCDwqxkwZTkR5Ca9ZwSZyb6dLMYZFxGdw01XPa6mP6JcoESgVOiaqyz/wFKMeU+i3VdfVRe74PpfDtrdj3WCA50fbEpCUFBBtmjAjlZt+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=KIFc078c; arc=none smtp.client-ip=195.121.94.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="KIFc078c"
X-KPN-MessageId: 11ac83b9-ab02-11f1-861e-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 11ac83b9-ab02-11f1-861e-005056aba152;
	Mon, 07 Sep 2026 23:21:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=2o5aeHoEjCl49m1sQVkDoagFkvdONDs59op9HEuFjOM=;
	b=KIFc078c2VpLo1SYB5ONbrod09Cuf5gie5FGVy/IBi8Gh4y+aJasJRyuEIM8h9bim9Rye1nGeUFQH
	 VkLgwMZvIBhtMtnNHDzgRb2Ij2PV0A2HsIEZNNraTVZG0X7co2vVLfQOJmXOfScwq5C/K/+P9+AA8b
	 lof5mAZ+yQdUXR0jDm7nayiPoGYvUheI0N1Lihmy94JS6JdN3oLfhbqz7V0bVIrvbxDhPxysp71YUS
	 ETgS99tboB1rXHDQS+YuVQEM8kLDKXAh5hKF86bYnHIwsmNdrOLqm15ycdjsAqqVhfNGqR6zTMGVkz
	 ESUNVssknbCoiwEbElDjoPeeRTnFWmw==
X-KPN-MID: 33|zF1CdztyatBJyIyjTqwNl/8pF3eKfHEQdrI3c32ZooJgH8L45DCyXTr4N3Ynnkr
 +KxLVWkdhvQnCJBm0eKPE0690M/T0ZM172Vnfd9NSyAo=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|ceihSx4KgAFGIlPZ9yRJaSS9mhGIGjyu/0dqffsn2Jd8YUIwCVc8sKY8PqvULEr
 jkYDtcQw4VwcM23sI6R/KqQ==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 11298ff7-ab02-11f1-bd29-005056abf0db;
	Mon, 07 Sep 2026 23:21:19 +0200 (CEST)
Date: Mon, 07 Sep 2026 23:21:19 +0200
Message-Id: <87tso0sqpc.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.u-boot-project.org, asahi@lists.linux.dev,
	kettenis@openbsd.org, sven@kernel.org,
	neil.armstrong@linaro.org, bmeng.cn@gmail.com,
	trini@konsulko.com, fberder@outlook.fr, j@jannau.net
In-Reply-To: <20260904-apple-nvme-fwabi-v1-1-f7ede661c469@jannau.net> (message
	from Janne Grunau on Fri, 04 Sep 2026 21:22:39 +0200)
Subject: Re: [PATCH 1/4] nvme: apple: Don't set a DMA direction for commands
 without a data transfer
References: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net> <20260904-apple-nvme-fwabi-v1-1-f7ede661c469@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau <j@jannau.net>
> Date: Fri, 04 Sep 2026 21:22:39 +0200
> 
> Setting the DMA direction for commands that don't do any transfer likely
> triggered the PRP NULL check for which we needed a chicken bit. That bit
> has disappeared starting with macOS 15 so let's just do this correctly
> instead.
> 
> Based on Linux kernel commit 94dd5804938d ("nvme-apple: Don't set a DMA
> direction for commands without a data transfer").

It is probably best to keep this aligned with Linux.  However, on
OpenBSD I set the bits based on the low two bits of the opcode.  Like:

        if (cmd->common.opcode & nvme_cmd_write)
                tcb->flags |= ANS_NVMMU_TCB_READ;
	if (cmd->common.opcode & nvme_cmd_read)
	        tcb->flags |= ANS_NVMMU_TCB_WRITE;

(the directions are reversed as the commands are memory -> device
whereas the NVMMU bits are device -> memory).

The NVMe commands are documented like this.  I believe, there aren't
actually any commands that do both a read and a write.  But this would
do the right thing if they ever show up.

Anyway:

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>


> Link: https://lore.kernel.org/asahi/20260806-b4-nvme-fwabi-v1-2-bde19ce8db04@kernel.org/
> Fixes: 50333c94f2de ("nvme: apple: Add driver for Apple NVMe storage controller")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/nvme/nvme_apple.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvme/nvme_apple.c b/drivers/nvme/nvme_apple.c
> index e674eda8344..dc94988e2ff 100644
> --- a/drivers/nvme/nvme_apple.c
> +++ b/drivers/nvme/nvme_apple.c
> @@ -122,7 +122,10 @@ static void apple_nvme_submit_cmd(struct nvme_queue *nvmeq,
>  	tcb = ((void *)priv->tcbs[nvmeq->qid]) + tail * ANS_NVMMU_TCB_PITCH;
>  	memset(tcb, 0, sizeof(*tcb));
>  	tcb->opcode = cmd->common.opcode;
> -	tcb->flags = ANS_NVMMU_TCB_WRITE | ANS_NVMMU_TCB_READ;
> +	if (cmd->common.prp1)
> +		tcb->flags = ANS_NVMMU_TCB_WRITE | ANS_NVMMU_TCB_READ;
> +	else
> +		tcb->flags = 0;
>  	tcb->slot = tail;
>  	tcb->prpl_len = cmd->rw.length;
>  	tcb->prp1 = cmd->common.prp1;
> 
> -- 
> 2.55.0
> 
> 
