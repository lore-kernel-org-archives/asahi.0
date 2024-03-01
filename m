Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE5A6F523
	for <asahi@lists.linux.dev>; Fri,  1 Mar 2024 16:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709310035; cv=none; b=l1sg8SRipSNcx2XfNJSb1exBH9+W5cGj+l/nGTT/oKnTq3fJGlasgy62/EgGH8wvrqnMbjU2X6l+9Bl3iAaD4ykRoSacKn+XX9C5XjsSk90qFyJEoErj5OuvyqvLGjZRZI+QiGAohhKwyamzGc7kgEcRIpBZVaETYVuZ4AZcOic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709310035; c=relaxed/simple;
	bh=Q/6VTHUKNf9I9FR2ySABVg9EyTZVleFCvryEkQoiKKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGW7zA5Zy/FGESIRTO4PrJU/pV6UcU/T3Ef77QE2Cq5sTMP/F40mK9GaK3FvpbpS9WyHbpsEJtz7fYKMuNM2PBV16xhQcdg+6OyJRHYFkTKDKu9U03K+SWXMqo/qZ3OuTCDQs9dsK0HRw5qs2SWay0Z8D3YXzYVV9njR9Ni2RLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppqohgi3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppqohgi3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387BAC433F1;
	Fri,  1 Mar 2024 16:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709310034;
	bh=Q/6VTHUKNf9I9FR2ySABVg9EyTZVleFCvryEkQoiKKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ppqohgi3b4Z5DCU8Ta0SyRg9u6t5r4/HdbdcfJPZ54w/JS2bRcH/hsEEHBhfmfnBm
	 mZvZPjP4Ru6eAQeL4VRWjgLPZ7jvzPJjMItuZI+DDu8x1dUp7lBwEOoIFxu0+nwwWN
	 p8bz9SGCJbVhiMajfgwmVfyPGbq6XXGxxPxBfjOdBjN5RUwX1CckMkJQ8EK+Z8Z7Q2
	 Rt407m0SnOA2251ur2MjHeRGkaw/NHTXGlxElGixKkTDFkxbSPFF+PWL4OvbBbs56d
	 fBVutx11VumgV4ZlEJVwCPjo0G6YmO5JCDsjWj2Jho04QPgO7mcejFGAfwHqd8JUek
	 gV3B89gdT3IMg==
Date: Fri, 1 Mar 2024 09:20:31 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: Re: convert nvme to atomic queue limits updates
Message-ID: <ZeIAT5uY36cLkVpJ@kbusch-mbp.mynextlight.net>
References: <20240228181215.873854-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240228181215.873854-1-hch@lst.de>

On Wed, Feb 28, 2024 at 10:11:54AM -0800, Christoph Hellwig wrote:
> Hi all,
> 
> this series converts nvme to the new atomic queue limit updates, and
> as part of that refactors a lot of the setup code.  The first two
> patches are block layer patches already sent out as part of the md
> queue limits conversion and will hopefully get merged into Jens' tree
> soon.

The whole series looks good. I see Jens has got the first two patches,
so I'll rebase nvme-6.9 to that and apply the rest of the nvme patches.
