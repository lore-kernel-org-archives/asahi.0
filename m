Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FD51A2878
	for <asahi@lists.linux.dev>; Mon, 23 Sep 2024 18:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115563; cv=none; b=EdawM13hsqBktATdAZhkeQD+nCNkiEe3JPCFkINfDNE/ZU26WQi+ylnB8mT2oHVc+p3NZMvh48gA4BoTOFbjISm3pYmZGVmtRVKxkrRl57RnXGi4vHREmKJEP7gmE49tPtnNICW99pfWm5WwQzgQxkib7N8mXz6JghwWNJsrl/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115563; c=relaxed/simple;
	bh=YnxRLubYaRu5LmAQuXzMlCDLmcU4MfVwQeLF/vCiIvY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jz3Wi7WMZQyxkPWhqpt5qekZcPnu9zqya1DAd4PjBgBeaST44RWP0+8uEXuw9YDG4nI4Iq+oq2veudbqY7oWDfWz3jtz/HjFbWSFzNLfmFUxWU+hzf+UumKmv5JpJY/H90YwPaTgnRYBAbhMErO0hMNfAvx0Wn/idkPDFjq/4pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eU+GXB/7; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eU+GXB/7"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7c6a9c1a9b8so2772764a12.0
        for <asahi@lists.linux.dev>; Mon, 23 Sep 2024 11:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115560; x=1727720360; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0QY5Hy6t2hyco5Zb7/L0lbrSBcXnpHdZW8dyGEzKIpI=;
        b=eU+GXB/7l3uoAeAuJwxrIaPCpg1Hc7z54F/1yZxZT9m5HxqD3lzSiKuHj6oZfFLjbc
         lD7FLLz3kkvDDs9FhiOFgaNmenHvd99z0AZe93gqZN6GnfsFNh8y7JJctUOV1JSfFt6x
         rGdYrJy7x6E/VHKlgPwS5sJZUjRzCQ5gxk752wLL7NeFkPVPgHDBn0tDwFvPl5Lf8Esh
         51okGuSsN61wt0j90GTsmEU/KdvA0A9oxtw7VlvAtXAbQ98KlzVMDVz81HESXWEwIWxw
         rWKQBhDiPan9ZU6oGQ4CKRWzaQVybEaagJyrBdXBlUVAiugFRyPrd6+X7gJRMfdQwF/L
         tc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115560; x=1727720360;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0QY5Hy6t2hyco5Zb7/L0lbrSBcXnpHdZW8dyGEzKIpI=;
        b=a7x7W0dmur4uqSyMuP2x9hM7ZXzDrmoLmO9JYnHmk1r8Sp2pl9a2Y7bt/k0OO7vNna
         koviHBuDQID9u0AJttiF8oEHkLfIxZnbkPY08IMQTZTQ6TPqfsrDp27dm3W5LsKYKCqm
         WrM4YRPhj27SEZ5qRCfUZe7RvVAqppD3AK9U2yA0vzl4W9JqDQiTnUeyTiQtFlAPaQgM
         iAHc4Mnt6EMj3ueBz/Ll1UhOrx94zHUrZvfqz1uKeS8n0Dawc/bnW73pRobRhfsRyURU
         KIX06XpMp4/nYKR6bknQo+8C/O4Dwhc4/RLEkXGXk4n/0mK2HBh6d10xdZ+bV2Yvm60u
         MrWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSM/xWpL7YCVL5CY81UzrmdHyOEVcXqN3q/lFFOXNAsFiZMTZF0N72gjX3km8P+EUp0ec7pA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhC24ED4nbh0H7sd+Ov9IhrXGNqgVURv/87qYFetFy9R+Q1vtw
	G/l2irCOtTVeTgdXsorUzVCXtqnyo/wslm8nc6oOLGPJpiGL2tHSBKni6hFFWTAgAHEcKozCbU1
	lK5ZSWOw0SKcjT87sAq87kU/FtA==
X-Google-Smtp-Source: AGHT+IF/yPm3Q7gCKUFaoUWev9k41igxQNUBQ8slxggC77S4yv3VXQoOTiBlJiL8f1t8waF428RuZmoZyGvu8Yp1D1o=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:b254:0:b0:7db:16b4:7a2a with SMTP
 id 41be03b00d2f7-7dcd3c474ebmr12955a12.2.1727115560447; Mon, 23 Sep 2024
 11:19:20 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:18:54 +0000
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5712; i=samitolvanen@google.com;
 h=from:subject; bh=YnxRLubYaRu5LmAQuXzMlCDLmcU4MfVwQeLF/vCiIvY=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN3L1la67YPFtm47e9Yi7NkxCfamzy4XMLl5lj5m9K
 /rKixeLOkpZGMQ4GGTFFFlavq7euvu7U+qrz0USMHNYmUCGMHBxCsBE5r9nZNj8/vKiVccm/U9+
 vSH6zSWe6dpHn4hdKnzyTGDmnadP9eYbMDJ8stzpP0lousu3Q983X/VX5Gp0Fm4uvLfoveO/3H0 7CyUZAQ==
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-30-samitolvanen@google.com>
Subject: [PATCH v3 08/20] gendwarfksyms: Expand subroutine_type
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

Add support for expanding DW_TAG_subroutine_type and the parameters
in DW_TAG_formal_parameter. Use this to also expand subprograms.

