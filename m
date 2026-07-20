Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6528A3CCFDE
	for <asahi@lists.linux.dev>; Mon, 20 Jul 2026 08:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535985; cv=none; b=ajEf/6lmjotplV8TaqjSer8fZYfR6YgAkg3tIRNkUvbTBtohSl2SDumE+i8lT4R5/fnDhPsfngNKPyXJh/pRItJG15mvJwGVhYRJSLqV2blJTbfjluYU5lTUJwShaidwp3S/pUqiQnMpu6a6a/SbeWbVKcUlTMDvxi+apjezxIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535985; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4ZNoGcVp2FuJWZJFrZbSAkPVt6+aNiaQVGaUIfxQQRlcNG4dJuayX4JrFmtm+Vu3F5U/JGfVtwzKF978Tww02FrNRlVkJAMTwaHM280E1f/FN46yUzreX6ZICDu5pt2bf6d+xwtD2d1zeAZj8ZKgavQYM6doCuEvDBWKG65SsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id B8D4968C7B; Mon, 20 Jul 2026 10:26:16 +0200 (CEST)
Date: Mon, 20 Jul 2026 10:26:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Pan Chuang <panchuang@vivo.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"open list:ARM/APPLE MACHINE SUPPORT" <asahi@lists.linux.dev>,
	"moderated list:ARM/APPLE MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	"open list:NVM EXPRESS DRIVER" <linux-nvme@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] nvme-apple: Remove redundant dev_err_probe()
Message-ID: <20260720082616.GA20679@lst.de>
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
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

