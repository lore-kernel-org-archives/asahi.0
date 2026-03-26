Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2742C3FCB1B;
	Thu, 26 Mar 2026 14:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536211; cv=none; b=WEiR9H32SnHetxVke5wInZwGaMGSDTFqDYshkIm7ZY07dYtctz/1X/fCHs7d9uryPXBDSez+lH9I7xqavY24l7H4EoEbWBdi7rPkw4UY67+pwpPpTOmq2QR/QvhWXt+Tw1AKcb+1Aj2g7D/JUyVnDDdBWP4osFEitiuNWcyxFB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536211; c=relaxed/simple;
	bh=QCP4s4j85foSGpz3Jg5C2WeljmjT3n1LUgByDDCaay0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6QRLGbamsZJWPlAYXryQfuwcnfqeQw+9DNjmY3JPfjwI3q53zuQadwCLAl12vJvzg7OTxCe+UMIPwa0RFv02lqxtStp/EebwguGwnP++mXZNeCKUI9DOdfAtvYDZnxN/m2GMG2+dMe4KM8FHCa1GmKoLSFginxTcdiMuFWkCQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFFU9k4Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFFU9k4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37262C116C6;
	Thu, 26 Mar 2026 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774536211;
	bh=QCP4s4j85foSGpz3Jg5C2WeljmjT3n1LUgByDDCaay0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NFFU9k4Q9jFBVoJNp/Q3T+UOUF/TqBkwaUXEIUoxafyytcHSsU1+sCaPAJ6v9sD2b
	 W/N14Tjytjd+HUiI+f4fu30PhI7H0uzEeJQ9w9xE6CWPScA9w5yez3QW29xmsyiHbu
	 /Nfae9vgoUTW0Js1ml52Koj8z1jzlsPLrA47WpBXuTiSL0jS9AHQhvm+VIAv8vZsG6
	 eB38zs2Lw1Y6MFk02nDjnelv3vUE6Lz0HBLLod18p/Nir7JyUB4XaNYgRJSupZNkct
	 nyqqKQvEG+UPXSaRHdP/Q8SxjQlwt3IkCCDEX8Gf2aK7rN4Zog9Qs32XO+av5Xtwu/
	 6xVRVHfdozfoQ==
Date: Thu, 26 Mar 2026 08:43:28 -0600
From: Keith Busch <kbusch@kernel.org>
To: "hch@lst.de" <hch@lst.de>
Cc: =?utf-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>,
	Justin Tee <justintee8345@gmail.com>,
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
Message-ID: <acVGECskf5pg3_MY@kbusch-mbp>
References: <acQxjZMOqj74yIJf@kbusch-mbp>
 <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
 <945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com>
 <20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c@epcms2p6>
 <CABPRKS8-x6Tfr90inpz1fR0=8a5HD=mkujtfLJ1h9ikEUjTvxg@mail.gmail.com>
 <20260326014429epcms2p135ffd3c2b2fface6423d045e9614c262@epcms2p1>
 <CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p5>
 <20260326065152epcms2p51a18d3bbecb6eb6dc2ddba09651e5152@epcms2p5>
 <acVCnozG1WKPkq1L@kbusch-mbp>
 <20260326143124.GA17507@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260326143124.GA17507@lst.de>

On Thu, Mar 26, 2026 at 03:31:24PM +0100, hch@lst.de wrote:
> On Thu, Mar 26, 2026 at 08:28:46AM -0600, Keith Busch wrote:
> > On Thu, Mar 26, 2026 at 03:51:52PM +0900, 전민식 wrote:
> > >  {
> > >  	struct nvme_ctrl *ctrl = nvme_req(req)->ctrl;
> > >  
> > > -	trace_nvme_complete_rq(req);
> > > +	/*
> > > +	 * The idea for these trace events was to match up commands
> > > +	 * dispatched to hardware with the hardware's posted response.
> > > +	 * So skip tracing for undispatched commands.
> > > +	 */
> > > +	if (nvme_req(req)->status != NVME_SC_HOST_PATH_ERROR)
> > > +		trace_nvme_complete_rq(req);
> > > +
> > 
> > Well, how do we know a controller doesnn't actually return that status
> > code? I was just suggesting to skip the trace for the condition we never
> > dispatched the command. An added bonus is we don't need a mostly
> > unnecessary 'if' check on every IO.
> 
> The 7?h error values were added for host use.  The description of
> the section in the spec suggests this, but isn't actually as clear
> as I would like it.  I wonder if we need to verify that controller
> don't incorrectly return it, as that could cause some problems?

Yeah, the spec is not very clear on their use. It just defines the codes
and a one sentence description, and then never mentioned again. I think
it allows the possibility for the controller to internally complete a
command with such status from some undefined OOB mechanism. I'm not sure
why the host needs to have their own self-generated status codes anyway
since it can already attach whatever arbitrary flags it wants to its
private data, like how we use NVME_REQ_CANCELLED.

Anyway if a controller did return it for whatever reason, even if it is
a bug, we'd want to see it in the trace.
