Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC38E33D6
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 14:34:35 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id c11so16678735oiw.2
        for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 06:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7f5POC95tWdgN8iOavzbfp8kNM32j24hhcNafGkcLU=;
        b=OEIHtp3hjddjSuARK4ULbWTX4MT7gugGdNIgP+ixZSFAmqNxBjhfLGg6lN8V0yrkE+
         Ecp2AJ1W5kQAScuEqnTDwlTPHkXct0ESXMIa/YbakdRFq137JSsarzhdj01PH5Tj88Fr
         edMufsLQ7DH4z2/tQM++n6TZ3JpJv0wcI825zlf7yruBKv+ToXuFk+UgD35+8N0KVx0B
         0XQzWdW+RMHfQ2+IGaI2xIOIm48FoyYMwU6czsFJfWQu0ACpQsMs+vF1VWJSe1vZEgWL
         PvC4C/2DqEnFsdjTAJyU8OaSTUPg1fD6/Ktb39c8CVwDnaZM/hMqemYhJgtBxMfCl4Kj
         nIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7f5POC95tWdgN8iOavzbfp8kNM32j24hhcNafGkcLU=;
        b=JqAf/RMr8T2uR/mp4xCUwNZz0xqZu059keL+FyBaqetcptp4l1sPiV7y/odFNJYhsf
         TUCS2OnzSFyZg15nk/T3iRPkh7kX/MqE7UIrDYppr9yjEuoeosFw4mM2lHzUbX58dv0c
         Iwpg1be25zgJv7KWErd0XBwDNLaTCLLIEllSHIWVx1gGfin8rh7HHqSwrHxQ5DpD+wZh
         nSI9UXQSEtYZUSpS7P+PCYyxUo3GHCVrTAYP60R4fEbLPU2RZ6xPbeMqv2eKLxvZtwmb
         DaZ/yA7gj84N/dRcbbtlMKV14D7lUlkgYvjqODmpLOket4nPQsCVYK7o4roFSVoJdpqn
         8o6w==
X-Gm-Message-State: AO0yUKUrergywDEZ0f7Oc2+Ni9nO4JS5TYx5WN55kpUiDdRT67F6+sYk
	ox4T12CzMPvTX+JBsd2ZErk=
X-Google-Smtp-Source: AK7set/LXiCHgH1qPHKSkOLgeyFj3sle61LItHwrs68Wk7g+vCtZIo8xVFWpymalNMwyXni2esdGfg==
X-Received: by 2002:a54:408d:0:b0:384:833:2a79 with SMTP id i13-20020a54408d000000b0038408332a79mr306634oii.48.1677249274683;
        Fri, 24 Feb 2023 06:34:34 -0800 (PST)
Received: from tx3000mach.io (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id p129-20020acaf187000000b0037d59e90a07sm657005oih.55.2023.02.24.06.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 06:34:34 -0800 (PST)
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
To: lina@asahilina.net
Cc: alex.gaynor@gmail.com,
	asahi@lists.linux.dev,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	wedsonaf@gmail.com
Subject: Re: [PATCH 1/2] rust: sync: arc: implement Arc<dyn Any + Send + Sync>::downcast()
Date: Fri, 24 Feb 2023 11:34:29 -0300
Message-Id: <20230224143429.754374-1-yakoyoku@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224-rust-arc-v1-1-568eea613a41@asahilina.net>
References: <20230224-rust-arc-v1-1-568eea613a41@asahilina.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 05:09:47PM +0900, Asahi Lina wrote:=0D
> This mirrors the standard library's alloc::sync::Arc::downcast().=0D
> =0D
> Based on the Rust standard library implementation, ver 1.62.0,=0D
> licensed under "Apache-2.0 OR MIT", from:=0D
> =0D
>     https://github.com/rust-lang/rust/tree/1.62.0/library/alloc/src=0D
> =0D
> For copyright details, please see:=0D
> =0D
>     https://github.com/rust-lang/rust/blob/1.62.0/COPYRIGHT=0D
> =0D
> Signed-off-by: Asahi Lina <lina@asahilina.net>=0D
> ---=0D
>  rust/kernel/sync/arc.rs | 22 ++++++++++++++++++++++=0D
>  1 file changed, 22 insertions(+)=0D
> =0D
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs=0D
> index a94e303217c6..752bd7c4699e 100644=0D
> --- a/rust/kernel/sync/arc.rs=0D
> +++ b/rust/kernel/sync/arc.rs=0D
> @@ -22,6 +22,7 @@ use crate::{=0D
>  };=0D
>  use alloc::boxed::Box;=0D
>  use core::{=0D
> +    any::Any,=0D
>      fmt,=0D
>      marker::{PhantomData, Unsize},=0D
>      mem::{ManuallyDrop, MaybeUninit},=0D
> @@ -220,6 +221,27 @@ impl<T: 'static> ForeignOwnable for Arc<T> {=0D
>      }=0D
>  }=0D
>  =0D
> +impl Arc<dyn Any + Send + Sync> {=0D
> +    /// Attempt to downcast the `Arc<dyn Any + Send + Sync>` to a concre=
te type.=0D
> +    // Based on the Rust standard library implementation, ver 1.62.0, wh=
ich is=0D
> +    // Apache-2.0 OR MIT.=0D
> +    pub fn downcast<T>(self) -> core::result::Result<Arc<T>, Self>=0D
> +    where=0D
> +        T: Any + Send + Sync,=0D
> +    {=0D
> +        if (*self).is::<T>() {=0D
> +            // SAFETY: We have just checked that the type is correct, so=
 we can cast the pointer.=0D
> +            unsafe {=0D
> +                let ptr =3D self.ptr.cast::<ArcInner<T>>();=0D
> +                core::mem::forget(self);=0D
=0D
I see, we cast the inner pointer of the `Arc` to the target type which=0D
is wrapped in an `ArcInner` that is then used for another `Arc`. This is=0D
important as this new value now owns the pointer and, by consequence,=0D
it is safe to forget the passed `Arc` as it won't leak the pointer.=0D
Thus, this method is safe.=0D
=0D
> +                Ok(Arc::from_inner(ptr))=0D
> +            }=0D
> +        } else {=0D
> +            Err(self)=0D
> +        }=0D
> +    }=0D
> +}=0D
> +=0D
>  impl<T: ?Sized> Deref for Arc<T> {=0D
>      type Target =3D T;=0D
=0D
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>=0D
