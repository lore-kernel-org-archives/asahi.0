Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AE617A583
	for <asahi@lists.linux.dev>; Tue,  6 Aug 2024 21:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979294; cv=none; b=e8n/R84JAVbqbnguJRUphY6NU7+UCWvW1RTAgfcHvyPmd6pd64+b1x3OnuW0+nnUBRqTb3H5aCAru2JtSuddc8dr937x6Tw4GrrNwsi30LBgxECA9KUpYgjav5W/ZiwTX+qgKrSYGHecVwkWzlALSOX4qRELu3vgfQdBDuXfbT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979294; c=relaxed/simple;
	bh=epnI8eGvDDKISVPVfjjyglGB5CLDgu79i3HpiZi/AGs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Fk8E58hQSY28PGwrAuPtBoN66geKtiHKXPqgL8hfGLCor7kgnZftNWtdUrHBfvloJ7iun6uTVmTc55OpIaSQr+1B0XZVEX/SRIEyYjV1++14LhaoqkgEkFtuoSzF/efWtpV8joTpJ+Pzp0usnw7U8rH/fYVAJVmjkbYTl4NZhik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Etj+E1yu; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Etj+E1yu"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-68d1d966c06so21599647b3.0
        for <asahi@lists.linux.dev>; Tue, 06 Aug 2024 14:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979292; x=1723584092; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FQ2zq/LCKzRU6SFahUeU1WMrViDXPV+lPPZmW0ps8uk=;
        b=Etj+E1yuIfrAUo8wUfyGTLxaTRilXZiyWQpvgsuqu8R0xJ3rx6GnCq65b9qAYLqMBl
         JFbmQwi4V2IPT3l5Kf96GzC2Hp9CgeBYDMHxUVPOqSxYWn4cjhAkQoiXTjr+88V8B5tP
         KV3bMEh/zgahHQBc3CW2r2UUldu0+8fJa5qo5VlT1YRR6uD35Z4qW8v3qlO73BUjDmTW
         WIK9QAgrTH3azPXkhEDQNDAIrCw/uQsjlPl9he50b4Bzpd9crx2HIkivosaPS7ef2Zdt
         Aeq/oYyk/HC35OdknjJg2BlWFXXX6Q6dttMGTSC9ZUJ0IQCPifVxUwdb5kYmRFlxm2wI
         GY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979292; x=1723584092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQ2zq/LCKzRU6SFahUeU1WMrViDXPV+lPPZmW0ps8uk=;
        b=CkIO/O3QAe0Ko5MqOxzsNZbQss9Wp28R+m5UlrzxFQKf3JvJ2aKrLeDMONJFggQOKQ
         SPAns23kgwSb31d/NIU0QbkB3yv7LL22MaIvTx66FGHgkIhKfC7Bc8M6qKRdxcdHcKrS
         aOCXAQ3PJs33c9faYPXJIiM/n0MFo6Tnl3pxN9O9jpQwub9H1tZOAXdnUGa8uQQemcyp
         kLx4NwlSQtL5OQLPjOIOFtyf21Z9bJrOPdcZlkwjEMUS/Ow04jXTw3z/hyc9WUQaebbn
         HUqm+gEXiaiVPyndbvt8TZs9n6WcGTamsdGSN67zXsx87IRXVn28FHlv63pZvz33W/vW
         pjSA==
X-Forwarded-Encrypted: i=1; AJvYcCWV0C5rXH29KoQ8LAPEq1WDxeGLNYpOn6YizcemZb1B1lpveoC68oDD/NbWynbQVFarrbmD1QmsvS9A+Zm5QLi9tXUL+pw=
X-Gm-Message-State: AOJu0Yzf95cmtDXvU+ioTmGRHlpDmaWP3tv3auvuLxxlKAbbbx9WZy84
	OOKGSshL8yNmTtFlrOvGCer4WQ+CldiPjJit4W1oGKecvrJWf9d8CFEMXjR/IugL6EUUIMeS6S0
	kl42ksQ==
X-Google-Smtp-Source: AGHT+IH6x1pd7T7CSwv3R+eylAyRZmNxI/232pEEFyoDFtMxFDuEMBONgvXpuP7EkLOuGdtv0x2gUeU1cK01
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:100c:b0:dfa:8ed1:8f1b with SMTP
 id 3f1490d57ef6-e0bde22affamr345027276.1.1722979292488; Tue, 06 Aug 2024
 14:21:32 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:37 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-12-mmaurer@google.com>
Subject: [PATCH v3 11/16] module: Additional validation in elf_validity_cache_strtab
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

Validate properties of the strtab that are depended on elsewhere, but
were previously unchecked:
* String table nonempty (offset 0 is valid)
* String table has a leading NUL (offset 0 corresponds to "")
* String table is NUL terminated (strfoo functions won't run out of the
  table while reading).
* All symbols names are inbounds of the string table.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index d70d829b5ab9..7001054c5c4f 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2090,17 +2090,53 @@ static int elf_validity_cache_index(struct load_info *info, int flags)
 }
 
 /**
- * elf_validity_cache_strtab() - Cache symbol string table
+ * elf_validity_cache_strtab() - Validate and cache symbol string table
  * @info: Load info to read from and update.
  *        Must have &load_info->sechdrs and &load_info->secstrings populated.
  *        Must have &load_info->index populated.
  *
+ * Checks:
+ *
+ * * The string table is not empty.
+ * * The string table starts and ends with NUL (required by ELF spec).
+ * * Every &Elf_Sym->st_name offset in the symbol table is inbounds of the
+ *   string table.
+ *
+ * And caches the pointer as &load_info->strtab in @info.
+ *
  * Return: 0 on success, negative error code if a check failed.
  */
 static int elf_validity_cache_strtab(struct load_info *info)
 {
 	Elf_Shdr *str_shdr = &info->sechdrs[info->index.str];
+	Elf_Shdr *sym_shdr = &info->sechdrs[info->index.sym];
 	char *strtab = (char *)info->hdr + str_shdr->sh_offset;
+	Elf_Sym *syms = (void *)info->hdr + sym_shdr->sh_offset;
+	int i;
+
+	if (str_shdr->sh_size == 0) {
+		pr_err("empty symbol string table\n");
+		return -ENOEXEC;
+	}
+	if (strtab[0] != '\0') {
+		pr_err("symbol string table missing leading NUL\n");
+		return -ENOEXEC;
+	}
+	if (strtab[str_shdr->sh_size - 1] != '\0') {
+		pr_err("symbol string table isn't NUL terminated\n");
+		return -ENOEXEC;
+	}
+
+	/*
+	 * Now that we know strtab is correctly structured, check symbol
+	 * starts are inbounds before they're used later.
+	 */
+	for (i = 0; i < sym_shdr->sh_size / sizeof(*syms); i++) {
+		if (syms[i].st_name >= str_shdr->sh_size) {
+			pr_err("symbol name out of bounds in string table");
+			return -ENOEXEC;
+		}
+	}
 
 	info->strtab = strtab;
 	return 0;
-- 
2.46.0.rc2.264.g509ed76dc8-goog

