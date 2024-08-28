Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81781A4F33
	for <asahi@lists.linux.dev>; Wed, 28 Aug 2024 21:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724882204; cv=none; b=ZHm8r4h9eyY/wNwV2lP7BIkHz8krBeDfP0lbhKBFS9KP6Fn5h8vevud9ycN6jjJVWwqaK+qn7A/PACuGTCm1mQcML7ZQC/hczYLmDhaDqIfs2wL423DMnNFDAhiwNr1mISurlqMj6G1C3CNXrPtNz1o3bfRKWMy3kadc4kvmAHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724882204; c=relaxed/simple;
	bh=PID4ATgIcRdlwJUDpahwj8UfLb1Vr51kkg4K6Y9E+zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfSaVnZOicPGCY/TDCFLIXJn7wxXPG/Ffs6WcZ7/ggMITkUo6gExw1Kfq0R9ZMLohpTYaOXrj34nVO8P958IPRWmobIHYaPQuiXGBEGKw7xNtsl94Gtzhksg3V2Cdl1JSXwtpigp39+anmNOZNWpNid72fh7I73R2zhnVNl3lNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zmfc/LdJ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zmfc/LdJ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-201fed75b38so28205ad.1
        for <asahi@lists.linux.dev>; Wed, 28 Aug 2024 14:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724882202; x=1725487002; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oMJtTqWHyENpXYFshc0NGQIcxCOjJlWKHxL6Pc51Vp8=;
        b=zmfc/LdJHqUWWE+Qs0mlzoGvMrWMsQjct434NkTPfZaWdKvPz8FhI8krStFyS16NkN
         rc2n/13j/dAr9ntFzxAepDK9PmVkP8JQ+KDcw3o9qNoKHjWWUuicqfA7+tdVPsbePpiJ
         PYiZv+0Bvuc4iSCJpMD0wTE/8SOYuti5s0eewnq6non21zgcLFxaFKbfl4kIPco35Z5D
         FdtDedhL90ITnz4zDYyu1GnH958XuKA13yJwLSBZbcJTJWzsbyFQAQfrwgD5sbK88eA6
         VHHIdomnq3tF3K75a+OI97ksJpRf0TJExrooK7o/khczOhzhAM1Y1wjms/dxIQKGCGvZ
         3aKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882202; x=1725487002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMJtTqWHyENpXYFshc0NGQIcxCOjJlWKHxL6Pc51Vp8=;
        b=pvlhguOmQDZGc61B4YSH4O0Qsv4Bep7AobC2Buv8EnR8mSnRvE/yGhmrSeOaGgKt6h
         b1Eh+AhFGh6p8Npju1Nx1aIDiIXzExhXcUkxX2rLRiDRbKc2dL28kusfcgFzz9viC07F
         QTmYXHnkT0EUwxQye/+kwLmClCVGJ5jARxZoAEXZM2qaV7khpOoDS5B+es2OYu9cT23W
         KmRC/yxNUwx0oUFb5GcEMv1APM2WJ9bE0DipLeN5JntljvqeeSj4FaeL/2en34VTBQX+
         OdZAdmoZexl1jDPl+dHRLldU9YBAClEY6Dru6wKiWEdTA2ST29v5cD8NpMW+oLBNv3Le
         56QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyj7SxIirIDu3LVBkhCtD/qGJbHTrD5Ku0lKcMEQsyAg2KzWW8T4uDmA8IXb0iexJ+EyMxmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu2WykFrPYTBRb2R0nr6Ki8FcZNHVM4AmiYJXAZH5FOgdDBZZZ
	2+oNE3NRrS611cYKDAxgPrHLlb9G4qwhKliUegfHQoIgSk2RSVRSTcU+7A8EgQ==
X-Google-Smtp-Source: AGHT+IFWsFfpSmAomvEtt5G6mILaLDEaIo62yZwexT1w7z/fqh1GYiNgxkqAWApkzmvRxk0nVu7qtg==
X-Received: by 2002:a17:903:187:b0:1f7:1c96:d2e8 with SMTP id d9443c01a7336-2050d1999a0mr965815ad.10.1724882201781;
        Wed, 28 Aug 2024 14:56:41 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445f9602sm2484968a91.14.2024.08.28.14.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 14:56:40 -0700 (PDT)
Date: Wed, 28 Aug 2024 21:56:37 +0000
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
Subject: Re: [PATCH v2 03/19] gendwarfksyms: Add address matching
Message-ID: <20240828215637.GD2130480@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-24-samitolvanen@google.com>
 <CAK7LNASAzsgmkWGOU7WWuBMmzG4vPRDQLjyW4sW+q46QZT=vnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASAzsgmkWGOU7WWuBMmzG4vPRDQLjyW4sW+q46QZT=vnQ@mail.gmail.com>

On Thu, Aug 29, 2024 at 03:22:25AM +0900, Masahiro Yamada wrote:
> On Fri, Aug 16, 2024 at 2:39 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >  int symbol_read_exports(FILE *file)
> > @@ -57,13 +93,14 @@ int symbol_read_exports(FILE *file)
> >                 if (is_exported(name))
> >                         continue; /* Ignore duplicates */
> >
> > -               sym = malloc(sizeof(struct symbol));
> > +               sym = calloc(1, sizeof(struct symbol));
> 
> 
> 
> I am tired of noise changes when reviewing this patch set.
> 
> 
> 2/19 added malloc(), which is immediately replaced with calloc() by 3/19.

This was changed to calloc because the structure now has a new field
that should be zero-initialized, but I do agree, this could have
just been a calloc from the beginning. I'll change this in the next
version.

I did try to make sure there wouldn't be too much churn in the series,
but clearly I've missed a few places. Hopefully there's nothing
equally egregious in the later patches!

Sami
