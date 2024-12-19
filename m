Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C5C1FFC64
	for <asahi@lists.linux.dev>; Thu, 19 Dec 2024 21:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642500; cv=none; b=WPaJ8JgY4Bztk0OoE3v45MHJ+VojQtkQsUMM7+AUIyEuxiYIOEgrr8ZKPGLvKQ5c0jSXWbC5ynuQ5ZI1zp0wbURXyehh6qriHxY7i1XLY7lxLJ7tRGeQS51Odcen44O3+7ogbp3YW5BkZdkCPLFfziWU1ECOOfHNk4q61grQ/QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642500; c=relaxed/simple;
	bh=G8T+NnXPkjDtKGjHLSfjrDpCNmmPfEyUeqSk1ZhBztg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K2EOpXdkk/ccq/7qecMBimG1K/V/L/NVd9YcKOnzvnZoEE/VhrwO7QpKOESGUreUEE2fN9iCHvT6x5BAchjc5rpE8E0fJlrf3wkCUT+W1NmoR8mYznqB7zmFnd+ea6LF2uG8CjE8PkWNYpjVXv17n6eO15rk5en7vVX0GrhuJys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sKeT5YMr; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sKeT5YMr"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7c6b192a39bso744887a12.2
        for <asahi@lists.linux.dev>; Thu, 19 Dec 2024 13:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642496; x=1735247296; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XhebaHvwRpIK3ajuqUsaMJY6c1H8vjbSZoFxdXzqCTY=;
        b=sKeT5YMrUZE/ZvutkPLS0zFJx96RhyxgZtXUX07grl9WpyXsd6f4uM+WgmNphSVlxk
         yAcfdWyFpv/8no3j7JOoKjsNLrXo5XWUFZavNyQK6Kvdqb8unXMueSA2a2IlJvxwjNCh
         +dazWndVRhYEQKExRKfiSU1cLMXYTR+SC11qxvt0iIkAkqvSayQ1Qq0up+6MSCnP9ti+
         ssspIX6/ZjMvjuVSGwrAOujK888Cwd31DvKj12ZVm+e6P7jzNpAxxjP/zS2n1qgexkhk
         b0DuQVCM/Nio/00RXJ8CN3m2mXKupohV5YzCXQPr28p+m+hrpYCWxL3ljYN0AtOXDotg
         6RhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642496; x=1735247296;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XhebaHvwRpIK3ajuqUsaMJY6c1H8vjbSZoFxdXzqCTY=;
        b=hGbWqq8+R/rPTh4QHkXnQpxpkL4xnXfIKzg0UkUEy2u0wWB96TyJbUIcQYXx1LTWSW
         tTAQD1l7zJ63uHZkm+kDI5/u5AzVB2Aju4xiYKn+S/fHOO6FL20Vxm6czFBzPl1ZZBOt
         Yz0wxdiDMmOM5LqlvpKzcdZLXGpGpUnf0KDyoh6w4I8VinZG1fAQSTb0ek7nSyOPCoz+
         2m9ov4h7V6H1OD037HkUVPFK5CQvLM/c3+kMd8LA2XJ6l949x8LFlNkrAGabemHeXlAR
         YCvDfpgRmaZ7ExzI/VX4ixmj5Ifi8/PxoUxDlOQcd+seI1uc2YADn2g3UiHcGRquuNwg
         EbiA==
X-Forwarded-Encrypted: i=1; AJvYcCV47+n70fqiQjGkcldEKQjad5lczCyETm4nYvZx+MYrPEyBVqPlhfDuaHRzh8xFs6ha1HPwQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6qhUTEgJH0Aldco8wmxqQLbbaJGh8tBALfmRiq8s2omtyhJ/9
	rR8SZiR9EY6eHb44Xe5CbdqdvNBtx+6Z7fEUzxpTVmbc46NXk9Zcs/Bd3udxneXRRYDpuP3XVWb
	ljXhXcTHtRYh1tXbxWkcGYVlEOw==
X-Google-Smtp-Source: AGHT+IFhC4Ah0P2LpeeGNVWwyHAZfHL11yB3Qlfn6u2eyEw2X2bDrlrkxGMrpOMsrenz4F16xpWQ4hhDijC681Gi99s=
X-Received: from pjbsc15.prod.google.com ([2002:a17:90b:510f:b0:2da:ac73:93e0])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2744:b0:2ee:d7d3:3008 with SMTP id 98e67ed59e1d1-2f452e205b2mr861955a91.12.1734642495981;
 Thu, 19 Dec 2024 13:08:15 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:53 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=samitolvanen@google.com;
 h=from:subject; bh=G8T+NnXPkjDtKGjHLSfjrDpCNmmPfEyUeqSk1ZhBztg=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3YrdtVHhySouOkF7m0o/qbT80J9sEuBUNadufYapv
 7naryUdpSwMYhwMsmKKLC1fV2/d/d0p9dXnIgmYOaxMIEMYuDgFYCL6mYwMC8QNvC5Va/C6soQc
 2nND0fFj1mrj2OxZJ382S7zpEX4XwfBPU+d02AeenJOZBg++HOXPnffloVHvtx28p1rmeYb8rvz ACAA=
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-36-samitolvanen@google.com>
Subject: [PATCH v7 16/18] export: Add __gendwarfksyms_ptr_ references to
 exported symbols
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
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
index 2633df4d31e6..a8c23d945634 100644
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
2.47.1.613.gc27f4b7a9f-goog

