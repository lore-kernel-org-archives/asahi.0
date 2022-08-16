Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9B41102
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 04:55:58 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1oNnyh-00BTJZ-RG; Tue, 16 Aug 2022 14:14:56 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Tue, 16 Aug 2022 12:14:55 +0800
Date: Tue, 16 Aug 2022 12:14:55 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Hector Martin <marcan@marcan.st>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: tj@kernel.org, will@kernel.org, peterz@infradead.org,
	jirislaby@kernel.org, maz@kernel.org, mark.rutland@arm.com,
	boqun.feng@gmail.com, catalin.marinas@arm.com, oneukum@suse.com,
	roman.penyaev@profitbricks.com, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	marcan@marcan.st, stable@vger.kernel.org
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
Message-ID: <YvsZvwxACuGw3KIt@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815175810.17780-1-marcan@marcan.st>
X-Newsgroups: apana.lists.os.linux.kernel

Hector Martin <marcan@marcan.st> wrote:
>
> This has been broken since the dawn of time, and it was incompletely
> fixed by 346c09f80459, which added the necessary barriers in the work
> execution path but failed to account for the missing barrier in the
> test_and_set_bit() failure case. Fix it by switching to
> atomic_long_fetch_or(), which does have unconditional barrier semantics
> regardless of whether the bit was already set or not (this is actually
> just test_and_set_bit() minus the early exit path).

test_and_set_bit is supposed to contain a full memory barrier.
If it doesn't then your arch is broken and needs to be fixed.

Changing this one spot is pointless because such assumptions
are all over the kernel.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
