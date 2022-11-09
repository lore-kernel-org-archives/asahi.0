Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A5A17E
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 06:31:23 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9EDF068AFE; Wed,  9 Nov 2022 07:31:19 +0100 (CET)
Date: Wed, 9 Nov 2022 07:31:19 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 11/12] nvme-pci: split the initial probe from the rest
 path
Message-ID: <20221109063119.GG10528@lst.de>
References: <20221108150252.2123727-1-hch@lst.de> <20221108150252.2123727-12-hch@lst.de> <e1225fb6-0cac-ba47-df03-0be84cb3a09b@grimberg.me>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1225fb6-0cac-ba47-df03-0be84cb3a09b@grimberg.me>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 09, 2022 at 05:14:02AM +0200, Sagi Grimberg wrote:
>> -		if (dev->online_queues > 1) {
>> -			nvme_pci_alloc_tag_set(dev);
>> -			nvme_dbbuf_set(dev);
>> -		} else {
>> -			dev_warn(dev->ctrl.device, "IO queues not created\n");
>> -		}
>> +		dev_warn(dev->ctrl.device, "IO queues lost\n");
>> +		nvme_mark_namespaces_dead(&dev->ctrl);
>> +		nvme_start_queues(&dev->ctrl);
>> +		nvme_remove_namespaces(&dev->ctrl);
>
> Is this needed? isn't nvme_remove coming soon?
> In fact, shouldn't all these calls be in nvme_remove?

This handles the case where a controller controller does not have I/O
queues. For controllers that never had them (e.g. admin controllers)
none of the three calls above is needed, but they deal with the
case where a controller had queues, but they are going away.  I'm
not sure if that can happen, but it keeps the behavior of the existing
code.  Keith wrote it to deal with Intel controllers that can be in
a degraded state where having the admin queue live even without I/O
queues allows updating the firmware, so he might know more.
