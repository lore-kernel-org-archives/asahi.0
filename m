Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340E91F1921
	for <asahi@lists.linux.dev>; Thu, 19 Dec 2024 21:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642484; cv=none; b=LEMwSRLhif6bfQBJ5J2cTOHn5P01Zo8uIMkzDdEEKM8SEAmhuapdmg/k3B3jqUiL2JXGC1FY6WVrUVksYhgHym+4kpV/KVjwD1bYnv00Qkrhx1/f+Jv/CpMimgj1u1WiOdm1X4voYd9KH3uow5FVeo26QK+HLPtul2ebR1OPoTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642484; c=relaxed/simple;
	bh=V88Ux5YpLtipLnwT7oAorrJvHrfCrHoGnWDZa7njhBA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aGtxJ5HM8xAB+JXXJ3V9ZA6Tr3If9kRK4Kr0Jjt0NiU+sq2CEA0DR/Q6bVeFs/JAC/g4ZRqJN75H7j0XliLcMnjtHIOVJ/hlugprnXAaGswwkk+HYAy438aIRGNoL0y1kpfl1xhLk/SJcFQ5V5CHUVnOnDPttgeiznbOzzoSRjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j6AA5LA2; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j6AA5LA2"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2166e907b5eso12900445ad.3
        for <asahi@lists.linux.dev>; Thu, 19 Dec 2024 13:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642482; x=1735247282; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=12wMWYmdUy+3imKc/VOk9UykTDeV6/VQokbuwTAWfVw=;
        b=j6AA5LA2t9h2UqjHOiTV61omrT80VBRO+5eaBUjUaKaxU8W4QN5JYDbffP65lIo1et
         PutMPZjqiUwtwGO/zXLerVZHRKkrJAVkbmWGSO65De9EOoMU/OIiJeXvR70iJ4PpQhpi
         jMzGEgL8JS6fYwtpZ6lrLMu79alXW6L49Qfln6eeb/ecOX83zcLiXT3SOTXMnfvH0+V6
         eqW8RbSP++Ax+vhJEnWK0yNZfz6ckdk4rnvuwkUkooJTvfhOfhzIdY+jAm5hFy/75OxA
         Aqli1XJi+Z1A2HUkvnvjA2EskrbRcBtZeSrMZXSfTtQhsYVHVZfBWxMozcEU396NlryW
         8ufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642482; x=1735247282;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12wMWYmdUy+3imKc/VOk9UykTDeV6/VQokbuwTAWfVw=;
        b=rP68kwTNxKT5hQ4TZ5Za2B/2eB7X061+3Aty++RBSHfBeZuwa6Cn+SVz4UK6V/DMF6
         rQ6v7weBpovzkWPInbCkcVL09O6iSOmFx11K8MVFB8w5ni1kI+Aqg9janq1AKXIJwlI8
         rYZGUkMfu1Z8YVVzzDRfY3BD5BJEakP70gB3xu/1jySijPefjK9v8W0otR5F2h6hVJB8
         FA55+I4FnqMkh1fKDGryN7w9Qft7KbS/F4Td44HAUY2Z/Dhn53BiouTzqnYkb/WR1EyF
         0sjj66+53lA8hAs3I9G6IDnFiAGsSkLWvRpaeJ6mKEiGAFbUzIxD2mHXnNr/MZjNt8uO
         yvlw==
X-Forwarded-Encrypted: i=1; AJvYcCWKadDS5cnyRJFqS2jfJGJkV7OiObHpxkxaidSm2bsroT+MLtp9i7oCQrldbvue3oRHJ/6j9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdEkwiSFdOLIOn5Gkn8dHeVztNEOUuqqNLYcLW5ISQ/jemzuaL
	0dW+JUU7LK7/7gib0UUgqT0300btqORBV+8ZYVam1xSQdrgTcgpJkfqrMZH0r+dF79TJnjNfDtM
	wUdLcabbxm7EBpJ7vTns9UC5hOw==
X-Google-Smtp-Source: AGHT+IHZrAcneZVhNsCIJl4OSOoxoaOpAg9w4VYA1++o7u1kqFXGpYUShSf1O/vsRV3hJwyf6gqPsZGiC0raVqrtViE=
X-Received: from plbkw5.prod.google.com ([2002:a17:902:f905:b0:212:71c4:23f6])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f610:b0:216:3436:b85a with SMTP id d9443c01a7336-219e6f4319fmr2835485ad.52.1734642482229;
 Thu, 19 Dec 2024 13:08:02 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:44 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300; i=samitolvanen@google.com;
 h=from:subject; bh=V88Ux5YpLtipLnwT7oAorrJvHrfCrHoGnWDZa7njhBA=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3TLvp/H9tv5kvenc6S9TLjAISJ2d27a1NzJd4Onzq
 8Lz2vjmd5SyMIhxMMiKKbK0fF29dfd3p9RXn4skYOawMoEMYeDiFICJLL3D8E8/w7dtVYumj1ed
 wCWlAtVXLxNT3+XL1y6a8osnLTDOMpThfx4HT57ele1uqz8KPelavWCaCu9ul6uPlhRPljufk1l owQIA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-27-samitolvanen@google.com>
Subject: [PATCH v7 07/18] gendwarfksyms: Expand array_type
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

Add support for expanding DW_TAG_array_type, and the subrange type
indicating array size.

Example source code:

  const char *s[34];

Output with --dump-dies:

  variable array_type[34] {
    pointer_type {
      const_type {
        base_type char byte_size(1) encoding(6)
      }
    } byte_size(8)
  }

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 7d8a4eb6c387..46ce17b2459b 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -220,6 +220,7 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
 	}
 
 DEFINE_MATCH(formal_parameter)
+DEFINE_MATCH(subrange)
 
 bool match_all(Dwarf_Die *die)
 {
@@ -342,6 +343,33 @@ DEFINE_PROCESS_TYPE(shared)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
+static void process_subrange_type(struct state *state, struct die *cache,
+				  Dwarf_Die *die)
+{
+	Dwarf_Word count = 0;
+
+	if (get_udata_attr(die, DW_AT_count, &count))
+		process_fmt(cache, "[%" PRIu64 "]", count);
+	else if (get_udata_attr(die, DW_AT_upper_bound, &count))
+		process_fmt(cache, "[%" PRIu64 "]", count + 1);
+	else
+		process(cache, "[]");
+}
+
+static void process_array_type(struct state *state, struct die *cache,
+			       Dwarf_Die *die)
+{
+	process(cache, "array_type");
+	/* Array size */
+	check(process_die_container(state, cache, die, process_type,
+				    match_subrange_type));
+	process(cache, " {");
+	process_linebreak(cache, 1);
+	process_type_attr(state, cache, die);
+	process_linebreak(cache, -1);
+	process(cache, "}");
+}
+
 static void __process_subroutine_type(struct state *state, struct die *cache,
 				      Dwarf_Die *die, const char *type)
 {
@@ -437,7 +465,9 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	PROCESS_TYPE(volatile)
 	/* Subtypes */
 	PROCESS_TYPE(formal_parameter)
+	PROCESS_TYPE(subrange)
 	/* Other types */
+	PROCESS_TYPE(array)
 	PROCESS_TYPE(base)
 	PROCESS_TYPE(subroutine)
 	PROCESS_TYPE(typedef)
-- 
2.47.1.613.gc27f4b7a9f-goog

