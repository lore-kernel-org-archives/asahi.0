Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E477D18BC2C
	for <asahi@lists.linux.dev>; Sat, 23 Nov 2024 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732358903; cv=none; b=HwQC0xU4Ne82X0RWVSmw7/xv+yB1L9wtgjTqi/Xev7TeQr6uszBgx/DDBNrxbw2YImtkkkEp8PsWu8RWeQ/OqNLRhmvOCiZo2ORPpucofR6LwJhKKu8GY6Pttj7SWcFI0JisdLLhJas60oE6gDRbdrtIypUPc/KfP3exni58sq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732358903; c=relaxed/simple;
	bh=r7jkTWRRImviysAqQEkRsWICaxX544sMoYOb7mkNNrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sthfzx9E7R6WM92eiQ/npb01JABJedgVln78d8UhrTrJ6FPfq11lGbmG3XkKaLrJcSnUd94PPI4heVQVukAt2EUruLM5KRmW9v07JhxbTqufgjzU2zF1nrZgSzoxf8DY4FMUqVLoGJc2AvOmKNVzGrJGGMBGTEqgXN7ZR0jpPcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa4d257eb68so561284166b.0
        for <asahi@lists.linux.dev>; Sat, 23 Nov 2024 02:48:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732358900; x=1732963700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ptIQUIn7cNzyoLk0+AEkw/OY7tiye7SBbhAPQKbQ7k=;
        b=tqfzf1tnMLToJr1CKiZZx+E1vyU8kYX8a0cI1XnWLFdRLy/yZaMQFxLQPquWRgrqJo
         ey8WBY+schskP9bg6n1Vu+BWMvqIEJaGVJ49/lSRQyG0jJJ5PnGKvx6OXYijD99ndduV
         2Ctjyd3jL4CllWz9/GPMTAu2CZmHK8WoN772CDcTKgZ1abA0CXBs4U5saRPN59HobuUs
         7rqksiwseoIvqQLh6vuX1m8USpuUb+WbyjQMZn+QlEida8jW5QXDxJFpPVgn+9zCpDlm
         ocxG1UEVwnxFZjE8lNy8Jth2QjH0k3e+pMJUvSV4/7VBsQE+So2hstlTt5WAqDybsDqm
         SR/A==
X-Forwarded-Encrypted: i=1; AJvYcCUirhqde2xzMc3sOYs/+Ol1+Y0oMgJFNZuhVUb02XGqXA83A0epcNLCmnw0xEUtRjRkeB9HzA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMCeyHPpSS0fe1DJzS4vcsoFmbNKMpncs1zcXnHfjzw2HKTTjI
	IHNYv9xBfKv3CCPU+A0AA2yPPxisWE8sRxIRl5l6ay007OGOrPz3zDzDl4cauJ0=
X-Gm-Gg: ASbGncvdF0nH+ET0BpcEEAjKGAUqsiscgRMXtw1MGrda1tSDsRwrx9TfH7j/dRw62f5
	sxM4keJQTcFpsWgiLnS94uP5IZJbUKA+Mww/jzM0KHwCthN05nRbS3B/c1ooCFrRgUfx9OWC7go
	bUcqcFd977UCj44Vhtpi64caf/4OtPJCSdxpqwtnkp6LRJZKtwAKtRUa0UXgh5fvAhAQIwiCVy2
	pCJk5V5Mxc2wRfY2xfYlmgCwL6+UEpph9Q8xBAadIMYsWi1UKna6yu28SjNdJRLwVxIqt7IVRyw
	ROvX
X-Google-Smtp-Source: AGHT+IFHqj5nEeSLMLg26KY4hgNirB3kkCKJs5iX9B+p09LUop6BiBp1k3/4kFmfvqPKaJ03L1uuaQ==
X-Received: by 2002:a17:907:7b86:b0:a99:ffa9:a27 with SMTP id a640c23a62f3a-aa4efea7ac6mr855899666b.26.1732358899655;
        Sat, 23 Nov 2024 02:48:19 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b2f5fdesm208215966b.72.2024.11.23.02.48.19
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Nov 2024 02:48:19 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa4d257eb68so561280866b.0
        for <asahi@lists.linux.dev>; Sat, 23 Nov 2024 02:48:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwAN2KnjqSJ436HKa+HCpclUKtEK5HHjMxACIa2511kyZLQsqqRHsI6ZEmAPKHPJKRPc4ouQ==@lists.linux.dev
X-Received: by 2002:a17:906:314f:b0:a9e:85f8:2a3a with SMTP id
 a640c23a62f3a-aa509984a5dmr672670766b.2.1732358898807; Sat, 23 Nov 2024
 02:48:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241123-rust-fix-arraylayout-v1-1-197e64c95bd4@asahilina.net>
In-Reply-To: <20241123-rust-fix-arraylayout-v1-1-197e64c95bd4@asahilina.net>
From: Neal Gompa <neal@gompa.dev>
Date: Sat, 23 Nov 2024 05:47:42 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-rfJkPsR71W-ppcxZg+JJ_qZerx6rjOwMKXBUdKC7V5Q@mail.gmail.com>
Message-ID: <CAEg-Je-rfJkPsR71W-ppcxZg+JJ_qZerx6rjOwMKXBUdKC7V5Q@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: Fix `ArrayLayout` allocations
To: Asahi Lina <lina@asahilina.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Janne Grunau <j@jannau.net>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 5:30=E2=80=AFAM Asahi Lina <lina@asahilina.net> wro=
te:
>
> We were accidentally allocating a layout for the *square* of the object
> size due to a variable shadowing mishap.
>
> Fixes memory bloat and page allocation failures in drm/asahi.
>
> Reported-by: Janne Grunau <j@jannau.net>
> Fixes: 9e7bbfa18276 ("rust: alloc: introduce `ArrayLayout`")
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  rust/kernel/alloc/layout.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/kernel/alloc/layout.rs b/rust/kernel/alloc/layout.rs
> index 7e0c2f46157b772248450a77ff445091e17fdfd7..4b3cd7fdc816c158e63ac7401=
4cbfc0794547e81 100644
> --- a/rust/kernel/alloc/layout.rs
> +++ b/rust/kernel/alloc/layout.rs
> @@ -45,7 +45,7 @@ pub const fn empty() -> Self {
>      /// When `len * size_of::<T>()` overflows or when `len * size_of::<T=
>() > isize::MAX`.
>      pub const fn new(len: usize) -> Result<Self, LayoutError> {
>          match len.checked_mul(core::mem::size_of::<T>()) {
> -            Some(len) if len <=3D ISIZE_MAX =3D> {
> +            Some(size) if size <=3D ISIZE_MAX =3D> {
>                  // INVARIANT: We checked above that `len * size_of::<T>(=
) <=3D isize::MAX`.
>                  Ok(Self {
>                      len,
>
> ---
> base-commit: b2603f8ac8217bc59f5c7f248ac248423b9b99cb
> change-id: 20241123-rust-fix-arraylayout-0b1009d89fb7
>
> Cheers,
> ~~ Lina
>
>

The joy of logic bugs. :(

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
