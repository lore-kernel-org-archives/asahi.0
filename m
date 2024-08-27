Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4501993AF
	for <asahi@lists.linux.dev>; Tue, 27 Aug 2024 21:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724794164; cv=none; b=mU8iA0YTANUyOu875C2WTDMFSi695mEyMdtBodrTvZBgD3j6/RamhU58avdibq0Wo0UkWC92oMSTACGiDuMpzeTEiM8izrRHdSd+ibiIEvwwTxevLl1yoXm7J20hnnNjabgHZRu5Bpj9VcX/FkI2ka4KpNPMPYw5Zv26WZJSi5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724794164; c=relaxed/simple;
	bh=R4HLYZ+UViFtWMxsFQtEArNLC47KC7MUZLfJAYG+8L4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rW4SC153e6kE8+C8m0WhiTnuka9c8Wj2wyPmUwefD5uBnFS5u+Wj+QpTAxPUC/j7bEXYd4QOuCQ3kK1oLgrofrxQi1Ofl3ewc4aAxxXG5njBN6NA9+B1KEhRiAqQlBBUbom5+S0fnvZDvh0RNzFkStjcNjx8T+VPwHxUgvWBH0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aa2iTnBK; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aa2iTnBK"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-454b1e08393so93521cf.0
        for <asahi@lists.linux.dev>; Tue, 27 Aug 2024 14:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724794162; x=1725398962; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTy0kGwiDI5gZsttd0+HgzSva3UgwhiIE4UArdRmSDM=;
        b=aa2iTnBKlu6OP2hIOX0VPsu2imyhpWiSAztcnGMm4LEq6zH7c7R0mG6QY/S4aSr5iJ
         rEh9/4aE0/KMQpXcejk8xLoaM0OGW6EyXUbe+wrn+GgksbOwuwl3dWIrTDS9LXeSk274
         T5NHqGEwAclCRezu10y2XxBqHo+3jY0bWEEGv07ufW92FhZJUMYt/eHg87CgFenyW1E3
         t5ge86KhJh2+aKf7nvx32/GkOd5zFF6spZIQBRRZLyg5swRF46Q2K86P2ZXO9SxD1uCf
         zGiPwWLxuMDUkaPbgnqxWZKPLxQv1ht6i5SoOMlOp8NFaHhEuoozgZjO5lM0y9ati2QK
         txEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724794162; x=1725398962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTy0kGwiDI5gZsttd0+HgzSva3UgwhiIE4UArdRmSDM=;
        b=iU69FrVA78/r1wWVU21iDouOoGlX95Bl1M3EOYfX2RZyJna6mmmCZTGPXxmSxv6Am3
         g8FomkWdA+iZn68qyqGvMLIqIua0phwOC6ZLfLAx8blcZf8BKuE5tUWD7CYp8zHS1O7D
         JIlVjreB6QYeew2SlAcj0MaQsCDlGT9X3cNt5qx6uPtggW+T2pDB+jlsbIypLpwfKaQr
         6XAmIz3lTjcMW+xUSjAB+LKC5Df1a8dAxwR7fkYGd3jiGIUma71SvEr1Qcos6BLyZ62W
         LBEqEcgjQDIx0UFpHSQgTYlL9Y0A//nY/Q592H3yRQnBM7l6+9B94ssn3ZzR7jXzz0q/
         MY6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVle+70m5arJewHb/NPD0AXdxqdCG7GFBeIJcWfnr1xzMJhmkKjlTNH7lWlRWznR1dADKvdmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpiG9w2Nu0GuklgqKBpajvJRwWxB6+q0AQBIctXEbgbNkRRQLW
	qejs46DLd4vd2gg5m6rv74nvV5rTUT2wQW5hq5VPuEk9tubrSmYoYu/WKf6zWoZMjA83D72Fkc6
	0z8V+ApwhXYE1e1wZcc8mxhu1Fmk8nxUuI/Ze
