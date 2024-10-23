Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAF71FAC59
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 21:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729718110; cv=none; b=fIt0sQWUDB1b3WqaF3Ig/it6WPi/FsOvZqel5fhWJ4ki456/bV9qG4bkCwrlKwhvhp/oxSSMDb/QMb7aY1b9v+4HgoPi6dcscBWpaH6Q9SYZmMeAb/mKaPrePtkPOOxzodzPVuLgadp/TEBgFCaPOUxsw0aOu4jO7yp6q7C3MvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729718110; c=relaxed/simple;
	bh=4ZP52DrOKx/INwLhclU+6dl4fO5N9uCgynBJoArxSTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t6U8a+M/Xxvt6sdgrvIdovF6fnRO6zq1CTSpDVmdjY1vtHPtVMYICAEJsrxaAJGUhmgITXZ40JbTUCWbfgOk1U2CerOmZr1xzEoROM2M/RysMoyDbGMxSAvb1qRgV+uxrSCMZUC5Xxxw+4w74/DbELUoy1TObjOrfCmpIhsX3Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZQCvit6U; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZQCvit6U"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43153c6f70aso17845e9.1
        for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 14:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729718107; x=1730322907; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfTzqdb1VSf8Gk5yizZmo+tj3CJXoQHkksQYnazcBsI=;
        b=ZQCvit6U5XHE0EDJc8kjaKZ1/A+4hzuKg7/pPDKp6hFNDWyhVZI7eRYSs4BFL9uk8E
         6VZoB7glAopz4mV24HbowcHbeyevekRJpEmjkYFtpo9ACmzmXgw0gi8Tr6Zb204YNhcU
         mlgp915Lhg5Rc/r8IsKY1lz+yivUjxV2GWBrqdmlfr2fTidLdJXtWC2CoRW2p99OXxPO
         siqTuGDsZVkC8j8xZb+5oU28/D0t3nOT3NvmZ5ElQ5y9rk/JbiLGmut9D2IVgXWoAzUY
         QN1lYNG3YNAeCoPc0N8jY5q2pM51NGAhNLqsHtR3s1y43CNcCTjpvbrHpyy5Q466mgwW
         tuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729718107; x=1730322907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfTzqdb1VSf8Gk5yizZmo+tj3CJXoQHkksQYnazcBsI=;
        b=SzmLkqLKVNJmimAc7mUrqr4Xd0zUi+ZqsDYgOhVHLtBcYhLRi0AbFaaUcBEpg2uhc4
         3dZyU+F/F6zAjMFzjEebWXCsOLgRknjAOeoK+KVGWB0KMPufi7wHkfu0Slo2wx+ARGJf
         /wgKAdLrwiW4HMSqaxjzEcRcomS2tiO1QM/GWViYv3eZLyRyK6h6S3KdMS8ZgZINxPWC
         vrEszGVEiqp7rSzYpO2cjnZQ89A4RDU8pX9nGzUVVrvN7CoUTt+SSV41J+koE5eHa2iJ
         jMVQJiDMFojxr9Kh8xDF9BoyNTOxEEeIHz8a6z2l2CWqa/aDbJAFNQkSuPZ7zwBfRYZ5
         TyYA==
X-Forwarded-Encrypted: i=1; AJvYcCV8KJd/3S3CvmsWkkkALZCPEz/cPgrabTXV+5o0O+FTdtX0ZUT+kKQUeuoVve1PkdULU5V4cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YybQJdsf3wfGb+Sf00SXmFkDDJ9SrEE0zwH9IrmBSHXAgkOEXY0
	MDmDy1GljqoeGqyfTiTCfE9z5miPzXDy95hnaC0JJaSOcfmBMx8dkc47uQZ8w/WHgDKIZtIFuzS
	5+kVAx9Rfa2IMiH/pgfI9xESNckK1tprVxhxL
X-Google-Smtp-Source: AGHT+IFqBJIw1NFCo41gy3+FTzGpIJM2Xgam9sFU+VbVhx4UVG5MiIzQo2Dnw0+91MIY4eDDcQSOrd12O2f8n7BVvB0=
X-Received: by 2002:a05:600c:3d86:b0:428:e6eb:1340 with SMTP id
 5b1f17b1804b1-4318a55bda2mr1281755e9.4.1729718106868; Wed, 23 Oct 2024
 14:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-39-samitolvanen@google.com> <8017c328-f039-46c3-b472-f203cd6e2cfe@suse.com>
In-Reply-To: <8017c328-f039-46c3-b472-f203cd6e2cfe@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 23 Oct 2024 21:14:30 +0000
Message-ID: <CABCJKueABoo8xVfE1JBZk-kw8cTK0h5ibOqo+hBEAgpfGSTgdg@mail.gmail.com>
Subject: Re: [PATCH v4 18/19] kbuild: Add gendwarfksyms as an alternative to genksyms
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

Hi,

On Wed, Oct 23, 2024 at 2:59=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 10/8/24 20:38, Sami Tolvanen wrote:
> > +gendwarfksyms :=3D scripts/gendwarfksyms/gendwarfksyms
> > +getexportsymbols =3D $(NM) $(1) | sed -n 's/.* __export_symbol_\(.*\)/=
$(2)/p'
> > +
> >  genksyms =3D scripts/genksyms/genksyms         \
> >       $(if $(1), -T $(2))                     \
> >       $(if $(KBUILD_PRESERVE), -p)            \
> >       -r $(or $(wildcard $(2:.symtypes=3D.symref)), /dev/null)
> >
> >  # These mirror gensymtypes_S and co below, keep them in synch.
> > +ifdef CONFIG_GENDWARFKSYMS
> > +symtypes_dep_c =3D $(obj)/%.o
> > +cmd_gensymtypes_c =3D $(if $(skip_gendwarfksyms),,                    =
 \
> > +     $(call getexportsymbols,$(2:.symtypes=3D.o),\1) |                =
 \
> > +     $(gendwarfksyms) $(2:.symtypes=3D.o) $(if $(1), --symtypes $(2)))
>
> Is it possible to pass options to gendwarfksyms that apply to the entire
> build, specifically, how can one say to use the --stable option? If not
> then I think it would be good to add something as
> KBUILD_GENDWARFKSYMS_STABLE (similar to KBUILD_PRESERVE), or maybe
> a generic GENDWARFKSYMSFLAGS?

Yeah, I left that as an exercise to the user in this version, but I
agree, adding a KBUILD_ flag seems reasonable.

Sami
