Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CC413F435
	for <asahi@lists.linux.dev>; Fri, 22 Nov 2024 01:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732240309; cv=none; b=ukMI2JGDukKLt9GdQ5eRdoLlXLMZ3eIKpjfLpHwUQzBnFIL5Diwo2qNHOFo6HZ+SPWGvQtMFsHsi9TCY6XTQLG/+Xf4Pg8bmzaLncDIsCPPzhGAvMo8t01rTY2vMWPtk9oeSvKqy6cwOKSjARp2D3Z9Y3vAZjK4/GpgQcmxCMn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732240309; c=relaxed/simple;
	bh=/aZ5tnhrg58nES9DotuawpjZyBP9ljUcHLWoDrLmcpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVkjilpi9kUaQeZTfoM7wDd3TEFBBK5ItuLh0BPkt4QDzmF4Yl6QD1YySR+wiHoEWK9g0b7JGVq4knzSe71LF1C9pnGDIatDRE9nzaWEFn+A9V5N8VBZXKddpnCZNzPucmkcIlDEJo+UM0/tMyBgHS/Z4rCurp4bGm1iGQN7Ut4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3mOvTqK; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3mOvTqK"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53da3545908so1821332e87.1
        for <asahi@lists.linux.dev>; Thu, 21 Nov 2024 17:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732240305; x=1732845105; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i8Z+CPVajeJ3Ry1Xl5fp5aaPACwKhtsug1K6GR7nlyg=;
        b=Z3mOvTqK2gg5r6BlzEHwYcIAIZBPvTUA0aGBSAvnU/ZotO8Y36yIniBkjzDb2xhLRq
         12G9TUcgks0Ich3n6sJABWPJ+usv3WelWHaG+JP45KNcuHFpXlf6rf1SU7kknN8DrWkA
         2JLpxC0xVDJyZrwJgl/Ydpj6T1FX8kTwKp0zIOBktFgYJVfRQGf4hfY6XnKoM7waeaJb
         mXjUn0y93xSGZuTOkLrIFjQjfcYMYdpVj2wZMA8b3XHSqNkmWBdvY4Ucq81fC6c/iTT0
         8oqDtv4nzxsJjl/1ctNGyHZcf9pqHJoMZOY+fjf4wEMAlM86a5/PUAtPo5fvjMhAcjv6
         jCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732240305; x=1732845105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i8Z+CPVajeJ3Ry1Xl5fp5aaPACwKhtsug1K6GR7nlyg=;
        b=eqCFTlCp8alcS2MTlYT1FohluArLc9ZgAxEwRqZLx8HW6ltzBsToC7QZMxKhHt9g08
         v/7Bd5JrDm7f1Q+S9QDIomio9q4/xulokfNGGecV39c/zHVrvO6NkAtD8NJwZqO62lR/
         z8kOhU7T57uFCdjBp+ZST8/9O4TCRGdmJaScFic51NzI1pgvWDTBsNs8HFjwZnNKrDsB
         QGybUKQFOPGjIHRQS8u6HL69LdHnG7FPo7uJ6OwPOrBWOmVssY3SsqKXhK1yQ1N+b/oH
         9WTyv6ImM4F1JGMQrQC0NwV+EB7dmB9dZCApF4QBZ0jfGuXiMIfv1ehBXWG1y13DXCXu
         N6kw==
X-Forwarded-Encrypted: i=1; AJvYcCVoBFDQ1KtZboWSqM6CCkybkpLBbtUXvakM+50zY5n7TofACklszfiP9KV3sIZQrYT5o1kQ1g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3Z2u4lcqrJ4rxfqfnU1ews6o/b4IpFbxebtvm1bSlhhugS9fo
	dCIhPruFsQFl1DoTmxYNTjNUavRKkmiEaKYVI7kVn3sTee0QfaakKneIRcrcBp4lWAe9A3mN5YI
	fLZiTr8Zxi0l7fFS3BDNr8WH2+0s=
X-Gm-Gg: ASbGncu2R8v69mBDV0iHc5rMKAvtHCMZqI50I9ut8FDqDBJxiRwNVVDg+I5BiN701OB
	g/v/z9Uev075NNtnL3O9AJa1JtjRoasUvJQ==
