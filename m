Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59922146590
	for <asahi@lists.linux.dev>; Tue, 27 Aug 2024 18:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724784513; cv=none; b=b1zPdoBhQdveK3F3ncDe/VQSdQ7Jg+m6PbsDxsrFV5V+MIJIuVr/aHKqE9Ige38DsOFLf1MQD3mQDEZomqhausKevHwUSZKTY1SMLgUhEBSpoR8lqQRbTLuJFVDf7cF+ZVqPlD4alK/pP7nmiEXAuvu45hZvXijoujd2r4k/kmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724784513; c=relaxed/simple;
	bh=I5//Ha3NSD2Wtl/0jjx0iRpYd7vI5TxmgjMPfRVQ1/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3gsNmX9qA0a+dByQSJ/gyNmvv/CwLYNXdtRYwyb8BpGKYmgHSTbX3Pq+blbOIM4olZ6X4VcpORBBPeUIyi1+mJkUHqSAnX4pmVne/oYEPYtRvCf0T38QGzzAdWG0tq40/u6J+2nnTr8wkGWNq29lH4C58BB0cUCOPcx5BdNsJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lo7jg1PM; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lo7jg1PM"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-45029af1408so39161cf.1
        for <asahi@lists.linux.dev>; Tue, 27 Aug 2024 11:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724784510; x=1725389310; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LidQY3N7TAVU7mz++A4EWJV/Qlk2ObRsexeEqCJH/sQ=;
        b=Lo7jg1PM+uwID8ZSq1bo3WYyG0QwBvWG9y7klA+5t6K7jedf7jO4V/lMXrrKG7e00t
         5QQjhk+dhjlhgXUso1tnQg3dLmAnb2Rk0AQyS9d2BqoIWOjmvBRRsjY/HHKPJKMyKHHb
         +pt13NJcMEaPQrBWSmWgOi1/+9m0YHED9fEj8nitbNdk3UJiKQTsVYN4szxwret7J6Q/
         dqmjBa6DN5M9OkRFzhtCRWwfLUugmyH0cclZ7A8qFVnMghr5ih//7Y1hiabG34Y0Qwdp
         YHf+rw8/LKkE9xJ5TZgXiPieA/UoE9NjPmx7nt05LA2ZtAgKiwwKb0tnhwuyHtRGLnN1
         rEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724784510; x=1725389310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LidQY3N7TAVU7mz++A4EWJV/Qlk2ObRsexeEqCJH/sQ=;
        b=P4K25gkQorIQWqU7U8A8xpvY7snx1Msq/03YAQukLBjtf+NgVk8PRTufLIElAMGLtF
         yWp/5H0rgWayXPwV/lUO0vzcvjT8gZi9UltphLocn/wds9hgi1CGTsUGEbRZ46EF1Z4e
         9F9CLjml2Wyb1XdD+WeteJUINuAXpB8WnlmGBpDoQ1eDLYF4y/yRcHJzua2ZrtWK/lRs
         LyTsoD4TR6vxqDVgtzE8uCh9PRlsO+GKs3/gIp84VRHegZYdYzx0mSxiBVbXu2l/8l3L
         wBYlhYKSL0bYMAr0RgpblEcfiTp5h9fiyYOpFLjkyyvCTf477KTQ4XfDK49OLBt7GgTK
         ghbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSc2HZRW2uRy7loHtZJ8xD0lA1tV7QfYg81vgrldEfOtj1pQE1nRLSWJK3fwVvHjQluH5XZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhhO/147dG2SySAxLnQW/gHAIy+5Q0KqSgJ+LTIDla7Ht2skUo
	nze2GdrWcbZyhLraLqBdeahT2c622/cbW1cTKT7XvrkSkKlLaz85U+ysxjQR/qnpEdBJV6ThiFJ
	VtGnDTaErdOyWmzddaAjUYPBJ8c/T01cEgvwv
X-Google-Smtp-Source: AGHT+IEYo3wpUDQ07W+N/9n1FFu7R6YCMxlFn855GpjF2BmicavhNUlzTFwLoKagN05qtS/bFGVksEONLKfLBTPt0T8=
X-Received: by 2002:ac8:5a45:0:b0:453:5b18:817 with SMTP id
 d75a77b69052e-4566caed6c1mr336721cf.6.1724784509942; Tue, 27 Aug 2024
 11:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-23-samitolvanen@google.com> <f9ad5fdd-25d4-4d98-84d0-84dfba2a75f2@suse.com>
In-Reply-To: <f9ad5fdd-25d4-4d98-84d0-84dfba2a75f2@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 27 Aug 2024 11:47:51 -0700
Message-ID: <CABCJKuc8fOmsbpqOJXwYstwc+7DEf-Bf26_n5_ai2Pax1tXqUg@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] gendwarfksyms: Add symbol list handling
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Tue, Aug 27, 2024 at 2:16=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 8/15/24 19:39, Sami Tolvanen wrote:
> > +static bool is_export_symbol(struct state *state, Dwarf_Die *die)
> > +{
> > +     Dwarf_Die *source =3D die;
> > +     Dwarf_Die origin;
> > +
> > +     state->sym =3D NULL;
>
> Nit: This assignment isn't strictly necessary, the value is overwritten
> a few lines below and isn't used in between.

True, I think this was left over from refactoring.

> > +int symbol_read_exports(FILE *file)
> > +{
> > +     struct symbol *sym;
> > +     char *line =3D NULL;
> > +     char *name =3D NULL;
> > +     size_t size =3D 0;
> > +     int nsym =3D 0;
> > +
> > +     while (getline(&line, &size, file) > 0) {
> > +             if (sscanf(line, "%ms\n", &name) !=3D 1) {
> > +                     error("malformed input line: %s", line);
> > +                     return -1;
> > +             }
> > +
> > +             free(line);
> > +             line =3D NULL;
> > +
> > +             if (is_exported(name))
> > +                     continue; /* Ignore duplicates */
> > +
> > +             sym =3D malloc(sizeof(struct symbol));
> > +             if (!sym) {
> > +                     error("malloc failed");
> > +                     return -1;
> > +             }
> > +
> > +             sym->name =3D name;
> > +             name =3D NULL;
> > +
> > +             hash_add(symbol_names, &sym->name_hash, name_hash(sym->na=
me));
> > +             ++nsym;
> > +
> > +             debug("%s", sym->name);
> > +     }
> > +
> > +     if (line)
> > +             free(line);
>
> The loop leaks line on a potential sscanf() error and name if the symbol
> is a duplicate or malloc(sizeof(struct symbol)) fails. Additionally, it
> should be possible to avoid allocating line by getline() on each
> iteration.
>
> I would change it to something like this (not tested):

Good points, I'll change this to your suggested version (after testing). Th=
anks!

Sami
