Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D282F1CCB4A
	for <asahi@lists.linux.dev>; Tue, 27 Aug 2024 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724777133; cv=none; b=Kzn0TCyb4QiUT9QgNGTsAS7jgxfuMHSxGLPDb1cEqS0hr7gkNhXSfWqmpmUpt/9YH4DfPZv48eUPQDMhYiicZP4xWsXGKmm71YGMekSut6DCNKtGEpoFX5qIbuD7JcJTA5VErkHxvJchgVAWJEQcQD3Ybmbvm1XsmMpzlgxVUlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724777133; c=relaxed/simple;
	bh=13N9rWiQqinjqu5t0FpuSFOBXGf77nou/F+efdv0gD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OpCcDHjYcyTCRzySYpOYFxeIbM2WsvzDrv9aZboxGmU63tngYrCJ4kfa0cElyeEKjE7BMmZ3KEfPymuOkLF5vJfKR5GFvvIpj5Re3JK4TCygbQlHWUhl+ODOTKhO9pwYIB736V/c39G5ErDCqbVi610M8FTJYJdnUsE3NwXfxTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dZjBfrSM; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dZjBfrSM"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-44fee2bfd28so1731cf.1
        for <asahi@lists.linux.dev>; Tue, 27 Aug 2024 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724777130; x=1725381930; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yg+baRcLpnI1aQ9hlrSp/2fH28bJtbk1x405VvbEiCQ=;
        b=dZjBfrSMnsmLgkHUDvvBshUC9EGbg2avT9zj/kz5EqcLi2N8nuExBamVwNF8pQcimJ
         woVgj1Hyu9G3Z8TwpkAuquuCvkqiK/KD32wTVCDB92u8FNs1ul3MfqOTjQU7oYnrMlCA
         wV+aPxFSof0RR5ggzHh3T57kJ9Eo77TRg7PsFlwhAe7cc2HzlvE39fGZyLpgYCYZchlK
         /AdsB/+NozgRQ9qYj5y+QuCiWbaiTaHDnnD3yYkPEIFrN2UCnBV8wO1JdcL/AnK2JHOM
         ul4kLJcgqy4snzIQwbDm+BGNB74xCxhiJQEYi86s9fO/o0PF4g8KCem0YhhUHnLRxfzZ
         4kpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724777130; x=1725381930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yg+baRcLpnI1aQ9hlrSp/2fH28bJtbk1x405VvbEiCQ=;
        b=T5Bahy17Nro7D1UK4eXjvJyhacU6+uPH5Ts+WJ6H9E0cdUWpzaW+5Ud1fYiguXwdb3
         qLNHV6RoK3KsqeFrNdTYRVUoO1MpKJ0Em9swCy3GPZMEL05SoV3PhltSShYtioBQ9uSz
         bAKOr5rmqC0vJllXAxPxgmgtL1NFkMk3MooxjVZsMJlC+UrBPD95RhvS8V0FXhNjIoVf
         vPrbXNbm/HnaTF3dm1Ja1S1uCZnMN9xmVKuC/qPjRnM08MXf+sVLVmShNzYxkhoenMeU
         vVH2gDR5hckXxxaazFDe0SpBPEcVDOftWn8Bisgo8k7LrSerl3bNg+Nyrl5ia3SW0v00
         Rwow==
X-Forwarded-Encrypted: i=1; AJvYcCUf5rc7AxPfGnyvs69NBJD8wA5PTKo/E/taUDnVXLjBByr8sVsMKuiEP2e5dIP8bP9JcfTCUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyoYnh/9hlpbw4uddKa3KioqpjcA4WAbwvE54a+4Y1/kPVMdGbl
	h1R/0uPtMw4t73Y52JWL3H1ua434G7YfWYoDE3xiFsbPVo+c2fn2m7qiqNvQGie1CeH5XQRpGVs
	ftLc0zkRLbRPzg6opkazcRmo8YBWhaQS2bGi7
X-Google-Smtp-Source: AGHT+IESmvxfPWyz8OU6lrsb3/WdN97UClbBtMAbPPLrSZVeS26g2TfKlQrHovYGaH2tJhJuXW9A22yAePy9L6g0reM=
X-Received: by 2002:a05:622a:298f:b0:453:5b5a:e77c with SMTP id
 d75a77b69052e-4566168780fmr4067251cf.10.1724777129419; Tue, 27 Aug 2024
 09:45:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com> <2024081603-punctual-hamlet-152e@gregkh>
In-Reply-To: <2024081603-punctual-hamlet-152e@gregkh>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 27 Aug 2024 09:44:52 -0700
Message-ID: <CABCJKufF4xpwGkYu_H-1AH8cEAg2K4umrM07DY_X2j9qORQj=Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Fri, Aug 16, 2024 at 12:14=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 15, 2024 at 05:39:05PM +0000, Sami Tolvanen wrote:
> > --- /dev/null
> > +++ b/scripts/gendwarfksyms/dwarf.c
> > @@ -0,0 +1,87 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
>
> Sorry, but I have to ask, do you _REALLY_ mean "or later" here and in
> other places in this series?  If so, great, but I want to be sure, as I
> know:
>
> > + * Copyright (C) 2024 Google LLC
>
> Has some issues with the types of licenses that marking will cover.

Thanks for bringing this up. The license is inherited from the
genksyms code that's included in this series, but I'll consult with
our licensing folks and adjust this in v3 for the other parts if
needed.

Sami
