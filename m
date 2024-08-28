Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B781AD3E6
	for <asahi@lists.linux.dev>; Wed, 28 Aug 2024 21:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724882335; cv=none; b=hyY7g2+1O5nEBVsKyX+odWIn9TScgSJ59hRjqS/eGlG0CzmjCQFAu+dunq+1mSrwJE1POWNFlhiwDR7gcYP3RMUrnnylKcsY1JWMk1DUwGOIrPVO61ghQSFMOgPBm4OJqRo3/qbLxaAo9q11FXIHMHZ5f+SGZEqitlL+LJqRGbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724882335; c=relaxed/simple;
	bh=o+gAn/ilZ3C56975j8rPvUkgN8dfBSz6M6D5Wf/lSRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBxN1ftAuwI5VA+DJFwAHFhCR3VMg1kf1dKl4Ddc/f9WxJkdChDBEowCTXzTlPqill2KT3rbHszJPSWdg2l9AsPPsYrmijQokc/cZsr8nKL85Ci2fZfF8C8zvCO2Wyclo54Z1yiSFyrtzdAGXGsZqgNWKBYj29WhmEeYL1iDoa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wXX/li4W; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wXX/li4W"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-202018541afso27745ad.1
        for <asahi@lists.linux.dev>; Wed, 28 Aug 2024 14:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724882334; x=1725487134; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nnGSwXCYQc4Hwc+sfrpcLFkK6Wt2k6zs0AyOgifdXGg=;
        b=wXX/li4W7t1vAQi//HY0mmHeRHNZkFHXEmpa0SVqmXS9ZtfqfKI+y8u/giA6HFAqlq
         M4TQ5LAr4+1zOUjY7U7OTmuYcu+U7zoKeqQ6hnF2oVcAQ3AJoRDLGTQa3iprK7BI/bsL
         hDugsdMsgV4ohfqaoLRK2n16iZYnZvc/6oLMsYz1ViGbVljSsIPxdm24wjNRk/KoTbM+
         D1XfDjy9MRaKXM06cr67rQk5qLT9P9un9/gW9EQunhwb95jhgwxzY5myvsWbneJspjm3
         V/Rbjq4rCSUJ2NHYftOgob/HFu7gvfArLaUJP1GJZeLciZopJ+ES+09lX3nFzY+EjRN0
         fmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882334; x=1725487134;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nnGSwXCYQc4Hwc+sfrpcLFkK6Wt2k6zs0AyOgifdXGg=;
        b=YZVbmJD+3LVc/d9pT8Q7n6UIS7D6+QGtPeShIpchUuNn3FsYgG4L//DYtFbI0MffLr
         olrx20KczyReeCl+MhBwxFh/HkOOZ/2v0H0jU7R12zUldONyEyggF6iY873dVZSYR6oG
         JnVtDhrBWmK7ejpQDodHtMp4tka0fcKunXDZA7O61mmxiUhKKVU00v1sfeFLtDfiBef2
         GCTRFxkeXieYrrsZvtOTMIWfeHARxY4YNU4jd6o2zWF4S03bxptKLbDulvy3NKj4+Hmq
         jBEhpqcEKYOr5YsIlJfKV6+P1gIdmmZRDW8m7t0fuIBrEoYSrGfOqCzmPlOS6ZVNrj69
         L3pA==
X-Forwarded-Encrypted: i=1; AJvYcCWcZMFnZL+Bgpdqi9I87MpP5ugCX/NjRn3L7H+adKhxpuXXUKYaJi11ELYcP9infu35+Cug4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEDGSCSx0S8RBy1OM7/tB16pjtZ+GbzRIiLg6ty9/o1V4XOrvt
	vEgN7REEyG/ykrn01HWwXuLGCQOKDPcm6uF6jflVMeTITWov2bAKPgfK4lfqug==
X-Google-Smtp-Source: AGHT+IGVfzjHYyRASEld6yxxMpC9vJZBxYqjU0CXEpHxInbohWJsi3m/XdXyujxzXPDjs/QQJYYJow==
X-Received: by 2002:a17:903:604:b0:202:883:c0d with SMTP id d9443c01a7336-2050d2366demr1037415ad.24.1724882333453;
        Wed, 28 Aug 2024 14:58:53 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038560dfaesm103172195ad.223.2024.08.28.14.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 14:58:52 -0700 (PDT)
Date: Wed, 28 Aug 2024 21:58:48 +0000
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
Subject: Re: [PATCH v2 04/19] gendwarfksyms: Add support for type pointers
Message-ID: <20240828215848.GE2130480@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-25-samitolvanen@google.com>
 <CAK7LNATb8zbwEVgM+_=CaYSysov6YBMbKjy8+t8CrRA_72jxuQ@mail.gmail.com>
 <CAK7LNAQBO-VA8G9uumwH5m9idQofY1ZR+hnNfL7y4P3m16xFNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQBO-VA8G9uumwH5m9idQofY1ZR+hnNfL7y4P3m16xFNQ@mail.gmail.com>

On Wed, Aug 28, 2024 at 04:15:03PM +0900, Masahiro Yamada wrote:
> On Wed, Aug 28, 2024 at 3:50 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Fri, Aug 16, 2024 at 2:39 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> > >
> > > The compiler may choose not to emit type information in DWARF for
> > > external symbols. Clang, for example, does this for symbols not
> > > defined in the current TU.
> > >
> > > To provide a way to work around this issue, add support for
> > > __gendwarfksyms_ptr_<symbol> pointers that force the compiler to emit
> > > the necessary type information in DWARF also for the missing symbols.
> > >
> > > Example usage:
> > >
> > >   #define GENDWARFKSYMS_PTR(sym) \
> > >       static typeof(sym) *__gendwarfksyms_ptr_##sym __used  \
> > >           __section(".discard.gendwarfksyms") = &sym;
> > >
> > >   extern int external_symbol(void);
> > >   GENDWARFKSYMS_PTR(external_symbol);
> > >
> > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> >
> >
> >
> >
> > Commit ddb5cdbafaaad6b99d7007ae1740403124502d03
> > had a similar idea; it has a reference to each
> > export symbol, including the ones defined in different TUs,
> > but in assembly code.
> >
> > Didn't it suffice your need?
> >
> 
> 
> Presumably, this is an unfortunate duplication, but I do not have an
> idea to avoid it.
> 
> The symbol reference in assembly code works in *.S as well as *.c.
> 
> The C reference will pull-in the debug info, but it will not work in *.S

Correct. I'm not a huge fan of the extra reference either, but I don't
see a cleaner way to ensure we always have all the types in DWARF.

Sami
