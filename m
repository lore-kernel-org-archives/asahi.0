Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0028774402
	for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 17:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743562; cv=none; b=ueKb+u2nFAezr6JYFqC3sU6xMiVDvgTaByzBpWmam0uF3SG4PaHW93hmLCgg3SrCc2Gh0xJndX8duVzB8zusklwqGQQmVoHoDIGoF6ufiQ0L5aXO63QyJz5MJN+1BZtsIMIpESlYhjzBvAX9qZHV8xh8zJ/Pdd/grbfa+8XOGLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743562; c=relaxed/simple;
	bh=Ahmj2O3IR+LSl3BiA52xKx3B/l6T0r/Fo4+Nt8cR26I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=STDj1oqMTchC+aF9BYcv1FM2sopQj4430jM2+z7hGgb3+b+7hMOgw8zKi5F4yYvMEHGLFOqChoA2QiniHItmmt+t1U4dJcG6jIJKKXf00Akc3ZepQ3Kwh5nTdovVWtVLLi06zr/04/qwkCTt4v8aDV3giKz3mZkpsqd0yMQ1g6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zQF93aOh; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zQF93aOh"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-721d20a0807so1081403a12.1
        for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 10:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743560; x=1724348360; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mLQlJKBqT4/VzYmf9VfZ8u93RL60RGH7yZrLYBcRMXE=;
        b=zQF93aOhCQDqJh79cI16ktT49QXrU/eNyKTKJT4H6f3ynl4uBE0MTLMLdED+Qc4dNo
         Oc5H/Fw3f02bxgayAQSy2CILmKvCHSWgA3tQEJYa12cZMrl/1O2/jkg2OCzH7k0ZEJmJ
         WkzLLplqGGjLkBBkzDg1rl88zVEsQrNbCZ/Nv9xyo+mP8QFZKjS9fQpea0yb0sP6gM7r
         wK6XxvE88Q0UevyasnmQdzUgMGaM7CE7OmKIBi1R1RrqGcFL/INURT5ckZFWw8qEx04i
         3XOpyM5GauyJ2f6oxkOmWliw1BPUsxGJ/C4lspQ8z3CvKNS3fKqhFozqNsyCjjVbcKud
         yHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743560; x=1724348360;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLQlJKBqT4/VzYmf9VfZ8u93RL60RGH7yZrLYBcRMXE=;
        b=jZKlzVAgVvIkynheI6RrWgdDylMHoEmZ1yMB5Tu18Xz0f0m/FXQXdDkeV8ZM2ulyYm
         9ciC7tG+mP6kjptxOYp6MB23qfmvyPTLIsmYkGoD8luFf87KHMfrAM6mFIHdlaLrpnk8
         pnEivUSjYcaz4sYLZpKYmmRlKOrkC3fAw49HArVkrLdkBK4l5hxsi6sktTTBGWiCmDKe
         4YFTXzcBCREpj7xijIxvGQ9DrjfrN9lmn4NlljRxWHX/LbDtaGS3G++R2hJyyS9xlnLz
         LbBFc3jw7R/VnPJxFl8iREr7xziwqhUFLKoZ0CSeuprN9qlCBhkF6Y//2us43LA4cPX9
         Cq5w==
X-Forwarded-Encrypted: i=1; AJvYcCUjp198jsaGuq0zPIOZH1ypECsGT9xkNWztwPMww0M/4LVcAF/3WFvd08gyKSEgu1VAMalue1fZjSAF52S6WCXXfYyak3Q=
X-Gm-Message-State: AOJu0YyCKE0Vg8s4aMTq2zK5gj9Hye5flbNXEL/nBbRLlGHNYyVkKaVu
	I39OyPfdjX/R0f35clYCo28XGwMfxioZwVA62VhuLV9/aeKF9SVZaxp2bI0iVtRYjKesAE5Ew3c
	2YoQ6Ktybl3jcdonDkh2Qx49IeA==
X-Google-Smtp-Source: AGHT+IE1twvMiJGv9A9PF3ykXAMYl/52O8nOi2sdu4GF15yrKLi7qKJGQ8IRVIMXcNpJkBrcc/J9f+3K3535R6ZKioE=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:5ec5:0:b0:760:76b9:ade9 with SMTP
 id 41be03b00d2f7-7c9791e4e77mr64a12.1.1723743560144; Thu, 15 Aug 2024
 10:39:20 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:08 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4474; i=samitolvanen@google.com;
 h=from:subject; bh=Ahmj2O3IR+LSl3BiA52xKx3B/l6T0r/Fo4+Nt8cR26I=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj04aOj8csDviqueJ1eEjKR7eZPwgInAwuFoD
 5HAQqspMuCJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49OAAKCRBMtfaEi7xW
 7lcUC/9O1P8fFLBUCeOT4Cxm+rBpUW5+73RlFMMG8H+bGc4TSk35d91Su3NehrxYKKU/pT/PVPk
 DjVOLzLc8vrfvwl1Nt2wQ3EvSJwZZ2eqYER+zrUZkPmdpOjiOYowuBi+VOGnihjQZx8uQsuLUt7
 zhIE6Y174Min92jA8j8LDjo3zgA5McorGyWANE2Ma2NOssLU4RB3vC9Cv2K0cJXR5QuckfadlW/
 H8vQ6BvRvS05m2JGRSjmSdBZFGPGjJQ6ED/BTajeja7EOvAH4yaTiejmibxBkkf24sQYGkJtIFd
 9JRGxIuuBDftKiPVQh0Oy5oK7Bp85TJ10jeczHneuITdV9P5glF6Y93MaLFT/zfIHRIna8eMMht
 pCs8UVnoc1wLnWExqcs3Q+pdqBXsMgfk0hGBoCKsZS1ot/5/0WRepl1NmMVX+hWHaY52dKgGU/K pA+68yDFF6TmIwfEZNO90AOtKj3WGCZWGirLJ7+tlFKpTSC07C7XYKELv14DkFgF8HGFQ=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-25-samitolvanen@google.com>
