Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76A2176FA4
	for <asahi@lists.linux.dev>; Tue,  6 Aug 2024 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979287; cv=none; b=KHYlQfVy5MfKqbMYzScK6rObs+hXVBjcwc8oJY6Y/blLS5BZ4qV8GU+Rku2Ytjm/vZ3wb5jU0SGaUQ9hoeDdB0HLeasjAYfA+sVIns6oz1uMKFs/MPJGHPgPmHwmgWyEVcB7h+vF5X/LSenlYHxxU8IPCvRC/XAndSR+nWO7/uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979287; c=relaxed/simple;
	bh=AvV1Bn9k49Kipk9uw0nnfUkau+9M6JCC4wTdPYZCn98=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MjdlRDq86PrZvNh/O51jxz/gM6pycJFv9/8DKs8/Xw2UliekUHrmNykjiRbHE0NBeRGriwrxhLUZ7Q3HtuxEncnxtuaiJBB0aKTrKJ5TvUrVXbaffYSmL07jZR5U9GyCu1mODwFjjfV5aYZU0iBdc5PYOj77LP8L69oycnV9LWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qtMRFIah; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qtMRFIah"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-688777c95c4so25371737b3.1
        for <asahi@lists.linux.dev>; Tue, 06 Aug 2024 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979285; x=1723584085; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sli/LxDmVK7sExv83Tn50ATiFYlxgRbD5DaeK91AEbk=;
        b=qtMRFIahZp8iX/IyLT/d1UkbTlx8WOBSpD0xHQsDLQolcooQR9DX/G+nMJQa3Z+JE0
         rwkMQhYKd7RpvXES00tZZoJuMkgr10ZsLZcOn9JdDYf+cxynILHgKceuWGt1pfzIoIVZ
         t0ch9QDKkH4Jy+O43+VTPMzd9n6qkryPO9Fp0XXZ+D+RMEGt4BDfbpjXjHHSCWDTLDza
         hyx38veNbUUzeldoT9aFQ8ZSR4JT7JZo/pylRAZrK9WQU6tw6YMRNKEolXiQDH08pfnA
         fkbSb1NVCG1nwR/XD0Ci7I75w9k+iWcs9QM2dtufkpMSqTAN3fQTN0O5+tYY9Ahk5YD9
         oRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979285; x=1723584085;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sli/LxDmVK7sExv83Tn50ATiFYlxgRbD5DaeK91AEbk=;
        b=TLjhorCyU3vBMrnbhlXKt/jECt5w8oDvYK8VqIKcU8LcXcX+r4RvRqr2G2A5RUTkL5
         CW6xpRDoeS4idXmUQ6i2TTQFdNjYFGqvJaGpxnvrkmE7JWF85t3LfP/cV7GTWn7cl7+i
         aP2lCiGHwXS5SwFMfMwVTgotBCMRjo1WBO+Z0u9FOcrR1TM7vfPzs+yi0J9esIbcNbnD
         dJrFOLacYkU+LDBglmuZSgtId/AvxOREoZIpI2s5IquQPuY5fTLr+SabW/x/BmrVqtgD
         R9eGjxoIInbkvXeddWrGwthDpiku2/9lEWCHA0T9LY7KXWvG/xpONSa0zwF1ZH3DiCjI
         0arg==
X-Forwarded-Encrypted: i=1; AJvYcCV3RIVYuNkezrLEGGKdkf3uNT1ktXf5HI8eOzPPD7Yi5PybG6X899zaY9fHdi/WvSa9QTYjmoD/J5N8C1MfdZqWuq2seI4=
X-Gm-Message-State: AOJu0Yw9ZD0fJngBDZXMnMSv7SMmUG/7ZKpH77tEk5gm+3iT0TnuvfHA
	NSOWYyt2Vtb0qs9bhAhtT/9+PiHyQhbS5qdjxVQ/ohwyJ96gmU7XxjlFi89ktPleAyc54zk0qyk
	w0S+3Fg==
X-Google-Smtp-Source: AGHT+IH4u4TnfmwmFVPoyUjm9b+0lr0KubUujePWykRTF5KEnkidiOfqfkDcnadas9BbmmYCG++qvZnouRNY
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:b287:0:b0:68d:52a1:bed with SMTP id
 00721157ae682-68d52a10e65mr3687567b3.1.1722979284770; Tue, 06 Aug 2024
 14:21:24 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:33 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-8-mmaurer@google.com>
