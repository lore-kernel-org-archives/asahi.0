Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C314110D
	for <asahi@lists.linux.dev>; Tue, 21 Feb 2023 07:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676964354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JPIAZdGy9OlnE1O1SS60YxZ8brGuCruddGUDSBr1OzI=;
	b=UaCJcMo7UbVRN40SZ7b13mIsDVRtkVXs/ZoD9l6jx1S70RYzznZkUeWZxD99tSClBE258G
	8rZAVSS6/hDM7/X/DPj6GktXdb72EJkpXKJbf6yeuOKP+9lSDa1rDc7lUw5p1OPzm/bDYY
	O13lFO2ypO+tdYpxBmVBzTOhfoImUhw=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-lArl_7cLOBK9E4iYSj8iew-1; Tue, 21 Feb 2023 02:25:52 -0500
X-MC-Unique: lArl_7cLOBK9E4iYSj8iew-1
Received: by mail-vk1-f199.google.com with SMTP id q71-20020a1f434a000000b004017fe9ff79so1275573vka.14
        for <asahi@lists.linux.dev>; Mon, 20 Feb 2023 23:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPIAZdGy9OlnE1O1SS60YxZ8brGuCruddGUDSBr1OzI=;
        b=Df6LMoat32R2hnjZfCS8sh4xPgeK70ndASS+DGQ93Yhi3VK123L+7CdK9vyV+ZN3aF
         QtSiUbTyNTiQopwedGtqV96cybd9Ackn+/a+8YR78DgEzsfFjp+llaKpuE1dPfo6QwrM
         rQrcjEpqSUFDDX7vkCoDpSE/my8YN8il+bHZobWO61SBxxCYSfoHSVLl0mu+3haJ1Hl+
         jayADcZE6wuKYoPW91bUX8Q0dxxKXVB29cUfwyKgdiZIs74cpamIse4YdSJrWk+1Dd1F
         AphODJl865uxhsXPFxmZMRYdqTIJrX8tVO16Z3nrAL3Pb8BxYif1sYe8f7BB0rsOVtUA
         nYtw==
X-Gm-Message-State: AO0yUKXQOm2O6L4QfoYfrnwSxGHSJnFyJwATBog5TWp6n2z0JuNOIwnD
	231UjHjRZ+XD6HeX8unEXUDCY5pDFwZrvFNY8fr2POGU+c7XSV6bbG7wG+UIdRJ1CN+9ca0a/C1
	Cmay6z4pvkx4z4Av81Z7rVo7R7eTsuBc=
X-Received: by 2002:a05:6102:f0a:b0:411:bd2e:11ac with SMTP id v10-20020a0561020f0a00b00411bd2e11acmr748822vss.75.1676964351943;
        Mon, 20 Feb 2023 23:25:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+QzMJrGZDcal2v3DamPgxlNnPNto6IxZHAfuHD9KBnKa+B4kexA0i1IiOd075Fe4xK51ciiQNNhbdDUty1Qpc=
X-Received: by 2002:a05:6102:f0a:b0:411:bd2e:11ac with SMTP id
 v10-20020a0561020f0a00b00411bd2e11acmr748816vss.75.1676964351730; Mon, 20 Feb
 2023 23:25:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230221-gpu-up-time-v1-1-bf8fe74b7f55@asahilina.net>
In-Reply-To: <20230221-gpu-up-time-v1-1-bf8fe74b7f55@asahilina.net>
From: Eric Curtin <ecurtin@redhat.com>
Date: Tue, 21 Feb 2023 07:25:35 +0000
Message-ID: <CAOgh=Fw634rgNCzx+mMEQayhGKgUiBYsqpF7rFOz+q4DS1_kag@mail.gmail.com>
Subject: Re: [PATCH] rust: time: New module for timekeeping functions
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	asahi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Feb 2023 at 07:16, Asahi Lina <lina@asahilina.net> wrote:
>
> This module is intended to contain functions related to kernel
> timekeeping and time. Initially, this just wraps ktime_get() and
> ktime_get_boottime() and returns them as core::time::Duration instances.
> This is useful for drivers that need to implement simple retry loops and
> timeouts.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Nice and simple C interface to create Rust abstractions for.

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

>  rust/bindings/bindings_helper.h |  4 +++-
>  rust/kernel/lib.rs              |  1 +
>  rust/kernel/time.rs             | 25 +++++++++++++++++++++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 75d85bd6c592..587f3d1c0c9f 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -6,8 +6,10 @@
>   * Sorted alphabetically.
>   */
>
> -#include <linux/slab.h>
> +#include <linux/ktime.h>
>  #include <linux/refcount.h>
> +#include <linux/slab.h>
> +#include <linux/timekeeping.h>
>
>  /* `bindgen` gets confused at certain things. */
>  const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 223564f9f0cc..371b1b17570e 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -37,6 +37,7 @@ mod static_assert;
>  pub mod std_vendor;
>  pub mod str;
>  pub mod sync;
> +pub mod time;
>  pub mod types;
>
>  #[doc(hidden)]
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> new file mode 100644
> index 000000000000..02844db47d34
> --- /dev/null
> +++ b/rust/kernel/time.rs
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Timekeeping functions.
> +//!
> +//! C header: [`include/linux/ktime.h`](../../../../include/linux/ktime.h)
> +//! C header: [`include/linux/timekeeping.h`](../../../../include/linux/timekeeping.h)
> +
> +use crate::bindings;
> +use core::time::Duration;
> +
> +/// Returns the kernel time elapsed since boot, excluding time spent sleeping, as a [`Duration`].
> +pub fn ktime_get() -> Duration {
> +    // SAFETY: Function has no side effects and no inputs.
> +    Duration::from_nanos(unsafe { bindings::ktime_get() }.try_into().unwrap())
> +}
> +
> +/// Returns the kernel time elapsed since boot, including time spent sleeping, as a [`Duration`].
> +pub fn ktime_get_boottime() -> Duration {
> +    Duration::from_nanos(
> +        // SAFETY: Function has no side effects and no variable inputs.
> +        unsafe { bindings::ktime_get_with_offset(bindings::tk_offsets_TK_OFFS_BOOT) }
> +            .try_into()
> +            .unwrap(),
> +    )
> +}
>
> ---
> base-commit: 89f5349e0673322857bd432fa23113af56673739
> change-id: 20230221-gpu-up-time-ea9412204c3b
>
> Thank you,
> ~~ Lina
>
>

