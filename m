Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053AF14659C
	for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 21:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212839; cv=none; b=OxTQhjhQVuKPp9//RTM6Wa6A/UNyoJvnxIho0591sFGONvkFxNzxJ3KVUhkSffAY8qawlg3zhacWlVVYAL5bHeCiG19lOa2/Mx5B8RE7lPDgmPaejj9vifIQq0rg0SNNfM9tgFyI/EWbQbrj/II/XEQ5X9oBGXP4sBq60pXopcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212839; c=relaxed/simple;
	bh=Mm95RZ0gEd/5ILA/sw+Yul4T3HW7v3bJsG9qmFVzqME=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E+Q/yI5oWE6FtE9WqBX+Ah6Sq3Pxkx86lHazjZN2wfA5b3QJk/1tHNoSZj2r+zrbkokY7rgvtxYUrUXr2fbzM1liGwXkd5dKGHgcztWwjBTbZDlIUSY99Ni0YGnxDxTTOB490hWw2aODPQe1cyfq/NHKk633x/GOHFyoGL7qYDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TAsgADau; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TAsgADau"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6db7a8c6831so97566797b3.3
        for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 14:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212835; x=1727817635; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+9YZzoCvxvyDdM8B+em9dMKSDuRRuGPZhSev+lAnN9E=;
        b=TAsgADau6dHtYXzmZWQfRtW52OIgJDzsSkMBvEdK47XuBt4Kw30GvTX86K5MKmBL87
         c2obE2G2iqTvD7lpeMEdXsQhu+mOW+bO1aiyQkHi3vVEIIwPcLHitQOeFc1M+3sryu2A
         VsX9m+6CNlUyPt48LWROE/il2yl5clt+eFiSbk1qR7Ex8VawEuWt+iuR9O6kn4ELBFxh
         KapGNeYo7dGuTQ+GJFh/xLnHJrqUfqka1FAbUQNmgqhVin1SGSfpb2LZg0aU12pzkIfi
         pvW9hujvVh14LF5r+Fu0vR7JTsq3Os8w518yQr5lTRLeLJHolZoA6QyQnR9IChDDohGB
         W4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212835; x=1727817635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9YZzoCvxvyDdM8B+em9dMKSDuRRuGPZhSev+lAnN9E=;
        b=UJO++mmA8KeYefO73NH+dFJ9V2oEALlz+rIuDetGfMCpgKtaoTwlCAyba94o/qDP+0
         XPvTGrSe4C+Tl6+zgjkVZAhJvkxsV2QlWNutdkTS6XKSNeOmGKRhdacYnm9fOStSP+5C
         kDSMOzaX5LpDlegnoohSZhmwxC6AWBUWpo4iWPlP7V1m8k0oUMVf7FesXpMGX+2rIMyo
         xsjp9j3mE4f8Kfow+X1IR1fKTUOwcN7Z6LwWAaRGlN0eAGg/blBGBtH9LuR+TxrzzzKO
         5r+3ByKfsHUYsKO6cy0LLogoEoCBGQUHn0si+QGthxrPNBO9IK3CFRx63rowthMaNkxp
         hTsA==
X-Forwarded-Encrypted: i=1; AJvYcCX193CyIu/eA1asRWIxibQObCsRH7OcUZ4BGLTFQcy2v2JiSgK0cS4aYFKhrpzqeW34uw/SZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzvIAvmZT03Nqum4+2PdhYsxOD711c4HxficCoMdIGe6MHHSdr
	00iaruiOIj5reyliPCOAPZsdgURIMyU92JTLsmCHi7+W2QxFSuQNvX3EIOwe8UZrRR8wFKS+30p
	EIHmu+A==
X-Google-Smtp-Source: AGHT+IH8GJCD2yEItqoVxha2hna+M6u5pXhuHD6Vku3ryEFGXz3pSAiDfCy7EoF1TJPoKA1RIGRpct8983ar
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:5092:b0:6dd:bcce:7cd4 with SMTP
 id 00721157ae682-6e21d81e792mr11447b3.2.1727212834850; Tue, 24 Sep 2024
 14:20:34 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:44 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-3-mmaurer@google.com>
Subject: [PATCH v4 02/16] module: Factor out elf_validity_ehdr
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