Subject: [PATCH v2 04/19] gendwarfksyms: Add support for type pointers
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

The compiler may choose not to emit type information in DWARF for
external symbols. Clang, for example, does this for symbols not
defined in the current TU.

To provide a way to work around this issue, add support for
__gendwarfksyms_ptr_<symbol> pointers that force the compiler to emit
the necessary type information in DWARF also for the missing symbols.

Example usage:

  #define GENDWARFKSYMS_PTR(sym) \
      static typeof(sym) *__gendwarfksyms_ptr_##sym __used  \
          __section(".discard.gendwarfksyms") = &sym;

  extern int external_symbol(void);
  GENDWARFKSYMS_PTR(external_symbol);

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/dwarf.c         | 26 +++++++++++++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h |  6 ++++++
 scripts/gendwarfksyms/symbols.c       | 16 ++++++++++++++++
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 71cfab0553da..956b30224316 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -94,6 +94,28 @@ static int process_variable(struct state *state, Dwarf_Die *die)
 	return check(process(state, "variable;\n"));
 }
 
+static int process_symbol_ptr(struct state *state, Dwarf_Die *die)
+{
+	Dwarf_Die ptr_type;
+	Dwarf_Die type;
+
+	if (!get_ref_die_attr(die, DW_AT_type, &ptr_type) ||
+	    dwarf_tag(&ptr_type) != DW_TAG_pointer_type) {
+		error("%s must be a pointer type!", get_name(die));
+		return -1;
+	}
+
+	if (!get_ref_die_attr(&ptr_type, DW_AT_type, &type)) {
+		error("%s pointer missing a type attribute?", get_name(die));
+		return -1;
+	}
+
+	if (dwarf_tag(&type) == DW_TAG_subroutine_type)
+		return check(process_subprogram(state, &type));
+	else
+		return check(process_variable(state, &ptr_type));
+}
+
 static int process_exported_symbols(struct state *state, Dwarf_Die *die)
 {
 	int tag = dwarf_tag(die);
@@ -114,7 +136,9 @@ static int process_exported_symbols(struct state *state, Dwarf_Die *die)
 
 		debug("%s", state->sym->name);
 
-		if (tag == DW_TAG_subprogram)
+		if (is_symbol_ptr(get_name(&state->die)))
+			check(process_symbol_ptr(state, &state->die));
+		else if (tag == DW_TAG_subprogram)
 			check(process_subprogram(state, &state->die));
 		else
 			check(process_variable(state, &state->die));
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index cb9106dfddb9..8f6acd1b8f8f 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -61,6 +61,11 @@ extern bool debug;
 /*
  * symbols.c
  */
+
+/* See symbols.c:is_symbol_ptr */
+#define SYMBOL_PTR_PREFIX "__gendwarfksyms_ptr_"
+#define SYMBOL_PTR_PREFIX_LEN (sizeof(SYMBOL_PTR_PREFIX) - 1)
+
 struct symbol_addr {
 	uint32_t section;
 	Elf64_Addr address;
@@ -78,6 +83,7 @@ struct symbol {
 	struct hlist_node name_hash;
 };
 
+extern bool is_symbol_ptr(const char *name);
 extern int symbol_read_exports(FILE *file);
 extern int symbol_read_symtab(int fd);
 extern struct symbol *symbol_get(const char *name);
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index f96acb941196..d6d016458ae1 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -41,6 +41,20 @@ static int __for_each_addr(struct symbol *sym, symbol_callback_t func,
 	return processed;
 }
 
+/*
+ * For symbols without debugging information (e.g. symbols defined in other
+ * TUs), we also match __gendwarfksyms_ptr_<symbol_name> symbols, which the
+ * kernel uses to ensure type information is present in the TU that exports
+ * the symbol. A __gendwarfksyms_ptr pointer must have the same type as the
+ * exported symbol, e.g.:
+ *
+ *   typeof(symname) *__gendwarf_ptr_symname = &symname;
+ */
+bool is_symbol_ptr(const char *name)
+{
+	return name && !strncmp(name, SYMBOL_PTR_PREFIX, SYMBOL_PTR_PREFIX_LEN);
+}
+
 static int for_each(const char *name, bool name_only, symbol_callback_t func,
 		    void *data)
 {
@@ -49,6 +63,8 @@ static int for_each(const char *name, bool name_only, symbol_callback_t func,
 
 	if (!name || !*name)
 		return 0;
+	if (is_symbol_ptr(name))
+		name += SYMBOL_PTR_PREFIX_LEN;
 
 	hash_for_each_possible_safe(symbol_names, match, tmp, name_hash,
 				    name_hash(name)) {
-- 
2.46.0.184.g6999bdac58-goog

