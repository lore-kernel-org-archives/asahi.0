Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1DD211F
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 11:48:49 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id o15so22102254edr.13
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 03:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=FrL5lYUkqDlmCEsBUKLgTEfbH9XDD8w+e14IRfNrUoc=;
        b=7rJVxVp/slSrMx5UlCYNy7nCehokTnlhjyxnBBsk6sQmT0bX/mUzeIIbqN4Qm7tEBB
         rentsmMLfqNGnWAaGcaiNRkaGIBNkMgbzZ5V2kTDW+983it6bpGtdDFEL7ggW/g3G6fi
         apmDnxQa7x+b062svrIi4FJUmBHWhLN6uKjXwSEdcTRPghB4eTweMz06byLYNSHztmEV
         k9GNRfGMwco94gGjVER/Il4JQZ9c01eBQJAchBfvEFOZyj8gv9izFTqhanXJxg/FCto3
         qbzRRejgV+biY6YF/pQnvV6jsoeiwLD3Tw80pwbeZqiD3J7PpsQgvLeGtka3yq2wFAyk
         QBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrL5lYUkqDlmCEsBUKLgTEfbH9XDD8w+e14IRfNrUoc=;
        b=1JvvN8gUchcnXTdQKPWTmSCDSsGFslpaPmwhkAetDIEhoetNjyWsxqy0Fn0dZTOUCV
         KQn1+UTYG8XyrTF3T+pnu5tds4l+UmbsqIFnktvUSgZ4GyPLJktu14plKvqFTzoKN+AK
         6WeRCqmqdEZs5se8952SIGAQo+aSmdR2wRPyiOedG6XJYtsRHxJQlelL1DRdJUlF7Evy
         qUKqdvmfR70digfmXANLMEvY2UBprM5oMb7GQ6LH/o5rLW00xOfis06+dylyKi5yy4CV
         JH3XuemslcciLzzaslVhlHDiCXqdzQmXad+yQuiiZM9r7wbprOO+Wkliu5Pt4k5AHf+1
         3xVA==
X-Gm-Message-State: AO0yUKXT+p1G4jGIWNNe2Fbudkv+WGXdDfw9/nmqy29EouZMjHxkiys1
	+T91+7o40VSGtsyZGr/H+fCz3SjfZjvHplk+
X-Google-Smtp-Source: AK7set+1Xufy3lZTLIWLc/LUY9FQT3FcF0q4uexR/2U7zd+hpwLiFESBhwLurbO+FFlq8cewx0M4Ig==
X-Received: by 2002:a17:907:6f0e:b0:8f9:ed75:f962 with SMTP id sy14-20020a1709076f0e00b008f9ed75f962mr7928483ejc.18.1677498527989;
        Mon, 27 Feb 2023 03:48:47 -0800 (PST)
Received: from localhost ([194.62.217.2])
        by smtp.gmail.com with ESMTPSA id jr6-20020a170906a98600b008b980c3e013sm3144257ejb.179.2023.02.27.03.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:48:47 -0800 (PST)
References: <20230224-rust-arc-v1-0-568eea613a41@asahilina.net>
 <20230224-rust-arc-v1-2-568eea613a41@asahilina.net>
User-agent: mu4e 1.9.18; emacs 28.2.50
From: Andreas Hindborg <nmi@metaspace.dk>
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH 2/2] rust: sync: arc: Add
 UniqueArc<MaybeUninit<T>::assume_init()
Date: Mon, 27 Feb 2023 12:48:34 +0100
In-reply-to: <20230224-rust-arc-v1-2-568eea613a41@asahilina.net>
Message-ID: <87y1oj9vmp.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Asahi Lina <lina@asahilina.net> writes:

> We can already create `UniqueArc<MaybeUninit<T>>` instances with
> `UniqueArc::try_new_uninit()` and write to them with `write()`. Add
> the missing unsafe `assume_init()` function to promote it to
> `UniqueArc<T>`, so users can do piece-wise initialization of the
> contents instead of doing it all at once as long as they keep the
> invariants (the same requirements as `MaybeUninit::assume_init()`).
>
> This mirrors the std `Arc::assume_init()` function. In the kernel,
> since we have `UniqueArc`, arguably this only belongs there since most
> use cases will initialize it immediately after creating it, before
> demoting it to `Arc` to share it.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

>  rust/kernel/sync/arc.rs | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index 752bd7c4699e..b8e9477fe865 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -512,6 +512,15 @@ impl<T> UniqueArc<MaybeUninit<T>> {
>      /// Converts a `UniqueArc<MaybeUninit<T>>` into a `UniqueArc<T>` by writing a value into it.
>      pub fn write(mut self, value: T) -> UniqueArc<T> {
>          self.deref_mut().write(value);
> +        // SAFETY: We have just written the contents fully.
> +        unsafe { self.assume_init() }
> +    }
> +
> +    /// Returns a UniqueArc<T>, assuming the MaybeUninit<T> has already been initialized.
> +    ///
> +    /// # Safety
> +    /// The contents of the UniqueArc must have already been fully initialized.
> +    pub unsafe fn assume_init(self) -> UniqueArc<T> {
>          let inner = ManuallyDrop::new(self).inner.ptr;
>          UniqueArc {
>              // SAFETY: The new `Arc` is taking over `ptr` from `self.inner` (which won't be

