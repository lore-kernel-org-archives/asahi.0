Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B63334C17
	for <asahi@lists.linux.dev>; Thu, 26 Mar 2026 06:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774505688; cv=none; b=KBfukGmhPUiK/EkMm/CHWJGdO3RKQW0u0/ar3+mfhCd7IQXyTmtXP4uAhQwe+ejClTR77s12gCSIN25GRUPpJXEIKU3jQ5dfVEfpb+ftfRVkI7EObLTzVL5OWn7pts9TAWcPfCPD8PctgmfaDzCTTPBsNB4k7fn99Y5GcO1hQA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774505688; c=relaxed/simple;
	bh=iisz4mKBWZ6ZlsTUWCidgW7nsyrwFExTdeIzJmODUCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErChpFupoIzgpw3anuXpPYZZTncICpMmq50s8rkDgzNGmt1oDaiU9zmWLCmUj2fZb3CnNPl4I3iiU6OzeMw29qNpuM3jDsJkDh74M5jTDYeTV228q+CHdxUCZqovC4JKTK9UGehvuuJpaRXw8nWR/qiK3WSB1bP2u7k47RxlHCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4815768B05; Thu, 26 Mar 2026 07:14:43 +0100 (CET)
Date: Thu, 26 Mar 2026 07:14:43 +0100
From: "hch@lst.de" <hch@lst.de>
To: =?utf-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
Cc: Keith Busch <kbusch@kernel.org>, Justin Tee <justintee8345@gmail.com>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	"sven@kernel.org" <sven@kernel.org>, "j@jannau.net" <j@jannau.net>,
	"neal@gompa.dev" <neal@gompa.dev>, "hch@lst.de" <hch@lst.de>,
	"sagi@grimberg.me" <sagi@grimberg.me>,
	"justin.tee@broadcom.com" <justin.tee@broadcom.com>,
	"nareshgottumukkala83@gmail.com" <nareshgottumukkala83@gmail.com>,
	"paul.ely@broadcom.com" <paul.ely@broadcom.com>,
	James Smart <james.smart@broadcom.com>,
	"kch@nvidia.com" <kch@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?7J207J2A7IiY?= <euns212.lee@samsung.com>,
	=?utf-8?B?7Lm47LCs?= <joshi.k@samsung.com>
Subject: Re: [PATCH v4] nvme: Skip trace complete_rq on host path error
Message-ID: <20260326061443.GA23850@lst.de>
References: <acQxjZMOqj74yIJf@kbusch-mbp> <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4> <945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com> <20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c@epcms2p6> <CABPRKS8-x6Tfr90inpz1fR0=8a5HD=mkujtfLJ1h9ikEUjTvxg@mail.gmail.com> <CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p1> <20260326014429epcms2p135ffd3c2b2fface6423d045e9614c262@epcms2p1>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326014429epcms2p135ffd3c2b2fface6423d045e9614c262@epcms2p1>
User-Agent: Mutt/1.5.17 (2007-11-01)

> -	trace_nvme_complete_rq(req);
> +	if (nvme_req(req)->status != NVME_SC_HOST_PATH_ERROR)
> +		trace_nvme_complete_rq(req);
> +

Please add a comment here explaining why we need the check.

