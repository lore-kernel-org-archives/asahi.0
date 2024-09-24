Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1474613D89D
	for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 21:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212835; cv=none; b=LHZjEH0BypsGBHO1QfXzpz06w+qsPyH1RGUdTNyDSsDsyfPmzwXCH1baqaOFyJdUAmq+1qGaLBax66BV+ydnZ84JOTGAM7NZfs3G3+N44yLakRRQO9iWwb+xyJRcW1oPiZ4J4+Hu6RY8PpQ8EN6Wqxq2MPFsTpQ/GCzLqKP2Wpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212835; c=relaxed/simple;
	bh=87UiLghCgImjI67qGqkZVlUAdkIatHILzWkWX7E7o4U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZWtrLHBOZvbSdBZpgrXJuM3eSxVgaQHaJ4LydoBHENbxImgpdy9/y7tB2yZgijWMLa3K+39yWEoD7P6epB4I1CS5mh6WWglTlTZdGmf/B1yqCMSm18tt+XWcpSmpGIeutmA6YHUTWYQuqM23vwqF3pXwPukCMbERdQLtwQ3kx2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g3xfkYT4; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g3xfkYT4"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6dbffbae597so103415527b3.2
        for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 14:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212833; x=1727817633; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LyxbaKZI7M7/7zXNo9r/7MnbWQPTGkdTyXhoBixsIfc=;
        b=g3xfkYT4ZLlXVqYDfivdgU9Zod6zb7rfGLUzSAQFiVJ5SDpS0ymFev1HR7TFXxiym8
         VWHmoW57Swd0f7tdc/EjzrBiZahAbqK7pdYdcDDWojdv/TYTrw+PhbGGqEe2v6G+xzc0
         SK/F2nXiIEZ1clqjgq4vcZHLOZGA4ruLiRDIpiiLafDa9AzXhL/1JP315TDdY70xWgfU
         O0Rg0HpOhiZAHO933YP+Ag7Dp03R8609P+1eLhUkOciMM1ZNDPv6FLLaqfxcdH1wIZfW
         sKXqVj0saeByK/W3/UvFi1F3uWWA48faToDMwXHKIvuaKU0UMrXcexaYxa7WztKGmvED
         TaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212833; x=1727817633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyxbaKZI7M7/7zXNo9r/7MnbWQPTGkdTyXhoBixsIfc=;
        b=vMDRKS2gYqB4FfQKTSjdql5fe35oM33ViYyEB2xpixGlJoy5ZDC4lzzEIllV8uSEJY
         xIR3S+6rZbo0JfTt1WHqWaSSHIq5FtJMVwtwIy+ZTmVlj7F0oVOQgdiTYH0zMxXjWQeo
         ICk6CeAVXNQCqmK8mDuaEy2//CA/7rx2XMv6urSDWrVRozGmL+JqWFzXH1aW0q+UoX9x
         /rPjlXDPoP0f9ZP8zd5yLZSPtsNqjOl+BkzRlMGaBu6kB3p/qXFo+gqUuldbhB3M58uf
         VqxlD7akoFnfcBunwCosKCpMTlAfGeoH/rgsVRbnFXyQCtsp+gNzBq/yh8PHtwQq7pMe
         AL3A==
X-Forwarded-Encrypted: i=1; AJvYcCXBn+hL66+AkOw1V7mT2vRmusFGQDKbtNg+ihMB9tC9+YydYas4kjEq55HEsXdaCbe+Gemcxg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFrtVoOaIACvjsrsNntnkNqvhRR8AymAKZVsColNSPd9cVPLbP
	nVfYR8tdB74FoC4Nf8jx+051DNoGJAs1nwokGEG4piYd0tMjGsOeWaHdn+3JM8v0LAWgbJf6tpa
	cBBvmXw==
X-Google-Smtp-Source: AGHT+IGnyEMTRWI7sNtJtp7R9rDDC+Gbb0gxLeam+VvQbZl9PF/2aqJWci9nw+JctbXxlWMfU5L+JyyiNb9f
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:4289:b0:64a:e220:bfb5 with SMTP
 id 00721157ae682-6e21d8373e9mr83647b3.1.1727212833007; Tue, 24 Sep 2024
 14:20:33 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:43 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-2-mmaurer@google.com>
Subject: [PATCH v4 01/16] module: Take const arg in validate_section_offset
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Matthew Maurer <mmaurer@google.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

`validate_section_offset` doesn't modify the info passed in. Make this
clear by adjusting the type signature.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 49b9bca9de12..1a2dd52147ba 100644
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
2.46.1.824.gd892dcdcdd-goog

