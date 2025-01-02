Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FAC1B0F1E
	for <asahi@lists.linux.dev>; Thu,  2 Jan 2025 21:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735852849; cv=none; b=CZQV2pJ5AvoI8jIxjmHj+TBwXeY1/h70EET5PYQE3V6PGeBCScLyxiBYXE+km4rAZ7wtH+IAAe6tbV/2XgX5uMF/QJgZhz5YLcsw2s9bVPD/btHiqdsq/ARM1GHIMkRUf7+p4oNAojRl4eCtV+ITN3ZZJAcpwbbzmOYFmzr6ltQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735852849; c=relaxed/simple;
	bh=vTo1ZqsPUMCCaQufaEwYjzzgT7pASANYmiKJQF8QkVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPucDldPw1PVoNms02lPbbSXdMZS9AUFOktClRlkCZCnlpgkFCpd+f6UsP+fgZutnRGvw6SljxoGmmZaw8SnhOJ8DNu/ohLZrPc/gv2+r6TLbMzd1qWx+SzkaavmwqZa2eJTdWmA0hHvgcgiqnxgg2I5wXc/x4/ItWQag6e8aQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xs2nkbBF; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xs2nkbBF"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3e638e1b4so382a12.1
        for <asahi@lists.linux.dev>; Thu, 02 Jan 2025 13:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735852846; x=1736457646; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9vFdZ7IDOzdE65bXGsMPSe6IPVaerxNKtrCtifyzwQ=;
        b=xs2nkbBFTYAaPkqYq4W4G4pKDC2gmR5eKFZexEZamWIzF5dg+Ga4j8AKu/mLjddUYw
         qvQ+Lyi/8MPD77mG7JeeefLqRg7dtH6DMyeh4YY1M9leLAKO/5zvuBqPMmTtzAVUHsA6
         HC9CyCJ16Mozts8t4NwosQfPDD2G7ww6V/P660YIqTELMz1sizRw3ntII338zj1Poofe
         5kq5SRzOPWOlDJ5Sq4tcLzcDlXq2+t3EF7yd9uEP3RqyxmwfFPUNeNID/Qmon0DVCg1Q
         uFFiCpe6C3YDeUtr9jCyzBOd8+S7hPaHL93jU/3qt2/XmZga/s8ssiAev6ZVSlH90boj
         YIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735852846; x=1736457646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9vFdZ7IDOzdE65bXGsMPSe6IPVaerxNKtrCtifyzwQ=;
        b=Lcge1PMgVssqM8qVQ9OrX8gkts70BRzddJN7MF5tnhQ+9tx3MlSIHdFYDsCTT+dgTt
         6P57JpiNEu1eaQ+9bHxLoLdgEiAoLEdFQyY3DXr5kmWRJmaSvlB4gHwrJPRYYh8v/k7W
         8uI5lN1fQRwwROqm8uEl2vzOADFoLP/13OtbP+cQcIxm3SO8rulyFvWMdFjLsQDriXLj
         5uyNAxUnoegDQRTbLhX+VnyYlHru8k6pM0vgiXlskzYK+q/LXZr5GDUG0W0uEeOHkGHL
         NA8qLWsrknPK9EEs1dtYbKmA1Nb2wSFeLhRi4eXElqOGS9O+zqGnJzzrgtkk04cQXRgy
         ocrA==
X-Forwarded-Encrypted: i=1; AJvYcCXxJhdGjz1AQT99Td7AX2FbS0KdB6fM1GXOTTLzIMEnUZlsNQT4YF/bxfZfI0Tys8oJyiui5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9IO9k/pTTiHmkb1NCe+t+X/8rHFIu9kZEn2bJZzYV00S5JkGT
	+jh9V2/kRHpVYdx/h2HezInv/C3TEmFQuoqgz2mHDKJ3x9lJ9neSf5KUiQy6KwNGkXG+4LTvte6
	bQkFC3hNRnMQ8qknVmpmehvS8If4nuAn6c7J3
X-Gm-Gg: ASbGncuNSeBQcwgkA4sLguMp3iMDFyIc2pG6WqQeP4L5pSHubllpZEX+ELqSLL07k+B
	35X00pdINinI4KXm9NVMF0GxjmhzAKYHtyzGg2kXZUyzLkyI6963b5UGP55sx1eWHuA==
X-Google-Smtp-Source: AGHT+IH9SygaaxBqUPclTbHe3MzYjU7Sn3gBDwj+5VIodQhhpoIxsAYg0gsp2U2WhePi8dcPSYF5grOygMRJ+YBwyjY=
X-Received: by 2002:a05:6402:538b:b0:5d0:d7ca:7bf4 with SMTP id
 4fb4d7f45d1cf-5d9156e2c80mr23976a12.0.1735852845570; Thu, 02 Jan 2025
 13:20:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
 <20241219210736.2990838-22-samitolvanen@google.com> <CAK7LNAR=kBi_LN7UkO_qzUQh8fMd1BMf=ZZMQMPph5smZRzSSQ@mail.gmail.com>
In-Reply-To: <CAK7LNAR=kBi_LN7UkO_qzUQh8fMd1BMf=ZZMQMPph5smZRzSSQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 2 Jan 2025 21:20:08 +0000
X-Gm-Features: AbW1kvaNjKx0eH_u3SVWBJidzerXL7V3SCKDxDD6r1mwb7-uASHbuJoLBzWifzg
Message-ID: <CABCJKud7qojuvkcGtOKsXjd_g5A7aS0AT611GVMGtsw5SHyJ5A@mail.gmail.com>
Subject: Re: [PATCH v7 02/18] gendwarfksyms: Add address matching
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Dec 28, 2024 at 4:29=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Dec 20, 2024 at 6:07=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/sy=
mbols.c
> > index 7adf2ed9b89b..98febb524dd5 100644
> > --- a/scripts/gendwarfksyms/symbols.c
> > +++ b/scripts/gendwarfksyms/symbols.c
> > @@ -6,8 +6,39 @@
> >  #include "gendwarfksyms.h"
> >
> >  #define SYMBOL_HASH_BITS 12
> > +
> > +/* struct symbol_addr -> struct symbol */
> > +static HASHTABLE_DEFINE(symbol_addrs, 1 << SYMBOL_HASH_BITS);
> > +/* name -> struct symbol */
>
> I think this comment addition should belong to 01/18 instead of 02/18.

Yeah, agreed. I'll send out v8 with these comments addressed.

Sami
