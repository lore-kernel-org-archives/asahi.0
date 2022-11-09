Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BF4290F
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 20:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1145AC433D6;
	Wed,  9 Nov 2022 20:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668026655;
	bh=krm+75IOYB/iIhFh/VU9m61Q/TCK0v9yEKPn/PEB9xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbl0oWDNiPapNSR7NeSHk/ICzF6ywlXQzb+V/kH1H7MbuT6A3BBFNyFyCRWmEB48V
	 kPVgAwXkhEJUy5p+RtbYrMu2cssFZiklqtTSlMHNfO4ss4qlx9dq0ErKbNUqKjYyVP
	 FkkRQkx64oBvup3t/HeEj79VEHTNZabq2NlVwFqXxXWytKozx59vuHVnmMq7Ybv9uZ
	 EHJSJYlvgOqiK/EqD3z4+4pcPhd0rO3prbHhr4X5GRtr71996U26feNRaBOEHPhJIc
	 6uO2yEppYq+Lvk7uuA31bnwoFkn3dzAatP5247dYu8qR0BQubhx+W6mOPgbuGAJMvv
	 IpAP+ekGh6Xyw==
Date: Wed, 9 Nov 2022 13:44:12 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 02/12] nvme: move OPAL setup from PCIe to core
Message-ID: <Y2wRHHdAGHqJA/7Q@kbusch-mbp.dhcp.thefacebook.com>
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-3-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108150252.2123727-3-hch@lst.de>

On Tue, Nov 08, 2022 at 04:02:42PM +0100, Christoph Hellwig wrote:
> -#ifdef CONFIG_BLK_SED_OPAL
> -int nvme_sec_submit(void *data, u16 spsp, u8 secp, void *buffer, size_t len,
> +static int nvme_sec_submit(void *data, u16 spsp, u8 secp, void *buffer, size_t len,
>  		bool send)
>  {
>  	struct nvme_ctrl *ctrl = data;
> @@ -2198,8 +2197,21 @@ int nvme_sec_submit(void *data, u16 spsp, u8 secp, void *buffer, size_t len,
>  	return __nvme_submit_sync_cmd(ctrl->admin_q, &cmd, NULL, buffer, len,
>  			NVME_QID_ANY, 1, 0);
>  }
> -EXPORT_SYMBOL_GPL(nvme_sec_submit);
> -#endif /* CONFIG_BLK_SED_OPAL */

It looks like you need to keep the #ifdef. The compiler knows it's not
used without it:

  drivers/nvme/host/core.c:2183:12: warning: 'nvme_sec_submit' defined but not used [-Wunused-function]
   static int nvme_sec_submit(void *data, u16 spsp, u8 secp, void *buffer, size_t len,

> +static void nvme_configure_opal(struct nvme_ctrl *ctrl, bool was_suspended)
> +{
> +	if (!IS_ENABLED(CONFIG_BLK_SED_OPAL))
> +		return;
> +	if (ctrl->oacs & NVME_CTRL_OACS_SEC_SUPP) {
> +		if (!ctrl->opal_dev)
> +			ctrl->opal_dev = init_opal_dev(ctrl, &nvme_sec_submit);
> +		else if (was_suspended)
> +			opal_unlock_from_suspend(ctrl->opal_dev);
> +	} else {
> +		free_opal_dev(ctrl->opal_dev);
> +		ctrl->opal_dev = NULL;
> +	}
> +}
