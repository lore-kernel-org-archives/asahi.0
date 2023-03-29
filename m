Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF74AFF4
	for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 14:47:42 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id w13so370967oik.2
        for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 07:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680101262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXBqzVlrFRt5YtMWe/wv26dM8rUqdeUJBzFLACIXocU=;
        b=h8dOBgu5K5HtZFYHFm7gq4Ng+p4q+BT6YRGX0QCSa9PR/lBjQdMhr56cHlFRmPOcwM
         jEFGueBVPNeP38jfo/uYdMo0VY8fxG3l30CJSKb047fTxjJEcyoP0AeKU097gVPhNdcL
         UnutSu7hssch1ZespwaVB0CS6B32PXQlB/WFWqKmxT1zqc0NZ4wA7EnzmmhHx8XHQ8nv
         SB7ky8Hp22VUF1weadMY6LShg4J5RyViSSeyidqV1U1U7iDb5xTpngLl7lZ0kmZCas8y
         d/OUrY1nTjo207/0SjaHgPF63j4FIh1uXgF8Kp+f441DEdH3gzkGtcjmWrt8+oazbkVF
         rKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680101262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OXBqzVlrFRt5YtMWe/wv26dM8rUqdeUJBzFLACIXocU=;
        b=yXk3ZO234cZeAXsrj4MhtQEgG8bDNLDym5om+nuzOGNT2CWHJ8vZ6T2zZc32ab7p06
         TMBaQkpUl1FnbS8i2ndJ8O0QANqx50aR2F8r2R7ali/bEArtbAR7CTfozeeCuc3NbvPI
         3DwqinpSLDvJegi76FDk8VuAzHcfjEtcIMJ5krI9jToz9H9rZBl7QM58YW5YUEEJdAL1
         KklIlxtQQvolLlK5A/SdA6eNPzZfu+LburRUPgR6kUbAXvJcxO8uKNuTAZppMGViSBOb
         VA4yCpLKdY8cUbKXGHQZZlD8CgLSDXq5YsoGopkY6bkLtKvFy8on5aDQ0eGS9X9e/OSK
         POig==
X-Gm-Message-State: AO0yUKWp5AqRKzeiZR5OaLm5VBOjIDY8o3nOTEP7HKZtPfQBLXC1IjUT
	4/FmQM52ndLiqKfwtMYeIq8=
X-Google-Smtp-Source: AK7set9pyV7+2EOOD9QC0w1Kjlj4Nucya/1GCIeVTBAJw811qo3Fxz9RUqKEsBnwjcQbApog1WUJ2g==
X-Received: by 2002:a05:6808:659:b0:383:e7c8:4000 with SMTP id z25-20020a056808065900b00383e7c84000mr8531757oih.13.1680101261977;
        Wed, 29 Mar 2023 07:47:41 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id s186-20020acac2c3000000b00383cc29d6b2sm13506162oif.51.2023.03.29.07.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 07:47:41 -0700 (PDT)
Message-ID: <0849f870-2d95-8c3a-c7dc-2b18dcee4c65@gmail.com>
Date: Wed, 29 Mar 2023 11:47:37 -0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/6] rust: error: Rename to_kernel_errno() ->
 to_errno()
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
 <20230224-rust-error-v2-1-3900319812da@asahilina.net>
Content-Language: en-US
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230224-rust-error-v2-1-3900319812da@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/29/23 09:04, Asahi Lina wrote:
> This is kernel code, so specifying "kernel" is redundant. Let's simplify
> things and just call it to_errno().
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  rust/kernel/error.rs  | 2 +-
>  rust/macros/module.rs | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 5b9751d7ff1d..35894fa35efe 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -73,7 +73,7 @@ pub struct Error(core::ffi::c_int);
>  
>  impl Error {
>      /// Returns the kernel error code.
> -    pub fn to_kernel_errno(self) -> core::ffi::c_int {
> +    pub fn to_errno(self) -> core::ffi::c_int {
>          self.0
>      }
>  }
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index a7e363c2b044..143336543866 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -258,7 +258,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
>                          return 0;
>                      }}
>                      Err(e) => {{
> -                        return e.to_kernel_errno();
> +                        return e.to_errno();
>                      }}
>                  }}
>              }}
> 

Reviewed-by: Martin Rodriguez Reboredo
