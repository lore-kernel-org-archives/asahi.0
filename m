Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673C31AED24
	for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212860; cv=none; b=L3PHHq5SQ+MqqPGggYp7CXqyWLSjHisX2td9/CWQBvZwplS+HsMBJfIGRaYyTuphXXettyGY9qpIdka1htpq7lnk5cRhgPEA+LPaI5i5h7d44mlS4qwP46dm2FSp0NcM7zTTMvC3CvEPAcmUqRdC4kjAlpNbJf5cYkkTOX/xuxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212860; c=relaxed/simple;
	bh=W7tU7P3GNG+a73WgyQWeP1re2H5Hhpn0LeAD9h0akfE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=McmLRXEVr3OukRFxFReBXDVzu8Mn+A0BIEhE3/6Mf5bf98K3zQsGetsvgw+HvsGShkPA8MSvUFiRYJS/xrwLB0Nv/t5hj0ozJbzncsNDRIIrXHb/mbSnT3ksWrAC56R7ZRBhEvYBhS6hZJRTG2Eu9PGjF/Iacu5A9xHm8o/QL9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qJXCDREu; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qJXCDREu"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e1dc0585fbfso8561751276.3
        for <asahi@lists.linux.dev>; Tue, 24 Sep 2024 14:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212857; x=1727817657; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t2yLoLuY3hdxUDQj4FAKHilbBg2KnzEPjHr+p4Rv35M=;
        b=qJXCDREuboLhEZABIZFK7udzIzUXj//K4fm9k5dVVQQyUE00GH+jI5WhKnmPz6/p+G
         WkKkGm9bhMdCydhFo8+1nU4/hJbAYpgVHXNF0Qi9oR6mTYBRLeNpQYLGnxDdWk9JeZ2y
         ml0/4PzgXXz+AXrow6wsVbFKnaGPZFa9Ef8pEVDPpmUE1vPIsom+sGtKWqv6boYLfLY/
         CgNW9/50zYAQ1lAfKFXZHxHvh5W60Hamxcvw//P5RcwSXjQKJ+VZX2nJk09vs1yioIAs
         GFW/DSp0OglSUon0Xa7PsWjKNM3CIaod4C71DFolZDLPlVWUg8qkPU9g2G5S0piPIgFn
         WWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212857; x=1727817657;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2yLoLuY3hdxUDQj4FAKHilbBg2KnzEPjHr+p4Rv35M=;
        b=OmanBOktGRV1tFSmGpFNkmtWFyE6GrEVn1yS7km2RpYXi2CqH0ny7BgROO8Sz3tpqe
         TCppDCyw76Jv37CV8TPoUk8aIZtLGJLoDElbXOireDo5MejZMEiyKgXqXmPVlWStuKiN
         +mdGf4DtoQ9ujPoZCku+mlh66kA4aZDPD+c6WSXLsYeYHIKsVSwEJ2bsfEc5z5RiQeRe
         yf9q4EegLqzV4W5wBdEM/rLbtBrSDVzte9h+gef6Lab2l5kT7KPQ+qDrk4yCQqPfMDkh
         piJSIhMc/NEXvQgBFbETojTzMw+YVT+5Q78E+vPi4p6PvX5EBV0SORSeKbTorMIczLzF
         nhBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6yJZPa5MHAHB+i8Si5RsRi4oxQaHrzL9ZMc1+obQIuVWL9fEl9fpNdGMKBjA1JREH2RXHkw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy84080hMTLFPsc7BcA4xp8SjjkClH727sxWi4eZmE68P6ZAAg
	ClPXqku9m9XhlGwLfxXJoimdqrm1yc84mKwTXuTY7LivjhISWODsFJHgpRgjmfJSUKxcv6otPze
	lm0mqUQ==
X-Google-Smtp-Source: AGHT+IEZVi9081t8P5vrHL2wqYempVI6Tx7zpqovib+RLuWBI7X+sbJ0kRsI9o9ftmy+87K0NaMr6bmxbc5u
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:2e88:b0:dfa:8ed1:8f1b with SMTP
 id 3f1490d57ef6-e24d7352858mr4336276.1.1727212857200; Tue, 24 Sep 2024
 14:20:57 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:54 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-13-mmaurer@google.com>
Subject: [PATCH v4 12/16] module: Reformat struct for code style
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Matthew Maurer <mmaurer@google.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, linux-modules@vger.kernel.org
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

