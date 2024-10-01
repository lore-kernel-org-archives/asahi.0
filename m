Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561671C7B83
	for <asahi@lists.linux.dev>; Tue,  1 Oct 2024 20:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727813934; cv=none; b=trfj+adZV2f+s04y2zJIfvslHecFxF6y0zp1XRMhg5r9saA2CxGGqeppsKOEd/yTLT69DPavbz5J76RiyoErGkhPVjVgD+73ydc110wUzSCKnImz6ElpNZJoUuH9Eai71klND3v2VIpjrIXhIWcd1l50L8i8vdhPkMIEnyokhhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727813934; c=relaxed/simple;
	bh=RyRRva46Au0EaG06flnXvPQqiLcxe9w3qwxQucSjMPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K6Y2PsVBJs63Y+9iXZPhzRb1F/OF5MMtGYwxQr5fxbJ051lnYy306bLHPJPiICzGphSV/TrlirpdM3e3S7YYy4HyVdsM5tAcxCDPDnQ2TVwUtawfjX+KDzIejV3QTBAcYfIZPiIum8oAwb44HhWPVSJLFa53vz85b1MpQMCkytU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JjKB0E3Z; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JjKB0E3Z"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4582fa01090so69981cf.0
        for <asahi@lists.linux.dev>; Tue, 01 Oct 2024 13:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727813932; x=1728418732; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/GuuFkapqTR185OUWCoLZGw0BcekQwTFJers3DxjmY=;
        b=JjKB0E3ZWh165FDufZKBMCLjuZfI78lxzjb3e6eqkQ4Yi++FWs1eMPIHsLSDoRAErE
         uVragd/jwGXlFcfqdO5dJY8I+TjktT/NXavAPRiB5VcJYgIHXKOeTZxv3bx7fugIlgl/
         LlGulJDfMjrDonIxUzdz1Hjdbt07GxsRt8FMq5ut/zYS2W25Cl7jw9DzkgYuW6LARUbN
         t+je1UUdKgVKf8xectvDNgwaHg2Fk4K/pszfu8n0Vj/cJZxL30eNbmb7Po4w/KkCzP7i
         Ur3WoNRsZ5JMW65fuzcONQZ7T99tulXLfju1Xfytc0Erb8Gj5ch1v2KBlCM5AgrH2JB0
         CSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727813932; x=1728418732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/GuuFkapqTR185OUWCoLZGw0BcekQwTFJers3DxjmY=;
        b=bvknf9XywetAskcAX95Ckt74LD/Lh3oWKgtLCAUxGIxQbCbPRZYgDS4+41mBy9bamk
         +/SHICqkwcZv4SPSwqVJJh6uPIu3aVFrKFLBjKIaAef9gi208j0ZG1h0GduA8PeqoBy+
         iAX2TDf5tFErYJGiC57uWzXNGQZtzfPjnJcGB3cCV1iAhDNNidIQh9VgNHv9jbWF4nbW
         H5+O2zq9g1FS7KwaSi7C5Sp2EOPEUJWoHmVFZlYZWvzlMTimfooUUODJNXa2ftGL1058
         S2EeQNS1cp9GVgMSCqY7VTHkOgZcvZ2k5jAFs+3QuBwiu5dep4s+hLksxlyXNiknIydh
         CvQA==
X-Forwarded-Encrypted: i=1; AJvYcCXxBw9u5uQXC8DiYm66hb0JaOLCLaqcv+AjGQ2blmrDAmQgvalQ0vNGXyM/q6riMS9bdor3cQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCr+TvDSkZKBKkNYl07aYcHm1+oWI1zO+FDZP1wJZGuuff7Y7h
	kRHekAhTpxBsmGD8jvI253oWr3c8xW9asgl5mFsHF7QzbihL5uEdWiGqzIf3gPR8QFe7X+bDoQi
	btSp2GgtcMowywLMXvXAKyMsGdrc0lRC9C0Dl
X-Google-Smtp-Source: AGHT+IGgt6P2UjzCfEsFRuOsqPPi1mqlprj6DD1mDyXiUt6hrKmTWvB7O34383hQFNSzxcqc9hke5vvwb8pZ2vx7XYc=
X-Received: by 2002:a05:622a:8612:b0:453:5b5a:e77c with SMTP id
 d75a77b69052e-45d81709cf4mr770761cf.10.1727813932030; Tue, 01 Oct 2024
 13:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
 <20240923181846.549877-28-samitolvanen@google.com> <a71e018b-1dc6-4427-8f10-399d8a9a5243@suse.com>
In-Reply-To: <a71e018b-1dc6-4427-8f10-399d8a9a5243@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 1 Oct 2024 20:18:15 +0000
Message-ID: <CABCJKuf4G0=XjOkagTBah+u6V7ZxbY9qdGYdqX__45bE0SeN8Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] gendwarfksyms: Add a cache for processed DIEs
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 2:10=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wro=
te:
>
> On 9/23/24 20:18, Sami Tolvanen wrote:
> > +static void update_fqn(struct die *cache, Dwarf_Die *die)
> > +{
> > +     if (!cache->fqn)
> > +             cache->fqn =3D get_fqn(die) ?: "";
> > +}
>
> When is update_fqn() called with cache->fqn being already non-NULL?

In patch 16, because we need the name before process_fqn() is called,
and if we end up outputting the name after that, cache->fqn is already
non-NULL.

> In general, I find handling of cache->fqn slightly confusing, mostly
> because the member has three states: NULL initially,
> a statically-allocated empty string if the DIE doesn't have a name and
> a dynamically-allocated non-zero-length string otherwise.
>
> I wonder if it would be possible to reduce it to two states: NULL
> initially and when the DIE doesn't have a name, or a regular string.

I also thought about it, but using an empty string to represent an
unnamed DIE and NULL to represent an uninitialized value seemed the
most reasonable option.

> > +static inline const char *die_state_name(enum die_state state)
> > +{
> > +     switch (state) {
> > +     default:
> > +     CASE_CONST_TO_STR(DIE_INCOMPLETE)
> > +     CASE_CONST_TO_STR(DIE_COMPLETE)
> > +     }
>
> Nit: I suggest to move the default case out of the switch statement:
>
>         switch (state) {
>         CASE_CONST_TO_STR(DIE_INCOMPLETE)
>         CASE_CONST_TO_STR(DIE_COMPLETE)
>         }
>         error("unexpected die_state: %d", state);
>
> This way, if someone adds a new value in die_state and forgets to handle
> it in die_state_name(), they get a compiler warning.. or a runtime error
> later.

Sure, I'll change this.

Sami
