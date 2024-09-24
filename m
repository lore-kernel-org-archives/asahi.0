Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5DA1AB519
	for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 21:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212843; cv=none; b=uLWss6A4OlEn2TavQ0mONiJuxSitX0Z/yj7Wfjb9RifIeIFMuKeffU4gPSMzuwUNjvU+48aldiFcj1hGNK3UVlKbiIseFPRwNroRbpcIZZ0Aul188QOoUwq2nOpZyZPvaYRGevCICfb/w/IngDvmreEkv2/DpIaj2HzR3V5B0Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212843; c=relaxed/simple;
	bh=iCsuIDpsaG//12LUTpbXOFHaJGeJHbd09pACcn3fot0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZhUtAqIVjTiEdExzpNGTK1HpnXm0pMsd4hi+04ldXUgtcBh3cYl3u7MTnicWza8Aso/tRPFXDB4Eu1YaHZZbgk43JohSO5PlwJulFtSX6yqt+TrIlctlH/UgcQXcloCfXtgxlOu8pUfNzzm6pmgu1BF08jSv/mpAAjJnaRKRmmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mKv+3pRs; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mKv+3pRs"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e1cefe6afc4so9329785276.2
        for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 14:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212839; x=1727817639; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vadaxnt9VyshEs2zQXz9EyB1j9KQoYY2nW6Hpjx9NE8=;
        b=mKv+3pRsdUsw8s49aLL3xj4055mJzSmuHAutxCQQKKfytjxmX6f8poddrUCZRSqXfc
         ex2rQJ6gLBv6gBtiaqSNv7gHzO2O2titI8qbkXySJ2UbBBJRCBtwSu9EtR1S4ZZG2RcF
         L7ntMChAHYAu2yqtTyTopvudsCQ/Sjo6G1PBs8YCPiEoaOlDmTmfS9L606IUm0M1HtQG
         FftPLTJUDLYaXH5O3tfqLsAjDWGrUcFQ8jQQ5/FNNtCjjmKYaSletu60igOmSl/0sRL8
         Q55Xa5Dm+RJpBSg2otBUFpMk8acyAB73p5YhCmWojcsl9npjmZUCfT3X5tysMl3lcWOW
         pcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212839; x=1727817639;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vadaxnt9VyshEs2zQXz9EyB1j9KQoYY2nW6Hpjx9NE8=;
        b=KyFEv7CjV1Du00u5/mOoXwXKa8SYByN6LAqSMmD2EBPvANkBZoUeGYl0gb7sbISkDG
         LB3PgFb/VE00ochaVvKt0zTLhFe3o7BIVQw/XEAAkYrcPLs/D2b4U3m1zU4sqmvH6hIe
         uxaRzd/xiyhM2gGonTb9ipbcvDG9R5fghMykuASJLQBkIMCS8dnPA2dcvDxv4mgfLWdG
         orrc6//8OeZWItBCc1HhybiDETtmJfpVUa0Ci6rKA46ww+AScvq14ql57E8/N1569CBL
         JleIsBT38GF8WiESQVf0N817sdD17Tc8+GdFzuIy+opgfSsFNTCT8djjLB4aV0IflKL6
         ZaPg==
X-Forwarded-Encrypted: i=1; AJvYcCUD+TB0xvIyYeziXj3/Y5FV5EIz12vPf0DiBpl/tXX1asfZSWBEGZJlLC32uM5GdR827zmoCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfU8XnXRYEahUbJCY5B+Ud0z9jXhHENImyfX8Fjo5MUBLSMxGd
	/GTBaQlHzCr+W7Tf5DE+pcwFjKAOMnlh/s0b2GtmxkqKwpwihuQovzRc5G7SLjEXxKTLtjciQFl
	Qp0x9HQ==
X-Google-Smtp-Source: AGHT+IFG4OSI48N35Xi6Gk6iSkzNvCRH8kParDuksWAqlt27lmlsX0YdseGwFG35RPWIbyYxQmf04qTEFaF5
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:b120:0:b0:e22:624b:aea2 with SMTP id
 3f1490d57ef6-e24d46b5e11mr525276.0.1727212839378; Tue, 24 Sep 2024 14:20:39
 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:46 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-5-mmaurer@google.com>
Subject: [PATCH v4 04/16] module: Factor out elf_validity_cache_secstrings
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

Factor out the validation of section names.

There are two behavioral changes:

1. Previously, we did not validate non-SHF_ALLOC sections.
   This may have once been safe, as find_sec skips non-SHF_ALLOC
   sections, but find_any_sec, which will be used to load BTF if that is
   enabled, ignores the SHF_ALLOC flag. Since there's no need to support
   invalid section names, validate all of them, not just SHF_ALLOC
   sections.
