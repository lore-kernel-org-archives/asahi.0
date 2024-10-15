Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720771FDF8F
	for <asahi@lists.linux.dev>; Tue, 15 Oct 2024 23:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729034399; cv=none; b=k6KszAjKDm9VKZHBmwKyqccJ+RzINhO1tVPFn1LK573R3LqE/kRHo9UAZgnf/PhUnY7Zt4LBfE+aMfJObEH4yZTApgOXdYxQKXMzU0LjagSA2j8GoGVsS6nW0v4BoA0o8YXMFJvwiP7n9GvwsSKkZMCoO9chrQsS1fNG6HYYvrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729034399; c=relaxed/simple;
	bh=b/Bd5hNVwONQMAMAKZObOat4jqHFnL5FtBWQng4HuQc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rNwq9Yi2jP5BQ/T6GIrTiSmehHCUpjhpz9pfniE7BKH5cmn+nGLzSKCmtCdRLwRJAVj1WAXcohb1192vZzb/6UlmL1hUZvFJDCDS5RLyB7nxlKpU9UNC7q+TH4Ph0dHfhlWwjdqSFlAA7e9I420ZW1AtbGdow5lPuWK1/tFqoAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EYeXx1gu; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EYeXx1gu"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e2904d0cad0so9007136276.1
        for <asahi@lists.linux.dev>; Tue, 15 Oct 2024 16:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729034396; x=1729639196; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GMeFuBGaCaHx7HaM28eyKlSyRMkG/ZUOc3U36euZD88=;
        b=EYeXx1gucRyCA7Zz9hiCKTf4Kdse9qpNTBIZ6wJxnSP5/GJ8nXWYp4z4ABv2bfGPLi
         kkUitcefqfVV04WYOeoKyl94YLkJzoWgPlKM6ct+pcUDaihf1mXJHg/OSYDY1rz+lD2g
         Qqavn8KF3tvKKmRQv3peGBo43Pr5Z/bAix/cK1XM6qxd4iy4x+SWnOdGVA69B9q3aR69
         96XFchJaH9pLes95mOeUzAjqP//PGiHNibjbRqV/CBB58RKv4oYfRxce0ftgCMqImI7K
         CkWR7AJJ/CwHjo6+31Pv3EjSkOWTNQZTB+KO/t11NFN9C+dQz6bFMirueRYcuseLEo/v
         RDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729034396; x=1729639196;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMeFuBGaCaHx7HaM28eyKlSyRMkG/ZUOc3U36euZD88=;
        b=uBd8YjluEP8DocinTmYPI7fS95hOlprkgdm1jCPgGrlT2JUo7sO35n9CgbAop3fFuL
         CyjUgWx8QgQrdikI5jTGX3MOByVK4904OPbJGIQHw9+bBeddJfqb2osL11ELI7vMcMqh
         xwT5n3MxDy3hUPHI22i0a6xVvLSdd//2RYPJV3dV0CpPOi3J0yb5RW9lM8ngBk4vThsH
         Mopa93gQ4N5zsyeqZzu9Ut9c9ID8bkz7FxCf7ICM6cHqeiGIuMSUsWuwcpN8ltlMUPIz
         IDqtavdV3lYQrhykGeY/GlwyP9Fk6woJ8K0fUvCK//A1yuPChd+U21iEw4dDW/mqU8Y8
         oBLw==
X-Forwarded-Encrypted: i=1; AJvYcCVvOThzOzlvDH/X87Z/P0whoa5/6LlE+f/KDOhup2mER52Z2t6V172UCyguC+xIMmLm4QM/0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz72evBEUeQ67682STixRX3Rggu1wBckqtZQ1DTf7s6smm1renP
	HX5U92TjqHW6wSamdOlBsoZ4kO30TlFAbzPFNSA0TjJfmK9ka6bpK7hs5eehunrlg4BRmcvoodi
	gCZp2gQ==
X-Google-Smtp-Source: AGHT+IHJ/PD4IZdXpfLT+phmwcv6QqIW8I80B2uJZiw7eFoWOINWL5PmPprPbPx3sBWJLPoXxBjkxCvK2VhZ
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a5b:341:0:b0:e29:68a9:8612 with SMTP id
 3f1490d57ef6-e29782f4017mr1762276.4.1729034396326; Tue, 15 Oct 2024 16:19:56
 -0700 (PDT)
Date: Tue, 15 Oct 2024 23:18:58 +0000
In-Reply-To: <20241015231925.3854230-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241015231925.3854230-1-mmaurer@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241015231925.3854230-4-mmaurer@google.com>
Subject: [PATCH v6 3/5] export_report: Tolerate additional `.mod.c` content
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, samitolvanen@google.com, 
	Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"

Currently, `export_report.pl` will error out if it sees a hex number not
in the context of the original `__versions` array. This adds a
"finished" state so that it does not attempt to parse content past the
end of the array, and requires the array to be terminated.

This is prepwork for the subsequent extended modversions information,
which would not be parseable otherwise.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/export_report.pl | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index 30b5f7819086..dcef915405f3 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -125,6 +125,10 @@ foreach my $thismod (@allcfiles) {
 			next;
 		}
 		if ($state == 2) {
+			if ( $_ =~ /};/ ) {
+				$state = 3;
+				next;
+			}
 			if ( $_ !~ /0x[0-9a-f]+,/ ) {
 				next;
 			}
@@ -134,7 +138,7 @@ foreach my $thismod (@allcfiles) {
 			push(@{$MODULE{$thismod}} , $sym);
 		}
 	}
-	if ($state != 2) {
+	if ($state != 3) {
 		warn "WARNING:$thismod is not built with CONFIG_MODVERSIONS enabled\n";
 		$modversion_warnings++;
 	}
-- 
2.47.0.rc1.288.g06298d1525-goog

