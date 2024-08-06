Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4923B16D9B9
	for <asahi@lists.linux.dev>; Tue,  6 Aug 2024 21:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979294; cv=none; b=cioCQf5sebUrrTSvjnt5Lr4Wi3Hw/98bucK7yVdpU9ccQ4Ht2eBKnDonu9ZK6DkAd797fAJCwhkH95uH45BsbOggd86zxvyulQALj0+PtE/dOCrVDpUyNOr+k7QhIcoPysTkDTmzeKROMXv/AiWVyARkz460hHxtBCIzBKioGZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979294; c=relaxed/simple;
	bh=eZqSlIaoWM4WfSbfbvyZzWv8g4Xdrp3U8leU2Zoxrnc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RvEotPyVsDYX1iBdl/2DzdBW/WpEgF/1OhTzLJ9Yw2FO5KQp8c+/2C2O+efRc1zTn0g01dDg0Ld3NzgD55rpXELWJnkdX3a0lrB037c1NE0KRR0Lo74K+eCGM7Nn/eJ94zuOdDWknfC6laNt02+vZmMcV1f2MQtWyM1Q4Ff4UpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UtwL4V5L; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UtwL4V5L"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-68dcbd6135dso23560067b3.3
        for <asahi@lists.linux.dev>; Tue, 06 Aug 2024 14:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979290; x=1723584090; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hw8pe/f7IoV2WGVsVTnz/cmhjcosc9mitK3vA0Vr4gE=;
        b=UtwL4V5LuHAS0YptQ1hp0a0/IUkkm5usLS1LXXCWYVLuSSS6mzTJT3fAVRXsKZRFk2
         kSCuZGvq+hGlT8xzaYAT+UohhmsVX/ZUbUAjAvqlhPtBfjZRAEz3NMJagOmHWw4v/xXD
         Ivjbglqenwyrih+tomh3PSaoVDt9JgHDkOB2eHVB5tK5tO3g5zdtTdlS5bzlNCYmw7Wb
         6gpV0S4IT8Vq4TUGwS7qifYA78LSYXfhUwepBknjnJSPmDuKjc+C3ghYiiq476w4DaDm
         +yW5lpkbXqyeKdDPVkxTppovhkzYhydyh5IUBHF/3nWtIC+cEbbdbMBoi0EKgpCiGBMa
         cwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979290; x=1723584090;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hw8pe/f7IoV2WGVsVTnz/cmhjcosc9mitK3vA0Vr4gE=;
        b=K87pCEy+sNRtJMK/NZgyMXIsR+enqB2b7LInzRNzQVtVpotiggoMszfcaHV9nzHsYF
         srwHsgTt5M0jVE4KIcQj3FtLugoXgLeIZn9PKs4Ic5+E3wptgK4siR431O46lBr696/0
         FquLcp0tdijHtfa2vuX9Rma3sCV+624/0Wke4Q1Db7sWGylamDZTOJDwmtv6fjNLkI2C
         BZcTkjZl2QO7fB4jyzL57CgU0Z4djuuw5+pDaNK3ig1RCGSSCnQSqvKrmnvRPAu3dm0L
         RIYe226N8nsQuowd+3VzSZvl3oanAePVVwXdB2rTMVTmAvitRUVJxy9+u9avgYTLZyWI
         Wmwg==
X-Forwarded-Encrypted: i=1; AJvYcCWRzI5r08wDCxb/iYW74o5c5YfoYBvlpJt30NYekXIW77vYMvCjJgbSLyFj1UKeCA1+0j7MAHzjOLma+uGFXwj0ONe0Bjo=
X-Gm-Message-State: AOJu0YycznEfaOWXUBk8dHB5O3C5MfOKPLNE9zYCWSsgsTGWj5Mv/UPE
	VmCLzgTFH4+InzTHp0cEReE5EC43B+mPpE4t8wL5Eu5YXegsseOgBypGMcGo0ZRe5jdf6p491R3
	JKpxB4A==
X-Google-Smtp-Source: AGHT+IF5wsgdTm2gCul2NqvSzln5bWqJN3fKvtypjNCS0MoVrnS+AxrHcsaPzCqJFh4r2PB0Xp3Zwok4SnEx
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:f12:b0:648:3f93:68e0 with SMTP id
 00721157ae682-6896313e32emr5643397b3.6.1722979290510; Tue, 06 Aug 2024
 14:21:30 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:36 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-11-mmaurer@google.com>
Subject: [PATCH v3 10/16] module: Factor out elf_validity_cache_strtab
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

This patch only moves the existing strtab population to a function.
Validation comes in a following patch, this is split out to make the new
validation checks more clearly separated.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index a3a4acdcd647..d70d829b5ab9 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2089,6 +2089,23 @@ static int elf_validity_cache_index(struct load_info *info, int flags)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_strtab() - Cache symbol string table
+ * @info: Load info to read from and update.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated.
+ *        Must have &load_info->index populated.
+ *
+ * Return: 0 on success, negative error code if a check failed.
+ */
+static int elf_validity_cache_strtab(struct load_info *info)
+{
+	Elf_Shdr *str_shdr = &info->sechdrs[info->index.str];
+	char *strtab = (char *)info->hdr + str_shdr->sh_offset;
+
+	info->strtab = strtab;
+	return 0;
+}
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -2122,9 +2139,9 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	err = elf_validity_cache_index(info, flags);
 	if (err < 0)
 		return err;
-
-	/* Sets internal strings. */
-	info->strtab = (char *)info->hdr + info->sechdrs[info->index.str].sh_offset;
+	err = elf_validity_cache_strtab(info);
+	if (err < 0)
+		return err;
 
 	/* This is temporary: point mod into copy of data. */
 	info->mod = (void *)info->hdr + info->sechdrs[info->index.mod].sh_offset;
-- 
2.46.0.rc2.264.g509ed76dc8-goog

