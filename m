Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A111AD9F7
	for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 21:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212855; cv=none; b=jLE1wX7GTKa7PcRAXYgYVVKJbRUqFFvcieYsA2bgz8YWm5cKCKQTkGQIGB0Y7QB5YIbv6SaJtItO3Ynh6kI4RlPQguG/X7T+bzUCN2UO/4i6JccddABddO+zsi4zBNjVzXOdMlFuOp76kHvhLJR7ZAn1+QjK3sWS20Rd+IiTSo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212855; c=relaxed/simple;
	bh=RFwYTaeqemLtmezDNnI4k0C/4IQdB480nO3xNfeeufc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h2Lx7RYtX6RT/A1h9+GuIV5i7uPxQ8/FhHCBdNP6DzNk90663hLj7ttc0SB37sMTrtilSlePsDDMPamO8yayIJmXptJNptOmY5eXGyLj5ASH21020Bq9UIKJilCRUOXPUZVlnpJ7h3tguurBzRuYImBaM2ky8RGr91Ohfa7CULQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yPRy1dno; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yPRy1dno"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7cbe272efa6so5617872a12.3
        for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 14:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212853; x=1727817653; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=extRuG4D1AdoHKvsMv2fLx/d2D/gEpHsXYLRVzC3Sa0=;
        b=yPRy1dnouxgArvYfIx4h+aVkLh8oyVKGAWrnlnvK7tfSo/f+eV3O877ELFM/VaJjRO
         FoJINNVCdCNNXHoqauxWZsfvyqK1yFYuNHP2oBokn3Gy08eFoWA90REPZ2N6Nkf+0nqO
         5Tx3K5KOBQlQjjKoRSSrDgc+ajgdMntfS+VftV3Oz9gxcLDixIhE3L4yVuPi4+1LG/tb
         iNkMOXiGSNhtgluj1TnOcs/2uz5kQQhH57fQtK4wc83IqLZ85CgMpMXsLvMkqUgNwgvi
         gvnuD7e6dSAOB4NKY+H+msH8A8xC2ZLWfwB/Rt6QKi+sifA/1Gug6R/2gPTKmQaaPhoU
         efPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212853; x=1727817653;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=extRuG4D1AdoHKvsMv2fLx/d2D/gEpHsXYLRVzC3Sa0=;
        b=anY9qb/7O7wIBd/I2TnMG+S+HMEs9eqhx0PK2hHlED0sAlSuaOSg8WgDGuEYH6lnWi
         WBwfTpIIGpJFtZI/tyJAz6LgtFjr/0tH9D4kg5bK6yeoyHmd3ePfAfMTy5cvkT4mInrp
         H0xVzzAnBGHeKdezH6tfRtO4FT8jEdfHSREJiUGSu+vPIdPbHtBIxvo2dc93TTGnm06I
         s6qUqkk308hgscFCo5aKMDGHsJdi+W4EIGvAgRwQY8jNDFAHLdrAMmhKLv5ihcyrmDDW
         YcpvUMB9Ds3phGavtJNyRZy1SYo7eVxi3iPlxONrUMctkkIutGshOpQksA0bnhKRlXbs
         NLFg==
X-Forwarded-Encrypted: i=1; AJvYcCUI4nresI7JF/gmuH+yQ1QiDEjZSVu3ERV49ooV/0bFikEBNmI/oFp0JwM/zv0OMrm/N19LIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YySricPntZxgftZp6vQAi8wyaeXyichH8Sj05cpqRtAgdnVC2PG
	8/vGFhdDgYNTXNQATae0g/txvioWSymj7uzd6oiUvrZEkjcWUQYdQvVq1tSoIiFLctXJaDv73Zk
	k6LZ4rg==
X-Google-Smtp-Source: AGHT+IE3L8DCbOXBbulDlaKBgDSXwFgtzL3CsvCHzYn0GW9XmpM352NgTobVLRsi4oRtR0Auru991pms+fQd
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a63:2403:0:b0:7cd:8b26:15df with SMTP id
 41be03b00d2f7-7e6c196835dmr1649a12.7.1727212852738; Tue, 24 Sep 2024 14:20:52
 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:52 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-11-mmaurer@google.com>
Subject: [PATCH v4 10/16] module: Factor out elf_validity_cache_strtab
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

This patch only moves the existing strtab population to a function.
Validation comes in a following patch, this is split out to make the new
validation checks more clearly separated.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index e04a228c694a..c082d5d41a8d 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2089,6 +2089,23 @@ static int elf_validity_cache_index(struct load_info *info, int flags)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_strtab() - Cache symbol string table
+ * @info: Load info to read from and update.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated.
+ *        Must have &load_info->index populated.
+ *
+ * Return: 0 on success, negative error code if a check failed.
+ */
+static int elf_validity_cache_strtab(struct load_info *info)
+{
+	Elf_Shdr *str_shdr = &info->sechdrs[info->index.str];
+	char *strtab = (char *)info->hdr + str_shdr->sh_offset;
+
+	info->strtab = strtab;
+	return 0;
+}
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -2122,9 +2139,9 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	err = elf_validity_cache_index(info, flags);
 	if (err < 0)
 		return err;
-
-	/* Sets internal strings. */
-	info->strtab = (char *)info->hdr + info->sechdrs[info->index.str].sh_offset;
+	err = elf_validity_cache_strtab(info);
+	if (err < 0)
+		return err;
 
 	/* This is temporary: point mod into copy of data. */
 	info->mod = (void *)info->hdr + info->sechdrs[info->index.mod].sh_offset;
-- 
2.46.1.824.gd892dcdcdd-goog

