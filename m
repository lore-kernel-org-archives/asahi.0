Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A2513AD11
	for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 17:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743568; cv=none; b=I2C++lfdjQ1jGGG/3vqjbHlnbr+Iw4EefX4QOQXssv07ScNBbGhIOZh6xyrakkMa7pwJ3Ir5LlFaApYRjldZHpQS9knGxniRax8G9yVfbkpf69te52tHDwZ5GznE2U1spXE8RfU6G4uDrnZ1IHQQkyTM4S3Tl1pUKgyp1Nr6zpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743568; c=relaxed/simple;
	bh=pw/HqpAceG9KZJncGvbm0Tc+Y0NR2BksFQva9OpCIyo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HhWm+T/bBB4vJGRXAmKwR9UNXo5vEh+0dRraRSNEBXDWfLaREQbKKjDZubAfbAwy+z3jJBEtEip7eT92lhZ/nKKEAEhtGVv3L8l05CG8j0mcwbMiT5pNZH9/DegRcjP0kKj0P8r/vSltso7yyLnuaeXmfexkUkQSiAHPHO1ZYaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tk/XtdDL; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tk/XtdDL"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7bc8bb2f6f5so994795a12.0
        for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 10:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743566; x=1724348366; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sqbrGwhfvS/o9WkR63NSSG+3ggv2pfYWpb4R8IiMfJY=;
        b=tk/XtdDLlANUsG0ksBuzGbaNLJiPIELaGOSylru746Od1rjOf/NuU7WxQoR7knDDmb
         zn3eQFpJfhiR8HLMSvnOMx7f+g279haUgRi8ugRNhFccHkqrPz9SFRrQk4V9CC9zhQhv
         OQXlMfyV9Em1Dff/DdoA1fWZqDTYfrEgh8bqI+5fE+ox7R6z8guGZ0+Cstx5e1XSbE56
         ze9RZNMx//RQNaNCLPN/YOkULK4QmWHhTtfddmb0yxXVBCbW9Pf3LbU5ocPYKhbWrJM5
         KKGpOya3zsibfFkmvzQCKub30VLuCGlMbpzSCgjFKE5n+AGR2A66tcQ4m0GILzCUd1SS
         aeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743566; x=1724348366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqbrGwhfvS/o9WkR63NSSG+3ggv2pfYWpb4R8IiMfJY=;
        b=c6vkC0hQ6y5mTKrtPKd5j+YAlMI1rPis9g+8L9Eed6ml6IQ8+uBkHj8e504RkCAGnR
         O1sNMRkfKgqp1p4r++cLf5lPbessOUL3L0dz16WMScFPcF3GywFZ9i7IYBEoMP8732hv
         poqliZcCy1gwi2EBrzW/7hM66lCn1qOJF5gb6+uMhquzP0G5Bye/1jPFr6Hkq2PrmcPB
         nYa8zxbCjtphMz99aYwSZwLD6V9xMywGAHE8JPYgtyJmtTihjnqUttZabNxzBF3581oF
         40hTxe/GLptmgHhwY/KDn3M9ZiGezrgHHED38czlsdB4Uzrau/LZaFnwAoY8I6trNDPJ
         T09Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVecVoOQYddM3KuybQ7BW0c+OsDfnoYfq9Pe94BxCgz2MEvjb8o7Gl5k+H33+MS3Xcjd8C9dmigffcIv8zaOzAMzCgUF8=
X-Gm-Message-State: AOJu0YyHUD4EVzFm9/y0iUznAbwziEbi6bABg1wOoAeX2re8aJa+yZop
	tOZ5JXFm4uDvNNwo2efhKaOWaYM6tHDYyvTpIFPN/PRgIB/7pqvndNj4lJVTV4w/+2YyDbzIjie
	Gw1g7YRZ6LMhOPyKkaaGp3NbEAA==
