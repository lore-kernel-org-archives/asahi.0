Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F161A235A0F
	for <asahi@lists.linux.dev>; Wed, 30 Oct 2024 17:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307718; cv=none; b=ozEXw5rzwSPdoHcxO90I9lM317uua5uIyoaUYL41gyiojyejq5mXht23VzaBzT9pspSQ/uGBBF4lwmKxpI8kvskEig3EB22TEabPHrgLVEKmRiK2jcxplLwOlEdOtQtqrdCZFHXSls5TFV4NHRh2Yg+krkuuxpl/lM/20qCZW5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307718; c=relaxed/simple;
	bh=QeqSbCsPj7qrRhglch9sMXx52tVBAJeYNKhv77vFEtY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EyoAShh7S8oIUrvg3Q/I3M43AC3cqn8arBDCtvW+XtTCzwDx75qTk8nmUYdt8Z1zFyVPtg+/rGZiGK5poz/3duNM8htj5VCwuw/AWp0jGfre6yp5Zo5SMgZogHF697OxfAXUlptErjKyyHLfX3pk8+Y/kF2uiqJrO3tBWWpdKhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bsim1Q2Y; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bsim1Q2Y"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7edbbc3a9f2so86756a12.1
        for <asahi@lists.linux.dev>; Wed, 30 Oct 2024 10:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307714; x=1730912514; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vIug+S7emoCYpKR4nFVHSEuFz95qB3OCAjrjCPUc3mI=;
        b=Bsim1Q2YaFvCE2ZVzN6YU8CiJR18EJyEMsLHHTCCksQh+QVWhKbyQHbXf/Vwd5Ai/1
         uQICppDdll00goZmL8Gs7UgLCIwP2f4smSjAjQhJts4m5rPoOW6RGeccSBWq/f4a9oJz
         1vYslMhcZc2RZ00Yh8fuDWFP18MqyShn596uYXoiKQRk9dC7CIsQ0vjgt8/E7yxNWJ7M
         Co/oUcClM3/ZbAxo+sdp103vw5chCA++4XXUd4NZYx9c0kK8T1K0OSrnHurAm3o1/YMR
         9KoG6uOD0zX9qTEuFQQtDI+jIFCmi0RFz6FFy53NdSK+FIg61DY6zca0xcqFF4/ujBto
         bnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307714; x=1730912514;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIug+S7emoCYpKR4nFVHSEuFz95qB3OCAjrjCPUc3mI=;
        b=Jc66r57khozeTdbHUPzrRDVJdF8fe6HiZD+H09hD9hXc+LpGyul8CTi8EUPbVLrULB
         zByi43Ul6CX1rpnIHtU4FVy7OpFn7xt+x5dpwksOSKWrP1XM4eWiE14E30v4Tc84KWRp
         mry2KQBRp4kIASCDIMoat9dzcWn2/lmYs7WXNYfr33WzcYsA4tntCXwlhV6A9t0lc18D
         vFncj9rsO/f4MPLv5oqVeNTBpF0k5UcjwxVOdx8GdLHuvRiZLCEP/U9N1HM9hOlWJGFZ
         iEn3ZxOevDf5Xu76YNTJktQ6EY0vqG4jZ7Xry28SvZtt5FbgAcdmNhxIIv+jMPJqOiFi
         Ay5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXhp+vvLxHxBA7d18VVGJdBAPqZBcHnHIdMaRsc8HX0ZpsrNxtH/jUrucIvty5bhuHmVXMdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtOBqizylVFHAuv9Ov+JD/I2kACB1T6L1erd+ZZuLSVmNiFQLR
	R9pUCIhUaLSU/7AmqqCsaDAlx53KY4Fa7aOoAkOJzzOA++3OP8tu+c4lxwS/1QjlnTUFl8VxzbI
	Sf8hYgkP3Wplu95pqWOZI0QqDiA==
X-Google-Smtp-Source: AGHT+IGkDgNvAc7QgTxnQXGlbFGgIkGE0d3gPCPIyv5YYRky9bix4wE6z0LYzBTK9o7Os12OXUE3m3rVYuFt1FFJpko=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:385c:0:b0:7ea:999a:7930 with SMTP
 id 41be03b00d2f7-7edd7b6c7e8mr24309a12.1.1730307713761; Wed, 30 Oct 2024
 10:01:53 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:25 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5224; i=samitolvanen@google.com;
 h=from:subject; bh=QeqSbCsPj7qrRhglch9sMXx52tVBAJeYNKhv77vFEtY=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKadF1rBc3yhe9XddxbnWVwLU5KVcTNX9bF8fP+PppU
 XPyuUaGjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjCRx/YM/9TTmtNefL30t+W6
 eoXo54yVemacOnyVt9Ys16uTN742v4CR4VSKdZ5pC+ON3Yz2vtwLlp795LKJfe7E0vKLc6bybFn IzgwA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-39-samitolvanen@google.com>
Subject: [PATCH v5 18/19] kbuild: Add gendwarfksyms as an alternative to genksyms
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

When MODVERSIONS is enabled, allow selecting gendwarfksyms as the
implementation, but default to genksyms.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
---
 kernel/module/Kconfig  | 25 ++++++++++++++++++++++++-
 scripts/Makefile       |  2 +-
 scripts/Makefile.build | 41 +++++++++++++++++++++++++++++++++--------
 3 files changed, 58 insertions(+), 10 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index f9e5f82fa88b..e6b2427e5c19 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -169,13 +169,36 @@ config MODVERSIONS
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
index 8f423a1faf50..d2a0440cdb79 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -107,18 +107,31 @@ cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
 $(obj)/%.i: $(obj)/%.c FORCE
 	$(call if_changed_dep,cpp_i_c)
 
+getexportsymbols = $(NM) $(1) | sed -n 's/.* __export_symbol_\(.*\)/$(2)/p'
+
+gendwarfksyms = scripts/gendwarfksyms/gendwarfksyms	\
+	$(if $(1), --symtypes $(2))			\
+	$(if $(KBUILD_GENDWARFKSYMS_STABLE), --stable)
+
 genksyms = scripts/genksyms/genksyms		\
 	$(if $(1), -T $(2))			\
 	$(if $(KBUILD_PRESERVE), -p)		\
 	-r $(or $(wildcard $(2:.symtypes=.symref)), /dev/null)
 
 # These mirror gensymtypes_S and co below, keep them in synch.
+ifdef CONFIG_GENDWARFKSYMS
+symtypes_dep_c = $(obj)/%.o
+cmd_gensymtypes_c = $(if $(skip_gendwarfksyms),,	\
+	$(call getexportsymbols,$(2:.symtypes=.o),\1) |	\
+	$(gendwarfksyms) $(2:.symtypes=.o))
+else
 cmd_gensymtypes_c = $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
+endif # CONFIG_GENDWARFKSYMS
 
 quiet_cmd_cc_symtypes_c = SYM $(quiet_modtag) $@
       cmd_cc_symtypes_c = $(call cmd_gensymtypes_c,true,$@) >/dev/null
 
-$(obj)/%.symtypes : $(obj)/%.c FORCE
+$(obj)/%.symtypes : $(obj)/%.c $(symtypes_dep_c) FORCE
 	$(call cmd,cc_symtypes_c)
 
 # LLVM assembly
@@ -314,19 +327,31 @@ $(obj)/%.ll: $(obj)/%.rs FORCE
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
+	$(gendwarfksyms) $(2:.symtypes=.gendwarfksyms.o)
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
2.47.0.163.g1226f6d8fa-goog

