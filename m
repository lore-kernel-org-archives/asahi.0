Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C1519F41C
	for <asahi@lists.linux.dev>; Mon, 23 Sep 2024 18:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115548; cv=none; b=OilV/Ilk+p2gWSiLr0nNbr5AHD6cgPC70au0NWkUiry+4k7D+YyAjWVIJCH9EAXb/oxfjR/K4wdx7Cd4WulqDPUa99iWFJDXMMnJzPXlvIubslMjXwefFL9piTeXGZ7oKwnm5fvZC4oy+66QDKMeDUDLVHINnveUQwFdwMm7C/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115548; c=relaxed/simple;
	bh=gj6khed8ryNs549o/Lb/gffVUpbK8LV/Z0TyhikI208=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rvuB4OIqeZmMJV7JcopBAN9vuZBSIbUpyNV3N0vx9Hh4eovuJ0aObxo6JCfgpbQqppLkuZF4n9wAM22yXKsblqREyj5vyoWUZqojB7JTB/WKqef/uFc+EqvJsV0XeMxhuhrnj46Q/gs2Wg6POknQW/fciHyYjJIMCg5ShuXPy3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PTNzZ8Wy; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PTNzZ8Wy"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-71794969d71so3031030b3a.0
        for <asahi@lists.linux.dev>; Mon, 23 Sep 2024 11:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115545; x=1727720345; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fYykaPJf9iN08q62sPPqgPYjrSR/2ddqDpdkxmVOH40=;
        b=PTNzZ8WynLOQG0GKGWlR0mN02ioOqARr1EwDRWy58Mh+x3iMG3++1U6EP3CKzHOfVb
         Yen+qU0rbZWvTcOGIOu5eYtnncWJ5kS+JC1wl5DgI9VNq3b9h7JGZBTLOUMJ3VsvzNCr
         9I3Lr3HT2pOgDFN2aEDAX2kcN0zXw9xOIzJyJ9RF6zMTH7eaL0w8/DuVdizZc1HHEXxE
         jww78HvJrBF2TRVs57HVe/b2aTsZufGWjjAgtCEDM9e9l/n+jHJ9I4LpLHOMP6VSSjO0
         ygYVUkACDqs65vESipL8w2PiJNbFZ5OW+8x25tbOrJgnTAExdTDN1/B16XpmQnP6/hRs
         PKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115545; x=1727720345;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fYykaPJf9iN08q62sPPqgPYjrSR/2ddqDpdkxmVOH40=;
        b=fymbHmUCo3dHXilW3m3KBQ5vb/Ih4WN7YwMvlbCoIrBB9Z+xuVQTy9EppxV5iR+3Ph
         ZJ2xN2RcX0CtkYzjRhQR/xQCIEjaWpJVlF1e/nOKxlxpKOHUm0fRqRlRW1EK4GPA5mtj
         LQcswaDN+FnlgA8kG7qPMRVoqIiUaRgSw1TKTl/pkuNZR1VvFjPaZ5jtc4/U4sn49xwp
         +COCgJnlC3PB5vemFl5ZYaSicfEtiZ4oZZmnSK4PFUWLh3aA5rNdSNpiDCiTOz+v1cK3
         4uNTIT2ONy9ss2uCYqWZA239OchmBo0cFx9HusLtQack6sRAm5G+Ys38hEs2vSM28tJ8
         2lcg==
X-Forwarded-Encrypted: i=1; AJvYcCWBDXy9zlY6zvn7O+ceyDjzl911/DmJ13N2TJXDdMnH1b1iaKCbEP7gGv/WizLsUm/60cmGQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwY5v71UamTibPr2PCbyRzfEQRAhdLrOmkE439kfAHEcev/yVKq
	+MgFjC3sdxL/CSBUWjzmqOjBMKxuKHb7LR/uAcZcjgGlFHxp9hcwiy0R9ct3pkVCXhP4ppiD8oY
	FDOcXqRPsa4zMIER+//jBA9AFTw==
X-Google-Smtp-Source: AGHT+IFXsfcwc3JvPBOqJlRoLdNtPRiE6lFFX4gPJa86MrvCNC+ZBctwFTPVCwA4l+3zKo8NhIJqs5E35fawOlvKtBk=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6a00:6f20:b0:718:dfec:9570 with
 SMTP id d2e1a72fcca58-7199cee9a89mr53651b3a.6.1727115545229; Mon, 23 Sep 2024
 11:19:05 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:18:46 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=9451; i=samitolvanen@google.com;
 h=from:subject; bh=gj6khed8ryNs549o/Lb/gffVUpbK8LV/Z0TyhikI208=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN7LVCXiHbzxl367qMENkzerDMTIO3lyGm86UeMhut
 Teyq9rcUcrCIMbBICumyNLydfXW3d+dUl99LpKAmcPKBDKEgYtTACZSxcLIMLdI8oLBu7NxrBlp
 er8+B/ZuuffDW+rK7LlJOo+a3l4UaWX4xdwRutTaot6tzrvqU3OG2ZUHbgdPPH0n/HlW7BWltyV XWAE=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-22-samitolvanen@google.com>