X-Google-Smtp-Source: AGHT+IEikh37+tKCQQfnwWQEfyYceqW0cvrSUqkS+CWOQoJktHenIYVMdrw9MA5y4VPH80UGrDlrydgt0ZOnnyEEye4=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a65:6712:0:b0:6ea:d240:23b0 with SMTP
 id 41be03b00d2f7-7c9796d9119mr52a12.4.1723743565745; Thu, 15 Aug 2024
 10:39:25 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:11 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=6513; i=samitolvanen@google.com;
 h=from:subject; bh=pw/HqpAceG9KZJncGvbm0Tc+Y0NR2BksFQva9OpCIyo=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj04y5MroNixYi6Q4mKYktiBZJ/foUVldN1bP
 rlslcstbPCJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49OAAKCRBMtfaEi7xW
 7twtC/9nSIzTqkeqA1dIqXL/6ZYfzQuM/gdLn/xttXn3ForrLsYhstOkf7ftk40qu3YyKnd54MH
 9/xa4HXN7B3VDiKzg6G/SbamfK1l0vFPVOvb7iSaayKYd/bP2ox0uZlRdehPiMHxdJ1Ui0VgztQ
 9+pAcpM6eUTRLkLtUf1UfJ6sHk975nEE4LH4+g1hDuQnegOvEUyYSW/JxuulltZWBsU3k2cmSOa
 GBh/DY4vlIRAhQHOK9w/HiunYEyxCgEFQWk0D2JIzQCoh5nY+jSotlHu3MUF5VJ41erIx3C3vtu
 xIfAAKUEKuF6Oxe/P9DZVP7Gskdh2r+1opz0YUk/Uv94uV3PPgwm2YH5BRf2EG8F3OqG8nKUkrg
 sY9G4A9XMnPZ71P8o5cJ+ilJOd6QcN4/GSI2X9CZBVDLqVC0n2QtD6yrOMPqFYmhCs3YuJuuDTc YRMGE4mR7Ceo4L+6BILOU74Db8LpWR2EcRaFGNUCy6YD4n7Rte4bWXGs8RBQ9IBD4nsQw=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-28-samitolvanen@google.com>
Subject: [PATCH v2 07/19] gendwarfksyms: Expand type modifiers and typedefs
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

Add support for expanding DWARF type modifiers, such as pointers,
const values etc., and typedefs. These types all have DW_AT_type
attribute pointing to the underlying type, and thus produce similar
output.

Also add linebreaks and indentation to debugging output to make it
more readable.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/die.c           | 13 +++++
 scripts/gendwarfksyms/dwarf.c         | 76 +++++++++++++++++++++++++--
 scripts/gendwarfksyms/gendwarfksyms.h |  7 ++-
 3 files changed, 92 insertions(+), 4 deletions(-)

diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
index ad6ba435d9dd..fdd52df88fdd 100644
--- a/scripts/gendwarfksyms/die.c
+++ b/scripts/gendwarfksyms/die.c
@@ -156,6 +156,19 @@ int die_map_add_string(struct die *cd, const char *str)
 	return 0;
 }
 
+int die_map_add_linebreak(struct die *cd, int linebreak)
+{
+	struct die_fragment *df;
+
+	if (!cd)
+		return 0;
+
+	check(append_item(cd, &df));
+	df->data.linebreak = linebreak;
+	df->type = LINEBREAK;
+	return 0;
+}
+
 int die_map_add_die(struct die *cd, struct die *child)
 {
 	struct die_fragment *df;
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 82b966269acd..82185737fa2a 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -5,6 +5,17 @@
 
 #include "gendwarfksyms.h"
 
+static bool do_linebreak;
+static int indentation_level;
+
+/* Line breaks and indentation for pretty-printing */
+static int process_linebreak(struct die *cache, int n)
+{
+	indentation_level += n;
+	do_linebreak = true;
+	return check(die_map_add_linebreak(cache, n));
+}
+
 #define DEFINE_GET_ATTR(attr, type)                                    \
 	static bool get_##attr##_attr(Dwarf_Die *die, unsigned int id, \
 				      type *value)                     \
