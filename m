Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A39B1AB528
	for <asahi@lists.linux.dev>; Wed, 28 Aug 2024 21:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724881847; cv=none; b=kSLIH33tt0WAhQMKIgbVgfLwJjzTIJ3h54RmuV13WQcwN7XoRtCb92PgENXMGGsYkY7X2/5n+3aJVcwxQHnrnx1WJVRAHDJJfqyfvtS0YyK2F/VyKg6TQEuvk1Nntf539VltL4Ag6GzVwU3JbDRFKvtcWDkCmYHXaDftFiBsqHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724881847; c=relaxed/simple;
	bh=GkRq0ivoQpAiOEzaTGohkuRwvXQipTcElCzKrbs2YGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJfWTyAiq8gqcSfULqn1uNBuu1xeW4KpLVwCEXZNU44UUYa8La/YW27EEITgdkBtLPXyv3UYfQwO9AhchyKJpgIMBvxWH2TC/WRZoRF2rsGPgvICP8tkp9rGHDwSFGraOCt5RdiKCmZgpqKhXDAmNQvi8VrXNa8/F6+dEApV/Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aJq+o9rL; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aJq+o9rL"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20260346ca1so68875ad.0
        for <asahi@lists.linux.dev>; Wed, 28 Aug 2024 14:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724881845; x=1725486645; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kOlS11zZF40IO+TxYPwBjtED80hWVLwZdESib8W/thQ=;
        b=aJq+o9rLNIxhrZ74Wi5XFeaNmM4MXB5fJa5f9rVhHYGVgFiIila8aOQmi8d4RF3hNf
         pAA+N1QRFA5+O+wwQiisuLO7kJ2CrnEUO588fm7W+XvVbyI9xEL5Rp9ijwfQDl8ufvSx
         B/7jD5oNIG2/zBCB2Jbc4T/xUP5zmY2U5ItHhaeJF5O42uIppP9E0ARjHDZSEW7/2lFH
         m3gZ4MvO3O4jvrRi45uqqhihXNOUMZc1fD7pXDJGw5R9Fe1ro4QY3qfhW0VBZL4ae59d
         co1yRRUofd01Oaq6E3uQxT8EUtluMW7HXoxPz8GqjdpNdmBfHJwQC60jGoyWt1esdHmS
         sQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724881845; x=1725486645;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kOlS11zZF40IO+TxYPwBjtED80hWVLwZdESib8W/thQ=;
        b=cYuVtoFR8rOwvS1CiGPkZpb15mRyFeIh00Ti1xMNF+HdoFOLGlejqKbL8d5sbVfUoi
         drEp7F7OP5WTmBLyrUX+65TWeMloHAWhiSnRS0Kuj7KFxj3tL7PjxPIFRscqYSBxgvex
         WQyM2bVJcztbVCNheYTTZ/sIhuuOx6u+e9csqUrD3SdhW2QD1RRxje6wAzPVaqVfo67p
         sFaq8qoOvl0DGOobealJbqpYImACgVlEgKo01pjG0rHv7s1b1znLxScnT1y7dlkfI1jX
         xFOin9FHGGaDaWhJmZdKPf3r0JmUqiT1y0oMXfH6MlYW9cYHLc6Bs8xnpfo09rowSUff
         g5fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtMVdUu2kh6D2TaPLRbdX2PGA89MBBnh9AnGlCkd8NnnTf7p362rqPffhjQwD/di5bpAJ1Og==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaOca5IYy3FUmQuvtdQekRety5XV8bEpvELSlKNK9NbxWj/HeV
	q5qJW55v2Z6cpJUUDNsX5GcnSka9jF4zcocKpz6ZhQskk9X/zAV7aUaOcBijow==
X-Google-Smtp-Source: AGHT+IH/W+fSipeqZ/wEzg8zzpJwjeYTFTuLFrl+gU3PBb15jaA3+7EFtkDmAEa/AEzYRe+ZhMBTqQ==
X-Received: by 2002:a17:903:1d0:b0:201:dc7b:a882 with SMTP id d9443c01a7336-2050d23634emr950865ad.26.1724881845281;
        Wed, 28 Aug 2024 14:50:45 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d844602748sm2481590a91.16.2024.08.28.14.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 14:50:44 -0700 (PDT)
Date: Wed, 28 Aug 2024 21:50:40 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 02/19] gendwarfksyms: Add symbol list handling
Message-ID: <20240828215040.GC2130480@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-23-samitolvanen@google.com>
 <CAK7LNAS=8uU-FUpVqh-z-=7LOfXxYcDQExKLvB+6qe8Fdq_51Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAS=8uU-FUpVqh-z-=7LOfXxYcDQExKLvB+6qe8Fdq_51Q@mail.gmail.com>

On Thu, Aug 29, 2024 at 03:16:21AM +0900, Masahiro Yamada wrote:
> On Fri, Aug 16, 2024 at 2:39 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> > @@ -105,6 +105,8 @@ int main(int argc, const char **argv)
> >         if (parse_options(argc, argv) < 0)
> >                 return usage();
> >
> > +       check(symbol_read_exports(stdin));
> 
> 
> 
> symbol_read_exports() is only called from main().
> 
> Do you need to make symbol_read_exports() return
> the error code all the way back to the main()
> function?
> 
> Personally, I'd like to make the program bail out as early as
> possible if there is no point in continuing running.

That's a valid point. The current error handling prints out a short
trace of exactly where something failed as the error propagates
through the call stack, but bailing out after printing the first
error is probably informative enough. I'll look into cleaning this
up.

> See also this patchset.
> 
> https://lore.kernel.org/linux-kbuild/20240812124858.2107328-1-masahiroy@kernel.org/T/#m5c0f795b57588a2c313cd2cc6e24ac95169fd225

Thanks for the link. In general I prefer to print out an error to
indicate what went wrong, but I suppose memory allocation errors
should be rare enough that it's not necessary. I'll switch to these
in the next version.

> > +int symbol_read_exports(FILE *file)
> > +{
> > +       struct symbol *sym;
> > +       char *line = NULL;
> > +       char *name = NULL;
> > +       size_t size = 0;
> > +       int nsym = 0;
> > +
> > +       while (getline(&line, &size, file) > 0) {
> > +               if (sscanf(line, "%ms\n", &name) != 1) {
> > +                       error("malformed input line: %s", line);
> > +                       return -1;
> > +               }
> > +
> > +               free(line);
> > +               line = NULL;
> > +
> > +               if (is_exported(name))
> > +                       continue; /* Ignore duplicates */
> > +
> > +               sym = malloc(sizeof(struct symbol));
> > +               if (!sym) {
> > +                       error("malloc failed");
> > +                       return -1;
> > +               }
> > +
> > +               sym->name = name;
> > +               name = NULL;
> 
> Is this necessary?

Here, no, but in Petr's cleaned up version it is again necessary, so
you'll see this in v3 still.

Sami
