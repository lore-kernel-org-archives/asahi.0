Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7A91DC98A
	for <asahi@lists.linux.dev>; Thu, 19 Dec 2024 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642481; cv=none; b=NWuBOVSSFSpmtjm1oTLfKyInI6pQ/5UAvK1wozpfL7GnizzUGDiHpzXvF5ikd8fNflThlFFLp/FWwdsm63kpYgih7WwlGLsfydpZX8EeXidi7n/yK9+TTvp8fRe4kHRiAMToyEbh394ZxvGYLRFp6YACjrRJDdHVR23AgdkDalY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642481; c=relaxed/simple;
	bh=buSElSaAFhyQbPke8FFMFfz7pZ/egR8VAABZIjgNK0o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qQfXqRZWi6vCRb0+CzTdAtjiGSlZoBcIInbi2As8iJkY/WDDZ52VyrpvvozQ54gTYRVn6cDvKqTP8dR69GbXkD55/DGTvAP3cKbo8FpP6b2/+8XcOnsCOhO1aPmtgEo1NRJIbaoXM2iX/KktuSNavEoz0swghwp6W/wm+TMRWDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vkfz0d8x; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vkfz0d8x"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f2a9743093so1082980a91.3
        for <asahi@lists.linux.dev>; Thu, 19 Dec 2024 13:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642479; x=1735247279; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KlBM+UoVMiu/aVYEb5JmNGVezBYswW2Sh9t+S0cH6qM=;
        b=Vkfz0d8xA0DaGgMfW/P6yMdHCJU//HfJFcMXuTq0OiLAcvYkJR1F0ctHab5huLfvS5
         zMr72IoEo2gjvRCxAT+Zg8eJxjV22H5PStFEK/xfsfowHSwh5s+6XI033I0EDdCCzBcd
         aCSfAatCPlT/kLL+oYpSUkhYzUvWNafISzyjcopGy7bfMR6bYxJIxaFZzSlBzgt317P4
         klU8pZkKjz1duFcUd/3BVX14i8EPnGBUoOzyF9mys1gyckEgeoHP2SPT282US2ga3KUt
         NmOV/VaSbkNaEnMgVtNmzbSHhcBVsOEus+ODJsN1AcQ5vTQ7q1C08Tus/4p4TNkgVz2Q
         EZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642479; x=1735247279;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KlBM+UoVMiu/aVYEb5JmNGVezBYswW2Sh9t+S0cH6qM=;
        b=ukm2krVSEUmSzoThSGKKdJ479fQ+O3mVoYXvWx9U+z+iTsFoBoAz811OFNpFxSNWEd
         P2wAvhAfYXX/vtdq127YAHDfiubuipg50mu1FMWKrrFDFC475VlrDi8L9dCWozyqiRZy
         jsKI/zRzAz5veRHAB1hml85xNJyqE4CH/VELUW0lfq1C/V5nfuCXsWG/VIdIWA7+VzSl
         kOtba06FHqzslbtmtjJniGMG/7oMplWJDMzI6PH8t8fQBPfQR2sJ45YqeT6Va0+6oNvL
         rGA3DYG5GopCZ8GXpMbLM6WzGxooIt6OFm9WPmSaFx/lHs1nF3pZ/SrOOyj2M9Ysa9SW
         QrwA==
X-Forwarded-Encrypted: i=1; AJvYcCWK+K0YVMJpM87lN+B4n7ExR8/0Wk4wTJjSRsbrRPoLpo/N4PGCHuwt/x8S11LR2tg6GYJmrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfpSLBXIHdhUbUVJwcNadlK+MXwrHF1VxdPqzT23ZANjXhsh5M
	Yl2jWm6zsWRSOR4iu3/2Qeshbs2dF050P8tZKeUcIujRygtvkVxFx+b7twL10oWkhKAsVjh5OVx
	HVK+4A/6uzRo39dEXc6SOxvYFuw==
X-Google-Smtp-Source: AGHT+IFSfZWkVsUgeZM2+bv/bDQNUAw6E73pPO8hwFTzmQfKGqBteuj8Emcx7y5sX8zEMa48boCkXnaWJG2J+Q06KzE=
X-Received: from pjbqd7.prod.google.com ([2002:a17:90b:3cc7:b0:2e5:5ffc:1c36])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:c2c7:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-2f452e1c111mr791881a91.16.1734642479012;
 Thu, 19 Dec 2024 13:07:59 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:42 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5425; i=samitolvanen@google.com;
 h=from:subject; bh=buSElSaAFhyQbPke8FFMFfz7pZ/egR8VAABZIjgNK0o=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3dJ8nn9PBZ0rjTx1O9HBga1z5zED9WbDKO7DEimzN
 XdKxyzrKGVhEONgkBVTZGn5unrr7u9Oqa8+F0nAzGFlAhnCwMUpABNZrcfIcNh6W1ew/JGnZqsy
 0tNPP2Qq5Nz5JvLeYhtXpoRzJ6c+XcTwT9f8F7PCtkrlV092JF9/E5N091jD5TRtDY5d65v6ikS aeQA=
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-25-samitolvanen@google.com>
Subject: [PATCH v7 05/18] gendwarfksyms: Expand type modifiers and typedefs
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

