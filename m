Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B321A08C0
	for <asahi@lists.linux.dev>; Wed, 28 Aug 2024 22:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724883564; cv=none; b=X1x08hI698Z5Wq/27h/wi+Kp4g8mEeiO7JjTakcFQyuuY4Sn3n/0aVtoTDLE2TslI3Qw+tOlvDl/udMRpFNNJWTKCD58eCnvy4up8NqHeOpx1T+q+KC1R5ANZosi90C4i7lG5V6yaBJisGc+hK4GaeXz6/7J0t9RIlBuXuVZ1r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724883564; c=relaxed/simple;
	bh=G0cbini76O7/ZHNrLwHGmXDcm4O4bH6OGrwCSMUuIWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoW1P1K+7QMCZ7wrFoX14cYpGDBoYqFK1x77vu1Ni0k5FIeEAXu7BXjPDy7mHvnr4nbWVmVM7dtS61SZqyhz58yOKLd8RTYcJlgtDw2gDa3QoRdZYj0II5hW39nhHWhyoHbWaIhNoPhl6m8L0orzHJHzCbGOm9awmx/ZTRnYy+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VB/4J65N; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VB/4J65N"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-202018541afso31495ad.1
        for <asahi@lists.linux.dev>; Wed, 28 Aug 2024 15:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724883563; x=1725488363; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UATx3qyhtRIMlpWJXb2/u6ihrZGsial6qHPPVJHPjTk=;
        b=VB/4J65NxvK8kXk4DMrS+cgZqfoyvadem0BgE8pSrrZCz0zTfmz5ERjaITHI2SUjzW
         Bsj8Zwll8mJq9YdqFEMRAdZCfFpLyyLKVwyIfzXkT6mtXZEIsLO3fJQCVrr2DhtWb4Os
         8iJ9ZvaEZBsMtjZFt+HmOETwwy9CU3DoCRGAZ5k5k8MjcN5HHDAyh8rouMbPjirPU0Kr
         02N/eNp7X+tFE9coBzAFJbHzQYnjkCCkX4XjOOFDvptlkkeqJRBvmSvsZonEYhiv3FUP
         CZxHet8RLf4RyGbPHyWICxYJq/MnhOUphnbtxxUsP2FjrWfRKWPtRDn5Jjh4Jw6rXjUL
         XWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724883563; x=1725488363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UATx3qyhtRIMlpWJXb2/u6ihrZGsial6qHPPVJHPjTk=;
        b=Ab+/sWNbS6SjBkhJxYvwFjLE5AzdX/QTsgWS63gR7qZwh3oPL8+XNWu5Py4isECUNC
         SO24bpbAoaoUG2NF2GTaYv0KU6576NwhR+dcUm4cG3+tz7banwrPz5z3gseQRpiWGA1P
         YQtdX8b5egyuzkDk0b8pxJLl1TYwcA8qApXvnFqN8IM54memdQgauF2pf1vpObhWd62f
         JheUaBeZzyKi3RQuqdDymvrGX56cKml5dEpezyNQY32SpbMnXmHCekPSbAQkwt4X5Il1
         0NODX6TdA/rNsvu83Vm0Knkz++ouTYZ2JCo5v4j5J1iUFqFepSHeQQxB3OfR1hggnOYl
         uBgw==
X-Forwarded-Encrypted: i=1; AJvYcCX9YL4mpKjGrNTmxlwTy71vRZzhMWFhk+2v5lUFnfCikwlQkzSdY8csRrataJHyEzURFSMDQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBMSUzovde9JjH3rUDIIWl9PLrDEu/1Uh2jjEJeAjikEKG02Rr
	jgVsMleeyo+BL9FzetYHR2Elk8vRa36jcD83QXmqrf2IEHFacS8sS3/jqLAyxA==
X-Google-Smtp-Source: AGHT+IEI/yiKkuTOXDYkfKDkA+6/kHl9UL9XvWD754F+DO7KJmsGY1NptaRQNoNDHY+hiQv7NdJOEg==
X-Received: by 2002:a17:902:e849:b0:1e0:c571:d652 with SMTP id d9443c01a7336-20510a7f2e1mr425515ad.1.1724883562507;
        Wed, 28 Aug 2024 15:19:22 -0700 (PDT)
Received: from google.com (83.92.168.34.bc.googleusercontent.com. [34.168.92.83])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342e0a10sm10594254b3a.108.2024.08.28.15.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 15:19:21 -0700 (PDT)
Date: Wed, 28 Aug 2024 22:19:18 +0000
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
Subject: Re: [PATCH v2 05/19] gendwarfksyms: Expand base_type
Message-ID: <20240828221918.GF2130480@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-26-samitolvanen@google.com>
 <742f7226-9c66-4cfb-ba31-222dfb54fc34@suse.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <742f7226-9c66-4cfb-ba31-222dfb54fc34@suse.com>

On Wed, Aug 28, 2024 at 02:46:03PM +0200, Petr Pavlu wrote:
> > +static int process_fmt(struct state *state, const char *fmt, ...)
> 
> Nit: The state parameter is unused by a number of these process_*()
> functions, including the leaf process(). I suggest removing it so it
> doesn't need to be passed around unnecessarily.

Good point, I'll clean this up.

> > +	char buf[MAX_FMT_BUFFER_SIZE];
> > +	va_list args;
> > +	int res;
> > +
> > +	va_start(args, fmt);
> > +
> > +	res = checkp(vsnprintf(buf, sizeof(buf), fmt, args));
> > +	if (res >= MAX_FMT_BUFFER_SIZE - 1) {
> 
> This check looks off by one, though on the safe side:
> res >= sizeof(buf)

True, I'll fix this too.

> > +		if (dwarf_tag(&scopes[i]) == DW_TAG_compile_unit)
> > +			continue;
> > +
> > +		name = get_name(&scopes[i]);
> > +		name = name ?: "<unnamed>";
> > +		check(process(state, name));
> > +		if (i > 0)
> > +			check(process(state, "::"));
> 
> Failed check(process()) calls here return immediately and so would leak
> scopes. However, I see this is fixed in the following patch
> "gendwarfksyms: Add a cache for processed DIEs" so it's ok.

Yeah, I noticed this as well. I think Masahiro's suggestion to just
exit immediately on errors cleans up this situation a bit.

Sami
