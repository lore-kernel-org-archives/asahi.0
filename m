Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB79111A8
	for <asahi@lists.linux.dev>; Wed, 13 Nov 2024 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731506733; cv=none; b=Q6ycm9ZGEWLk/DsP3gwbXYMZmUlzoasSwTDeDd+jaNCUhEXIjJX7g1qKLB9ZSUeiT+NRB45HRVDXBox2tBzeLd0hYIXdAUs5cpY/tHxiXFTMuHmRCEKeGS5h5jn6HDqZB5CRCQOUMvq9aKf1/jhFYO1jvKc4rieGAmugOKx1O58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731506733; c=relaxed/simple;
	bh=Dwk+Mvw8oy2pzMvGconGALpUIJPJ0NRNk9ltXBNzyBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alysnGX1TJ9CdC3QbiAQSMB9qemij7lPxPccAT+5xaCbdd2rtDKk0LJuwGCAfJP5WZf8HKOqCP3FTWlZAu1GglX2ySzeGJu9PwZUZYye8Vslc2ie80ooxdGC9w0cCFkDMpWfJZ4XMc6SavGcvI0AV5bEK8RvxlTIldapCfsJwNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c9388a00cfso8765741a12.3
        for <asahi@lists.linux.dev>; Wed, 13 Nov 2024 06:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731506729; x=1732111529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UoOpmCzIkTmid4vVTvx8gmwHFbkz8avA1Uo6ylZh+s=;
        b=MsUI9GMoLV2Pig2goDWZCPiYHucPKB1FkUrTgvi5BHGzao1Wd/1c/8Z2yFZ3NZ7rC8
         IRKqS3niYDwHsEmTO5lmBxY6e9i7E6tFwpNYj+oub7/NiE/vvX6nBo8eZin7+IKBh8x7
         SNDzuW686llHCvJllhRtqTSXPSbVqE/ek8B70zWdMAaH/c4iZKvLtc7elfwT3HvJZobN
         QFMNr++Bn6IkJWwpY9nB3HtsN7V2X9u0w4nZ7q38plyT/Kzs2Vd6HVDqPMjg0TSeS9bm
         k7N1Ep0MOzaPIIEV4QsK6H1AyYlqB3BPMwx/AocT44y5u/Sw/UOttkLP3RmRuipcg3P4
         Ve8w==
X-Forwarded-Encrypted: i=1; AJvYcCXgpXm3usXbxhqSaryEWX1PjxBEgMQYZ3GL4JRtkZrWVRRDS1fZ9mNM0xdPSAGAIGrQ9/51uQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJTz0UicfPvxSaNGPfKhX6vFWmGhfvmvJMugKWLrs8ctYOa1eJ
	OPGHN6NXMXkEJQa/01gTCw7H0ABuQIEltq2QfqnZGweuffXx9zn/gMJorarqe40=
X-Google-Smtp-Source: AGHT+IE2zOgVy57kW2Pbw1XvZUBp3JZjOmwDP3qb8N+L331ERPpAdjWHjeXm2brD5LdzLQZjgZ/GzA==
X-Received: by 2002:a17:907:842:b0:a9e:43d9:401a with SMTP id a640c23a62f3a-a9eeff08c2emr2059007266b.14.1731506728436;
        Wed, 13 Nov 2024 06:05:28 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2f063sm857537166b.203.2024.11.13.06.05.27
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 06:05:27 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c9388a00cfso8765684a12.3
        for <asahi@lists.linux.dev>; Wed, 13 Nov 2024 06:05:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXK5SHDhEvvMn5uPLhxuoTnHIFs9mZJi01w648tRhBiBDWP3pUBbP63CHecKJBs4MlKXp2eOQ==@lists.linux.dev
X-Received: by 2002:a17:906:c14d:b0:a99:f67c:2314 with SMTP id
 a640c23a62f3a-a9eeff44998mr1843487666b.35.1731506727364; Wed, 13 Nov 2024
 06:05:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-22-samitolvanen@google.com> <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
In-Reply-To: <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 13 Nov 2024 09:04:51 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_o-e3Sc0vNJpF+3eG3sZvV-f2zrCdubRAvPSLzVdyd5Q@mail.gmail.com>
Message-ID: <CAEg-Je_o-e3Sc0vNJpF+3eG3sZvV-f2zrCdubRAvPSLzVdyd5Q@mail.gmail.com>
Subject: Re: [PATCH v5 01/19] scripts: move genksyms crc32 implementation to a
 common include
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 11:06=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Acked-by: Neal Gompa <neal@gompa.dev>
>
> Does this Ack add any value?
>
> Acked-by is meaningful only when it is given by someone who
> maintains the relevant area or has established a reputation.
>
> $ git grep "Neal Gompa"
> $ git shortlog -n -s | grep "Neal Gompa"
>      2 Neal Gompa
>
> His Ack feels more like "I like it" rather than a qualified endorsement.
>

I am going to be one of the primary consumers of this code as the
Fedora Asahi kernel maintainer and have been driving Rust enablement
in the Fedora Linux kernel (and eventually the RHEL kernel). I have
tested and looked over the patches from that lens.

While I might not be well-known here, I am known by the Rust for
Linux folks, as well as the filesystem folks (since those are the main
places I tend to frequent). I am also a member of the Asahi Linux team.

I've been engaging with the Linux kernel community directly in some
fashion for nearly a decade. Unfortunately, most of that isn't in the
form of commits directly to the Linux kernel, though.




--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
