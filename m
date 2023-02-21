Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EC51FBF
	for <asahi@lists.linux.dev>; Tue, 21 Feb 2023 11:33:00 +0000 (UTC)
Date: Tue, 21 Feb 2023 11:23:09 +0000
Authentication-Results: mail-4321.protonmail.ch;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="n+mPof8v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1676978604; x=1677237804;
	bh=FUM4YFfkGx1kmwu6CRIbJk59at5i8sgLaWNEBJR+WDE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=n+mPof8vZAPn1R4vMPLzY6/r82O2gsTgrqgI8Rx1hrgWwR6lhmpmoxgLbeKK+qD9d
	 H+DI9JWETLypUx/V5TJnrmg8sWC8X1/mRsI/iith226twKjfcdq8j78Ur2axJgQ6Bg
	 CL3P1WN1pHjsM9s4feA64hpnuT2sJhdDWIPj+pBizRsK0gf6O+3e68z6pgnFHKZW4B
	 SITHVBUP4M/5NwAdDv6tMvSSS1YxNpbUNCZSlCXhnH8g5wbUwve2T8X9g59RsI3nq+
	 GD1dNDET8SrOF9qHKR8cKhKgbp2/Q8VPnQTu/FgG9iFhUV261BdAsoHcS/oi5uV/rK
	 7XQk0k6rzI2RQ==
To: Asahi Lina <lina@asahilina.net>
From: =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH] rust: time: New module for timekeeping functions
Message-ID: <cZTGCCR7h2Foi4V_jJVIBGj74UpVRYHnay_ia7nqy_1MBNIj8Ntlux3waD0xJAhvSp4wkBfZ_fo7t90PPfZdfzUIUTa2To27EMfLzY4qUTk=@protonmail.com>
In-Reply-To: <20230221-gpu-up-time-v1-1-bf8fe74b7f55@asahilina.net>
References: <20230221-gpu-up-time-v1-1-bf8fe74b7f55@asahilina.net>
Feedback-ID: 27884398:user:proton
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, February 21st, 2023 at 08:06, Asahi Lina <lina@asahilina.net> w=
rote:

> This module is intended to contain functions related to kernel
> timekeeping and time. Initially, this just wraps ktime_get() and
> ktime_get_boottime() and returns them as core::time::Duration instances.
> This is useful for drivers that need to implement simple retry loops and
> timeouts.
>=20
> Signed-off-by: Asahi Lina lina@asahilina.net
>=20
> ---
>  rust/bindings/bindings_helper.h |  4 +++-
>  rust/kernel/lib.rs              |  1 +
>  rust/kernel/time.rs             | 25 +++++++++++++++++++++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 75d85bd6c592..587f3d1c0c9f 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -6,8 +6,10 @@
>   * Sorted alphabetically.
>   */
>=20
> -#include <linux/slab.h>
> +#include <linux/ktime.h>
>  #include <linux/refcount.h>
> +#include <linux/slab.h>
> +#include <linux/timekeeping.h>
>=20
>  /* `bindgen` gets confused at certain things. */
>  const gfp_t BINDINGS_GFP_KERNEL =3D GFP_KERNEL;
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
>=20
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
> +//! C header: [`include/linux/ktime.h`](../../../../include/linux/ktime.=
h)
> +//! C header: [`include/linux/timekeeping.h`](../../../../include/linux/=
timekeeping.h)
> +
> +use crate::bindings;
> +use core::time::Duration;
> +
> +/// Returns the kernel time elapsed since boot, excluding time spent sle=
eping, as a [`Duration`].
> +pub fn ktime_get() -> Duration {
> +    // SAFETY: Function has no side effects and no inputs.
> +    Duration::from_nanos(unsafe { bindings::ktime_get() }.try_into().unw=
rap())

ktime_t seems to be a signed 64bit int, while Duration::from_nanos expects =
an unsigned 64bit int. Based on https://lore.kernel.org/all/alpine.DEB.2.21=
.1903231125480.2157@nanos.tec.linutronix.de/T/#u I think it is fine to cast=
 directly to u64 without doing the overflow check of try_into. This would e=
liminate a potential BUG() call. I think it would be fine to keep as is if =
you prefer though. As such:

Reviewed-by: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>

Cheers,
Bjorn

> +}
> +
> +/// Returns the kernel time elapsed since boot, including time spent sle=
eping, as a [`Duration`].
> +pub fn ktime_get_boottime() -> Duration {
> +    Duration::from_nanos(
> +        // SAFETY: Function has no side effects and no variable inputs.
> +        unsafe { bindings::ktime_get_with_offset(bindings::tk_offsets_TK=
_OFFS_BOOT) }
> +            .try_into()
> +            .unwrap(),
> +    )
> +}
>=20
> ---
> base-commit: 89f5349e0673322857bd432fa23113af56673739
> change-id: 20230221-gpu-up-time-ea9412204c3b
>=20
> Thank you,
> ~~ Lina