X-Google-Smtp-Source: AGHT+IESYT6ErEPekdnM4JPG1QAmj//Y4YNR4GKOjrbinkZvJAz7qCJ6vDkOQJqXUvV1BbfJh1Ad0J1bwqMfl5vfrVg=
X-Received: by 2002:a05:622a:2cc:b0:44f:9e0f:bc41 with SMTP id
 d75a77b69052e-4566e2c44a8mr191491cf.27.1724794161723; Tue, 27 Aug 2024
 14:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-24-samitolvanen@google.com> <d63ddefe-a6f6-4a5b-9330-11438fca8f9f@suse.com>
In-Reply-To: <d63ddefe-a6f6-4a5b-9330-11438fca8f9f@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 27 Aug 2024 21:28:42 +0000
Message-ID: <CABCJKud2za5o19O4XuE-jxuevwQLZPd+CdoB5tMHCgtG2Q2upQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/19] gendwarfksyms: Add address matching
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Tue, Aug 27, 2024 at 12:40=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> w=
rote:
>
> On 8/15/24 19:39, Sami Tolvanen wrote:
> > +static inline u32 symbol_addr_hash(const struct symbol_addr *addr)
> > +{
> > +     return jhash(addr, sizeof(struct symbol_addr), 0);
>
> I would be careful and avoid including the padding between
> symbol_addr.section and symbol_addr.address in the hash calculation.

Good catch. I'll fix this in the next version.

> > +static int elf_for_each_symbol(int fd, elf_symbol_callback_t func, voi=
d *arg)
> > +{
> > +     size_t sym_size;
> > +     GElf_Shdr shdr_mem;
> > +     GElf_Shdr *shdr;
> > +     Elf_Data *xndx_data =3D NULL;
> > +     Elf_Scn *scn;
> > +     Elf *elf;
> > +
> > +     if (elf_version(EV_CURRENT) !=3D EV_CURRENT) {
> > +             error("elf_version failed: %s", elf_errmsg(-1));
> > +             return -1;
> > +     }
> > +
> > +     elf =3D elf_begin(fd, ELF_C_READ_MMAP, NULL);
> > +     if (!elf) {
> > +             error("elf_begin failed: %s", elf_errmsg(-1));
> > +             return -1;
> > +     }
> > +
> > +     sym_size =3D gelf_getclass(elf) =3D=3D ELFCLASS32 ? sizeof(Elf32_=
Sym) :
> > +                                                   sizeof(Elf64_Sym);
> > +
> > +     scn =3D elf_nextscn(elf, NULL);
> > +
> > +     while (scn) {
> > +             shdr =3D gelf_getshdr(scn, &shdr_mem);
> > +
> > +             if (shdr && shdr->sh_type =3D=3D SHT_SYMTAB_SHNDX) {
> > +                     xndx_data =3D elf_getdata(scn, NULL);
> > +                     break;
> > +             }
> > +
> > +             scn =3D elf_nextscn(elf, scn);
> > +     }
> > +
> > +     scn =3D elf_nextscn(elf, NULL);
> > +
> > +     while (scn) {
> > +             shdr =3D gelf_getshdr(scn, &shdr_mem);
> > +
> > +             if (shdr && shdr->sh_type =3D=3D SHT_SYMTAB) {
> > +                     Elf_Data *data =3D elf_getdata(scn, NULL);
> > +                     unsigned int nsyms =3D data->d_size / sym_size;
>
> I think strictly speaking this should be:
> size_t nsyms =3D shdr->sh_size / shdr->sh_entsize;
> .. and the code could check that shdr->sh_entsize is same as what
> gelf_fsize(elf, ELF_T_SYM, 1, EV_CURRENT) returns.

Sure, I can change this. I'm not sure if there's a situation where the
current calculation wouldn't result in the exact same result though.

> > +                     unsigned int n;
> > +
> > +                     for (n =3D 0; n < nsyms; ++n) {
>
> The first symbol in the symbol table is always undefined, the loop can
> start from 1.

Ack.

> Alternatively, since elf_for_each_symbol() ends up in the entire series
> being used only with process_symbol() which skips symbols with the local
> binding, the function could be renamed to elf_for_each_global_symbol()
> and start the loop from shdr->sh_info.

Patch 15 ("Add support for declaration-only data structures") actually
also needs to process local symbols, so we can't skip them completely.

Sami
