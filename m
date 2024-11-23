Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84C0F4FA
	for <asahi@lists.linux.dev>; Sat, 23 Nov 2024 11:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732360995; cv=none; b=H/NdovJUbT9Lhcuwzifm7tQLhJZifx0B9DVhDBSjyyNSANqctIbDjtpT8zLDN8Lq2wgOX+D7Em04OPqV4NLkPWN4l4lEAkTW+qT1jOfuwTgp8Mxtz26Sdsgr+ZooVTSyoZbuS5xy9vEkEO5dJRyT7PeuberpQsliX8+GpNhDzN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732360995; c=relaxed/simple;
	bh=u/EP1S+viKGpmTrQ8yI3KxsDbuyUkdLIpl2IkM7RyRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBpa7UWWk8zDD03ZP4s+yrxXkgjstWBwECKQNSwwCtYNqGyRbp5H9sKFYScuDKPLio6QLM5uvAYWqAl1cfL+K/86XTt2Q1BHBqDaIYRRLlCO2Bp2WXatcTGdorzV7Xa9929zizSl2UC5ph3hnHJWpUv2g/e+L9qlQAbyyw1mfa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLEYJRTN; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLEYJRTN"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53a007743e7so3362877e87.1
        for <asahi@lists.linux.dev>; Sat, 23 Nov 2024 03:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732360992; x=1732965792; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u/EP1S+viKGpmTrQ8yI3KxsDbuyUkdLIpl2IkM7RyRs=;
        b=NLEYJRTN/Z3U8LaJrn8DeFwN5ptg1tcAiCh1d4f3bnDxt13NzqXzEftQJEH/fiRH9y
         Z8Bkd/clvPFuqMkepzHBL5s/J4HYm4iWUqKqdumdNMGaoNLNhulEcOKzyth91PPlfAQR
         AJawzz4x4an/Lst5m3sgloJgsp5Jk/40u2L2mQpxaODNUGaL7V5z3kRogd5usnO9FURX
         h+uVeuZCeTUpx+k4z+T+XElZXHZDu/obOyHWUxEDDLu3Oovoi7Nx7QouZdBNjP7rSNwn
         RYv0yDnTvX4v/rY83d0sp91rIpLxSWSpdDCCGUGDHETqooq4zJWGTrjzB3Fk/G6fBEgw
         hhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732360992; x=1732965792;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/EP1S+viKGpmTrQ8yI3KxsDbuyUkdLIpl2IkM7RyRs=;
        b=ipxrOojAzr0VDTRutb8BKjhFoWz6CedYecr858qoB6buyFQ8YsZPwaeLsnDP1eToI0
         ioSbIjLwmlX2lQDd3PLJnW36SM9baM+H2IVCGB0kuPXFhAAF3ivakKS+deTeByb2OWpB
         X9W9wcz3WmBOtC4cQho+LOc23+g78weBASVWzBCj64bWhgkZEYoHwIVaygL4H8w2Os0O
         YBXE0JVyd0NAMFeMRcOEBUNkgXMyB0WrW/fdXrZH4mG8/natoVwAL5oubaptNIlQy2bc
         +uUJbHW0q7yX2VPHpsDdKQLVYN7N9Wx7rJRmRtWLTUvTgSUZWzgD3AK7Zjm0kyoJVspd
         F82A==
X-Forwarded-Encrypted: i=1; AJvYcCUfnaWPpet/mqrqu+qNzR4Mdr3HnNp/20fB5olGC3zJp9tKO6qYvpdZFg3Xy1Exqdi1C0Kw0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeavIBy0jdvyHDvApYRQTodubp9CMpu+CcjAF4srmRpxsQ1E9y
	4w+uYwYfY5lxGEBOtK3EeCeqb78VfvlheFw1JnvsjUhbMAt9awYq4dhJra8HAahSFbPqjIcMuVA
	mJv+RCPeeU7IwYIf2lexXYgD2loE=
X-Gm-Gg: ASbGnctlaQXMhWBCvDMnOTQE1yAljniFDXPtKQUsLSOLtkqjzTaj9BiLq/7yBCM1cdc
	p9U1TJVupV8gbOIILuP3o0lEowUasgNGed422WxQDDxqHDj2wd6rzi9jOd+klZA==
X-Google-Smtp-Source: AGHT+IF0iUq4b7Ych9A6xW9HMPkRzg3eqN5Ybs8vt/ejefOR7PyZW6CtBCOharUBfJO5wJ8zXGhjtReeIFOtxTdYdEU=
X-Received: by 2002:a05:6512:2391:b0:53d:d5be:4bd9 with SMTP id
 2adb3069b0e04-53dd5be4bebmr3155701e87.22.1732360991729; Sat, 23 Nov 2024
 03:23:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com> <CA+icZUX-gf8624z8u+h-W8KeddCruYDng-4vTggNGwC61NzfNA@mail.gmail.com>
In-Reply-To: <CA+icZUX-gf8624z8u+h-W8KeddCruYDng-4vTggNGwC61NzfNA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 23 Nov 2024 12:22:35 +0100
Message-ID: <CA+icZUWSKygQJNiODzdauNiHz2Di-2eSGGmd-fgBrFpdyh_HgA@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> BTW, I am testing with the latest kmod-git and pahole-git.
>
> I will give this a try when Linux v6.12.1 is released.
>

I have a prolonged build-time of +22,75 per cent.
Compared gendwarfksyms-v5 + Linux-v6.12.0 VS. gendwarfksyms-v6 + Linux-v6.12.1

Is this a known issue?

Best regards,
-Sedat-
