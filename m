Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B9220FD
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 06:28:12 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 143A868AFE; Wed,  9 Nov 2022 07:28:09 +0100 (CET)
Date: Wed, 9 Nov 2022 07:28:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 04/12] nvme-pci: put the admin queue in
 nvme_dev_remove_admin
Message-ID: <20221109062808.GE10528@lst.de>
References: <20221108150252.2123727-1-hch@lst.de> <20221108150252.2123727-5-hch@lst.de> <679cf80b-3e30-e393-d5c4-d3941e853bfb@grimberg.me>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <679cf80b-3e30-e393-d5c4-d3941e853bfb@grimberg.me>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 09, 2022 at 04:58:46AM +0200, Sagi Grimberg wrote:
>> @@ -2774,8 +2775,6 @@ static void nvme_pci_free_ctrl(struct nvme_ctrl *ctrl)
>>     	nvme_dbbuf_dma_free(dev);
>>   	nvme_free_tagset(dev);
>> -	if (dev->ctrl.admin_q)
>> -		blk_put_queue(dev->ctrl.admin_q);
>
> Is the check here valid? meaning can we get here with
> a NULL admin_q?

Yes, the admin queue is only set in the middle of nvme_reset_work,
and for errors before that we can get here.
