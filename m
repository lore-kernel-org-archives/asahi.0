Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56163806AF
	for <asahi@lists.linux.dev>; Thu, 26 Mar 2026 14:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535493; cv=none; b=jVnoyMY25tyvThehBxE9p7A9VfNSIzM+Vw+fbDIA9t7/VSfOj+GZn1a62AdgeMl+mJf/LAyfOwn2C0GU2sCxweWRDpYgeVP+2IUHnFo8A5zQbyiMlMqawWvrmFsML7PNuPpSsSMHpocdOyrID4hMkdYD45vsoQylS9Z7B28E1Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535493; c=relaxed/simple;
	bh=NalN8QnkNN12kPrYtrUiFZQwrkFHEExxf6Oud+CjEgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgLAVGUdR/q5c6UGNpaeYGqhcOowfDPOuPqV8a7WDrWLGxV/Q0DjZvP7hiGjjntw/lxreZSINRyLR8Ars9SAY63jW5AnXbbBihJRLlIg1D+0Pqk56F3xeaWKGQgcyhhhrY6rFGVYePKzP6TGSZ4S4YUkTlGN3iQO3JcbBRIRWUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7013B68CFE; Thu, 26 Mar 2026 15:31:24 +0100 (CET)
Date: Thu, 26 Mar 2026 15:31:24 +0100
From: "hch@lst.de" <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: =?utf-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>,
	"hch@lst.de" <hch@lst.de>, Justin Tee <justintee8345@gmail.com>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	"sven@kernel.org" <sven@kernel.org>, "j@jannau.net" <j@jannau.net>,
	"neal@gompa.dev" <neal@gompa.dev>,
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
Subject: Re: [PATCH v5] nvme: Skip trace complete_rq on host path error
Message-ID: <20260326143124.GA17507@lst.de>
References: <20260326061443.GA23850@lst.de> <acQxjZMOqj74yIJf@kbusch-mbp> <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4> <945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com> <20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c@epcms2p6> <CABPRKS8-x6Tfr90inpz1fR0=8a5HD=mkujtfLJ1h9ikEUjTvxg@mail.gmail.com> <20260326014429epcms2p135ffd3c2b2fface6423d045e9614c262@epcms2p1> <CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p5> <20260326065152epcms2p51a18d3bbecb6eb6dc2ddba09651e5152@epcms2p5> <acVCnozG1WKPkq1L@kbusch-mbp>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acVCnozG1WKPkq1L@kbusch-mbp>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Mar 26, 2026 at 08:28:46AM -0600, Keith Busch wrote:
> On Thu, Mar 26, 2026 at 03:51:52PM +0900, 전민식 wrote:
> >  {
> >  	struct nvme_ctrl *ctrl = nvme_req(req)->ctrl;
> >  
> > -	trace_nvme_complete_rq(req);
> > +	/*
> > +	 * The idea for these trace events was to match up commands
> > +	 * dispatched to hardware with the hardware's posted response.
> > +	 * So skip tracing for undispatched commands.
> > +	 */
> > +	if (nvme_req(req)->status != NVME_SC_HOST_PATH_ERROR)
> > +		trace_nvme_complete_rq(req);
> > +
> 
> Well, how do we know a controller doesnn't actually return that status
> code? I was just suggesting to skip the trace for the condition we never
> dispatched the command. An added bonus is we don't need a mostly
> unnecessary 'if' check on every IO.

The 7?h error values were added for host use.  The description of
the section in the spec suggests this, but isn't actually as clear
as I would like it.  I wonder if we need to verify that controller
don't incorrectly return it, as that could cause some problems?

Independent of that your patch below looks sane to me.

