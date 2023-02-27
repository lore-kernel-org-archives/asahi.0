Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F5E6AAE
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 13:27:08 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id i34so25749732eda.7
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 05:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=dJHsyePsJ0IlFQj6Pckv4AAM6go6Zr87xa6U4baD+nY=;
        b=ZTrP0zLV5ChL3MaT5FYI7oRx6ffD/UpKTPVhcdGRnds3z8oC/bPEPYDSj1Im6JeSzD
         91yBwW/+8Of76hbKN7wYFy1WeXPKtL/VfyKZfzbb+uYSTY8gTNa5SnZvyC42W815SZcr
         HGqwcTRmTxWAlS89GqvzcmJoTgMRFv/Q0GUh+QF0xUpTLQFzEquBNELCctmkta2YsVhu
         EKNrzuO0IfQJYjBeIluw6LwcRuMm5E5RUOZaXY5GuQ4A9cBa1d8BcXGPfRdZWophEa9p
         0FDUWXxFdj65NZ4CCHNIB0sGTlO5alCNvwidb2RrESaQ7A5Mw1Sd5ZRK/qwsklGtLOOA
         piTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJHsyePsJ0IlFQj6Pckv4AAM6go6Zr87xa6U4baD+nY=;
        b=JEfB9xKjjHg3NSM7cVabX+tfIQTJhYUZyEGDDlXcthR34oVwqtGg76zEBs7I76aCgU
         yrxBkaprF9pebYapgVOUU/afHrAA1XyL4DE923fCFclmMI0x90SzC4IwVD6KGI+BYQ7M
         dZ0Xp0UdzyhJABMRsXrpLBhGL6wkipmcv2gtadFcDDritQlTE+CtOGkwSz2f+fMW2Rvq
         fapm24aNoKm69R4V15HqF5X7Zf0xBSPVRXvUAwK9RtsO6mAqV7MpHRz+AvxSumKyYOMJ
         RX9xXlS5+82wzyfXv83T/GhpG2R7StPrXCNDVimrie/V8OtBiOUhPNhnsq5gUxlQZD45
         VGhA==
X-Gm-Message-State: AO0yUKW8EON9imIbUpTPZsLvt8SZRjLz1sYxyoYbuU16YAW/kaBXeOne
	RnMf1YKOoOwke06mpuHU2KA2XA==
X-Google-Smtp-Source: AK7set9x5+NXrg0tuo8N9uBs22352iEOi22KS9wUDCnwIejgR5iMBbZgAX5tfWOnGM5EhMxFr+uWSQ==
X-Received: by 2002:a17:907:a801:b0:8af:4120:63a8 with SMTP id vo1-20020a170907a80100b008af412063a8mr36187922ejc.68.1677504427018;
        Mon, 27 Feb 2023 05:27:07 -0800 (PST)
Received: from localhost ([194.62.217.2])
        by smtp.gmail.com with ESMTPSA id z13-20020a170906814d00b008edc39530fbsm3203250ejw.219.2023.02.27.05.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 05:27:06 -0800 (PST)
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
 <20230224-rust-error-v1-3-f8f9a9a87303@asahilina.net>
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
Subject: Re: [PATCH 3/5] rust: error: Add to_result() helper
Date: Mon, 27 Feb 2023 14:26:02 +0100
In-reply-to: <20230224-rust-error-v1-3-f8f9a9a87303@asahilina.net>
Message-ID: <87lekj9r2u.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Asahi Lina <lina@asahilina.net> writes:

> From: Wedson Almeida Filho <wedsonaf@gmail.com>
>
> Add a to_result() helper to convert kernel C return values to a Rust
> Result, mapping >=0 values to Ok(()) and negative values to Err(...),
> with Error::from_kernel_errno() ensuring that the errno is within range.
>
> Lina: Imported from rust-for-linux/rust, originally developed by Wedson
> as part of the AMBA device driver support.
>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

>  rust/kernel/error.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 3b439fdb405c..1e8371f28746 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -167,3 +167,13 @@ impl From<core::convert::Infallible> for Error {
>  /// it should still be modeled as returning a `Result` rather than
>  /// just an [`Error`].
>  pub type Result<T = ()> = core::result::Result<T, Error>;
> +
> +/// Converts an integer as returned by a C kernel function to an error if it's negative, and
> +/// `Ok(())` otherwise.
> +pub fn to_result(err: core::ffi::c_int) -> Result {
> +    if err < 0 {
> +        Err(Error::from_kernel_errno(err))
> +    } else {
> +        Ok(())
> +    }
> +}

