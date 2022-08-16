Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766A81FAC
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 06:00:42 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id u1so13437656lfq.4
        for <asahi@lists.linux.dev>; Mon, 15 Aug 2022 23:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=WBv3h3wgQyY1EiVeiutsnqi3DPEWUTFH2e+SxIIu+SI=;
        b=HMgDCIXlUYJ6kJuRhk+eXtuR9vuZC+EQUek1ea7s4szj5UjzZ0duIpqooXHBusQSn3
         2C1m8fobBSmp7OoimIVuJSe5viRJfsH3IXM7JVm4shRAKMJvp9GtGyRvl5HJ4S4/A7CS
         8yKVcomowZtnMK4E6sYXaCaspJq0LI7wL44x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=WBv3h3wgQyY1EiVeiutsnqi3DPEWUTFH2e+SxIIu+SI=;
        b=fwabQqrAmZ9WgFNR7u4ww316zXgU/p7ENvwG1yd1BLQ2sAPV0g0quusA45TCR+G6yY
         Oieer1rNI4p4tdL8VXq6Jgj6TzMD8f669xvtoAEuU/aW73R13afAd6FOfHN2n6vQE+CV
         S+/KT1Mva7tEP0u2IVdu1eAHDXy876roIf3I1HE2sqPi/wLWvlL70TlrqZprCT9l5idC
         ++4jd3K6RWZlx0ynQyGsHrTkq0bLiSKYl3qT6GYdtrAfhHMeXiwD206ShMez6X3nSbMT
         PzZTU42rkK1H4rFz/HXq8FUiWKL/mNAbNYbJIB2D6SwbNjYhxyti7YFQHev8bx25Ip+f
         eqeg==
X-Gm-Message-State: ACgBeo3NihJRrwxdPP2gKIUyxJ/C8Y0Ya/7QXss31g0UF6LRk5k762rb
	00yF1DXv1zmEx8WxvS4JUrAmXGm1kYJv1QecHyw=
X-Google-Smtp-Source: AA6agR4VQGk++QX7cOnM1P6SGr6APf2rGcxGvgQWOT/lYunXbr+NqeS/SxAq0ZYIH4aqk/lI1C+y2w==
X-Received: by 2002:ac2:4562:0:b0:48b:2a91:e59 with SMTP id k2-20020ac24562000000b0048b2a910e59mr6440117lfm.91.1660629640136;
        Mon, 15 Aug 2022 23:00:40 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id x31-20020a0565123f9f00b0047fa941067fsm1278802lfa.29.2022.08.15.23.00.39
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 23:00:39 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id u3so13414843lfk.8
        for <asahi@lists.linux.dev>; Mon, 15 Aug 2022 23:00:39 -0700 (PDT)
X-Received: by 2002:adf:b343:0:b0:225:1a75:2a9a with SMTP id
 k3-20020adfb343000000b002251a752a9amr270998wrd.281.1660629185303; Mon, 15 Aug
 2022 22:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YvqaK3hxix9AaQBO@slm.duckdns.org> <YvsZ6vObgLaDeSZk@gondor.apana.org.au>
 <CAHk-=wgSNiT5qJX53RHtWECsUiFq6d6VWYNAvu71ViOEan07yw@mail.gmail.com> <cd51b422-89f3-1856-5d3b-d6e5b0029085@marcan.st>
In-Reply-To: <cd51b422-89f3-1856-5d3b-d6e5b0029085@marcan.st>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Aug 2022 22:52:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjfLT7nL8pV8RWATpjgm0zDtUwT8UMtroqnGcXRjN8tgw@mail.gmail.com>
Message-ID: <CAHk-=wjfLT7nL8pV8RWATpjgm0zDtUwT8UMtroqnGcXRjN8tgw@mail.gmail.com>
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
To: Hector Martin <marcan@marcan.st>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Will Deacon <will@kernel.org>, 
	Tejun Heo <tj@kernel.org>, peterz@infradead.org, jirislaby@kernel.org, maz@kernel.org, 
	mark.rutland@arm.com, boqun.feng@gmail.com, catalin.marinas@arm.com, 
	oneukum@suse.com, roman.penyaev@profitbricks.com, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 15, 2022 at 10:36 PM Hector Martin <marcan@marcan.st> wrote:
>
> These ops are documented in Documentation/atomic_bitops.txt as being
> unordered in the failure ("bit was already set" case), and that matches
> the generic implementation (which arm64 uses).

Yeah, that documentation is pure garbage. We need to fix it.

I think that "unordered on failure" was added at the same time that
the generic implementation was rewritten.

IOW, the documentation was changed to match that broken
implementation, but it's clearly completely broken.

I think I understand *why* it's broken - it looks like a "harmless"
optimization. After all, if the bitop doesn't do anything, there's
nothing to order it with.

It makes a certain amount of sense - as long as you don't think about
it too hard.

The reason it is completely and utterly broken is that it's not
actually just "the bitop doesn't do anything". Even when it doesn't
change the bit value, just the ordering of the read of the old bit
value can be meaningful, exactly for that case of "I added more work
to the queue, I need to set the bit to tell the consumers, and if I'm
the first person to set the bit I may need to wake the consumer up".


> On the other hand, Twitter just pointed out that contradicting
> documentation exists (I believe this was the source of the third party
> doc I found that claimed it's always a barrier):

It's not just that other documentation exists - it's literally that
the unordered semantics don't even make sense, and don't match reality
and history.

And nobody thought about it or caught it at the time.

The Xen people seem to have noticed at some point, and tried to
introduce a "sync_set_set()"

> So either one doc and the implementation are wrong, or the other doc is
> wrong.

That doc and the generic implementation is clearly wrong.

              Linus