2. Section names were validated *after* accessing them for the purposes
   of detecting ".modinfo" and ".gnu.linkonce.this_module". They are now
   checked prior to the access, which could avoid bad accesses with
   malformed modules.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 106 ++++++++++++++++++++++++++++---------------
 1 file changed, 69 insertions(+), 37 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 1f3a07ee59c6..6a9159afca02 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1789,6 +1789,71 @@ static int elf_validity_cache_sechdrs(struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_secstrings() - Caches section names if valid
+ * @info: Load info to cache section names from. Must have valid sechdrs.
+ *
+ * Specifically checks:
+ *
+ * * Section name table index is inbounds of section headers
+ * * Section name table is not empty
+ * * Section name table is NUL terminated
+ * * All section name offsets are inbounds of the section
+ *
+ * Then updates @info with a &load_info->secstrings pointer if valid.
+ *
+ * Return: %0 if valid, negative error code if validation failed.
+ */
+static int elf_validity_cache_secstrings(struct load_info *info)
+{
+	Elf_Shdr *strhdr, *shdr;
+	char *secstrings;
+	int i;
+
+	/*
+	 * Verify if the section name table index is valid.
+	 */
+	if (info->hdr->e_shstrndx == SHN_UNDEF
+	    || info->hdr->e_shstrndx >= info->hdr->e_shnum) {
+		pr_err("Invalid ELF section name index: %d || e_shstrndx (%d) >= e_shnum (%d)\n",
+		       info->hdr->e_shstrndx, info->hdr->e_shstrndx,
+		       info->hdr->e_shnum);
+		return -ENOEXEC;
+	}
+
+	strhdr = &info->sechdrs[info->hdr->e_shstrndx];
+
+	/*
+	 * The section name table must be NUL-terminated, as required
+	 * by the spec. This makes strcmp and pr_* calls that access
+	 * strings in the section safe.
+	 */
+	secstrings = (void *)info->hdr + strhdr->sh_offset;
+	if (strhdr->sh_size == 0) {
+		pr_err("empty section name table\n");
+		return -ENOEXEC;
+	}
+	if (secstrings[strhdr->sh_size - 1] != '\0') {
+		pr_err("ELF Spec violation: section name table isn't null terminated\n");
+		return -ENOEXEC;
+	}
+
+	for (i = 0; i < info->hdr->e_shnum; i++) {
+		shdr = &info->sechdrs[i];
+		/* SHT_NULL means sh_name has an undefined value */
+		if (shdr->sh_type == SHT_NULL)
+			continue;
+		if (shdr->sh_name >= strhdr->sh_size) {
+			pr_err("Invalid ELF section name in module (section %u type %u)\n",
+			       i, shdr->sh_type);
+			return -ENOEXEC;
+		}
+	}
+
+	info->secstrings = secstrings;
+	return 0;
+}
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -1812,7 +1877,7 @@ static int elf_validity_cache_sechdrs(struct load_info *info)
 static int elf_validity_cache_copy(struct load_info *info, int flags)
 {
 	unsigned int i;
-	Elf_Shdr *shdr, *strhdr;
+	Elf_Shdr *shdr;
 	int err;
 	unsigned int num_mod_secs = 0, mod_idx;
 	unsigned int num_info_secs = 0, info_idx;
@@ -1821,34 +1886,9 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	err = elf_validity_cache_sechdrs(info);
 	if (err < 0)
 		return err;
-
-	/*
-	 * Verify if the section name table index is valid.
-	 */
-	if (info->hdr->e_shstrndx == SHN_UNDEF
-	    || info->hdr->e_shstrndx >= info->hdr->e_shnum) {
-		pr_err("Invalid ELF section name index: %d || e_shstrndx (%d) >= e_shnum (%d)\n",
-		       info->hdr->e_shstrndx, info->hdr->e_shstrndx,
-		       info->hdr->e_shnum);
-		goto no_exec;
-	}
-
-	strhdr = &info->sechdrs[info->hdr->e_shstrndx];
-
-	/*
-	 * The section name table must be NUL-terminated, as required
-	 * by the spec. This makes strcmp and pr_* calls that access
-	 * strings in the section safe.
-	 */
-	info->secstrings = (void *)info->hdr + strhdr->sh_offset;
-	if (strhdr->sh_size == 0) {
-		pr_err("empty section name table\n");
-		goto no_exec;
-	}
-	if (info->secstrings[strhdr->sh_size - 1] != '\0') {
-		pr_err("ELF Spec violation: section name table isn't null terminated\n");
-		goto no_exec;
-	}
+	err = elf_validity_cache_secstrings(info);
+	if (err < 0)
+		return err;
 
 	for (i = 1; i < info->hdr->e_shnum; i++) {
 		shdr = &info->sechdrs[i];
@@ -1877,14 +1917,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 				num_info_secs++;
 				info_idx = i;
 			}
-
-			if (shdr->sh_flags & SHF_ALLOC) {
-				if (shdr->sh_name >= strhdr->sh_size) {
-					pr_err("Invalid ELF section name in module (section %u type %u)\n",
-					       i, shdr->sh_type);
-					return -ENOEXEC;
-				}
-			}
 			break;
 		}
 	}
-- 
2.46.1.824.gd892dcdcdd-goog

