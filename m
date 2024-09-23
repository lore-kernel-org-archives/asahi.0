Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7D51A4F12
	for <asahi@lists.linux.dev>; Mon, 23 Sep 2024 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115583; cv=none; b=qromg3NVtu0It9k1qCNUz8S8YpzIjeYgvSOaaefJWzLq85kSPvnpyyh58FVQnvUkIKPtAbSyntgeme/Wy4XQp6dgRKzfrwvaMYVJG/nFKCv0eZW/CUYiWBJI0XtLMhkDMwah8TFY7qc8M5y/7O9rePnuC0E0eULruhYaJOu2izU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115583; c=relaxed/simple;
	bh=OH24tQPuDnVpzlK2A4pw7td01bMw79FJr1MczVyAYNk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BwIblG22p/YHRSOHvZszvZctym6kj6HG4KtSVa3/91kUFfAfe+uiNsrNfXE+++OGKLQWWtqHMVlXr0KnvfXdTxO7VxTD94lkwCAC68Ohg74qnXEGkgVydNxatL6F2UuTSIZDiU7atD7H7v59IWQn824h4B/hjo0KbCXsBF/1n0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yYKzfB9H; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yYKzfB9H"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e1a8de19f7aso7033336276.3
        for <asahi@lists.linux.dev>; Mon, 23 Sep 2024 11:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115580; x=1727720380; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BgepgN3aRhrp+ARvxjN9eiDJ8ZxKyJSzBfNXPMCj9LE=;
        b=yYKzfB9HQA0qhr6xuTpkWYhLb4/0RZTWBuw9Nw16yJB5o/Qwe2KmFRy2eCkAtustu4
         Lzm+fvjHf1vACKosQ2bjftscCf8owhudbEL81cSmTntQ+hn/fllK7LsV2Etbat588fpX
         X+36UNMi43oHCj5yEF5Y9pE7R1A7I+tz6Y45Ork5gClh+wnUpcz+7Xe+ym5UYijs6HyK
         DTI5Lzi5H+5Vx1bja3UitsUgS9m1QZN/XnsE9ReUKIcIAblb6whFA38DSCijKatfT88c
         HhKyV8CWzbZ5ReJPdpKCD/Jiq3fDvPk2vDR9Oom4IY0TpnhuP8XU5/B4SaYEIhVOW+YK
         laSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115580; x=1727720380;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BgepgN3aRhrp+ARvxjN9eiDJ8ZxKyJSzBfNXPMCj9LE=;
        b=i53vHxlOD+fo65JCp1F+HxrgVKoLrPdldw7LjnY0puRpnx8SWw9d3wtZ2aQrDEqSH9
         QKuUnQ8zVj8fNms94fKSJWb6vrtS2+Pk5TZXUSYt30MzJ5ROpzSsIV/D186hnNNsyi6n
         JoVyMG8BkoE3eD5qmtrRNhj6Z/BCics5gH/IDs7/jv/VTg0fLcB+M4fIWnXW/CCLpQow
         GmPk5QFjC106j/j4RzjQdx84HMqyVPOE3KtvsAzxxlc9CS7T1hj1kS43ok3o47iUQ4RC
         5d6H6cBh4fQ28F41GaMoBfAMinmRHSmUpBJfFgKaiBXhrDcHqHi4Q0eT2frBg0LqeVnj
         ZYeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcyy2TPFhZMaOBJpzO6grkYmzWOyWlfij3RO+kcH/GMH35Y1QEku2A6APEPoAcLbyGiryy+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxX75+Kq/ULwAzxEsy6t3ho7pVrW1EHn5L4BHTK7kcU8UY8kZQ
	LkUQBsKm1oEV/g4iEfdIdgoaMFc6YuZNlhzGILCeWGD80ZR5RvAI7gv/Dr3PevgV2TutAwxRn1S
	dC4A1L6magOv6QaNC0QHCOlu9+Q==
X-Google-Smtp-Source: AGHT+IGm8TyRvIoRQAss2gkVdi1286GfP5Qqk6F1uonGTA9V0dZMsunnuESBlFP3IoWyCP3MD6ektydfKaQSmobwhCE=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:690e:0:b0:e1d:21ae:3b95 with SMTP
 id 3f1490d57ef6-e2252fe2127mr32040276.10.1727115579734; Mon, 23 Sep 2024
 11:19:39 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:19:05 +0000
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5161; i=samitolvanen@google.com;
 h=from:subject; bh=OH24tQPuDnVpzlK2A4pw7td01bMw79FJr1MczVyAYNk=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN/JHTGAzkBH499+JOzF4Q/GVkLQ6gQNlt85t453Sp
 6H/cV98RykLgxgHg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZjI3XZGhmPRhh96pt7a0fG7
 7KDBo02/Wx5ZWjao6OltCGf3YJ1fpMfI8FX6q21dl+311W+zl9351zBjqbvBDtHNW40N2QLd+Kw ceQE=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-41-samitolvanen@google.com>
Subject: [PATCH v3 19/20] kbuild: Add gendwarfksyms as an alternative to genksyms
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

When MODVERSIONS is enabled, allow selecting gendwarfksyms as the
implementation, but default to genksyms.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 kernel/module/Kconfig  | 25 ++++++++++++++++++++++++-
 scripts/Makefile       |  2 +-
 scripts/Makefile.build | 39 +++++++++++++++++++++++++++++++--------
 3 files changed, 56 insertions(+), 10 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index c3a0172a909f..804b0b515d04 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -168,13 +168,36 @@ config MODVERSIONS
 	  make them incompatible with the kernel you are running.  If
 	  unsure, say N.
 
