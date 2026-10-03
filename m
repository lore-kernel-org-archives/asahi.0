Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74DF358D27
	for <asahi@lists.linux.dev>; Sat,  3 Oct 2026 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791028510; cv=none; b=QVfbrUIsHD3BADg0+02MkSwZdOgGuSCbuBI6rw/VebsZXwJhBREUJh6iMDdeBf5S7zMdVjab0FqZpSyFlf9Fu6snyOdtLUMcr2xve+gDg3FctUH/S6Zr9N+IgdNhVLS9gN+Rf9hsEtCb922V5oSV5/EVIQe27QBXShq6lS3dEso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791028510; c=relaxed/simple;
	bh=DuA6Gva5pOH1WYrmkTbRDGD9itOlqM+XAxH+anGgmL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BuPaVT2nPbEXDjeDVHtHqNnDymc5AMK2oLpW3PT40TgYHSTR9zUutIZuEBb7h3/+i0IAqPsAQeExd+GAnYneJdyeBDKUnjttO1sMyyEUlE6a6lRS/4V86yCn8NJlsUABwI76Sa4SulRDVL3rzeYOXyiVQCIlWjIGs1TtJ6p72Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=Y2td9nO9; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="Y2td9nO9"
Message-ID: <94912d46-381d-4988-800a-6ef3b595233f@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791028505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TANupNPWri8xwQs5Q+uaxNBtEA6grayuDJGaesA0B3Q=;
	b=Y2td9nO9LpScuzyhMiGCjYwcds81El2zfh+nKQTxtGzQqQxRMk3T8UelFMlprC8rTZoXJi
	V5S5WDxgm/YNmf7j7b25TPuB1bdxirYUS5Yk3NCdD0v2IDq2euCcLqLBTHd20UuiWYuqVr
	mZ+jdXoN4/6W+d9Z6ayQt1h6Vx/B0Zc=
Date: Sat, 3 Oct 2026 13:55:01 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] nvme: do not reset controllers in NVME_CTRL_NEW state
To: Maurizio Lombardi <mlombard@redhat.com>, kbusch@kernel.org
Cc: linux-nvme@lists.infradead.org, mlombard@arkamax.eu, hch@lst.de,
 hare@suse.de, dwagner@suse.de, asahi@lists.linux.dev,
 Sven Peter <sven@kernel.org>
References: <20260915095827.698928-1-mlombard@redhat.com>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <20260915095827.698928-1-mlombard@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/15/26 11:58, Maurizio Lombardi wrote:
> During NVMe controller creation, the controller is exposed to sysfs via
> nvme_add_ctrl() while it is still in the NVME_CTRL_NEW state.
> This creates a narrow race window where a userspace process can write to
> the reset_controller sysfs node before the initialization thread
> transitions the state to NVME_CTRL_CONNECTING.
>
> If a reset is triggered during this window, the state machine allows the
> transition from NVME_CTRL_NEW to NVME_CTRL_RESETTING, and the reset work
> is queued. However, the original creation thread continues its execution,
> subsequently moving the state to NVME_CTRL_CONNECTING and finally to
> NVME_CTRL_LIVE.
>
> When the delayed reset work finally executes, it attempts to tear down
> the controller and transition the state to NVME_CTRL_CONNECTING. Because
> the state is now NVME_CTRL_LIVE, this transition fails, triggering a
> WARN_ON in the reset work.
>
> Fix this by removing NVME_CTRL_NEW from the allowed prior states for
> the NVME_CTRL_RESETTING transition.
>
> Fixes: 8bfc3b4c6f9d ("nvmet: switch loopback target state to connecting when resetting")
> Reported-by: syzbot+4a1d521d19d6321f5aad@syzkaller.appspotmail.com
> Signed-off-by: Maurizio Lombardi <mlombard@redhat.com>
> ---
>   drivers/nvme/host/core.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index beea23d04a70..7ea8dd27d08d 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -598,7 +598,6 @@ bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
>   		break;
>   	case NVME_CTRL_RESETTING:
>   		switch (old_state) {
> -		case NVME_CTRL_NEW:
>   		case NVME_CTRL_LIVE:
>   			changed = true;
>   			atomic_long_inc(&ctrl->nr_reset);

Hi!

I was testing something with linux-next 2026-10-02 and ran into an issue 
with the
nvme-apple driver where /dev/nvme0 exists but none of the namespaces appear,
and the dmesg is awfully quiet about the nvme device. I bisected it down to
this patch, which as far as I can tell leads to the nvme-apple being 
stuck in
NVME_CTRL_NEW state. Without being familiar with the matter, this looks like
the nvme-apple driver was using this transition as part of its 
initialization
procedure.  If one of the NVMe people who know how these transitions are
supposed to work could have a look, that would be much appreciated, as
otherwise this will break nvme-apple in 7.3-rc6.

Thanks,

- Yureka

