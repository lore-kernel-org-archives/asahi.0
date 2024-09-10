Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D45E1A4F3F
	for <asahi@lists.linux.dev>; Tue, 10 Sep 2024 21:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726002992; cv=none; b=ZXDiHMiCm9UJmgGrOueukRBfiPp/agnytH8occlKWv2UPzmgtNZTSSIz2r+XLTodTOYm9LcaqZuIm5TuzkLmnesoOS7MCv3xvYaGfLPDXt09pEbnO14FMktkPtmD/NzGY++6pQHvsQR6imMX1LVCHFtNvvU4o3MWYgtwM6A1Klc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726002992; c=relaxed/simple;
	bh=wFJuViaiJdOUX1o0VuO7DPs78bj+nqTGTP1Bs491x5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iAdGfpthMGWLrjglWOm2Jqf9avOmCsX1jfuDrpRRrBxpMrFxnbqENnn/+zu6YIVAL3pFU3yNgtUcworVj+EGui1icus+jzW5yhF4HNEjI0T6hfxX86wZEbZkt1chJvyLz5JWu6eAsmd1YCs8Yi1MJcS+wXSxGS5wA/oYBD/xWn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ftpNBVyB; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ftpNBVyB"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-207349fa3d7so258975ad.1
        for <asahi@lists.linux.dev>; Tue, 10 Sep 2024 14:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726002990; x=1726607790; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQ+GpSXTU6srlPmzzRuOFiYRCInXkHTjNZjLXMTW+8A=;
        b=ftpNBVyBMcFyUFOGvZA47xnZBXKMjNiQlxQxlczstx749rSgsbDOve21hmCUCXcuB2
         qtprUte4PHbc+55dR//bwPq2QXZbpTovgwRYJPBPTkzNtf40mzfyrJMuLqxC0h0StTTH
         THWe/rM1QnmnU5bHIWzvhayG1ofWhunGX36xlDvcMo3hndm5dhfXdGhpDx9pCSPT35CS
         9+Bnt2U8gE0gQkiI8N1O7KqkbJn5Ui2t+dpRtecZRGFq3ZVkVClTnONbVdsQVLNeDjXC
         sXII8wuS1wAHKqybuq0stVUYuu/LmoNVzKVnToLgN3zSHRX/B4F1uCMD8k7IzxZe2gpC
         Wb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726002990; x=1726607790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQ+GpSXTU6srlPmzzRuOFiYRCInXkHTjNZjLXMTW+8A=;
        b=HJeqxLV9LT8rdxjUS0U6PF7wzFDNNIlgfhJh1lF/MWaEA62Hd7Y2tK+V9/L1XGIpDc
         NwsmXecewNF4dbiEM5F6X1JH7F90YIVJpPIWEpfRCTpmh6UimZDgl759x8fM3FMHVVyp
         mvRauJrBVEXnNlPr8rRifmEgS8gFPCOC1rS0mTi8gYH0790G1eQOKVuNUSznWuydiJrZ
         97H7eMIzwNXAad07AfllQfssvC9Aze0fZinFVMw+tg79zDb+2+ZqtuQwTloVXEbYNysx
         Wy2HkRET3ftwSU5tsUE2rxugoXYaGBGZSyuVfdc7KpWbXuLbr7p7d1fH7SjZN6Qai/Nh
         VIPw==
X-Forwarded-Encrypted: i=1; AJvYcCVLw6lPJ8MYt1/bPr97tn4y1eSJnOCUsYAZslt7bd1h+bQxWxRgrQ03/Azaslz2G16Hr8cYBg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo0vWf9NXptS3GgGtGQesVpnrOMxjpydfyZutwRzMplyq6LvV9
	V5B29tWkPa4j8acJIYjG5z6+NDvpKoQob+TPbWyx6lup65UTeT3s73e95WPHe8L2VebNfi35qsp
	oHO5Ih0NGfAfTg5rYmvuhnVqJlvup/9Xl5E2o
