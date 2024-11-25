Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6EB2AD25
	for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 16:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732551995; cv=none; b=pUGpY3S5q27xTId4nux5oeGZzRLu5oz/+eptgmg3iUz3xHbCn1x76I3iyRh8cOu9Y9UcxTMlGs7Y6EuLfB+M1q6PWELZgqTC/nYORWAvpQgQzVvqkqbdbbBsPCeWepPLCK1kGuvqRgLauArLxaXZeXRfw5v09mJHruoiYTZDF4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732551995; c=relaxed/simple;
	bh=l1qWIVwvXjEkCYh8peO0L0gffJPk0BmLlnRXYEB1NGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qH8//xJXAkkZTmOW+PKMIvqOHjgkKqI+60IMySRb/pi95HQLQ6D3NQhFyaJ7nQfJwsKxrVZQoC8mhyLL4VAgcXOxfqL45KpKWAjy0NbGCmViCG2LRTjF2SHgHmhvPRb/AYnxXoPxZiTkguUAqt3wValiEnPMrqmaRgs001XyJ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBaquhIE; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBaquhIE"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ea4648eb96so825705a91.3
        for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 08:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732551994; x=1733156794; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1qWIVwvXjEkCYh8peO0L0gffJPk0BmLlnRXYEB1NGg=;
        b=FBaquhIEbMLbdBNcTMbQEXfvMys7pNj8oQbVSogotvs5+YwlKzNRz+bMTQFQ31uE6T
         lM2Ungd3QC+GNMbHYrhxvjeKBXY61ocUvAnpD35fQfW3+yrRqvn5ahHAu3ItTGcco7u0
         CUUSMorq5r0ya9PZjT7hr0JzX6I8qhKim5tH6foIUqpALFNQiGSQlObPCWbQj1LPrEKA
         0pL1CyQKsCYkGpdLM8d/FRz9dOooAWjiXbn0/FiDL8nnNtrmmGPV1ovulF0Rv3TELkTM
         omhiTW3Yt1XUbBbEEQSjH8pAAJ8bL+0s6/LU14AtIeoL/uaWfJchK4zfa67/ZxCSjfua
         8Y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732551994; x=1733156794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1qWIVwvXjEkCYh8peO0L0gffJPk0BmLlnRXYEB1NGg=;
        b=tbhIOMOZeAIcZi/3kDB2FN/r/JGbu8RsmDuDkXuVUKnEZAfs5N//z+PGbeyCdVA/kf
         l5LZsS92E2vyb60vsjiYpOtWtVNhWDdh6mSMJL4tFk7GbWL77jjFiAQi6+a3s6yp7hsa
         gY3kvQgRa1eoq/b4NdAuu1qB8hzKGBooIP38TC2VvP3QPMprkByDmfGIVGlThMzqhzQ8
         LP/LC8kxT0rYvKVDyUW2fQ2R2BDPxoHEGQa2+kbvHyzGp9Gh3USAG1CsZeaDeWbUFWEX
         qf61xVuwW3rc8aUwF79yTeSS0XvL4P8jfJsrpGcfd2GmYBIlnfONA9lPwzS/PoXN1ry+
         Qlkw==
X-Forwarded-Encrypted: i=1; AJvYcCV8rhoMSr3X2rFh14QXSaKfPTv9OAkGX+HeU0RpSvMwnjR8LDpcLUvD/MbIrI6Sch6dA/uB9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJZcbWMXl7Srt/drNN24HaVrUyvnG0NRBH2ZGcGwEq7lK0PvFY
	9zMLW0ZQIUZP1sA8SkGMfBOWUVsMT1Z+vFlVO+1mkovz2jSbP3rGD6Xl7ixVRuGo/2kbAiywAF7
	3ClToKUA5yoC0F02hH/gNc0HemiU=
X-Gm-Gg: ASbGncuexseU2bhMjawL6snmVOrzw1MSk2JG2g+BeLoSqEDIyE6gHMzBpyF/i9r6M0V
	Oo48aqsU9Kk6l2AwxdTiOkEMfTqnGQ7I=
X-Google-Smtp-Source: AGHT+IF+8fEQeszb1CA+TJE0pUpQ7FhynpOE1PM0+96KcWBP3IR2nn1UVp0S0hnjEA6WnDs/Au1QOKwMAvSC3gQFWPI=
X-Received: by 2002:a17:90b:2249:b0:2ea:c768:3c52 with SMTP id
 98e67ed59e1d1-2ede7e68c98mr345414a91.7.1732551993870; Mon, 25 Nov 2024
 08:26:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241123-rust-fix-arraylayout-v1-1-197e64c95bd4@asahilina.net>
 <CANiq72=axLe_WvPohRRpAnmmPOHtwSK1W3e86n7FMF2mao8HUg@mail.gmail.com> <Z0SjvVIALIkOE3nj@boqun-archlinux>
In-Reply-To: <Z0SjvVIALIkOE3nj@boqun-archlinux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Nov 2024 17:26:20 +0100
Message-ID: <CANiq72kCWQW1rjdpG-2pxrDJ_oKuTi3A1wyQcAhRRTpNPvV3kQ@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: Fix `ArrayLayout` allocations
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Janne Grunau <j@jannau.net>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 5:20=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> While we are at it, I think it'll be good to add some example/tests for
> those functions of ArrayLayout, for example, the below will catch this:
>
> I will open a good-first-issue.

Indeed, thanks!

Cheers,
Miguel
