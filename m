Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE6B146593
	for <asahi@lists.linux.dev>; Tue,  6 Aug 2024 21:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979273; cv=none; b=uHBNkpTDvpNcK6yoEatnIExoDTmhYffiCZxm7eapCvp9gFIn4AnTl35mZv4q39RYO7al7BgFjDS/TvODq39Iy2yIXkWsryZsWxoDAPCjTyMxWLXMcrjlnzsDvoouCunPJRpNurQ2P3qDi+Z3rQ9HI/ycpY3Gt9Eur4UD9PZw2hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979273; c=relaxed/simple;
	bh=heM5uA1h3O9sMxylWx0nEPtpRLemZa0vHE5S3SDNWdw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Niz1cuDDkJT0xgUG1XiD6xiBUFNpcNmrPRDnxLq4zp3mwwBDnPmpRvDpYXuoqJn+zQtDlncCxQOe+/2BOMxA+lO2S3d0IG7RLpDCSpXnxaZZNhs6Tj3BCltPZN45C7yOjpxoZQiXGCW/cfCRvv7N8vxbWnlKsMZ8VwP4pdBqnzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2J0ax8gl; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2J0ax8gl"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e087ed145caso1631960276.3
        for <asahi@lists.linux.dev>; Tue, 06 Aug 2024 14:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979271; x=1723584071; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4FbkHsjbrqQbuRvkdw57dKFwFPFfEB/U6kkbaRbF7t0=;
        b=2J0ax8glY/Ck/IXJlXjpX4qDks1u/NNJeC/KT6fcmDIDNgd2CactsWtEiH6nQ+cycr
         h6mgdcpxpHCq7mMBQ6u8Ftp2UdJvVXvpVkt3MAV3EmDxOJ97r3qD1rqTLRSP5+z2p9s4
         4W02MLA6Wga3K8DHDIBNNNlkCq/z8QeOxAgJ7CYzRlH6RH+B8XUP3B5e/Pq4ovdjx9Ji
         snM8XYHLi/rzFQnQWyDt5k0hir9LifQgV1Y8ID2eUyDHG8KrzojM7hbXh6mT3BKI9irY
         /Ih0VSLpcrTJkX+5GtwHvYwtCHRB6LvfgrSX/EQCaGPHWykZB2qpz1Wgw0X+QT6ckyav
         rE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979271; x=1723584071;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4FbkHsjbrqQbuRvkdw57dKFwFPFfEB/U6kkbaRbF7t0=;
        b=vDr1wif9MFJQRXUNGa18h9koMLBFXt5+LAx1Ocnj0ClZ6DRgfKjIe6gjxllO6LpEvp
         74SkaZO4ciQp1IFHk1tmBoxSBG5qv+abmVCnqik2O6SQrJFk8xXd8kbC1walB/M/hrSV
         njZ1c29qzmSJ6hQGFz6RFoSBXbaxpv6ce5aR2J/Kk9LZNvzIQsVukCUrbe3woM/Ep2Ss
         HH4teidsQeFhS0Tog2wONeaFJVCEVhKugSDwWUGwudm20EkosTlLDIXC7bco/7TfIbz3
         UhMP0xk/B+okt3wrzBi65QNis9cXx42KrP9zMh3GD7Df8+H1Y5WA6KGqq/GQq05p26i1
         23GA==
X-Forwarded-Encrypted: i=1; AJvYcCUSX8mhvIjDls2Zjqeno+RF1nmfsR/C6KoO0Y5ydF3nDz2l8BNOmKT+Y0/S5q6FS0bO01/iPs4SH69LMTPt3bUc6PN/Wc4=
X-Gm-Message-State: AOJu0YwfOIMnCKquTbdpaDZK5yc8ca5hAYEPHX2+Q88g4Yh0TAoZbJO5
	IB/8b7lx4rew1TsjqPceUlOFoocif7Ov9EZb2ticL1LrHy6+y0hnx5BEe6j+lgYvn30sfkzYxQL
	DMYA1hw==
