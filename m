Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3F61A4F2E
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 23:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307616; cv=none; b=WdqCeJk0Uvei+xPI65ZI7up2Q5ztpKQUElgxBKo6Ea/17XLI7qZi+a35piunh4iBG4hZSUJpDNvf69PACD9lnZn19IfzXFiHvRI5j53kD4cXjekKHX6JHLjCaXwTHYp4Sc9GPZ182jPrFr8aorI+GrzqHgushJnUDaRyJhoVdh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307616; c=relaxed/simple;
	bh=CxcOGYVl0RHNxURp1Y+1xpXbMOZLvm56O9AP4mZATd8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fHTqB59ddl84fCZriN42Km7Mk80h7SWUNx+5NOXvJ9mGVTG+l8dZ4nWTKeq/p+U5vxg0LK35fUNfJ87wDPmrJ6aVsiPU3d1zVTsiItYUiKyloEoXzzU7q2dJMutqE8kj1Onh1lCqz/xadwNTI/TEhG3slt0ZdpkSIiLTuTit0DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=leXVvBqX; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="leXVvBqX"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e0353b731b8so587850276.2
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 16:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307614; x=1727912414; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WplRKYGF+6Vdtojy3WxnxZnhza95+GyPbQDFLT+DHQA=;
        b=leXVvBqXyIX+oZ6VohbPhCkUxicJKoIYygORgHtM0Cqof7N3opLdPkSxbW2mlPb9Uo
         tGWB2oCbF7BaLfZaj2+QVqD83CIjP82n6Adxm7+JscOTrIoK6wKqsWiWU4zVwHoLXqoS
         jMFE0E9j6aNHPFrvtzgY55ZTkeqWOzZFZUTlMVfbPZpvS/mi7R7bxgS4C2CqNKaF0Uh7
         6/wQ8wU2uyKVv1x8v+akuM9En9v6wpJiIt4Qk//sgnamG6yVome1GKZDUL5Fl0L5Wr1B
         +fEngQqbVBZIUjyZD9i4W9VLEEas/7X3ewbxlUUJTSmYrV6jUx3R0fkDJuIRG9hwcwtb
         BOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307614; x=1727912414;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WplRKYGF+6Vdtojy3WxnxZnhza95+GyPbQDFLT+DHQA=;
        b=SE/ssNn01FevcUjOwa1zriNbJjB72xIc/N4sIlt0k6+WccjVAxTqKnSbCVafaMQI/k
         0DawLLhzhj6aZXfxx0ljPMJhv8e1z/aLmw03tg0yLOCqRc29ame+bCdGSW0dGSTuQkd4
         /wktTcGHwlvWSHVsHBxKl7xbjIamTOQm0ArpkEqFrNvPLBLTHN3NpSCh3cjjB97gl93J
         O8qTgT48WBajh2cMkVB4khWdN+4eF2BbYDFsnq/gYxh99jGfyRLJmJAWf2P+68gxtPiP
         YhcRIziI9CvLX8saxesLddhrPVqY6YYibI3Z+63KyKZ0DaKvWEI/0M+rONgZk45ncA+2
         Y6SA==
X-Forwarded-Encrypted: i=1; AJvYcCVBcY1Nw1sZ5oobq2sWz4Hz0uMeTKF8/01s9x4xufAxlvlYbm+/Lz3kPBX+A2QVMKEIukhiZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxF+4tVurrmCbLOyZ5kuuw9K5YfC1K6bozbkJudl3EHOkQzGFj
	lxWOpop531aElU1JtwSyrOY0KLQfN/vUn6e19PNLgz0vSDsS8opTQAkvceR6OCZk8aVw617WXKk
	tMvLzFw==
X-Google-Smtp-Source: AGHT+IEf40pL03JKKHoArutuPYYFcfXs6+lqlBIsFYP4JGQ4Mtdii+GrGo8PKjLJPO4DM/u/M2ebjWWjQD3t
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:780e:0:b0:e16:6e0a:bb0b with SMTP id
 3f1490d57ef6-e24d44cad51mr4791276.0.1727307613856; Wed, 25 Sep 2024 16:40:13
 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:31 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-17-mmaurer@google.com>
Subject: [PATCH v5 16/16] export_report: Use new version info format
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

The new version info format has a superset of symbols in the old format.
Since this is a tool for in-tree modules, we don't need to parse the old
one with this tool any longer.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/export_report.pl | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index dcef915405f3..6a37df6f947f 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -114,31 +114,29 @@ foreach my $thismod (@allcfiles) {
 	}
 
 	my $state=0;
+	# State map:
+	# 0 - Looking for names
+	# 1 - Scanning names
+	# 2 - Done
 	while ( <$module> ) {
 		chomp;
 		if ($state == 0) {
-			$state = 1 if ($_ =~ /static const struct modversion_info/);
+			$state = 1 if ($_ =~ /__used __section\("__version_ext_names"\)/);
 			next;
 		}
 		if ($state == 1) {
-			$state = 2 if ($_ =~ /__used __section\("__versions"\)/);
-			next;
-		}
-		if ($state == 2) {
-			if ( $_ =~ /};/ ) {
-				$state = 3;
-				next;
-			}
-			if ( $_ !~ /0x[0-9a-f]+,/ ) {
+			if ( $_ =~ /;/ ) {
+				$state = 2;
 				next;
 			}
-			my $sym = (split /([,"])/,)[4];
+			$_ =~ /"(.*)\\0"/;
+			my $sym = $1;
 			my ($module, $value, $symbol, $gpl) = @{$SYMBOL{$sym}};
 			$SYMBOL{ $sym } =  [ $module, $value+1, $symbol, $gpl];
 			push(@{$MODULE{$thismod}} , $sym);
 		}
 	}
-	if ($state != 3) {
+	if ($state != 2) {
 		warn "WARNING:$thismod is not built with CONFIG_MODVERSIONS enabled\n";
 		$modversion_warnings++;
 	}
-- 
2.46.1.824.gd892dcdcdd-goog

