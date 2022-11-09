Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE41EBEE
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 15:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A03C433D6;
	Wed,  9 Nov 2022 15:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668009088;
	bh=Vk2ZZ3agqZ4nabmZlagJmePBsOimEQy2GQK/lbJ9HbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XYCBDGte88HHfnc9cGKfhc2BNWmUwzzobQugNDgpGi+A7FsvBnngRJny6JgSifEDW
	 m3fB2FtrOMtp9P7R903WZgliqDy0wKdZKDuJ7i7ms0kIvHSj/9IwkwQwfi9oIbm7zR
	 QFkOe2mL1zOSeIRuzzmOL+bWCk19QxzORBHRAuXO2vIgLrgi5Dnmvvi6UCWphIUnri
	 +5UTZyf0dss1mwfOVS1roY6btvw7nkFGaLSFbUHMtPrAn0xQ0OrGwp9KBKeRmOEANz
	 g9lXuVFg7xVrFbtWxZFJn4If0Yfe4AlnLFTD9kGDxosB+WltXmwuvf72IThvfYfjOf
	 kXqP23r47QyRw==
Date: Wed, 9 Nov 2022 08:51:25 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 11/12] nvme-pci: split the initial probe from the rest
 path
Message-ID: <Y2vMfSCjCj8sCMj/@kbusch-mbp.dhcp.thefacebook.com>
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-12-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108150252.2123727-12-hch@lst.de>

On Tue, Nov 08, 2022 at 04:02:51PM +0100, Christoph Hellwig wrote:
> nvme_reset_work is a little fragile as it needs to handle both resetting
> a live controller and initializing one during probe.  Split out the initial
> probe and open code it in nvme_probe and leave nvme_reset_work to just do
> the live controller reset.

By enabling the controller in probe, you are blocking subsequent
controllers from probing in parallel. Some devices take a very long time
to complete enable, so serializing this process may significantly
increase a system reset time for one with even a modest number of nvme
drives.
