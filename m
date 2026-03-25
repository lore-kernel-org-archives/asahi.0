Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDA030DEB0;
	Wed, 25 Mar 2026 19:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465424; cv=none; b=Lc4A2M4sGJ60l+GZKKljMWRZekKZbndMHCs+EmFQwocEb/Q1ygOScp97PWpEe859pnJxZNaLHWX+Got0ZuLyWNfg/kJyLSrWjU/KnpbUU2PPMUzQrvEH48L9DgxulwTZYmhE6EyUWIySGF60H4/uMTZO2xv55BOCqHz1dRp5Yrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465424; c=relaxed/simple;
	bh=DgQ3qaC2Lz7JXjgQE5MdN4pJqP27wdH8+jfM7VtghJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7eELOv45/ZhqEBqVWKpz77N7z3F/Qhl00er28PtUyoJ/mB/DBDoAik8lM/IA2MqPcx0JMM3ZtF6NrX3dgP1el6hAFnuRWGwtSXekV80qnzHgCPjWgCEBr5OEutCBJ5rE9KI9vBKp8B80crp9/I57A89QLcT6n7IGjFX+UcSRd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFshch7z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFshch7z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E80C4CEF7;
	Wed, 25 Mar 2026 19:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774465424;
	bh=DgQ3qaC2Lz7JXjgQE5MdN4pJqP27wdH8+jfM7VtghJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFshch7zun/xteEkRaHuQ15A2RKwzQsU7TqxpJBs5M90rWZQZcaLJJVyI28Gk2hNZ
	 gH6rvoYJlLK+ceyM2pvvSlsxv4/kQzMWRL0SqdkLRbxGTQrYkTt4F4n4jK6reDeuqx
	 VYpoK6ZZNbD2Ts4JayS4UEQBD/mH4h7VFnYd4+aSI0NpIT3i793XrHRbf60jawrNDO
	 YdUslpWDAJ7NCczS+u8iPLc5tUmtU69RG8pbam3mw55apHbClnX+CgYtIvMXyM4TiM
	 Dz29XwzIH1TMSASf55aoQ58pOqkq4xR9vzHTqgRLYem6eVZyEgnS4sIYvhNS0KgcBB
	 +udo9tjMHmUUA==
Date: Wed, 25 Mar 2026 13:03:42 -0600
From: Keith Busch <kbusch@kernel.org>
To: Justin Tee <justintee8345@gmail.com>
Cc: hmi.jeon@samsung.com, "axboe@kernel.dk" <axboe@kernel.dk>,
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
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] nvme: Add nvme_setup_cmd to host_path_error
Message-ID: <acQxjZMOqj74yIJf@kbusch-mbp>
References: <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
 <CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p6>
 <945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com>
 <20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c@epcms2p6>
 <CABPRKS8-x6Tfr90inpz1fR0=8a5HD=mkujtfLJ1h9ikEUjTvxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABPRKS8-x6Tfr90inpz1fR0=8a5HD=mkujtfLJ1h9ikEUjTvxg@mail.gmail.com>

On Wed, Mar 25, 2026 at 11:37:44AM -0700, Justin Tee wrote:
> > - After
> > nvme_setup_cmd: \
> > nvme0: qid=0, cmdid=32777, nsid=0, flags=0x0, meta=0x0, \
> > cmd=(nvme_admin_identify cns=1, ctrlid=0)
> > nvme_complete_rq: \
> > nvme0: qid=0, cmdid=32777, res=0x0, retries=0, flags=0x2, status=0x370
> 
> > diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> > index 766e9cc4ffca..378d28b2c971 100644
> > --- a/drivers/nvme/host/core.c
> > +++ b/drivers/nvme/host/core.c
> > @@ -512,6 +512,7 @@ EXPORT_SYMBOL_GPL(nvme_complete_batch_req);
> > blk_status_t nvme_host_path_error(struct request *req)
> > {
> >         nvme_req(req)->status = NVME_SC_HOST_PATH_ERROR;
> > +       nvme_setup_cmd(req->q->queuedata, req);
> >         blk_mq_set_request_complete(req);
> >         nvme_complete_rq(req);
> >         return BLK_STS_OK;
> 
> Since trace_nvme_complete_rq is printing only cmdid to help identify
> the command, why not define a new TRACE_EVENT(nvme_host_path_error,
> ...) in trace.h instead?

Why are we even tracing the completion? I agree the completion without a
submission is confusing, but why don't we just skip tracing the
completion in this condition? The idea for these trace events was to
match up commands dispatched to hardware with the hardware's
posted response, so I'm not sure what value we get by synthesizing both
sides of the events.
