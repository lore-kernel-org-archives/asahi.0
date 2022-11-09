Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369C6EC0C
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 17:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7703BC433D6;
	Wed,  9 Nov 2022 17:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668013261;
	bh=sVFBQy+y379XCQ/u8pvwmu13MGl3CE6h+Ph3ingwOWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XS++TUs62Bia6YhlOz5VRjMrJCrsm8tepTzjtZ8hFG7uQ3JTExQWij6JG5dgoY9mi
	 ye+IWQfOsZ7yieYXjG1eGWvNAmNpyE2f70yWTDtI1ryAIZnSqKLuUE0KNKRjFrtSM6
	 HC/YIevKUO3uanpDSKYIpqtUYpsGecYj0dNvncXI+5bQq0ou+ylvo1rUZVmSYC8p1V
	 rJkq+2JaDEBbepTKZg2vyK7IVeMyq+dbTZFKMeddFexeDI2FHAA4ppjrAqLCR9vMgs
	 R3AXeTJV9JbuRiFbZjRkYPAJ4LBWsTWAvSIb5xttCWaRD5CUx5fJGXXQ/u3wQi5VLp
	 MYtxc/MrbtAgA==
Date: Wed, 9 Nov 2022 10:00:57 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 11/12] nvme-pci: split the initial probe from the rest
 path
Message-ID: <Y2vcyaOvD9M/5CEA@kbusch-mbp.dhcp.thefacebook.com>
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-12-hch@lst.de>
 <e1225fb6-0cac-ba47-df03-0be84cb3a09b@grimberg.me>
 <20221109063119.GG10528@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109063119.GG10528@lst.de>

On Wed, Nov 09, 2022 at 07:31:19AM +0100, Christoph Hellwig wrote:
> On Wed, Nov 09, 2022 at 05:14:02AM +0200, Sagi Grimberg wrote:
> >> -		if (dev->online_queues > 1) {
> >> -			nvme_pci_alloc_tag_set(dev);
> >> -			nvme_dbbuf_set(dev);
> >> -		} else {
> >> -			dev_warn(dev->ctrl.device, "IO queues not created\n");
> >> -		}
> >> +		dev_warn(dev->ctrl.device, "IO queues lost\n");
> >> +		nvme_mark_namespaces_dead(&dev->ctrl);
> >> +		nvme_start_queues(&dev->ctrl);
> >> +		nvme_remove_namespaces(&dev->ctrl);
> >
> > Is this needed? isn't nvme_remove coming soon?
> > In fact, shouldn't all these calls be in nvme_remove?
> 
> This handles the case where a controller controller does not have I/O
> queues. For controllers that never had them (e.g. admin controllers)
> none of the three calls above is needed, but they deal with the
> case where a controller had queues, but they are going away.  I'm
> not sure if that can happen, but it keeps the behavior of the existing
> code.  Keith wrote it to deal with Intel controllers that can be in
> a degraded state where having the admin queue live even without I/O
> queues allows updating the firmware, so he might know more.

Right, firmware assert and other types of errors can put the controller
into a degraded state with only an admin-queue when it previously had
working IO queues. Keeping the admin queue active allows an admin to
pull logs for their bug reports.