Subject: [PATCH v3 00/20] Implement DWARF modversions
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

Here's v3 of the DWARF modversions series [1][2]. The main
motivation remains modversions support for Rust, which is important
for distributions like Android that are eager to ship Rust kernel
modules. Per Luis' request [3], v2 dropped the Rust specific bits
from the series and instead added the feature as an option for
the entire kernel. Matt is still addressing Rust modversion_info
compatibility issues in a separate series [4], and we'll follow up
with a patch to actually allow CONFIG_MODVERSIONS with Rust once
everything else has been sorted out.

A short background recap: Unlike C, Rust source code doesn't
have sufficient information about the final ABI, as the compiler
has considerable freedom in adjusting structure layout, for
example, which makes using a source code parser like genksyms a
non-starter. Based on Matt's suggestion and previous feedback from
maintainers, this series uses DWARF debugging information for
computing versions. DWARF is an established and a relatively stable
format, which includes all the necessary ABI details, and adding a
CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
reasonable trade-off.

The first two patches add more list macros to scripts/include and
move the genksyms CRC32 implementation to a shared header file. The
next 15 patches add gendwarfksyms, a tool for computing symbol
versions from DWARF. When passed a list of exported symbols and
object files, the tool generates an expanded type string for each
symbol and computes symbol CRCs similarly to genksyms. gendwarfksyms
is written in C and uses libdw to process DWARF. Patch 18 ensures
that debugging information is present where we need it, patch 19
adds gendwarfksyms as an alternative to genksyms, and the last patch
adds documentation.

Note that v3 is based on next-20240923 as it depends on Masahiro's
scripts/include changes. For x86, we also need a separate small
patch to include asm/ptrace.h in asm/ftrace.h. [5] For your
convenience, you can find this series with all the prerequisites
here:

https://github.com/samitolvanen/linux/commits/gendwarfksyms-v3

If you also want to test the series with Rust modules, this branch
adds Matt's modversion_info series and a small patch to enable Rust
modversions:

https://github.com/samitolvanen/linux/commits/rustmodversions-v3

Looking forward to hearing your thoughts!

Sami


[1] v1: https://lore.kernel.org/lkml/20240617175818.58219-17-samitolvanen@google.com/
[2] v2: https://lore.kernel.org/lkml/20240815173903.4172139-21-samitolvanen@google.com/
[3] https://lore.kernel.org/lkml/ZnIZEtkkQWEIGf9n@bombadil.infradead.org/
[4] https://lore.kernel.org/lkml/20240806212106.617164-1-mmaurer@google.com/
[5] https://lore.kernel.org/lkml/20240916221557.846853-2-samitolvanen@google.com/

---

Changes in v3:
- Updated SPX license headers.

- Squashed the first two patches in v2 and tried to reduce churn as
  much as reasonable.

