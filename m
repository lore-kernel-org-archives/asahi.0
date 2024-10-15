Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34F21E2009
	for <asahi@lists.linux.dev>; Tue, 15 Oct 2024 23:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729034408; cv=none; b=ffscT82VVODZflhbbHcIAqLzkumqIQGJMUSOSgBwwWT2dICApMIpMJnawlWg17G1FY5s8ibyxL13v0uQnamnJ3YJVT+TK4LJ2yxSzHeAK8CnOswy9Z4xrObCeHSvZ84k2dw3JyUsI0G8KXOqGiE/YQqKIsf5awej+FX8rqkHWJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729034408; c=relaxed/simple;
	bh=THSkSo9lSkuxsbYiUqaXJmBiMFSg1TaDfQHynW6LWoM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aJkPntjS1FH2jL+PacufWar8sjDdUvGqb+Qycb0Vu6bthzbP/ykDy4A7ow/TInbv05WK9rtJDOUlGzzUiQh1B0cc6tCz726bLxM899J9pEvWFGyF+2CRJeG4FPZtmDl0NlXIKU+8kMct/QJ0QZ3qWdbaDiuQIfATu2aAlZOqlLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hRznV3qy; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hRznV3qy"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e38fabff35so42582477b3.0
        for <asahi@lists.linux.dev>; Tue, 15 Oct 2024 16:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729034406; x=1729639206; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y90q7N+0JYvarHeSSS/HcK3d00J7zzbtwQB+DjacdQs=;
        b=hRznV3qy/ajNxKbUNWndHkXFMftSX+jlx0c4nRhVQ0Y89r7l6HC/SMS3aDONpTNpsm
         iAHdLCZoL/ipinTO2t4dxfWZGdV6U1pHmBO5haXrWWbavuiL0EYMnRRJ8WxJGkoXo8BM
         /WhPnOwHZaNxHXNpn8phya9lWnb3s96BfV1c9CKs8G0POlSKwmGcUxy+8cWabg6jRKqD
         /wCK4NyADxh6Ti1JJYYfhIt/4rsghPdAoV0O/HD8ezg9Bsj3YKK3cGD8txgxWazurEkP
         em9Sh46MR2SWydZhsTaz60j2ZC+D3uYq4Z7Wj6uk+z5lAL/CTwrvHvBFQmAXCah8UWU1
         3H+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729034406; x=1729639206;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y90q7N+0JYvarHeSSS/HcK3d00J7zzbtwQB+DjacdQs=;
        b=DLRI6htcC7cScoI6C7iCApmb3yoroR1JKY2JYsTjVvCTBitt7+k4aDJoAeHASMIx4q
         aItcIR9q53dQi7f5n9+SpL3mZHCvqRZXjqd5zi8i1hh/ROEY9aUrD8EHDwlBDtz6roEx
         GQxMPaRtYrurxkOhfCHTCDxp2u63S2kLxh3hQ+tfIoOAAVIvqoMeLSIetyxw1xMZ8enG
         SdYm3qGQwbVJalPUFqLQ3io9Z40MycOqfdr+aFcNkQWAA22dvg/hfvLD03mTva+Jvkv7
         HkX53I/lxmLh76HSTskPXEjkJdWTdDDOTrbTnRT87flwQTBR5CM39oqVDqlIbYxPEAzP
         IE7A==
X-Forwarded-Encrypted: i=1; AJvYcCVLEmvo5KnR0n+YNibfInnzhQShFBdFLwHjhvNFr1bN8dYyiRTjqx7JRjzxLWj5Fbt7G/3U7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YztWqcix1gOlBv3CNUA83QpHYEnU8DnfpmR1/Udmo53msQlZRYI
	HNHkGTZudEdVTP1yU3Qn0pwjXy9Nd60Nmv7qd8eZGy3udsZ0mb1gidDmLkicLAlqCKBuryFfJWF
	AoVxmGg==
X-Google-Smtp-Source: AGHT+IEl0PoSNMsAIV4NYkV6h7fXXICopbsvroAdggBgvaXcptZB1VvmgZiKvr9u8QtCOHgbZG9OiwkRYgC+
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:9b02:b0:6e2:371f:4afe with SMTP
 id 00721157ae682-6e3d4194914mr597357b3.4.1729034405979; Tue, 15 Oct 2024
 16:20:05 -0700 (PDT)
Date: Tue, 15 Oct 2024 23:19:00 +0000
In-Reply-To: <20241015231925.3854230-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241015231925.3854230-1-mmaurer@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241015231925.3854230-6-mmaurer@google.com>
Subject: [PATCH v6 5/5] export_report: Use new version info format
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

The new version info format has a superset of symbols in the old format.
Since this is a tool for in-tree modules, we don't need to parse the old
one with this tool any longer.

Even if we build without CONFIG_EXTENDED_MODVERSIONS, these are still in
the `.mod.c` file. Their presence in the final module is controlled by
conditional compilation inside the at file.

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
2.47.0.rc1.288.g06298d1525-goog

