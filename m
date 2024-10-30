Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBA221FDA4
	for <asahi@lists.linux.dev>; Wed, 30 Oct 2024 17:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307694; cv=none; b=nsumYVoPzO6N6OO/S0A2jAZ2+PH7tPbyNQ8096exZXaanz9jysINJgBvxS9LBxD92aEtY6z/95GzbUnoFH87p2ijFmfcLRKicDpzHLJld8hoIjT12lJl1xTJXN36m1MA9NCmnfzGDAey2jq4XQbusHcPCYf/uzwP1vIMX1zu0Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307694; c=relaxed/simple;
	bh=Wo0OEQkHxxzX0NwaaU5R5+dQX4Z0nVXZaE0o7DtHf2A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KXIY0kbUgvyvafacKNVBNJ6lulxL2Dt79xybYGNtGqIFlnorYL+I6GFxpLKwTclGYDQMQWj25tFbHmTe7vr3hh30Sp8cBvWIdXi/XuU7WTxV065BaCnCWXAd5ISp5gKEvPitdR/oosD4Ltl2zLyKmsSaHsBzxDVkd9v/EEPBHnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jUJQXCEj; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jUJQXCEj"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e2904d0cad0so18605276.1
        for <asahi@lists.linux.dev>; Wed, 30 Oct 2024 10:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307689; x=1730912489; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDDQK9gzGTO8/8AzorQz8Vnlzu4aOzakypzS///c8H0=;
        b=jUJQXCEjKjzPqUOI3Ue0a6KWQdIQx44W0CkM5fPlavc/z/ol/9vygWeIWR2+u1S+bb
         MkBWZYrnEsKrEy4haHYpRgzKbFhPp146+vwwJI7fxS7Bag4EGtsExW7nxbHY+uVGwvzG
         DBHfJep0NyzZe3Fuvj4VohmegQ7W1UpmFL5Utaru0tB9fIjmQezGJ04WA5RdzSUJFbv3
         vMzcBfhEz6bf2t6Z2yztLs3RfSPotOtnkCHEZs6X5pu52C6e9gzn01LGVJART7EemtQi
         uwfDnFz3lFkFZmOuAbWrdYNbFKmZ8Z68Sl0rt3oQGlhp0wkXy8J2hDQBLAAuEt6ZsUzp
         HM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307689; x=1730912489;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDDQK9gzGTO8/8AzorQz8Vnlzu4aOzakypzS///c8H0=;
        b=tRkD0LRy+i5LhD/FBPlFTGsJ/PiY9rguNlUF4t7lgi11ypdvNftIMj97eOJ2qw5CkG
         oIL8SuysN/dh3HTao8uRgP44V2UlPsUHlcP+z8+ZZ9fdiguxLzlu5P5sa4OHyoCP83sq
         7colmSnnjUlmk1OJeObN2RuTGhgipVuEjKixaadWynZlPg06WADgwUK2DKIA4vJVq8rA
         tSKBtpjYbOploW1a6qR+gQVdml7Lwozn5uf/XnUo8cCtlsryTThjn6rEeUR61GCTjxFt
         Fd6zoFFM2Sn1upJIYc4ayJ5SiSjC3N4puOainfivkFZT8LpGzskBZjCgTTzndAD4CXQ5
         70vg==
X-Forwarded-Encrypted: i=1; AJvYcCVf+ZV+IpyJlPu29bF8rLvqBz7TOtxAUD4SeAPsLyT8nvGgiAElWUK/FfHtWPnipTtL9QSBbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqWsv00A3WGc+WL3LQfJ11Vb4RERWzxSE9afTxT6zopGgOfnVr
	TwmZ0anRtgeHR5guXnlz3zDFlsdZjqoX0TAwiVLLDxty0rp5ikBJYGoBs6uyC+5vpmheqbgbK3d
	BVxx6DubdBGIJ/a+arZlyONbsjw==
X-Google-Smtp-Source: AGHT+IHlmqMrhBwvTnYMb7rM3pP7ptdZQT0cmWimUmU9JVlEXGRhzGsZmLhORg0kl4WGRTLJqtJGyHjSnDXnx5NvYgY=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:ae64:0:b0:e20:2db0:932e with SMTP
 id 3f1490d57ef6-e3087bceae0mr61952276.6.1730307688988; Wed, 30 Oct 2024
 10:01:28 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:11 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5420; i=samitolvanen@google.com;
 h=from:subject; bh=Wo0OEQkHxxzX0NwaaU5R5+dQX4Z0nVXZaE0o7DtHf2A=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKaSGZrVp20b9PuwvmWkd7ZQv9nabMFplicojxgdvmo
 3oL6+d1lLIwiHEwyIopsrR8Xb1193en1FefiyRg5rAygQxh4OIUgImcL2FkmKA0ke0P13c+e9uq
 t07M8o/vR8plPhdpfFfT/2qTQ3C6IyPDq49rIs6Vnei8dXDjF7XKi3zeR261dN12fHNBbsc14T9 yDAA=
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-25-samitolvanen@google.com>
Subject: [PATCH v5 04/19] gendwarfksyms: Expand base_type
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

Start making gendwarfksyms more useful by adding support for
expanding DW_TAG_base_type types and basic DWARF attributes.

Example:

  $ echo loops_per_jiffy | \
      scripts/gendwarfksyms/gendwarfksyms \
        --debug --dump-dies vmlinux.o
  ...
  gendwarfksyms: process_symbol: loops_per_jiffy
  variable base_type unsigned long byte_size(8) encoding(7)
  ...

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c | 159 ++++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 81df3e2ad3ae..35fd1dfeeadc 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -3,8 +3,20 @@
  * Copyright (C) 2024 Google LLC
  */
 
