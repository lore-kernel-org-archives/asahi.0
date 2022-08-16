Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B45D110C
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 13:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E15C433D7;
	Tue, 16 Aug 2022 13:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660654859;
	bh=acdDLBpXut9yLHqRuyu2ALBHD3iFgQWicla89BdHDe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hBKbJz4b1yLZKBf8gXwHc/dL5iqGIHsW7JBt+mdjOAtHh3fICXkv4kaMtG9UHrEGi
	 FfFgTrzG4/3/z4kNg9G1sMXkirHFDUaiXQXMXL5WawsERh5PHYPlWC5C+eD74ynDT4
	 F8D5oWXtbW1nifB6EKC5McdPBTz09xtxsq8TqyzVieNtYtE7FrTbmGwsjgqKeYrAmF
	 Dkb/aE9ajcITuzF577LgWnXrdn+kYNQ1uHeB5K4NtlRde2iJmWTJKa0jcfTlugEO8V
	 QQer5lR7aYkNzUmwWuL1dZD9AsHAx6EOapIekW4PXGEwqSj62HFpBx/4rQBjBAJx0P
	 lIUEU6K+IAuGA==
Date: Tue, 16 Aug 2022 14:00:50 +0100
From: Will Deacon <will@kernel.org>
To: Jon Nettleton <jon@solid-run.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>,
	jirislaby@kernel.org, Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oliver Neukum <oneukum@suse.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Asahi Linux <asahi@lists.linux.dev>, stable@vger.kernel.org
Subject: Re: [PATCH] locking/atomic: Make test_and_*_bit() ordered on failure
Message-ID: <20220816130048.GA11202@willie-the-truck>
References: <20220816070311.89186-1-marcan@marcan.st>
 <CAK8P3a03pfrPzjnx1tB5z0HcKnY=JL=y+F8PMQDpc=Bavs3UCA@mail.gmail.com>
 <CABdtJHvZt=av5YEQvRMtf4-dMFR6JS1jM1Ntj7DMVy5fijvkMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABdtJHvZt=av5YEQvRMtf4-dMFR6JS1jM1Ntj7DMVy5fijvkMw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Aug 16, 2022 at 02:29:49PM +0200, Jon Nettleton wrote:
> On Tue, Aug 16, 2022 at 10:17 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Aug 16, 2022 at 9:03 AM Hector Martin <marcan@marcan.st> wrote:
> > >
> > > These operations are documented as always ordered in
> > > include/asm-generic/bitops/instrumented-atomic.h, and producer-consumer
> > > type use cases where one side needs to ensure a flag is left pending
> > > after some shared data was updated rely on this ordering, even in the
> > > failure case.
> > >
> > > This is the case with the workqueue code, which currently suffers from a
> > > reproducible ordering violation on Apple M1 platforms (which are
> > > notoriously out-of-order) that ends up causing the TTY layer to fail to
> > > deliver data to userspace properly under the right conditions. This
> > > change fixes that bug.
> > >
> > > Change the documentation to restrict the "no order on failure" story to
> > > the _lock() variant (for which it makes sense), and remove the
> > > early-exit from the generic implementation, which is what causes the
> > > missing barrier semantics in that case. Without this, the remaining
> > > atomic op is fully ordered (including on ARM64 LSE, as of recent
> > > versions of the architecture spec).
> > >
> > > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > > Cc: stable@vger.kernel.org
> > > Fixes: e986a0d6cb36 ("locking/atomics, asm-generic/bitops/atomic.h: Rewrite using atomic_*() APIs")
> > > Fixes: 61e02392d3c7 ("locking/atomic/bitops: Document and clarify ordering semantics for failed test_and_{}_bit()")
> > > Signed-off-by: Hector Martin <marcan@marcan.st>
> > > ---
> > >  Documentation/atomic_bitops.txt     | 2 +-
> > >  include/asm-generic/bitops/atomic.h | 6 ------
> >
> > I double-checked all the architecture specific implementations to ensure
> > that the asm-generic one is the only one that needs the fix.
> >
> > I assume this gets merged through the locking tree or that Linus picks it up
> > directly, not through my asm-generic tree.
> >
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> Testing this patch on pre Armv8.1 specifically Cortex-A72 and
> Cortex-A53 cores I am seeing
> a huge performance drop with this patch applied. Perf is showing
> lock_is_held_type() as the worst offender

Hmm, that should only exist if LOCKDEP is enabled and performance tends to
go out of the window if you have that on. Can you reproduce the same
regression with lockdep disabled?

Will
