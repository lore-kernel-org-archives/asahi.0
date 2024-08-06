Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F02146593
	for <asahi@lists.linux.dev>; Tue,  6 Aug 2024 21:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979276; cv=none; b=ZEsZafIgZsl31+bz0WRSXBPH4B2VjtUHDh/569B0laeJsksu0gGZ/a86haqmdcC055GE7hgfsbqBA9m8q69a4twa0BwUpnx+6uMQkdybFGkQjKc9hFpCSELFtFgKxzD0LG61cvrn7qTV4VizaIIlvPLPIptrJVQEd3N4L80/Oes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979276; c=relaxed/simple;
	bh=iji02Oc/3eVse8/8b0a97tqkHPOd2ny7+/1oh5B8hHY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fmlEclTMlDLJLX/ZgW3pAQ1elyP9yCI+ZdsEeEolNHy6gTSxMdlKV9sIq6vXOosWKy4XZ3B/MW6/+V9zN4qVuGhIRcKBNHG9qnF23Km9dfm/gSuZ2C53uh/8/K7apQXekvKqVecZCQfN1ypuLOEJjTY8f6FUz7aI9ku2Js/OWqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xzDX3qzg; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xzDX3qzg"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e02b5792baaso1994233276.2
        for <asahi@lists.linux.dev>; Tue, 06 Aug 2024 14:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979273; x=1723584073; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOl8CtEcN1RVp67UAYoE5SQ2BHxlCocLL/lZKU0oS64=;
        b=xzDX3qzgAhh2cKFf6UP0XBMV3sfAYk88Dr8/RMoARX+wg94ekrly6onL3yRrvtmpiY
         Onll9jjFwypefdxPB/TJxTWu9RsN7YCFAjnd6IQWO6sLv2xcBlyrzghg3PSQ6scghbkf
         GnpHpG5c4IrCfcOI1JibLL2aeDpDg8kv1Bi48vrsv7csw/6sGNaIu2EsKcYivcC70V/r
         1O/qyWmxUDd6XousC4WCZ2STZ9LWM9To6AUjRzMx+fIMCZBtDyBN4lWMskQpQnhnTzsi
         FK7/cPc0JRIMbLqVz37qPKzsL6bSoT97O+6X4t2R2Hc44Hx72rTxTO0tTeRboWpyfg60
         x15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979273; x=1723584073;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jOl8CtEcN1RVp67UAYoE5SQ2BHxlCocLL/lZKU0oS64=;
        b=Fmdw8Bn4nR7O3iJ/ExFp/dwIJ2iy+8cAhLdlsXaYvQh+nINwju45muvo7ASmX+f+Ap
         I5t2lSHJhF0POLQKPHObojqIIycwiOjD/Y0Rvy/kUDU6sz0tWh8A2knnxpO/Hx1b809v
         eSVAKNHQFTMFEc6aCe7F0MTLXbInJLXZp4rbG4L3i/PG1K+iqgCW3cY5ufVNwd6Vr2So
         50SP25JWQcOslvoEp1EWC44lah+4EeckwaauOpVBR6LfYWahebRIxIQZJ27yhAwqlGr2
         uf3S2v92rHsNOUhjHxs1n+8dpFSHWWNgkgY9jTpEVfTkTd15SeJtzqwTI5EUXIa6z3qw
         ODaw==
X-Forwarded-Encrypted: i=1; AJvYcCUAq21/8X63PwLL5viv6JFf45QHwcrwGZ/5Uu4rsSzOsDSEtkNhoaz24aGbimsT4/I839NFFiFr0jY1jx5EKrMyGlW9Sw8=
X-Gm-Message-State: AOJu0YyCL7uTD+Fw/xB7ni23bhEQgBIdUGFMrBWQkqYdRkwVD+0oZ1UG
	UPn00xUgNmmWRkrpnFHVHliIFiLFzyrnDphZNDFTogAN3wGkiX/U7fueXhpjYUb/AHdcAZ8yZJq
	Rbr+k2A==
X-Google-Smtp-Source: AGHT+IH68bwpdjlnY26x/2+wcQZQXwD9UHybE1nA22cklT9RgpSzraQUX4QVqW9CAA8bhLmB1AIfRzUuzphh
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:188a:b0:e0c:301a:1d8d with SMTP
 id 3f1490d57ef6-e0c30666c8bmr256479276.4.1722979272769; Tue, 06 Aug 2024
 14:21:12 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:27 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-2-mmaurer@google.com>
Subject: [PATCH v3 01/16] module: Take const arg in validate_section_offset
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

`validate_section_offset` doesn't modify the info passed in. Make this
clear by adjusting the type signature.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index d9592195c5bb..141a964b6b13 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1645,7 +1645,7 @@ bool __weak module_exit_section(const char *name)
 	return strstarts(name, ".exit");
 }
 
-static int validate_section_offset(struct load_info *info, Elf_Shdr *shdr)
+static int validate_section_offset(const struct load_info *info, Elf_Shdr *shdr)
 {
 #if defined(CONFIG_64BIT)
 	unsigned long long secend;
-- 
2.46.0.rc2.264.g509ed76dc8-goog

