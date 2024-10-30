Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687AB2144A7
	for <asahi@lists.linux.dev>; Wed, 30 Oct 2024 21:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730322889; cv=none; b=LHKnxrEqrdT0iEyyoNfTSoZTI+2hucYO2912uoMzZHBGgjaknU/uomE83TlUdZDggLB50bmAnwCWJUAyzKA/XvTpRLZJIF6lUU3y00WfthDJbE2v7Z8mIQH90PKZC/yZJHIiIO5bBgyMF2WGmws82IB4OaxdV+uzb5uzWFJyZNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730322889; c=relaxed/simple;
	bh=o534AfqHtN7RldxfitzK66PsnDX4NhPFj12yRB4Rmbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkQSAHJ731HBkuDtYvauYfUzou/nDZRyNQBX6p8iyaPLABUCGD6uiYrW4wc3YmK5HgSM02NEevdEVeWZ+ILfnpmx8SiHB7gIuzH23oKzhxrKMP2OsDWss2vIdYEWcp/pj+ZGapu/FGntcQvMLYB0/6XErwL+T+VsPQvSIXi5Yog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SPJUnVAK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SPJUnVAK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315ee633dcso33245e9.1
        for <asahi@lists.linux.dev>; Wed, 30 Oct 2024 14:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730322886; x=1730927686; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o534AfqHtN7RldxfitzK66PsnDX4NhPFj12yRB4Rmbs=;
        b=SPJUnVAKslX2xQbz+uL+aKPqbt2Z5xUxZt9eP+ifrOgKlLR6kYQjaKno2FKSezRgbJ
         3TMU3JB9/4tTvZHnq0zYEhaTcZxGNb8SmBUAezx7NNZC++Emsyb4o/FZK7q5TiIMNKyk
         Cw9ZMAUl22dVEvFHvf9m32xU6MTZVAW/CrdVaorE6f3+OCSnt+WQeDaC6aFpLZgQn24q
         53jBaclAVBhNTFVRr7tFhRkYy9ozezQsOU9i+ao9JljJj9HYG+P46n78G+R/dYtElhMz
         4X7eRlUitBEKMzHWjJJ3lteKhNsoja8ajU4Dqoqa4+dpxfAxoKhRC3j7hf+UHyGievqc
         EObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730322886; x=1730927686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o534AfqHtN7RldxfitzK66PsnDX4NhPFj12yRB4Rmbs=;
        b=D418OiOoZ/lN5WN7g7rTSjKZZ/krKLezvS7FMeiREcqUCspoldV5fnDYHH9aqcFY4F
         GCpiUxaXLbyqrmATVZmiNgDDh44RZw18wT1YNT8YiU1abQVUFlXpfof70pd11/bmXS6/
         wHcu68qRNqOGuqKiRf25FiKMqbdEG/0egvwzvJMbM91clv5DcZKwosFrm+gI08L/IFql
         S7ueEICRubqigdbQlUGW7j/S77Ty110pr3h385q0QEpXAI3X9hu/HJKjADeLML23c0NJ
         T56Cm3DZYgvDmkvEB+ZUt7YyuqC8qav2EB1BUjK9E19w5ki+jyvxYeAtKDOsVw35lvMh
         Xtyw==
X-Forwarded-Encrypted: i=1; AJvYcCUrMLjoYplN2UNaonQ33HPotMyXp2po70xb/uF5UNFf+HtUgYdsKuPSJwPsTDg90c2C0Ry2rg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlaXAsDzxf4PUh3HmKKsaKCB+4RS9wQllOMBUZ/RAzXy4X8Hj8
	P0n3Qi7jiPZnpCY72ecwWiFeexvr32Z4ZP3BulLILjgJvN5mTFYVSq+oxOu9c0XcJn95BPjFIx6
	Vcji8npOo7gKYXKwP43oOyJxxkgZEg04DTWu9
X-Gm-Gg: ASbGnctK+Pl0VANnSEtLI3k4iHeHNP0nK9cGsLUbOccQmrC9mJIJEOy7ApJYoDwg4UL
	ealWKU0dDJHBTtHie94EITo0AdwaNBgWDdTzVCvGWekXzu1N0AgDONq/xo4jyFQ==
X-Google-Smtp-Source: AGHT+IGpbeaz+5KppTzbcYqEE1yAqTgZJWcDUhQHhbTL7VnBBuh5AYIfWrbwLxtiZ4nkFcdHa3790grpJGu5v7MdZew=
X-Received: by 2002:a05:600c:c8c:b0:42c:b0b0:513a with SMTP id
 5b1f17b1804b1-4327bdca213mr1401735e9.2.1730322885602; Wed, 30 Oct 2024
 14:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com> <CA+icZUWTdgM7HQrnR_NzgZZQE3aXXk+tAqD3srNd1Eyjr5d7EA@mail.gmail.com>
In-Reply-To: <CA+icZUWTdgM7HQrnR_NzgZZQE3aXXk+tAqD3srNd1Eyjr5d7EA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 30 Oct 2024 14:14:07 -0700
Message-ID: <CABCJKuepGSFcQa0F5iO4aa4V2UbhuKO+tyfhB3_ODaTGs3sM5Q@mail.gmail.com>
Subject: Re: [PATCH v5 00/19] Implement DWARF modversions
To: sedat.dilek@gmail.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sedat,

On Wed, Oct 30, 2024 at 2:00=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> Hi Sami,
>
> perfect timing: Nathan uploaded SLIM LLVM toolchain v19.1.3
>
> KBUILD_GENDWARFKSYMS_STABLE is to be set manually?
> What value is recommended?

The usage is similar to KBUILD_SYMTYPES, you can just set
KBUILD_GENDWARFKSYMS_STABLE=3D1 to use --stable when calculating
versions. However, it's not normally necessary to set this flag at all
when building your own kernel, it's mostly for distributions.

Sami
