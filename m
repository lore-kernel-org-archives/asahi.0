Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645E02F30
	for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 14:55:06 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-17aeb49429eso16479823fac.6
        for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680101705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00J2tFQAR6OeqFvOfd4m1mRnl/Lfkd+F4P/jvBTwR64=;
        b=mBw3isB0a1lWAdTqHxdwioIarsu2c33Jbf2ro3MVQKkVS7vwS0GCcz1C/XS+tDklxV
         3cETivgOWeXaiLXxq9FahWs4ZREjvb5G3ReGLP7K3bQF7g+nCaZGOKIBD00qaseVd5xm
         aaoWgCtl/WeE1xtJQ7itFaB76z+IDoxIoCz6UI1Yg6LrQICF9n95579fcHod19gOB3nh
         PxYZ6ruPeIw0MN/HYlnrq/2uuDxOuOJQ+nq9ySzbyEMa7A9n3gIzbgAsAL1VJtKMPxUX
         GnNSCnUc638Czhs2GXAuzrHT8AIpwUxCNnK3DcB3AtQlwiVX4tfxDc73MxNQoLXKKwmw
         PqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680101705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00J2tFQAR6OeqFvOfd4m1mRnl/Lfkd+F4P/jvBTwR64=;
        b=nxmZAX9o68g21Pe4hES3kLbDPExKiksyAQ5Y2WYt++R8Akk+ZdkXeblS/cGXtL/WWr
         Xu3LufmPS+CNUF9kb/0hxod5uAJ9mQvQf4r5pjrhCvZKcJyPq9KNLI4zr4egSbZB64Hs
         iaLVhYrvqA1KW52KXXZmbG3GTytPBTOI8XaaKjTjKz4nDOCZHRRdWjDBIWcMLHC65c6P
         Ltcg6ZOACbYqNV1XxBQHRkpnVdSwpK4Zu0SWysix3vVhsSGxniYAe/A0j9BkfIzvygrS
         q/jht1u9AAZgPzeCJiB7U5aPZ+7CdZ0gSnDcRiWr8I9L/Nwe9AZBfJfhhhSWOCr2FhMr
         Zo9Q==
X-Gm-Message-State: AO0yUKX7RSsiDVmODfWtHMrwvVPuwBd3PX3D5YZDufvE5XeuKxR+pIWN
	fl4GIg+Tu2xMS9cXnphIlTw=
X-Google-Smtp-Source: AKy350beORPmwZIBbiLlLRNWPpKJeHvKoLbHpBB2RSMF0sQJeYJuwtLaAUnyFC7BzWXnQCJgL+L8/A==
X-Received: by 2002:a05:6870:9129:b0:177:b438:b0a with SMTP id o41-20020a056870912900b00177b4380b0amr11242837oae.53.1680101705512;
        Wed, 29 Mar 2023 07:55:05 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id wi22-20020a056871a71600b00176d49bb898sm11800496oab.44.2023.03.29.07.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 07:55:05 -0700 (PDT)
Message-ID: <bc99d578-0905-5cf6-db0d-1ebad2b3d9b2@gmail.com>
Date: Wed, 29 Mar 2023 11:55:01 -0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 6/6] rust: error: Add from_result() helper
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
 <20230224-rust-error-v2-6-3900319812da@asahilina.net>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230224-rust-error-v2-6-3900319812da@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/29/23 09:04, Asahi Lina wrote:
> [...]
> 
> +
> +/// Calls a closure returning a [`crate::error::Result<T>`] and converts the result to
> +/// a C integer result.
> +///
> +/// This is useful when calling Rust functions that return [`crate::error::Result<T>`]
> +/// from inside `extern "C"` functions that need to return an integer error result.
> +///
> +/// `T` should be convertible from an `i16` via `From<i16>`.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// # use kernel::from_result;
> +/// # use kernel::bindings;
> +/// unsafe extern "C" fn probe_callback(
> +///     pdev: *mut bindings::platform_device,
> +/// ) -> core::ffi::c_int {
> +///     from_result(|| {
> +///         let ptr = devm_alloc(pdev)?;
> +///         bindings::platform_set_drvdata(pdev, ptr);
> +///         Ok(0)
> +///     })
> +/// }
> +/// ```
> +// TODO: Remove `dead_code` marker once an in-kernel client is available.
> +#[allow(dead_code)]
> +pub(crate) fn from_result<T, F>(f: F) -> T
> +where
> +    T: From<i16>,
> +    F: FnOnce() -> Result<T>,
> +{
> +    match f() {
> +        Ok(v) => v,
> +        // NO-OVERFLOW: negative `errno`s are no smaller than `-bindings::MAX_ERRNO`,
> +        // `-bindings::MAX_ERRNO` fits in an `i16` as per invariant above,
> +        // therefore a negative `errno` always fits in an `i16` and will not overflow.
> +        Err(e) => T::from(e.to_errno() as i16),
> +    }
> +}
> 

Reviewed-by: Martin Rodriguez Reboredo
