Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0A81D5176
	for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745847225; cv=none; b=rYN+eOFuoxUBM89Nm2e2NNFGV3v6KEOAv+YwJyH+HJKlLFgGMudeOgF5IXMLidigR7+nuPo82IdjOzPeFKyA9SJIaXM/aPXuCCE5RrYBGkySjf6jN8vnj7cS8JDSg3BByVO1KwYq56XWH+ku8Q2LZ7LGwkBJJ92xOpNs8/lCozE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745847225; c=relaxed/simple;
	bh=gpUxEEVy3sIsimESLtWHg+JgdxY1t3rGmbuJEiKpzNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SrLo2L2K6j4u20ixw3fGIjyNxD8Lt6C3H+JBe+54uEPn07zl+S5wA6Xpfw5BYhmtvAQsn5Ny/UsLaf8nUST1kljSpm6mxlDw+ZbtDehPcwUqEdJ6nEgr7p4o2W4jRFlWy4IqxclXWWonM3CZYcTfQkKGWOn597CtvAmmLjl0BuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso88109426d6.2
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 06:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745847221; x=1746452021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0BEsm26/ULBWvXKeKH9l2FyVqKv47K9xZOm0eiyll4M=;
        b=Jf7TLHKpmIAXUjuaM+Fb3w/xFWl+uw2E3U5LWr1+BBGjJWLMl74mayEe6fWvS0aFuV
         dnqrlk4xnXE+YbEhVTKNfoTRHqT1QQkghAWF+VRhamqGTqxr3nC2i4WovJB6YQFvLD5R
         O5Sr2cGawhmVnp9NND6SVacaZdU8JYM9MZ2Ug+RuwSMWlSCrGPX6mqFlYdW2+wwwKa8o
         yQc5vzp375MteZ1XL38jjT/K/NRSPiAKo6WT6+KxZ/oaM+4idDTXSC4OXT/IeF2THexw
         jBMaBRWOotK3lDbpy7kz+8LxDFwOCtBvuayYNdZ21/mt9tIT4zVFyaKqRt2kDnAN0csl
         rjfw==
X-Forwarded-Encrypted: i=1; AJvYcCX7OmBiZgxDIOLtkEFVPgCxGgYvsIZriY1qZrNvLcifF1D4vVyxC9+5wEGQG82fWTyF2qsEfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTQx0LZFKxM6HfOs8mD2jKI3+X+zlW39nr9yFR2lkX0iHRi7Hb
	bgGG+gsznwx5oXPPjAyk37Qi5NbYzcJakiOOcTl+5bWSAOUL7vRF/HU3VbhY
X-Gm-Gg: ASbGncubVgIUzzqxFbL7WeL18GZsEIyCmXN/7KnR3B7kQ2qu/FyMlhHXZexL9J1EgWW
	Mt/z5Udcigdd/ff4t/Rn/rhFT+pwQtOwaqINMRWuU2/1oGVqub8y00fEA93NtffGoi4qPH//3D+
	xxoG4TnhszCZrbqjacKRsnFIz/4N9MTB12vQ4WVNNs3jjE8pK9DRBnON7UJbOmkw4/SCEbFmBTZ
	RkB+aR2mKXWksNEVmPyS7wl7Jkqp02D3JgVI+vFYSs4QHJwAbIonbS8NlktUB5SBNUrMlFubny4
	FaMkbROU4XIJBx0/6ZAoJGazoNJWnl2mWtYlRgIG6ryEXzM80u8b862s9zASilT6jYWTAUrUg3B
	ex6rdPT8=
X-Google-Smtp-Source: AGHT+IFM7Nhpvvb7WVLgXqMlRnFP1lXAlpfDE+AKHHtAhsdJ2NP2C/FLMhyDlB+YJRNBD2s08ouVnw==
X-Received: by 2002:a05:6214:21cc:b0:6d8:9062:6616 with SMTP id 6a1803df08f44-6f4d1eef321mr169328476d6.7.1745847220266;
        Mon, 28 Apr 2025 06:33:40 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0aaf96csm61253606d6.116.2025.04.28.06.33.38
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:33:39 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c5aecec8f3so866792985a.1
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 06:33:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzZfaM+ZWDqkRPj0Op0lFLaJ3mtk0Qy/VFI9CrCYsMzEMxbMShygLZgbhHAcC1WfxrbR49nw==@lists.linux.dev
X-Received: by 2002:a05:620a:1787:b0:7c3:cde7:a685 with SMTP id
 af79cd13be357-7c96686a84bmr1764084385a.13.1745847218260; Mon, 28 Apr 2025
 06:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250428123132.578771-1-pmladek@suse.com>
In-Reply-To: <20250428123132.578771-1-pmladek@suse.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Apr 2025 15:33:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX07EUSL2q5=jD17NX0gRMuLcWNec6i_18_vdnk5iC0bg@mail.gmail.com>
X-Gm-Features: ATxdqUFmD3scy2HsHjle6vsPCd-N6jvnwhDUq0YXyuK0ax-ge1T-9jGSCM3VE7o
Message-ID: <CAMuHMdX07EUSL2q5=jD17NX0gRMuLcWNec6i_18_vdnk5iC0bg@mail.gmail.com>
Subject: Re: [PATCH] vsprintf: Use %p4chR instead of %p4cn for reading data in
 reversed host ordering
To: Petr Mladek <pmladek@suse.com>
Cc: alyssa@rosenzweig.io, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>, airlied@redhat.com, 
	Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com, 
	joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, 
	Kees Cook <kees@kernel.org>, tamird@gmail.com, Aditya Garg <gargaditya08@live.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
	Asahi Linux Mailing List <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 14:31, Petr Mladek <pmladek@suse.com> wrote:
> The generic FourCC format always prints the data using the big endian
> order. It is generic because it allows to read the data using a custom
> ordering.
>
> The current code uses "n" for reading data in the reverse host ordering.
> It makes the 4 variants [hnbl] consistent with the generic printing
> of IPv4 addresses.
>
> Unfortunately, it creates confusion on big endian systems. For example,
> it shows the data &(u32)0x67503030 as
>
>         %p4cn   00Pg (0x30305067)
>
> But people expect that the ordering stays the same. The network ordering
> is a big-endian ordering.
>
> The problem is that the semantic is not the same. The modifiers affect
> the output ordering of IPv4 addresses while they affect the reading order
> in case of FourCC code.
>
> Avoid the confusion by replacing the "n" modifier with "hR", aka
> reverse host ordering. It is inspired by the existing %p[mM]R printf
> format.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/r/CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
