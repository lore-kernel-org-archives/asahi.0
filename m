Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9A01AF4E0
	for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 21:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212879; cv=none; b=P798GHGW8oMrCodrltZe5yI+j3HrYqXZaUIhdJXYjlSfl5wnjqnu/XVMR2/lwzCTPRXgrerZxZW7quNSQxfSOjNWYfzRdVaEFnJjGJ/37+RAe30crJkdnrq35PXUr6qmGCuZl/UGpUL2RgbMW0lO7ZU+Ej+6myGRoYPx25ZfjdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212879; c=relaxed/simple;
	bh=HByXTJfGaacs4MV7ivXCvJq3lGnRepYcPD/jPTnE9OU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ru4JQRJDv9OoKih9Nuw3HmXOnT5c3JDjdhyR5kUBPBCS8Lvv2EjiyxymYm0CfU8AwZ41rB8vJS3c0J5eFlONAt/z99Puomwr8L9YJompkb2QLkY8/40bIGMSW9wWAVb94VsyWkJRI2dL5iMwlWvOkKPY32otpsLaZlUvrteX9dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KJCE75Mq; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KJCE75Mq"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e035949cc4eso9634317276.1
        for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 14:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212876; x=1727817676; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RglsluUoLriSL7HbUF8axxP+liCt7+SgicjK27E/sOo=;
        b=KJCE75MqbjcGE3CuYGiFdf72RxeBH8xfc3vyu3G+JwWEnqE2/1PtIDZU+VBkS5USb3
         x8P53HalngZBqPZGkTd3MNuVTSG7oJu8csiQFsdOqOWEbw0wydmPpMASIyUAKbjnxUNK
         hKGIsf6vJDQ9JHTxmO8j2H/kVxWhhwlxQBQN+Ad+q0dmrhn7uDdqYdHnHnyYS+M//O/+
         DVPG6A0MSjKhU5LZzbLU7gc+1D5K12xU/HYt0SDt8L+zyCTC5R36LBgKZrkvPwW/jjvW
         4IPWepqOYyjxg5BsAq4b9jbgroxHKsPt/WWefD+XQg0yGYKY6/U0oMHKhjxusC2b/KD3
         2lNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212876; x=1727817676;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RglsluUoLriSL7HbUF8axxP+liCt7+SgicjK27E/sOo=;
        b=d79ftMa/zOHcV822ne264UkqDfSQClX0NV9JAlxGFVhmfyiaQKUjqn65qOJg8ESD5q
         OomrW5dEWvCPRlbIZWCx0RTj1Seht4ly/b2sLVPpjQm3Jw6WMKuwq66uOGJ7E95996gv
         7ZPOTeavoGCEgAEf4XPCbkPX6OqI2wubHVbaFe0kmppnvmYX1qUAzUZfAtrAXk0japZe
         9pnHplLc6XvJmkGsMC6DGSbG1+pUezsVdUAD/GGU9s4DxLt9X70afVLEPuhwD1CT2L2Q
         8FCEFTTvSybNhujNeFIL6SyF9HZ5lfQDa0T8b5KNaQuMy+tZdZIq5H7ak9dByYCFjbuS
         8rXw==
X-Forwarded-Encrypted: i=1; AJvYcCVe/+22R3fuQ+3RSe7cbhDqHS/yjlVYqYDSvrN1Wh2pceXLY4uMdR8iZ/UMGUKSnCSfo8IX3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPdS0Wup+rRy4aRtiO8LZtt3uWvVAU5z+2tveBgGRaouITc/3d
	h/x07rs/AwiPyAGjqX1Qoy6Bc8GRKc06QS5yfXgZJ9tzDILz4Zh1plUyrfITQD/C1RCwrMAvGrE
	/w/WUjA==
X-Google-Smtp-Source: AGHT+IFFP5DGiuK9d2HIotMaqmgWna4m+vnyCwqT1jRKadMrQxmzwDlp32Uot3cmdJtoti5KKpM/kNWsOgbg
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:2e88:b0:dfa:8ed1:8f1b with SMTP
 id 3f1490d57ef6-e24d7352858mr4339276.1.1727212875760; Tue, 24 Sep 2024
 14:21:15 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:57 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-16-mmaurer@google.com>
Subject: [PATCH v4 15/16] modpost: Produce extended modversion information
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Matthew Maurer <mmaurer@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"

Generate both the existing modversions format and the new extended one
when running modpost.

We no longer generate an error on long symbols in modpost, as they can
now be appropriately encoded in the extended section. These symbols will
be skipped in the previous encoding.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/mod/modpost.c | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 107393a8c48a..f8b7b793d2a2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1840,15 +1840,48 @@ static void add_versions(struct buffer *b, struct module *mod)
 			continue;
 		}
 		if (strlen(s->name) >= MODULE_NAME_LEN) {
-			error("too long symbol \"%s\" [%s.ko]\n",
-			      s->name, mod->name);
-			break;
+			/* this symbol will only be in the extended info */
+			continue;
 		}
 		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
 			   s->crc, s->name);
 	}
 
 	buf_printf(b, "};\n");
+
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
 }
 
 static void add_depends(struct buffer *b, struct module *mod)
-- 
2.46.1.824.gd892dcdcdd-goog

