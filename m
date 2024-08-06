Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4119D17B423
	for <asahi@lists.linux.dev>; Tue,  6 Aug 2024 21:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979314; cv=none; b=U3U9gT5DMWrypOQWpf8SAXdJUURElHn4CjWwf0YiKKYO74s+5W4KNnJoDBWVJdGDz5tnHHkCasXWqSuxYeK4RovEwZMNDzrqNvPYEWLOOOfWABDoiPyddpi+vVQOlvv0beXHw5tmjkI9VXUpYtw8NbC8EUzeQNs+k8FloKSTL0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979314; c=relaxed/simple;
	bh=DMq6ESqIR0/VIsSRGNMSbsDfLuIED4Xka2kr04JLUHs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X6DdupXYKDNQFeXRnCs1vWCtrgfc7EgEiXQgLVumEIxN1l3P9lGncAeExzW2JYBsDL+kRA6TF5UJI4SqodxCzNlM/HtPgjaBWv7zcrN7OMYuke6s1LUIPe/j9/4KwroJCecAJP9aE01/Gk5t5gvKFgxncUVPTctrPuKYCBaXCyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XT46EC0x; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XT46EC0x"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e0b8fa94718so2056018276.0
        for <asahi@lists.linux.dev>; Tue, 06 Aug 2024 14:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979311; x=1723584111; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RuVcyDMKWDRqQRwS9dw4e6Gmb475WtbXjj7m3vj6AK4=;
        b=XT46EC0xkqaiAxbYE3px35ATCSZxXYTObLwoY5elEYivN+SvlpKrQ6lg02UeMoUK7y
         sK4rmi+R2NHT1yRPSUoOmG9gh6XppL2BBUpT6Qg2J1jluF+X9XNYAUmR7Y6pxUQ7kVMB
         mvdc5ezU5B1B174K/rRn8vkzHscRLLRLtgHxBPwFCG8IE4mKV3rPnfjZb3fs65Yf/HpL
         YX8WVR73grYalwKQ9G/MLKxnI1ydTIDzJmZdGE0bmao+f/Mhr6Pnu4PjxW5jBAvid0qH
         WiNLjy/toDhON4tZ3Oyk1H3/CTfOILgo4O2r3GWFvUtzliuckWDI9WtkxI27wzoPBXf+
         beoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979311; x=1723584111;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RuVcyDMKWDRqQRwS9dw4e6Gmb475WtbXjj7m3vj6AK4=;
        b=m1D0rNa5JM5niqEtpP5UTjvyK4rEFrTTAl7/F8zjP3SIiC1yakBfq1B/pHTBhFoIB6
         MK98LGXGIUuqU4ovNn42UfHeOO20FBnvrv4t9usP2mpdOvYvlrNJhbBFOAkHOnP7uoQG
         CZqJ+fUztROWNQQpf7QN+AHY7uwGHRj/mqPQVOOVnB6slWpvobeaH4sY03X6xZF2AbqW
         8yVT5qCR2enFqgANSDa/RfA/EZARsWAA4m5BXSvT3EnEGWGjHmGbMciE4jjGanMqCpSu
         8sXdjuP5J6YE7V9y0KPE7CWr4hVQ4K190XLIDm9J7DtPpK6nsm1FhWdX8dSszMSTVh4W
         j6vA==
X-Forwarded-Encrypted: i=1; AJvYcCU0cjlH+6xQwDI3v/7nnMe55pa1GAbIxpirhRR8I3CXJSMz88+gttqx8hUrYT94ycGchZXhczk8lo67lndxtqFzCprEpqc=
X-Gm-Message-State: AOJu0Yyge8VpBHk/jDL0CIj1xTo6Zr0Lk4TFNdpXSsAVJ16A4pHLXlWS
	tjBJaV0J0n+0kk/xTx0qUEiimsVwtQHLCNtsCZ7KYmt3W/b747jFYfSYFJEeqZFivyywVqczHsd
	9md1s4g==
X-Google-Smtp-Source: AGHT+IGQTT1cAUuvwn4UUC6gSSIPxxqmG4QoKxAROxcqI8j8mxH6hY2aXaEo55QtGexIV+XLbHLydKtWm5V4
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:c08:b0:e0b:bafe:a7f3 with SMTP id
 3f1490d57ef6-e0bde428581mr579475276.11.1722979311355; Tue, 06 Aug 2024
 14:21:51 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:41 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-16-mmaurer@google.com>
Subject: [PATCH v3 15/16] modpost: Produce extended modversion information
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>
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
index d16d0ace2775..8f9a4f262567 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1856,15 +1856,48 @@ static void add_versions(struct buffer *b, struct module *mod)
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
2.46.0.rc2.264.g509ed76dc8-goog

