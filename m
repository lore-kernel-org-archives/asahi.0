Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904361AD9CF
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 23:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307591; cv=none; b=a6p6PLdGBXtNHcnvKwNDTRZP55mFDr+pagaQAg0X4oGiGrEalHfOeMly/5ErScEGkY4ro0DxGarn0ha5L0iQDZJnNlNr+u4H+yntOx+g1PKabyFihju+y+/9IeB/pQqjCBV+AcF5WVQ56q0TmLGtn091OAdimxkwSlHc6Br2RVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307591; c=relaxed/simple;
	bh=W7tU7P3GNG+a73WgyQWeP1re2H5Hhpn0LeAD9h0akfE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oaeHad6jIU/WCp63Bb6Y4ZSVFeWVqF+vtsacgKPEF7imS9as01wd0R7NLzthsBGamz2DdaLzb+9Ek1tZKeu+i/yhGKssJ2lG2jB2HplAbHLcHAcQZ5eWT/kzXI8ZQGMTEGo5pfEz0+jBmbWjrTdVgCBIqnFewDGf3LTr7GUikf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zmT48YNM; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zmT48YNM"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e1cefe6afc4so616527276.2
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 16:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307588; x=1727912388; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t2yLoLuY3hdxUDQj4FAKHilbBg2KnzEPjHr+p4Rv35M=;
        b=zmT48YNM1EQrIhHM6zGSmzOr4PZgs+kCkifxRYGtmN3xAE0G2cH9HIDIJbli9etucT
         1jlYFJoZHu6s4s9Ak5Mg9AlJYa+aDDnZg3gKXr1XnBhVq/sz9EWavjJORdAIoARodIBa
         krfYiU20+yGabkngyvKPOZGKcmR5EPJ7QAZdv0wU9pvtoymmbczoeQni8CHfLYikwLf4
         mWj4iz2PQJG3DhQGg8CmqEtl8+BPrCJtHFR9l7/oOMoJzC7vDmFEjVq47ZRGqA6GcMS7
         SpEY6QpPIt+abn7ADFEMa/BHsVWGOv6RcGMEtYljoUqcJOHyavTPNtKo2E11PkrVs7oo
         2jUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307588; x=1727912388;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2yLoLuY3hdxUDQj4FAKHilbBg2KnzEPjHr+p4Rv35M=;
        b=pJYJnE9k23fa5Zt7/Yo3tbOcrIuiZAmY++KeQSvd2VV6aHEzbLGYVbGgZ5f0c504Ut
         wbTDVv6UveG/caoqggrfhGgLlUACup1RVt4wa7x2PJmHFx2bZWye1a8AN3ryG2LSbPGA
         cCyNWetH8iVECfjLhiVnf1FUR2d/JlAiw1P1Z0A4E9hmX3malIsNB/rDi6ieqXnN2jL6
         LH6Ab7EEJ82/omNbYGufLdt/Av7I1XjOAC951T9k+6yuoNLwFwDn+WGCeg4OhktI1ZPr
         u42dj3DrAWXqfI52Rwy4KFcojsnKgBqLaJ6Hm0HwKhAnGhjogunIw8HVDU3NhH264gzZ
         bDww==
X-Forwarded-Encrypted: i=1; AJvYcCVd21VhuwCfcDFWRhpYctSIbsfRmdapnbUOf+I1LsfqRwX5oJNRM8yqb8c0CbTJEvLixC2MyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzodicrG2NAAYy9H9EFd0j1+9s5rIvHrAfrUTgbWsJfdu6u/KwL
	Fw2oU1BmsCuz+e/k0k+RqbYh9FyB/XLfjMGEuZULGVuYFHoDltvegle6V+Oo9AR+2ydF69Y+qyq
	nb67WMw==
X-Google-Smtp-Source: AGHT+IGo3KQ6k/CMKWp9luhAJxulkW1/EkZDzA8kfvweM/2fd5g67sil+zl5Hoq7sgFCeukL28HlOifIuPFz
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:b120:0:b0:e22:624b:aea2 with SMTP id
 3f1490d57ef6-e24d46b5e11mr4072276.0.1727307588565; Wed, 25 Sep 2024 16:39:48
 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:27 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-13-mmaurer@google.com>
Subject: [PATCH v5 12/16] module: Reformat struct for code style
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

Using commas to declare struct members makes adding new members to this
struct not as nice with patch management.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/internal.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 2ebece8a789f..daef2be83902 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -80,7 +80,12 @@ struct load_info {
 	unsigned int used_pages;
 #endif
 	struct {
-		unsigned int sym, str, mod, vers, info, pcpu;
+		unsigned int sym;
+		unsigned int str;
+		unsigned int mod;
+		unsigned int vers;
+		unsigned int info;
+		unsigned int pcpu;
 	} index;
 };
 
-- 
2.46.1.824.gd892dcdcdd-goog