+#include <stdarg.h>
 #include "gendwarfksyms.h"
 
+#define DEFINE_GET_ATTR(attr, type)                                    \
+	static bool get_##attr##_attr(Dwarf_Die *die, unsigned int id, \
+				      type *value)                     \
+	{                                                              \
+		Dwarf_Attribute da;                                    \
+		return dwarf_attr(die, id, &da) &&                     \
+		       !dwarf_form##attr(&da, value);                  \
+	}
+
+DEFINE_GET_ATTR(udata, Dwarf_Word)
+
 static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
 {
 	Dwarf_Attribute da;
@@ -67,6 +79,109 @@ static void process(const char *s)
 		fputs(s, stderr);
 }
 
+#define MAX_FMT_BUFFER_SIZE 128
+
+static void process_fmt(const char *fmt, ...)
+{
+	char buf[MAX_FMT_BUFFER_SIZE];
+	va_list args;
+
+	va_start(args, fmt);
+
+	if (checkp(vsnprintf(buf, sizeof(buf), fmt, args)) >= sizeof(buf))
+		error("vsnprintf overflow: increase MAX_FMT_BUFFER_SIZE");
+
+	process(buf);
+	va_end(args);
+}
+
+#define MAX_FQN_SIZE 64
+
+/* Get a fully qualified name from DWARF scopes */
+static char *get_fqn(Dwarf_Die *die)
+{
+	const char *list[MAX_FQN_SIZE];
+	Dwarf_Die *scopes = NULL;
+	bool has_name = false;
+	char *fqn = NULL;
+	char *p;
+	int count = 0;
+	int len = 0;
+	int res;
+	int i;
+
+	res = checkp(dwarf_getscopes_die(die, &scopes));
+	if (!res) {
+		list[count] = get_name_attr(die);
+
+		if (!list[count])
+			return NULL;
+
+		len += strlen(list[count]);
+		count++;
+
+		goto done;
+	}
+
+	for (i = res - 1; i >= 0 && count < MAX_FQN_SIZE; i--) {
+		if (dwarf_tag(&scopes[i]) == DW_TAG_compile_unit)
+			continue;
+
+		list[count] = get_name_attr(&scopes[i]);
+
+		if (list[count]) {
+			has_name = true;
+		} else {
+			list[count] = "<anonymous>";
+			has_name = false;
+		}
+
+		len += strlen(list[count]);
+		count++;
+
+		if (i > 0) {
+			list[count++] = "::";
+			len += 2;
+		}
+	}
+
+	free(scopes);
+
+	if (count == MAX_FQN_SIZE)
+		warn("increase MAX_FQN_SIZE: reached the maximum");
+
+	/* Consider the DIE unnamed if the last scope doesn't have a name */
+	if (!has_name)
+		return NULL;
+done:
+	fqn = xmalloc(len + 1);
+	*fqn = '\0';
+
+	p = fqn;
+	for (i = 0; i < count; i++)
+		p = stpcpy(p, list[i]);
+
+	return fqn;
+}
+
+static void process_fqn(Dwarf_Die *die)
+{
+	process(" ");
+	process(get_fqn(die) ?: "");
+}
+
+#define DEFINE_PROCESS_UDATA_ATTRIBUTE(attribute)                           \
+	static void process_##attribute##_attr(Dwarf_Die *die)              \
+	{                                                                   \
+		Dwarf_Word value;                                           \
+		if (get_udata_attr(die, DW_AT_##attribute, &value))         \
+			process_fmt(" " #attribute "(%" PRIu64 ")", value); \
+	}
+
+DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
+
 bool match_all(Dwarf_Die *die)
 {
 	return true;
@@ -93,6 +208,49 @@ int process_die_container(struct state *state, Dwarf_Die *die,
 	return 0;
 }
 
+static int process_type(struct state *state, Dwarf_Die *die);
+
+static void process_type_attr(struct state *state, Dwarf_Die *die)
+{
+	Dwarf_Die type;
+
+	if (get_ref_die_attr(die, DW_AT_type, &type)) {
+		check(process_type(state, &type));
+		return;
+	}
+
+	/* Compilers can omit DW_AT_type -- print out 'void' to clarify */
+	process("base_type void");
+}
+
+static void process_base_type(struct state *state, Dwarf_Die *die)
+{
+	process("base_type");
+	process_fqn(die);
+	process_byte_size_attr(die);
+	process_encoding_attr(die);
+	process_alignment_attr(die);
+}
+
+#define PROCESS_TYPE(type)                         \
+	case DW_TAG_##type##_type:                 \
+		process_##type##_type(state, die); \
+		break;
+
+static int process_type(struct state *state, Dwarf_Die *die)
+{
+	int tag = dwarf_tag(die);
+
+	switch (tag) {
+	PROCESS_TYPE(base)
+	default:
+		debug("unimplemented type: %x", tag);
+		break;
+	}
+
+	return 0;
+}
+
 /*
  * Exported symbol processing
  */
@@ -119,6 +277,7 @@ static void process_subprogram(struct state *state, Dwarf_Die *die)
 static int __process_variable(struct state *state, Dwarf_Die *die)
 {
 	process("variable ");
+	process_type_attr(state, die);
 	return 0;
 }
 
-- 
2.47.0.163.g1226f6d8fa-goog

