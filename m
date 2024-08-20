Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD227E59A
	for <asahi@lists.linux.dev>; Tue, 20 Aug 2024 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724172521; cv=none; b=NToXdkyNobPrDchq4KM8oUs6Wv19BHmDRqxFE4aDxnjwGzr+xgriIVBB66MGmfFk8VExAIQIz5XMCNQ/S1M/2wpMY+5MytbvmXuIywZ7dUzxLQUjKKtyfrQHUEv2c9jKa0Ja0UWl6UikCkrxx25QuVSWAZwZgKK8UpO+czALwN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724172521; c=relaxed/simple;
	bh=EY7+jZCbx24zTHEy7TR1y6tkMTvVj0EfuR/scZNnLSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tsuZMY8EUz8QsDhfa1y2/iNR9BVS/vRAjj/Yg1u88JsUgIywR8AE6ROJfbiqkQh5FJUg8bX3WLnXbNM1x6fKe5HZr2m7UX34a7172tx+0Zr/q/alEi0k7GG4TmBymPFCNxqF5TjwY6GSlJ+HPKr76Ub8gpfFr3aHV+H0DNjy5+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VU7a7cCs; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VU7a7cCs"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53345dcd377so684461e87.2
        for <asahi@lists.linux.dev>; Tue, 20 Aug 2024 09:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724172517; x=1724777317; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EY7+jZCbx24zTHEy7TR1y6tkMTvVj0EfuR/scZNnLSg=;
        b=VU7a7cCs2LJWDTP3kTbK3lo6xcGxh5dLx2vwUlPEIWLFF2rZu68yHTEk3l3MmoPzSz
         OBYXXAVR11QmLlPIBrjvFBZLP/BI2bxPHf5Wo5voAn8w7VSWL3HHpLWKktYeO//SCMxf
         3+WrYxgpReA+Tv8T7Nl8CCLNgeoWQ5zWjoRpj+zJydVWT01IAEmulO9UGuqE94oAaHMz
         X9hGv2IGv1TNl4BgN5ymqsYCo4m3eU/OR5K5s9JoOa2y5BZqJbjovaXAhtexVjg3sPpb
         LjqmRntkCZExxOd+iQBEMLq8Nn33JOLOrFJg7sI4N+8EgmZ9lNVDZyUOMa/IWTe8Uo+q
         lT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724172517; x=1724777317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EY7+jZCbx24zTHEy7TR1y6tkMTvVj0EfuR/scZNnLSg=;
        b=kSic2iJwPP1AnP0nTQZxvyRf6bd7Z+IyWtVl0nWXYjVpos9H6ypRT0PYhkCEn7idJc
         g0+ol6JvBskFZMz1aDwoXKii7OHv7wdyVvjsY113f2mc4v4VVokylf+l5mxpYSTQfJNF
         eqE1uOjTsZYixAmw2LlYiXtVn/cG2rNmHB5Vte6Ja2k/77fLQ9UgVx848Rqycl9jC2SY
         iZDheZ8HJhsv7cXyKZXxOoxrVrk3rPGYvkFlQwkL6FgB0Yk4mOhoe0qub8Yp/Ud/m3m9
         i1TtfwGHoTCZvbzgSs9NttmyLEgEZ67dWNJF8c0d7iEUNgzqCbdOaaNsB4YJu4qiWtRY
         s0ag==
X-Forwarded-Encrypted: i=1; AJvYcCUcG9qH/OnmMiheosuHx5ug856hYjbvcy6XY8WUhxMwSpTGbn7Om140OxscKOB43XBnlAhzg37xUpb1cplZr2k0s22NJlw=
X-Gm-Message-State: AOJu0Yx0k+Qz5PAOffVfLzUjnExMJ6ege3ArkBpEu37HCF8urypdCd5y
	oizsfS0z41oE4Y0+gF9JENcUPkxpGdSF+HJs2qFWxht1ROtYGlr3buRqr9Y8l5nXgVUAHU38BQv
	8fGON4/jZsvvi+szSNnYheSq8oPk=
