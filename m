Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A90A1AC8AB
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 23:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307585; cv=none; b=qKKFfhVc9Bt8iT+WvcBrdUzlrgPgkJCcTsn1+zYXorleE6PHIbU0JwIzMd7aLhC4A7Ug7/2oWKJcmOXk2OwYEEYCTNBwdVyquW6anrFzM6wLA4zhpsZFplEl4+181ERCsV7ShEzxFWxnS1NqaHrQyLZ3YyFE5tEA/IBANtmHecw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307585; c=relaxed/simple;
	bh=uwfaf/NAzm+40ipxYEoBkkFYyfKzhKmnZzjM3YJU8lE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ueZ58Tk3YOHWu+IlUtXeD9fLmhXoNM5QOyUo+D5yKFsdOfMnFpMlSKUPohOmLrhXss94oijk9JJh1vx9dy7pcWCzmW6SpTSeUZjRvprTuOvwPPjNXqEROn8N3htV3K7NnaarumjkJ1NK0CzPRdKcT1M0IkPGif3HCOJ7WDDhsKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yTZLKZCb; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yTZLKZCb"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e20e22243dso8138177b3.1
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 16:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307582; x=1727912382; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tc4NXPfplG38lAGlz62WMnJTBJMM1sboCG51BTx1YyI=;
        b=yTZLKZCbiTm3ylR/6QtSm61mONaviGt0Yj08PQyhSUFt14yCmRFcIsNU4Op72Q6J8t
         xIwtmVADeOAMtdFfgXiGX/u12iYY8MOypvEOIiub4BM+kq6wpxy5QkiEotzlZGKd+PuZ
         aEEwNoHEvf+fzGs1OM+F22eQIOmuOOEgr1b2cKrP8y7HHJCXIS0YLFR9DrAXEMsEa+Rx
         BBZllpJZq8ikYfBrrGDyFOAf7eUJGlOo+uIY0poUk7BdOvb6xYtD91fUji1iFwEveZoa
         rpPSNQ2vc5KnXG3v2Pk5tg1SNnspDTGKKhqJpzgv0SzC0rA5e/TlJUm2uRlHx4wOyHRp
         wL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307582; x=1727912382;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tc4NXPfplG38lAGlz62WMnJTBJMM1sboCG51BTx1YyI=;
        b=hbIiZFCfrzoiKrhaY+Z1TBPg5FwP2Je1H6Y6rucUoLbzJWf4xG8jYEZZd0cUZ0NotM
         wHKUQGYxWZDvTysaDSs3Ja65105NjXKFN97htRVpM+Uwj1rH1DZds8PK16SHkAiW/qaI
         fnNA+wD+1AhdD89k0KR2Y/B1yr3FkvpCqcJG2oSY8zLshjfC47bRKmn82IELayBtl0Wh
         Hy6YQElAW5Qy0YbIE1sk4XpPuDKw5HO7gjt5dFpkMAE/GtRzu5oMYzxOUGKfEXwAgpWZ
         2UAogNXWckaxQBYj7bzDZAolhOduKfm1so6++dtZrCbnpfo/6yNeIRSPYFWbzAQ+Eds+
         lrGw==
X-Forwarded-Encrypted: i=1; AJvYcCVXsyBOJj/j7ln407sNqufJ2Z22shilNTNKD0GecU9hn4Tu5henmlbRFBJz1YJeAp2r5Bck7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEwvfrLPO1lZhz9qNbNz1xrSnySJmzFvtwvmo+iWFqOWUVhBOn
	jee6sTbS2B7b2odmXSKR7ebMEFH8FiD7PVTsLigEgGnEGLfzab448iataJUCSL9rdcElRItOmrL
	CjuOdfA==
X-Google-Smtp-Source: AGHT+IF+swNEdiAvpBogXsgKrBiSvXnXm1t/O+Acxf832i2L6CrfB3YUi3r7S2mXXta4Ea8IRO3aupfjGYBp
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:1367:b0:e1a:22d5:d9eb with SMTP
 id 3f1490d57ef6-e24d716247fmr3341276.1.1727307582039; Wed, 25 Sep 2024
 16:39:42 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:24 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-10-mmaurer@google.com>
Subject: [PATCH v5 09/16] module: Group section index calculations together
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

