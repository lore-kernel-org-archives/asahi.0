Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101131A4ACC
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 23:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307568; cv=none; b=QLcvcqSA2ASZQvlGHw9ktxFAp/R3YK0VfMBvZs5mxda2NMHByp81xq/fggIhMna2Ziw4gXHIFJ9ExvutyzMnTfdvKG+GUH9xMafM4EkdvS5r32CqcDI42wVOqwu/ej0JAFENigaKpwtPxaEI8yGyufMotAEbNdeuoIvU86lDdUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307568; c=relaxed/simple;
	bh=Mm95RZ0gEd/5ILA/sw+Yul4T3HW7v3bJsG9qmFVzqME=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N8t2wZ5PHBqWB8OgdqtOAULSFc46R5YvOLA4GAA2g3Tja+DbptFewp4arzowMxpGiJG4N6+t1GAMYtHUfT48oIVJmTUoPqZJlON4wkw8OsE2QA5JdqQ/fJZZe3sGFYTKGpHfnFMQqWGthnE7DW4E5itfqggwy89Q4BWzUuYb25g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BFy+CH7Y; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BFy+CH7Y"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e02b5792baaso693611276.2
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 16:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307566; x=1727912366; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+9YZzoCvxvyDdM8B+em9dMKSDuRRuGPZhSev+lAnN9E=;
        b=BFy+CH7YZLkNTZyJYgs9vhCDHiUzzmhn08xxehQkEY3dEnXzT2riYd/aBv7IL+w+UG
         yMGGo6eEjGaR39LdTZZE7UHNIpx8GVXKxx5No31DMg1QVUFW4I9kXM39Bt+/6Qoh3XvO
         u8QM5meJzA8oElAdwsxhn9TwROCWgbSKEPj3IZwJ6yjAQFOTze31AHfDVxpxuopGw1hQ
         6y+tiMrWd8kAkKPK0xTYZWPUKKOkvRKJnBSptnexPlrmR0mXIhzb6H8aLku4MpTsZ4s0
         84eDXpXY0YNUF1HhezB/Ta7qKj3TH7S+NLWDCWTVp+MYU0fYEjjMln2vfNV+IDSSagbu
         o9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307566; x=1727912366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9YZzoCvxvyDdM8B+em9dMKSDuRRuGPZhSev+lAnN9E=;
        b=El5Aoh+QEQRyeasoZXmsrt1b1f0mWZYfDvJFqLLWU57Do2gN8pTO/DYKgnucrneMga
         hNPLfMh/RdCeQIyss1cpLdxtHj7kefthyKcNhAvRLvqqc/AVC3A6lSXfZCQkyWTt7A+z
         sSvyJXYPIwZ0Z3HEpvF7wuzMcHvyQ1XlnfEdc9FQdOANJRiCFzsulwsitrhTK2dgw9cG
         6lkF/F1J4RK6+/chQ55oTHBhADamZw3tPlyBWWSrQ/vyShQOmGjTLG/GPCaCfaX8/GIn
         Cm1zB5h2C26JbEV+QNuZG9i4MWOGeXLHAUnQnky4Zy8e2he4m1Wy4IgJtN6tPyzPCHVL
         f5yw==
X-Forwarded-Encrypted: i=1; AJvYcCUetfDcTW2AIiPonTKsFLbHyqHfsIyLdJR//kzcObBd2EFV3OCrSfxp70+0QkJwpGMP+0zI/g==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt1C4QLSa5/UQvkRv7Q7kgPLLkW/PqMtff5WSOajy0CQphK+rK
	/cmgNHAzYHm5HtRvn8hM6XkJ5yVhFMtxIICJfGqBsCgm1FnoPQAuw1xb4JRDY0r+wIXaoKI6HBo
	dU1VSbQ==
