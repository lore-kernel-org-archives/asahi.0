Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0838F55
	for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 15:41:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 4EFF83FB17;
	Tue, 29 Nov 2022 15:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1669736515; bh=wnSLS1lcmJYtAh3XGrwopHs6WB99DslvB63Vgb/tUec=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To;
	b=W6CDj26AxK5Js9+BA+6rOX/ZcaldAzN5E1jtEDy1uUaAlvOMqPfvba6oxk508OUVj
	 +WuNTgaKCf1KLio1TISeUlpPLCBCsbNg49l3UMcz6NguA9/4QZlriCRsrkrAmfQPMJ
	 fs+7TqyAdbreHly9WKvWw1ZFT2YAI1QJaMqNBBdokMphLuWf48DMJ8Gr+/CzzEBD1Q
	 It89SK+hqWS4hUA418+QTuD3DNNppPPTIyoDgUHG+0hB9uhDs+CIWvfqdyXAXROX81
	 kKYsXiyWJTlzQHOWmqIFcySoFdjjVYLUKUFZjhVzyTzRjDINqfRRwV9+hKYn/th62W
	 wRZfgImzkmrdQ==
Message-ID: <c20485ec-28aa-2a45-3eba-8fa384ce0349@marcan.st>
Date: Wed, 30 Nov 2022 00:41:45 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: James Smart <james.smart@broadcom.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Sven Peter <sven@svenpeter.dev>,
 asahi@lists.linux.dev, linux-nvme@lists.infradead.org
References: <20221129132208.4337-1-hch@lst.de>
 <20221129132208.4337-2-hch@lst.de>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 1/9] nvme-apple: fix controller shutdown in
 apple_nvme_disable
In-Reply-To: <20221129132208.4337-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/11/2022 22.22, Christoph Hellwig wrote:
> nvme_shutdown_ctrl already shuts the controller down, there is no
> need to also call nvme_disable_ctrl for the shutdown case.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/nvme/host/apple.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
> index 94ef797e8b4a5f..56d9e9be945b76 100644
> --- a/drivers/nvme/host/apple.c
> +++ b/drivers/nvme/host/apple.c
> @@ -831,7 +831,8 @@ static void apple_nvme_disable(struct apple_nvme *anv, bool shutdown)
>  
>  		if (shutdown)
>  			nvme_shutdown_ctrl(&anv->ctrl);
> -		nvme_disable_ctrl(&anv->ctrl);
> +		else
> +			nvme_disable_ctrl(&anv->ctrl);
>  	}
>  
>  	WRITE_ONCE(anv->ioq.enabled, false);

Reviewed-by: Hector Martin <marcan@marcan.st>

I looked at some of our other implementations and we always seem to do
both, but this makes sense. If it breaks something we'll notice and
shout loudly when it makes it into an -rc at the latest :)

- Hector
