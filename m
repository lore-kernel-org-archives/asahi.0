Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C93C23CB
	for <asahi@lists.linux.dev>; Wed, 17 Aug 2022 05:41:07 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id d68so477903iof.11
        for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 22:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solid-run-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=LtiOQ+mkHG3cwstCPu63k81uDm+Tw39gJQT7l7BfDLA=;
        b=Ath3yvPoCbvg61Letpy3d0PqozWLwwe9AmUmHNCgOgQ+HJySqSJYFKiqdif9aAzbwC
         /0Fvf2ynY2zf4g364t39yCZiiLQX+Phj0RXTS41kp9aWAtRs2vqSNGPh3LROO1A8e1SG
         GIVawD3lxyeB+YewQwmkRQBwFKZafkYi0BkZS/MBkSs01TJqnGTc7q6o2FM9JQKCzy+6
         as58x35inJKn+OzcxYhDGWcvUHnKQBuNzOof7OCnTatdp0aUq2IsTm+m5Fo/mYAZdiHc
         mJND3g5enXtfobike48Sxz4zmTyGD4D4yyKankC8sW2T4cbIIyOpWONzuFh+aUZXvPHC
         x+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=LtiOQ+mkHG3cwstCPu63k81uDm+Tw39gJQT7l7BfDLA=;
        b=Iw8BWO6nvPifAelcpy2CkZpNgRJwGCM7dA65wbap2h9fXoQCs4c/G3hh17DCsotjxx
         Vqb6aZ5yrl0qjsQQ3v89REAkU128EGac8iutiZqczuDF7ZsqtJFx5FKq0HRzn3fAwNGA
         I1OFbmSvt+BZy35EmdgOH3rWYXclq4LweZORFnfN9dJx7vsA7Q7m8gcmzmXwFlXZDaYX
         xzKU9PxKIVe1uIUkx/VJvm45zBxgA/0dO4MBZq+8jggU8ECA3sDtYZsSY4loov9LVzBa
         lJhsK9cq4h1CmnNmTv8DY5ypt0q24KTcz5uaVS4nCkoPBzwbyKNGdhmS8zlcZvXpSyKG
         bUAQ==
X-Gm-Message-State: ACgBeo0KoIJ/VXSFiWfQ6wrOqqvZAtnPE271cFT5eu/qqcu4Rq2JEI6e
	mbUVA5Lca0oddWUhOOgEgKEOi3INbjlIt13HgoQRxw==
X-Google-Smtp-Source: AA6agR6AuZldJfYBgZvu76/kZ6GrmloyUKbLwieemg3QzOLxFXNzU9ClV/Ucl0lnavczFuLrZ/rBfRuoxtOlgv6iSPc=
X-Received: by 2002:a05:6638:d45:b0:343:2ae6:e39a with SMTP id
 d5-20020a0566380d4500b003432ae6e39amr11419090jak.139.1660714866198; Tue, 16
 Aug 2022 22:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220816070311.89186-1-marcan@marcan.st> <20220816140423.GC11202@willie-the-truck>
 <c545705f-ee7e-4442-ebfc-64a3baca2836@marcan.st> <20220816173654.GA11766@willie-the-truck>
 <CABdtJHt_3TKJVLhLiYMcBtvyA_DwaNapv1xHVeDdQH7cAC6YWw@mail.gmail.com> <CAHk-=wh3dCn5a4fZuJ7cewJoG9Vrm9xSOShiwgC6MA9=yJvXPg@mail.gmail.com>
In-Reply-To: <CAHk-=wh3dCn5a4fZuJ7cewJoG9Vrm9xSOShiwgC6MA9=yJvXPg@mail.gmail.com>
From: Jon Nettleton <jon@solid-run.com>
Date: Wed, 17 Aug 2022 07:40:29 +0200
Message-ID: <CABdtJHuwGQ1Vj+HVfkhp=JN_hsFjJeK0-nfj+Ys1LXZrTKUaZg@mail.gmail.com>
Subject: Re: [PATCH] locking/atomic: Make test_and_*_bit() ordered on failure
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
	David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, 
	Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>, jirislaby@kernel.org, 
	Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Asahi Linux <asahi@lists.linux.dev>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 16, 2022 at 8:02 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Aug 16, 2022 at 10:49 AM Jon Nettleton <jon@solid-run.com> wrote:
> >
> > It is moot if Linus has already taken the patch, but with a stock
> > kernel config I am
> > still seeing a slight performance dip but only ~1-2% in the specific
> > tests I was running.
>
> It would be interesting to hear if you can pinpoint in the profiles
> where the time is spent.
>
> It might be some random place that really doesn't care about ordering
> at all, and then we could easily rewrite _that_ particular case to do
> the unordered test explicitly, ie something like
>
> -        if (test_and_set_bit()) ...
> +       if (test_bit() || test_and_set_bit()) ...
>
> or even introduce an explicitly unordered "test_and_set_bit_relaxed()" thing.
>
>                  Linus

This is very interesting, the additional performance overhead doesn't seem
to be coming from within the kernel but from userspace. Comparing patched
and unpatched kernels I am seeing more cycles being taken up by glibc
atomics like __aarch64_cas4_acq  and __aarch64_ldadd4_acq_rel.

I need to test further to see if there is less effect on a system with
less cores,
This is a 16-core Cortex-A72, it is possible this is less of an issue on 4 core
A72's and A53's.

-Jon
