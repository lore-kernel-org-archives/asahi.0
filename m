Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A311E517
	for <asahi@lists.linux.dev>; Thu, 17 Oct 2024 00:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729124801; cv=none; b=UXXiju1I5uQ/G8ehh8vGtsLs2Hhx9pAxF8UlJmcspRYQEyT5+atUHlkewplnkpSiucf0TwVDeKSBjUFZIO8c4Z8liR7oW4VO99hm8W6IcUngU/f1M8z/dppGMWyqahLT7D5Vh4jaMCq+Qt3W2z3fvg6ymp/LnpXxFIRBfDvBru4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729124801; c=relaxed/simple;
	bh=0jwTR0iueyndpPrNwaFPpUKTaxSDEKtRjzWhhrTbnME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4HzhudjeAywkmPOyIpxsaTpK6v1b8yD56xMmSzCbv1RizXbOqwa9BJYoC2wrU1qruh+ok4zpk1pcq5e/5RuhH05DeCHmyQDqF7h36B/abR4GMxHHTYdrzWHwLB16qWAN1bMzwE3G8ODU26cAgZe42baBKAba7O0myNfoC1LkiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fz6IXAAF; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fz6IXAAF"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-460969c49f2so123021cf.0
        for <asahi@lists.linux.dev>; Wed, 16 Oct 2024 17:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124798; x=1729729598; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWdC8o5l9dSoefG8d0V05ixiC17MDxk90k3DqUJtL94=;
        b=Fz6IXAAFyMatwaJcRV8C3RL1cMrbtkl36nNqzg+3PPouRD1AJOGZbIniHqSCS7edJD
         DSde63yw+A5/K+EnXbYjxM7+jy6BxStjol0Qt8I+uo9V0G6gvUFay4fNRItNUEI295oO
         vK0XG3hNiUloqwFYuXAQKB5/lA1XAQKQzjp7DE2XxQQ1YXzLFBzVNWLIYMvGi8i/T9AG
         fBV8I6RBIPBFtHYl9j5tAa6DLqHYSndmlmlw9kkkKBRQgkrPrz/PSdTuXXkv4+Hj12K/
         gUrowaxSJiBDpgZsUS8jY9d8CwTGIhxz7NownjD83NzmStIYZBXdxBHXB6G1twGCb4cS
         wGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124798; x=1729729598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWdC8o5l9dSoefG8d0V05ixiC17MDxk90k3DqUJtL94=;
        b=B4j+Zt2KDOOV1WVp/QW4A1XVJ4KBmuWuWGkXTXPwfJU/XVBXOY+DM1I/Hwg9P4o8Up
         E4fmBCAz/Cpfo5y+uzG/MbCxr+27hStQ2Rny/zg9djtXYVEQcCiZebWxCl9rZIr69VDx
         qvNxaai1BhbAHz5Cg9hlHo5qSS1Z617G0iVlD1uBSK+qfRZdQ9dXKIJLchqY7thDLn3v
         4SE9ShIySVbUR/nGpMVleStjebC6zwAg2gEu3Fq6mf6jTr+cETox+EOEueDc7D3HXJtl
         n9t4cFmmJ5Jm163oIsfSSCmEi01Uw6jQUIqmM4+Ag1S8YOufozz7J/ND/LS9JG8o4diN
         ol6A==
X-Forwarded-Encrypted: i=1; AJvYcCWFbqDFFDGAE/ODOmq82ze7trw9eaD0Bej28ifHRDjFkch/IPvk/fRmr2yOXTi+lR0+r8C0eQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJJDg/u/F8X4P1Tf0AzK+j+s6jMq3ppfK+1Lp/rq48VyyFDNCy
	pGl93U8mCCTx7elc+69p4IPlJvrgzED+UGcZ4RBS0XNmF/gyvVMuNVgw9Obfe/SNYGMO0OM+dsK
	/CgV7tF4ffGLpszjXIS1Hno+hcLlFG0hFlmKe
X-Google-Smtp-Source: AGHT+IFyrIuiUrO1qU9KQuQZSVEK+54cenmGt/fL8q6O8TUeM+0K1ZlNZ1Ma9YYWd9GL+AJTnwqdve95TquY/nRUVCA=
X-Received: by 2002:ac8:648d:0:b0:45f:924:6bcd with SMTP id
 d75a77b69052e-4609c8e1b3amr1552851cf.22.1729124798070; Wed, 16 Oct 2024
 17:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241015231925.3854230-1-mmaurer@google.com> <20241015231925.3854230-5-mmaurer@google.com>
In-Reply-To: <20241015231925.3854230-5-mmaurer@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 16 Oct 2024 17:25:58 -0700
Message-ID: <CABCJKucg9okLPkK1bgDqZ+gdRxSxvkE2Ff8JPBkrcsH+Guo_vg@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] modpost: Produce extended MODVERSIONS information
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Oct 15, 2024 at 4:19=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 107393a8c48a..d18ff8a1109a 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1840,15 +1840,56 @@ static void add_versions(struct buffer *b, struct=
 module *mod)
>                         continue;
>                 }
>                 if (strlen(s->name) >=3D MODULE_NAME_LEN) {
> +#ifdef CONFIG_EXTENDED_MODVERSIONS
> +                       /* this symbol will only be in the extended info =
*/
> +                       continue;
> +#else
>                         error("too long symbol \"%s\" [%s.ko]\n",
>                               s->name, mod->name);
>                         break;
> +#endif

I applied these patches to my test tree[1] and have the following
options enabled in my .config:

$ grep -E 'MODVERSIONS|GEN.*KSYMS' .config
CONFIG_HAVE_ASM_MODVERSIONS=3Dy
CONFIG_MODVERSIONS=3Dy
# CONFIG_GENKSYMS is not set
CONFIG_GENDWARFKSYMS=3Dy
CONFIG_ASM_MODVERSIONS=3Dy
CONFIG_EXTENDED_MODVERSIONS=3Dy

When I try to build a Rust module, I still get the following error:

ERROR: modpost: too long symbol
"_RNvXs2_NtNtNtCsivAAjSnxUpM_4core3fmt3num3implNtB9_7Display3fmt"
[samples/rust/rust_print.ko]

I suspect gating this behind a config would require you to add a new
command line flag to modpost and check for CONFIG_EXTENDED_MODVERSIONS
in scripts/Makefile.modpost instead.

[1] https://github.com/samitolvanen/linux/commits/rustmodversions

Sami
