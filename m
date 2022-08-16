Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFA05391
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 16:22:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 3924C41A42;
	Tue, 16 Aug 2022 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1660666936; bh=v9Eb3B2oIUOczoWOpMilc4gFuASbH6f5NiE3832J0GI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=xk494yGeO5UkuZpnlGKL4Nq9gERUn/CyV0L3S9M62tv6t3TPQQaFKl7aW+F+VPjQs
	 J6QUP88yR2MiznuQLMSvrWKeTx2/ReGUdOwZK8D7jsqdKzeljMCpL6wv2TeuXRyxr0
	 4V1bqb3dG0XT9RpNkB9F+csP/ao0gEVjf0a9g+USUXdkbFgoGpHh6CworlZMGnD/cv
	 WA4Bai1qkDK1vJ8mIcjdGqq6mJm6Y/IhUZHvrvUMYg7CMI2ekXAhbeVdHH6ZjEgpth
	 1Hyl9rNt++q4bx6l9Z07aUaPmsT2MKK5xLaZJqCsnPkKeKqCbvzxicZEYbOmbQWan0
	 r8CB7Gu3o92Yw==
Message-ID: <74559da4-5cd4-7cc4-0303-ab5f6a8b92ae@marcan.st>
Date: Wed, 17 Aug 2022 01:22:09 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
Content-Language: es-ES
To: Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Tejun Heo <tj@kernel.org>,
 peterz@infradead.org, jirislaby@kernel.org, maz@kernel.org,
 mark.rutland@arm.com, catalin.marinas@arm.com, oneukum@suse.com,
 roman.penyaev@profitbricks.com, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <YvqaK3hxix9AaQBO@slm.duckdns.org>
 <YvsZ6vObgLaDeSZk@gondor.apana.org.au>
 <CAHk-=wgSNiT5qJX53RHtWECsUiFq6d6VWYNAvu71ViOEan07yw@mail.gmail.com>
 <20220816134156.GB11202@willie-the-truck> <YvuvxnfHIRUAuCrD@boqun-archlinux>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <YvuvxnfHIRUAuCrD@boqun-archlinux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/08/2022 23.55, Boqun Feng wrote:
> On Tue, Aug 16, 2022 at 02:41:57PM +0100, Will Deacon wrote:
>> It's worth noting that with the spinlock-based implementation (i.e.
>> prior to e986a0d6cb36) then we would have the same problem on
>> architectures that implement spinlocks with acquire/release semantics;
>> accesses from outside of the critical section can drift in and reorder
>> with each other there, so the conversion looked legitimate to me in
>> isolation and I vaguely remember going through callers looking for
>> potential issues. Alas, I obviously missed this case.
>>
> 
> I just to want to mention that although spinlock-based atomic bitops
> don't provide the full barrier in test_and_set_bit(), but they don't
> have the problem spotted by Hector, because test_and_set_bit() and
> clear_bit() sync with each other via locks:
> 
> 	test_and_set_bit():
> 	  lock(..);
> 	  old = *p; // mask is already set by other test_and_set_bit()
> 	  *p = old | mask;
> 	  unlock(...);
> 				clear_bit():
> 				  lock(..);
> 				  *p ~= mask;
> 				  unlock(..);
> 
> so "having a full barrier before test_and_set_bit()" may not be the
> exact thing we need here, as long as a test_and_set_bit() can sync with
> a clear_bit() uncondiontally, then the world is safe. For example, we
> can make test_and_set_bit() RELEASE, and clear_bit() ACQUIRE on ARM64:
> 
> 	test_and_set_bit():
> 	  atomic_long_fetch_or_release(..); // pair with clear_bit()
> 	  				    // guarantee everything is
> 					    // observed.
> 	  			clear_bit():
> 				  atomic_long_fetch_andnot_acquire(..);
> 	  
> , maybe that's somewhat cheaper than a full barrier implementation.
> 
> Thoughts? Just to find the exact ordering requirement for bitops.

It's worth pointing out that the workqueue code does *not* pair
test_and_set_bit() with clear_bit(). It does an atomic_long_set()
instead (and then there are explicit barriers around it, which are
expected to pair with the implicit barrier in test_and_set_bit()). If we
define test_and_set_bit() to only sync with clear_bit() and not
necessarily be a true barrier, that breaks the usage of the workqueue code.

- Hector
