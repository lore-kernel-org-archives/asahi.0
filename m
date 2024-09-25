Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80A31AC440
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 23:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307582; cv=none; b=ps2fZZwuiSzN2MAXrxk6mZH6bTaheA82W24NxFXiGtM4CWeR5GOHByHoKhEZ3CPsN7I2ysLgHezm9/2Mavt9yMcSdNgZov5Z8frM6sUEa8iNrt4pXCEVRqupuM7IRiXoFgfqhdQ4DWVCwK1cL6uWuLUfrYWXS4ProCWeeBLb1eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307582; c=relaxed/simple;
	bh=wM975yYhhnJbskoT3Xe/Z8RaXLTIAwoZIK7NoqKeDB8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JQsxk6QtAlHG2MQbo9VpSqCZd1/UtYfYrzLhakv3wKgmSqhzOFvkaFFe9f7t4nT0hVbknWSHU0WMI/w+6H8A+5Ue9CT1e7m/8PuJw9z5SCCRarT6l8WkAd+IGCvlCLgXa27HRVSHW+0yXvfuROAIhu4Mks3ZdlMarFof839T1zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yprN8zcZ; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yprN8zcZ"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e0353b731b8so587533276.2
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 16:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307580; x=1727912380; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fOjsxdYdAkInxupUorws184MmwFGmal1AWb/bAcHrOQ=;
        b=yprN8zcZBhHasCYBoUKztmoC34hIukaOu3aq3Erc3I1xHjdzaYcd1WK5ks85/UlQtS
         4HOCiLsW/379shiqb4LdyASx47gxEgpqBwq1+sOHI5zsfG+s2Zq3Qn6zgqlH3w0HSKI7
         z8uIlnygFXNiVcIRZ08AX8Yj949rOGhq06l4qUlLgEl+5uf98deYBbFkfxoqlGesonJl
         I3NkbIeM3/51/ZHqkCKtJd+Vx9ot2dQlfBYsXRoibyHTJ/jTiGtEkDLVDSe5E6pfb73k
         2wcC/0L51pJnHh3DzVqL+h0jns+17d6Ygv0yEjgNL3lR09fIiVp/DigxtKckJslC9QoT
         Potg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307580; x=1727912380;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOjsxdYdAkInxupUorws184MmwFGmal1AWb/bAcHrOQ=;
        b=LBNJiBQx98YcDJgM3UXEoa7w/nnqYYR1i8xVqwAnPjdG6XysRmcHkmTCaj+rajDfjZ
         DBgKI9pJ8iuHylh0s2gqCgIPZL0dGEK0VceZsAc0ve16dgOKMhd75932cPLGdfm2Jx7t
         lo5XQ4MDrQsfFBeB8cyUUhhRPRYI0Nk3/+c7DypXfQarPculFwKzVxNHMHknmpVSnDT5
         8LUQaZMqbqpK18Ewj1dfWpyTgxyjnc2NLGhF1E4Eii5QR/U+KFPkcUtsxxYlGjUoKfdS
         iZZsjW+zWqLzyuYMy035MsXd2Y1yBtMK3lMHO3moMyxBsg9/r8AW/cOGRbFrbkWtwyDY
         By2w==
X-Forwarded-Encrypted: i=1; AJvYcCUTGEuJTsPQM9PH7Wrlxv1MHpKC5+TxbvfT+U2zKcCOXBVa6v4AsasqXJbOHn5P3ISw/BNMog==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrGoSvhQ9V5ei9+9GiwjG/DZ5fiRUwHZNjVBLvDgRRpAfkMISf
	OjBpmoZdRhiXPek3Qbh3mqG47172S4PkQ2zBwpyKaF5bfOKafEtMaUbEv5OJrYDFYzxf/xhH58a
	jh9CAcA==
X-Google-Smtp-Source: AGHT+IHdWqR9IrD2hZQX0Xo9yhQJzQmApDf52iNmKjMPjmcrCoxOYUdkaSUs0GEug6EnSPPHsMtafWiB8pKN
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a5b:841:0:b0:e24:9af1:43e7 with SMTP id
 3f1490d57ef6-e24d7fdf205mr3591276.5.1727307579861; Wed, 25 Sep 2024 16:39:39
 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:23 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-9-mmaurer@google.com>
Subject: [PATCH v5 08/16] module: Factor out elf_validity_cache_index_str
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

