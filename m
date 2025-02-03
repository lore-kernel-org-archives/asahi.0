Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32461FBEB1
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 09:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574051; cv=none; b=iBBwKJsaeIZwYRAI1eNpJKkbPpMjHiw7Xjp3BJ3hOj1SEwZPEUDC8gz1hMpM0BQwRtCaLSTQqYgHl/grlTw7iv+kLMp8OSwpWj9ZXMmRamKZhv46u+wwV/Lu+qEO1JZT+sgFES2kRcub/8QtsUlzlM0YyMSep/rOj/pwF1bdg70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574051; c=relaxed/simple;
	bh=iccEFWWq1/laF9ZrE7GMGMBPOq0ZacXGhExO1udHdrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0zMQ0mH6FgepzfKR1PBwFzGnmh5gRVoIP+n9d8Gw1X5Cjof3WrdAXnnv+/N9DAN+8w8PmM+EJsX1FLnIPpsLk+ckIF3fJ+tfICT+ozWMESGijtbWgOyT7nhuT5+JvemrUdvfhQkxEWg5ZnwCOHztcmk+F1TCRm3BW9OsesHmdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3M1k5xWM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3M1k5xWM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso27945595e9.3
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 01:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738574048; x=1739178848; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTigYTji7snmwZ76B8KAzY+h5eJthq2lyVwSFYmcfo0=;
        b=3M1k5xWMNZON8MkpBWIU0G81jV/S1dvqfmyrP9h9YkKODHhoQvcJgi7Z1+BJpITNQQ
         G14stjhrKbfAuDig4eVkvcZtmQlZFIVxl4F2MQ1qXH5lq6juyOZXa5JdPo2B+6q9184a
         S0AyvqNVaMeGjrykdV1t3O0vAf+93Y2WZ6K7gWubK7iQiWrllh0frAonk9bDonG5aNgQ
         jsdljNb2HycF946l4FXSj9+pvc2pJIlMbUzKCCSSXjg7sqEetJG169ZE8N2AZVAvSaIF
         OEDoLM1kLNcooJXmMA5CcL1JRAjdJoKsyt3WRdDhp2bL6aDZ8C4AMYswbnop6D/3/iez
         zeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738574048; x=1739178848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTigYTji7snmwZ76B8KAzY+h5eJthq2lyVwSFYmcfo0=;
        b=H0tUoYIeK+m5QY6SLh0cB7OuYQ3++9jwnsvEDNHYyv21PwM4fhgF14OkOD0S4JEHUN
         YzPx4RtL01wcsp5BTFd2R012cokQAZSLhh94B15Xv3yC24DQ1+t3Ekz2Zo/UkZUPePur
         bqBZWtemp0tdDDtFcyuhQxXu15rA93pQd7Pjwc5Y9S2CyR6FAdVW9mwiyNtyr5G5xpd6
         v0ETzaFZpjqki49fSr6ckFDTC9T4tesfyREf4a0VbjyyXb7ZBbE4P3SrSdt2fJJB//Zz
         mms/wpqM2+6dDc8mm7a1xlCan8J9cEDt608+G51B+keIsjkrovZT0IRGDcWkTWqrZHYs
         1pCw==
X-Forwarded-Encrypted: i=1; AJvYcCWwnQvSLKS8lEbl9NmD4KW0WdbcmbcTmY8Y5jIQZtx/o2iw8rmbwKnPIuTT+YHGllQtMzQXIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw3L3j8ox0nNtCZQaHcFvkuBnczH/ulMxM1rITfZmqPcruYw6H
	IyKNHDmnwQwPTDddAmHo9jaSNPGRZsngWb7rIN3RUVdcizVhUrAMSqgj/5lrXgfcX7/fGFxtiXT
	52CC1+qAxfWg9TsvGKzdNFzqhiqdj/mlPJQq6
X-Gm-Gg: ASbGncs+iQOawUo7kxb9VpX/nJB3JEKeCiJ8OAiiKaA/AyuFizN4s65Au0pZ3ziRO5i
	CnaJq1X3UGYAjbbvQX2yiMY+kZ1SH62FLvik1TX7+U/egl4Vtt2NCNpciZt03Vju++YMtCjwNhg
	9AMEYPMXLtZBeZ71VnG+ccJS1S
X-Google-Smtp-Source: AGHT+IHWLWAheWBxDTzneWVhDeDHu4iI6ZSKajtVpaOuk8Iz68fBhZfpC7OkVmaSh79YpfnCMc7hqeCMjDs76NrY250=
X-Received: by 2002:a05:6000:2ac:b0:38c:5cd0:ecd4 with SMTP id
 ffacd0b85a97d-38c5cd0f0f5mr12252107f8f.6.1738574047978; Mon, 03 Feb 2025
 01:14:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net> <20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:13:56 +0100
X-Gm-Features: AWEUYZmohLxz7yr6HsBu7wP0vZHEbxTNHW_DFOP7aKlEhrQya1tqMhpQ9Fx3RtI
Message-ID: <CAH5fLggscATtCgQwCYSms77oSFOMkjTscRDqAOZsSgoHsOoPQw@mail.gmail.com>
Subject: Re: [PATCH 1/6] rust: types: Add Ownable/Owned types
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 2:06=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
> By analogy to AlwaysRefCounted and ARef, an Ownable type is a (typically
> C FFI) type that *may* be owned by Rust, but need not be. Unlike
> AlwaysRefCounted, this mechanism expects the reference to be unique
> within Rust, and does not allow cloning.
>
> Conceptually, this is similar to a KBox<T>, except that it delegates
> resource management to the T instead of using a generic allocator.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Overall LGTM.

> +/// A subtrait of Ownable that asserts that an `Owned<T>` Rust reference=
 is not only unique
> +/// within Rust and keeps the `T` alive, but also guarantees that the C =
code follows the
> +/// usual mutable reference requirements. That is, the kernel will never=
 mutate the
> +/// `T` (excluding internal mutability that follows the usual rules) whi=
le Rust owns it.
> +///
> +/// When this type is implemented for an [`Ownable`] type, it allows `Ow=
ned<T>` to be
> +/// dereferenced into a &mut T.
> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that the kernel never mutates the underlyin=
g type while
> +/// Rust owns it.
> +pub unsafe trait OwnableMut: Ownable {}

Giving out mutable references allows users to call core::mem::swap on
the object. We must require that this is allowed.

> +impl<T: Ownable> Owned<T> {
> +    /// Creates a new instance of [`Owned`].
> +    ///
> +    /// It takes over ownership of the underlying object.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that the underlying object is acquired and c=
an be considered owned by
> +    /// Rust.
> +    pub(crate) unsafe fn from_raw(ptr: NonNull<T>) -> Self {
> +        // INVARIANT: The safety requirements guarantee that the new ins=
tance now owns the
> +        // reference.
> +        Self {
> +            ptr,
> +            _p: PhantomData,
> +        }
> +    }
> +
> +    /// Consumes the `Owned`, returning a raw pointer.
> +    ///
> +    /// This function does not actually relinquish ownership of the obje=
ct.
> +    /// After calling this function, the caller is responsible for owner=
ship previously managed
> +    /// by the `Owned`.
> +    #[allow(dead_code)]
> +    pub(crate) fn into_raw(me: Self) -> NonNull<T> {

I would just make these methods public, like the ARef ones. Then you
can drop the #[allow(dead_code)] annotation.

Alice
