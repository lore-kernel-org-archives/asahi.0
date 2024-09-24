Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471D11AED48
	for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 21:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212867; cv=none; b=foUWUrzSv3+l+IZZx+UEuL4FkYEbcwlA1t/Yt7/MthLadqPCrB7E3XnlpuCoUFItVzdUc6x68DM9LEU709aZO8pjM7K68D6umrIdHdSWw1g5QFGJFyQUDruXDUw9IwBhqS30VwOlW+QdDbGJkV6aaS+J7fkZBKqWarNUJNcLLzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212867; c=relaxed/simple;
	bh=KqzbIRZaiTcASB5/z7j1pBJp9u/nLEzrmBQfqdwdS+0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AOZe4YzQ7ysdVkl0UP7S34sjgKRTlX5Hz/2wt/FBvv/kA9EuAEVrM684CMmNfawZzv2xJDsXRJlNhpfLJRMb6jwHDQY4umXeLl19WHCWDOndywwru7nDiS7wqftn66J5CxqarwCmwQ9EKpkupzd2/CL2HLHY9wIm7jYBc/NLBpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c3Zda8XZ; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c3Zda8XZ"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6dbffbae597so103424147b3.2
        for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 14:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212865; x=1727817665; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9tQH+085gbT8g6utnUHSGPzzhaq/BvRPx+qqG98o3U=;
        b=c3Zda8XZMEtf6HrZuaYuKr6LpIR+SlXXjg2o9jT49FZ92kLi19eIuJg8q+LW17VeKD
         miTayZOgSIZnv6Uw7IFzWKr8toRDjRudx8eYQIkG2iSLRz+EMpYSTcSYphlV32dcoi1R
         +AMVbNkcSlG9iQLvTlWV8xS/Es5AufAlAdPsicMiX8fa50zWYuI1rQ7N5h1nIX6Y+wf4
         Ny334zROCMAyQkBocUaaJuuQGDV45letZnlbBgq/Rqo7ndnvM75OtoXQ2oYijq0NHXAu
         +KIQQ0sjZUgNH0QJE55jxyBqQY/nSPZbMgBujQ34r16+a5xtRhZSHU4S8swaTTBqYcl5
         P0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212865; x=1727817665;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9tQH+085gbT8g6utnUHSGPzzhaq/BvRPx+qqG98o3U=;
        b=BjgqZ8vuX8AGdDefMqADgpJsi6/okMAgkij3Is6WYC+AI2rPo6fN8C3By1IRJ/1H2z
         L0/552uDuIMcDv3CnFyFJXtq6NThsikTyp64fQrkBXe51BTgLryskYAGnWdEwaKIZKwY
         v4YqgdN04VRw5rUmEl+CZKmn1LHiasUfXtY0DF5KpG/P/z7A64WtD6C65XNHPIRb3S4k
         QfvXmxT10DWVnU+8JYL922/EHnZdGFG4ZqiTljnjm2yfMfnYsEaDoHf8feSdUi4Xa5Oe
         pTb4MtkeDBGtQ83dRJgUF6rariwgh9xsuoF1aPAiIu7laH5MTp4IW9eWxvgggxmyddLh
         df4A==
X-Forwarded-Encrypted: i=1; AJvYcCU0Noa2dirVCbavQECWblbgckIdF6XlU1YqS3SIdW5E7YUh59Ft5po8bXmrmubwwQWHam0Vkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqhFxJO8Vzt7dHxgb2FMJllHTGl+ynwKeetdB0jH2VbEFVHTGK
	KogqIHqlWBofTyrew6m1OC/1htKDcKHx+GIt5T8+q3tYDtf+LCV0LPCe07V8ttts+grIx6Zgd+l
	/EiXlLg==
X-Google-Smtp-Source: AGHT+IHVnzAXCet0HeOGXyzTpRkqqhqz8oT95KqCyO+CI/8Szzd/g/rRue34womob+6zkpJak8wASq+DT+Pz
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:2a93:b0:6dc:7288:a90a with SMTP
 id 00721157ae682-6e21da5cb80mr44307b3.3.1727212865126; Tue, 24 Sep 2024
 14:21:05 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:55 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-14-mmaurer@google.com>
Subject: [PATCH v4 13/16] export_report: Rehabilitate script
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

