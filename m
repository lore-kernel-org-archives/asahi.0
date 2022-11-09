Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3C3EC0E
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 17:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0BDC433C1;
	Wed,  9 Nov 2022 17:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668013860;
	bh=Y/chigTvldaMfDzJBgq7bIq+lAfxioU20iM0wD7rkDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7nkfAeZE73fdoiE25aprxMIVrfFKXC5d49uJApcdAtr2VERokWrLi/yINwUm87c5
	 DTRLYKArV+NOC+Eu5Ym2ZKZ1zUX09wbiAzquGgj4DhRweYr+Mf3cpv5jXPMhySL969
	 ZwQr60eA1O5L0CTFW8qXk/NTtYSgBW3+YXxImNtCPP8+AdK3TvP7bB9omv/6wm1Y3Z
	 DMYHz1cRBL8rCg8UBQT+y3F82Da9PpC0hnIIxdX0jzFHAjVEsV9IpzEP26UYzwngSO
	 +aFB3u2kjc92c3Wr1PZVWKNXMv/NxmCCVF4dfv23lUf2xUMyWUnjxIvnB6opd/Fr2m
	 ZTDVTKqpQV4NQ==
Date: Wed, 9 Nov 2022 10:10:57 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 12/12] nvme-pci: don't unbind the driver on reset failure
Message-ID: <Y2vfIS5jLXwAjV+s@kbusch-mbp.dhcp.thefacebook.com>
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-13-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108150252.2123727-13-hch@lst.de>

On Tue, Nov 08, 2022 at 04:02:52PM +0100, Christoph Hellwig wrote:
> -static void nvme_remove_dead_ctrl_work(struct work_struct *work)
> -{
> -	struct nvme_dev *dev = container_of(work, struct nvme_dev, remove_work);
> -	struct pci_dev *pdev = to_pci_dev(dev->dev);
> -
> -	if (pci_get_drvdata(pdev))
> -		device_release_driver(&pdev->dev);
> -	nvme_put_ctrl(&dev->ctrl);
> +	/*
> +	 * Set state to deleting now to avoid blocking nvme_wait_reset(), which
> +	 * may be holding this pci_dev's device lock.
> +	 */
> +	dev_warn(dev->ctrl.device, "Disabling device after reset failure: %d\n",
> +		 result);
> +	nvme_change_ctrl_state(&dev->ctrl, NVME_CTRL_DELETING);
> +	nvme_dev_disable(dev, false);

I think the shutdown can be set to 'true' now that you're not
immediately unbinding the controller. That will unblock any queued IO
that would have been flushed out during the unbind.
