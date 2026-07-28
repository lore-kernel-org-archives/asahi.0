Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC15409623;
	Tue, 28 Jul 2026 21:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785272777; cv=none; b=AvUvfufTw2V/Sm6fCKo7/0HEs18utS9ZZ4vMAJ0b0wkdk5WDecSY+0L3lr9WeZhtGm58OAdIZYB6nPG1oyOLyjNx7EW6Gukql3203RVeCGiRpgtb/kswXwMJp5gqL3nDbsC3l9JD64Cfl7s/ed08TuDqwEGx82bKM0KzyxUXxxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785272777; c=relaxed/simple;
	bh=JHPfV3RD6vW2cC87Nx8I0nem5pmDVBJJlTYT0fbqMW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmSIt6GB357v9xJKdfDDhZHG161+4A3VrImgX4lu/r63uQysymWoC5m1IY11/xtrEBmMZEzskxRY7fjOHK9KuE6wJlsBT225X4PtPe9+21M+pC+PVRcaxBjScMRzDHTC5cu3EmB8fwKK/ihNw9gGsEgcDRiyAb4anu42hjE3s1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTD4V4dm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTD4V4dm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77ABE1F000E9;
	Tue, 28 Jul 2026 21:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785272775;
	bh=JHPfV3RD6vW2cC87Nx8I0nem5pmDVBJJlTYT0fbqMW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RTD4V4dmICcZrQHmHCByRSVOM4g7FmD4Rlx8Tc/7WrZ7Ocg6K08loPzrZupR7Vqum
	 8xh8QIKhzs8r+1tC6mY+duoCntPjASXlplGkK0QO/7o+PZ+HEaMM95FA5qNAXKi4zw
	 PFrZaYptH2Tbo2Bu0XBHC9pET8ZNbD8hLy+SuHovpGrNRYxequR4boeD3026UAzpd/
	 uyJFpMiEneuuIFbkN+Mpc1Xems9fkDF1AzXSkn0fk8jivs9HVwWP6lm0Stxa5C5P3u
	 ZTPmIXThwWAfhsxrB2av+b+RqJXPZ7koCPsyyFlaghz4E91aqYrgVkCF5jXcdAgTMX
	 uH5b4rI8hs+ZQ==
Date: Tue, 28 Jul 2026 15:06:14 -0600
From: Keith Busch <kbusch@kernel.org>
To: Pan Chuang <panchuang@vivo.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	"open list:ARM/APPLE MACHINE SUPPORT" <asahi@lists.linux.dev>,
	"moderated list:ARM/APPLE MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	"open list:NVM EXPRESS DRIVER" <linux-nvme@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] nvme-apple: Remove redundant dev_err_probe()
Message-ID: <amkZxmW3hGbRvUa4@kbusch-mbp>
References: <20260716033301.212797-1-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716033301.212797-1-panchuang@vivo.com>

On Thu, Jul 16, 2026 at 11:33:01AM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err_probe() calls.

Thanks, applied to nvme-7.3.
