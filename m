Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E98021A704
	for <asahi@lists.linux.dev>; Tue,  8 Oct 2024 18:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412751; cv=none; b=kW9gdkfocIuQJveEZsPbf/2cK5B3uLSwA9D1ITfr3r34PN5tkYEVeFICwbDE5LVo31qYBznOn3iig6qZiQJiKGa16aMB3S66Lh90e3/yFRC9eGWuUoXQ2Kv7Rf7oeOA1zlbCh1TUyw7IRHaX6DJNdu/OxGGPLJdI2g/asFzZStU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412751; c=relaxed/simple;
	bh=63FTcQQsHnD0ujy7ldzffjez+nFzb+CbbWB4scUUBT4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R3UG33y1iRoDskx8avGk4xXR8EOcpxjx9Jl9KNTXm5o44XZOiDEUP/rncV+oitlEHT6DCi559ZVtrhNV9SvHimm7rKEtwBWH+cq3HjCsL/Y9oHKcHTkz2C3n1sWKBarewMo9cP8tmNT25ky5JggXEngDw4jvuiAjjxIa4J3A+FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w+ISGsJ1; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w+ISGsJ1"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2070e327014so59621455ad.1
        for <asahi@lists.linux.dev>; Tue, 08 Oct 2024 11:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412748; x=1729017548; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A4gdQj2kSzdcnDtZR+VagbT7f5UDOVpvc3nQ1NtsNEc=;
        b=w+ISGsJ1uNBOTD7Y7pDY6LnH1t+9GkzmVTH16LKy7cprZmr2Oc/bfngTs06JHKpuHc
         dE7puOvaC0lBHHDXDaLpM9DAJfCbx4wDguWuUi+lbHCiFcAYK0CEiSrAitfaRZRVtq3a
         QNVeYIJKIpkKC45X6Ag1JpZAh10uUEWsQNBuTa+uo37XjHC3fi+GQNH+5iKrnAh3RwaJ
         mf4ReG5MRwdrEm7mNoHT91xemRRfs+NGIc9XSi1w9CRVhcJ5TaC4ZdHUfsyRcieK5naE
         eEwpvTmPM722PruwpaCBoim65jSNgxAg3/KXzqm/c5b1MwC3Y3ZmqrXSkGjH7t3r4Ajr
         Of8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412748; x=1729017548;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4gdQj2kSzdcnDtZR+VagbT7f5UDOVpvc3nQ1NtsNEc=;
        b=obRRE/dNDtxzILCam35qpjJkl1BqLpNEF+rJv3rhJIlc4arrCsrAFsxfNDbrACuHeV
         rrSLNGqVSIBG4pe31eT/StJ5szpfmuWbrWbcRElMJa6EpRLBcTgp5XVWeriKQ7pas0fe
         vY/d81HsyxvcUax4nev3D5aQo0ExySi68PICV1U9Z8TNj0md/k//I9qfRQag/SSSJXT8
         Rx76A5TaVRxRBF0FsEDRvbeAA8G9eYwLckHiuyl8TSgriHb0hLx+RQfVIw0VsCSdYB1A
         EQC4foBy9d+mBg+hd/M/DYHgEsnV+yrzfXo5hzHd+qk3gVyHO7pocyEQKJ7OkEHP4qHs
         11uA==
X-Forwarded-Encrypted: i=1; AJvYcCVStHdoALyRA2kyxqmQcyoqnCpxfAjjs8JpJTHHSnDLMSvCggZ/UhGY1af+UlRgUy8ipj2KRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPD+Fx2PSYCnTV59DU+iijbqVsBxryLrkQGB+jCe3c3YVeEVhV
	CkDhyZdlwvgpUt7D/mkqGBxDlOfOButFvETyzTjRik2H30dihw5732zLL/Da8qGFdsj6B5L6i2o
	uwoEfjjEPhq5/PJWeJ1F9AvrphQ==
X-Google-Smtp-Source: AGHT+IH4uDld0Ae+/fhGpS4rG8AsXui7zPcfmITo1sskAJxITEdUVNeC4NRhZvQwVt5ry3RgjuLHg8OC5hd+mt50H8Y=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:d491:b0:20b:984d:7000 with
 SMTP id d9443c01a7336-20bfd971431mr1757795ad.0.1728412746828; Tue, 08 Oct
 2024 11:39:06 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:41 +0000
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048; i=samitolvanen@google.com;
 h=from:subject; bh=63FTcQQsHnD0ujy7ldzffjez+nFzb+CbbWB4scUUBT4=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNRpG/111u5W0hZqm1vFmmz/T2LbvG0O6QZZc0RW9h
 ILTJ2U6SlkYxDgYZMUUWVq+rt66+7tT6qvPRRIwc1iZQIYwcHEKwEQWfGFkOHiaqenqT3WXl0vZ
 +GRnuU789WO3+Yd7qalh/16/amCZrsrwV9qfp/aZoGsNo1j4m0elC4Q553GkOlgop/W/nZI70/M GHwA=
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-38-samitolvanen@google.com>
Subject: [PATCH v4 17/19] export: Add __gendwarfksyms_ptr_ references to
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
Acked-by: Neal Gompa <neal@gompa.dev>
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
2.47.0.rc0.187.ge670bccf7e-goog

