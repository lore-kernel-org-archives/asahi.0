Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF15F149C6F
	for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723755504; cv=none; b=VdY9cEAGMIs3+v9V6Kh5Y5YOn8V41yqqRclpzR2fyZInxDUBIqhFIDBFh1JRiad9iBenYXFX/ZUGqnvLS/js8k1+IV4nRF/zaqcVfUoSEAH3lx0uoKXxLiOlvQUCHPyGDEMAyXlSxYGBz1ENnWFXZYIefuhxyjldWUezrHJiI7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723755504; c=relaxed/simple;
	bh=8wln7XutcBzXNU1G/NmOPbT18PRKrrWwlo2AMVsQdN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFRH0yUF/NZjJ5WxBmQk6mVO4a0Z+DZ7aW0/YIeDccFqTO+cDoH84vBP17uGOzvSx/Ay3h6EKKAEbu8pB/9HkqjoRYXCaGpU7bBL6o1EzWZ75lPXAfgPU5UJXD4K6wD2/RRzLfLiMoa5vZPCYOpbptHcc62OfxrqaVcLV5kctSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rSC7H8Ht; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rSC7H8Ht"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-493d748ba72so490514137.3
        for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 13:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723755501; x=1724360301; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wln7XutcBzXNU1G/NmOPbT18PRKrrWwlo2AMVsQdN4=;
        b=rSC7H8Hti/48/CFb3+jI84auu+faThERtC1npD3Qskp7minuiCppKVqabKnRwc8XeU
         Fqlw19p5cfa+bmTOaJxViv13ySFY/i5OEg3sqvyFnt8wreIfDXXLNbJHm8faJLfEClks
         sELlNzbVhSMy2QVKbdX39La21bETrpP8BvDnB0vIidYC3VuxWqKUB6obUG02WtvvDz2i
         U4PLGRuWGzU1Izhm+4e8cbtqlOqyOSBuJ2eQ76ASeGnvGBfFsxN2h2QShEqIWsFDJFJ4
         TMX86b7NB/0dAqDNV1Xfm7Si+E/v7D6VpPERYkdkY2W4MB8iCyIkceiQwWrBZ/U+Cxbf
         p89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723755501; x=1724360301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wln7XutcBzXNU1G/NmOPbT18PRKrrWwlo2AMVsQdN4=;
        b=TqwdoPjaJw0+pOR1MZusgGUoxsIpB1sPKSpLA7G8uTYZb2kvAK4N1m8DlsWjPN/YFm
         enhg/yK+VubxSpuVM2agSsACnXUzagpMrzpGAFtboqkohEEwFYf9X3mwXErQu9zl0VVu
         VyGbIichX20N8h5Hnzr0BEAIzphkh9yu34NRC3KYmBXJjNYk8E6d9QDUVlJh8usklEIO
         M4UMh1xkI8ZPHbCu6Goi+QH1E+bv7Ktezy0ehNBRoh0BTU3uWshAMqxKrMpe07mqp80q
         EKLHTfUtOOnDZlPhSA+eaDINfznbykLOBVLCsBj12L8HMM1tVYEOCQZ4tg4WJ3yzspN9
         lFfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUahJwOruG83+2AYOrjtAjZI8G7LuDW5WIp8EPj/wFPJq8SyaBE5KDx1hu1XQQPGn/yhlvAbeCBiWAEiBizqeHE59pI4Uk=
X-Gm-Message-State: AOJu0YxT+kfj0azrJ8AFmXEVNfDbxQ7NmnV5AvBUT8zz4DGKfguy6OkF
	NvxNua8srZbQZGTZv/NwO10QD88jbof3Ea4+knlG5pAP9m/PSyMTRxvd7LSkmin3F2CMXaMJL46
	htTPn2fFUkqyrC6tzZvJT0C+ckvFitj9mPNe+
X-Google-Smtp-Source: AGHT+IFUSrIEqWeN8wUF/yIuZkO3TaOdgNlBO3G3MbEevGKK4ytem985M3RMZ7a3GjfIZFQAPQhKhXURq+gF78oHAOc=
X-Received: by 2002:a05:6102:419e:b0:48f:8e07:1c45 with SMTP id
 ada2fe7eead31-497798d0fa4mr1423973137.1.1723755501362; Thu, 15 Aug 2024
 13:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 15 Aug 2024 20:57:45 +0000
Message-ID: <CABCJKucPh3UA2JVn72B99T6xyTX+bs2o1G7WRXp__bx_zsecNg@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] Extended MODVERSIONS Support
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Aug 6, 2024 at 9:21=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> Previously MODVERSIONS + RUST Redux [1]
>
> This patch series is intended for use alongside the Implement
> MODVERSIONS for RUST [2] series as a replacement for the symbol name
> hashing approach used there to enable RUST and MODVERSIONS at the same
> time.
>
> Elsewhere, we've seen a desire for long symbol name support for LTO
> symbol names [3], and the previous series came up [4] as a possible
> solution rather than hashing, which some have objected [5] to.
>
> This series adds a MODVERSIONS format which uses a section per column.
> This avoids userspace tools breaking if we need to make a similar change
> to the format in the future - we would do so by adding a new section,
> rather than editing the struct definition. In the new format, the name
> section is formatted as a concatenated sequence of NUL-terminated
> strings, which allows for arbitrary length names.
>
> Currently, this series emits both the extended format and the current
> format on all modules, and prefers the extended format when checking if
> present. I'm open to various other policies via Kconfig knobs, but this
> seemed like a good initial default.
>
> The refactor to MODVERSIONS is prefixed to this series as result of an
> explicit request [6] by Luis in response to the original patchset.
>
> If you are testing this patch alongside RUST by manually removing the
> !MODVERSIONS restriction (this series doesn't remove it, because the
> CRCs don't mean what we'd want them to yet, we need the DWARF patch for
> that) and have kernel hardening enabled, you may need the CPU
> Mitigations [7] series. Without it, the foo.mod.o file produced by the
> C compiler will reference __x86_return_thunk, but foo.o will not.
> This means that the version table will not contain a version for
> __x86_return_thunk, but foo.ko will reference it, which will result
> in a version check failure.

Thanks for reviving this series!

I tested your patches on top of my DWARF modversions series and it
seems to work as expected. I confirmed that Rust modules have
versions, the kernel verifies them correctly, loading the modules
succeeds, and scripts/export_report.pl seems to produce correct output
as well. Here's the tree I used, it includes the prerequisite patch
sets you mentioned:

https://github.com/samitolvanen/linux/commits/rustmodversions/

With the minor comments I had about patch 14 addressed:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Sami Tolvanen <samitolvanen@google.com>

Sami
