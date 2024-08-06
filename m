Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681AF17A584
	for <asahi@lists.linux.dev>; Tue,  6 Aug 2024 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979296; cv=none; b=dY13XnW1AVZDpRq74lVdUBLC7oRVfBhAh9MhVsw2hl/OO4rJheAhwj9QMnNREacAPEO90u2SSykA558nxu6lphDc0IGf4AMjbeEOFQ/VedGPXyZAWKs1M9em27jHnY7tWicOsbmP29ELgMO0FvSed5+uVI1hL8jwkQj+dy2OruM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979296; c=relaxed/simple;
	bh=YzibuyX/ZurkiUI6GyxkLzm0ZV6PxLde5yZfANw/NIQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VNedqTYHBGTynDNLbtRrbE8UBCs6uRHZxknyut+JtHFa+9AxRJRo/Int527eAipVw1fQto2cTlRc5z7h+qg0AyP9JbIiysPfwQblNopNRERpLMrVPGxRB2WQqLMMfLFtvVCc9uZQ0GRxoGBBozNz+8cdmQ1z1odj+dkELbUrdtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CYRpD4lr; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CYRpD4lr"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-66628e9ec89so25181647b3.1
        for <asahi@lists.linux.dev>; Tue, 06 Aug 2024 14:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979294; x=1723584094; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o0aAyksQBIufqTGFzbZo39MWvG4cDYo9zi1d+Qwxleg=;
        b=CYRpD4lrnwl5N9J//Q6sG1dqS0seyMmq6MqgFgwNPqigePDD5+mCzqceKgtJGhGOPY
         x6YXBrPbj7tn1pFQWx+cZwaykGTFh4oQ/MAXHIm4nQRCNTep4g+5k9WpAll4lWhVbYS8
         zg96ZnHiChjHaALjJ8gj6xGsXJD6lvcITj7CUZP0brhnKrThKhKb7/3cId6/f2NepAf4
         0RUvsp5thyPMsYqczD313VVN0mhm7eOZ5K28f2TwOHPD302/NdjYCmjzomblLVzqTChR
         g96RsAXuyD0/d5+Xgb5d1qTwQARjiZ8prwf8r0/eLzams8MTRUXqQQNmuaPpJzka6vmE
         0KJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979294; x=1723584094;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0aAyksQBIufqTGFzbZo39MWvG4cDYo9zi1d+Qwxleg=;
        b=gc6iQOP4gHhoKJebQLE82s5AAzhXksptn+yClP3Hs0LQart/OI2gcnOn3RoTg67+Mj
         TAsh3kzLJ/kN5js09TZ+RG+KLPsMo7XWef/ceFKp0MSjHlPZ8jQctPwz6s9lUIRg0GrQ
         lsnTvrLSTgqDpGjyZfu56v6j0DYuNYC+Erc60Rfl37+tN5gn1rJnTWxtqVPCNXHK/wHp
         mAcSnOYtsjfeEZVpPloARHeonwy2TT+IHbwdjlnPai8ccjb08PivGnfA50fYPPcrwZGf
         DkMkdXj47OMSYNTxD60inYj1sswnFLE8k6D+77UDdOoQaMI6nXaavPAkqFXfJ/lqU0MS
         LIjg==
X-Forwarded-Encrypted: i=1; AJvYcCU1fR9BfGXl94/qHqB2qvuHIB9PPTqoSw9TTgop7tV6gk8IJ4OzLdDot9PoSrqcnW78kiIKqoMzd+zpLEsyV/ciHK4joGA=
X-Gm-Message-State: AOJu0YwlyzTKIZaXbuovITt7vfupXwoWUgZqJol9wTc31YsN+lV9dkt1
	ZCDhU7IeRDC/rq/dGnbk0wEmRhHVh87ymi0xgVTy1Tb22mGBJUWiyKVXyiMA12+SKUXGBIdJDhn
	Rit16HA==
X-Google-Smtp-Source: AGHT+IHMHXkzQl0MInvIKMa5XRAGjt8JRRLdjto+8iW/bmxLWJhyarBXnt+EN/959FSdYIRtbVwMtymGh48x
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:f13:b0:648:fc8a:cd23 with SMTP id
 00721157ae682-6895ec48440mr10438247b3.2.1722979294433; Tue, 06 Aug 2024
 14:21:34 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:38 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-13-mmaurer@google.com>
Subject: [PATCH v3 12/16] module: Reformat struct for code style
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	linux-modules@vger.kernel.org
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
2.46.0.rc2.264.g509ed76dc8-goog

