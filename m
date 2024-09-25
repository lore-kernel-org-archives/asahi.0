Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC191AD9E5
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 23:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307598; cv=none; b=ZXxo5xLFZ6SovC3mgzl3OOwGi4/wcdb8diewpwshCAiPe4DlGmtTOFO59bl0T1EMppdr9/4ezSCvPphqzYG2mtvMtuTxhbgobuXX1U6qNhc8ag4sxfjTsW8gKBlYEWQWE0Ugsf6n1+1y/SAj+49R8leccvWn3PxT6sjjCWn8OVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307598; c=relaxed/simple;
	bh=KqzbIRZaiTcASB5/z7j1pBJp9u/nLEzrmBQfqdwdS+0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r3xqYZwoacdnKcw/C8OiBD7TQRo63XKSDwvTE3ZhAGhmblIj8XLZQNX5Zk6kZFvWkA5SRFqoGG3geU+d6v9QwxFY2EYn0LNMMEytp6KxgfpXxHuzYO/C7i+KdY+veBQMh5vCVxwJGowu40GDk6uMiQZS8Dav8qtw4t4tniRHp6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mQV/hRx3; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mQV/hRx3"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e1fbe2a6b1so8840297b3.2
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 16:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307596; x=1727912396; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9tQH+085gbT8g6utnUHSGPzzhaq/BvRPx+qqG98o3U=;
        b=mQV/hRx32OlYt+8qj1vvFUDtWRvg/rFU/NNSUeKGxlbk8+5aaz17dPDg90MgbTXm5b
         W9MSqm6H0Ydft3YDONqWBoP/78yskZf20Kc0ADuJHr97fnsGDCnMqyzRzYQBEVXlV5NY
         V+f9YM5tsOgxziPapmsownADaBpzloWzjpvWRgpTCqcEKmGGYncP/1IhNWXXIjU7cjtB
         rRq3Jt47gevxr8TPJN5w4tWtVbQsLtkGo3vRGhudLoDIe4nVVSvt++SZrBY3VBwG65OP
         wD30n/277w/QXG/lv0Qgaeqln6XP3xCEFizMxumSL0A/wSCCq+kGAwzEmI9K7uwy/DF5
         lAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307596; x=1727912396;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9tQH+085gbT8g6utnUHSGPzzhaq/BvRPx+qqG98o3U=;
        b=sD/2PH3HdwmcB6WHjxVJxGxbcJINCZ0f3DPNFkPJ0PxZL9UwJpjfQfNwlpqBXkwp1e
         GWBt79NwBwEzX6xGsOHrvmyEKuUHAGf3ID/KAvR898uYZ7wFmEA+cjpYuZWixVfnADap
         iQD4goI3FBMplcLCDCZT6XyzrAVyGn9OBVapFgpvZMfoQnf49OwTCbP/Z7ovvLS34im9
         5x95e1vrRsFb+GpG3KbMHdvftgCrzxYesgdBcD4GORta9eKQqTvyqapwc/9nq2A9Dc4t
         KGWtEZwX6xe0auznURlkZm/8wFy/rFbY4Th8ApogAHZGnn5QibwfdvcKlPtsDRt8L2zp
         XtFw==
X-Forwarded-Encrypted: i=1; AJvYcCVNChVL4ulZFya0MJTrBZFvoDQszysxvHMegqwt1jg9sBQScpUkdAF+fNiuoMvSn5/S7QoZSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOWrpljQmE+SBz1I75B3z4My44qM3UHNJMCJ1BIf8RM72N9rkJ
	m/GvOEJ2mQPLlOl2mL6D85PDDd9ga01Hv59344N9OxJl62+AnSgHIgWA6Yb0O9ssH8Fo+D70QJ4
	klqAccg==
X-Google-Smtp-Source: AGHT+IHf83nSsh8dSI5MT6Lq2qwz18kf/IKNLkJKmhvyxAcTbUnK8QftG83szzLWCAGb7csPDeD/aKPeenOu
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:118f:b0:e24:9584:52d3 with SMTP
 id 3f1490d57ef6-e24d71625d8mr82063276.2.1727307595844; Wed, 25 Sep 2024
 16:39:55 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:28 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-14-mmaurer@google.com>
Subject: [PATCH v5 13/16] export_report: Rehabilitate script
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Matthew Maurer <mmaurer@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
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
2.46.1.824.gd892dcdcdd-goog

