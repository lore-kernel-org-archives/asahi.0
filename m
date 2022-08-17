Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8703185D
	for <asahi@lists.linux.dev>; Wed, 17 Aug 2022 05:06:36 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1oOBFW-00BuOh-ON; Wed, 17 Aug 2022 15:05:51 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Wed, 17 Aug 2022 13:05:50 +0800
Date: Wed, 17 Aug 2022 13:05:50 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, Tejun Heo <tj@kernel.org>,
	marcan@marcan.st, peterz@infradead.org, jirislaby@kernel.org,
	maz@kernel.org, mark.rutland@arm.com, boqun.feng@gmail.com,
	catalin.marinas@arm.com, oneukum@suse.com,
	roman.penyaev@profitbricks.com, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
Message-ID: <Yvx3LpyqWwZ0Mawc@gondor.apana.org.au>
References: <YvqaK3hxix9AaQBO@slm.duckdns.org>
 <YvsZ6vObgLaDeSZk@gondor.apana.org.au>
 <CAHk-=wgSNiT5qJX53RHtWECsUiFq6d6VWYNAvu71ViOEan07yw@mail.gmail.com>
 <20220816134156.GB11202@willie-the-truck>
 <CAHk-=wgqvApXmXxk42eZK1u5T60aRWnBMeJOs7JwP-+qqLq6zQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgqvApXmXxk42eZK1u5T60aRWnBMeJOs7JwP-+qqLq6zQ@mail.gmail.com>

On Tue, Aug 16, 2022 at 09:41:52AM -0700, Linus Torvalds wrote:
.
> So I htink the code problem is easy, I think the real problem here has
> always been bad documentation, and it would be really good to clarify
> that.
> 
> Comments?

The problem is that test_and_set_bit has been unambiguously
documented to have memory barriers since 2005:

commit 3085f02b869d980c5588f3e8fb136b0b465a2759
Author: David S. Miller <davem@nuts.davemloft.net>
Date:   Fri Feb 4 23:39:15 2005 -0800

    [DOC]: Add asm/atomic.h asm/bitops.h implementation specification.

And this is what it says:

+       int test_and_set_bit(unsigned long nr, volatils unsigned long *addr);
+       int test_and_clear_bit(unsigned long nr, volatils unsigned long *addr);
+       int test_and_change_bit(unsigned long nr, volatils unsigned long *addr);

	...snip...

+These routines, like the atomic_t counter operations returning values,
+require explicit memory barrier semantics around their execution.  All
+memory operations before the atomic bit operation call must be made
+visible globally before the atomic bit operation is made visible.
+Likewise, the atomic bit operation must be visible globally before any
+subsequent memory operation is made visible.  For example:
+
+       obj->dead = 1;
+       if (test_and_set_bit(0, &obj->flags))
+               /* ... */;
+       obj->killed = 1;

This file wasn't removed until 16/11/2020 by f0400a77ebdc.

In that time people who wrote code using test_and_set_bit could have
legitimately relied on the memory barrier as documented.  Changing
this restrospectively is dangerous.

I'm fine with introducing new primitives that have different
properties, and then converting the existing users of test_and_set_bit
over on a case-by-case basis.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
