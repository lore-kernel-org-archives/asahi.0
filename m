Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268E5228022
	for <asahi@lists.linux.dev>; Wed, 30 Oct 2024 17:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307700; cv=none; b=PhLD0XbidZpY2pnT7JNZu7Q6MzvpFwXPnR2awEiNWMdlSmpcpxk3K0fFpitJv2F+Ui2Ri30HAJjuKlqzPX1lY+xzaJLR8z9fQKLvoVzCY6XYQwZfe1EddIfrd9tyd9F35N1ONbpg4TQ4llKpfX7/ITI2osTqEEAg0Hb37WQdKxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307700; c=relaxed/simple;
	bh=xIC33Ds3wrL8SIvJ8KBatwbWfEydHQpWtWqC0C2qx6s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YLutGcM8PyGROy5r1505qcH/rQFxSJCPNHUlx0P3vcdOuEothP4+FCEwvEiFOE4La5nBTL8qWZ7bV9Z12ugXSwBNVFhFrJu66N/E+x3XoZTriPYFOTtiakQrbiWx4iWR+apl0Pqh/2EPlKe0Gph9VVnl3kEYIZRL1jjWvOGWjLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=osY7xnUq; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="osY7xnUq"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e321d26b38so111579807b3.2
        for <asahi@lists.linux.dev>; Wed, 30 Oct 2024 10:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307695; x=1730912495; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1YBwsUDgAdTeQCLcgQc+Qk068GyPLXcdvsLeO9HYQh0=;
        b=osY7xnUqJeZEtBVtz5riwadjHE9Jeli46dw8j4paSIv5uEt1NAoM5EQld2VOP6s/k+
         LbWkexFynshrLkR025p28pj2dSvo0Il1lYAr01I/cEaSVUWFr+QQ7LzwW9pmM7RhmSha
         O2/oyALOIhLpXTBfKGfDX2XWmCCNiWACM3CYRTEhY2nVUCJHigmwCszv+lcDd20h85SK
         5InoqgI8e4D5xsguHG8kqemHaunQ/VaCCmKfl7JhR3rnNHdtMVWGaHhiGBsy+Qir88e6
         W2htdYisjwttZg4+aXZZgMOgvZaZ+CveliEdLToIqeb5w24H67jPlMmfHIMh8hVS0jG6
         Xkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307695; x=1730912495;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1YBwsUDgAdTeQCLcgQc+Qk068GyPLXcdvsLeO9HYQh0=;
        b=VJfU2YicEEce/G13zgG+4Y/A8FWsMzFCXVa3V/BJyfqKvMUCV2Cj7reQJdU2W0XZft
         NBBcTRWEBH5rRtE3ZwIHI4eEZY0D9dNZkXt5Ue2qWykK7c62NZTxh47B8/aAQkbJxk7E
         nilz6YHykFi3b0Zogw8DTcAhMjn1fmAlDrQMwREq5EcRtoW6iK3qnJHCA0c6TAEyZnxf
         u+qE6xDCanIQ3CzTkJHj8DIEtNHimOdxmSuYO5lqCtz1ogO5haKoqIMJuoPsU1BTQPO6
         2+gHQdJ7lge3spE2uNiHDh3xuimcKbpC1pwXNF8UgfVO60xkjDSky/P3hCDNMW3MIYU+
         dpDg==
X-Forwarded-Encrypted: i=1; AJvYcCWRVpEJ7dU2+c0Ymc6pK5Zoai3toW1AtPX+SGQNJEggWPMP/L1uFh90GwyaD7bxjC5gIIzXtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwJiRsbKYgbnkigP2LDNbajNkWuOh7AIimE7FJnABu5scN+fz+
	o+f2Q5nSyhOA+DzY4HkauMzBM5bkig1uPZSYw5hiUko+eHVxjIuqLe9VN2h6FhaFRxefp0V3eze
	9i40sxtVCYb+6YdlQnJBZ8AuVJQ==
X-Google-Smtp-Source: AGHT+IE5N4F+yBKgAiGWwpIZX+v9/JaGuSiuwDTn5vO4PPtFOZwMpFGYjEvGwDPhlJdza5xz+VoXNAcDPdUeiIdM2wo=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:ab43:0:b0:e28:fc1b:66bb with SMTP
 id 3f1490d57ef6-e30e5b33241mr64276.6.1730307695222; Wed, 30 Oct 2024 10:01:35
 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:14 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5798; i=samitolvanen@google.com;
 h=from:subject; bh=xIC33Ds3wrL8SIvJ8KBatwbWfEydHQpWtWqC0C2qx6s=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKaWH33//oqv/7Ra7uz4kFO377/7IqSVBQnqG2VeKnU
 tr/fxrHOkpZGMQ4GGTFFFlavq7euvu7U+qrz0USMHNYmUCGMHBxCsBETNkYGSbMZY9K9pnCfHvp
 1hZ7/qIl/SvPlTqXGHe5Frz0FihfxM7IcOPgZ8nTt4I69zdeKd72da20umP4Q1XBrQcke+bJ+dV xMgEA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-28-samitolvanen@google.com>
Subject: [PATCH v5 07/19] gendwarfksyms: Expand subroutine_type
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
Acked-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c         | 84 ++++++++++++++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h |  4 ++
 2 files changed, 85 insertions(+), 3 deletions(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 1d67ee18a388..7e6b477d7c12 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -211,6 +211,15 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
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
@@ -223,19 +232,28 @@ int process_die_container(struct state *state, struct die *cache,
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
@@ -255,6 +273,40 @@ static void process_type_attr(struct state *state, struct die *cache,
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
@@ -289,6 +341,29 @@ DEFINE_PROCESS_TYPE(shared)
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
@@ -359,8 +434,11 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
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
@@ -390,7 +468,7 @@ static void process_symbol(struct state *state, Dwarf_Die *die,
 static int __process_subprogram(struct state *state, struct die *cache,
 				Dwarf_Die *die)
 {
-	process(cache, "subprogram");
+	__process_subroutine_type(state, cache, die, "subprogram");
 	return 0;
 }
 
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 206ba8e3f1a8..d01fc1488f76 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -63,6 +63,7 @@ extern int dump_dies;
 #define checkp(expr) __check(expr, __res < 0)
 
 /* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_formal_parameter_type DW_TAG_formal_parameter
 #define DW_TAG_typedef_type DW_TAG_typedef
 
 /*
@@ -157,6 +158,9 @@ void die_map_free(void);
 struct state {
 	struct symbol *sym;
 	Dwarf_Die die;
+
+	/* List expansion */
+	bool first_list_item;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.47.0.163.g1226f6d8fa-goog