- Dropped patch 18 from v2 ("x86/asm-prototypes: Include
  <asm/ptrace.h>") as it's addressed by a separate patch. [5]

- Changed the error handling code to immediately terminate instead
  of propagating the errors back to main, which cleaned up the code
  quite a bit.

- Switched to the list and hashtable implementations in scripts and
  dropped the remaining tools/include dependencies. Added a couple
  missing list macros. (patch 1)

- Moved the genksyms CRC32 implementation to scripts/include and
  dropped the duplicate code. (patches 2 and 14)

- Switched from ad-hoc command line parsing to getopt_long (patch 3).

- Added structure member and function parameter names to the DIE
  output to match genksyms behavior, and tweaked the symtypes format
  to be more parser-friendly in general based on Petr's suggestions.

- Replaced the declaration-only struct annotations with more generic
  kABI stability rules that allow source code annotations to be used
  where #ifndef __GENKSYMS__ was previously used.  Added support for
  rules that can be used to exclude enumerators from versioning.
  (patch 16)

- Per Miroslav's suggestion, added an option to hide structure
  members from versioning when they're added to existing alignment
  holes, for example. (patch 16)

- Per Greg's request, added documentation and example macros for the
  --stable features, and a couple of test cases. (patches 15, 16, and
  20)

- Fixed making symtypes files, which need to depend on .o files with
  gendwarfksyms. (patch 19)

- Addressed several other smaller issues that Petr and Masahiro
  kindly pointed out during the v2 review.

Changes in v2:
- Per Luis' request, dropped Rust-specific patches and added
  gendwarfksyms as an alternative to genksyms for the entire
  kernel.

- Added support for missing DWARF features needed to handle
  also non-Rust code.

- Changed symbol address matching to use the symbol table
  information instead of relying on addresses in DWARF.

- Added __gendwarfksyms_ptr patches to ensure the compiler emits
  the necessary type information in DWARF even for symbols that
  are defined in other TUs.

- Refactored debugging output and moved the more verbose output
  behind --dump* flags.

- Added a --symtypes flag for generating a genksyms-style
  symtypes output based on Petr's feedback, and refactored
  symbol version calculations to be based on symtypes instead
  of raw --dump-dies output.

- Based on feedback from Greg and Petr, added --stable flag and
  support for reserved data structure fields and declaration-onl
  structures. Also added examples for using these features.

- Added a GENDWARFKSYMS option and hooked up kbuild support
  for both C and assembly code. Note that with gendwarfksyms,
  we have to actually build a temporary .o file for calculating
  assembly modversions.

---

Sami Tolvanen (20):
  scripts: import more list macros
  scripts: move genksyms crc32 implementation to a common include
  tools: Add gendwarfksyms
  gendwarfksyms: Add address matching
  gendwarfksyms: Expand base_type
  gendwarfksyms: Add a cache for processed DIEs
  gendwarfksyms: Expand type modifiers and typedefs
  gendwarfksyms: Expand subroutine_type
  gendwarfksyms: Expand array_type
  gendwarfksyms: Expand structure types
  gendwarfksyms: Limit structure expansion
  gendwarfksyms: Add die_map debugging
  gendwarfksyms: Add symtypes output
  gendwarfksyms: Add symbol versioning
  gendwarfksyms: Add support for kABI rules
  gendwarfksyms: Add support for reserved and ignored fields
  gendwarfksyms: Add support for symbol type pointers
  export: Add __gendwarfksyms_ptr_ references to exported symbols
  kbuild: Add gendwarfksyms as an alternative to genksyms
  Documentation/kbuild: Add DWARF module versioning

 Documentation/kbuild/gendwarfksyms.rst      |  274 +++++
 Documentation/kbuild/index.rst              |    1 +
 include/linux/export.h                      |   15 +
 kernel/module/Kconfig                       |   31 +
 scripts/Makefile                            |    3 +-
 scripts/Makefile.build                      |   39 +-
 scripts/gendwarfksyms/.gitignore            |    2 +
 scripts/gendwarfksyms/Makefile              |   12 +
 scripts/gendwarfksyms/cache.c               |   44 +
 scripts/gendwarfksyms/die.c                 |  166 +++
 scripts/gendwarfksyms/dwarf.c               | 1085 +++++++++++++++++++
 scripts/gendwarfksyms/examples/kabi.h       |  141 +++
 scripts/gendwarfksyms/examples/kabi_ex0.c   |   86 ++
 scripts/gendwarfksyms/examples/kabi_ex1.c   |   89 ++
 scripts/gendwarfksyms/examples/kabi_ex2.c   |   98 ++
 scripts/gendwarfksyms/examples/kabi_rules.c |   56 +
 scripts/gendwarfksyms/examples/symbolptr.c  |   29 +
 scripts/gendwarfksyms/gendwarfksyms.c       |  195 ++++
 scripts/gendwarfksyms/gendwarfksyms.h       |  351 ++++++
 scripts/gendwarfksyms/kabi.c                |  214 ++++
 scripts/gendwarfksyms/symbols.c             |  317 ++++++
 scripts/gendwarfksyms/types.c               |  477 ++++++++
 scripts/genksyms/genksyms.c                 |   77 +-
 scripts/include/crc32.h                     |   93 ++
 scripts/include/list.h                      |   50 +
 25 files changed, 3860 insertions(+), 85 deletions(-)
 create mode 100644 Documentation/kbuild/gendwarfksyms.rst
 create mode 100644 scripts/gendwarfksyms/.gitignore
 create mode 100644 scripts/gendwarfksyms/Makefile
 create mode 100644 scripts/gendwarfksyms/cache.c
 create mode 100644 scripts/gendwarfksyms/die.c
 create mode 100644 scripts/gendwarfksyms/dwarf.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi.h
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex0.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex1.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex2.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi_rules.c
 create mode 100644 scripts/gendwarfksyms/examples/symbolptr.c
 create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
 create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
 create mode 100644 scripts/gendwarfksyms/kabi.c
 create mode 100644 scripts/gendwarfksyms/symbols.c
 create mode 100644 scripts/gendwarfksyms/types.c
 create mode 100644 scripts/include/crc32.h


base-commit: ef545bc03a65438cabe87beb1b9a15b0ffcb6ace
-- 
2.46.0.792.g87dc391469-goog

