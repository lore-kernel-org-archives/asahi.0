Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19F71A3BD0
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 23:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307765; cv=none; b=XvXp+4kw4QruE4jjWeXCgSiRj/1YrtW2wxrynSR5lALo5A2wA7M9zyFnmvEEZqB4/I9Z+9B9hALMLti/PpFArlkkzHYY5IhcbJUsWBS1TajXWod5lFWAfhaoZyx1JDuH45oa3mVPlJPAEkaPLUh9O0NTjCxk8S1vLiNhGiZVXMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307765; c=relaxed/simple;
	bh=cwCCg7cjlmVJH30GDf9Cwg6fhR2bbuS17MaqIuOSV0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lHLBnq3J7sc6UQ/o1FWVaQa/jBOkS/nsKj+XoigniCmrZw+gU+vGG5S8j0HTZPyE7RRsO93s+25IK4zAFSNoUp8ccpEGL9YZirKbFgQY+0Nqep7FvQSsr6RSJv4n91/iONj0KAJLX0i94flvW/9VjHX3Rxl+Bh7KPFRnzMPbsUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WpMGRemn; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WpMGRemn"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c247dd0899so5397a12.1
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 16:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307762; x=1727912562; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek54duFW07igKvK9AQGJRlqEiTdehADtLtBpPhw2agE=;
        b=WpMGRemndaJ0JxoF90MZmgJgeoD345bs7nP/cbrR+gb4lQySelkqYDOvaNGzLK0g6d
         FKQiptIVPZQoxYolUbsqQq1E1h9V/Z9sQuphJsl9jeJE0CXmivTHsdIt28nAOlPmqLBU
         Q/2ugOH7z5+dkTsW5vaG7avC+0C252z4cj16mH2gboX1QEQOiFUNjo5jq9zG+FIZcWdI
         +L8k1ohnC2pIRqrXFuGCiEji23kJXYW0DqN0icERkUx/anq86wviicOKaJe3z0ulTiKJ
         A7PsqNshYATvrB2lhuUoXXW16HBPiOJEyawUI3uv5aClkK4+b90kmrMgT6jbbFT2XrgP
         s2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307762; x=1727912562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ek54duFW07igKvK9AQGJRlqEiTdehADtLtBpPhw2agE=;
        b=eg05I3NvQ4PglhLtzoPWVcpVZsRSIrQkaYsBFiiMBOJn8K1gHD6bdHdMpeBChIa4jG
         fDNYw0XAlkPE4CG5EyoTU4YVTCbHR5/JHq8/QipaDrHdxBhRkaRlT3K4U2KY8Pgfl1pu
         TL1II1B/Y3Quze36e9l3yFFQ7N0Rdl4sS4iVzfazkzdR9nYGa4SLgfPPqSXbCOHikESs
         TFfiD5uvp80N37k7DERuyuc4MHq77s6LGWrasUqLXNF9GstCtx7a5wh4He1jqe1B2xAQ
         0DpFas5cSpUxCxDhOPP+AkEi6sJuHlXsYDN9zhKpplzshMsLUqoc5N/IYJyU9NbjEK0I
         wyMg==
X-Forwarded-Encrypted: i=1; AJvYcCVpPKS6SDCHu8NlxOKx7v6suba0kyEzCdeaoDmUi2dKjEYcU4pS8B0dcZok0oudsQTVRaFeVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlTamMd7b9FV+phoX09Qz/iDDjLEHMh5UEa/nVBdvvJuk8g75b
	z/0VE9Sf+xhtpj9z7AZmNn3M+90Uuj7Qmt3i0cbIl4YksvucMkzY1tA5G8RUmF/l4p47USfmWxe
	CAOShQ4Rkqzz8XpOTLO3zTe3UA0TVjfl9DprW
X-Google-Smtp-Source: AGHT+IEQLkFnBxCVmc+hBCfJCN9xgnB4wVQcVoqAWlHhf+GqjN1sdjtOkK/z88OGPV3GGtu/6kc0Wj3d2hT0sVNu66g=
X-Received: by 2002:a05:6402:524d:b0:5c2:5251:ba5c with SMTP id
 4fb4d7f45d1cf-5c8783c7d8fmr251259a12.0.1727307761901; Wed, 25 Sep 2024
 16:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com> <20240924212024.540574-15-mmaurer@google.com>
 <20240925230000.GA3176650@google.com>
In-Reply-To: <20240925230000.GA3176650@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 25 Sep 2024 16:42:30 -0700
Message-ID: <CAGSQo00OqOJ+s3xULXvojXMSCR8y-TQOHAwWqpS2VDxWaDxxQA@mail.gmail.com>
Subject: Re: [PATCH v4 14/16] modules: Support extended MODVERSIONS info
To: Sami Tolvanen <samitolvanen@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, 
	Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the catch. I've sent up v5 to include that fix. I've also
added a changelog and made sure the patches make it to linux-modules@
as Daniel suggested.


On Wed, Sep 25, 2024 at 4:00=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi Matt,
>
> On Tue, Sep 24, 2024 at 09:19:56PM +0000, Matthew Maurer wrote:
> > +static void dedotify_ext_version_names(char *str_seq, unsigned long si=
ze)
> > +{
> > +     unsigned long out =3D 0;
> > +     unsigned long in;
> > +     char last =3D '\0';
> > +
> > +     for (in =3D 0; in < size; in++) {
> > +             if (last =3D=3D '\0')
> > +                     /* Skip one leading dot */
> > +                     if (str_seq[in] =3D=3D '.')
> > +                             in++;
>
> Thanks for addressing Michael's comment, this looks correct to me.
>
> Nit: might be cleaner in a single if statement though:
>
>         /* Skip one leading dot */
>         if (last =3D=3D '\0' && str_seq[in] =3D=3D '.')
>                 in++;
>
> > +void modversion_ext_start(const struct load_info *info,
> > +                       struct modversion_info_ext *start)
> > +{
> > +     unsigned int crc_idx =3D info->index.vers_ext_crc;
> > +     unsigned int name_idx =3D info->index.vers_ext_name;
> > +     Elf_Shdr *sechdrs =3D info->sechdrs;
> > +
> > +     /*
> > +      * Both of these fields are needed for this to be useful
> > +      * Any future fields should be initialized to NULL if absent.
> > +      */
> > +     if ((crc_idx =3D=3D 0) || (name_idx =3D=3D 0))
> > +             start->remaining =3D 0;
> > +
> > +     start->crc =3D (const s32 *)sechdrs[crc_idx].sh_addr;
> > +     start->name =3D (const char *)sechdrs[name_idx].sh_addr;
> > +     start->remaining =3D sechdrs[crc_idx].sh_size / sizeof(*start->cr=
c);
> > +}
>
> This looks unchanged from v3, so I think my comment from there
> still applies:
>
> https://lore.kernel.org/lkml/CABCJKufJK0WO92wnW09VTLqZk0ODxhuKQG=3DHbKE-v=
a0urJU1Vg@mail.gmail.com/
>
> Sami
