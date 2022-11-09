Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAD920FD
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 06:28:47 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7557C68AFE; Wed,  9 Nov 2022 07:28:44 +0100 (CET)
Date: Wed, 9 Nov 2022 07:28:44 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 07/12] nvme-pci: factor out a nvme_pci_alloc_ctrl helper
Message-ID: <20221109062844.GF10528@lst.de>
References: <20221108150252.2123727-1-hch@lst.de> <20221108150252.2123727-8-hch@lst.de> <b3cea6d6-f76e-8295-3537-a5b125b74bf4@grimberg.me>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3cea6d6-f76e-8295-3537-a5b125b74bf4@grimberg.me>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 09, 2022 at 05:03:19AM +0200, Sagi Grimberg wrote:
>>   -static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id 
>> *id)
>> +static struct nvme_dev *nvme_pci_alloc_ctrl(struct pci_dev *pdev,
>> +		const struct pci_device_id *id)
>
> kinda weird that nvme_pci_alloc_ctrl return struct nvme_dev. Patch looks
> fine though...

We can call it alloc_dev instead.  But that whole nvme_dev naming is weird,
it really should be nvme_pci_ctrl.
