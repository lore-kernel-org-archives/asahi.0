Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F6B35966
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 09:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573792; cv=none; b=G0FGxlXSMeufp/Ad/dtmhnJJMRE9ddL4ANJgh2st5nCYjV/jg8pMEthNsZ25GWyP3Pfa9NLrHYmTEHMCqiHfz7jnUJyRd0u57ScIEl1WByjpJHjV19ewPx40NXBBZvXRmEG+iRrKZtFc2TP0nvek69iwhVzAfVmbLeyOQg7uhj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573792; c=relaxed/simple;
	bh=UTDN9Mplud83THmiGowq87k8MSyDKm3YgJpc64T4AGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0m9/In7NH/0X7UR7O5buolzze2a7rT13/bsK9QQUpjpN4hZLtE8W8qXwQFxYirvDtHGSekI7n7B7hRwYAjiyuyVysk5/1D0HSw4pYxQNJ9U7epE9EkHAhxHGJu0LqljBJ0OmBaeqCMbDTp7KrHi3HuNRrA0b97TlTU9+9DU4RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JFPbutz3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JFPbutz3"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-386329da1d9so1926098f8f.1
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 01:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738573789; x=1739178589; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTDN9Mplud83THmiGowq87k8MSyDKm3YgJpc64T4AGw=;
        b=JFPbutz3mC4YChNbQ1/A+8y8KkGfasVtBEfM//gtv1mqmkJyaTiMf8NKzSFLN/AVTw
         K4OkPgCGVwD/oKwb2bmhB9KBnvAXAHZ5Rf37YDCWfvSZ+M7B1AKg9eU4pZSle8HYO8c4
         n50t0047IDeykpVi7UxEJmt6MOivzBC5JoQQMX+FPCjZxksdc7FT3omMdjs1b+g2gmJ2
         pqVbGVybDJb2r05H3Q3zRaOqUM0k++W3vqwk1cypKUXgxdLYpFZIc4D5+k9ZuhpJcOV6
         F4pLIIinAS4QblCx6yixWZPBgWz8vxpqGB85vzEgYdn1Bl9tv6l1/AvYYgeiWmUmUjUm
         ob7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738573789; x=1739178589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTDN9Mplud83THmiGowq87k8MSyDKm3YgJpc64T4AGw=;
        b=AqI33xxlJdhi7qca/YSYH2zjxn5ckXlUyUN3tU2PW47Oe/XfOECIpfIvsNbahoix5w
         WK+Gf4hO7T82Qq5LW2raySVuD1UQAB/cHk18TLpnTmOHaqO+TYuwme3nTs3VtjeSjZ1K
         BYxXK6ChLs5+hjO/OQBEaTxgsVDF+QsujkL0uSEjEw1Y447E+lAL+1lfBwMIceQj3Jzu
         2qrhnhgbzpCm218ev8ZaV+vxNRy6v5cSeqIWBA7Ycspac54jcdfeEYexe5QRNvF5c8QL
         wEIQ4Qm0S7q2uWIJsSAtSZ2MmKd+90liqh7zQ0F/UzQH14czeQm7jt951XypB970EtdJ
         18Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXkSWOFbA03VHYvg3Ckqn2kocfhygQ++tP7CONJoBSBhiJ05m78DtCZNx1ouwAFplJsv3GA1A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/JTUsa825zqv+UwzyCcrSfutiitbkcCjM19AhkS7tWAOyA5rS
	A+APGwMdTCWrEv+DkG/G4oPZpkWsnDoD2wdAdAhWsH3kluUrmNMZrurDZM0qoZGwdwUu/to1dx7
	9AUFJHOmA/THJxihK7T6jDodFPGYeskOyaXRX
X-Gm-Gg: ASbGnct3SS6RfS6ZwJjHx6Ds33kZH/ud6/cSQ7Z2yhGlDwLxVB9RVFG91kLEJbzyz0F
	d3/40lP19F1QK3BOfMAhUei61io8GV22wJ4JtwDpvnWFRsdHHHPNWkXSl6lL5NKZwiw8wbeD2rw
	rii19APf6Svn/XiXqM6XDov4PX
X-Google-Smtp-Source: AGHT+IFM9GLHlZ+BFxVNkIvlyblXVykvccxfE1y//nQwS7sYZaGnQmkNGwSODA3KxKIAr7oe/IbIRqDfpnehi+25lNA=
X-Received: by 2002:a05:6000:1569:b0:38c:60c0:40d6 with SMTP id
 ffacd0b85a97d-38c60c041c4mr10325117f8f.51.1738573788916; Mon, 03 Feb 2025
 01:09:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net> <20250202-rust-page-v1-4-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-4-e3170d7fe55e@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:09:37 +0100
X-Gm-Features: AWEUYZkjSqWe0d3JupRvmEZPFDwaoLn2z0gdviTtv2-Qd0BxBC4FdBGMXj4WLug
Message-ID: <CAH5fLgj+5KZcNRZiNfj7wg_t+QU7ki_=Pw5-whBLx9K0BcBbCw@mail.gmail.com>
Subject: Re: [PATCH 4/6] rust: addr: Add a module to declare core address types
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
> Encapsulates the core physical/DMA address types, so they can be used by
> Rust abstractions.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
