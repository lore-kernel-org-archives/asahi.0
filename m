Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5131E309EF9
	for <asahi@lists.linux.dev>; Thu,  9 Apr 2026 06:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775714961; cv=none; b=WkKhr/QdzEgbWM/WLH7cK7lS561reglK9///TUYCC0R8BcvAcnnDifanLIw5DApvC6bU4q9x0Au3QVbo6g3V0UgssgIEf18dlBpgkHY5hAUkxSfU2UKUb3Kz8sBBZROQewl60e5I2J+KxoqrmEu5kl6J9X2Chdgu2Mg0CjOXO+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775714961; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLSY5q222TmQ62Fz2UcXM6XcSFcCGZmMlq8dS+R6Yx1s9uCrwDUqGmrlwnzeIDt2MctAM3UxHfNz9IBU9HIDesIrTkShUoj37sECg2UY1s0jXAAuGg59lLrU+iOvuJoKou85g8V5pmyr1SGwGo2hou0lXE86cFRmbzQ7yKvSdnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id D02B468D05; Thu,  9 Apr 2026 08:09:14 +0200 (CEST)
Date: Thu, 9 Apr 2026 08:09:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>,
	Ming Lei <ming.lei@redhat.com>, Chaitanya Kulkarni <kch@nvidia.com>,
	"Heyne, Maximilian" <mheyne@amazon.de>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] nvme-apple: drop invalid put of admin queue
 reference count
Message-ID: <20260409060914.GC6389@lst.de>
References: <20260408141815.375695-1-pchelkin@ispras.ru>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408141815.375695-1-pchelkin@ispras.ru>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

