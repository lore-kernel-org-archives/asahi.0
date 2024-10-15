Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ACF1FDFA7
	for <asahi@lists.linux.dev>; Tue, 15 Oct 2024 23:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729034402; cv=none; b=hpBj9YVjwBkcpnQxo/dlXQKRkFgzZAGSUOcp/V74TZ4GJDT73MfQsS1JaEXRzFcW4X/MEeUV4SuPDxIGLF9mPtF/NJNgMoQokzZVAlIL6Jr8wDmdMCF5+rDeSQEMKdYIg0l2q4TgqFDExISOm0Qh2UIRtCJeJby6iU4FIcdICvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729034402; c=relaxed/simple;
	bh=Kp5uggGbEJrPIVkqdlvJVT6U0SCrN+hpDOmeYYUT59w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ezVic9Zk4hspmGFarpyDcnBrtOy6zQ1ENJ62Je3w90IFJy8GczaNuG8anlrNzhFqGlqWcJJBCInWEpKjCvBC4reVp1MxUMxWRfv07irrsXQVOw6JE+1dP7hSXsGtHZ0alC8PG7Zikp64aD0nAV/1vdKEsB2qnD4wvKfQc53/V9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FYcgeBOX; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FYcgeBOX"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e000d68bb1so4281267b3.1
        for <asahi@lists.linux.dev>; Tue, 15 Oct 2024 16:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729034398; x=1729639198; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xasC2bG4ku4iDrf29H3XucNRhtvas+BiYTJxtPjY34w=;
        b=FYcgeBOXq0GVJnZWT9ebXluU8igEhvPC56erZzvnluhG0djoAT8BtTgZ/bToLGKElT
         tY22umcpqXp9RQnQLtt0fYSkNGPHvQTCf2ULZx9LB9OajwGnyyfQx5Q9N0c3TluU9IM8
         C8lVHFWyO0fiWMXitZYNSI5z6RKEd6QtcfcIN6WjOeu5y1EiYa2dEgXe1Wd0yNJz8tTE
         0kcnPeBtZ0aW0HJ2MhkJFVQVHzjLJpZ3mWtjHZyWoFYBXq8LbKO+LrDdFaHADa1sGnsb
         5fihOfbCAwtZWBKsgFd2ZhWbmz8wBegHvQuFt7foTFfCu6VBDjv4jcCMKHDG5icGFRt8
         C9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729034398; x=1729639198;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xasC2bG4ku4iDrf29H3XucNRhtvas+BiYTJxtPjY34w=;
        b=tIx8S3TOT+MUUuHIOjfKUiBap3yt9u0bk1Jihq9+NiY5IUl3+w+cBkmNIxFoZJnByL
         eYa/UVYTizNkSeYMfdpb3Fo3PRFCqdvkoGRmPA1DCGDa6Yk4Gkx8l9Wkajmqddc5B1Ma
         G/1RNZDMdG8m4h5qVwFYn5+nCWYhqkCwOC3bpUW/0LpiMV06OmiRDtUFfEC+83VM6exm
         OjYUs+f/7/f+sz/mbp4kUWG6ZPFXRUuD/+NdCDkj23gQhBi18adaJJUQKND72iILTfuW
         Spe0t3Nf7pOEDSzsvoLPrPgrFBKmtFxdw6kRa0RyJg1mvOyIXEwB6wnFmNpV+Aw+2u0E
         0kfA==
X-Forwarded-Encrypted: i=1; AJvYcCW7lj9hSpzn9k8n2lc0SKospxnVgmyDd4z+A6b8MvfIydDNVmEeUJG6gVoSy1zawxlU/Oq9eg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqz0YTgTps9pEMGD6Kv0bNjv+OuYbGSCa9TsinJy74dgT1V0eW
	BioXzZG45/V1c/hxUlPyISva5loQ8+Y9RtxG7CnZItOVpqSSSCYMgIvm3pIB6uh+2uFsY4lUufQ
	V59NGrg==
X-Google-Smtp-Source: AGHT+IEhM7UuM8n6j7x3Tn2NtgtBsdUObL6hxcYJG9U32wvNR7YuZK72mjGGNuHH/96W7Ib7Lctj8rOyPY/w
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:3587:b0:68e:8de6:617c with SMTP
 id 00721157ae682-6e3d3aacfc0mr316117b3.5.1729034398638; Tue, 15 Oct 2024
 16:19:58 -0700 (PDT)
Date: Tue, 15 Oct 2024 23:18:59 +0000
In-Reply-To: <20241015231925.3854230-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241015231925.3854230-1-mmaurer@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241015231925.3854230-5-mmaurer@google.com>
Subject: [PATCH v6 4/5] modpost: Produce extended MODVERSIONS information
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, samitolvanen@google.com, 
	Matthew Maurer <mmaurer@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"

Generate both the existing modversions format and the new extended one
when running modpost. Presence of this metadata in the final .ko is
guarded by CONFIG_EXTENDED_MODVERSIONS.

We no longer generate an error on long symbols in modpost if
CONFIG_EXTENDED_MODVERSIONS is set, as they can now be appropriately
encoded in the extended section. These symbols will be skipped in the
previous encoding. An error will still be generated if
CONFIG_EXTENDED_MODVERSIONS is not set.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/Kconfig |  8 ++++++++
 scripts/mod/modpost.c | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 7c6588148d42..a5de2b7f2758 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -177,6 +177,14 @@ config ASM_MODVERSIONS
 	  assembly. This can be enabled only when the target architecture
 	  supports it.
 
+config EXTENDED_MODVERSIONS
+	bool "Extended Module Versioning Support"
+	depends on MODVERSIONS
+	help
+	  This enables extended MODVERSIONs support, allowing long symbol
+	  names to be versioned. The most likely reasons you would enable
+	  this are for Rust usage or aggressive LTO configurations.
+
 config MODULE_SRCVERSION_ALL
 	bool "Source checksum for all modules"
 	help
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 107393a8c48a..d18ff8a1109a 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1840,15 +1840,56 @@ static void add_versions(struct buffer *b, struct module *mod)
 			continue;
 		}
 		if (strlen(s->name) >= MODULE_NAME_LEN) {
+#ifdef CONFIG_EXTENDED_MODVERSIONS
+			/* this symbol will only be in the extended info */
+			continue;
+#else
 			error("too long symbol \"%s\" [%s.ko]\n",
 			      s->name, mod->name);
 			break;
+#endif
 		}
 		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
 			   s->crc, s->name);
 	}
 
 	buf_printf(b, "};\n");
+
+	buf_printf(b, "#ifdef CONFIG_EXTENDED_MODVERSIONS\n");
+	buf_printf(b, "static const s32 ____version_ext_crcs[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_crcs\") = {\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			/*
+			 * We already warned on this when producing the legacy
+			 * modversions table.
+			 */
+			continue;
+		}
+		buf_printf(b, "\t%#8x,\n", s->crc);
+	}
+	buf_printf(b, "};\n");
+
+	buf_printf(b, "static const char ____version_ext_names[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_names\") =\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			/*
+			 * We already warned on this when producing the legacy
+			 * modversions table.
+			 * We need to skip its name too, as the indexes in
+			 * both tables need to align.
+			 */
+			continue;
+		}
+		buf_printf(b, "\t\"%s\\0\"\n", s->name);
+	}
+	buf_printf(b, ";\n");
+	buf_printf(b, "#endif\n");
 }
 
 static void add_depends(struct buffer *b, struct module *mod)
-- 
2.47.0.rc1.288.g06298d1525-goog

