Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461041C2325
	for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 17:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743590; cv=none; b=rBkAq39s/ARv9OzxZb+ucy6fqgC/RkarKCJ2KFuCBo5R288ehv2kcn+ZNg5omfAdKBxLWshvJvEpYFs+2OWNzgZ3IPsgHqZ0+YxwWAAz58QEaCZRWPXsAYsqHRbxPDbD7CuEzdaFE5XSPVPYpERVuWtEnvvUGyJQcENBeZPXa94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743590; c=relaxed/simple;
	bh=mz7nffxN7wId2ePyNyx2gbUj67IvJCbAVk8B4r6F3JI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g0NavwamnOdU3/54ys1Rax638Fn07k0TBkq0UB4/2TO4eI3LjcgEZ0yzgWvLT/PYXstGlzRQGjv9pkz6FfMc0XXWnXk2F3O95zT2zzySEJuR3C1TtgAJLQ9k54Z5xxclYKun6zyKoYqr8AZVPZPYcdo9gjmpKzEL8AxcdpI55k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E05eNtaZ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E05eNtaZ"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7b544c7f7b3so1025194a12.2
        for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 10:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743588; x=1724348388; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cHfKDENnTQm8ek88L2arGqWCp64m5+2eabNApwrdQWY=;
        b=E05eNtaZkn6jJmivSycxotxcZxLw9FMBLV1GOJRu07+JJox2HHiqwg/a6SCnOL8PGt
         WM6ZbrMdi8ghNL2+L3Piyz0Y0ZikBFLEHLE0NqTdcODXhnyRlNut7Xa5MA3+cix2Ux8J
         S+420QavEa02Aa4PZ/75X/13Vo1ZbWXPrg2UAD3+Dvn753c5fOvxxfebJdZmPbpP4ca/
         0XQdlq/1hwlEubGbeVQf8EQ++RvA9d2J8Gleg0tyUrrv/OJsChRZEqz8pQVOE8q6I49D
         PZM+Feyqs38k9BNiFLmIlg5oFzGciUi6ZgMoOnR6U3JsWFwAmt1M/i2kOMRsD/hHyAtz
         07DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743588; x=1724348388;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cHfKDENnTQm8ek88L2arGqWCp64m5+2eabNApwrdQWY=;
        b=JKv/JbLF8e1eh1O6r7SNFT8cSlzmTVqJ2BCHUq4BrGYas7QuLJ3YxDdvjS19lF3g6p
         CSolmILO5WJlKs1aqPFsM8TlNxplSgzGrHM/bWf3zQsTBZaJ+p+e9qXl6Y9fNgeMnAHu
         eLbdhArInFtUKz70f7SSF2wXpfMxEQ5rbRyrJrW9k481YgL+R2qOhpxJht68+KRt5ShC
         yWjmgbHm0Q04cmW8wWC0XQd78+EPBe3bRKPfvdCEGr6C1rxEpffYc60IhdXrW2jR4L2R
         DZzaRwSknEwKCqTSh2Ug7OcXMzaQJVO1ebXN1D4taNQyUUmRrQCPVEANSxigxurqow+c
         A23A==
X-Forwarded-Encrypted: i=1; AJvYcCXJoE9FwetpC4AqblaS9i2o+4/Y0y47NyX38+s6iHicAnSvEJBrnTnKGpAJQqwC6yEzTlu/1VMgwfNjJnD2SZKpBizAjIc=
X-Gm-Message-State: AOJu0YyW3kOjXb0Hx1QGsKXgEuuUZp0IeQDEbD7hR10hifw1CsY55BDG
	tHAS1s4cEb/DcZXh2cVWkeWxNjXPolgD69tiazVAPqvRi4L0NBBqma1RGpovbw8VW8ec/1o2WeC
	tcG4r7L9WxH9x/QVF95a9ZdU0ng==
