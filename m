Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758C8548E0
	for <asahi@lists.linux.dev>; Sat,  2 Mar 2024 23:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709421683; cv=none; b=OUiWf69Nhorb07emJwDWeEIn0t+5q6SEMggpcgZ6v4frNKLjnivqrPZh0dcCwMxtXuK6S4yab2iGXeugzMgy7fEBIg8ohIyx79D9EoWViPAxXOuJqbd+tnuB93WAvD2dcQVqrha8sQMo4Rm+WeTPSYJRUDMDTrpqyLZFSwbdcug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709421683; c=relaxed/simple;
	bh=5S6aPJcuADaPieaJpVdRKfONG5QbuyZIOnf8f0bJyhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/iY4wJgfxszXLPSVcdIdGtTWWxu18WL2hCL709J6o0ISAY7vPqsMedKV8o5OhskM9kCVogVNsxS3z9sCEvH6Tuy68yOfT/t9uH1ijqATADVlX1B85zvaO/lXkeTlI9xKiID6LhsmRk1FfdBRmkAAxZUiFWXTEj94TK4Rc662Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBR19Gk9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBR19Gk9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608D8C433C7;
	Sat,  2 Mar 2024 23:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709421683;
	bh=5S6aPJcuADaPieaJpVdRKfONG5QbuyZIOnf8f0bJyhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CBR19Gk9EXhxiiYnXyRdIoNkqkyiDd4T6oB/K/TgWRWFX+hfcx+ceOu4jB+6u/Xxt
	 j0f3nTnlaAOQnrSQNqfSN3ugCMi87dsndNtcd6bIKcsEnZ4JU6ljD9eukMpkRzTVXf
	 HKovenoQRQWpc1EraX+Q6bc0dIN1/5DCiFPEt/AnB1+8l+lya1GIZmJ05zh8yD8YI6
	 w9Njy557TGywMIw9oHqH+08Paow5wpwtI0iHK7SfaS66FHFmu/KI0G/urC82yXRVQN
	 ePK8MsJ6bjnKxXNdwi3ikQu9gRKr+HU24qefXbIj5+XvSDNjWrcz87I09vx1/Rh9h1
	 N+C6ia79CeRpw==
Date: Sat, 2 Mar 2024 16:21:20 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: Re: convert nvme to atomic queue limits updates
Message-ID: <ZeO0cFhlk89qEzXq@kbusch-mbp.mynextlight.net>
References: <20240228181215.873854-1-hch@lst.de>
 <ZeIAT5uY36cLkVpJ@kbusch-mbp.mynextlight.net>
 <20240302135954.GA1072@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240302135954.GA1072@lst.de>

On Sat, Mar 02, 2024 at 02:59:54PM +0100, Christoph Hellwig wrote:
> On Fri, Mar 01, 2024 at 09:20:31AM -0700, Keith Busch wrote:
> > 
> > The whole series looks good. I see Jens has got the first two patches,
> > so I'll rebase nvme-6.9 to that and apply the rest of the nvme patches.
> 
> I had to fix up the little thing Max noticed an also added another
> patch for multuipath.  I'll resend with those updates once you
> rebased.

Done, nvme-6.9 is rebased to the current for-6.9/block.
