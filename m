Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE131AD9C0
	for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 21:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212853; cv=none; b=KTpylAUXa/5egH6UqV+11WRRf8zbhOCmlWJbvuZaXqSrsxlFfZ5ZCOEe0ofRIyihtJuP9A+xEeUe769Tw+n/AoesXcJGrdafUDE1ymzVW1gi1HboQOUx+4jp30Vwl4B+QRrYa+eIhdNGvtgI8STGjgx8+IRVAAW59kV8LyeUeOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212853; c=relaxed/simple;
	bh=uwfaf/NAzm+40ipxYEoBkkFYyfKzhKmnZzjM3YJU8lE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W1X1TRFGVtDWg+CJanpIYmFylMnLYEHuNYRWF5/tlYTRFTB6pOBO50yh4iMJlLpBDkQKKsCWBSPpztWWV43TjmOFgjLQv0ZvY6YKrGEJKMxlp/nUBDtbGMfBfAgh4G33+2jiSxsl+kFiGPtsFhJ1qyhKIDeItR+Y5y93KvLCEOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PiwIDBMq; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PiwIDBMq"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-718e2757e5dso268476b3a.0
        for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 14:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212851; x=1727817651; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tc4NXPfplG38lAGlz62WMnJTBJMM1sboCG51BTx1YyI=;
        b=PiwIDBMq76A8GHr01S59KY+Y1kZpcfKUp5aOSD2EPvMy5HA7NLwbti6TUxCliAw6PM
         q01Ie6lyaHW2PPyCZA+bCJ/DVcjs/fsF8Co/s5psP+l6g5sDWCEwBGW4Pcx4raI6moOW
         VhMX82fnfpgkkYOIkwIQHkvFtQkVT/keGxOCBNcn/xj6KgukemzlD6ous6s+TtqPgP5B
         VcuymoQkHAH7IitvbXz1Sk5ONE9pya4LtUNz5RJpOBiFvmzBLv//vYnOiSp10baHq5ed
         AzQ5bVOViaDVyTIV3UVe3pCIDD1ne7HssoWl3IRd+ZWTsAT9G1ihyTp7P8K3UC+Xn1iF
         8PRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212851; x=1727817651;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tc4NXPfplG38lAGlz62WMnJTBJMM1sboCG51BTx1YyI=;
        b=NcL8fL6s4DWC1ekpC5V/HnfbMmEQNx7lhr1eT4ZyHGL55PGqkoACShJm03XzjR9HFK
         rz8Hg5cc0QNYbykTXj5rVSBFVzs9E1l/+y9LZ9mzFgECMHZJs1Y2lq4N2sUYXZbukrM/
         u/uItHgEI3X0xzTKpAFfIDx718cBlrcD8zE5LMd0OuSVvJ8FebP9uCzD2BQhO+GCtYwT
         n5HewIoVuhGio7EyaBwfuZ3KOfOUl7bjkLkit2/9SQfsmRz5YAswG+tIbB6RADmt5hxJ
         YEK4HO3Jmo7mLHqUBN0Ar4bNxqm7IzEiGqEkGudGLuCpG7jvdpZUDrjtz+0PpowUvSKl
         Trdw==
X-Forwarded-Encrypted: i=1; AJvYcCX65wyXJ3R8745sLGGQDEtsM+PHwzlqX4avcvqVKB2QmW3htIvFq/H1RQmmhv0NUvNPGPYOUA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNDot/ep7A0Q1DsVSWR6ORDi0QrimFzV/5ekrydr9SpCLP0V2R
	V33VbTraCRt/Ms44l4j8jfTcBsywmPO5AhfFHbiS4PDu3BMJtHwmgCvXZB8sgyY6CdG6qS0LReH
	xVBTijw==
X-Google-Smtp-Source: AGHT+IFc0cLHI1DIHW3iv1HS1lpzlyZFE2dh7wfT0y53mgMrlUYIuhfjF8hSBv8kqOW6VtsTFCjA3rrjGyiA
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6a00:22c4:b0:718:13bc:2d85 with SMTP
 id d2e1a72fcca58-71afa29a5aamr19380b3a.3.1727212850468; Tue, 24 Sep 2024
 14:20:50 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:51 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-10-mmaurer@google.com>
Subject: [PATCH v4 09/16] module: Group section index calculations together
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

Group all the index detection together to make the parent function
easier to read.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 68 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 17 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 43140475aac0..e04a228c694a 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2039,6 +2039,56 @@ static int elf_validity_cache_index_str(struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_index() - Resolve, validate, cache section indices
+ * @info:  Load info to read from and update.
+ *         &load_info->sechdrs and &load_info->secstrings must be populated.
+ * @flags: Load flags, relevant to suppress version loading, see
+ *         uapi/linux/module.h
+ *
+ * Populates &load_info->index, validating as it goes.
+ * See child functions for per-field validation:
+ *
+ * * elf_validity_cache_index_info()
+ * * elf_validity_cache_index_mod()
+ * * elf_validity_cache_index_sym()
+ * * elf_validity_cache_index_str()
+ *
+ * If versioning is not suppressed via flags, load the version index from
+ * a section called "__versions" with no validation.
+ *
+ * If CONFIG_SMP is enabled, load the percpu section by name with no
+ * validation.
+ *
+ * Return: 0 on success, negative error code if an index failed validation.
+ */
+static int elf_validity_cache_index(struct load_info *info, int flags)
+{
+	int err;
+
+	err = elf_validity_cache_index_info(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_mod(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_sym(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_str(info);
+	if (err < 0)
+		return err;
+
+	if (flags & MODULE_INIT_IGNORE_MODVERSIONS)
+		info->index.vers = 0; /* Pretend no __versions section! */
+	else
+		info->index.vers = find_sec(info, "__versions");
+
+	info->index.pcpu = find_pcpusec(info);
+
+	return 0;
+}
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -2069,16 +2119,7 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	err = elf_validity_cache_secstrings(info);
 	if (err < 0)
 		return err;
-	err = elf_validity_cache_index_info(info);
-	if (err < 0)
-		return err;
-	err = elf_validity_cache_index_mod(info);
-	if (err < 0)
-		return err;
-	err = elf_validity_cache_index_sym(info);
-	if (err < 0)
-		return err;
-	err = elf_validity_cache_index_str(info);
+	err = elf_validity_cache_index(info, flags);
 	if (err < 0)
 		return err;
 
@@ -2095,13 +2136,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	if (!info->name)
 		info->name = info->mod->name;
 
-	if (flags & MODULE_INIT_IGNORE_MODVERSIONS)
-		info->index.vers = 0; /* Pretend no __versions section! */
-	else
-		info->index.vers = find_sec(info, "__versions");
-
-	info->index.pcpu = find_pcpusec(info);
-
 	return 0;
 }
 
-- 
2.46.1.824.gd892dcdcdd-goog

