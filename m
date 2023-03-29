Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAF82582
	for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 14:53:47 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id a30-20020a9d3e1e000000b006a13f728172so5160012otd.3
        for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 07:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680101626;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUAbF6xPpnaApht7x67RotY/bpdH/Tf1G3eD2cyc8F0=;
        b=ZAV8/O7JwqdsctwR+oxDFJjl7JkT0xjiwpUKAc1PAnqQGj4viWWEcnJG/0Z9WXut14
         pwpgq3vvsuPKmsFKz3qCBekH4CXPWONs70QxVh8I4Pd5P+akeSOtRqtWjQil3LenEEDo
         qFnz1h9MIsPpKsne2RGQkS0jt7ptmyuC13GWzjRS2+Gl2qDOxUYCNfU8vtuzgP4UW1gA
         D077tbthBlvairgPwrtwBxwo3fVOCJ1cp8PHJ5BpgNRwS/HEXwOTpAwruOMtVZTpmrKG
         xJalmVSv7/algAxVmf2W4+n0wa628dyWEZQTUBtLD5aaQzfBjWPQJh4TF2y5gTXCAvIE
         809A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680101626;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HUAbF6xPpnaApht7x67RotY/bpdH/Tf1G3eD2cyc8F0=;
        b=xsb4xHl/Woi1O1j+784CqNJmVwgiYF1Y4HgQjj3PKtVJChGibpf5UvAhVRYKGR27fa
         FfhQlTo215Hfo/AbzOKlctO4DRE3edL3P1Wr3S1OiOwJek+1AuxOfQU2cZ5RNtDi6z5D
         uqewboV18BkxP5dcaXQXBJQncMrUnl4YHM/8Px9YPcoY3seWjyT591FrKBIi49xgguMt
         FcofSo6SIjXq3MQSDyBbWI6dOsdiMvaQBkM5/XQpAnm9zqjwQJ+3Q5IivdgiqWF5dPBA
         y9E7STLh1xw1bjA6dVLpxQFjPcYiba3gaq/ywsoKTCrOq/yE7x2mHx3if+W/DUcCMLCu
         qVbw==
X-Gm-Message-State: AAQBX9fv02R1UFDZXxT0JAymYs6KyMw0ylzJJpko415eNhLJZeuw7QPl
	ei/9x0g62W9c71ez0aNxuVw=
X-Google-Smtp-Source: AKy350ZoRTphKvVFMl5GtTPXTy1Qb6aL9bK12jfehzU2n5V4XAZsPrGfXid7dZpcztCeBy4dQpBz4A==
X-Received: by 2002:a05:6830:1d78:b0:6a1:22fe:2a4b with SMTP id l24-20020a0568301d7800b006a122fe2a4bmr6894580oti.18.1680101626737;
        Wed, 29 Mar 2023 07:53:46 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id a12-20020a056830008c00b006a11de6cd02sm5453887oto.34.2023.03.29.07.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 07:53:46 -0700 (PDT)
Message-ID: <7bd381da-2d8a-2c81-bc9b-ac0a13f4edb9@gmail.com>
Date: Wed, 29 Mar 2023 11:53:42 -0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 5/6] rust: error: Add a helper to convert a C ERR_PTR
 to a `Result`
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sven Van Asbroeck <thesven73@gmail.com>
Cc: Fox Chen <foxhlchen@gmail.com>, Andreas Hindborg
 <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
References: <20230224-rust-error-v2-0-3900319812da@asahilina.net>
 <20230224-rust-error-v2-5-3900319812da@asahilina.net>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230224-rust-error-v2-5-3900319812da@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/29/23 09:04, Asahi Lina wrote:
> [...]
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
> index 4f599c4d1752..6b10129075a7 100644
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
> +/// # use kernel::from_err_ptr;
> +/// # use kernel::bindings;
> +/// fn devm_platform_ioremap_resource(
> +///     pdev: &mut PlatformDevice,
> +///     index: u32,
> +/// ) -> Result<*mut core::ffi::c_void> {
> +///     // SAFETY: FFI call.
> +///     unsafe {
> +///         from_err_ptr(bindings::devm_platform_ioremap_resource(
> +///             pdev.to_ptr(),
> +///             index,
> +///         ))
> +///     }
> +/// }
> +/// ```
> +// TODO: Remove `dead_code` marker once an in-kernel client is available.
> +#[allow(dead_code)]
> +pub(crate) fn from_err_ptr<T>(ptr: *mut T) -> Result<*mut T> {
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
> 

Reviewed-by: Martin Rodriguez Reboredo
