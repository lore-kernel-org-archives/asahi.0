Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C048329CEB
	for <asahi@lists.linux.dev>; Sat, 23 Nov 2024 17:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732384176; cv=none; b=Is76WNDkEvUmykFXSczhvwN+EYfZWq9hFHkaBDDANJ7t5JlX2NZPtbS70JpsSsPD/z3+GU6DKM32I0J62CesqqDU9LZF+41sl43BFLoaOkR7pZ5ZmZMbeSVmWU5+GEEOxHQ6sG42E9uXAKB5FnZRAW3feeZhVDclrJR0nD/cmg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732384176; c=relaxed/simple;
	bh=Mtp8FUi5/gxlqwjRBdfVLsB1XG5TJYsg0hjbR9M1rO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHnwmAS1X8ossOsioTlY2SY1Y+GpLGTRffijflSFTDZafpz8EE2uvr27U1T3oFD5WFKMc0pUq6nybpeMiHGnr9fHLO6RB67nyIHz7XOescNASty3QolYsVpQV74zN1GSFKu02SziQpWfPvKQPa7l+xkAi2FWV55w6mELE8Mqktk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvIF1lpV; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvIF1lpV"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ea93311724so379476a91.2
        for <asahi@lists.linux.dev>; Sat, 23 Nov 2024 09:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732384174; x=1732988974; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mtp8FUi5/gxlqwjRBdfVLsB1XG5TJYsg0hjbR9M1rO0=;
        b=LvIF1lpVWLHXdRlW9mZzIZrtSHms4CBmQ6IeDA6ropwLtZUbVUCiEYOzWihT23sKVg
         CaUcC8taRARjk97fSElni0IEwJwNekxULmFINRfy1dxWSz8Xns7tDXZqWzMVvH32w5lm
         13B21B2SFuphyXpHmMuwOvtPKLl9iET4E5UJ71Hq0E9puekayu05jqwfslSm7s47dnwl
         eEMJi26b0XOLvVfDMVNTE5tvKHa5Ow+mvbMZ8IVlnOH94+yORP8UxEXZhUdaIX5pt20N
         zStSZuxLImdZGnlbObGUyotST/6b7wOBrXlPsFn6WXbvIuuEO8bquZg6opHsN8HlHI5u
         UNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732384174; x=1732988974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mtp8FUi5/gxlqwjRBdfVLsB1XG5TJYsg0hjbR9M1rO0=;
        b=oPZrmjKM9ZdTgPsespkyIKjPael3xxKecfKetOME3OH6jWkGItSGKQ/DEWomjkYk14
         qF/R+NxmlBnS5CY3rfzxVxUrSOuLYyKliwYxy+fHTXx/d7NTyu4wWbesS+Vuf1QqvYIv
         BTOghtRJsJ+jggqkLE80ipIMHhB377V6FgFAz0S/JGU4QpDGTYDN74jgIVx1ZTmZcsRa
         Efndd25t40dblWIVIFArc1g8P4PTwRqwQN52kHyEzRASuQy0J0lOMDJKo+lkZE7PrQDH
         nF6J0A/iYhxmp+4unGVEYHt4J2hdOycKVQN3vfiH5MqgQRYCVL55MqAseXDshhDyTcZq
         5dbg==
X-Forwarded-Encrypted: i=1; AJvYcCUwDdx+qT2VoDVviC8MYzmP8ZEre8PdnpIe3xcVvsS7TwujEMXu766MP3PyMl5omYHcC1tdiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXO10I/9Pcg5HTc96o61RekkcUPdTzW6Q9K6CyVNyFO6em0kmY
	Z5RRfMbZHUMafxF8sWhAL2BlXiomQhiLPN0rKI9YVAQsWiSWI9AkDRRqycw45aT2jcvAgM0qdiH
	oLT2lfsEgHs13pFG8OSvCR4QNNEA=
X-Gm-Gg: ASbGncuo2UStNyp2sCfspHqrxNIvUB1O2db4TCmPqfUcDIcwvi0w6X9e6h74zHIm63M
	4gZaaPY3rNzvX1cxWeij+c77IRiIk/w==
X-Google-Smtp-Source: AGHT+IHCehXXGlMtIxdivTgLYkpRePIeVeEWaX1a1Pny2+jeeCC5ffRcjrzZZSWY0n2E3esmRDTg/lomQT9MHL05cPM=
X-Received: by 2002:a17:90b:4b42:b0:2ea:a9ac:eeea with SMTP id
 98e67ed59e1d1-2eb0e025c93mr3757582a91.2.1732384173993; Sat, 23 Nov 2024
 09:49:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241123-rust-fix-arraylayout-v1-1-197e64c95bd4@asahilina.net> <CANiq72=axLe_WvPohRRpAnmmPOHtwSK1W3e86n7FMF2mao8HUg@mail.gmail.com>
In-Reply-To: <CANiq72=axLe_WvPohRRpAnmmPOHtwSK1W3e86n7FMF2mao8HUg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 23 Nov 2024 18:49:22 +0100
Message-ID: <CANiq72mZnF4kMYEUsLZs0KSi8PrO1L6BzFZ6f4B7W3+KiyNuRw@mail.gmail.com>
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

On Sat, Nov 23, 2024 at 6:39=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> (Square?)

Ah, you mean eventually on the actual allocation, never mind!

Cheers,
Miguel
