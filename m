Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EDC1A4F39
	for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212886; cv=none; b=RZ0Z/JTsjoRkNNVzdVNMaNDDKY6cE2rKpFNzSW3pOFuSmuDvAfwoeH/qKPiYkDAaNTSoDUYBUR1Yo9H7/woaHk/8l5eCozY3n29fRwcOB/GxMwFZKFQ3bbwlwGKqo6kAvqiPkcDeYbLwG6zzwhd/yJ9DkGj/mQnh3Zo27unzDhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212886; c=relaxed/simple;
	bh=CxcOGYVl0RHNxURp1Y+1xpXbMOZLvm56O9AP4mZATd8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CSkY41UGCVFTHSMbdqu3YBZVFQYmqfQh77eNF5emOogrFiMO1+r1buY3B7iPpLu09ayu8MvF44frQrIyVezX+Xt8ojcGh5SxgJ3mnZ7ACZbN18e4J86FonpDxqp29npK65cMkHtdWKa14uGqiyCOeBLSM/Jtp9/rtnbH3Grx3Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TX8eBXWx; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TX8eBXWx"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e24a347548aso512711276.0
        for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212884; x=1727817684; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WplRKYGF+6Vdtojy3WxnxZnhza95+GyPbQDFLT+DHQA=;
        b=TX8eBXWxvurVq6wohNhNkvRoTpuAxT0kK0X3iUUNjnjb8/Xfpkqj+rNdRVaGlRU/Qy
         eKruIGDDWtWM6gvx3FbyXs5mwjPvpEtJsSujvHxmgaomu9D765EHdbR9Qmf9bGrIBrMu
         8z8chDfP5ZbZBw04rfA7Jeqt+9Hqj9Uct1VpmjBqGkq/YqCDrruClJb4z7BFG7eyOIke
         oDSYNWQgVF1gGhL1tcd5s1GC9i2f+3wMoAaJWxHBetVwSPQaAZOApaIkLi8RaMBxw7QY
         5aoiav6Qrw344nvqU5WNqqkGLzgRGL1NpUsTJ5wYcaaqNxkcK0TVZ+cDpjScT7DxjHHZ
         U2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212884; x=1727817684;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WplRKYGF+6Vdtojy3WxnxZnhza95+GyPbQDFLT+DHQA=;
        b=m0jGD3LvG7KJInYNcygY3ZmES1h8dEQEuaVjhzuZdiQ1zjueE5YGGFf9o2nFmnf6al
         ssaj85loGwcRO0jIMsXWoGnmjpR4eki6BeUIU9/YEiGKEV56pz09Ixx1Gpg/kWbwumO/
         TKcQzsAdmq+h11Kmkcv942ugSSh6Ky9KN0NUWYaIm+w+RH7Bx8I0C4N7lxip5YJr2fWa
         0OaoOYSL0RZU6Rf4KELJDOqwU41PqZ0+WLWHBn7wv+RoMamwK2C70AokuNSeGeSXCd55
         A0ZuAosMgwESh7sa0faXeXyl94k3EODvF4BRVb77UVMVYKYfNaaMqEtrAiFfY5RMhwIb
         owng==
X-Forwarded-Encrypted: i=1; AJvYcCWf9JyQ4CIkb3ME9u1CrOVCwWYyl77C9nXnzWJNNBpepu+7yVYohH8tB4pJYmlaXdDgrkP1pw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+LR6CWBsgL4SY1KwDLMmPrA6/Bp87Q8tRvL6v0TUL8tziQsNG
	0MOEWm806zXt4oux9uSWHxcbMwFgNY7UAhueW7mbYyypGKZilc0a8n9P1KEErfZQH5gf333S8L7
	wxh7O1A==
X-Google-Smtp-Source: AGHT+IF4MxPHlb7j/5VsEwiO/CdZf6hOwGyAlmC18C9D4g5UAAgDjKnR/SlPm4jDqfBG2te5d6/arkT9UptV
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:dc8c:0:b0:e0b:b36e:d73d with SMTP id
 3f1490d57ef6-e24979369b9mr29871276.4.1727212883700; Tue, 24 Sep 2024 14:21:23
 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:58 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-17-mmaurer@google.com>
Subject: [PATCH v4 16/16] export_report: Use new version info format
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Matthew Maurer <mmaurer@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>, 
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

