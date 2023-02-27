Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007726AB3
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 13:43:48 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so7183100wmb.3
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 05:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=fx8qDAvCLDvqdcXgANGHuVjmctvQswRQGOVBMs2g0GM=;
        b=hcgNUCw6tj0Kjj5Mb97K+TQi1lQCZQqG1T9JBXu7dx+4YMDFQ3rTdFn8r6SwXgrE5v
         ERxaGivwNTwEzHl17Yc21EW0Ll4hWDYdSJn1ZLvd809YZ2myLcx6nFkl90s0NZ5IjJ6C
         Xds4+0TR8cY15+1m7THrT2zoGuL089Wjjc71N86RdLOP0Bmi512pvFU+8qHnnBTS3d4F
         lmCcR4OjP8YmhM91izbDUbUdibYNuwv0GfGqsLHmg3PluaS8XCD9e43E+umO4sTUm2ub
         7xm+u2fDI+2bioiSGPAB5ekNfa7fjiQgRUeifZtl7DnjmiIH0ASzmPzLfVpXKf9fbMPZ
         pW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fx8qDAvCLDvqdcXgANGHuVjmctvQswRQGOVBMs2g0GM=;
        b=tb2IMNaYyiKzud+sH0auPmlzpTtowxL17aBab0uq+kkLq6nYh2PHcyu1SBgQbCKX4o
         iWAFskfGS7XnQR3olT8PkQPnWDuY6v5GtRKfehPUtwx0St//6yBraxjXyWmrCOI/6s1D
         dLip9WDiDt9h7pP4/QopSE074FM/tsVyKSLMeeGw0xtUPYA1Qnwq1ujYczJJWS80T/N1
         JIRDsF45qdL1+MO2bd14ck8kk/TENS5e8jDMJLlTZjVh5DySEqEcurvJ+6R0Vn8rEYa4
         PIaHsW3RwKSVAJWb0/R1G9CjC6nd5AGsHFca32dBGY5DeVip1q0E3Nm6iRzuqb6fk8kO
         AnWA==
X-Gm-Message-State: AO0yUKWAB0Vyck1nZ+ICEWWdtbfg0CW2hmLo+gUM1+Uc1iG+b1u3L3qH
	INanf8ktT2JaGYud1bOVgzN5NQ==
X-Google-Smtp-Source: AK7set/QZmmdoWC9gmVNJw7Ijf5hJKUMmiZ3+bk6jfrAyO0GugLR1LUl3jT2I/ykylqOS0c12k4l4A==
X-Received: by 2002:a05:600c:170a:b0:3eb:37ce:4c3d with SMTP id c10-20020a05600c170a00b003eb37ce4c3dmr5326214wmn.38.1677505427133;
        Mon, 27 Feb 2023 05:43:47 -0800 (PST)
Received: from localhost ([194.62.217.2])
        by smtp.gmail.com with ESMTPSA id j24-20020a05600c1c1800b003e22508a343sm9832291wms.12.2023.02.27.05.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 05:43:46 -0800 (PST)
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
 <20230224-rust-error-v1-4-f8f9a9a87303@asahilina.net>
User-agent: mu4e 1.9.18; emacs 28.2.50
From: Andreas Hindborg <nmi@metaspace.dk>
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Sven Van Asbroeck <thesven73@gmail.com>, Fox
 Chen <foxhlchen@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH 4/5] rust: error: Add a helper to convert a C ERR_PTR to
 a `Result`
Date: Mon, 27 Feb 2023 14:41:25 +0100
In-reply-to: <20230224-rust-error-v1-4-f8f9a9a87303@asahilina.net>
Message-ID: <87a60z9qb2.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Asahi Lina <lina@asahilina.net> writes:

