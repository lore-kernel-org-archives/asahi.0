Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D941FDA
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 07:48:27 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1oNrIu-00BXvH-6U; Tue, 16 Aug 2022 17:48:01 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Tue, 16 Aug 2022 15:48:00 +0800
Date: Tue, 16 Aug 2022 15:48:00 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Hector Martin <marcan@marcan.st>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Tejun Heo <tj@kernel.org>,
	peterz@infradead.org, jirislaby@kernel.org, maz@kernel.org,
	mark.rutland@arm.com, boqun.feng@gmail.com, catalin.marinas@arm.com,
	oneukum@suse.com, roman.penyaev@profitbricks.com,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
Message-ID: <YvtLsNZEUUytdx+i@gondor.apana.org.au>
References: <YvqaK3hxix9AaQBO@slm.duckdns.org>
 <YvsZ6vObgLaDeSZk@gondor.apana.org.au>
 <CAHk-=wgSNiT5qJX53RHtWECsUiFq6d6VWYNAvu71ViOEan07yw@mail.gmail.com>
 <cd51b422-89f3-1856-5d3b-d6e5b0029085@marcan.st>
 <CAHk-=wjfLT7nL8pV8RWATpjgm0zDtUwT8UMtroqnGcXRjN8tgw@mail.gmail.com>
 <24c88c4f-aea5-1fb7-0ead-95c88629d72b@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24c88c4f-aea5-1fb7-0ead-95c88629d72b@marcan.st>

On Tue, Aug 16, 2022 at 03:28:50PM +0900, Hector Martin wrote:
>
> This is the same reason I argued queue_work() itself needs to have a
> similar guarantee, even when it doesn't queue work (and I updated the
> doc to match). If test_and_set_bit() is used in this kind of context
> often in the kernel, clearly the current implementation/doc clashes with
> that.

Kernel code all over the place rely on the fact that test_and_set_bit
provides a memory barrier.  So this bug that you've discovered is
not at all isolated to the workqeueue system.  It'll break the kernel
in lots of places in exactly the same way.

> As I said, I don't have any particular beef in this fight, but this is
> horribly broken on M1/2 right now, so I'll send a patch to change the
> bitops instead and you all can fight it out over which way is correct :)

Please do.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