Example output with --dump-dies:

  subprogram (
    formal_parameter pointer_type {
      const_type {
        base_type char byte_size(1) encoding(6)
      }
    }
  )
  -> base_type unsigned long byte_size(8) encoding(7)

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/dwarf.c         | 84 ++++++++++++++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h |  4 ++
 2 files changed, 85 insertions(+), 3 deletions(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 50ef58591c83..5bdab5b80ca2 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -209,6 +209,15 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
 
+/* Match functions -- die_match_callback_t */
+#define DEFINE_MATCH(type)                                     \
+	static bool match_##type##_type(Dwarf_Die *die)        \
+	{                                                      \
+		return dwarf_tag(die) == DW_TAG_##type##_type; \
+	}
+
+DEFINE_MATCH(formal_parameter)
+
 bool match_all(Dwarf_Die *die)
 {
 	return true;
@@ -221,19 +230,28 @@ int process_die_container(struct state *state, struct die *cache,
 	Dwarf_Die current;
 	int res;
 
+	/* Track the first item in lists. */
+	if (state)
+		state->first_list_item = true;
+
 	res = checkp(dwarf_child(die, &current));
 	while (!res) {
 		if (match(&current)) {
 			/* <0 = error, 0 = continue, >0 = stop */
 			res = checkp(func(state, cache, &current));
 			if (res)
-				return res;
+				goto out;
 		}
 
 		res = checkp(dwarf_siblingof(&current, &current));
 	}
 
-	return 0;
+	res = 0;
+out:
+	if (state)
+		state->first_list_item = false;
+
+	return res;
 }
 
 static int process_type(struct state *state, struct die *parent,
@@ -253,6 +271,40 @@ static void process_type_attr(struct state *state, struct die *cache,
 	process(cache, "base_type void");
 }
 
+static void process_list_comma(struct state *state, struct die *cache)
+{
+	if (state->first_list_item) {
+		state->first_list_item = false;
+	} else {
+		process(cache, " ,");
+		process_linebreak(cache, 0);
+	}
+}
+
+/* Comma-separated with DW_AT_type */
+static void __process_list_type(struct state *state, struct die *cache,
+				Dwarf_Die *die, const char *type)
+{
+	const char *name = get_name_attr(die);
+
+	process_list_comma(state, cache);
+	process(cache, type);
+	process_type_attr(state, cache, die);
+	if (name) {
+		process(cache, " ");
+		process(cache, name);
+	}
+}
+
+#define DEFINE_PROCESS_LIST_TYPE(type)                                       \
+	static void process_##type##_type(struct state *state,               \
+					  struct die *cache, Dwarf_Die *die) \
+	{                                                                    \
+		__process_list_type(state, cache, die, #type " ");           \
+	}
+
+DEFINE_PROCESS_LIST_TYPE(formal_parameter)
+
 /* Container types with DW_AT_type */
 static void __process_type(struct state *state, struct die *cache,
 			   Dwarf_Die *die, const char *type)
@@ -287,6 +339,29 @@ DEFINE_PROCESS_TYPE(shared)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
+static void __process_subroutine_type(struct state *state, struct die *cache,
+				      Dwarf_Die *die, const char *type)
+{
+	process(cache, type);
+	process(cache, " (");
+	process_linebreak(cache, 1);
+	/* Parameters */
+	check(process_die_container(state, cache, die, process_type,
+				    match_formal_parameter_type));
+	process_linebreak(cache, -1);
+	process(cache, ")");
+	process_linebreak(cache, 0);
+	/* Return type */
+	process(cache, "-> ");
+	process_type_attr(state, cache, die);
+}
+
+static void process_subroutine_type(struct state *state, struct die *cache,
+				    Dwarf_Die *die)
+{
+	__process_subroutine_type(state, cache, die, "subroutine_type");
+}
+
 static void process_base_type(struct state *state, struct die *cache,
 			      Dwarf_Die *die)
 {
@@ -357,8 +432,11 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	PROCESS_TYPE(rvalue_reference)
 	PROCESS_TYPE(shared)
 	PROCESS_TYPE(volatile)
+	/* Subtypes */
+	PROCESS_TYPE(formal_parameter)
 	/* Other types */
 	PROCESS_TYPE(base)
+	PROCESS_TYPE(subroutine)
 	PROCESS_TYPE(typedef)
 	default:
 		debug("unimplemented type: %x", tag);
@@ -388,7 +466,7 @@ static void process_symbol(struct state *state, Dwarf_Die *die,
 static int __process_subprogram(struct state *state, struct die *cache,
 				Dwarf_Die *die)
 {
-	process(cache, "subprogram");
+	__process_subroutine_type(state, cache, die, "subprogram");
 	return 0;
 }
 
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 81b8989efa22..d5186472f705 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -63,6 +63,7 @@ extern int dump_dies;
 #define checkp(expr) __check(expr, __res < 0)
 
 /* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_formal_parameter_type DW_TAG_formal_parameter
 #define DW_TAG_typedef_type DW_TAG_typedef
 
 /*
@@ -155,6 +156,9 @@ void die_map_free(void);
 struct state {
 	struct symbol *sym;
 	Dwarf_Die die;
+
+	/* List expansion */
+	bool first_list_item;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.46.0.792.g87dc391469-goog