X-Google-Smtp-Source: AGHT+IExCLgM+sXMSR6m0P1n1GnffNaAREKf4oeChWkKCDHm8cEPsESVi8hBFnwr8hMTvIMraQmWAixONaRW
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:2605:b0:e03:62dc:63de with SMTP
 id 3f1490d57ef6-e0bde29b508mr309326276.6.1722979270695; Tue, 06 Aug 2024
 14:21:10 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:26 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-1-mmaurer@google.com>
Subject: [PATCH v3 00/16] Extended MODVERSIONS Support
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

Previously MODVERSIONS + RUST Redux [1]

This patch series is intended for use alongside the Implement
MODVERSIONS for RUST [2] series as a replacement for the symbol name
hashing approach used there to enable RUST and MODVERSIONS at the same
time.

Elsewhere, we've seen a desire for long symbol name support for LTO
symbol names [3], and the previous series came up [4] as a possible
solution rather than hashing, which some have objected [5] to.

This series adds a MODVERSIONS format which uses a section per column.
This avoids userspace tools breaking if we need to make a similar change
to the format in the future - we would do so by adding a new section,
rather than editing the struct definition. In the new format, the name
section is formatted as a concatenated sequence of NUL-terminated
strings, which allows for arbitrary length names.

Currently, this series emits both the extended format and the current
format on all modules, and prefers the extended format when checking if
present. I'm open to various other policies via Kconfig knobs, but this
seemed like a good initial default.

The refactor to MODVERSIONS is prefixed to this series as result of an
explicit request [6] by Luis in response to the original patchset.

If you are testing this patch alongside RUST by manually removing the
!MODVERSIONS restriction (this series doesn't remove it, because the
CRCs don't mean what we'd want them to yet, we need the DWARF patch for
that) and have kernel hardening enabled, you may need the CPU
Mitigations [7] series. Without it, the foo.mod.o file produced by the
C compiler will reference __x86_return_thunk, but foo.o will not.
This means that the version table will not contain a version for
__x86_return_thunk, but foo.ko will reference it, which will result
in a version check failure.

[1] https://lore.kernel.org/all/20231118025748.2778044-1-mmaurer@google.com/
[2] https://lore.kernel.org/all/20240617175818.58219-17-samitolvanen@google.com/
[3] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org/
[4] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
[5] https://lore.kernel.org/lkml/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com/
[6] https://lore.kernel.org/lkml/ZVZNh%2FPA5HiVRkeb@bombadil.infradead.org/
[7] https://lore.kernel.org/all/20240725183325.122827-1-ojeda@kernel.org/

Matthew Maurer (16):
  module: Take const arg in validate_section_offset
  module: Factor out elf_validity_ehdr
  module: Factor out elf_validity_cache_sechdrs
  module: Factor out elf_validity_cache_secstrings
  module: Factor out elf_validity_cache_index_info
  module: Factor out elf_validity_cache_index_mod
  module: Factor out elf_validity_cache_index_sym
  module: Factor out elf_validity_cache_index_str
  module: Group section index calculations together
  module: Factor out elf_validity_cache_strtab
  module: Additional validation in elf_validity_cache_strtab
  module: Reformat struct for code style
  export_report: Rehabilitate script
  modules: Support extended MODVERSIONS info
  modpost: Produce extended modversion information
  export_report: Use new version info format

 arch/powerpc/kernel/module_64.c |  24 +-
 kernel/module/internal.h        |  18 +-
 kernel/module/main.c            | 647 ++++++++++++++++++++++++--------
 kernel/module/version.c         |  43 +++
 scripts/export_report.pl        |  17 +-
 scripts/mod/modpost.c           |  39 +-
 6 files changed, 627 insertions(+), 161 deletions(-)

-- 
2.46.0.rc2.264.g509ed76dc8-goog

