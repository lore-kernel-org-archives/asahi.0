Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6218E1AD3FD
	for <asahi@lists.linux.dev>; Wed, 28 Aug 2024 23:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724886567; cv=none; b=I+4pxv+EFhiRL8ncUII569/EeCBzWwywQ2pCLTfX28jH9iafm6gi28U54WDFMKJopIpKqbjY9ke5J1880xoMZwzA344bt2ksy9SphDEuRY5bfxWGeq+cMBuz6upIDiZYvjr3Pg6em5MDOL/Gfj8Xx/x+Qk6DzDyVd5WOl9PrpQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724886567; c=relaxed/simple;
	bh=RZmcXzwnrRhYwDoAQj1Jxhe7OhhEeGVabMOYn+OKJEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VobjL12NP4IMWtnaMJ6lsr6d4nBY4OU8nX4wXQZcDGVp2TUlYLpK1/awvn9CBuB6TvNsuPoi//BRkTSiaZc5qKwfTyeiTxJwO1+EBqZ0WduU69Zc7mhgBnOdxN1zksal7VB4ZMYlUGgVyZToS8PDWMbh21EUyEsOE5p4vIIhOkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LLbBjJqa; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LLbBjJqa"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-201fed75b38so38685ad.1
        for <asahi@lists.linux.dev>; Wed, 28 Aug 2024 16:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724886565; x=1725491365; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bF9tb8hwDYR6xa7gB1x7sZNbhUYJUgSYOVOAb5zjrCw=;
        b=LLbBjJqaNEY5w2+nud1hKQq7dlHmQrMvHLim2Kxtd0MYwioDH20ZvnYqoEcqJhvhL9
         9AU2RurycW2URUp5uXp2FuVdC/17idJZLybaKe7UWbOfTBHB48i/QxngJPWpDwVlHQ8x
         juA+GsMY8DYhqNvB/oCrJznriUi5Exe0+ImIboQMsStv7bgnuJqYNvLU4NAwgtaOHeuR
         7xopSJtp8vm5KFvny6nE1ENbqUVfmyYTd3kzQWn5nfCZXWzDdYkTW7FrPaCds0ZW96HU
         8ozeBAxcFF73lh/iHxS+kLrkkyKGI5Upr9MncPrtq8ahrHk5Y5Pk8Z4ycKPbM53gZP0P
         29XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724886565; x=1725491365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF9tb8hwDYR6xa7gB1x7sZNbhUYJUgSYOVOAb5zjrCw=;
        b=NEOqItM/nK8D5+3stV6UexFE7quEjaSv0IWbWafla8XPjWSkF0BgQDAawEMW2w1JQu
         i+1negY29t1cM9Juk/Z3vO3O6uq3qcYM+MpgEAOJYJiAHG67zegBvmZLmiXFqjw7+7VV
         LfXSBIs4C0GM09oOuvMJHpxjKubx/Lwi+5lQcrIKWPzyU3OeMPNkmbOavJol5j4F7KPG
         ox+d+F7FuaOVZyUModkDwick9B+vYOtp1YrmPZe+06NQYEYoxsps1JPePlVkT3m9pyIF
         Fh6iScOZP+ygQ/vMqgUZ8Y2R7Ht4rZhUhR4rSZkph2Zc/inqCnWmxsQq9rHZB6QKtiUi
         J5Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVw4vqeCB2szyno2GfcFQX+dmDU0+u3kq7723p4nOjormfbCyOum+CfXMmEdcdiv7Mos3MnUw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1KsWHK5TtLLsRiNnSOgcQOmYJDJbYqrj/+ern6gQkhlmLEVHC
	5iutd3BtDO89+IJzVZrzDqUfxCWU78g3AczHpV4HtzaJuY4UhOj0K6Y3DpFvZw==
X-Google-Smtp-Source: AGHT+IGefsWlldxzVDyfJdh6ODHqSR4DIkOY4bryKmhorJbglzA63HVpwHsAO+Qawqv6PlgLxud4xg==
X-Received: by 2002:a17:902:ce8a:b0:200:7d11:e8e3 with SMTP id d9443c01a7336-2050d1f0c57mr1140385ad.14.1724886564314;
        Wed, 28 Aug 2024 16:09:24 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a5b56sm5350b3a.57.2024.08.28.16.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 16:09:23 -0700 (PDT)
Date: Wed, 28 Aug 2024 23:09:19 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 02/19] gendwarfksyms: Add symbol list handling
Message-ID: <20240828230919.GI2130480@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-23-samitolvanen@google.com>
 <95db3178-a2ce-421e-8024-afd7fa3359a3@suse.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95db3178-a2ce-421e-8024-afd7fa3359a3@suse.com>

On Wed, Aug 28, 2024 at 02:35:29PM +0200, Petr Pavlu wrote:
> On 8/15/24 19:39, Sami Tolvanen wrote:
> > diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> > index 65a29d0bd8f4..71cfab0553da 100644
> > --- a/scripts/gendwarfksyms/dwarf.c
> > +++ b/scripts/gendwarfksyms/dwarf.c
> > @@ -5,6 +5,48 @@
> > [...]
> > +
> > +static bool is_export_symbol(struct state *state, Dwarf_Die *die)
> > +{
> > +	Dwarf_Die *source = die;
> > +	Dwarf_Die origin;
> > +
> > +	state->sym = NULL;
> > +
> > +	/* If the DIE has an abstract origin, use it for type information. */
> > +	if (get_ref_die_attr(die, DW_AT_abstract_origin, &origin))
> > +		source = &origin;
> > +
> > +	state->sym = symbol_get(get_name(die));
> > +
> > +	/* Look up using the origin name if there are no matches. */
> > +	if (!state->sym && source != die)
> > +		state->sym = symbol_get(get_name(source));
> > +
> > +	state->die = *source;
> > +	return !!state->sym;
> > +}
> 
> Sorry, I don't want to comment much on function names.. but I realized
> the name of is_export_symbol() isn't really great. The "is_" prefix
> strongly indicates that it is only a query function, yet it changes the
> state. It makes its caller process_exported_symbols() hard to understand
> on the first read.

I see your point. How would you make this more obvious? get_ doesn't
seem entirely accurate either. match_ perhaps?

Sami
