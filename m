Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD2F1A3BC7
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 23:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307566; cv=none; b=gADJzp7wJmvOms2Bhigu+bw8wE3kjbVagB6xwFdKlNaph+pS1hakrQgOMf6gWXGxHwtWpBTK1/XYD9TypfWIoG1e/5MTHRH+yYX92k4mf2LclmNOLWoqVvTF7pAa2Qvqn9HdEi2queUTu6pqgK2jAoMv8/iviIYsHM2ZjpLxQjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307566; c=relaxed/simple;
	bh=87UiLghCgImjI67qGqkZVlUAdkIatHILzWkWX7E7o4U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g8w25POeeMMHeMGZPIUN+Wb/7sszDNwuPhKXmCF+I7ILHv4/2etQHmhw7OLcMOVvopfU6wsGQKlbPYSd5TC4HVFVNSET8YPE+o3UqcnDV9eM2yW1A2xBma+g0981ArJadBHGb43icbroay9elsHDdVwE4c69KOPjvBPquosfW0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tkidByCh; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tkidByCh"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e17bb508bb9so763249276.2
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 16:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307563; x=1727912363; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LyxbaKZI7M7/7zXNo9r/7MnbWQPTGkdTyXhoBixsIfc=;
        b=tkidByChZm5Z21tYXAe9iEPFU3zvrQxK1/1mPV4VhVufLMnGXfcaQ30iEgPPH7TJQR
         TAd+zab6OxhJJw+DqIyfZc+tIov/wqLKtT8FN12aOdTWcrRw1G3BZ7hFkPRyhRotBtdc
         iXmejulUKZF8bAT7Sj8WowZPE7a68VSXvWPf1YBZGoKdhLTjXrjk9fbHYsKmNjS83Pba
         RnmDGSOsBPpv7OU2t37UjquIhbvCo0cQ429+KsDRqtDf5Qa2cc4J2hL/P9T+QnP/iG2Z
         ys7+TrHWvRhj2vu2XdrQ12DbCsFAC3bpuNIpn+U62Np1Uv0Hvwuk3v+SNDNFOVSJFg/d
         r/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307563; x=1727912363;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyxbaKZI7M7/7zXNo9r/7MnbWQPTGkdTyXhoBixsIfc=;
        b=BMQ596L50TOOhkKXT0CVRvlXKp/2pPQqAbxwuyj0b/z6mjZpQM0iCj2JZu6Uon1OoL
         kGMmXgV+ksWXgRjkCO0HgLCZI6zSDmcuzqnlIwNFmO7F4CTmk+SUODYhLA1jT7AOaOJD
         SRLX3LqzIl1iDx2NxD0QiarPr7Sj0gqmvUorZ9zppk5IYSl/t6GRCaM4sEcN1wK1Fymm
         C3LKY7HNEu/malp0iFvE9bEe7AVmIsmVd+qP12kje9sMzmzGijBzyxK4LZJXMLC+IGqc
         EXYONMFpARE9SL6LLDQMhUaL3UBDkNqFTkivfvPe8onyL7RfgycmoBEbyRZEF3RX4mrK
         EuEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNeh08JUftJPtrYCkx3w1+1RLNF9xw3PojsXGcKTflkjY4lPH4Ih3hhha1y1pQ5u5/USkVrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQUdvNeTH/lvw8fiM3ge2LB8Z4xAiCQT8N8pgrzOUpoc+WWDMN
	wWPR6LLV3NwbsSiQkSB2IVYxCmI87ipEha216eBwv4g0l0dv7HIHAPLIq00PoWHZoAbLBetTcSr
	atyXPDw==
X-Google-Smtp-Source: AGHT+IEL4w0/gR8iE4pApg14NOFOUxZBPfsQ63YvAHEvZzW8W2ulmi1Lrysl9VB/6vA6caGgF7tNgGtZN5yi
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:2e88:b0:e22:5f73:1701 with SMTP
 id 3f1490d57ef6-e24d44c8e18mr28465276.0.1727307563386; Wed, 25 Sep 2024
 16:39:23 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:16 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-2-mmaurer@google.com>
Subject: [PATCH v5 01/16] module: Take const arg in validate_section_offset
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
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