Subject: [PATCH v3 07/16] module: Factor out elf_validity_cache_index_sym
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Centralize symbol table detection and property validation.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 73 ++++++++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 29 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 281cc1a7dee6..53597b785e2a 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1980,6 +1980,39 @@ static int elf_validity_cache_index_mod(struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_index_sym() - Validate and cache symtab index
+ * @info: Load info to cache symtab index in.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated.
+ *
+ * Checks that there is exactly one symbol table, then caches its index in
+ * &load_info->index.sym.
+ *
+ * Return: %0 if valid, %-ENOEXEC on failure.
+ */
+static int elf_validity_cache_index_sym(struct load_info *info)
+{
+	unsigned int sym_idx;
+	unsigned int num_sym_secs = 0;
+	int i;
+
+	for (i = 1; i < info->hdr->e_shnum; i++) {
+		if (info->sechdrs[i].sh_type == SHT_SYMTAB) {
+			num_sym_secs++;
+			sym_idx = i;
+		}
+	}
+
+	if (num_sym_secs != 1) {
+		pr_warn("%s: module has no symbols (stripped?)\n",
+			info->name ?: "(missing .modinfo section or name field)");
+		return -ENOEXEC;
+	}
+
+	info->index.sym = sym_idx;
+
+	return 0;
+}
 
 /*
  * Check userspace passed ELF module against our expectations, and cache
@@ -2003,10 +2036,8 @@ static int elf_validity_cache_index_mod(struct load_info *info)
  */
 static int elf_validity_cache_copy(struct load_info *info, int flags)
 {
-	unsigned int i;
-	Elf_Shdr *shdr;
 	int err;
-	unsigned int num_sym_secs = 0, sym_idx;
+	int str_idx;
 
 	err = elf_validity_cache_sechdrs(info);
 	if (err < 0)
@@ -2018,34 +2049,21 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	if (err < 0)
 		return err;
 	err = elf_validity_cache_index_mod(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_sym(info);
 	if (err < 0)
 		return err;
 
-	for (i = 1; i < info->hdr->e_shnum; i++) {
-		shdr = &info->sechdrs[i];
-		if (shdr->sh_type == SHT_SYMTAB) {
-			if (shdr->sh_link == SHN_UNDEF
-			    || shdr->sh_link >= info->hdr->e_shnum) {
-				pr_err("Invalid ELF sh_link!=SHN_UNDEF(%d) or (sh_link(%d) >= hdr->e_shnum(%d)\n",
-				       shdr->sh_link, shdr->sh_link,
-				       info->hdr->e_shnum);
-				goto no_exec;
-			}
-			num_sym_secs++;
-			sym_idx = i;
-		}
-	}
-
-	if (num_sym_secs != 1) {
-		pr_warn("%s: module has no symbols (stripped?)\n",
-			info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
+	str_idx = info->sechdrs[info->index.sym].sh_link;
+	if (str_idx == SHN_UNDEF || str_idx >= info->hdr->e_shnum) {
+		pr_err("Invalid ELF sh_link!=SHN_UNDEF(%d) or (sh_link(%d) >= hdr->e_shnum(%d)\n",
+				str_idx, str_idx, info->hdr->e_shnum);
+		return -ENOEXEC;
 	}
 
-	/* Sets internal symbols and strings. */
-	info->index.sym = sym_idx;
-	shdr = &info->sechdrs[sym_idx];
-	info->index.str = shdr->sh_link;
+	/* Sets internal strings. */
+	info->index.str = str_idx;
 	info->strtab = (char *)info->hdr + info->sechdrs[info->index.str].sh_offset;
 
 	/* This is temporary: point mod into copy of data. */
@@ -2066,9 +2084,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	info->index.pcpu = find_pcpusec(info);
 
 	return 0;
-
-no_exec:
-	return -ENOEXEC;
 }
 
 #define COPY_CHUNK_SIZE (16*PAGE_SIZE)
-- 
2.46.0.rc2.264.g509ed76dc8-goog

