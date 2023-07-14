Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6379911188
	for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 10:05:29 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-51e0d7c6293so1036516a12.3
        for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 03:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689329127; x=1691921127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5MF44XQzouX2FbGdHpxAthvfg7u3iO2oNPh/cM8NKE=;
        b=apJ81VA8GA3jTnw53j82PIZMpXO2K7A7oa/aWR/pG0xVkTrMRoSr2WO7woWzhaKgks
         Qiu5Ef2OtOLcCCthMBik8jre5JgKbOQ296jPDHO+0XBtbeQZ3GCV++0K6RdSFg4RJLtx
         HI5xt3Zx+SZVy5n98a+5XUHMB8tMTj6+uvbS9OppSt9LaXPRTaCyk7dj/0vpRi483Q/w
         mMeuWWvg9oj5KISbLCA6AXRIem3Ndp1x+G4RQ0XIlDX39FHUS6Q4CERdEKP9pZtXSvxP
         St538WJiTpZgiaPMGVu8ypTZGB9xPR5JNHSI92L2DHBK2iYWCB6Zt6EOsYaik2bKgOu7
         3ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689329127; x=1691921127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5MF44XQzouX2FbGdHpxAthvfg7u3iO2oNPh/cM8NKE=;
        b=WUoGXf5Lr6gQdWAm8BU3xpRfbO8YGmQPfflYuiYwgR2CPhWWV1GpgpGoMTdJejckl5
         9fB/qFm09bKha5ciIMlsTEXZef7/JddYQKAbQdR3cceGnJBToegHldoZaguV7S58fS9v
         EkMI3zgrzdAwqLsfJMSTAdlUiMQ20y2ITkck6yWhLKr7mPt46TN6qKDn0qDgvg3Ja+j2
         zoxxZ3HcKkTf966viBuIiI4+md6557yOvhBQ9korW+Y9oL+Aq2xiyZGXDDH8AN+URPPd
         j0gdNJ1MirOSaoT4ZiCkt5hNUe1cgxgicoKJWGwH6fePyvNowzEh/MxIQYBS+Q8qvUo/
         UI6Q==
X-Gm-Message-State: ABy/qLb/D0KDBa8JlpKlqdPLMVOGrV2AsqepUdkTgcgE4HmNv1YHrHQ7
	qe9/npTBtcJ3ZblwPivJADICXlG06tLg/QA=
X-Google-Smtp-Source: APBJJlHwVKX/eQQLU8nLjAGvJpMaB1Jw8Jm+qhCHiVH05w5ZGIxlbFTKtQ7Ig8Do+3M/gB90uk1NNJRpAEM9C74=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:9f07:0:b0:510:dd95:da5d with SMTP id
 b7-20020a509f07000000b00510dd95da5dmr19412edf.4.1689329127461; Fri, 14 Jul
 2023 03:05:27 -0700 (PDT)
Date: Fri, 14 Jul 2023 10:05:25 +0000
In-Reply-To: <20230714-rust-time-v2-1-f5aed84218c4@asahilina.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230714-rust-time-v2-1-f5aed84218c4@asahilina.net>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230714100525.2192448-1-aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: time: New module for timekeeping functions
From: Alice Ryhl <aliceryhl@google.com>
To: lina@asahilina.net
Cc: alex.gaynor@gmail.com, asahi@lists.linux.dev, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, gbs@canishe.com, 
	heghedus.razvan@protonmail.com, jistone@redhat.com, jstultz@google.com, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"

Asahi Lina <lina@asahilina.net> writes:
> +/// Marker trait for clock sources that represent a calendar (wall clock)
> +/// relative to the UNIX epoch.
> +pub trait WallTime {}

What's the purpose of this trait? Perhaps it should have a method to get
the UNIX epoch as an Instant?

> +    /// Returns the time elapsed since an earlier Instant<t>, or
> +    /// None if the argument is a later Instant.
> +    pub fn since(&self, earlier: Instant<T>) -> Option<Duration> {
> +        if earlier.nanoseconds > self.nanoseconds {
> +            None
> +        } else {
> +            // Casting to u64 and subtracting is guaranteed to give the right
> +            // result for all inputs, as long as the condition we checked above
> +            // holds.
> +            Some(Duration::from_nanos(
> +                self.nanoseconds as u64 - earlier.nanoseconds as u64,
> +            ))

It looks like you intend to use wrapping semantics for this subtraction
so that self=1,earlier=-1 results in a difference of two.

In that case, you should explicitly use `.wrapping_sub` instead to
convey your intent.

I guess you could also use `abs_diff`, which takes two i64s and returns
an u64.

> +/// Contains the various clock source types available to the kernel.
> +pub mod clock {
> +    use super::*;
> +
> +    /// A clock representing the default kernel time source.
> +    ///
> +    /// This is `CLOCK_MONOTONIC` (though it is not the only
> +    /// monotonic clock) and also the default clock used by
> +    /// `ktime_get()` in the C API.
> +    ///
> +    /// This is like `BootTime`, but does not include time
> +    /// spent sleeping.
> +
> +    pub struct KernelTime;
> +
> +    impl Clock for KernelTime {}
> +    impl Monotonic for KernelTime {}
> +    impl Now for KernelTime {
> +        fn now() -> Instant<Self> {
> +            Instant::<Self>::new(unsafe { bindings::ktime_get() })
> +        }
> +    }

We usually add a SAFETY comment even if it is trivial.

// SAFETY: Just an FFI call without any safety requirements.

Alice

