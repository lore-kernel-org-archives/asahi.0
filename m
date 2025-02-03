Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF4135966
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 09:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573838; cv=none; b=RAPRldVE7VtM1DfA/BszVLoWSDYhDP4wlQpXVOmxUH2D0ytg4ZRRMvw6fvsEaKJWLq2GZhC/MknleuYB9DOh5WMHwWRulK4+cK9ayoTtnKgRPfod9Q8fnhKb38WvU6Siot28ljgKOADeEWaypO/hnfY7PCUEMMiuuJ99oYpbDdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573838; c=relaxed/simple;
	bh=0GqnJ1PTVxaimi6jzAEHxm4Rj0qeyB29leOa6XPWAB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNYn7lTn+XMgTJoARd2hoMubxXFhxWneu58yMIWmLc4+A9Y8S2S9TPsf+BoPVcjqYYG1wxRrWEYw9vCsLsKdlEUQzyIdyf3W7Bon6/egKUy5+I8J/GzyZntYhHc1ICp0j0wtkdsQleljMh9L7wds/xt0CymfCJ/DgsdKKeaSdrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FsiPM2wk; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FsiPM2wk"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43624b2d453so47313265e9.2
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 01:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738573835; x=1739178635; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GqnJ1PTVxaimi6jzAEHxm4Rj0qeyB29leOa6XPWAB8=;
        b=FsiPM2wkO8wExcdm83sedgIxXtS4sQFQXCn7WaaJmIrkbXMQHcFUbw/DMHXWIS8wqL
         2vNXUS9oYJxL0Wn+8aYvpiQIXH/i9HSG4J3CPvPiYjvjcIVMjUnLJUhKdt75ttGIg76p
         o/GTicKJ6DKSv+7HpeM9SjuSn2gADI60eCLml84e2CES1/DhvBSftENPe+wM02CAZjpk
         VpKZ71LXPDqW1lOdIQJBWBM+plx0Jay4XPDlJiARIY+bP7wen1k0Xx/KI98x44lb+yE5
         cPu9HC8dNHt/DoS/w4P59/04LpgsTAYHK+nYVykhRADebJ/0KgbTpqgbZz8/5ej76Smi
         lmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738573835; x=1739178635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GqnJ1PTVxaimi6jzAEHxm4Rj0qeyB29leOa6XPWAB8=;
        b=f9xs0ssy/Re5Qi8xW1o+a8snUoOKvGj8nQX1wQpo/mwHEIFBZWkn3Svg1jz4FPC/KP
         sU6vtWGnn7BlQcBK2Dy+DZ/Jfg678V9sXn5SVCnD2hE1LYkjg1gtAoXx8NVu6QItlmjz
         Jb0mKI/d4dicgQwbd7kWYLBtWST0wXirl5Z7dJZMSQ4QtcChdcTTB7Hscp5Wxzq0iyGR
         yNZ8kHtEOVWRdKcPL3zBajXHzfuWfLUSbTJs5hXA33fufLuHy78bhEEnS0mqNmaBYuEg
         04YrA2yhQg+OVTBXVGSJl5zJLm+ERY2aLuZY7khqybOWrhdGYxauTDB3/XjD0AZYxRqI
         jjVg==
X-Forwarded-Encrypted: i=1; AJvYcCVV7dCr/munbt3GAh0/DgChXxYigBgqCy6BoZroOCccbZSGE0NiaIHu1mplL/WLfit3/8GkcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0X6LL8kZl/C+Qer1FZ0Qpfsl4P1TEHj/KvBiVfMw3iI7O48kF
	QqSxmD7R8FDQPqg/huRvH9gjTF/aHeRZbwiJEWVsc/nGY93/Nnpu8Y00sETOPfICMYbK3Je1LA/
	Pl6DmCbuN0CaVmmyWnePb3Aql4DFMYAEYtkyA
X-Gm-Gg: ASbGncsRS4MDZtVzFgAXBvtylms8Hk+7vgtgpOG/zs1736TAliveC/+4mg+i1XRateU
	ZYo/x3ott1NeQS1w7RW77Q8Yx6vV0b/++z6JbM1wOeYgklgJ31eVTpU3X6PNzDbOhSeLiHVAMO8
	9KZI+EgmMhJ4HI7H0CIXBJKoYc
X-Google-Smtp-Source: AGHT+IGI34eyHu3/GfGg9biDfXT3JxIzFtbQN5HJwuQantgQ/sjTmTZbXZuSP/k9Tb3AezYeg5j0EE13+HmrChg4UzM=
X-Received: by 2002:a05:6000:1a86:b0:38a:888c:7df0 with SMTP id
 ffacd0b85a97d-38c519380demr18290202f8f.1.1738573835006; Mon, 03 Feb 2025
 01:10:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net> <20250202-rust-page-v1-3-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-3-e3170d7fe55e@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:10:23 +0100
X-Gm-Features: AWEUYZl6WceXbooRxBlvUcO8bpNH6XYBFh342mQJjM7qz2TGDzIyB0PjWSJCckU
Message-ID: <CAH5fLggrgd5fX1vDGKjfqiZ+cjYK6p+q8XaCfCa_KwsTT4L+Qg@mail.gmail.com>
Subject: Re: [PATCH 3/6] rust: page: Make with_page_mapped() and
 with_pointer_into_page() public
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
> Lets users do (unsafe) complex page read/write operations without having
> to repeatedly call into read_raw()/write_raw() (which may be expensive
> in some cases).
>
> The functions themselves are not unsafe, but they do take a closure that
> receives a raw pointer, so actually making the access requires unsafe
> code.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
