Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841991C5CC9
	for <asahi@lists.linux.dev>; Thu, 19 Dec 2024 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642478; cv=none; b=o6xgTztkRWg7HOlLTfGl8hlN7EWmIC9n5X/cxV57PmFNjQqw3lal4P/3stnafS6CXr7JXNEvR6NBRYgcIhd6vPhCg2ShnkNhTuT1H4pM31b3qZuPXoXl66mAIh1TgxDQILCjagkm4BYXL95XLM4wk/vUl9B10siDRIgN/I7ToEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642478; c=relaxed/simple;
	bh=bbCvhhmVnhtTYpDrJYZHLEm7Ii+2fqEhxzWaIoSVp4g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TeKcuJ2XXSGBXhhn4p1DZV6SkTMv59R7bYXZNd8ve9QVauWNYHFfSk8kX5FaCVmOvEJmRHfqFIY4O1yrMdeNNNCy5yhTIp3dihx5w2SR4cRyvpaO0lZisSwu9JuZBYSRn+ODyfcHswn7i3c/ATpkbeiolh7Jt/0+Cngfu4kW6zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ovOSEWZX; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ovOSEWZX"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee5668e09bso1135676a91.3
        for <asahi@lists.linux.dev>; Thu, 19 Dec 2024 13:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642476; x=1735247276; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iqmGG67x42YJFJgNp9m9MGLgkL+XEQeNfXKJAnh+SAA=;
        b=ovOSEWZXcK//kl1sMaN7zFYaNEFU4XDFpXZgiJnWDXKWezsg3gQEbVKVi0Rrpb/qDT
         7kwHMfMKjeyA4LfiFQ+NnHFKfOkJhcsCeASzisFRfCuxmownQr+0gkfqG0esXd4pmwOa
         fyyTrcmXLZZrG1c0H3Cp0xiV1oQp9LGy+eKZ2Uz1agboJKXM673H9LqqYEJj+ha2HrA7
         d7RnspTG4XUKPWASjvak+BJgVdpcGqdlf6BoniN5qo6iLN+VC54PXZjxmS0mry3pOf7r
         4hqHRT+2IdbKa19VWSodueLsgO1bjrXTqIHUslote5XHCWgJX75dCsPzXS1XW5tzz2us
         7NrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642476; x=1735247276;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iqmGG67x42YJFJgNp9m9MGLgkL+XEQeNfXKJAnh+SAA=;
        b=h12kN7xIKbtm0+EjHsQVfa+yn+jQvuYV2lfReKXYr/5HHjbFEJjxpyV0xSKCcSf7HF
         YN39Pc0m0iS2MAfhDgfHKQv9SuyT/g3KS7nWWvWSFnnq23FRAnoInPFPy3GQ9OUQErCX
         NgzkU/wJAVg9w7k487YbZWL21viC4MnD9kT6TBvi1p1ZRb5D8QLx2Cwvo54tj8T/95SB
         uhLpRU1wsXmBFQtcbOjIP/5fEzZCU1ao9Y1i1bRsWkqnCTsbVnjKqVlmQCfNdC3ouLp1
         Oa3uOwuueUp1LEUAhGAiSDIbrpbWEgqgb8Ho/gk5T0NfQA/HD6ob45iLpcCd1RWNkImr
         VCew==
X-Forwarded-Encrypted: i=1; AJvYcCUGft3/3eiEIhV0qrxCvchatheo+37UGzNK+t+8tkTnHXg8bjybTIxy9juodDPVtymgmDcibA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxovxifV4zHn4YFUW5GtDDTcaiX3vcevIMn2ZpkMD9Iiom1tTs0
	ZZaryXzHNx4w61XkTDIh8VDeoemEHwQ2/WZfBLPyMOjoPX9lE1LV3e/T8zEAFQMvIq0Of4yZRva
	JovYkaX01s84LcYZH0mJ2449Hfw==
X-Google-Smtp-Source: AGHT+IE+QiqHOl9N3U1IZLotZi74BCW+jOyId5tadxS/AlzJ429isHN0f1j0ynJltMkWByvG7g6oYhH80nrxkRm4n7Y=
X-Received: from pjyd8.prod.google.com ([2002:a17:90a:dfc8:b0:2ea:7d73:294e])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5202:b0:2ee:d186:fe48 with SMTP id 98e67ed59e1d1-2f452ec6a53mr608686a91.28.1734642476006;
 Thu, 19 Dec 2024 13:07:56 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:40 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5405; i=samitolvanen@google.com;
 h=from:subject; bh=bbCvhhmVnhtTYpDrJYZHLEm7Ii+2fqEhxzWaIoSVp4g=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3VKTOfLeOSXc/yAtcG3KRvG375YYlxx89vqYa396Q
 3azF9fhjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjAR72OMDCvE51ZIaKnWdc3W
 qMs7KDKrcTPrj5Wt3ofNrzw82bQ6wZCR4bZbsZexvmW7rsxemRXuNjP/7+A9I/8tPm+zPnNBgcc XVgA=
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-23-samitolvanen@google.com>
Subject: [PATCH v7 03/18] gendwarfksyms: Expand base_type
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
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c | 160 ++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 81df3e2ad3ae..74e75b8ec891 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -3,8 +3,21 @@
  * Copyright (C) 2024 Google LLC
  */
 
+#include <inttypes.h>
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
@@ -67,6 +80,109 @@ static void process(const char *s)
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
@@ -93,6 +209,49 @@ int process_die_container(struct state *state, Dwarf_Die *die,
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
@@ -119,6 +278,7 @@ static void process_subprogram(struct state *state, Dwarf_Die *die)
 static int __process_variable(struct state *state, Dwarf_Die *die)
 {
 	process("variable ");
+	process_type_attr(state, die);
 	return 0;
 }
 
-- 
2.47.1.613.gc27f4b7a9f-goog