X-Google-Smtp-Source: AGHT+IGHHE+4KWf9auYKryB2lu9/fM/qXObyfiN1uXRNz038JkA/1/xLeMhKPiONI2CFf2+1SxQefRfFrD41
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:7801:0:b0:e0e:89e6:aad4 with SMTP id
 3f1490d57ef6-e24d44ca00dmr51018276.0.1727307565822; Wed, 25 Sep 2024 16:39:25
 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:17 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-3-mmaurer@google.com>
Subject: [PATCH v5 02/16] module: Factor out elf_validity_ehdr
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"

Factor out verification of the ELF header and document what is checked.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 70 +++++++++++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 23 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 1a2dd52147ba..59c977acfb44 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1664,6 +1664,50 @@ static int validate_section_offset(const struct load_info *info, Elf_Shdr *shdr)
 	return 0;
 }
 
+/**
+ * elf_validity_ehdr() - Checks an ELF header for module validity
+ * @info: Load info containing the ELF header to check
+ *
+ * Checks whether an ELF header could belong to a valid module. Checks:
+ *
+ * * ELF header is within the data the user provided
+ * * ELF magic is present
+ * * It is relocatable (not final linked, not core file, etc.)
+ * * The header's machine type matches what the architecture expects.
+ * * Optional arch-specific hook for other properties
+ *   - module_elf_check_arch() is currently only used by PPC to check
+ *   ELF ABI version, but may be used by others in the future.
+ *
+ * Return: %0 if valid, %-ENOEXEC on failure.
+ */
+static int elf_validity_ehdr(const struct load_info *info)
+{
+	if (info->len < sizeof(*(info->hdr))) {
+		pr_err("Invalid ELF header len %lu\n", info->len);
+		return -ENOEXEC;
+	}
+	if (memcmp(info->hdr->e_ident, ELFMAG, SELFMAG) != 0) {
+		pr_err("Invalid ELF header magic: != %s\n", ELFMAG);
+		return -ENOEXEC;
+	}
+	if (info->hdr->e_type != ET_REL) {
+		pr_err("Invalid ELF header type: %u != %u\n",
+		       info->hdr->e_type, ET_REL);
+		return -ENOEXEC;
+	}
+	if (!elf_check_arch(info->hdr)) {
+		pr_err("Invalid architecture in ELF header: %u\n",
+		       info->hdr->e_machine);
+		return -ENOEXEC;
+	}
+	if (!module_elf_check_arch(info->hdr)) {
+		pr_err("Invalid module architecture in ELF header: %u\n",
+		       info->hdr->e_machine);
+		return -ENOEXEC;
+	}
+	return 0;
+}
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -1693,30 +1737,10 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	unsigned int num_info_secs = 0, info_idx;
 	unsigned int num_sym_secs = 0, sym_idx;
 
-	if (info->len < sizeof(*(info->hdr))) {
-		pr_err("Invalid ELF header len %lu\n", info->len);
-		goto no_exec;
-	}
+	err = elf_validity_ehdr(info);
+	if (err < 0)
+		return err;
 
-	if (memcmp(info->hdr->e_ident, ELFMAG, SELFMAG) != 0) {
-		pr_err("Invalid ELF header magic: != %s\n", ELFMAG);
-		goto no_exec;
-	}
-	if (info->hdr->e_type != ET_REL) {
-		pr_err("Invalid ELF header type: %u != %u\n",
-		       info->hdr->e_type, ET_REL);
-		goto no_exec;
-	}
-	if (!elf_check_arch(info->hdr)) {
-		pr_err("Invalid architecture in ELF header: %u\n",
-		       info->hdr->e_machine);
-		goto no_exec;
-	}
-	if (!module_elf_check_arch(info->hdr)) {
-		pr_err("Invalid module architecture in ELF header: %u\n",
-		       info->hdr->e_machine);
-		goto no_exec;
-	}
 	if (info->hdr->e_shentsize != sizeof(Elf_Shdr)) {
 		pr_err("Invalid ELF section header size\n");
 		goto no_exec;
-- 
2.46.1.824.gd892dcdcdd-goog

