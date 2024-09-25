Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B262B1AE874
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 23:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307610; cv=none; b=lku9EQiCOa3bP5ob1DP6aJNd6QRyTt7BQIiLUFgJjjbMyEo2pvkZwhxFJav59MpImfcHgJgAEUykLYEKPY22ZOAL5pPpPObEzImyzEUtk/z5ivKtMMsZQatXQ+4BHbcjM0cnalVD8qG3bUum64MduWWovjiLe7D7cGt9sfuwAII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307610; c=relaxed/simple;
	bh=HByXTJfGaacs4MV7ivXCvJq3lGnRepYcPD/jPTnE9OU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ExCiQc2ny0hJN0mQTq/hED+gP1qXokUDVrEhT+CgHYP9/urKf5nU6xPo5uC4ky38NQLLLgjd3xZ7GAP9MDEs9gS4/VsNF2mO13YsgrplIflJXFf1Xfq0RiHi8D+t1y1yALft8hsUf8XLVk58tUyagd2XLHH2ZZvhbRGAnk2uG90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UQvfNB0h; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UQvfNB0h"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e02b5792baaso694088276.2
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 16:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307607; x=1727912407; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RglsluUoLriSL7HbUF8axxP+liCt7+SgicjK27E/sOo=;
        b=UQvfNB0hMldb512ST6x0Bwj66KZARGb6JSoaki+yepYxCQU9csS5VdNXFcji27RUnL
         rWObaadLjrWNcc6vTa9FQxqi01pQUxnKHbylSsaC08iJPU92/6ERsq5akQ+W+vOgwNDN
         Cu9OcvmjwaMjQdNo7g4X9qW3MvKBD+s0G1uq2lTzGZKq4HOjFUUp/+og4erJHML77NYz
         cBj3D8k2H8YekcxT6UAzo3C0k3WK6P2b1uQRCMm1JoSukyTc+72A/6uyB95tP8h5ci5B
         XnyrbViF4tfVSH6ybturXUem5ap399tea5j5rp8Ss3/Wjl2BBsVOlcKpE4tRmdBRfnbA
         cKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307607; x=1727912407;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RglsluUoLriSL7HbUF8axxP+liCt7+SgicjK27E/sOo=;
        b=ZCYA4mm4KVvvXbiLzNPCEcmOClOjt2piL/sxyXyKnMgQUQw/R/71JfZzu/Zi2AOvj3
         8W8xmaK/fV2rj5NdeqNQtoD4AvGIJC/6B66iDa/AQjeVvSYD3oZozSm6qwb84i+lsozN
         84s4K0nRVorSJN9hxK+ojdKP39atzMHDCdNUCVFfBB13AfDk9bgasVhbOnzu3YToB/SU
         i+zZ6cN2b7hyGPnQWiuS4dzeAqMtOcCzD4FO0o9SGUT/QLmVReowmWYvF4oUKVxqZ1Cp
         wOJp4kasPknDBwNPo6vU7L3OjBmSHjzBBisf45FY9xwp2lynYD2VTUD33qHP034U50AJ
         MNdw==
X-Forwarded-Encrypted: i=1; AJvYcCXFhgYARE+99q3V2nG8Mjkvrrjy4xlKHvqyTxSoVa94hL4lug6WOtzwwM8Jf67A5lGk3u02jg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy23aMjTXEepa1lgwIJMa28rGmbqmITVpRMDD3YpCd3yY9m8MUp
	u+JGUrcdSGOyaRcqLFdddKWA5LQwxd1xEX7+/R0epaNb4B0SO/LLMOxg/JvLHpFfrocpxKekyJ8
	Dc/vawQ==
X-Google-Smtp-Source: AGHT+IGASCvkEn2P1gDzoqsewJkQJHaAHK03+0AmWd/xawb1XFk5R/bQgX0n7dG9j+urvSvhJWBpQ1ZaL5iI
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:118f:b0:e24:9584:52d3 with SMTP
 id 3f1490d57ef6-e24d71625d8mr82065276.2.1727307606698; Wed, 25 Sep 2024
 16:40:06 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:30 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-16-mmaurer@google.com>
Subject: [PATCH v5 15/16] modpost: Produce extended modversion information
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
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