X-Google-Smtp-Source: AGHT+IFhrF/dTuYAUtNauVsCU2r43xjLhGCO/XkliH18CF905DIz+unOZlD2iAtqVdv86vVM4u4IrbFXUnuFJOYf8n0=
X-Received: by 2002:a05:6512:1594:b0:53d:a864:2432 with SMTP id
 2adb3069b0e04-53dd36aa58bmr457837e87.17.1732240304980; Thu, 21 Nov 2024
 17:51:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
In-Reply-To: <20241121204220.2378181-20-samitolvanen@google.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 22 Nov 2024 02:51:09 +0100
Message-ID: <CA+icZUX-gf8624z8u+h-W8KeddCruYDng-4vTggNGwC61NzfNA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 9:42=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi,
>
> Here's v6 of the DWARF modversions series. The main motivation is
> modversions support for Rust, which is important for distributions
> like Android that are about to ship Rust kernel modules. Per Luis'
> request [1], v2 dropped the Rust specific bits from the series and
> instead added the feature as an option for the entire kernel to
> make it easier to evaluate the benefits of this approach, and to
> get better test coverage. Matt is addressing Rust modversion_info
> compatibility issues in a separate patch set [2] that depends on
> this series, and actually allows modversions to be enabled with
> Rust.
>
> Short background: Unlike C, Rust source code doesn't have sufficient
> information about the final ABI, as the compiler has considerable
> freedom in adjusting structure layout, for example, which makes
> using a source code parser like genksyms a non-starter. Based on
> earlier feedback, this series uses DWARF debugging information for
> computing versions. DWARF is an established and a relatively stable
> format, which includes all the necessary ABI details, and adding a
> CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
> reasonable trade-off as most distributions already enable it.
>
> The first 15 patches add gendwarfksyms, a tool for computing symbol
> versions from DWARF. When passed a list of exported symbols and
> object files, the tool generates an expanded type string for each
> symbol and computes symbol versions. gendwarfksyms is written in C,
> uses libdw to process DWARF, and zlib for CRC32. Patch 16 ensures
> that debugging information is present where we need it, patch 17
> adds gendwarfksyms as an alternative to genksyms, and the last patch
> adds documentation.
>
> v6 has changes to structure expansion and the kABI stability
> features based on our backtesting results with previous Android
> release kernels (see the change log below). It's also based on
> linux-kbuild/for-next to include symtypes build rule clean-ups from
> Masahiro [3]. For your convenience, the series is also available
> here:
>
> https://github.com/samitolvanen/linux/commits/gendwarfksyms-v6
>

Thanks for the update, Sami.

What are your plans to get this upstream?

Is Linux 6.13 the new development base?

Personally, I would like to see a Linux v6.12 LTS version offered.

LTO is not supported - might be worth mentioning this in the
documentation patch with some explanations?

BTW, I am testing with the latest kmod-git and pahole-git.

I will give this a try when Linux v6.12.1 is released.

Best regards,
-Sedat-




