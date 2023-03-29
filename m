Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507372582
	for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 14:51:23 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id d22-20020a9d5e16000000b0069b5252ced7so8314158oti.13
        for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 07:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680101482;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8GFjElhqCLMzERYwAAA0Nzp/kLxcQM9qT27PjsYXOs=;
        b=F9B149N22yBYc7YeF/d/NSAyx+vnmJXkRHfjufvFttQOAp+lmKifseQKct9a1iEmLx
         KOGfH6ihnKDV4/5THJw/oarVCEtP6oXCaT0kQNiyL000LiZkX0AF2gdp5b7J43hBTBu3
         oXyM0hEfSjqNxsk6I2FhZhkw8n04AraDBVFmRrNBwxJvuZPt0qYonWFbiqw7InW3bZQB
         RrkWoWVHrQbFZIINKaZ0O1Q9f/Wb/5F1W0EzFA/mirpZaW5UmULI0S7zSz9rls9sLqYm
         0K8t874mle4c4YM+EwlTG0esGNb72D5+xttQcwwDhBuIe+yITnLrNL6sMhxuuX6pH4dP
         GfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680101482;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O8GFjElhqCLMzERYwAAA0Nzp/kLxcQM9qT27PjsYXOs=;
        b=ktnrMPSUj0JtH0aeufuuOyOoWFRA7qaV/41bXxsJU2xrNeeFRskTAfEhc9vGryw9NH
         fXWHs/SFSg8sN9DjF4IaxV5JQ+0gKzWlwPAlLuQs9XKsA4pOiUAWZWVyY8PHDC8S4d2k
         c65kKofyAt2TONsb6wMQ+99DQQ271K/co9W1HgFwfv1Ugg9fdNFyODuwWUlkmeZQGtEn
         GAiAIEinyG0snc5Gw27lxyUosldVAbUY/Gs687KhJ6J6rRNIInXJO2emcNRJSEuK8wF3
         3rjN9QOake8r5c044kKr+TmWQj0E/+e9a4D6t/n7RoFCTIY+Uqbfp6+g7IClKWjK0Mtw
         aYkQ==
X-Gm-Message-State: AO0yUKUXHOLOe/NC+7u+sNqTmLBkF2fxf7u2oLeJP/WbrGPHC5Z4fGWV
	MjS5B/Uv6yCIfqgOdpi97vo=
X-Google-Smtp-Source: AK7set9dwN8xEUSXnS3BblZm9+FADaRtU/jf/7cEU0TNr7ywoxq3aa9PB7+o5XRItuAfHNBimr3YeQ==
X-Received: by 2002:a05:6830:1044:b0:684:e788:eca9 with SMTP id b4-20020a056830104400b00684e788eca9mr9434148otp.17.1680101482473;
        Wed, 29 Mar 2023 07:51:22 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id d11-20020a05683018eb00b0069f1774cde8sm7447958otf.71.2023.03.29.07.51.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 07:51:22 -0700 (PDT)
Message-ID: <50995ce1-9a5e-df43-120f-dd72354160ba@gmail.com>
Date: Wed, 29 Mar 2023 11:51:18 -0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/6] rust: error: Add Error::from_errno()
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
 <20230224-rust-error-v2-3-3900319812da@asahilina.net>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230224-rust-error-v2-3-3900319812da@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/29/23 09:04, Asahi Lina wrote:
> [...]
>  
>  impl Error {
> +    /// Creates an [`Error`] from a kernel error code.
> +    ///
> +    /// It is a bug to pass an out-of-range `errno`. `EINVAL` would
> +    /// be returned in such a case.
> +    pub(crate) fn from_errno(errno: core::ffi::c_int) -> Error {
> +        if errno < -(bindings::MAX_ERRNO as i32) || errno >= 0 {
> +            // TODO: Make it a `WARN_ONCE` once available.
> +            crate::pr_warn!(
> +                "attempted to create `Error` with out of range `errno`: {}",
> +                errno
> +            );
> +            return code::EINVAL;
> +        }
> +
> +        // INVARIANT: The check above ensures the type invariant
> +        // will hold.
> +        Error(errno)
> +    }
> +
>      /// Returns the kernel error code.
>      pub fn to_errno(self) -> core::ffi::c_int {
>          self.0
> 

Reviewed-by: Martin Rodriguez Reboredo
