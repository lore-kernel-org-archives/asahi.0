Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E2B482EF
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709569661; cv=none; b=T0+rZ5sIWDSnVVEMZFVxEueXjtn/V7DTITWaRlvzUFT7g2/ZV3OPpOYPzTLOVypk5mfw4F4xkQvt2DBOJSwJAr1Vs2LAaNkO4mvn5m+84nnRpF5w/F8QSAH/biGykF5uynMN1GtBQAA2ohu13Njb3CCoW4BxHy4fELNWbVCT/is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709569661; c=relaxed/simple;
	bh=ErpHc1wY2DdF0bf6Q9UhJU+DPezctKIzUn/CC0SyCKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZc8gx/s3WynSz+kVKEbq2lac/7Kdm4TvHyiibKu/aZuEWl3AIlnIHWP5b6eaDD/U510vUJPMxFoB4E616ufvs5iCHsfKOissX4Lq75aK+q0SwD0tYCq3T/0/14pbS/pfpe0+/xKz+LEJMZoF0DQZg8XOPVfoAWDGg4KIHyhc58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/nwn9cQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/nwn9cQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8620C433F1;
	Mon,  4 Mar 2024 16:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709569660;
	bh=ErpHc1wY2DdF0bf6Q9UhJU+DPezctKIzUn/CC0SyCKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/nwn9cQfmkoewWXmnWsIMp/UwRQcvCtKIXpUxU+/8LNmGzYSUOmxH1nKnJC3IMTb
	 2oIpIqzB9xKp+qF/oHxzsV6PeI588pEdOkzrssvH4QbKOseONm+FkOz489N0PgKbfH
	 CMwYc8vLZMnU8WQcfJIWxKArKNj+8q7n6ckQKov0uhoi/9lHyk9Hdna87Up0o+G1Ka
	 Ow2jR8LFFWLFj61I4f2+feaL2nFj7lkOjodmVzw3+tZEG5ip8xx1sid9WCytor4AM2
	 yYyyOJGLwqJZ+2sHytn5EpRJYRWCILwVl/WoOARLaMYTLILafuvsKPUh+qntKEfxsR
	 +AeILfxpRV6sQ==
Date: Mon, 4 Mar 2024 09:27:37 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: Re: convert nvme to atomic queue limits updates v2
Message-ID: <ZeX2eSKE5OSAgbGh@kbusch-mbp.mynextlight.net>
References: <20240304140500.78583-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304140500.78583-1-hch@lst.de>

Thanks, applied to nvme-6.9.
