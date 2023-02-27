Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED23211F
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 11:48:08 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id i34so24579215eda.7
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 03:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=t1OjyobwWiaHh7+rjZmP3kOsw+ZJ6qE24StYRceK6RM=;
        b=MfdeUyIDihZkqJ66TOuvcdrwIcHQ75gXPd4mefzW/M7pgeUQx+DEGAJAHTMwMz1Nkf
         s7nbTMT5hdOhZoImaVrzzn6m69X7sWn39jYWNsTGPS09Qf/4elBPgqk4XM/w7ZiKNl4i
         Qgy082SanNeIZThw+apmfj9ki5WIKRMJk1E+01j9HQRGrDVTnb5pM9yQHqyEA2JyyUZ5
         oddyYRJhtc7Cvup9vnC+qhDWI7eWsSEDFizdpGdck57dtwE4hiNfARcqsPw9nNF8wLYY
         jG623rPtKr6+hAJm0lv+xaIiz+VUHHGpDoJvkJXBPk9EsQLL1RqYEAp75UfzYLAn1tl4
         3ZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1OjyobwWiaHh7+rjZmP3kOsw+ZJ6qE24StYRceK6RM=;
        b=fE6ipUs8GlhcUcQaHARiEu8AiPEqV37PZvmCH/giNHRsTMX/yufLaBiWT9D5CQlPqr
         y29iDzsFzD6eKBZWqxurdzNhpkLlbx4EMleISdUOkkLeElYIPQqW/02mMcJIUV9OdG/7
         pkFg5RzeVmrH3vrA4b1gAgQBexqGgjnlkggnqQyN3Ec2sOllU7ye762VFOuUAZQRNZQg
         jnwxRXb+5WWVPbi1NB1wIpaTJdH5djr/qVIDnMI9vosLgBr8VsGyRi3sZEJvSCO9DIOu
         OlD0qXDurRfPQ2doduDzfRu/1/5MajDW4o2wzQAZoRkdo1+vnTBPLlRq6oUyMRNQouih
         NCkQ==
X-Gm-Message-State: AO0yUKWiH1Hp/b1x54oDXgVkNPX0r1Vd2aHHjP+YcWjgTMgPRTCSNNkK
	PwpJqBQRcxScgtPFI1Km392BYA==
X-Google-Smtp-Source: AK7set9v950DkyFJ1v+RucxsNpv6om7VK65PomdteoJ7mIeN1x5e3U9BeP6uh30f6f8UjJi+wGVFPA==
X-Received: by 2002:a17:906:730c:b0:878:79e6:4672 with SMTP id di12-20020a170906730c00b0087879e64672mr41427544ejc.42.1677498486597;
        Mon, 27 Feb 2023 03:48:06 -0800 (PST)
Received: from localhost ([194.62.217.2])
        by smtp.gmail.com with ESMTPSA id ky7-20020a170907778700b008db605598b9sm3166679ejc.67.2023.02.27.03.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:48:06 -0800 (PST)
References: <20230224-rust-arc-v1-0-568eea613a41@asahilina.net>
 <20230224-rust-arc-v1-1-568eea613a41@asahilina.net>
User-agent: mu4e 1.9.18; emacs 28.2.50
From: Andreas Hindborg <nmi@metaspace.dk>
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH 1/2] rust: sync: arc: implement Arc<dyn Any + Send +
 Sync>::downcast()
Date: Mon, 27 Feb 2023 12:46:45 +0100
In-reply-to: <20230224-rust-arc-v1-1-568eea613a41@asahilina.net>
Message-ID: <87356rba8a.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Asahi Lina <lina@asahilina.net> writes:

> This mirrors the standard library's alloc::sync::Arc::downcast().
>
> Based on the Rust standard library implementation, ver 1.62.0,
> licensed under "Apache-2.0 OR MIT", from:
>
>     https://github.com/rust-lang/rust/tree/1.62.0/library/alloc/src
>
> For copyright details, please see:
>
>     https://github.com/rust-lang/rust/blob/1.62.0/COPYRIGHT
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

>  rust/kernel/sync/arc.rs | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index a94e303217c6..752bd7c4699e 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -22,6 +22,7 @@ use crate::{
>  };
>  use alloc::boxed::Box;
>  use core::{
> +    any::Any,
>      fmt,
>      marker::{PhantomData, Unsize},
>      mem::{ManuallyDrop, MaybeUninit},
> @@ -220,6 +221,27 @@ impl<T: 'static> ForeignOwnable for Arc<T> {
>      }
>  }
>  
> +impl Arc<dyn Any + Send + Sync> {
> +    /// Attempt to downcast the `Arc<dyn Any + Send + Sync>` to a concrete type.
> +    // Based on the Rust standard library implementation, ver 1.62.0, which is
> +    // Apache-2.0 OR MIT.
> +    pub fn downcast<T>(self) -> core::result::Result<Arc<T>, Self>
> +    where
> +        T: Any + Send + Sync,
> +    {
> +        if (*self).is::<T>() {
> +            // SAFETY: We have just checked that the type is correct, so we can cast the pointer.
> +            unsafe {
> +                let ptr = self.ptr.cast::<ArcInner<T>>();
> +                core::mem::forget(self);
> +                Ok(Arc::from_inner(ptr))
> +            }
> +        } else {
> +            Err(self)
> +        }
> +    }
> +}
> +
>  impl<T: ?Sized> Deref for Arc<T> {
>      type Target = T;

