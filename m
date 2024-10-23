Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0FE1E6DFE
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 21:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729717566; cv=none; b=A/PADXcdcx64T67fSr9g6HKkKlt3w8mP1vlS4qpVZXxKGapbMombPUT7AqreuJ7AJZf8E+ee0ZigqH/5gxRxCogrQqPBQoJzKK0u9LmTgSGvGS5GLjyv1QSUs8PmHoJDAVDD6pGVC05WIfCt1LHCpaAUplOwHZmaU5l+lwBq8QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729717566; c=relaxed/simple;
	bh=/JEcIBihja6V3LP52eHEY4Q3j5KZkMGS+N+dxgjhsRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i/9fkUgE0P1ryiVb6L0apdfzl282kwumgEJWm8WutW4YZYMPlyx7FXQ3jLKJVdHNp+q/9BRjqAR9S/kZ6Me48N2fJJQJ0RHhAOhmkDtPpOP7gG8MhuFqxvUJoqWKbWCNFDaaCuZjeQixJi8NBbMQOn3icnjtsODzdD/Wi9aIK10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1nqt40UG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1nqt40UG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43150ea2db6so17875e9.0
        for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 14:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729717563; x=1730322363; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JEcIBihja6V3LP52eHEY4Q3j5KZkMGS+N+dxgjhsRc=;
        b=1nqt40UGFiBStGycMaqm/b5EqNmpf8D6UiRTwpCFhyuDiq83LRAt5pIipevzLThRbF
         i20BYy8yxfmLjxvpsm+W0oyolZitFbk5pfq+gKCegzsgCTwBnAKSKHs08vo8IghDzg7K
         sFNKrZsUUi3onciGGLGA7XZUxcKbDeds76ornnHA5juMESqy7fiOhJcphTP0OMIkqzlK
         5KdCMciBOEaQ8VhbTDXLE0tQzyM0kktpfbNIwF0UJFswlYg7+Q7MtxcoIIPtsV80bAdV
         Cb3mYO/N8a3sgx/atKk1nbbdjjamuwRZjGSt1ktbw7wu8gI0i6+xkSGRc6EdVGqJgvJ0
         pYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729717563; x=1730322363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JEcIBihja6V3LP52eHEY4Q3j5KZkMGS+N+dxgjhsRc=;
        b=BDhZzq5S2odIoo38FGLX8A53KLOGLPgoAdl0dTMh3gYMiwtQq+G84DJJpMl0s8ucJD
         yJOQyt2U0Ae/LhHMSNM4l9LF/ItWNhYUC0D78usSBpNEw5eFrqkgQUBBGomz3x28s3Oi
         ZAAImPoUjjsjEQ5Ca/VxpdZTPpMmCExYAHyLaWQx9A19yeEQgRnqCyVWlFiwRJMSMsaJ
         PvSPjC3gzM3FSJyXFpkdNcDSazheH0t8NxUwCnMN0BFejuRrS6l8QJ5Myzi7vPkrs0ni
         Txzng2wUQzLWGwqi2ZiD5EbFEBXbwCUdsy80Gan7iQtjBMV+6ZmwxoLq9CUuCN+4hhT4
         92FA==
X-Forwarded-Encrypted: i=1; AJvYcCWysrvp6mpsIZCr0rXwuzhCzfsVeuOwloYLmqcF7l7s/UvQJG9dR/Kjm4KEev91VaT4Xt9/gQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhvFblSXmTU1LBwyDxAoFgJ9kphR/CUS7DSv5msiewLhJ/HSw1
	tAvOnHyOf5VUALWooo9L4+O+TLHCwe6R7D0Itef+zOS3dOz2nd07XbcCW+KCkoJH6tWQWN9MIKn
	FWheTFWj8DIJhSTwESc3GqkloduH8ppBgaB6U
X-Google-Smtp-Source: AGHT+IE7E1sQKkdi+IOPziXhygUCQe4DRbGEMh2n+xHqKHoCU4m0rJ13HS4/hKLnTcO13YuD7nqu8DLLl+hDRTXCmBQ=
X-Received: by 2002:a05:600c:5023:b0:42c:b0b0:513a with SMTP id
 5b1f17b1804b1-4318a50525emr1319735e9.2.1729717562737; Wed, 23 Oct 2024
 14:06:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-36-samitolvanen@google.com> <55549683-2453-4b67-a380-8ace34b3a06d@suse.com>
In-Reply-To: <55549683-2453-4b67-a380-8ace34b3a06d@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 23 Oct 2024 21:05:24 +0000
Message-ID: <CABCJKudc-f4OfyfWnDwXGM=ohSin7Z=y7Fk92Du_17LB9ptV+A@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] gendwarfksyms: Add support for reserved and
 ignored fields
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 2:53=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> I've noted some nits above which you might want to trivially address.

These all looked reasonable to me, I'll address them in the next version.

> Otherwise this looks ok to me, feel free to add:
>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

Thanks!

Sami
