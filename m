Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4139219B3E2
	for <asahi@lists.linux.dev>; Thu, 14 Nov 2024 01:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731546574; cv=none; b=KKlkyIk8YjdBOa4HgEnJ3W5S3pO21Ly77nt7Tb0zNiq/dXz9MtUQZ4ni6LajseXz5b26PxB2FFE2tNJ+OaPs257B3O2Ule/0JhlUiTsDu5wrrSuf/aMQcI8GAJd6H0hXbx0vpagWwBoYWYLrRSDIsBxYzVK6J5D4KWVgmxsUPgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731546574; c=relaxed/simple;
	bh=4dBnu6yXq+K0Mi0c+uAajHja4UE4d0nABKzZl+smMfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPNEsXjWwBu2Vc5xynxXTZeUXugtINfx5XCD8swTErFotskcZIouLlS8GYNtJJfe2IHBfIuaRviNxOpNynSOhRmgXZyBf0tMkIoiIvzm+JoA5IaVQFcDcBTcMiTMNZg0dhDlfLJx0POahMEA7sP0Gj61fw9p3SpeLyiC2oxfeBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so1147171fa.0
        for <asahi@lists.linux.dev>; Wed, 13 Nov 2024 17:09:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546570; x=1732151370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=poZXREh8ime1SzzkUl+eZQKKgwvGXn8BXWEpCPeefZg=;
        b=wPgjTdN9s8p490I9LvPE57J2z6pcQrXrDXslQtL5vXFSRV6l7aEZLa53zIxL3eEagF
         5AQ8G/bQgrFRPTaZzw5/F3w/a4fCMRroUZ75aeMDJUJwMj9w3mN2SQa1QAeAVJ3WBEsZ
         AeSQ5V1BMMcCZEB2dywbtNy6vTsDJKN+nkVXHXoSfL7CaFsZYb2aBOih0TPrUf1JzUT9
         s98uRGz212f11ZaHQJKx3rRtrvyCxfqQrDeNP1zTl8KsdSWk3ja0rQkWigcoHHLbR5Eh
         Osh5nr5+im2w93Kv6nzlseyoWR9GkLQt7iHFJBq4Vo8V3Mdu/FRluVefn5iHKcxTHut5
         gIUA==
X-Forwarded-Encrypted: i=1; AJvYcCXHeqxuSWu6H8/Nt5ebJjTAUD6Kf09nRyM5r0kI9YaHTYuntrdDwroXa+z/zVQiQJHXPU5w3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBRlxM+0Rl2KkibaQdllohDxl3c9/Lqg2ggCkDlAhkv9aC2KRw
	ZShpQ+9sf+egyc45zlM1XGWs4XHvRFZTtq5Jk4TLQK5qXN/naU90ivOVXfz9Br3YnQ==
X-Google-Smtp-Source: AGHT+IECCrdJfANtSsMhC+4N6XVQkVDDPYsGCeZXs4gSVTFXxXHs+IUwyTN044an5DJfLXy9tYlRMw==
X-Received: by 2002:a05:6512:1050:b0:539:9ee4:baab with SMTP id 2adb3069b0e04-53da5c4cc8emr271743e87.30.1731546569570;
        Wed, 13 Nov 2024 17:09:29 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da653124bsm8969e87.157.2024.11.13.17.09.28
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 17:09:28 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso1182881fa.3
        for <asahi@lists.linux.dev>; Wed, 13 Nov 2024 17:09:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURPXaiFkwfBJNXFRbHTA8l24k7h7YFJTqWidbTmqkQYrGzZ3b7rBX8I54UHSe4/pDZ8XCxsA==@lists.linux.dev
X-Received: by 2002:a05:651c:503:b0:2fb:3960:9667 with SMTP id
 38308e7fff4ca-2ff59027c97mr1506281fa.14.1731546568430; Wed, 13 Nov 2024
 17:09:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-22-samitolvanen@google.com> <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
 <CAEg-Je_o-e3Sc0vNJpF+3eG3sZvV-f2zrCdubRAvPSLzVdyd5Q@mail.gmail.com> <ZzT_ZSNAmeloDjLT@bombadil.infradead.org>
In-Reply-To: <ZzT_ZSNAmeloDjLT@bombadil.infradead.org>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 13 Nov 2024 20:08:51 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9yJh4teQeix4N9BF85JhkQMPHLAz2dnBrM1MLbBjO1iA@mail.gmail.com>
Message-ID: <CAEg-Je9yJh4teQeix4N9BF85JhkQMPHLAz2dnBrM1MLbBjO1iA@mail.gmail.com>
Subject: Re: [PATCH v5 01/19] scripts: move genksyms crc32 implementation to a
 common include
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 2:35=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> On Wed, Nov 13, 2024 at 09:04:51AM -0500, Neal Gompa wrote:
> > On Mon, Nov 11, 2024 at 11:06=E2=80=AFPM Masahiro Yamada <masahiroy@ker=
nel.org> wrote:
> > >
> > > On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@g=
oogle.com> wrote:
> > > >
> > > > Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > > Acked-by: Neal Gompa <neal@gompa.dev>
> > >
> > > Does this Ack add any value?
> > >
> > > Acked-by is meaningful only when it is given by someone who
> > > maintains the relevant area or has established a reputation.
> > >
> > > $ git grep "Neal Gompa"
> > > $ git shortlog -n -s | grep "Neal Gompa"
> > >      2 Neal Gompa
> > >
> > > His Ack feels more like "I like it" rather than a qualified endorseme=
nt.
> > >
> >
> > I have tested and looked over the patches from that lens.
>
> The tests you did, what exaclty was tested?
>
> If it was to just ensure no regressions, then that information is
> useful too, and with that you can just provide: Tested-by.
>
> But actual details of what you test are useful. We now also have
> automation of tests for modules, and expanding test coverage on that is
> always welcomed too [0] [1] [2], so far we have 0 Rust coverage.
>

I tested that I could turn on MODVERSIONS with the relevant patch
series, and get symbol expressions out of it. I didn't go very far
into it, because I didn't want to invest in reworking the kernel
symbol dependency generator for RPM packaged kernels to leverage this
until after it is finally merged. But it worked as described, even if
none of our kernel packaging infrastructure is adapted for it yet.

To be honest, I considered sending both Acked-by and Tested-by, but I
figured Acked-by would be sufficient given that I have also looked
over the code as well and thought it was reasonable.

Strictly speaking, we don't really use MODVERSIONS in Fedora, it's a
CentOS/RHEL thing. But, pushing this forward helps make Rust
enablement for Fedora easier because the Fedora kernel is managed
through the ARK project, which is mostly oriented around the needs of
the RHEL kernel team. And CentOS Hyperscale (which I am also part of
and maintain a kernel for) does have MODVERSIONS on and I would like
to be able to start enabling Rust stuff there (particularly Asahi
code, as that's currently the main interesting thing in Rust to use).




--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
