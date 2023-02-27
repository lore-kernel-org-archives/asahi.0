Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA086AAE
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 13:28:42 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id d30so25794201eda.4
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 05:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=+mE5gZc6viG/xXOsPF+F+4EMY6E1n4H7xrKSm+Ny0wU=;
        b=RPsVl1pelawQdZFTgN5E3b042km9q3OpmP9vlTAn4emotmAngVfbo2/rBicZ1Pdcqg
         UYEcT4Blo5vl3aTuUFSetJwe+nQQtI/wDeUezLQ58XypftLtLEx49mtLeaY7uOMfPzGQ
         TJdpPF0ROiLD+uEDJf+tsXWsB+i8iIDr36RK6JyOG+T+rlMiBtpZCJlSd2gb3RRMVyyC
         UrSdmqYR0QvV6bsS3ZUwIgegzKA28O4nA/Rj9eUMDMSV6kfpBoI06+eJu7Pc+Nfk+OFP
         FnApEHPONZNf5TPHnrSjqTXbmg+01oeMKes6LRSVYawaUL3/bmaJKkwA5oBEsj/exO2l
         up0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mE5gZc6viG/xXOsPF+F+4EMY6E1n4H7xrKSm+Ny0wU=;
        b=iQuAqqyhMfUoF9Zo+fm8cwH6Xlm8WLdvuk7WB9+48LPTslLhC3CVvRlNHmon+miYTh
         lr6NeFuYMucNJo67289pDRJC5PsXbZutleCa3ktOcfWLH1xO8GJzCSxlJwpr1lHAAq0X
         4eOwzv/dHfuPNcDKIW2RVfqnDWGc0XUY2D8VOOtVC+E2tMKCdyuVF5yAxZWRB5Z/mZp+
         6qniaRVFtaMGTd+m8c7fxdbNZA11+JNgRHK6QDgPaCGCK/Hqww38WqvTvi1zC/iSE1sG
         wlsMd6Qy2ITuFMb8cVykRuSLD0lBMI8SFlr7Lw1YHtcQlWDgch0jvkz5Z53wcl/jTefo
         ZWPQ==
X-Gm-Message-State: AO0yUKWyq/1PdycnahmnyTZNrhWzT6OtsYbzXY8YPPR35oHZcSpUYv2u
	MVbbHOvo4XNfi3SyR18NlUFPDg==
X-Google-Smtp-Source: AK7set9nqaifHxGsTvMKC77HnKFJJaZIb/iugkiKGlhVtmtoXmZ+i/7pzOdwMnhvj2jkpONQrSu7GA==
X-Received: by 2002:a05:6402:31fb:b0:4ac:d2bc:32f9 with SMTP id dy27-20020a05640231fb00b004acd2bc32f9mr24372223edb.4.1677504520550;
        Mon, 27 Feb 2023 05:28:40 -0800 (PST)
Received: from localhost ([194.62.217.2])
        by smtp.gmail.com with ESMTPSA id jj22-20020a170907985600b008b17879ec95sm3206035ejc.22.2023.02.27.05.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 05:28:40 -0800 (PST)
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
 <20230224-rust-error-v1-2-f8f9a9a87303@asahilina.net>
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
Subject: Re: [PATCH 2/5] rust: error: Add Error::from_kernel_errno()
Date: Mon, 27 Feb 2023 14:27:44 +0100
In-reply-to: <20230224-rust-error-v1-2-f8f9a9a87303@asahilina.net>
Message-ID: <87edqb9r08.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Asahi Lina <lina@asahilina.net> writes:

> From: Miguel Ojeda <ojeda@kernel.org>
>
> Add a function to create `Error` values out of a kernel error return,
> which safely upholds the invariant that the error code is well-formed
> (negative and greater than -MAX_ERRNO). If a malformed code is passed
> in, it will be converted to EINVAL.
>
> Lina: Imported from rust-for-linux/rust as authored by Miguel and Fox
> with refactoring from Wedson.
>
> Co-developed-by: Fox Chen <foxhlchen@gmail.com>
> Signed-off-by: Fox Chen <foxhlchen@gmail.com>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

>  rust/kernel/error.rs | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 8611758e27f4..3b439fdb405c 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -72,6 +72,25 @@ pub mod code {
>  pub struct Error(core::ffi::c_int);
>  
>  impl Error {
> +    /// Creates an [`Error`] from a kernel error code.
> +    ///
> +    /// It is a bug to pass an out-of-range `errno`. `EINVAL` would
> +    /// be returned in such a case.
> +    pub(crate) fn from_kernel_errno(errno: core::ffi::c_int) -> Error {
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
>      pub fn to_kernel_errno(self) -> core::ffi::c_int {
>          self.0

