Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB16A1D1E79
	for <asahi@lists.linux.dev>; Fri, 11 Oct 2024 22:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728685389; cv=none; b=MPpzJUJ/TmW0kyjUuQg5L9YeiiwLGdSxlbHmzH6Mc+pDo4UhLFjOp+1saVFvPhlX/O+50Hvjb7K6BDvspukwOslVTXWvztARIqu/0hB8HdZ/bvyZO10X3t/uf0j3c1rx1hqWxfIpCgyzVKvyf33Jqxjx8N2TrJ1fBwQDuLSMccQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728685389; c=relaxed/simple;
	bh=CJDIZt9SDia3kRARDeq0N7pRKkAvIEdL1EhtcEH4zWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=defc3FefnvBBHw6eCXwCwVq265MlHZIkDV6743AMVYG3VNX4eTbhVDhsTYC/XMG/YXmO6KfNjz3l3FsEE/ceyrB9fmTmA2pmTgT2tR6d7nMU4d2vIzmR4eivh71BAofpnjw6isIvfug9x7kr5qtN3N3pZEmjwkndvB/+TOsYK7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e+LUEabR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e+LUEabR"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e66ba398so3401e87.0
        for <asahi@lists.linux.dev>; Fri, 11 Oct 2024 15:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728685386; x=1729290186; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maYFMKfM6boFdhGm6DtqmLZWBbLTCgX3HfNDs5UmCQU=;
        b=e+LUEabRELUi1o9Aexw2Z/+dMePxJtc3NEqn1mIgyfmtmUjdM70bn7hG80IkbMipf9
         F26zIai8iz0Rxf2X9QJT5/9M2r0UnFYN8WUcqV6GWI9iCCSJQVFVwj5OdGB/aKy/i1T5
         8CTtaJvtAnkuU5hhI+zLfiqIzNeRdRNMuSctFEs7rqDLntTmwgr4/yr1tQBVtXN03F+m
         54LzS4l2UShp1JefDrtXgoPKwu8K78eZVujtbu1O+nYfTi1aU75rwxGwdFBmDPlTYsNU
         1bEVV+LUgNhkavqVwyuCyct+cZjtK/d0gIQqHpybDoWeknaAk0In7X8gsHfv3dy7Rd9p
         wspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728685386; x=1729290186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maYFMKfM6boFdhGm6DtqmLZWBbLTCgX3HfNDs5UmCQU=;
        b=hn4G+vTvMaez44rZHuh4TMtLndx55P3vEXq3yvUoJNS/aCYONPngJIf7Y+VFPkX/c2
         qbj1w7pA3SpIYfNMLo87nAognTQ8HBPXiVBaqg/H910+rP+KU44pou0GnqQmxpyWd6U2
         XOwYSJl/ybIdLl9s593sD/mowSZLe5HfUyumz4iRGrTAdbKmrQMAp3rU1pFqgC+Xw6bf
         joECdqKu+boQAGb4NAvLXmz5dxUC4GaCa/BELuMQpUP+q3uA4AElumTlVRZT+pevd8Te
         hUTD/Y5P22nZstMfzw5cEvF/ivqt/LnQzhAy1Vq8/0/Qp62o7+HFzxqt1lUgOeOW3I78
         HA3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpP3n/AfTdVkorHlAY957T2daeVZ/23Zfv3tYSrP6rYQYD9mfVsqDNPVeSCNiKh0btiUK97w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjonh0CMCogywJcZd5Mowcc8f6DqnLeBkq4hhrM1+FMP8wGZg3
	OHGNeczL6TCRpymVgcuDIBCpwlgozCkAd+9BbDpqEUeLtsTXW7S6YmuXOg9p+4n4yhdz4sukeEg
	V00dCpitl+EmTNSRT5j+0qiVNzZJSCxUbw6G+
X-Google-Smtp-Source: AGHT+IGr43daPZ49/lS60D7/4sgtSi5WXLqig+kBuBxaN2sMmsSkjjoy3oJWvbRMgwV3mVJzY8wJBYqH4iO+1rac7CY=
X-Received: by 2002:a05:6512:3d05:b0:533:49ab:780e with SMTP id
 2adb3069b0e04-539e5f0a2a4mr148247e87.2.1728685385873; Fri, 11 Oct 2024
 15:23:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com> <20240925233854.90072-14-mmaurer@google.com>
 <Zwmi-MEVE_E4nkzl@bombadil.infradead.org>
In-Reply-To: <Zwmi-MEVE_E4nkzl@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 11 Oct 2024 15:22:54 -0700
Message-ID: <CAGSQo03H=O5id=bdRorHmRLNzGM9njcRradQUvjpngk3sXfViw@mail.gmail.com>
Subject: Re: [PATCH v5 13/16] export_report: Rehabilitate script
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, Alex Gaynor <alex.gaynor@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	linux-modules@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 3:13=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> On Wed, Sep 25, 2024 at 11:38:28PM +0000, Matthew Maurer wrote:
> > * modules.order has .o files when in a build dir, support this
>
> The commit log is not clear, is it that it's always had *.o files, and
> you're adding them now, why? Why is the .ko search now removed?

The script was broken when I found it, but it was a script that
analyzed MODVERSIONS, so I tried to ensure it would still work with my
changes. This necessitated rehabilitating it first. I did not touch
`.modules.order` files, but they contained `.o` and so this script
wouldn't run correctly.

>
> > * .mod.c source layout has changed,
>
> When, why did this change not happen at that time?

It was changed for readability [1] back in 2019. I assume the change
did not happen at that time because this script is rarely run. If we'd
prefer to discard this patch and ignore the script instead (or remove
it?), that's fine.

[1]: https://lore.kernel.org/all/20190909113423.2289-2-yamada.masahiro@soci=
onext.com/

>
> > update regexes to match
>
> Why did this not break anything before ? Is this fixing something, or
> is it prep work?
>
> > * Add a stage 3, to be more robust against additional .mod.c content
>
> Future .mod.c changes?

The rest of this series adds additional `.mod.c` content to support
the string names. This stage 3 is intended to prevent that from
causing the script to choke.

>
>   Luis
