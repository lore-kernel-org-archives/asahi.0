Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BBF1C54AC
	for <asahi@lists.linux.dev>; Fri,  3 Jan 2025 20:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937172; cv=none; b=jPeJIBQAvPN6q/9MFTSZbbbIRxGYwcXNfjr5C1xKQnp47s1u8XbkjA8xuRAahLwl3cJmXODe53tkiwTtc1IzZ7k2VkjcfPnW7/Hapyn8885UDWjak5FckNyuHW7aacW/nCphSQp3+ak5C35nndYJIAYfJO1nFCOwStrfzIxerws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937172; c=relaxed/simple;
	bh=G8T+NnXPkjDtKGjHLSfjrDpCNmmPfEyUeqSk1ZhBztg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Oc1tIgss4n/MIja4YK4ihnWrKfXd1VtA1/6DMAVWdpivSD+0W90k1NfoQAzqSgCIrLyxIhkcCTN0lzRkP43TGcqdJjHdJv64k9BR6Xiki8K+WovS7ruNKomAYZMbQbcclZ/w3v9xHmyBkpNflmpyN5gVhMIymAUJU+gyvhu4tQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HfUvDVV3; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HfUvDVV3"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-218cf85639eso3709175ad.3
        for <asahi@lists.linux.dev>; Fri, 03 Jan 2025 12:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735937159; x=1736541959; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XhebaHvwRpIK3ajuqUsaMJY6c1H8vjbSZoFxdXzqCTY=;
        b=HfUvDVV3p2jXL03aAo0ZVCd7TXsHyXqZCQ8R+yNtUzf8URX3cQ9VxtL7QIL6w2pv49
         WKyQa5Pd8m8Ou7POaHiZLRTDY0y8R75ilheU8kQl0KtxDG3Mltye2hmMTTtRRDC/x/cb
         e8WV8EpDD0cwtwKSsopx86P63jcyxCR7KG517rRhwCN76QI5iunjdQWcQzjdnVILXYbu
         nQrlyDwN0W/EVAr1LJSrNq/LsptQhiNRykS/EwMRTx3kWkDJECy5/WgXOHW1pcx7FLrV
         sI7l8OiiVAzK7o7dzAaKk3AGJccxT3r7L4zHgUqUyyuEPqidTlgi/rfNMBQrQSKTvBc9
         fIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735937159; x=1736541959;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XhebaHvwRpIK3ajuqUsaMJY6c1H8vjbSZoFxdXzqCTY=;
        b=jK3XBks5QQv4qMJNMB2nllO6myW+/SMCAYOpHuRfzMfYfBqwTJ0pCEkKxn1r7Hibrd
         mxH3adYe4oWcL7OVzfy5oOelb8eeCCTa3IwBFBt7BdUyh454SaD2ATqOclZQOUiZLu4F
         7EeYkgKSWwNvP+9PA1Jq2aGdLjqIB2Sr4/qOAEuOBgGK22KCA17t94q6Uu+UEVfZwWX+
         SdH6A3sDDOIzDlNqVx0JeBqZKwffmsTn898symhWkxHQFy549JZg6anaOVHzI/dfchWg
         K4felmQkSPH7B7GuOI8lBcloSbw6Por2wRhhagkHkGl3tY3T9pDqvAHJG3F6YNfXvQyh
         BJ/A==
X-Forwarded-Encrypted: i=1; AJvYcCVYHpm+ESHLqnt3k+uDyW0D0MRioSfVQpUrsPoYhApdRfnh97Ie9bLUFWy1sGEdufFX7qiJ7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIBHOL4psQ0GWZ0ywM6B15Reo2yandrjNM8hOSKsQywFKgvQ+E
	NMmjFRoJArvxaFeIsE/MWELj+wT43SgexfZKPaBIxruAzeGPFRf6bX/dm+2uoXY7Wy/KqUzzZvB
	nVh6804s2aDk2bYeK27GaUER0mw==
X-Google-Smtp-Source: AGHT+IGhZCDaaYksOIbpNVPs2wy3kSc00OhYl5hw2lZvHS4sfDgLT2MlJ4U3veWoFkNQC2kYCfhaseTGKmrUILPler0=
X-Received: from pfwy41.prod.google.com ([2002:a05:6a00:1ca9:b0:724:f17d:ebd7])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:2d05:b0:1e1:a647:8a54 with SMTP id adf61e73a8af0-1e5e05ac4cbmr77933560637.20.1735937159097;
 Fri, 03 Jan 2025 12:45:59 -0800 (PST)
Date: Fri,  3 Jan 2025 20:45:38 +0000
In-Reply-To: <20250103204521.1885406-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250103204521.1885406-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=samitolvanen@google.com;
 h=from:subject; bh=G8T+NnXPkjDtKGjHLSfjrDpCNmmPfEyUeqSk1ZhBztg=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkVPpndtVHhySouOkF7m0o/qbT80J9sEuBUNadufYapv
 7naryUdpSwMYhwMsmKKLC1fV2/d/d0p9dXnIgmYOaxMIEMYuDgFYCL9Sgz/NJRfG36M5fp0JiQ3
 umHOV6/4eYc7K2atPJj5nyHMgYkjjZHhzZSv0i/nXvCaozlV7qXcjZuvTv19WFYWseDklISGE2I lnAA=
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250103204521.1885406-36-samitolvanen@google.com>
Subject: [PATCH v8 16/18] export: Add __gendwarfksyms_ptr_ references to
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

