Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0238D1DF67B
	for <asahi@lists.linux.dev>; Mon, 19 Aug 2024 23:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724110904; cv=none; b=LULxp1CoiCPzHdCeaw/F1Bhn2EGjWASPe22eP6ZTbelngnuozpH8m7/J+4VfdTroZ+gl8+uK/gC8TCS5Nk+452kNuv/plJAu/tFXNa/ic5I2yA63XWQXBncuLRmIWQy7AZTwnBIS2nEJ3G1H8/YTV9tPUwOnJO8pUZ3ILqhYXlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724110904; c=relaxed/simple;
	bh=VyJ7DwTEeQRwF2J9itqF7qF9lyR7ouza0PHAuQm+FtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOwzRhND8TCrPbse06K1qu/2n5U0mYUhptqiFlS3jz2DvSDybtdzDfejE9xZ4svhCHPv29Fu92Z6MOnK+lrxIqTxdLmF5LdV7TqS8jwXUaRGgDdNAhwxdU0LzmMaqpsnzj2eGBkfBWH+6h2yFy3h4Yw4C8MjQaSbNNBt8gMhDrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VN+F01+p; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VN+F01+p"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5bebb241fddso1688a12.1
        for <asahi@lists.linux.dev>; Mon, 19 Aug 2024 16:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724110901; x=1724715701; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyJ7DwTEeQRwF2J9itqF7qF9lyR7ouza0PHAuQm+FtY=;
        b=VN+F01+pyh6lfZVbANbW2C8eDSn+9SCHRyVUXnpFbhULVasDZOuHFiRMK1djhndi1+
         3xu+pb565NNKa9TM9nz/o9xTVkH4ifL/x495aA4wjF/QN9DjlCUEgx6AADRhHeqVmajU
         lRnk89h+jbpInEfhvFXExx4mO25dMEOpR+EibS5MhO+YEuw/p7TdOyiTqEkFAkzmA2iu
         feo5M5gm8VkjuJi44VH/3ScgbW64xd9FaNRsZmO+bN2BW1PxrchAt0p49jefdNOftQc6
         8eMR1eA2mqOUd3622NKyD0FtAmdVsWJ9LMDAzgl0xtiIHU1H1tBKRUil+fEflzVepQ80
         HyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724110901; x=1724715701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyJ7DwTEeQRwF2J9itqF7qF9lyR7ouza0PHAuQm+FtY=;
        b=ho0qm54bARpE82vnZj2+Us67lww9a2KhDTDHCqOTCmM7MZ/HwkswdgyPGgtNa/Bf88
         XpNzqx01lpbgaodVQhJF3LoNjqEwL2uHqCqZEjdDCoe6FgoaAvaQDEe8CzPjQ3Pnx9Nd
         1Nwdo0o8ibOkTjUmoKWdpbw7g4w6zpO4ibCCDI3vEgdRiUXvrie5o27gfvEBId+IG4kw
         i13zm5fK/3z1NSuduMwSwHXl9IZFSxxHo1b4Ue7cT64OkSp+VBrb6UPW1gbsH/oLQksb
         tdZhVwZPXyEMu/x/bdfCwQEkpRvymzRJRqkgn/KDbSA0GmC69fpAIuZxcgCp39KWeGiE
         SPZw==
X-Forwarded-Encrypted: i=1; AJvYcCWNmkilb8XQjnhn/rNQ5YX9d6KU+fvDciXQLgjGXMfwYAmDY6q0nywSZnZ32B359eTrdwD2IneFRb9JPciKl7xBBW3fXHw=
X-Gm-Message-State: AOJu0Yxm8QJXZIneAdJn/gSQA9Sji0jFS41stuybKDZCDbqDZvbDJ4lM
	Z4ubYezQvaVyJ+U28XcA0dyXxhovsVvvqS4O7zShtRez2Vi59H7mdAN/QjerMjzTMklHm3uVzgK
	jnOwChm1jhyywdzvFCfAzuC0HUJbjB19O+H7e
X-Google-Smtp-Source: AGHT+IEFf0La4uREmgZmbe880Nnbs8CZTxbPC4ox9daCMh8bMB0DPDlb/vwxR0dv4G47Vf1sgvElegvu9c36SV8SoxM=
X-Received: by 2002:a05:6402:3546:b0:59f:9f59:9b07 with SMTP id
 4fb4d7f45d1cf-5bf0c262b15mr42504a12.4.1724110900976; Mon, 19 Aug 2024
 16:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com> <20240806212106.617164-15-mmaurer@google.com>
 <87le0w2hop.fsf@mail.lhotse>
In-Reply-To: <87le0w2hop.fsf@mail.lhotse>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 19 Aug 2024 16:41:29 -0700
Message-ID: <CAGSQo02r3NhWnpBF--5nB2RJ=1Hh97VshtiZmasDfknnL+UjmA@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] modules: Support extended MODVERSIONS info
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Nicholas Piggin <npiggin@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 4:04=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Matthew Maurer <mmaurer@google.com> writes:
> > Adds a new format for MODVERSIONS which stores each field in a separate
> > ELF section. This initially adds support for variable length names, but
> > could later be used to add additional fields to MODVERSIONS in a
> > backwards compatible way if needed. Any new fields will be ignored by
> > old user tooling, unlike the current format where user tooling cannot
> > tolerate adjustments to the format (for example making the name field
> > longer).
> >
> > Since PPC munges its version records to strip leading dots, we reproduc=
e
> > the munging for the new format.
>
> AFAICS the existing code only strips a single leading dot, not all
> leading dots?

You appear to be correct, I'll update that in the next version, but
want to wait for more feedback on the rest of the patchset before
sending up another full series.

>
> cheers
