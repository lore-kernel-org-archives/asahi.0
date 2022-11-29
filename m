Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCF08F55
	for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 15:44:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 354AD3FB17;
	Tue, 29 Nov 2022 15:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1669736685; bh=IfCJDDsMxLt3kfJAUMqL3Z5NTpKU0kkU/7mULCjG3/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=b0VCUKLCOQx9ZwxMoDrbbRz3phbpMxUcdB/NcyXHeRfHp0UiBRQDJAEglxY9p/VBe
	 zysSMswCoTy3xEIaDh6anjk9BCGKhkDoJCX5b5VTUxBeScxEmq+iz3zQvaAS6WGEyt
	 MwYuPb1i9ZN1PWgFGRRExzNUS1uS/0hSChvsWkHRCOAjcxlq48wiKNkHIbiU21Xh03
	 32i9jOWLJG9MO+PiVVRdmI+Q1OZTsbxsnBZGABnOgqCctS3KBrKbHFjFdLhP6GFIwW
	 z+hTxRqus18bgYUdTyXyTW3YShyEuzjkMNP+Z6+FHf4DK6Wsgsn6jeHIPX0WGkjyY+
	 dft2sxN5ABHWQ==
Message-ID: <19d69d30-6bf9-aa4a-8f75-4e8f1163bfaf@marcan.st>
Date: Wed, 30 Nov 2022 00:44:38 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/9] nvme: merge nvme_shutdown_ctrl into nvme_disable_ctrl
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: James Smart <james.smart@broadcom.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Sven Peter <sven@svenpeter.dev>,
 asahi@lists.linux.dev, linux-nvme@lists.infradead.org
References: <20221129132208.4337-1-hch@lst.de>
 <20221129132208.4337-4-hch@lst.de>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20221129132208.4337-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/11/2022 22.22, Christoph Hellwig wrote:
> Many of the callers decide which one to use based on a bool argument and
> there is at least some code to be shared, so merge these two.  Also
> move a comment specific to a single callsite to that callsite.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/nvme/host/apple.c  |  5 +----
>  drivers/nvme/host/core.c   | 33 ++++++++++-----------------------
>  drivers/nvme/host/fc.c     |  2 +-
>  drivers/nvme/host/nvme.h   |  3 +--
>  drivers/nvme/host/pci.c    | 15 +++++++++------
>  drivers/nvme/host/rdma.c   |  5 +----
>  drivers/nvme/host/tcp.c    |  5 +----
>  drivers/nvme/target/loop.c |  2 +-
>  8 files changed, 25 insertions(+), 45 deletions(-)
> 

For the Apple and core bits:

Reviewed-by: Hector Martin <marcan@marcan.st>

- Hector
