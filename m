Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD7F1C32
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 05:27:30 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id gk3so16928126ejb.8
        for <asahi@lists.linux.dev>; Mon, 15 Aug 2022 22:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=8GCiBPOuQM/bTY94OlYfkl/LuAf0jjQOGAAIwdS74Fg=;
        b=JisZo1jwcqMFxEogkyBSj7CD2OQejIZwVaBZLDUMPXyd1/XDJk4yhm5S4XaUclV41a
         DNf6C3jtGn/ICcktl7kKvB8oEvCJEthJjCnq/oKtpHE4qJRvd1ePCf/5cpTiwt6ADx8y
         6ZKi3THb4uQY/A2F+hAzzTdYwLtU3q7b8PgG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=8GCiBPOuQM/bTY94OlYfkl/LuAf0jjQOGAAIwdS74Fg=;
        b=AJXpYZKQRuLps1EXjJrFEDhooMzjykUvNCpibFM8hhHknHMt756Ki2B2fSuXzTxSaH
         /IERMOyOLy47bJIT5XZLLA6MnzK39ljnzchwlz6+7VuL8/lmqkvUd6QjAOJc6x3z982i
         dDCwEzkbgIEBVwS9GB72GK0foKm+dgP7MbYHGNknNum80SWzZ4K3ZMZeJ6h+a/AO+aUy
         A4fmHnzr4+MDZwkbFujfaJsKxKuMOSQ2gNX81v3VIa1XHa77XIYww7oWqzPwA9/czr7c
         SI1ntuN7LnPhPo6D2nuYyRGTo/R5iiOFRzwNqvLM9GpAY0PeJTreLJv0OYoYMG7fNsTi
         fsdQ==
X-Gm-Message-State: ACgBeo2KMQ3JLnHFXlmR7hVzkatEkEV75UkVK3+VPcjvKYeItHrsluLx
	RaXkeDpWbY5ZHmk9j4x8I7heFgCsJv2M3yAPTt8=
X-Google-Smtp-Source: AA6agR6+NeqKYV3Zd07eeMWSrmY8jeNBcZf88ZhRajSoZ4s8I21OIb11F8WmAECeAhUK9ToFiiDo9A==
X-Received: by 2002:a17:907:7241:b0:734:b282:184b with SMTP id ds1-20020a170907724100b00734b282184bmr12390427ejc.445.1660627648553;
        Mon, 15 Aug 2022 22:27:28 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id 15-20020a170906308f00b0073022b796a7sm4815535ejv.93.2022.08.15.22.27.27
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 22:27:27 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id p10so11280748wru.8
        for <asahi@lists.linux.dev>; Mon, 15 Aug 2022 22:27:27 -0700 (PDT)
X-Received: by 2002:a5d:6248:0:b0:222:cd3b:94c8 with SMTP id
 m8-20020a5d6248000000b00222cd3b94c8mr10739050wrv.97.1660627646821; Mon, 15
 Aug 2022 22:27:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YvqaK3hxix9AaQBO@slm.duckdns.org> <YvsZ6vObgLaDeSZk@gondor.apana.org.au>
In-Reply-To: <YvsZ6vObgLaDeSZk@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Aug 2022 22:27:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgSNiT5qJX53RHtWECsUiFq6d6VWYNAvu71ViOEan07yw@mail.gmail.com>
Message-ID: <CAHk-=wgSNiT5qJX53RHtWECsUiFq6d6VWYNAvu71ViOEan07yw@mail.gmail.com>
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
To: Herbert Xu <herbert@gondor.apana.org.au>, Will Deacon <will@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, marcan@marcan.st, peterz@infradead.org, 
	jirislaby@kernel.org, maz@kernel.org, mark.rutland@arm.com, 
	boqun.feng@gmail.com, catalin.marinas@arm.com, oneukum@suse.com, 
	roman.penyaev@profitbricks.com, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 15, 2022 at 9:15 PM Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> Please revert this as test_and_set_bit was always supposed to be
> a full memory barrier.  This is an arch bug.

Yes, the bitops are kind of strange for various legacy reasons:

 - set/clear_bit is atomic, but without a memory barrier, and need a
"smp_mb__before_atomic()" or similar for barriers

 - test_and_set/clear_bit() are atomic, _and_ are memory barriers

 - test_and_set_bit_lock and test_and_clear_bit_unlock are atomic and
_weaker_ than full memory barriers, but sufficient for locking (ie
acquire/release)

Does any of this make any sense at all? No. But those are the
documented semantics exactly because people were worried about
test_and_set_bit being used for locking, since on x86 all the atomics
are also memory barriers.

From looking at it, the asm-generic implementation is a bit
questionable, though. In particular, it does

        if (READ_ONCE(*p) & mask)
                return 1;

so it's *entirely* unordered for the "bit was already set" case.

That looks very wrong to me, since it basically means that the
test_and_set_bit() can return "bit was already set" based on an old
value - not a memory barrier at all.

So if you use "test_and_set_bit()" as some kind of "I've done my work,
now I am going to set the bit to tell people to pick it up", then that
early "bit was already set" code completely breaks it.

Now, arguably our atomic bitop semantics are very very odd, and it
might be time to revisit them. But that code looks very very buggy to
me.

The bug seems to go back to commit e986a0d6cb36 ("locking/atomics,
asm-generic/bitops/atomic.h: Rewrite using atomic_*() APIs"), and the
fix looks to be as simple as just removing that early READ_ONCE return
case (test_and_clear has the same bug).

Will?

IOW, the proper fix for this should, I think, look something like this
(whitespace mangled) thing:

   --- a/include/asm-generic/bitops/atomic.h
   +++ b/include/asm-generic/bitops/atomic.h
   @@ -39,9 +39,6 @@ arch_test_and_set_bit(
        unsigned long mask = BIT_MASK(nr);

        p += BIT_WORD(nr);
   -    if (READ_ONCE(*p) & mask)
   -            return 1;
   -
        old = arch_atomic_long_fetch_or(mask, (atomic_long_t *)p);
        return !!(old & mask);
    }
   @@ -53,9 +50,6 @@ arch_test_and_clear_bit
        unsigned long mask = BIT_MASK(nr);

        p += BIT_WORD(nr);
   -    if (!(READ_ONCE(*p) & mask))
   -            return 0;
   -
        old = arch_atomic_long_fetch_andnot(mask, (atomic_long_t *)p);
        return !!(old & mask);
    }

but the above is not just whitespace-damaged, it's entirely untested
and based purely on me looking at that code.

            Linus
