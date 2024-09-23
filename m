Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C061A4ABC
	for <asahi@lists.linux.dev>; Mon, 23 Sep 2024 18:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115580; cv=none; b=eQDItCyxlMjJtvGHacnA8nOqvFzsOuVQBuay2px4KGOYRipitcQpyWnOtTNzbqy3ByZS+Cq2QyIrnjuwDw7E0PnL/5aPGwQaHUA4ePQXGAOecvDjiW+RsPyHtGGay64orG1CIp2NsY+OLdjjRJ8ixbFJjR6E1US5JfnPVXLjrG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115580; c=relaxed/simple;
	bh=+UvoU8FD7maTKGVExD/e4mqqBkqzCVeVz2B4x7Mcj68=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DfPYNnLzZl/ehENAuOFPdwiXK0r0eOzsT9phKLE8f6+DqrcOof8QG2dZsHiriW/6gszRmvfOr8SrZOkznewxcfjQsOw6roXdNFQ2CE6wkuyZfCQIRFBG0RQAw5SMVuc8ai1+V9U6H2Iem7e5gNLSRwhGtZHYawnw/CAQ3QtXqAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y0bxhTtU; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y0bxhTtU"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-71985a317fcso4622443b3a.1
        for <asahi@lists.linux.dev>; Mon, 23 Sep 2024 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115578; x=1727720378; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wBp4ZQRSWGSz9WsZC/MJ1xrrw9uz490jpQ8iIOLHT0A=;
        b=y0bxhTtU7dCEo/LOP9ZICWLL5J5bG31jsBO45VuigzSqG9VdugzOVcq4hnbbrBrzWv
         hgIpT5w1tt4GuZ4eojmZHAjh6vxEGr+0ElnuIqCb2b3NzvGOdJiZXx31xEh9X1toWMxh
         AiuKKhmtWyai5GnAmsDypjhZIJTx3cEL5dX7SAgG0YBXpHvH0iiVWJ2qhRh+wR6RXwix
         HvJQlnzAJ9ufHwvPwQLmWS+Q8TWSeB9xsM3LKPLqNxyCklNUp2WS26yCgXGGpYYFs0rs
         eJoIkGJ/X8ohKPfOHSxNEhdvaXO/1rSJ5ferinCfFINrLEnclKYD03UeSfDOvxzbjOEY
         6sMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115578; x=1727720378;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBp4ZQRSWGSz9WsZC/MJ1xrrw9uz490jpQ8iIOLHT0A=;
        b=X47YlPykoKw2rJZOI3yJw/2SjcwBvj2fzUWz70KA1TYjCYZ0TyTrtUu7OsN9QxPB6F
         ATypmRd9QgSpL53xt5LDqW6YT1x1KD0E18Or+2Jd78i6Ahj/fJMnO3cVAFfd/geVLDDD
         3n0KSrgwgN2H2TzKiQ/adXGm/L+2cAk/Meyo7XDf9s976ZKgKykzvOoOMqrUmgbg/H6V
         DBEd2itV9/94N0pVcWnVtWUpN7cIi6A1THG12/Ntn96SU1ziW4SKwWrdVskbsJpvRuEf
         /TckHvzegmStooP0KQfrTxOOut2OWs6ZP7v+UsfWP5zzx+JiQrlgOMphgKqynJczv8AE
         a7fA==
X-Forwarded-Encrypted: i=1; AJvYcCXDu7KPQmPLkEPdiUfQ5JXtxp0Fo2vUS7n0C4/AmfZsQ3jeo8aKEfhwM7SsVAofNquLMBc50Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPO7xCtlDFx4pfRTrXMp0gQJaYRFn1e5WwV9grfB3HR+nB1qdD
	kzvU8MU/W5QqeWLR4vkovtc+aFk/e0czYPHOCDDPvuwIeOCI1bEeLdyQkI1Mj31UgmjZfNFl9vq
	75zPkDXbrdWx9YXZVQyHSPkgR1w==
X-Google-Smtp-Source: AGHT+IEfhnnGFLNqxmlxpS6JZN5ZKd9QA3K4jtdAwTpy/rFImsyDZ7zzpRDe8/9I6s/nxiyGkzCR7eTK9rO2z27zOVg=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6a00:4bb4:b0:717:8dee:d810 with
 SMTP id d2e1a72fcca58-7199ca6bbccmr18336b3a.5.1727115578261; Mon, 23 Sep 2024
 11:19:38 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:19:04 +0000
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=samitolvanen@google.com;
 h=from:subject; bh=+UvoU8FD7maTKGVExD/e4mqqBkqzCVeVz2B4x7Mcj68=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN/L/Wmu/+g6PmN/FR6lzFR3evt4qxfT64czd7z++U
 PviHLj6eEcpC4MYB4OsmCJLy9fVW3d/d0p99blIAmYOKxPIEAYuTgGYiOtThn/Gwc87+donpSpK
 T54afXBp1vx9axN6DiRFfDHJtZUR9GNl+O9Q6vCAdcklt4Xy0Q9mM03Z9l9n0u3ExGWfWeZ8uVD //QkrAA==
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-40-samitolvanen@google.com>
Subject: [PATCH v3 18/20] export: Add __gendwarfksyms_ptr_ references to
 exported symbols
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

With gendwarfksyms, we need each TU where the EXPORT_SYMBOL() macro
is used to also contain DWARF type information for the symbols it
exports.  However, as a TU can also export external symbols and
compilers may choose not to emit debugging information for symbols not
defined in the current TU, the missing types will result in missing
symbol versions. Stand-alone assembly code also doesn't contain type
information for exported symbols, so we need to compile a temporary
object file with asm-prototypes.h instead, and similarly need to
ensure the DWARF in the temporary object file contains the necessary
types.

To always emit type information for external exports, add explicit
__gendwarfksyms_ptr_<symbol> references to them in EXPORT_SYMBOL().
gendwarfksyms will use the type information for __gendwarfksyms_ptr_*
if needed. Discard the pointers from the final binary to avoid further
bloat.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/export.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/export.h b/include/linux/export.h
index 0bbd02fd351d..cf71d3202e5b 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -52,9 +52,24 @@
 
 #else
 
+#ifdef CONFIG_GENDWARFKSYMS
+/*
+ * With CONFIG_GENDWARFKSYMS, ensure the compiler emits debugging
+ * information for all exported symbols, including those defined in
+ * different TUs, by adding a __gendwarfksyms_ptr_<symbol> pointer
+ * that's discarded during the final link.
+ */
+#define __GENDWARFKSYMS_EXPORT(sym)				\
+	static typeof(sym) *__gendwarfksyms_ptr_##sym __used	\
+		__section(".discard.gendwarfksyms") = &sym;
+#else
+#define __GENDWARFKSYMS_EXPORT(sym)
+#endif
+
 #define __EXPORT_SYMBOL(sym, license, ns)			\
 	extern typeof(sym) sym;					\
 	__ADDRESSABLE(sym)					\
+	__GENDWARFKSYMS_EXPORT(sym)				\
 	asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
 
 #endif
-- 
2.46.0.792.g87dc391469-goog

