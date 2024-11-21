Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341501DDC16
	for <asahi@lists.linux.dev>; Thu, 21 Nov 2024 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732221769; cv=none; b=foMBF0Es3+eapa5FVbv2qgmlcdShudju06ZVk+pdpOjqro6ptGYIz5qRHN3z73aWt397MPdDa2SpOV/0+F+uK6JF6H9lfG+xPPZaoBxvBdsr22oScORXrq0mAmnjFcWn7sAdEfxG/mnzeabqzeF2S1wwBl0df7VxfSit8a6gpws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732221769; c=relaxed/simple;
	bh=K2ie+K5BAHLttox7QOvj2Jlq5yVsu82vs8hCoTiovzM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=htM7aRdR3kQivr/pAjrOXb020SF/p27CjrVK8+CdMqT8muxouTflQ5TT2B5tVtBDcd9D7mjxV4xtxRLPOavk9UL82tDpMZzpEgwgmKplaoWDhCMp9H2EpkDC8LLFJ0OhcLAjk5jgaxljWNPxVFVUvjm9LCKK+ci8ofluEh+BBgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tm3NtPWA; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tm3NtPWA"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7fb966ee0cdso1007237a12.1
        for <asahi@lists.linux.dev>; Thu, 21 Nov 2024 12:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732221766; x=1732826566; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R5PScQuWHy6DjhROn8PczIndaWix8yzkVmRsn1uGhjo=;
        b=tm3NtPWA4PwJ/eXGqDI7BOqmp9f7zmNdElR7Wxv6RzDf7RKSPGLksmkn+onShfDi/C
         En26vWCAaqlETZ5tNofRogWmRhd17pNM42XshKSeUF5wU+wMT/kEzjP6G6evk9idr3Xf
         +7PhB85mm39QVwEb8oECLAKk9z40e23HdXwfqiuWnopoGXNPIsx8AohDuDy8HXqSqpbT
         4CZjkikAPYJLrD4jMFtrpDTktPB0x3BBUict97M0i+vwuNCXr1gwc0DQwOPk0GMFqbJe
         C2fwb/5PNocJ6C24gzOZhjBI2Bbyn6gahvaEH+n0yM0XDhk7VKzheFk8aBECPhiJDLRg
         oDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732221766; x=1732826566;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5PScQuWHy6DjhROn8PczIndaWix8yzkVmRsn1uGhjo=;
        b=u/kB/nSltQ5ehXwo+zUxPMVAoiJFFBloCNNjNyN9kQ31WR/ljE2uWpuvo2RIQcZCoL
         tz85Fts9ryS7J9uocgk/GnJSnO3MRG/xrFq6Kaohy7lvCgfewhY8DSLkZy7W5U9HVkUg
         CAWGQk1xUL9EA/FL6YZtQDPIEvD0Z7XHKvIhgPRg/a9jEoLS4GQ+JlmdMrhlvRMxu6Pn
         XEjGnBIlpJ7uqkSehrCv5io6JYP2O7Ao3Sy/uCc6iLdDeSh5tD3rHDEtB0VxgyZetnSG
         A6UOhbR0moUhhCq6unFsnwF6nov+AdTgvTkt02xpWkvnv7irxYBUJI6zKj3vU5m5ef/l
         2uSg==
X-Forwarded-Encrypted: i=1; AJvYcCXzswQ/ZccvAAd1XQzLlsGqdUec2dAhjqpSUNSTXXxPHk0f3yZYfmuaGJDwfQVnFzHsYZTSCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOekZaRyEaJC8UHPzzVuiTDIoL1byRt/re6lFDdhFQ68YfYqw9
	FXsEJecVmyDLZ2VS4p1fzmU4H/i/0t/ExUZLBm07nqCA2f3CfczETTUieh6ZPuuSq3C5HLVhXvf
	g/0cnSDBcZ3GT00SjYRCxhyyh0g==
X-Google-Smtp-Source: AGHT+IF3193DVDNoTowEC34YpIeXHuT6+LHh9FOvMUqYp9Gv+NbxW05RZWgElbfmVyDREsBBIVfSTX89nLZeLEUq1k0=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:5921:0:b0:7ea:68e2:176b with SMTP
 id 41be03b00d2f7-7fbb44ac1d9mr2886a12.1.1732221766514; Thu, 21 Nov 2024
 12:42:46 -0800 (PST)
Date: Thu, 21 Nov 2024 20:42:27 +0000
In-Reply-To: <20241121204220.2378181-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5759; i=samitolvanen@google.com;
 h=from:subject; bh=K2ie+K5BAHLttox7QOvj2Jlq5yVsu82vs8hCoTiovzM=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOn2s/UrKq3LtlTGmF/emH9nRrDQ6s2nEss3Na59sfTFl
 F/rT70x7ShlYRDjYJAVU2Rp+bp66+7vTqmvPhdJwMxhZQIZwsDFKQA3mYPhf4iKpIT7us+O4txT
 RX13HsrRvr5+Z+1uZ5u7088WqdyM/8XIsO2zf07YmwCeio5fnzMlOA/fMo78MuWWk1ylzZkeqXv JPAA=
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241121204220.2378181-26-samitolvanen@google.com>
Subject: [PATCH v6 06/18] gendwarfksyms: Expand subroutine_type
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
index a6b9a697bb17..39bdc9e121b5 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -65,6 +65,7 @@ extern int dump_dies;
 #define checkp(expr) __check(expr, __res < 0)
 
 /* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_formal_parameter_type DW_TAG_formal_parameter
 #define DW_TAG_typedef_type DW_TAG_typedef
 
 /*
@@ -159,6 +160,9 @@ void die_map_free(void);
 struct state {
 	struct symbol *sym;
 	Dwarf_Die die;
+
+	/* List expansion */
+	bool first_list_item;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.47.0.371.ga323438b13-goog

