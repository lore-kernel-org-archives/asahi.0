Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8621CEE82
	for <asahi@lists.linux.dev>; Fri, 15 Nov 2024 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731679261; cv=none; b=U/KmWhfvoEfRqOPfyqpmDO7cmuoAY/sIZoqgpYdBV0mHyDJf3atr+1TtjDoLQRRkW6nM4vLMcAm/OfuyG/KayOs88wudvv3kjELge/GkAZ3VshhCr+iXI8ZeriRnPHsKWV9QvMiE4FlPtvNoiu/59ULL9WdOaSDF+58AWiCNw/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731679261; c=relaxed/simple;
	bh=VfVHZrGd4tsTjMi2xv8h9FRmG7Ah4ZiFj6Wn70prO8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmYPUzeDlqd+XHLh9C1zCOIRYyyFGN0oEZ+V5aHcZOwLy/cyUzD5gogTHUaTSrl5YjfNRupY8us5SIBPsX37MJUhxaXOO+PKPYTzQwZtx9HJR97nJFqM+6x7hlN+rDG3vnnlQ+NdA78L+zHByVqoi8Er+NOFs+A+7u1FbyzGiQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4eNutCxP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4eNutCxP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-432d9bb168cso11514275e9.1
        for <asahi@lists.linux.dev>; Fri, 15 Nov 2024 06:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731679258; x=1732284058; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfVHZrGd4tsTjMi2xv8h9FRmG7Ah4ZiFj6Wn70prO8I=;
        b=4eNutCxPMl4pt3AOdVdqNV5ArXVaGF/MnRPhNnhnezzh92krjB0WkzMK2ubYkZJ+mO
         hApHNdylxcgB6U0S+wLzzOJIq3K+xyJ9TmQGKiQ99qXYhZHEJ7ptq7x+Y+NYt0pYFbtO
         kHDrLQLGtVyghWEzNyK01byvrQZcX07kyhrghK1yzB/5E2+KUW1gQTqOzcOSn1OnJLKf
         j8rdL8ikjeJMtqm3P+WkOWNOb+ms6DS0MQl2cspoAcUsxphBxYri4R4Cuu1ZOnF1QRL/
         tuurC3lpTGTVgKAvHUlCWdnzRkszGk8I+5uygCYWKH0zwRWIdx5nRIgfU3gnReve3SNR
         3C7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731679258; x=1732284058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfVHZrGd4tsTjMi2xv8h9FRmG7Ah4ZiFj6Wn70prO8I=;
        b=U83P20E3amEHqT2zGdh5rNfl0GFpTZannLim4up1u76W/w9m9lDwUylCSYXtLVOqIk
         9nEtzjIaiw+WnKM2YQWtUSV4Fhhy4OFLDkqYjhU6fyuOyc46O/IfCa0IIi5K/VX90gW3
         MhYOfLj+Kk0sAWofEAyWksoshuv59TqUbHPhxbZIubxCbG99FdGRDVxWELlZhHwDJ7B2
         q2/t2wRfYameuwoLXrdyeRf/DOSQDWPyR0uBkrsjG7HJWlJQCiHewU2by1o6uV59hjn2
         FabzM3stLGSI2AdteFbqphzMOkuYGeSX+ycmXFcMcp8cmAkVsSNiWCjmtUKleuxQrG5m
         fArA==
X-Forwarded-Encrypted: i=1; AJvYcCXTUyJMtWxHl0NnnDql3dm7+Tdc0Hnt+733lgGB6vgALZKwn3U7yBP54Kj2VGDIRbgvO7o27w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1Je17CLBoD9y8sn9syBewd9RsAqRnLMssP45lIy2nJMmlTKKf
	EsvULn6YHSWUuLqU38JEhS86vT/PGh7d3V5kpXm4344ANW2AIfBuKkQiJTJmxnscmv2yQ+JtFEN
	5YmZ9dBnxJhMeUlhbF6pDVi+Fn5gJyxYDqlnS
X-Google-Smtp-Source: AGHT+IFk8/GvWJwG6tNDd12MbN9MckIetCAQntsvm7RXN/fJBQRSRREZVjA31lahN/uOpJgQiKXbK33daKacZwaEsSw=
X-Received: by 2002:a5d:5982:0:b0:37d:460d:2d07 with SMTP id
 ffacd0b85a97d-38213ffe4c1mr6588655f8f.10.1731679255711; Fri, 15 Nov 2024
 06:00:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241004154149.93856-1-dakr@kernel.org> <3b843e34-48f3-41ca-bd83-9bc137ca6c76@asahilina.net>
In-Reply-To: <3b843e34-48f3-41ca-bd83-9bc137ca6c76@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 15 Nov 2024 15:00:43 +0100
Message-ID: <CAH5fLgg68b-pfGhDubJMzGA8w4dywviMv+ghw0KV1emFvNKe9Q@mail.gmail.com>
Subject: Re: [PATCH v9 00/29] Generic `Allocator` support for Rust
To: Asahi Lina <lina@asahilina.net>
Cc: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	akpm@linux-foundation.org, daniel.almeida@collabora.com, 
	faith.ekstrand@collabora.com, boris.brezillon@collabora.com, 
	mcanal@igalia.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 12:33=E2=80=AFPM Asahi Lina <lina@asahilina.net> wr=
ote:
>
> We (Asahi Linux) noticed that this doesn't support unsized types, which
> is a regression from the alloc Box. drm/asahi uses boxed trait objects
> to generalize across certain object types like render commands, so this
> breaks the driver.
>
> Is there a plan to add this back in? AIUI this would need the
> coerce_unsized unstable feature, but is there any other blocker?

We're already using coerce_unsized for Arc, so I see no reason we
can't just add that for KBox too. Soon, we should be able to use the
derive macro [1] I proposed to do this without unstable language
features. The limitation that the RFC mentions for custom allocators
does not apply to KBox because it uses PhantomData<A> instead of A for
the allocator field.

Alice

[1]: https://rust-lang.github.io/rfcs/3621-derive-smart-pointer.html