> If you also want to test the series with actual Rust modules, this
> branch adds Matt's latest modversion_info series:
>
> https://github.com/samitolvanen/linux/commits/rustmodversions-v6
>
> Sami
>
>
> [1] https://lore.kernel.org/lkml/ZnIZEtkkQWEIGf9n@bombadil.infradead.org/
> [2] https://lore.kernel.org/linux-modules/20241030-extended-modversions-v=
8-0-93acdef62ce8@google.com/
> [3] https://lore.kernel.org/linux-modules/CAK7LNAR9c+EEsOvPPn4qSq3gAFskYO=
XVd=3Ddg8O+bKeeC-HMifw@mail.gmail.com/
>
> ---
>
> v6:
> - Dropped pointer expansion limits as this affects version
>   stability when exported symbols are removed. (Patch 9)
>
> - Changed local type definitions (in .c files) that are opaque
>   to external users to be treated as declarations even if a
>   definition is available. (Patch 9)
>
> - Switched to zlib's CRC32 implementation per Masahiro's
>   suggestion. (Patch 12)
>
> - Renamed struct_declonly kABI rule to simply declonly, as it
>   applies also to unions and enums, added a new rule for
>   overriding enumerator values, and refactored the examples.
>   (Patch 13)
>
> - Added --stable support for renamed structure members and
>   also added examples. (Patch 14)
>
> - Rebased on linux-kbuild/for-next for Masahiro's symtypes
>   build rule clean-ups. (Patch 17)
>
> - Updated the documentation reflect --stable changes. (Patch 18)
>
> v5: https://lore.kernel.org/lkml/20241030170106.1501763-21-samitolvanen@g=
oogle.com/
> - Rebased on v6.12-rc5.
>
> - Fixed an issue with limiting structure expansion, and applied
>   Petr's clean-up. (Patch 10)
>
> - Dropped an unnecessary return statement in error path. (Patch
>   12)
>
> - Addressed several other smaller issues Petr brought up. (Patches
>   13, 14, and 15)
>
> - Added a KBUILD_GENDWARFKSYMS_STABLE flag to enable --stable for
>   the entire kernel build. (Patch 18)
>
> - Updated documentation to include KBUILD flags. (Patch 19)
>
> - Picked up Reviewed-by tags from v4.
>
> v4: https://lore.kernel.org/lkml/20241008183823.36676-21-samitolvanen@goo=
gle.com/
> - Rebased on v6.12-rc2, which now includes all the prerequisites.
>
> - Dropped unnecessary name_only parameter for symbols.c::for_each
>   and cleaned up error handling. (Patch 3)
>
> - Fixed anonymous scope handling to ensure unnamed DIEs don't get
>   names. (Patch 4)
>
> - Added non-variant children to variant_type output, and included
>   DW_AT_discr_value attributes for variants. (Patch 9)
>
> - Added another symbol pointer test case. (Patch 16)
>
> - Picked up (Acked|Reviewed)-by tags from v3.
>
> v3: https://lore.kernel.org/lkml/20240923181846.549877-22-samitolvanen@go=
ogle.com/
> - Updated SPX license headers.
>
> - Squashed the first two patches in v2 and tried to reduce churn as
>   much as reasonable.
>
> - Dropped patch 18 from v2 ("x86/asm-prototypes: Include
>   <asm/ptrace.h>") as it's addressed by a separate patch.
>
> - Changed the error handling code to immediately terminate instead
>   of propagating the errors back to main, which cleaned up the code
>   quite a bit.
>
> - Switched to the list and hashtable implementations in scripts and
>   dropped the remaining tools/include dependencies. Added a couple
>   missing list macros. (patch 1)
>
> - Moved the genksyms CRC32 implementation to scripts/include and
>   dropped the duplicate code. (patches 2 and 14)
>
> - Switched from ad-hoc command line parsing to getopt_long (patch 3).
>
> - Added structure member and function parameter names to the DIE
>   output to match genksyms behavior, and tweaked the symtypes format
>   to be more parser-friendly in general based on Petr's suggestions.
>
> - Replaced the declaration-only struct annotations with more generic
>   kABI stability rules that allow source code annotations to be used
>   where #ifndef __GENKSYMS__ was previously used.  Added support for
>   rules that can be used to exclude enumerators from versioning.
>   (patch 16)
>
> - Per Miroslav's suggestion, added an option to hide structure
>   members from versioning when they're added to existing alignment
>   holes, for example. (patch 16)
>
> - Per Greg's request, added documentation and example macros for the
>   --stable features, and a couple of test cases. (patches 15, 16, and
>   20)
>
> - Fixed making symtypes files, which need to depend on .o files with
>   gendwarfksyms. (patch 19)
>
> - Addressed several other smaller issues that Petr and Masahiro
>   kindly pointed out during the v2 review.
>
> v2: https://lore.kernel.org/lkml/20240815173903.4172139-21-samitolvanen@g=
oogle.com/
> - Per Luis' request, dropped Rust-specific patches and added
>   gendwarfksyms as an alternative to genksyms for the entire
>   kernel.
>
> - Added support for missing DWARF features needed to handle
>   also non-Rust code.
>
> - Changed symbol address matching to use the symbol table
>   information instead of relying on addresses in DWARF.
>
> - Added __gendwarfksyms_ptr patches to ensure the compiler emits
>   the necessary type information in DWARF even for symbols that
>   are defined in other TUs.
>
> - Refactored debugging output and moved the more verbose output
>   behind --dump* flags.
>
> - Added a --symtypes flag for generating a genksyms-style
>   symtypes output based on Petr's feedback, and refactored
>   symbol version calculations to be based on symtypes instead
>   of raw --dump-dies output.
>
> - Based on feedback from Greg and Petr, added --stable flag and
>   support for reserved data structure fields and declaration-onl
>   structures. Also added examples for using these features.
>
> - Added a GENDWARFKSYMS option and hooked up kbuild support
>   for both C and assembly code. Note that with gendwarfksyms,
>   we have to actually build a temporary .o file for calculating
>   assembly modversions.
>
> v1: https://lore.kernel.org/lkml/20240617175818.58219-17-samitolvanen@goo=
gle.com/
>
> ---
>
> Sami Tolvanen (18):
>   tools: Add gendwarfksyms
>   gendwarfksyms: Add address matching
>   gendwarfksyms: Expand base_type
>   gendwarfksyms: Add a cache for processed DIEs
>   gendwarfksyms: Expand type modifiers and typedefs
>   gendwarfksyms: Expand subroutine_type
>   gendwarfksyms: Expand array_type
>   gendwarfksyms: Expand structure types
>   gendwarfksyms: Limit structure expansion
>   gendwarfksyms: Add die_map debugging
>   gendwarfksyms: Add symtypes output
>   gendwarfksyms: Add symbol versioning
>   gendwarfksyms: Add support for kABI rules
>   gendwarfksyms: Add support for reserved and ignored fields
>   gendwarfksyms: Add support for symbol type pointers
>   export: Add __gendwarfksyms_ptr_ references to exported symbols
>   kbuild: Add gendwarfksyms as an alternative to genksyms
>   Documentation/kbuild: Add DWARF module versioning
>
>  Documentation/kbuild/gendwarfksyms.rst     |  308 ++++++
>  Documentation/kbuild/index.rst             |    1 +
>  include/linux/export.h                     |   15 +
>  kernel/module/Kconfig                      |   31 +
>  scripts/Makefile                           |    3 +-
>  scripts/Makefile.build                     |   35 +-
>  scripts/gendwarfksyms/.gitignore           |    2 +
>  scripts/gendwarfksyms/Makefile             |   12 +
>  scripts/gendwarfksyms/cache.c              |   51 +
>  scripts/gendwarfksyms/die.c                |  166 +++
>  scripts/gendwarfksyms/dwarf.c              | 1158 ++++++++++++++++++++
>  scripts/gendwarfksyms/examples/kabi.h      |  157 +++
>  scripts/gendwarfksyms/examples/kabi_ex.c   |   30 +
>  scripts/gendwarfksyms/examples/kabi_ex.h   |  263 +++++
>  scripts/gendwarfksyms/examples/symbolptr.c |   33 +
>  scripts/gendwarfksyms/gendwarfksyms.c      |  185 ++++
>  scripts/gendwarfksyms/gendwarfksyms.h      |  301 +++++
>  scripts/gendwarfksyms/kabi.c               |  333 ++++++
>  scripts/gendwarfksyms/symbols.c            |  339 ++++++
>  scripts/gendwarfksyms/types.c              |  477 ++++++++
>  20 files changed, 3893 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/kbuild/gendwarfksyms.rst
>  create mode 100644 scripts/gendwarfksyms/.gitignore
>  create mode 100644 scripts/gendwarfksyms/Makefile
>  create mode 100644 scripts/gendwarfksyms/cache.c
>  create mode 100644 scripts/gendwarfksyms/die.c
>  create mode 100644 scripts/gendwarfksyms/dwarf.c
>  create mode 100644 scripts/gendwarfksyms/examples/kabi.h
>  create mode 100644 scripts/gendwarfksyms/examples/kabi_ex.c
>  create mode 100644 scripts/gendwarfksyms/examples/kabi_ex.h
>  create mode 100644 scripts/gendwarfksyms/examples/symbolptr.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
>  create mode 100644 scripts/gendwarfksyms/kabi.c
>  create mode 100644 scripts/gendwarfksyms/symbols.c
>  create mode 100644 scripts/gendwarfksyms/types.c
>
>
> base-commit: 3596c721c4348b2a964e43f9296a0c01509ba927
> --
> 2.47.0.371.ga323438b13-goog
>