X-Google-Smtp-Source: AGHT+IFTAkXFaRwAV/SQwqCeTGEycib4FiTINhjKTaFPZbrPJmJ+KMbkdPWYs8+NjnMSf4VPl8XwcMRzylf5jVza6Gs=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:af1c:0:b0:75e:cf19:8f83 with SMTP
 id 41be03b00d2f7-7c9796d8a56mr125a12.3.1723743587293; Thu, 15 Aug 2024
 10:39:47 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:23 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4761; i=samitolvanen@google.com;
 h=from:subject; bh=mz7nffxN7wId2ePyNyx2gbUj67IvJCbAVk8B4r6F3JI=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj06CUaKOoKTE/x4zhmMUl5+xK4VKhS9egsRZ
 EV60/RxPFeJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49OgAKCRBMtfaEi7xW
 7rzZDACSD3JRn+H/NSXRZE7PImLTyCeLXiFaUKPrqH9OX1i0VZRE+Ujk3Fwuv1EQvYxnkTXOGSQ
 4pzHAXhRMgHLUw9Pj6WaFvL15HccicXnzBlDKBCRbchKw1xRa1hgd5BD1dOVLal2i2yGJ5wjWj0
 w7hogl6gH6uVQcLpDQAhAGHCzMprB+Joyc/Yp+xwhcPTqCWeElf4fcBwKR8i+IpLf9hRgmG6p6y
 AqDez4vPKDD85j4xvlyhkuasvReQEsWWB3j/2swrrMVBprrGZnIIje8us1UinjDhg521N+mtV5X
 WWIOKRhrhCyv8kmHEKUOgoBp2zNSJEGIimSkz/3s7lrkIrlCdwmFsd3vgNEMbaS5mR/AkgDcqyv
 5XaOmdjdfTVLCvqAPWx3Px2kXJ2M1bx1VAZNuzXWuQPsCaMOWd9yEpuyXnor1R7Aoaw9hG6nYHy l/aa9uwh9DOgnzHvAaeyx1TKhEx+sIF5Gh3O3D2TvLFWr5TNOv0agadESGCu/jUR5jhUs=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-40-samitolvanen@google.com>
Subject: [PATCH v2 19/19] kbuild: Add gendwarfksyms as an alternative to genksyms
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

When MODVERSIONS is enabled, allow selecting gendwarfksyms as the
implementation, but default to genksyms.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 kernel/module/Kconfig  | 25 ++++++++++++++++++++++++-
 scripts/Makefile       |  2 +-
 scripts/Makefile.build | 34 ++++++++++++++++++++++++++++------
 3 files changed, 53 insertions(+), 8 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index a506d4ac660f..80b2e9b0596b 100644
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
index 2fd0199662e9..52db4f1f37c4 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -53,7 +53,7 @@ hostprogs += unifdef
 targets += module.lds
 
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
-subdir-$(CONFIG_MODVERSIONS) += genksyms
+subdir-$(CONFIG_GENKSYMS) += genksyms
 subdir-$(CONFIG_GENDWARFKSYMS) += gendwarfksyms
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index efacca63c897..985e4ba7b813 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -122,13 +122,22 @@ cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
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
+cmd_gensymtypes_c = $(if $(skip_gendwarfksyms),,			\
+	$(call getexportsymbols,$(2:.symtypes=.o),\1) |			\
+	$(gendwarfksyms) $(2:.symtypes=.o) $(if $(1), --symtypes $(2)))
+else
 cmd_gensymtypes_c = $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
+endif # CONFIG_GENDWARFKSYMS
 
 quiet_cmd_cc_symtypes_c = SYM $(quiet_modtag) $@
       cmd_cc_symtypes_c = $(call cmd_gensymtypes_c,true,$@) >/dev/null
@@ -324,14 +333,27 @@ $(obj)/%.ll: $(obj)/%.rs FORCE
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
+getasmexports =							\
+   { echo "\#include <linux/kernel.h>" ;			\
+     echo "\#include <linux/string.h>" ;			\
+     echo "\#include <asm/asm-prototypes.h>" ;			\
+     $(call getexportsymbols,$@,EXPORT_SYMBOL(\1);) ; }
+
+ifdef CONFIG_GENDWARFKSYMS
+cmd_gensymtypes_S =						\
+	$(getasmexports) |					\
+	$(CC) $(c_flags) -c -o $(@:.o=.gendwarfksyms.o) -xc -;	\
+	$(call getexportsymbols,$@,\1) |			\
+	$(gendwarfksyms) $(@:.o=.gendwarfksyms.o)		\
+		$(if $(1), --symtypes $(2))
+else
+cmd_gensymtypes_S =						\
+	$(getasmexports) |					\
+	$(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
+endif # CONFIG_GENDWARFKSYMS
 
 quiet_cmd_cc_symtypes_S = SYM $(quiet_modtag) $@
       cmd_cc_symtypes_S = $(call cmd_gensymtypes_S,true,$@) >/dev/null
-- 
2.46.0.184.g6999bdac58-goog

