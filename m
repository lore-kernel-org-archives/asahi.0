Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52DB1FAC
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 06:04:04 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id b96so12195940edf.0
        for <asahi@lists.linux.dev>; Mon, 15 Aug 2022 23:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=jdACKcZQnW2rz+ym/pyFpE18JDDBRDsTGyRhdRj6JS8=;
        b=gqP6eFnkxg6m9YfSUzZ+10ZckWcrXTsAkZH0q+/zWP6PQQ1qM9nrnOZTfPWOPIIAHt
         Ni0Y6J1PD0BbYmGLR37J/IVpCDgWZB9D4z9b5oRZmqVQjPUK+0A1N0rS84547ExO55I/
         wnXf8etONDtUtGvrJys1HFW6iEOEr9i6fsIEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=jdACKcZQnW2rz+ym/pyFpE18JDDBRDsTGyRhdRj6JS8=;
        b=UcfGEVSFGXBtVVPL62r2VVU8rBkkA4pD7R9mtmHZdMTh7yHjfV0qfGtWQDwwBKIlYK
         iIkASPAGXYwi44WpUH3t2l+CO4rb3BTkRBsl4z2JqlYbzcUSZ/rSoYqQaY62pRoyk9Nh
         xLYE0FHXi3DDucLUI01NIMESkI+2F0Y+YhM2aAllhp7OsgIV5HHqwF3BLES15EVQSJFa
         04i5fJbFgNP8hsQibbCZPGuAwMuZL5D0tr8vPnRpRulphYF6aMuMwp03MVNZLPg4sfhi
         UYYcjpEEgSvKkezoVnL7FqKc45ymcjEzI0WIdAL5N6kLpzSEU2Yn1+27bHpUjtA6Q38j
         Ujqw==
X-Gm-Message-State: ACgBeo1AJ2749URCKh+0fwUVqU0brI557Rq5Q8fvTmvOS4VwucUjs7Ob
	WNyvTgmrVHZs3yjoqv51a/0qn39ghKloziREP7A=
X-Google-Smtp-Source: AA6agR7436gdOHZNUi6iiw7jkTE8ZGeV12XBTEKR38/1/YEK+oWvXpKVH8Se401J+j4JggLSc0Ko9A==
X-Received: by 2002:aa7:d447:0:b0:43f:b049:8e00 with SMTP id q7-20020aa7d447000000b0043fb0498e00mr17701557edr.218.1660629842639;
        Mon, 15 Aug 2022 23:04:02 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id k4-20020a056402048400b004404e290e7esm7875836edv.77.2022.08.15.23.04.02
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 23:04:02 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id v3so11386763wrp.0
        for <asahi@lists.linux.dev>; Mon, 15 Aug 2022 23:04:02 -0700 (PDT)
X-Received: by 2002:a05:6000:2a4:b0:225:162f:4cc7 with SMTP id
 l4-20020a05600002a400b00225162f4cc7mr1024841wry.274.1660629841690; Mon, 15
 Aug 2022 23:04:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YvqaK3hxix9AaQBO@slm.duckdns.org> <YvsZ6vObgLaDeSZk@gondor.apana.org.au>
 <CAHk-=wgSNiT5qJX53RHtWECsUiFq6d6VWYNAvu71ViOEan07yw@mail.gmail.com> <YvsvwCUVtNA5N5+U@gondor.apana.org.au>
In-Reply-To: <YvsvwCUVtNA5N5+U@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Aug 2022 23:03:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi8FOpkDUdy48s0_3DVP2emB++_u02Pgus1EBpNv1dtig@mail.gmail.com>
Message-ID: <CAHk-=wi8FOpkDUdy48s0_3DVP2emB++_u02Pgus1EBpNv1dtig@mail.gmail.com>
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Will Deacon <will@kernel.org>, Tejun Heo <tj@kernel.org>, marcan@marcan.st, 
	peterz@infradead.org, jirislaby@kernel.org, maz@kernel.org, 
	mark.rutland@arm.com, boqun.feng@gmail.com, catalin.marinas@arm.com, 
	oneukum@suse.com, roman.penyaev@profitbricks.com, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 15, 2022 at 10:49 PM Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> I think this is the source of all this: [ commit 61e02392d3c7 ]

Yes, that doc update seems to actually predate the broken code.

But you can actually see how that commit clearly was only meant to
change the "test_and_set_bit_lock()" case. IOW, in that commit, the
test_and_set_bit() comments clearly say

 * test_and_set_bit - Set a bit and return its old value
 * This operation is atomic and cannot be reordered.
 * It may be reordered on other architectures than x86.
 * It also implies a memory barrier.

(that "It may be reordered on other architectures than x86" does show
clear confusion, since it also says "It also implies a memory
barrier")

And the very commit that adds that

  - RMW operations that are conditional are unordered on FAILURE,

language then updates the comment only above test_and_set_bit_lock().

And yes, on failure to lock, ordering doesn't matter. You didn't get
the bit lock, there is no ordering for you.

But then I think that mistake in the documentation (the relaxed
semantics was only for the "lock" version of the bitops, not for the
rest ot it) then later led to the mistake in the code.

End result: test_and_set_bit_lock() does indeed only imply an ordering
if it got the lock (ie it was successful).

But test_and_set_bit() itself is always "succesful". If the bit was
already set, that's not any indication of any "failure". It's just an
indication that it was set. Nothing more, nothing less, and the memory
barrier is still required regardless.

             Linus
