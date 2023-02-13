Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925F8F7C
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 16:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD930C433D2;
	Mon, 13 Feb 2023 16:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676307470;
	bh=UR7BLhxzxj6i6OmgbH5PXqLQzCAqASbsiOTn+MKHOB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NtkoZIf84NYDce1SvfhrWZlg6JgdiM/Mh+zRfdsJdFGHl630lf8ya2iI5QNt3sIoX
	 z5M2ydUVAQJ8XO48hiDrK7rHDtHePgtuSm1CXeyuenRqd+cK+5WHEECnrHNFQkdPmn
	 aP/Nfcbn5hyMzAOJgppysWY1gu2PeWaaQHJDD50EbXfA/Jo2kGiAHkmxXQAK649l7j
	 /2ohGw6u+p1BiXD5svZKW0MOKYCQJbHJ8nAp5LmHrgn5ZRWAbGEgsBsqZrqbFmHakG
	 +4Qa0S6O5v++dj/bn6xnzr6s0qPgPvQGKvVjP3RwKs38X0nsvYTMkLljT9cE+CtgrF
	 jCdbs1qIsSY9A==
Date: Mon, 13 Feb 2023 09:57:45 -0700
From: Keith Busch <kbusch@kernel.org>
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Cc: Daniel Gomez <dagmcr@gmail.com>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>
Subject: Re: max_hw_sectors error caused by recent NVMe driver commit
Message-ID: <Y+psCbPTfF9JkW2c@kbusch-mbp>
References: <BYAPR21MB1688B4BBFCCCD01C016A62D4D7DF9@BYAPR21MB1688.namprd21.prod.outlook.com>
 <CAPsT6hnbAA_uCiVjST8VaPgb6TyfBq9nO2S7OPqJX3=YhzBD9g@mail.gmail.com>
 <BYAPR21MB16882541DC2DA7AB91E58A03D7DD9@BYAPR21MB1688.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR21MB16882541DC2DA7AB91E58A03D7DD9@BYAPR21MB1688.namprd21.prod.outlook.com>

On Mon, Feb 13, 2023 at 04:42:31PM +0000, Michael Kelley (LINUX) wrote:
> Ideally, to support
> 512 Kbyte transfers, you would want 129 segments (to allow for starting in
> the middle of a page as describe above).  But the value of max_segments
> is limited by the NVME driver itself using the value of NVME_MAX_SEGS
> defined in drivers/nvme/host/pci.c.  The value of 127 is chosen to make
> sure that the data structure containing the scatterlist fits in a single page.
> See nvme_pci_alloc_iod_mempool().

Should be 128 possible segements now in -next, but yeah, 129 would be ideal.

The limit confuses many because sometimes user space can sometimes get 512kib
IO to work and other times the same program fails, and all because of physical
memory continuity that user space isn't always aware of. A sure-fire way to
never hit that limit is to allocate hugepages.
