Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CF76A327
	for <asahi@lists.linux.dev>; Thu, 21 Dec 2023 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id AEAFE68BFE; Thu, 21 Dec 2023 13:17:46 +0100 (CET)
Date: Thu, 21 Dec 2023 13:17:46 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>, marcan@marcan.st, sven@svenpeter.dev,
	kbusch@kernel.org, axboe@kernel.dk, james.smart@broadcom.com,
	alyssa@rosenzweig.io, asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org, kch@nvidia.com
Subject: Re: [PATCH] nvme: don't set a virt_boundary unless needed
Message-ID: <20231221121746.GA17956@lst.de>
References: <20231221084853.1175482-1-hch@lst.de> <155ec506-ede8-42c7-95f7-e8be32800a8d@grimberg.me>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155ec506-ede8-42c7-95f7-e8be32800a8d@grimberg.me>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Dec 21, 2023 at 11:30:38AM +0200, Sagi Grimberg wrote:
>
>> NVMe PRPs are a pain and force the expensive virt_boundary checking on
>> block layer, prevent secure passthrough and require scatter/gather I/O
>> to be split into multiple commands which is problematic for the upcoming
>> atomic write support.
>
> But is the threshold still correct? meaning for I/Os small enough the
> device will have lower performance? I'm not advocating that we keep it,
> but we should at least mention the tradeoff in the change log.

Chaitanya benchmarked it on the first generation of devices that
supported SGLs.  On the only SGL-enabled device I have there is no
performance penality for using SGLs on small transfer, but I'd love
to see numbers from other setups.

>> For nvme-rdma the virt boundary is always required, as RMDA MRs are just
>> as dumb as NVMe PRPs.
>
> That is actually device dependent. The driver can ask for a pool of
> mrs with type IB_MR_TYPE_SG_GAPS if the device supports IBK_SG_GAPS_REG.
>
> See from ib_srp.c:
> --
>        if (device->attrs.kernel_cap_flags & IBK_SG_GAPS_REG)
>                 mr_type = IB_MR_TYPE_SG_GAPS;
>         else
>                 mr_type = IB_MR_TYPE_MEM_REG;
> --

For that we'd need to support IB_MR_TYPE_SG_GAPS gaps first, which can
be done as an incremental improvement.

>>   +	/*
>> +	 * nvme-apple always uses PRPs and thus needs to set a virt boundary.
>> +	 */
>> +	set_bit(NVME_CTRL_VIRT_BOUNDARY_IO, &anv->ctrl.flags);
>> +	set_bit(NVME_CTRL_VIRT_BOUNDARY_ADMIN, &anv->ctrl.flags);
>> +
>
> Why two flags? Why can't the core just always set the blk virt boundary
> on the admin request queue?

It could, and given that the admin queue isn't performance critical it
probably won't hurt in reality.  But why enforce a really weird limit
on the queue if there is no reason for it?  The only transport that
treats the admin queue different is PCIe, and that's just a spec
oddity.