X-Google-Smtp-Source: AGHT+IFP/T4v4jfCI8OdiHlqJ69vXMH35zvQmtaQtvJe/OTYFWS5FVNj32ofA3JgQ1DnrYOe3Qw30HzTtKuWghcguSs=
X-Received: by 2002:a05:6512:6cd:b0:52b:bf8e:ffea with SMTP id
 2adb3069b0e04-5331c6dc867mr9778925e87.40.1724172516553; Tue, 20 Aug 2024
 09:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEg-Je8=t_cXKsWL0XSx3vF1gsArSWpychfbEf+yjM6wVz3Mjw@mail.gmail.com>
In-Reply-To: <CAEg-Je8=t_cXKsWL0XSx3vF1gsArSWpychfbEf+yjM6wVz3Mjw@mail.gmail.com>
From: Matthew Maurer <matthew.r.maurer@gmail.com>
Date: Tue, 20 Aug 2024 09:48:24 -0700
Message-ID: <CAM22NNBrXSUbrpFAKv8jrREKTBYx_aW0cibtDE5AZ_kTijUrPA@mail.gmail.com>
Subject: Re: Weird failure with bpftool when building 6.11-rc4 with clang+rust+lto
To: Neal Gompa <ngompa@fedoraproject.org>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, bpf@vger.kernel.org, 
	"Justin M. Forbes" <jforbes@fedoraproject.org>, Davide Cavalca <dcavalca@fedoraproject.org>, 
	Janne Grunau <jannau@fedoraproject.org>, Hector Martin <marcan@fedoraproject.org>, 
	Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry that this isn't a solution, but I can tell you some background:

Linux currently relies on the `--lang_exclude` flag to `pahole` to
filter Rust debugging information out of the output BTF. This is done
because various downstream tools (for example, bpftool) do not handle
Rust types correctly. The `--lang_exclude` flag works by checking the
language flag on the compilation unit the type is referenced in. Once
LTO is enabled however, things can migrate from one compilation unit
to another, leading to C code having Rust code and types referenced
inside them. The resulting type will be considered C-language type by
`pahole`, but is actually a Rust type. Even if you fixed bpftool,
without additional patches/hacks, once the kernel boots it would
likely fail to parse its own BTF debugging information, and disable
BPF loading.

The most confusing part to me here is that I only encountered this
issue with x-lang LTO enabled, which is not available in the kernel
you're building from. If this is happening without x-lang LTO enabled,
it likely means that there's another way for debug symbols to leak
across CUs during LTO. That's where I'd start looking - use `pahole`
to dump the contents of `vmlinux.o` and see if you can find a
C-language CU referencing a Rust type. Then, try to figure out how
that's possible. With x-lang LTO it was obvious, inlining caused a
bunch of issues.

The last possibility I can think of is that somehow in your build
configuration `pahole` is not being invoked with the `--lang_exclude`
flag when building `vmlinux`. I don't know why that would be, but it
might be worth double checking.

On Tue, Aug 20, 2024 at 5:13=E2=80=AFAM Neal Gompa <ngompa@fedoraproject.or=
g> wrote:
>
> Hey all,
>
> While working on enabling Rust in the Fedora kernel[1], we've managed
> to get the setup almost completely working, but we have a build
> failure with the clang+lto build variant[2][3].
>
> Based on the build failure log[4][5], it looks like there's some
> random mixing of Rust inside of C code or something of the sort (which
> obviously would be invalid).
>
> Can someone help with this?
>
> Thanks in advance and best regards,
>
> [1]: https://gitlab.com/cki-project/kernel-ark/-/merge_requests/3295
> [2]: https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/index.html?p=
refix=3Dtrusted-artifacts/1419488480/build_x86_64/7618803903/artifacts/
> [3]: https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/index.html?p=
refix=3Dtrusted-artifacts/1419488480/build_aarch64/7618803917/artifacts/
> [4]: https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/trusted-arti=
facts/1419488480/build_x86_64/7618803903/artifacts/build-failure.log
> [5]: https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/trusted-arti=
facts/1419488480/build_aarch64/7618803917/artifacts/build-failure.log
>
>
> --
> Neal Gompa (FAS: ngompa)
>
