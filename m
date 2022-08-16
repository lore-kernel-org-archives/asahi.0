Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C0C53B0
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 17:01:20 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id q7-20020a17090a7a8700b001f300db8677so10192038pjf.5
        for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 10:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=DSgs9FXvT0o0PS270q9G9zIUeRmTOeFz5O3WONwu3Mk=;
        b=cVYr3H5SygxO+XmAclLhhXc7RtFloxydR//dRTs4yJGOtAqMVsO899vZ6hxX+VMRaO
         UUpwA56b/35VyN63TGCZwUT01AtbQw7nTWErn/GlAu2E3gVxW6m+Irjki4x4rwPWsrLc
         sOOXKvn33jURA2xT84NFPjPR1dmmxLCiflfjtStrZx3cu/VEmz+s928EWHnUU4fElYYM
         Da65Em2BrchCTE/RLAuR3W0tW5NsLuYOl+N/+nsdXR97aIgRbxRaSeSPkuwt09Xc7uNz
         qSlP8MhplPw8KeWy5WbM8qmfFIpxooVZzuPDVVC9e6WXrwDDspC8l5XBoBlrCm+sXPaV
         fWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=DSgs9FXvT0o0PS270q9G9zIUeRmTOeFz5O3WONwu3Mk=;
        b=xdEY6U+JJqkA5eIrOvZgOJbe5kMauSAJv18QS64nCg7IvD014GI2nG8d7hYzYWpIrs
         11fv5MIIGMe9mmr5QIY6Iw3GTLjaWGRLjc94wlDkJRhvByukm2qZUiBoS8J9+jcf1cNw
         88iEU/eCWc4TwiOh3cbrONIKWuVVZ8fOiYkTbyIGae6U7ZCorNBrT77gfkEWt3pcBQdC
         eEsIMEUKh/IoEtsy54ikvOVammP67qen2Peip3pefsnOCSpgQrWHHXX+eox0jhzmrLlX
         pSBB/JnehKtogUEAfBqQUtmvRmZv4E0Wfe3Xqpp47BNL4hB7MwR6EmDrlJxDLtcFVMwO
         Omig==
X-Gm-Message-State: ACgBeo0qj21CaEYmwSQh0C4NLR686BP9csjz79aBuXa00v/LLiTy2jK+
	0s32U9x4lQwEgjZC8EvKPOg=
X-Google-Smtp-Source: AA6agR5cNmTS7DV8fDmfAQnwCliasLqsFugEiciNPzXT4UUDQ0TfkEogwl0eiMTrZNWEkpL/8s/SNg==
X-Received: by 2002:a17:90b:1389:b0:1f3:a782:ab28 with SMTP id hr9-20020a17090b138900b001f3a782ab28mr23804741pjb.181.1660669279541;
        Tue, 16 Aug 2022 10:01:19 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:7229])
        by smtp.gmail.com with ESMTPSA id x6-20020a170902a38600b0017150330889sm9285711pla.189.2022.08.16.10.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 10:01:18 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 16 Aug 2022 07:01:17 -1000
From: Tejun Heo <tj@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>, marcan@marcan.st,
	peterz@infradead.org, jirislaby@kernel.org, maz@kernel.org,
	mark.rutland@arm.com, boqun.feng@gmail.com, catalin.marinas@arm.com,
	oneukum@suse.com, roman.penyaev@profitbricks.com,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
Message-ID: <YvvNXdkrtlmKZRex@slm.duckdns.org>
References: <YvqaK3hxix9AaQBO@slm.duckdns.org>
 <YvsZ6vObgLaDeSZk@gondor.apana.org.au>
 <CAHk-=wgSNiT5qJX53RHtWECsUiFq6d6VWYNAvu71ViOEan07yw@mail.gmail.com>
 <20220816134156.GB11202@willie-the-truck>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816134156.GB11202@willie-the-truck>

Hello, Will.

On Tue, Aug 16, 2022 at 02:41:57PM +0100, Will Deacon wrote:
> /**
>  * test_and_set_bit - Set a bit and return its old value
>  * @nr: Bit to set
>  * @addr: Address to count from
>  *
>  * This operation is atomic and cannot be reordered.
>  * It may be reordered on other architectures than x86.
>  * It also implies a memory barrier.
>  */
> 
> so while Peter and I were trying to improve the documentation for
> atomics and memory barriers we clearly ended up making the wrong call
> trying to treat this like e.g. a cmpxchg() (which has the
> unordered-on-failure semantics).

I think the doc can be improved here. atomic_t.txt says under ORDERING:

 - RMW operations that have a return value are fully ordered;

 - RMW operations that are conditional are unordered on FAILURE,
   otherwise the above rules apply.

But nothing spells out what's conditional. Maybe it's okay to expect people
to read this doc and extrapolate how it applies, but I think it'd be better
if we spell out clearly per operaiton so that readers can search for a
speicific operation and then follow what the rules are from there.

It bothers me that there doesn't seem to be a comprehensive
operation-indexed doc on the subject. memory-barrier.txt doesn't cover which
operations do what barriers. atomic_t.txt and atomic_bitops.txt cover the
atomic_t operations but not in a comprehensive or searchable manner (e.g.
does test_and_set_bit() return 0 or 1 on success?) and it's not clear where
to look for non-atomic_t atomic operations. I guess it's implied that they
follow the same rules as atomic_t counterparts but I can't seem to find that
spelled out anywhere. The source code docs are layered and dispersed for
generic and arch implemetnations making them difficult to follow.

It'd be awesome if the documentation situation can be improved.

Thanks.

-- 
tejun
