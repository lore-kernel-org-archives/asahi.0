Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F632F25
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 16:42:11 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id j8so19961998ejx.9
        for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 09:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=08l0+3c88RLyjBCzBV+yKo0+Z/gNc2HQkPhw2wIPxWM=;
        b=J3rnkn5EuesoyajpYqKDI9XRMUmQSi5XjRu8ZpAahaIi7B4uy6ChuzK/pLcqUlJPpy
         mD6ehJVoK8yXUOJolOTet6MchgS5was5NEos4yrbVHlfF7O+oheJohdaD5QbA11k+svC
         N9dqrvr4CVI59jxgn0u8cGTGEdTNL1G5JURKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=08l0+3c88RLyjBCzBV+yKo0+Z/gNc2HQkPhw2wIPxWM=;
        b=6IfuQbkcnxevvZXEIEYacpKZuGkETk+LioPA/j4RZx9BtMSMcESC53B1fN+1BDA7p4
         94epyyiWq4sS3o/2lOiXaXAVV+QEOZwAubgFZ9MFt7BXEu0iEfMjHGssnr+TMFSKksss
         NuekkxSRYY8zMzJXWmBtbonTt4xKWqrfy2s0yKxTThIENs+efvzJbdCRN0++z3VaFEy+
         KWhh6SZDpdeV8rwABeXdl3ZH+JwQ2+DGsHH7ieNZ3OH51CgiIsV7v+VgTbj0BzzO0Zuh
         CqqU+lC/IFEvAZ38s/9a09LX73MI982zpvDZrW0GxN/DNfpWpYsEFDl/tuVRfzNDoqXc
         xGcg==
X-Gm-Message-State: ACgBeo2HMF2t8S74E/y/+rpW22tTozAxWptGsXp+xzV19+3u87wQaCLc
	88zVy3gLdtvJm+rqG0s6cMwM9gKoXzQRrSmf4CQ=
X-Google-Smtp-Source: AA6agR7+P3ZJWF6kPzdSE5Bf7seJHm1m+vEkAIPCniLNrPYJ5Dg1VJ2h7k03bOBNYt378Y3TDiPJBg==
X-Received: by 2002:a17:906:93f0:b0:730:6b07:102d with SMTP id yl16-20020a17090693f000b007306b07102dmr14097679ejb.237.1660668129820;
        Tue, 16 Aug 2022 09:42:09 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id lb1-20020a170907784100b0073851453444sm2784486ejc.60.2022.08.16.09.42.09
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 09:42:09 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id s23so5493528wmj.4
        for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 09:42:09 -0700 (PDT)
X-Received: by 2002:a7b:c399:0:b0:3a5:f3fb:85e0 with SMTP id
 s25-20020a7bc399000000b003a5f3fb85e0mr6857658wmj.38.1660668128792; Tue, 16
 Aug 2022 09:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YvqaK3hxix9AaQBO@slm.duckdns.org> <YvsZ6vObgLaDeSZk@gondor.apana.org.au>
 <CAHk-=wgSNiT5qJX53RHtWECsUiFq6d6VWYNAvu71ViOEan07yw@mail.gmail.com> <20220816134156.GB11202@willie-the-truck>
In-Reply-To: <20220816134156.GB11202@willie-the-truck>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Aug 2022 09:41:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgqvApXmXxk42eZK1u5T60aRWnBMeJOs7JwP-+qqLq6zQ@mail.gmail.com>
Message-ID: <CAHk-=wgqvApXmXxk42eZK1u5T60aRWnBMeJOs7JwP-+qqLq6zQ@mail.gmail.com>
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
To: Will Deacon <will@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Tejun Heo <tj@kernel.org>, marcan@marcan.st, 
	peterz@infradead.org, jirislaby@kernel.org, maz@kernel.org, 
	mark.rutland@arm.com, boqun.feng@gmail.com, catalin.marinas@arm.com, 
	oneukum@suse.com, roman.penyaev@profitbricks.com, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 16, 2022 at 6:42 AM Will Deacon <will@kernel.org> wrote:
>
> > Will?
>
> Right, this looks like it's all my fault, so sorry about that.

It's interesting how this bug has existed for basically four years.

I suspect that the thing is fairly hard to hit in practice,
particularly on the kinds of devices most common (ie limited OoO
windows on most phone SoCs).

Together with phone loads probably not generally being all that
exciting from a kernel standpoint (a lot of driver work, probably not
a lot of workqueue stuff).

>   1. Upgrade test_and_{set,clear}_bit() to have a full memory barrier
>      regardless of the value which is read from memory. The lock/unlock
>      flavours can remain as-is.

I've applied Hector's "locking/atomic: Make test_and_*_bit() ordered
on failure".

>   2. Fix the documentation

That patch had a bit of a fix, but it is probably worth looking at more.

>   3. Figure out what to do about architectures building atomics out of
>      spinlocks (probably ok as lock+unlock == full barrier there?)

Yeah, I wonder how we should describe the memory ordering here. We've
always punted on it, saying it's a "memory barrier", but that has been
partly a "look, that's the traditional x86 model".

And the traditional x86 model really sees the locked RMW operations as
being one single operation - in ways that most other architectures
don't.

So on x86, it's more than "this implies a memory barrier" - it's also
that there is no visible load-modify-store sequence where you can
start asking "what about the ordering of the _load_ wrt the preceding
memory operations".

That makes the x86 behavior very easy to think about, but means that
when you have bitops implemented other ways, you have questions that
are much harder to answer.

So in a Lock+read+op+write+unlock sequence, you can have preceding
operations move into the locked region, and mix with the read+op+write
side.

>   4. Accept my sincerest apologies for the mess!

I don't think you were the source of the mess. The *source* of the
mess is that we've always had very messy rules about the bitops in
particular.

I think the *code* is fixed (at least wrt the generic implementation,
I think the other models are up for discussion), but I think the real
issue is how we should describe the requirements.

So I think we have at least three cases we need to deal with:

 (a) the people who just want atomics, and don't care about any
ordering. They are bound to exist.

 (b) the people who want "acquire"-like semantics. I think the
existing test_and_set_bit_lock() is fine

 (c) the people who want "release"-like semantics, where the
"test-and-set-bit" is for announcing "I'm done, was I the first one?".

 (d) the full barrier case

I think we currently actively have (b) and (d), but it's possible that
the workqueue case really is only (c).

And I think the spinlock implementation really most naturally has that
(c) semantics - you don't necessarily get some theoretical full memory
barrier, but you *do* get those "handover" semantics.

Maybe we never really want or need (d) at all?

So I get the feeling that we really shouldn't specify
"test_and_set_bit()" in terms of memory barriers at all. I *think* it
would be more natural to describe them in terms of "handover" (ie
acquire/release), and then the spinlock semantics are obviously fine.

So I htink the code problem is easy, I think the real problem here has
always been bad documentation, and it would be really good to clarify
that.

Comments?

              Linus