Add support for expanding DWARF type modifiers, such as pointers,
const values etc., and typedefs. These types all have DW_AT_type
attribute pointing to the underlying type, and thus produce similar
output.

Also add linebreaks and indentation to debugging output to make it
more readable.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/die.c           | 12 +++++
 scripts/gendwarfksyms/dwarf.c         | 67 +++++++++++++++++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.h |  5 ++
 3 files changed, 84 insertions(+)

diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
index b7d900c6a9c8..0d70e02d02b5 100644
--- a/scripts/gendwarfksyms/die.c
+++ b/scripts/gendwarfksyms/die.c
@@ -130,6 +130,18 @@ void die_map_add_string(struct die *cd, const char *str)
 	df->type = FRAGMENT_STRING;
 }
 
+void die_map_add_linebreak(struct die *cd, int linebreak)
+{
+	struct die_fragment *df;
+
+	if (!cd)
+		return;
+
+	df = append_item(cd);
+	df->data.linebreak = linebreak;
+	df->type = FRAGMENT_LINEBREAK;
+}
+
 void die_map_add_die(struct die *cd, struct die *child)
 {
 	struct die_fragment *df;
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index f40e23a547da..3e08a32b7b16 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -7,6 +7,17 @@
 #include <stdarg.h>
 #include "gendwarfksyms.h"
 
+static bool do_linebreak;
+static int indentation_level;
+
+/* Line breaks and indentation for pretty-printing */
+static void process_linebreak(struct die *cache, int n)
+{
+	indentation_level += n;
+	do_linebreak = true;
+	die_map_add_linebreak(cache, n);
+}
+
 #define DEFINE_GET_ATTR(attr, type)                                    \
 	static bool get_##attr##_attr(Dwarf_Die *die, unsigned int id, \
 				      type *value)                     \
@@ -76,6 +87,12 @@ static void process(struct die *cache, const char *s)
 {
 	s = s ?: "<null>";
 
+	if (dump_dies && do_linebreak) {
+		fputs("\n", stderr);
+		for (int i = 0; i < indentation_level; i++)
+			fputs("  ", stderr);
+		do_linebreak = false;
+	}
 	if (dump_dies)
 		fputs(s, stderr);
 
@@ -239,6 +256,40 @@ static void process_type_attr(struct state *state, struct die *cache,
 	process(cache, "base_type void");
 }
 
+/* Container types with DW_AT_type */
+static void __process_type(struct state *state, struct die *cache,
+			   Dwarf_Die *die, const char *type)
+{
+	process(cache, type);
+	process_fqn(cache, die);
+	process(cache, " {");
+	process_linebreak(cache, 1);
+	process_type_attr(state, cache, die);
+	process_linebreak(cache, -1);
+	process(cache, "}");
+	process_byte_size_attr(cache, die);
+	process_alignment_attr(cache, die);
+}
+
+#define DEFINE_PROCESS_TYPE(type)                                            \
+	static void process_##type##_type(struct state *state,               \
+					  struct die *cache, Dwarf_Die *die) \
+	{                                                                    \
+		__process_type(state, cache, die, #type "_type");            \
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
 static void process_base_type(struct state *state, struct die *cache,
 			      Dwarf_Die *die)
 {
@@ -260,6 +311,9 @@ static void process_cached(struct state *state, struct die *cache,
 		case FRAGMENT_STRING:
 			process(NULL, df->data.str);
 			break;
+		case FRAGMENT_LINEBREAK:
+			process_linebreak(NULL, df->data.linebreak);
+			break;
 		case FRAGMENT_DIE:
 			if (!dwarf_die_addr_die(dwarf_cu_getdwarf(die->cu),
 						(void *)df->data.addr, &child))
@@ -295,7 +349,20 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	}
 
 	switch (tag) {
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
 	PROCESS_TYPE(base)
+	PROCESS_TYPE(typedef)
 	default:
 		debug("unimplemented type: %x", tag);
 		break;
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 601f877bc8ca..832d05b4fc1c 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -59,6 +59,9 @@ extern int dump_dies;
 /* Error == negative values */
 #define checkp(expr) __check(expr, __res < 0)
 
+/* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_typedef_type DW_TAG_typedef
+
 /*
  * symbols.c
  */
@@ -100,6 +103,7 @@ enum die_state {
 enum die_fragment_type {
 	FRAGMENT_EMPTY,
 	FRAGMENT_STRING,
+	FRAGMENT_LINEBREAK,
 	FRAGMENT_DIE
 };
 
@@ -107,6 +111,7 @@ struct die_fragment {
 	enum die_fragment_type type;
 	union {
 		char *str;
+		int linebreak;
 		uintptr_t addr;
 	} data;
 	struct list_head list;
-- 
2.47.1.613.gc27f4b7a9f-goog

