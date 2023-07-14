Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A0D11188
	for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 10:05:39 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fba03becc6so3678711e87.0
        for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 03:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689329137; x=1691921137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lC3KL2hS1JnlkqIBEqFx8ev38o43ew/IXaL/ADvToRw=;
        b=sGq92oZlq8xUWpYsUnoMDFKic+NBh+UNK7O9CoNl+52dqL38MkpJFDAzdpQNMEsTzc
         AhV7BaJ45jlODMxnOnKjBtPTlSeVjTFMV7D5GGPhuLJua0YMtq1NGIqU5VAc5wjPlaTH
         67kRS0OTicF3/F0ssY5LAV0WbGGSqDAP22oRYJ6qAvR4xDE+2n6W4fjOvxvt4HPd2gVR
         8gMy8tCyhhD8GHlp+wQUJzi7j/TpV27YIRleAD39vyREteCWNLB0RoF2Ihj2oCOuyI+a
         jtWOFfbqk3qgGIlp0HdEwApXPpaMNT8d4PV6AGFQgb91NwntynOdvoheAUEYQ3SZqcQF
         PoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689329137; x=1691921137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lC3KL2hS1JnlkqIBEqFx8ev38o43ew/IXaL/ADvToRw=;
        b=EE3grAl4l93FiM1EmHG9Jh2tHvZY5NBwQX9X7L8SGlWHqF6qWVPlVbk9rFfgeCdSKX
         FOkJf2Tt8tNsp0FK2fCU5JMbIZc2PrI0a4ysldiuH+5ydJssfn4qba1yRuaPt/ZUJXzJ
         +lu+oW6d2dbENn0q7sVV75kUv6Fjl1JaVX17/aYQB0dDb3vfkuvE4KpRWssnzFQLk7K+
         41jnKh3sw0kUyE83xiUkdR3zBIP5M0HqJH63AcCKwsPRQfdL/AAa8EMf+vC4Ytpit/Y3
         4Hy/SE7+UVrSr4I9VzeCiMWpOYZcw6vkvx9iZRXGfx29O6ZsVz4vWFnJUYHWyU8r9eSY
         lFhw==
X-Gm-Message-State: ABy/qLZvTl5J8MgUpOUiMDktR4xUC37AHlgnaedIaZf6VGZLFhtYHegi
	fkkY2MAKJ1YnFtkfcnUDk9K0ERRFD8ZO/qBmlc8=
X-Google-Smtp-Source: APBJJlGpmaod1q6JB0TeZZQvgjcZdV+jjuUg364ZTYvjCugWGsS7U7OSkLwyObWN1itUElPRsGJvSzIZ7ZKSPFpf2OE=
X-Received: by 2002:a05:6512:31ca:b0:4f6:e06:50bb with SMTP id
 j10-20020a05651231ca00b004f60e0650bbmr834325lfe.30.1689329137011; Fri, 14 Jul
 2023 03:05:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230714-cstring-debug-v1-1-4e7c3018dd4f@asahilina.net>
In-Reply-To: <20230714-cstring-debug-v1-1-4e7c3018dd4f@asahilina.net>
From: Ariel Miculas <ariel.miculas@gmail.com>
Date: Fri, 14 Jul 2023 13:05:25 +0300
Message-ID: <CAPDJoNv1HW-5uCj21PX3t23rJ+sbTL4Gm5pDis8HGJ-VTr4dug@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: str: Implement Debug for CString
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 12:39=E2=80=AFPM Asahi Lina <lina@asahilina.net> wr=
ote:
>
> Trivial implementation.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  rust/kernel/str.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index c9dd3bf59e34..a94e396d39e1 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -606,6 +606,12 @@ fn try_from(cstr: &'a CStr) -> Result<CString, Alloc=
Error> {
>      }
>  }
>
> +impl fmt::Debug for CString {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        fmt::Debug::fmt(&**self, f)
> +    }
> +}
> +
>  /// A convenience alias for [`core::format_args`].
>  #[macro_export]
>  macro_rules! fmt {
>
> ---
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> change-id: 20230714-cstring-debug-ca021fe0ad78
>
> Thank you,
> ~~ Lina
>

Glad I wasn't the only one missing this, now I don't have to write the
awkard `&*` anymore, as in:
```
pr_debug!("trying to open {:?}\n", &*filename);
```

Cheers,
Ariel
