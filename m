Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3631A9B53
	for <asahi@lists.linux.dev>; Thu,  2 Jan 2025 21:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735852399; cv=none; b=avru9FI1D/c6wc8R/xGMDvgj5ajg39j8y/65zOVEmrOHyda+TXTsi1R7tYomfI2Q/5yEnd3rHQdSwvKKV8G358IFhgf1XUYj/Llcge7E1kGgUUeVLc8PFXLhiyczcjXGzH1v6lvMISfBq/xoRBY8a97ElHrYHt8p97ne0/JQ/pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735852399; c=relaxed/simple;
	bh=ZCPjk1VSEOoj9qcGvr9INHgp3+iPxgC7iRxlFjdwm1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/c4a7dG19yPoIRAxiRxwLkUskFpgX1C81h+SPbMmh4HICr9LAw8mkrC5C08AP7/PZI/W+42S01IX9yUJsH9Hh/Sd9VzGxr6ZukYNAsMmr7xd5fiVy3NUmRpbIOgthBF+VzSskhw1E3bAShHnK0HyHOIZWlD9YRS1beQQXPiYsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=US47Gn2x; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="US47Gn2x"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3cfdc7e4fso2247a12.0
        for <asahi@lists.linux.dev>; Thu, 02 Jan 2025 13:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735852395; x=1736457195; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvUkrZDHA2r06RrENG6eOLFTdRhJU/aQsdXibpnme2U=;
        b=US47Gn2xXp76HUzK4IUGvJTZaWLLnoYmi5p8mqkf4Q2bK6fvnTQVIrXgsnYe4v7riT
         ye7mQIzUX/r4F7gPMhh9HUxvgYU9tQMAqmAR1z80ZHgw9uRscOeldGX4n+XL6U1KauQE
         JiCkm3Pn5MmD5qV6Rexk8z8ZdRlQU4iZhdP2p9Lr94lB80nnm2ntxKwnqAMeSIFa6LYU
         4Nktzl5tB2/di4h7m2xCWAgWwUQja4AnXI5n1m1/ELRHfBYOOP/AZS/MkvjT4HLXhiBw
         RKBjJ2cXPFIXWGBVf4Np4C7p/ARJpqIFq8dl7vHsXQ47f9jXQkYki6ToIAtaxpXf1wbK
         HhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735852395; x=1736457195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvUkrZDHA2r06RrENG6eOLFTdRhJU/aQsdXibpnme2U=;
        b=iukQdwXdenf98A8yM0b/+Q0tUpBXpbNyXafTayfAzGUNtMWLjOdfp6K+z06//6HIja
         k1f9jmko2vx0mlCIjRx643jHafnfSE6EljbxygOfLI6FNTI6hPhl5LqQshz+VMi1YTt9
         1eUVlX/EEnRP9aIYUxcgTop7A6IFEkDop0ZOkwEWkghW0ioWYThfV7r5N+dDZg9249Pk
         IzLOdTaIUNaW5DfLY/bqFCL7deQHz9rcOd/H7iO3Eyv94lFQN1R0DDPjKmVXtAFrzPN8
         ZeP73+Kg5k27+rE1EHE+H893VGNgF+6DZXMmBPxu3LKCrm34btkmkJOB4GN0In57AjRZ
         0Nnw==
X-Forwarded-Encrypted: i=1; AJvYcCXiWH0SZNOuQN0J3qCBWYwTqls/n9BT+k5n2AtClPm8pL+Wr72AUiCb5Z7FqL1G/WWPZM55gw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwdlxFg5u/HcPvCMsEQvbL7r3+EpLt8D82qec4PakKZlXdsx7hB
	Vh5nbhvtfIeIRcm+GLAbOeaULFC0/O4o5+3h99GnPAmieg/P80m56TQxtOw5MCGvQHUG0lyPoZd
	V3zQBma9wGSJFOZtouj4zoHbm8PmEVxraUopv
X-Gm-Gg: ASbGncupQuGsziVw80aY5GbaXKiTyP9tLwMAkKoj8o0cyZAyR7vFddIm6W3+ny3o31a
	PyOwdQaM8iFneYyaGagv79YRzSOFRGJqZgo/WQnHNmNRLDUBkTJheIf97cWynW3PW9g==
X-Google-Smtp-Source: AGHT+IEtlAdtAQF0lMpNHSAEsc7gKMjqxf9IMXqHQKnDEMEIOF1Cil022qn1qEqxWg1zVwXIF3GwRL8uUgt3sTNN0l0=
X-Received: by 2002:a05:6402:538b:b0:5d0:d7ca:7bf4 with SMTP id
 4fb4d7f45d1cf-5d9156e2c80mr22824a12.0.1735852395426; Thu, 02 Jan 2025
 13:13:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
 <20241219210736.2990838-21-samitolvanen@google.com> <CAK7LNATRGzGjLLcv+aD3KdgkZXzwMsCSud116rzEThNXRQC0rw@mail.gmail.com>
In-Reply-To: <CAK7LNATRGzGjLLcv+aD3KdgkZXzwMsCSud116rzEThNXRQC0rw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 2 Jan 2025 21:12:38 +0000
X-Gm-Features: AbW1kva22k7lR6mC6lLzzh3eFbyjqTfNlFADg35Eb_8EP8gJ3kl6j3JlF1zhr0c
Message-ID: <CABCJKufXd+JZBm6WPZG8e+41DSTVC3-t33CbuOC-L4poTRQfpg@mail.gmail.com>
Subject: Re: [PATCH v7 01/18] tools: Add gendwarfksyms
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Fri, Dec 27, 2024 at 6:02=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Dec 20, 2024 at 6:07=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
>
> > +int main(int argc, char **argv)
> > +{
> > +       unsigned int n;
> > +       int opt;
> > +
> > +       struct option opts[] =3D { { "debug", 0, NULL, 'd' },
>
> You can add "static const" to opts[] here.
>
> I like the array initializer formatted like follows:
>
> static const struct option opts[] =3D {
>         { "debug", 0, NULL, 'd' },
>         { "dump-dies", 0, &dump_dies, 1 },
>         { "help", 0, NULL, 'h' },
>         { 0, 0, NULL, 0 }
> };

Sure, I'll change this.

Sami
