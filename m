Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C897D171658
	for <asahi@lists.linux.dev>; Tue,  6 Aug 2024 21:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979321; cv=none; b=FBKPRC7twZTIyfr0eRGYv8Pjev8QWoJFySkR6zIXKGc1scN+c8HnwAbuoqiXqeo/zqRZdSvem2y85RRmWShRot0MagRc9M1Vd+DmF87vFsm9ONMsyYKth5V8vmt0a3HmCGlslFOFAvM8mZpIfqy/RraMSeE0y+Ia2PY6zAdcn/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979321; c=relaxed/simple;
	bh=PeHGueIu6A9NDir1Q16OtEIXpu5W9OAUxaQCN3XQaIQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aAnE9G+rTa1U7xdIOFOXggy4Ntp0uUJSNhJGnjHewfwvMgnmlnyOfDeWnieQDKeCDNYlmW/v2WFqPJ3+yfU0PlLPoofexOzyuJg4Irea4/9K8yyQpC8CfGs6rlEwZINvkmCMKY4eorAE3O8V7qq45/JSuYBasPCxNM1fuT0BQx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uc7IS6NS; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uc7IS6NS"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e0e3eb3feaeso2087031276.2
        for <asahi@lists.linux.dev>; Tue, 06 Aug 2024 14:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979319; x=1723584119; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIxM7MXS5ywuKBbdk2V16TlFyqzq6A34Xp135s0mvWo=;
        b=uc7IS6NSmH4M1S7Sxn9TdXcOIGpISKikFZ7H5FapCUsbFWpicAHNmNFwDpQU4oZuNH
         eHYReXrHR9ZfwSj4L8qTEiy6RxM2fUfE+jgSJHCqn/8wz/stM7+wIDN9+kHgo9Ds6vSG
         DRNbMI/EnwW4wVoNSqKS79aY1C7EPHSfWC0p4BHXzudeavwbeeMRPJv18w7lhy1QNnYU
         EtFz7cjiBy5DfL2+/4NitJQ1J310D4BsQplf8B13oUx1F3p34s4/lMdN+zaUGpxt+s+C
         wBy7O+h3aWCsnPS3WqdDTkfAZsoEKENSSo8NTra9WGcj3dsAW2DJ46wNQnFgviedlrgx
         ciGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979319; x=1723584119;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIxM7MXS5ywuKBbdk2V16TlFyqzq6A34Xp135s0mvWo=;
        b=WO1YjpJ1A27seTJh20Rg/mPq9WmZ9FPpUtuXnWPyiH3dbaBLycshzt4Fk1d9/1BKmn
         eF/mtRVNU7u0DUeajSxXgkvoZPtPcpul+LwQ2xrgF5Yq28+yqn64iZId2tr8yZ8mFrn2
         vLQQ5pjzNSiqXLMNSA02fuQakjaqwhvJOAqy3/JDdz03AWSaIIss7iFxk3EfNfYfcCmC
         +qtVTFrDMkMOtzjyeh8jd58RrbX1u3+8xd3Y9KlDlx4CXzcWjQcEi8ek3yrfQ0FZow/F
         sgtGoDMuhORSRIov0N+nT8HwTseu5riNXLlztuV+yioIc1+i3Spl/g3oD7g9TXG7skpu
         +3lg==
X-Forwarded-Encrypted: i=1; AJvYcCUAumho/Qqbz51P0Yf7I1RJCtGB5m8PI2hghmPMOykTBkAeWhXXlNq//a31xZn/qUgwtaE9QDlHCeVedEGVuGqwgu0shVc=
X-Gm-Message-State: AOJu0Yz9djG+yeawjbWmEjBeCRjnslrTxaYJVDm3Bw8iO+eE60ti0aQa
	9MX3RLdhuj+Q99Ku5azXQ3/13ZtJ52Q3eElcqoTstm+rQ57yZa0oXpFkBPFDeI7dld2dWkSaoBa
	qryEkdA==
X-Google-Smtp-Source: AGHT+IE/dOY4BBF0bOHl2trWuq/uURBgtWdSBnMlFtpxYXnDrUIM7aP+OZNSkdR90xgdGT6ytbLkJI0RlN0q
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:1241:b0:e03:3cfa:1aa7 with SMTP
 id 3f1490d57ef6-e0bde1e9203mr23531276.1.1722979318983; Tue, 06 Aug 2024
 14:21:58 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:42 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-17-mmaurer@google.com>
Subject: [PATCH v3 16/16] export_report: Use new version info format
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
2.46.0.rc2.264.g509ed76dc8-goog