> From: Sven Van Asbroeck <thesven73@gmail.com>
>
> Some kernel C API functions return a pointer which embeds an optional
> `errno`. Callers are supposed to check the returned pointer with
> `IS_ERR()` and if this returns `true`, retrieve the `errno` using
> `PTR_ERR()`.
>
> Create a Rust helper function to implement the Rust equivalent:
> transform a `*mut T` to `Result<*mut T>`.
>
> Lina: Imported from rust-for-linux/linux, with subsequent refactoring
> and contributions squashed in and attributed below. Replaced usage of
> from_kernel_errno_unchecked() with an open-coded constructor, since this
> is the only user anyway.
>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Co-developed-by: Fox Chen <foxhlchen@gmail.com>
> Signed-off-by: Fox Chen <foxhlchen@gmail.com>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Sven Van Asbroeck <thesven73@gmail.com>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  rust/helpers.c       | 12 ++++++++++++
>  rust/kernel/error.rs | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
>
> diff --git a/rust/helpers.c b/rust/helpers.c
> index 89f4cd1e0df3..04b9be46e887 100644
> --- a/rust/helpers.c
> +++ b/rust/helpers.c
> @@ -53,6 +53,18 @@ __force void *rust_helper_ERR_PTR(long err)
>  }
>  EXPORT_SYMBOL_GPL(rust_helper_ERR_PTR);
>  
> +bool rust_helper_IS_ERR(__force const void *ptr)
> +{
> +	return IS_ERR(ptr);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_IS_ERR);
> +
> +long rust_helper_PTR_ERR(__force const void *ptr)
> +{
> +	return PTR_ERR(ptr);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_PTR_ERR);
> +
>  /*
>   * We use `bindgen`'s `--size_t-is-usize` option to bind the C `size_t` type
>   * as the Rust `usize` type, so we can use it in contexts where Rust
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 1e8371f28746..cf3d089477d2 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -177,3 +177,52 @@ pub fn to_result(err: core::ffi::c_int) -> Result {
>          Ok(())
>      }
>  }
> +
> +/// Transform a kernel "error pointer" to a normal pointer.
> +///
> +/// Some kernel C API functions return an "error pointer" which optionally
> +/// embeds an `errno`. Callers are supposed to check the returned pointer
> +/// for errors. This function performs the check and converts the "error pointer"
> +/// to a normal pointer in an idiomatic fashion.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// # use kernel::from_kernel_err_ptr;
> +/// # use kernel::bindings;
> +/// fn devm_platform_ioremap_resource(
> +///     pdev: &mut PlatformDevice,
> +///     index: u32,
> +/// ) -> Result<*mut core::ffi::c_void> {
> +///     // SAFETY: FFI call.
> +///     unsafe {
> +///         from_kernel_err_ptr(bindings::devm_platform_ioremap_resource(
> +///             pdev.to_ptr(),
> +///             index,
> +///         ))
> +///     }
> +/// }
> +/// ```
> +// TODO: Remove `dead_code` marker once an in-kernel client is available.
> +#[allow(dead_code)]
> +pub(crate) fn from_kernel_err_ptr<T>(ptr: *mut T) -> Result<*mut T> {

For consistency, if `from_kernel_errno()` should be `from_errno()` this
should be `from_err_ptr()` as well?

BR Andreas

> +    // CAST: Casting a pointer to `*const core::ffi::c_void` is always valid.
> +    let const_ptr: *const core::ffi::c_void = ptr.cast();
> +    // SAFETY: The FFI function does not deref the pointer.
> +    if unsafe { bindings::IS_ERR(const_ptr) } {
> +        // SAFETY: The FFI function does not deref the pointer.
> +        let err = unsafe { bindings::PTR_ERR(const_ptr) };
> +        // CAST: If `IS_ERR()` returns `true`,
> +        // then `PTR_ERR()` is guaranteed to return a
> +        // negative value greater-or-equal to `-bindings::MAX_ERRNO`,
> +        // which always fits in an `i16`, as per the invariant above.
> +        // And an `i16` always fits in an `i32`. So casting `err` to
> +        // an `i32` can never overflow, and is always valid.
> +        //
> +        // SAFETY: `IS_ERR()` ensures `err` is a
> +        // negative value greater-or-equal to `-bindings::MAX_ERRNO`.
> +        #[cfg_attr(CONFIG_ARM, allow(clippy::unnecessary_cast))]
> +        return Err(Error(err as i32));
> +    }
> +    Ok(ptr)
> +}

