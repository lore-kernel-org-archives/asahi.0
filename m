Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CC413B286
	for <asahi@lists.linux.dev>; Thu, 17 Oct 2024 00:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729125001; cv=none; b=IvdQDYvWEgKolV+nQ0pAEKbslN6tMA7+iCPcEFUyW0dnSHO36zqzEaj5yhPtn5lo/qOFDv+xkPbea017r9PmZsa0Wsz4MncL/z/flYEGiOKJX0hqpHGVhDh7maI2/fMC57Pjy1wZBj4FUcK9ZmLIBQh7UybPW17AGkUtCILfDlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729125001; c=relaxed/simple;
	bh=QQ3yPlmHif47DLR/Zn5xQDSKv4ALd+gwooeN/Tt/rWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJ1N2O7gjHHpeC51YelAKDY20+UZndlA/GiMRtCRA5sqNdIs4ElKDZ+c/pU5H31SlT5b8QjuEtdlLWmresJIF5M3DOVUYgfXqBVHrdFv+Eox6pdgjgbBQbdnF3DODwAh4tv6OhNoNheSGSHvRpI9CzxD7+s8U4zCzUcvoaoH8MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ym/k7gj5; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ym/k7gj5"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4601a471aecso76491cf.1
        for <asahi@lists.linux.dev>; Wed, 16 Oct 2024 17:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124999; x=1729729799; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LH0Z2Dabr0v6/YTuA2hPIezpeV5Gwf0kakguPcEDLYw=;
        b=Ym/k7gj5LxWfG079sKvDnaK3+AF7AmQgH0yXAUoD/WYBE3u5Jc4eGKvA/1whd/cKXm
         +94mcbRWBA+UavsLn2rrMUr2rbJ1O38WIHsjufPR8Qw1X35SNhzlraZ17DBxqMtscKla
         V/8A1wwfaqK0JPE0AyMMXH6ZlkwgcGqlVosMBNCql5z3AARqDDnp0vhMVW+lNI1Tp0KH
         62cxbCxzCLDL1zVFFj4oW746EhHAe47m5tjWh8YQFalhnWmuG1CZ1+3aL7eB13sLOvJp
         WigvfUlmhOlLR/Yp2B4KRqAzgGSr2cCQ6og9qsT1qdhVxyo7ww0kYjmw6IflKtybF61G
         7MkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124999; x=1729729799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LH0Z2Dabr0v6/YTuA2hPIezpeV5Gwf0kakguPcEDLYw=;
        b=fc5wT5KmTpGWnzOcMawpPM4Zd07emzsMwsA0RhYYAmfBvaZjtzPlyKBMhKIdtiLGEC
         wz+MtGB8pzyTzXb5gh0alVgngCgX5wn3vmvv3hXa9HywBdVRqiak3ddoTsphciLULtjt
         CqUklyIPxMvgJ1p/+jG8Bys3WiXlgqcPm4G2VV/ST1cPnkNC4PQoTP4UCUb8cfJ8oO0I
         UGay9i9KZtp3ss4TVptqC3Sik+Ngbpde3pegDiQufXNLb0iqITKV+LEQ5UqmVdiNoXL8
         Jt0bNQ1ehrErX2phPxn0HGEpM9e6OabDR3Mu7iuVnManj179CGM0gg9zjfXoZTSc2Wra
         t7OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTefoa9yQ5V2TcT04d/prwx/QzuavoFAe2Hz5MQcEJyFeJiJG3Jd5g0ErBU9AQ2Q23cajK9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuvRNenZlShiIcBw4R12X+bPqQigXPGTzCwsW1JJg9G3erxA0k
	xpeizMpA9vqYtKk6JOCj9W93EJ0c0eA0/hkY4RmAglFlHWaWKBZ08lYjwZW+jcgkmXSo4DV7Vte
	V8vCt8CvL2ah8zMCVuUv/zkgmAFA/OgYLaxnY
X-Google-Smtp-Source: AGHT+IEkiqlXHuKYOU8SwBMR0dV+VSeKX1cEYOa+jnRE7HTVIAIwDiHxxERyXoPvpzA18MmYhkLujQjjhoStViWu6eQ=
X-Received: by 2002:a05:622a:a313:b0:453:5b5a:e77c with SMTP id
 d75a77b69052e-4609c7856e5mr1655011cf.10.1729124998247; Wed, 16 Oct 2024
 17:29:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241015231925.3854230-1-mmaurer@google.com> <20241015231925.3854230-2-mmaurer@google.com>
In-Reply-To: <20241015231925.3854230-2-mmaurer@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 16 Oct 2024 17:29:21 -0700
Message-ID: <CABCJKudqG+8-MdxXRfdu7pYe=UniiiAV1P4QnbP2c1R3Q8DC=Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] export_report: Rehabilitate script
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 15, 2024 at 4:19=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> The `export_report.pl` script was broken [1] a while back due to a code
> cleanup causing the regex to no longer match. Additionally, it assumes a
> `modules.order` file containing `.ko` in a build directory with `.mod.c`
> files. I cannot find when this would have been the case in the history,
> as normally `.ko` files only appear in `modules.order` in installed
> modules directories, and those do not contain `.mod.c` files.
> This patch makes it able to report symbol usage counts for a build tree
> with modules and MODVERSIONS.
>
> Since the rest of this series will change the format of `.mod.c`, this
> change fixes the script to work correctly against a current build tree.
> Given that the regex no longer matches the format used in `.mod.c`, it
> cannot have worked since 2019, so updating this script is purely out of
> an abundance of caution. I am unsure who uses this script or for what
> purpose.
>
> * modules.order in a build directory uses .o, not .ko files. Allow .o
>   files when parsing modules.order.
> * The .mod.c format changed [1] how it expressed the section attribute,
>   leading to a regex mismatch. Update it to match modpost.c
>
> [1]: https://lore.kernel.org/all/20190909113423.2289-2-yamada.masahiro@so=
cionext.com/

If this script has been broken for half a decade and nobody noticed,
does anyone actually use it? If this is dead code, I would prefer to
just delete it.

Sami
