Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4BD1BD9CE
	for <asahi@lists.linux.dev>; Wed,  4 Mar 2026 07:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772608016; cv=pass; b=LjlLDxaz8wLpLn1dt+MGpB9+B+OnIn8R15sVdnmHulzLfORd/Q6dwSUqfZUg0dv0OKQNxpwkCvrA/kCsibl99gJrc65EyseKxBw6ParoUugC1a4vOrO+9ylCdRIPoQx5B47aBUe3a/DAKZQRsdYgcmc9RigQLFfoYi+Ex/tZzr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772608016; c=relaxed/simple;
	bh=Eq9qyHdKQ7LYi/t9tIfBeexRCTEngbuCUrZuJRrNrqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTBHsV/F8c9ORGzWQQ3RJ9PrsNbZxsoz1LbggVl4sr2/QbrEtksfNUJ4DMbQ/D9EYFunHARq0cvUG2xjYqYBLYeJKAWWoAnntLtp6mEEro8gzL3eQPQhIJ4XlvlDViFPnYe7aTmJ+QqW7s8DTlCIcQTIevxibjWhrRYofg7iyu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X9RRa8Yz; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X9RRa8Yz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483bd7354efso86702305e9.2
        for <asahi@lists.linux.dev>; Tue, 03 Mar 2026 23:06:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772608014; cv=none;
        d=google.com; s=arc-20240605;
        b=ABVeDeXgf/vGc8uoPT96pL7y06r8LmkoXdoqcAHem7JVfO7lFPVcO6KgF6FWCZi4FC
         +/tRkgaNp4izMG4FCBZpTjPqv+VBa1BFlLHKqxsC90eEa9vHWLByu0z8cZn/sY4Qaadm
         YQtkFuNHV3/vfONbO6Y1d05MmOgL4P7AJBC0CTMNuwwBiYqohsaJo78AAHcACol0SqE3
         yRxUDBh3k0WTB+c0PNJ2YFkHfVuRe0r3ETzd34Y6vPsjdKCYuIGdkyy6Bll/r+D/H01g
         gFlatNg4ziamhzbQtJ9DyDqfSovPmexXcnXpggh/duUwySwrdYI1Xc5bVFTLL7gn2q+U
         F+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Eq9qyHdKQ7LYi/t9tIfBeexRCTEngbuCUrZuJRrNrqs=;
        fh=GMptjbllrxQg0he3oZmZiqiSWPEuNjsbyCm9lrqjZQI=;
        b=EjxhMfpycu1+GBSyFKvToAwqez04toNYUiA8GGxL/81vFoat0VKKFbOQmcKI1gGLIc
         bcZ3Xie3mMjV2qvFk3uKASR7jg8Psayk31sNwhw77GWLRNITV1K1Y1b4Q+aTD2MauNOI
         xqg0zMNH/zQvxsp6geTx09x9DiKGpVlKgAALZZH4pjFBTuHH2ZTuLkyuf0xcwm2IJDNw
         KZaaoF4nBtE9RWWCURKJAoAxTevTnpxgkYJNjCKCy/ugfL6B7Nhx5a3Tsaa0tOrle83F
         U5dLuzZcsEhvnrYPUGrCy0j1AbmcBwAaT4qAsM8PxZTY6JeruJ6dah37SxZdfnoR8Uwm
         Y4XA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772608014; x=1773212814; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eq9qyHdKQ7LYi/t9tIfBeexRCTEngbuCUrZuJRrNrqs=;
        b=X9RRa8Yzi50wZM8WUxo87QtzchGubxOWUB0UdPQN1lbtn8F0ik4qR2cVU6Lmx6BQPo
         Rn/jp5Oud0ANymLDKk+rKlnVpuZHov2LxRIs1EwzWW5uUUGCbRTUcMB7wb0Ur204gggA
         G9JRmIZ4+wUYwsUm3GHGnmRNQau1joAKHh2aUCWEimEEFHIHEhxOu/1ozT/3rLQ9PH2F
         plFBZbYQ0B76ju0BtwF6dMb+nBwUYg47COiyKq+pbvs1RZlhSxorQXjoXPG26lcSU/Gz
         7hRqozxH+L811yWiEAa6j1Hruxx1gj0YA7Xqe4M04Zoy+aZGu/v9jRio+tQcNjFIdkYg
         bU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772608014; x=1773212814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eq9qyHdKQ7LYi/t9tIfBeexRCTEngbuCUrZuJRrNrqs=;
        b=O1GuLQKqxpnjDFXeBl+D0CN/gVDS7ou004BS+cdOUwZPSr+D5qOztPRzRVMNoI5e/8
         +38Jap6pZ1VObOqo+ym4XZbpM2mKzj7OBvzJsz9y10vU5SyaXmpNIghfQWRpdvyhwqZI
         XrR4bjyyoZwebkOWqpgkn4PWTih4YFy3ykFbwtBe9SmFh0zzPiKKWKrHZ7K1yDwQ6ENJ
         uZSH0S9hByshxhvtENP46CsCbyBMAeP+6q4ERhkxBpm26UsbDn1MuvivIkOaxXgpkmvy
         00WdWP+V9C5btwpYCsRXT5fTWbCVVhoxDrhKvrBhjQmKj8zgN+eubtdSvsn5GRBUOkFb
         GbMg==
