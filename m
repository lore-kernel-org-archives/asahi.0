Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B700E1C32
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 05:49:14 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1oNpRY-00BVlw-CO; Tue, 16 Aug 2022 15:48:49 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Tue, 16 Aug 2022 13:48:48 +0800
Date: Tue, 16 Aug 2022 13:48:48 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, Tejun Heo <tj@kernel.org>,
	marcan@marcan.st, peterz@infradead.org, jirislaby@kernel.org,
	maz@kernel.org, mark.rutland@arm.com, boqun.feng@gmail.com,
	catalin.marinas@arm.com, oneukum@suse.com,
	roman.penyaev@profitbricks.com, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
Message-ID: <YvsvwCUVtNA5N5+U@gondor.apana.org.au>
References: <YvqaK3hxix9AaQBO@slm.duckdns.org>
 <YvsZ6vObgLaDeSZk@gondor.apana.org.au>
 <CAHk-=wgSNiT5qJX53RHtWECsUiFq6d6VWYNAvu71ViOEan07yw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgSNiT5qJX53RHtWECsUiFq6d6VWYNAvu71ViOEan07yw@mail.gmail.com>

On Mon, Aug 15, 2022 at 10:27:10PM -0700, Linus Torvalds wrote:
>
> The bug seems to go back to commit e986a0d6cb36 ("locking/atomics,
> asm-generic/bitops/atomic.h: Rewrite using atomic_*() APIs"), and the
> fix looks to be as simple as just removing that early READ_ONCE return
> case (test_and_clear has the same bug).
> 
> Will?

I think this is the source of all this:

commit 61e02392d3c7ecac1f91c0a90a8043d67e081846
Author: Will Deacon <will@kernel.org>
Date:   Tue Feb 13 13:30:19 2018 +0000

    locking/atomic/bitops: Document and clarify ordering semantics for failed test_and_{}_bit()

Unfortunately it doesn't work because lots of kernel code rely on
the memory barrier semantics of test_and_set_bit.

If ARM really wants this change, then eitehr create a new API
for it or audit every single existing use in the kernel.

Patching the documentation and then relying on it is magical thinking.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
