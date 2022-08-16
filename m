Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3E62F2E
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 08:16:22 +0000 (UTC)
Received: from mail-ej1-f52.google.com ([209.85.218.52]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N79hs-1nIrxh0ep2-017YN8 for <asahi@lists.linux.dev>; Tue, 16 Aug 2022
 10:16:21 +0200
Received: by mail-ej1-f52.google.com with SMTP id gb36so17489798ejc.10
        for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 01:16:21 -0700 (PDT)
X-Gm-Message-State: ACgBeo2XU+JqB/3fgRSGeKQBjzrEZOqb7RoFhpGlk2rLMJd7r49pOdr8
	UAS8Oa/4IjIf06EdGXEGz2GWfZYWMsoR6fv0lvI=
X-Google-Smtp-Source: AA6agR6iJ0nwhhROioKsW3KiCcnkE21PLtVwi8+SbpiQ4ZkczWhJ8i5DpkLee3nWEvIKF41nGXZNZm3jeBE6JuFII7g=
X-Received: by 2002:a17:906:8a67:b0:738:7bcd:dca1 with SMTP id
 hy7-20020a1709068a6700b007387bcddca1mr1923189ejc.547.1660637780770; Tue, 16
 Aug 2022 01:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220816070311.89186-1-marcan@marcan.st>
In-Reply-To: <20220816070311.89186-1-marcan@marcan.st>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 16 Aug 2022 10:16:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a03pfrPzjnx1tB5z0HcKnY=JL=y+F8PMQDpc=Bavs3UCA@mail.gmail.com>
Message-ID: <CAK8P3a03pfrPzjnx1tB5z0HcKnY=JL=y+F8PMQDpc=Bavs3UCA@mail.gmail.com>
Subject: Re: [PATCH] locking/atomic: Make test_and_*_bit() ordered on failure
To: Hector Martin <marcan@marcan.st>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Ingo Molnar <mingo@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Andrea Parri <parri.andrea@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>, 
	Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>, 
	Daniel Lustig <dlustig@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>, 
	jirislaby@kernel.org, Marc Zyngier <maz@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oliver Neukum <oneukum@suse.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Asahi Linux <asahi@lists.linux.dev>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:skhnP1iCHnCXiUS50uRfDnrIztH/b63LBQnylUXSfNfGpTuuOWg
 lbxYdpw+Tw+2lTETU1Oi2g888C8dsxILgSiLa8pnm/nY4J1jigk0z5c8D+pntNjEyQ178dH
 mXaGiGs71BljbO0JTeybmOEQiZ4EGTb8d33HLLgNp9BIHbe+Q9taun92V+qHgrPyf5wHRwV
 eULfBe1o1/HRC06bq01zA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:h7RA17B9qnM=:inoGB/ssX4pk5hxeG86MZD
 AB2XOuL8gMavg713ZlU/k+6Rvkd1CuLutCpnpxbITpShNCbt42NIlLu9llFSclC+ZWdFRZDfQ
 v+qSpgBbSlA2KiyPDsFGyNVL9jRLih/WQmfELlReGLiTnMOyeQZ1Ycf6Vhbnp0lG/bHsS3ms+
 yvaWeangZzGt21xXWJBRdcpO5/ZoLAdpKzCCuf/lQ+kwbuPO9Wwfb23r3vHYEqJZy4F85Ixjm
 g5DE2hWB7uLyQOutvugeBIGqeZSnXTSle12S2sGZRxECyItSUDouB9Votm/q46PY/3oEWPwcH
 dC2GftnZvimxSHEd4X5GQgLPM6a8TEjH7eSD5klfpV4lYAp1vs7e/tfW/aTv9wBAXI5GI+I8T
 75q9wwnLRRdpD5dZC35H/+f4xaPSW+7maNrjoeON2sKNaTiBseUUWSyiR1taDruAKhYGa/3pb
 Prk3xEIj4a5NIEO0WtAlrj2UKFFoZeEOyRPYw6ooa9WmEQTs5SjRI5xBzR0zIBdVb1Gv6//p8
 GsgQ2De/nht3rtC2W3eyS8v9dh1GgnAxhiu8OIFBRiPjgQylgKhL4RdXfGi3eKH534z/dov7F
 qFtRrGuBiCzDolT5uFkPS5+onqhVPmKV8B1Ni2Y1Z8TixR59V9z6VBd/4/Uk8ES+CKmArdTZU
 K+fLCAzVHUef3Q+c61vOWCHURXlbkL6OwPM5SEIAg+crEe0Hkm8fClciPUlZ+5BEBxWSjL4Gw
 sZEHe4OIAhYItw58lNO8pItxm0pMSJMufwLG6x4jpzD1YEDXhhxlKf/4Byv1caSjO09VXWa5j
 fp+drWjE/CCc+NCQr/iYdVYHY8LFxaxPsmpNPKt1EemzL0JYM3klzipwYiTsqUW4AjDZccic+
 yH0dlpGfo28RlLG5vrzg==

On Tue, Aug 16, 2022 at 9:03 AM Hector Martin <marcan@marcan.st> wrote:
>
> These operations are documented as always ordered in
> include/asm-generic/bitops/instrumented-atomic.h, and producer-consumer
> type use cases where one side needs to ensure a flag is left pending
> after some shared data was updated rely on this ordering, even in the
> failure case.
>
> This is the case with the workqueue code, which currently suffers from a
> reproducible ordering violation on Apple M1 platforms (which are
> notoriously out-of-order) that ends up causing the TTY layer to fail to
> deliver data to userspace properly under the right conditions. This
> change fixes that bug.
>
> Change the documentation to restrict the "no order on failure" story to
> the _lock() variant (for which it makes sense), and remove the
> early-exit from the generic implementation, which is what causes the
> missing barrier semantics in that case. Without this, the remaining
> atomic op is fully ordered (including on ARM64 LSE, as of recent
> versions of the architecture spec).
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: stable@vger.kernel.org
> Fixes: e986a0d6cb36 ("locking/atomics, asm-generic/bitops/atomic.h: Rewrite using atomic_*() APIs")
> Fixes: 61e02392d3c7 ("locking/atomic/bitops: Document and clarify ordering semantics for failed test_and_{}_bit()")
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  Documentation/atomic_bitops.txt     | 2 +-
>  include/asm-generic/bitops/atomic.h | 6 ------

I double-checked all the architecture specific implementations to ensure
that the asm-generic one is the only one that needs the fix.

I assume this gets merged through the locking tree or that Linus picks it up
directly, not through my asm-generic tree.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