+choice
+	prompt "Module versioning implementation"
+	depends on MODVERSIONS
+	default GENKSYMS
+	help
+	  Select the tool used to calculate symbol versions for modules.
+
+	  If unsure, select GENKSYMS.
+
+config GENKSYMS
+	bool "genksyms (from source code)"
+	help
+	  Calculate symbol versions from pre-processed source code using
+	  genksyms.
+
+	  If unsure, say Y.
+
 config GENDWARFKSYMS
-	bool
+	bool "gendwarfksyms (from debugging information)"
 	depends on DEBUG_INFO
 	# Requires full debugging information, split DWARF not supported.
 	depends on !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT
 	# Requires ELF object files.
 	depends on !LTO
+	help
+	  Calculate symbol versions from DWARF debugging information using
+	  gendwarfksyms. Requires DEBUG_INFO to be enabled.
+
+	  If unsure, say N.
+endchoice
 
 config ASM_MODVERSIONS
 	bool
diff --git a/scripts/Makefile b/scripts/Makefile
index d7fec46d38c0..8533f4498885 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -53,7 +53,7 @@ hostprogs += unifdef
 targets += module.lds
 
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
-subdir-$(CONFIG_MODVERSIONS) += genksyms
+subdir-$(CONFIG_GENKSYMS) += genksyms
 subdir-$(CONFIG_GENDWARFKSYMS) += gendwarfksyms
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
 subdir-$(CONFIG_SECURITY_IPE) += ipe
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 8f423a1faf50..ae13afb71123 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -107,18 +107,28 @@ cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
 $(obj)/%.i: $(obj)/%.c FORCE
 	$(call if_changed_dep,cpp_i_c)
 
+gendwarfksyms := scripts/gendwarfksyms/gendwarfksyms
+getexportsymbols = $(NM) $(1) | sed -n 's/.* __export_symbol_\(.*\)/$(2)/p'
+
 genksyms = scripts/genksyms/genksyms		\
 	$(if $(1), -T $(2))			\
 	$(if $(KBUILD_PRESERVE), -p)		\
 	-r $(or $(wildcard $(2:.symtypes=.symref)), /dev/null)
 
 # These mirror gensymtypes_S and co below, keep them in synch.
+ifdef CONFIG_GENDWARFKSYMS
+symtypes_dep_c = $(obj)/%.o
+cmd_gensymtypes_c = $(if $(skip_gendwarfksyms),,			\
+	$(call getexportsymbols,$(2:.symtypes=.o),\1) |			\
+	$(gendwarfksyms) $(2:.symtypes=.o) $(if $(1), --symtypes $(2)))
+else
 cmd_gensymtypes_c = $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
+endif # CONFIG_GENDWARFKSYMS
 
 quiet_cmd_cc_symtypes_c = SYM $(quiet_modtag) $@
       cmd_cc_symtypes_c = $(call cmd_gensymtypes_c,true,$@) >/dev/null
 
-$(obj)/%.symtypes : $(obj)/%.c FORCE
+$(obj)/%.symtypes : $(obj)/%.c $(symtypes_dep_c) FORCE
 	$(call cmd,cc_symtypes_c)
 
 # LLVM assembly
@@ -314,19 +324,32 @@ $(obj)/%.ll: $(obj)/%.rs FORCE
 # This is convoluted. The .S file must first be preprocessed to run guards and
 # expand names, then the resulting exports must be constructed into plain
 # EXPORT_SYMBOL(symbol); to build our dummy C file, and that gets preprocessed
-# to make the genksyms input.
+# to make the genksyms input or compiled into an object for gendwarfksyms.
 #
 # These mirror gensymtypes_c and co above, keep them in synch.
-cmd_gensymtypes_S =                                                         \
-   { echo "\#include <linux/kernel.h>" ;                                    \
-     echo "\#include <asm/asm-prototypes.h>" ;                              \
-     $(NM) $@ | sed -n 's/.* __export_symbol_\(.*\)/EXPORT_SYMBOL(\1);/p' ; } | \
-    $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
+getasmexports =								\
+   { echo "\#include <linux/kernel.h>" ;				\
+     echo "\#include <linux/string.h>" ;				\
+     echo "\#include <asm/asm-prototypes.h>" ;				\
+     $(call getexportsymbols,$(2:.symtypes=.o),EXPORT_SYMBOL(\1);) ; }
+
+ifdef CONFIG_GENDWARFKSYMS
+cmd_gensymtypes_S =							\
+	$(getasmexports) |						\
+	$(CC) $(c_flags) -c -o $(2:.symtypes=.gendwarfksyms.o) -xc -;	\
+	$(call getexportsymbols,$(2:.symtypes=.o),\1) |			\
+	$(gendwarfksyms) $(2:.symtypes=.gendwarfksyms.o)		\
+		$(if $(1), --symtypes $(2))
+else
+cmd_gensymtypes_S =							\
+	$(getasmexports) |						\
+	$(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
+endif # CONFIG_GENDWARFKSYMS
 
 quiet_cmd_cc_symtypes_S = SYM $(quiet_modtag) $@
       cmd_cc_symtypes_S = $(call cmd_gensymtypes_S,true,$@) >/dev/null
 
-$(obj)/%.symtypes : $(obj)/%.S FORCE
+$(obj)/%.symtypes : $(obj)/%.S $(obj)/%.o FORCE
 	$(call cmd,cc_symtypes_S)
 
 
-- 
2.46.0.792.g87dc391469-goog