X-Google-Smtp-Source: AGHT+IEX/psll2dog+nO241fC0V6++ypLFoAuwx9543jGrSb2GAYEQZkZHBT20PjPwI2C62EMdksu+R58p4s5QutSWg=
X-Received: by 2002:a17:903:2444:b0:201:e2db:7be3 with SMTP id
 d9443c01a7336-207570ea766mr216155ad.21.1726002989611; Tue, 10 Sep 2024
 14:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-34-samitolvanen@google.com> <ac7f8644-453a-4156-b357-ba266a7a0ca6@suse.com>
In-Reply-To: <ac7f8644-453a-4156-b357-ba266a7a0ca6@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 10 Sep 2024 14:15:50 -0700
Message-ID: <CABCJKufmgJOouD3KytBf8dv5KnNensJvw_7gNP8hygn98GtWDA@mail.gmail.com>
Subject: Re: [PATCH v2 13/19] gendwarfksyms: Add symtypes output
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

On Tue, Sep 10, 2024 at 7:58=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 8/15/24 19:39, Sami Tolvanen wrote:
> > @@ -122,6 +135,16 @@ int main(int argc, const char **argv)
> >
> >       check(symbol_read_exports(stdin));
> >
> > +     if (symtypes_file) {
> > +             symfile =3D fopen(symtypes_file, "w+");
>
> The file is sufficient to open only for writing.

True, I'll drop the +.

> > +     if (symfile)
> > +             fclose(symfile);
> > +
> >       return 0;
> >  }
>
> The fclose() call should be wrapped in check() to catch a situation when
> flushing the stream potentially failed.

Ack.

> > +/* See dwarf.c:is_declaration */
> > +#define SYMBOL_DECLONLY_PREFIX "__gendwarfksyms_declonly_"
> > +#define SYMBOL_DECLONLY_PREFIX_LEN (sizeof(SYMBOL_DECLONLY_PREFIX) - 1=
)
>
> Nit: These defines should go into the patch 15/19 "gendwarfksyms: Add
> support for declaration-only data structures".

Yeah, I noticed these too. Will fix in the next version.

> > +struct type_expansion {
> > +     char *name;
> > +     struct type_list *expanded;
> > +     struct type_list *last;
> > +     size_t len;
> > +     struct hlist_node hash;
> > +};
>
> I found the manipulation of type_expansion.expanded and
> type_expansion.last somewhat strange.
>
> The list starts already with one element in type_expansion_init(). This
> is apparently to make the last pointer valid. This element is however
> empty and gets only assigned on the first call to type_list_append().
> Other elements are then added normally, always assigned.
>
> Perhaps consider using a regular list implementation, similarly to what
> was discussed under the patch 06/19 "gendwarfksyms: Add a cache for
> processed DIEs".

Agreed, I'll switch this to a regular list in v3.

> > +     /* Wrap names with spaces in single quotes */
> > +     if (strstr(cache->fqn, " ")) {
> > +             format =3D "%c#'%s'";
> > +             len +=3D 2;
> > +     } else {
> > +             format =3D "%c#%s";
> > +     }
> > +
> > +     name =3D malloc(len);
> > +     if (!name) {
> > +             error("malloc failed");
> > +             return NULL;
> > +     }
> > +
> > +     if (snprintf(name, len, format, prefix, cache->fqn) >=3D len) {
> > +             error("snprintf failed for '%s' (length %zu)", cache->fqn=
,
> > +                   len);
> > +             free(name);
> > +             return NULL;
> > +     }
>
> This could be quite simplified:
>
> const char *quote =3D strstr(cache->fqn, " ") !=3D NULL ? "'" : "";
> if (asprintf(&name, "%c#%s%s%s", prefix, quote, cache->fqn, quote) < 0)
>         [...]

Good point, I'll change this too. Thanks for taking a look!

Sami