X-Forwarded-Encrypted: i=1; AJvYcCVr3XvWBiiRCZBTZoOER+Q9GTtJq1JXXUl/7YXiOAG7SbW98gLU12u1qtoZ744ANfz1jGkbCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMvO4XlpYZh1cjghUCX3cT7yCMO/jFIBF0N5QBFD2OFkO6HbEv
	aCVkxvcF+2F1Q19VIfLXY2a7aXISsspAf0F6V3ATvyHdwQSfUSgFqLQ2cXFMwKBfkh70M/aFFzH
	HYS8je/andJT8ZqZMvMbyYy78M1D3xIBo2Ia9kOjg
X-Gm-Gg: ATEYQzxi08NuYIqLE7IjMLDEP4QZDUnErVghs2HoqjnEMSrWyg9hb6YaW1jOfVX+96h
	KJfn/2DJNneAD3vvwBNQd0oYtZZUsK6aisc6L5WRajhvZrDoA8B3/EOmGFTcpReohp5Ul3M3Mvo
	0lj2nX0l8HkmMtHdyJhwlQXJd4G48cMhio3GnTfHg6MXAKy8WQa+33rZMucXUUEufyvzQD4hDVj
	+jCWE12e3yRdjzuklfB+le9t+mLsRCD4Yrb+y5ucyKwlUFfp+Nk/to3T3LLGpH2DMUzexS/moKm
	2iBmLj2TH0oTKRNpmvHTP4KbikboyNudHzPyPg==
X-Received: by 2002:a05:600c:5308:b0:483:43da:6c87 with SMTP id
 5b1f17b1804b1-485198b1738mr15878455e9.33.1772608013607; Tue, 03 Mar 2026
 23:06:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302140424.4097655-1-lossin@kernel.org> <aabGlKYNd0CrO7_f@google.com>
 <DGTSY7NPZEDA.27MENGDJA87B8@kernel.org>
In-Reply-To: <DGTSY7NPZEDA.27MENGDJA87B8@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 4 Mar 2026 08:06:39 +0100
X-Gm-Features: AaiRm51LTTpf0T7q1dEgZF8jNp-KJy70-qlcjjgy9Tni2I14wcBDMvhmeWS5iu0
Message-ID: <CAH5fLggJd-5odNbCTbcOdF=C_c674su8Fz=DRsLdfbA75LFS8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: pin-init: internal: init: remove `#[disable_initialized_field_access]`
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Janne Grunau <j@jannau.net>, asahi@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 8:00=E2=80=AFAM Benno Lossin <lossin@kernel.org> wro=
te:
> >> add escape hatch for referencing initialized fields"). Thus remove the
> >> `#[disable_initialized_field_access]` attribute from `init!`, which is
> >> the only safe way to create an initializer handling unaligned fields.
> >>
> >> If support for in-place initializing structs with unaligned fields is
> >> required in the future, we could figure out a solution. This is tracke=
d
> >> in [2].
> >>
> >> Reported-by: Gary Guo <gary@garyguo.net>
> >> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-=
init/topic/initialized.20field.20accessor.20detection/with/576210658 [1]
> >
> > Should probably be Closes: rather than Link:.
>
> I figured that we can't really "close" a Zulip topic (we can mark it as
> completed, but that topic was originally about the field accessors, so
> not sure if this makes much sense.

I mean, the Reported-by / Closes pair is most commonly used with lore
links to syzbot reports, which isn't much different.

Alice
