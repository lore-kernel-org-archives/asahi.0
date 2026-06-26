Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A9B2BDC0E
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782457147; cv=none; b=WPQbKtMvUTYLTibo0HivRqwO8p4nH91F/7hsPtqinGIEcL5AyYlWJZmejARDgVq6jqwImWOUN236JV8dphK6331YqNIg+pbXcdbhgH3raWDKb2cREpHsrujAT4oFhAypvS4T1S4qjj/lEPaDe7E4K+JgZ7luMqd2ii/g3TTJtmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782457147; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OToavu1Pnewp+1TBO2qXgKKDly6GnxnmY8r6JKqEHPQd80YJP6I2DR0bS6Oxw5SYnzfQhsdUGF3Ct1IlOlUwjhvIl/4VPWkxKeDcM+mHYO83XtpSj9nVuQDQzbgcConqRL0xAqEZunseEcaQRf0XEFEZhNpypShtba30+HSAoSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0515868B05; Fri, 26 Jun 2026 08:59:00 +0200 (CEST)
Date: Fri, 26 Jun 2026 08:59:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: sven@kernel.org, kbusch@kernel.org, linux-nvme@lists.infradead.org,
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, j@jannau.net,
	neal@gompa.dev, asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, baijiaju1990@gmail.com
Subject: Re: [PATCH v2] nvme-apple: Use acquire/release for queue enabled
 state
Message-ID: <20260626065900.GA11368@lst.de>
References: <20260618021543.3866850-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618021543.3866850-1-hanguidong02@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

