Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612341AD3FD
	for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 21:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212851; cv=none; b=A3as6x6RICvXTMPy+zEJ0HOOfdBIhT40fH+REoKluttt8Qs2iXOGl8oRDyhumK4jnDSDU6AEOgM/emA1DSeswTmlGtURo8Yu3OHVrsXoxyTbRVjnW2vKtQUAVW9ACD9lBnjYmZly0CW50grdki8Cl55idV5ZjKqNUkAxtma/etI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212851; c=relaxed/simple;
	bh=wM975yYhhnJbskoT3Xe/Z8RaXLTIAwoZIK7NoqKeDB8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=je4RyE0yTcFewcj/rAMPRo22jCaG8V5VHKFvM7jnP5jKfEyqLCpVAtLfPjWyGucs9cbn9XnzEcAfwdyf6fKu1KUanXNcQMG8vN9ZtTbPGxe6kpn2zF0ZePB0l9hCVf8QIrJ3jWtA6ckPepccheFFYDxr+D8GiM0uWsyBghf1zZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QrbvCf9r; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QrbvCf9r"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e201a37e5a4so9615131276.0
        for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 14:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212848; x=1727817648; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fOjsxdYdAkInxupUorws184MmwFGmal1AWb/bAcHrOQ=;
        b=QrbvCf9rjg/lOUYM0FrJF5fl22l2qc8kY/vSKINLxZQJwKhQJJeKtisSfSxlEjjzUZ
         60rmL8FOZGLqC+kTzXN0kYZDD5kggZ8/GthK1SU9lcJu5NFDKUbq1+VFQQQF3UkpY/MM
         tPRXz+qC8jogzkEEvvR6pRE7bJXqxZZwvHm2C5cI+xgMLJumW4+IkecYZWxpKnEqYKNo
         YUO88yRqReiIgshbr2ZGhsiJKZq7R6+KaIZJlKfW0EM28qxnwhHeoHU495Ah7n7viZYU
         B9YusbmMgM0XMKtF/fupCwky8DWQ2WlxxSwySORXXGipfmoxUtClOaHYtwmUVQjzUE+1
         y4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212848; x=1727817648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOjsxdYdAkInxupUorws184MmwFGmal1AWb/bAcHrOQ=;
        b=QCPOSdo9rxDNMhdS4X1fG9YFmuG8oMOyNXsjW+9k3ebioUmtlBbVE4PoDN51WAii7/
         3Dzo+frn+5XZG2voqNjkJ62R2TNfd90dk97Xel8RQo1BX7GLbd3p3gM/7U2fr6mK7EY2
         qeL9DPgT9/r9iqZA8dWaXoerIc7RanoaN3DQVOizORDaCsra2G3P+oS5TtHHn3inr0EI
         ISo73YkKi2x0PFPq79hEU2jMg9Mgyk6nFri02NoCY9+JV+iOxPTMVDP3YMtnz6rzKJYG
         gjCzz+7lgdN2gap3Ke8RvlQa5s8XGuoComE1yqvty+KLOCAyHxDibCwopBoHGMkwJkeT
         yovw==
X-Forwarded-Encrypted: i=1; AJvYcCVQHtrbBKRHRReQtjOe04Y7oEc4rcxag2hzuT/LZHY1brSi0uy/lleOvy+twRD5tE24Dt7UGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLme4VnWkkoBQBWEcXDLRSvfY0279aa55EqzAOVZNmj4zeW0fq
	iVRZc61ETVCZtaM3QHN71lTEYKDJoC0V+a7ef1MPgKC7Lm0MsKOC25UTaaSGIM8U0PE5bYCafkw
	1xST8AQ==
X-Google-Smtp-Source: AGHT+IGFSH/4qSrZBqEqlTh529yD1/WBEgXQbh0dGeEOt+TtZiA9qDu1tsUd11c56UkfBMQHgYlEILsdYk48
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:dc0c:0:b0:e1a:8195:3c1b with SMTP id
 3f1490d57ef6-e24d9331a46mr447276.6.1727212848012; Tue, 24 Sep 2024 14:20:48
 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:50 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-9-mmaurer@google.com>
Subject: [PATCH v4 08/16] module: Factor out elf_validity_cache_index_str
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Matthew Maurer <mmaurer@google.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Pull out index validation for the symbol string section.

Note that this does not validate the *contents* of the string table,
only shape and presence of the section.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 6be58b0a6468..43140475aac0 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2014,6 +2014,31 @@ static int elf_validity_cache_index_sym(struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_index_str() - Validate and cache strtab index
+ * @info: Load info to cache strtab index in.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated.
+ *        Must have &load_info->index.sym populated.
+ *
+ * Looks at the symbol table's associated string table, makes sure it is
+ * in-bounds, and caches it.
+ *
+ * Return: %0 if valid, %-ENOEXEC on failure.
+ */
+static int elf_validity_cache_index_str(struct load_info *info)
+{
+	unsigned int str_idx = info->sechdrs[info->index.sym].sh_link;
+
+	if (str_idx == SHN_UNDEF || str_idx >= info->hdr->e_shnum) {
+		pr_err("Invalid ELF sh_link!=SHN_UNDEF(%d) or (sh_link(%d) >= hdr->e_shnum(%d)\n",
+		       str_idx, str_idx, info->hdr->e_shnum);
+		return -ENOEXEC;
+	}
+
+	info->index.str = str_idx;
+	return 0;
+}
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -2037,7 +2062,6 @@ static int elf_validity_cache_index_sym(struct load_info *info)
 static int elf_validity_cache_copy(struct load_info *info, int flags)
 {
 	int err;
-	int str_idx;
 
 	err = elf_validity_cache_sechdrs(info);
 	if (err < 0)
@@ -2054,16 +2078,11 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	err = elf_validity_cache_index_sym(info);
 	if (err < 0)
 		return err;
-
-	str_idx = info->sechdrs[info->index.sym].sh_link;
-	if (str_idx == SHN_UNDEF || str_idx >= info->hdr->e_shnum) {
-		pr_err("Invalid ELF sh_link!=SHN_UNDEF(%d) or (sh_link(%d) >= hdr->e_shnum(%d)\n",
-				str_idx, str_idx, info->hdr->e_shnum);
-		return -ENOEXEC;
-	}
+	err = elf_validity_cache_index_str(info);
+	if (err < 0)
+		return err;
 
 	/* Sets internal strings. */
-	info->index.str = str_idx;
 	info->strtab = (char *)info->hdr + info->sechdrs[info->index.str].sh_offset;
 
 	/* This is temporary: point mod into copy of data. */
-- 
2.46.1.824.gd892dcdcdd-goog

