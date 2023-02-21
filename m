Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED46A28
	for <asahi@lists.linux.dev>; Tue, 21 Feb 2023 12:32:59 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1676982771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tKCc7ZKhDanVma3ABPhFhCDUgxqiBqxzcYUkl0L5zyU=;
	b=ivgk4gKIT2ewsfr36AojJq3P3xDS8R5OSej9Z9rOJxzKPHQcXLxB2sYdkqzJQBgrK1PgTl
	b7qbfK9JemyPnKGUxKkctJVCQTyiYABFZUpb20n7J6vaPL4poDmcV1Ybbxnqu07AwxlC8A
	vEwmCrUaNQ+v4rLvZR0TD1wnANP+XqXAcXmbqIMijd2B1bUVHz2QadmANgQDU87h3CU/VY
	MrWjC0VME1d/SH0qLP15I4Y5CbMi281vVHPI7C9E1MdUmITKqLtr8zqL11y6FxKh56xxEt
	XQOmgBnSDDwxsaVMrShWnl5P2lbNrGQqVahduXJpbJDxOnufO0/E0Po+2EO6tA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1676982771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tKCc7ZKhDanVma3ABPhFhCDUgxqiBqxzcYUkl0L5zyU=;
	b=xrRRKYKd+4hfsgfj1c6JmXDCae/ImWilT+Fy5Br5ANW0GMjS/GEhTo12TuYKaI/6B14b+r
	qrWLhbISvYX+srCg==
To: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, John Stultz <jstultz@google.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH] rust: time: New module for timekeeping functions
In-Reply-To: <20230221-gpu-up-time-v1-1-bf8fe74b7f55@asahilina.net>
References: <20230221-gpu-up-time-v1-1-bf8fe74b7f55@asahilina.net>
Date: Tue, 21 Feb 2023 13:32:51 +0100
Message-ID: <87v8jvnqq4.ffs@tglx>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 21 2023 at 16:06, Asahi Lina wrote:
> +
> +use crate::bindings;
> +use core::time::Duration;
> +
> +/// Returns the kernel time elapsed since boot, excluding time spent sleeping, as a [`Duration`].
> +pub fn ktime_get() -> Duration {
> +    // SAFETY: Function has no side effects and no inputs.
> +    Duration::from_nanos(unsafe { bindings::ktime_get() }.try_into().unwrap())

Why is this a Duration? From the spec:

    Duration

        A Duration type to represent a span of time, typically used for
        system timeouts.

    Instant

        A measurement of a monotonically nondecreasing clock. Opaque and
        useful only with Duration.

In my understanding 'Duration' is a time span between two points, while
ktime_get() and ktime_get_boottime() return the current time of
monotonically nondecreasing clocks, i.e. they fall into the 'Instant'
category.

Now the problem is that 'Instant' in it's specification is bound to
CLOCK_MONOTONIC and there is no way to express CLOCK_BOOTTIME, but
that's a shortcoming of the spec which ignores CLOCK_BOOTTIME
completely. IOW, that's also a problem for user space.

This makes sense vs. the other representation:

     SystemTime
     
        A measurement of the system clock, useful for talking to
        external entities like the file system or other processes.

This maps to CLOCK_REALTIME and CLOCK_TAI, i.e. ktime_get_real_ns() and
ktime_get_clocktai().

Similar to 'Instant' 'SystemTime' is strictly bound to CLOCK_REALTIME
by specification and there is no way to read CLOCK_TAI.

Please fix this in the spec and do not try to work around that by
pretending that a clock read is a 'Duration'.

> +}
> +
> +/// Returns the kernel time elapsed since boot, including time spent sleeping, as a [`Duration`].
> +pub fn ktime_get_boottime() -> Duration {
> +    Duration::from_nanos(
> +        // SAFETY: Function has no side effects and no variable inputs.
> +        unsafe { bindings::ktime_get_with_offset(bindings::tk_offsets_TK_OFFS_BOOT) }

No. Please use ktime_get_boottime() and not the timekeeping internal function.

Thanks,

        tglx
