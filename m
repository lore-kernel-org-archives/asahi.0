Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7FB1867
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 04:15:55 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1oNnzO-00BTJq-2W; Tue, 16 Aug 2022 14:15:39 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Tue, 16 Aug 2022 12:15:38 +0800
Date: Tue, 16 Aug 2022 12:15:38 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tejun Heo <tj@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: marcan@marcan.st, will@kernel.org, peterz@infradead.org,
	jirislaby@kernel.org, maz@kernel.org, mark.rutland@arm.com,
	boqun.feng@gmail.com, catalin.marinas@arm.com, oneukum@suse.com,
	roman.penyaev@profitbricks.com, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
Message-ID: <YvsZ6vObgLaDeSZk@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvqaK3hxix9AaQBO@slm.duckdns.org>
X-Newsgroups: apana.lists.os.linux.kernel

Tejun Heo <tj@kernel.org> wrote:
> 
> Oh, tricky one and yeah you're absolutely right that it makes no sense to
> not guarantee barrier semantics when already pending. I didn't even know
> test_and_set_bit() wasn't a barrier when it failed. Thanks a lot for hunting
> down and fixing this. Applied to wq/for-6.0-fixes.

Please revert this as test_and_set_bit was always supposed to be
a full memory barrier.  This is an arch bug.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
