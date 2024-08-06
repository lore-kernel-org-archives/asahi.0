Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EE316F26D
	for <asahi@lists.linux.dev>; Tue,  6 Aug 2024 21:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979304; cv=none; b=SpfNMJhgdI3yYfAuerM2dZGewJET26f4kMLJ+lktwm+IlvlSBix7kLLDxNyy9OA477XW4mQalfa8YsUrfJMPa8/vo8OGDeMdyCCses+QDk5JctJuZhZG3X29WgF118JfaVHyezKJu+e5tLLNdPfWO5E+3irTlNTQCygP28wZXL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979304; c=relaxed/simple;
	bh=mCqYq1X/5JSmTDPsE/ocb7zGxaMcpnc/Bjh/o+XxIs0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ETjbl3+W2WOSX9/9cA4A1HO5czrkfAj+bg3emzrsH2xRyFk4l4dbu97HdOc5PZvLsEB0asw3byvV/KYm9tIDYtEIdwJPKUYlUpoO/EiCxCLXFDBnFXVTNkSe/4cxIKBbwTPRdBrkOo1zHD16SImgkd68Tm1grnhp2ORI/FN1w+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LcvNub9+; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LcvNub9+"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e087ed145caso1632642276.3
        for <asahi@lists.linux.dev>; Tue, 06 Aug 2024 14:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979301; x=1723584101; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gAaXWC0uuTf8zgXDc0pw4iU2+AZ5Ew6s2WlxaR3c8mU=;
        b=LcvNub9+ppmJpTp7P+HQlT285CwTp8gi2K5quxOix49CJ5XnoDBJMKRPxV88/bzjwi
         hYPxjE35V0cGvx7q9OM4Fmubu6WoA0w7k7gfhGrlBXeWYcNOmHsE3DQzza8Nlg/COLkt
         3d1KSsid7RHxbWqcNVlk4q96cx7oshBTYcyDo2bg05rXAocYs1Vo9l7cspWyuNWe/3TA
         MYmN0HjTq6oOZlyonOXHONJZ82QRMSskBzCSOim1zzo0md8QgyqpXXT/rVWbgjmR5HVK
         vSUIQ5dM26tUBl6pUIdW6gSHJj9NMbAYgpxR/F2GOKelvFq5vQ6SaDcPnkQvcexIQ6ZF
         2kuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979301; x=1723584101;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAaXWC0uuTf8zgXDc0pw4iU2+AZ5Ew6s2WlxaR3c8mU=;
        b=Gs1PZbuAKrT1ojoDiz2xo8HQqJ7V5g2PRhUVFl+ZpCi3je3C9aCTSYK7RSVavjrwYa
         SPjBecwvIFEs86bk2bTL6j8a1WUocI2CTDbXg/8clM7h0UVefutGSfD4vFcUCcyAlf44
         wILN+t68h0q97J0kWD/FQy/ZtqNkO5yG9IQHxLK1koi3OH/RRmGNgE0A8I62ir6w6qdL
         MuIRBJq4e/SwFaesKfmuCMzeD0R0HxGN1jgjXjVhInyBhOTrDEOd/39OzPCvs8id1Ytp
         ZfOkr/83BfpvYsqyYYpSF3pbDcU2eL1Rr7q3XB2ZebYXiaqxH3PD8GHfZMDyokHNTm+7
         sdNA==
X-Forwarded-Encrypted: i=1; AJvYcCWKYXi5YrYDJpPMn0po4sRGAe6Zk3lWairMbY+H9UsJNqk75ngZSWR3+4arEelJHahXF+TrSqLkRPEzYM8LX9/rugFURfA=
X-Gm-Message-State: AOJu0YyoPHKsBIjgMwMrYDoVxlMYLbNRxOJJ2jXrrKcWWVgvjZ1HNVu9
	PM+BfS2psZmgUvZwsI7UffpGNCSNy+t4kU7S2wyVyDuQcppkW+9mKPSIvZ+y/iP3xuE4SkTZgDs
	JMEk6gQ==
X-Google-Smtp-Source: AGHT+IFcUQaohqepPhNvLJBa4TjhoTiyuvux1yaJvbNrJCyjQGkSU02qkk9c/0giXa9EMI+33KR83fwc25z7
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:150a:b0:e0b:f93:fe8c with SMTP id
 3f1490d57ef6-e0bdde8775cmr310737276.0.1722979301649; Tue, 06 Aug 2024
 14:21:41 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:39 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-14-mmaurer@google.com>
Subject: [PATCH v3 13/16] export_report: Rehabilitate script
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Matthew Maurer <mmaurer@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

* modules.order has .o files when in a build dir, support this
* .mod.c source layout has changed, update regexes to match
* Add a stage 3, to be more robust against additional .mod.c content

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/export_report.pl | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index feb3d5542a62..dcef915405f3 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -55,6 +55,7 @@ sub collectcfiles {
     open my $fh, '< modules.order' or die "cannot open modules.order: $!\n";
     while (<$fh>) {
 	s/\.ko$/.mod.c/;
+	s/\.o$/.mod.c/;
 	push (@file, $_)
     }
     close($fh);
@@ -120,10 +121,14 @@ foreach my $thismod (@allcfiles) {
 			next;
 		}
 		if ($state == 1) {
-			$state = 2 if ($_ =~ /__attribute__\(\(section\("__versions"\)\)\)/);
+			$state = 2 if ($_ =~ /__used __section\("__versions"\)/);
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
@@ -133,7 +138,7 @@ foreach my $thismod (@allcfiles) {
 			push(@{$MODULE{$thismod}} , $sym);
 		}
 	}
-	if ($state != 2) {
+	if ($state != 3) {
 		warn "WARNING:$thismod is not built with CONFIG_MODVERSIONS enabled\n";
 		$modversion_warnings++;
 	}
-- 
2.46.0.rc2.264.g509ed76dc8-goog