@@ -65,6 +76,12 @@ static int process(struct state *state, struct die *cache, const char *s)
 {
 	s = s ?: "<null>";
 
+	if (debug && do_linebreak) {
+		fputs("\n", stderr);
+		for (int i = 0; i < indentation_level; i++)
+			fputs("  ", stderr);
+		do_linebreak = false;
+	}
 	if (debug)
 		fputs(s, stderr);
 
@@ -230,6 +247,40 @@ static int process_type_attr(struct state *state, struct die *cache,
 	return check(process(state, cache, "base_type void"));
 }
 
+/* Container types with DW_AT_type */
+static int __process_type(struct state *state, struct die *cache,
+			  Dwarf_Die *die, const char *type)
+{
+	check(process(state, cache, type));
+	check(process_fqn(state, cache, die));
+	check(process(state, cache, " {"));
+	check(process_linebreak(cache, 1));
+	check(process_type_attr(state, cache, die));
+	check(process_linebreak(cache, -1));
+	check(process(state, cache, "}"));
+	check(process_byte_size_attr(state, cache, die));
+	return check(process_alignment_attr(state, cache, die));
+}
+
+#define DEFINE_PROCESS_TYPE(type)                                           \
+	static int process_##type##_type(struct state *state,               \
+					 struct die *cache, Dwarf_Die *die) \
+	{                                                                   \
+		return __process_type(state, cache, die, #type "_type ");   \
+	}
+
+DEFINE_PROCESS_TYPE(atomic)
+DEFINE_PROCESS_TYPE(const)
+DEFINE_PROCESS_TYPE(immutable)
+DEFINE_PROCESS_TYPE(packed)
+DEFINE_PROCESS_TYPE(pointer)
+DEFINE_PROCESS_TYPE(reference)
+DEFINE_PROCESS_TYPE(restrict)
+DEFINE_PROCESS_TYPE(rvalue_reference)
+DEFINE_PROCESS_TYPE(shared)
+DEFINE_PROCESS_TYPE(volatile)
+DEFINE_PROCESS_TYPE(typedef)
+
 static int process_base_type(struct state *state, struct die *cache,
 			     Dwarf_Die *die)
 {
@@ -251,6 +302,9 @@ static int process_cached(struct state *state, struct die *cache,
 		case STRING:
 			check(process(state, NULL, df->data.str));
 			break;
+		case LINEBREAK:
+			check(process_linebreak(NULL, df->data.linebreak));
+			break;
 		case DIE:
 			if (!dwarf_die_addr_die(state->dbg,
 						(void *)df->data.addr,
@@ -270,6 +324,11 @@ static int process_cached(struct state *state, struct die *cache,
 	return 0;
 }
 
+#define PROCESS_TYPE(type)                                       \
+	case DW_TAG_##type##_type:                               \
+		check(process_##type##_type(state, cache, die)); \
+		break;
+
 static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 {
 	struct die *cache = NULL;
@@ -288,9 +347,20 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	}
 
 	switch (tag) {
-	case DW_TAG_base_type:
-		check(process_base_type(state, cache, die));
-		break;
+	/* Type modifiers */
+	PROCESS_TYPE(atomic)
+	PROCESS_TYPE(const)
+	PROCESS_TYPE(immutable)
+	PROCESS_TYPE(packed)
+	PROCESS_TYPE(pointer)
+	PROCESS_TYPE(reference)
+	PROCESS_TYPE(restrict)
+	PROCESS_TYPE(rvalue_reference)
+	PROCESS_TYPE(shared)
+	PROCESS_TYPE(volatile)
+	/* Other types */
+	PROCESS_TYPE(base)
+	PROCESS_TYPE(typedef)
 	default:
 		debug("unimplemented type: %x", tag);
 		break;
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index b280acceb114..e8b4da0fc9a8 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -58,6 +58,9 @@ extern bool debug;
 /* Error == negative values */
 #define checkp(expr) __check(expr, __res < 0, __res)
 
+/* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_typedef_type DW_TAG_typedef
+
 /*
  * symbols.c
  */
@@ -98,12 +101,13 @@ extern struct symbol *symbol_get(const char *name);
  */
 
 enum die_state { INCOMPLETE, COMPLETE, LAST = COMPLETE };
-enum die_fragment_type { EMPTY, STRING, DIE };
+enum die_fragment_type { EMPTY, STRING, LINEBREAK, DIE };
 
 struct die_fragment {
 	enum die_fragment_type type;
 	union {
 		char *str;
+		int linebreak;
 		uintptr_t addr;
 	} data;
 	struct die_fragment *next;
@@ -136,6 +140,7 @@ extern int __die_map_get(uintptr_t addr, enum die_state state,
 			 struct die **res);
 extern int die_map_get(Dwarf_Die *die, enum die_state state, struct die **res);
 extern int die_map_add_string(struct die *pd, const char *str);
+extern int die_map_add_linebreak(struct die *pd, int linebreak);
 extern int die_map_add_die(struct die *pd, struct die *child);
 extern void die_map_free(void);
 
-- 
2.46.0.184.g6999bdac58-goog

