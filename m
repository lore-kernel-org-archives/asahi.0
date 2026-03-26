Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CB43FCB27
	for <asahi@lists.linux.dev>; Thu, 26 Mar 2026 14:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774534857; cv=none; b=qExzB9a3rT8joifD5Ajjj9+8SVAsNiLcW+1e6iV6g8oX/eGQejLvGiwWfe4AC7neeApJZWPCABcqrQMlfRW33cEF/PLmuYKYlBYlMqGZr+HZdIHp+9rMW9x3nWc157t6Mye//DBHxQDA8jJvniQ9CKw1j20SRPWXZO4kW1KeEn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774534857; c=relaxed/simple;
	bh=DbgRF4eqV7SzII2FJ8cbmdfoCAUWV5aHhCNi81jSWlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJo7WivLDToUWzBWdIt6r0LhaJkaY7SgAzG5B4qVF2Wonl43GML1rppY6iuOhi0u51i0dt+/13IMqSCdFuMR31yZpZVPjC61NR8ZtxLDj9/ekPtYMJoF2yirl6Iib5hGr6jQy43K7hbcMeIwtzQ1dcBi7GhUpq9W/PuEKDu+NW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A842468AFE; Thu, 26 Mar 2026 15:20:47 +0100 (CET)
Date: Thu, 26 Mar 2026 15:20:47 +0100
From: "hch@lst.de" <hch@lst.de>
To: =?utf-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
Cc: "hch@lst.de" <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
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
Message-ID: <20260326142047.GA16787@lst.de>
References: <20260326061443.GA23850@lst.de> <acQxjZMOqj74yIJf@kbusch-mbp> <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4> <945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com> <20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c@epcms2p6> <CABPRKS8-x6Tfr90inpz1fR0=8a5HD=mkujtfLJ1h9ikEUjTvxg@mail.gmail.com> <20260326014429epcms2p135ffd3c2b2fface6423d045e9614c262@epcms2p1> <CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p5> <20260326065152epcms2p51a18d3bbecb6eb6dc2ddba09651e5152@epcms2p5>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260326065152epcms2p51a18d3bbecb6eb6dc2ddba09651e5152@epcms2p5>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Mar 26, 2026 at 03:51:52PM +0900, 전민식 wrote:
> Hi hch,
> 
> I added a comment about why I do trace skip if it's host path error.

The patch looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

But such note go below the '--' so that don't end up in git history.

