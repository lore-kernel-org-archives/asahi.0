Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389A911CA9
	for <asahi@lists.linux.dev>; Sat, 23 Nov 2024 17:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732383578; cv=none; b=uMkW4shBSQi1NI1N9uAQ2Y5cYTCTr/lx8E9jT9M5L5beYav6MqhePV3zlpA1FuaSZ8OorxUZ5Af5SFzImc7gNp8aGZ1QK1dwugapf/Sa/Dy1L08Jjx02uabZo5nkrg8eOwk/jmgNhx77WfQWT7OWUQ5bDUQ5wzz0qCZvTeWPlgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732383578; c=relaxed/simple;
	bh=10RxbR7ins5I/8Ouv+Ck9BsPNvjz92S1DpHBA2ih64k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/jHqj2CakM8TUH3VmXTfM8/5TBcyfpiB2soYheAKOU4LmOjlVaezFkx5vLjGEz7sEZKTZj5W9wXoHiVjNMg8Cuvj6Wb4fKj18AHX4OUGQfd7xni1+PdZUHtMt7RzJiWLLWBzvXxoJxg4C74/EfgwJt7wcvcHuexcTgZ+rbON44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Amn6Q+ZN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Amn6Q+ZN"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-211f35ee55cso4833475ad.1
        for <asahi@lists.linux.dev>; Sat, 23 Nov 2024 09:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732383575; x=1732988375; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qe481K4vactw+UN4O2JIFyk3k/AejJVaIiJrhPoavoU=;
        b=Amn6Q+ZNIx2Gpt3eCXEJFfZ/qDs08SoPrYOmq0p9+Cy0X7zjsRkcpOPIir7wiAjHmQ
         9i42PJbzzEqmr2VUEL/9LmjlSPQvCoGrNEpIbCIQM3vpMbA3nIBnkaGMgk2ZDCCArw3H
         iQLE40rn6IMfINUdk64yPjVtAwDcQdexYChcZ9SZehZzzD6ahnlRSI3EUCTfuk+LLqWc
         C/SmwpJEvtxybJzk9DXBhDMj7knnIieOIoI0fck9Cr5QVblKO3kBGdBis5gximeE82mr
         VCI5P5B0q5zn6YL3K/5mXD3ERs2iaz9WUWpsxG8AONgF3aD/MvmPjRKy1a7XaKqo5YPR
         p6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732383575; x=1732988375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qe481K4vactw+UN4O2JIFyk3k/AejJVaIiJrhPoavoU=;
        b=VV5SlMFWLw1wrdaBoKCvR2fS3QwCGsazAoP55AliWwM6mGD8RIrzSNOmS/RQEeUnEa
         uTPeUZzI7fWaJzvqxthK7HdC7B3vagcL5SlKys44MQZN2IbdwPHFfb75PQeXy4qgrpZw
         AjYpvLODoOrJPJPxWEviRWOQ1crt7G2jyJ04DCtbmtEyQo0eGGfvFNJ9ICeRISNj5YH2
         kuE7ODlJM0l3oTMfepr8331uyqXctNE8ToozT4YzqkYMPOeuWqMmGypUkt7z4+UGt7d9
         ZJjioP3Ksvpx+5v8j/zRCwAXDHe+49AjElJ+7XCPFL62cEWSeJeCKXcg4NiwUsAztRuA
         WlzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTjPAmHotzzfA1qT6xq0pWHpyPgrdwfH/wvAL1YyUK6RUUQ+D4GnffzUAZE5z9CFlpnMFh7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmNCLwXNcw62pI0fkEDeLWTKZA+80FpJ6E+E5ZQuFHgRRc+r9l
	vLMEKDLtQgBGUQT99+FB+u9oSgQc8D62pIxb8y4yBy80LTDWyv08ACZmvRdkRxK9dTHfv9feoMn
	WSNLcpCC0VLgUKxVzG7vG18Eoq3SYxCdM2II=
X-Gm-Gg: ASbGncs5jjRxbW6v5v45q+SL03rhSiieXLtaJe9D8e/w19yBLOSwhwatxzEeRy4QmmK
	QtMUmunsRKFcH4pseBk5jpK6yfwbq2g==
X-Google-Smtp-Source: AGHT+IE5Ll6Nx8YWkRinN7yzURC8SQfke0DCzcmaFl1uxQMnEdikIKbvGxBVUnu8385PM5/ScM+GAe7RjdY35sp0R8o=
X-Received: by 2002:a17:90b:2250:b0:2ea:47f1:79d3 with SMTP id
 98e67ed59e1d1-2eb0e89c251mr3531306a91.6.1732383575479; Sat, 23 Nov 2024
 09:39:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241123-rust-fix-arraylayout-v1-1-197e64c95bd4@asahilina.net>
In-Reply-To: <20241123-rust-fix-arraylayout-v1-1-197e64c95bd4@asahilina.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 23 Nov 2024 18:39:23 +0100
Message-ID: <CANiq72=axLe_WvPohRRpAnmmPOHtwSK1W3e86n7FMF2mao8HUg@mail.gmail.com>
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

On Sat, Nov 23, 2024 at 11:30=E2=80=AFAM Asahi Lina <lina@asahilina.net> wr=
ote:
>
> We were accidentally allocating a layout for the *square* of the object
> size due to a variable shadowing mishap.

Good catch, thanks! (Square?)

`clippy::shadow_reuse` would catch this, but it does catch a lot more
things, sadly.

I sent:

    https://github.com/rust-lang/rust-clippy/issues/3433#issuecomment-24955=
47322

and added it to the Clippy list. If one of the ideas in the issue are
implemented, then I think we should easily enable it.

Similarly, we could do `shadow_unrelated` -- that one seems easier,
and perhaps we should do it anyway, at least a couple cases I saw
would make the code clearer.

Cheers,
Miguel
