Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC3D1AC8AC
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 23:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307586; cv=none; b=Tsjyot8VpxtcH3Q21FaDSGMYy+ANaT2MqOnyJom3WpGrKoZbiDHzKeFcba2v7LXPjiIv5/hUR12rxdAcjCB4ovj8faydAjSfDGJw/uXISkMpe8CDr33XWdHYI9ectMeihYonRL8SX+7SK1Jbj8+NFtH9WyGLUVkrLoRBq1Pe9DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307586; c=relaxed/simple;
	bh=RFwYTaeqemLtmezDNnI4k0C/4IQdB480nO3xNfeeufc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aSIpWGrIEin6q8gJqLc6/dP4aygne4dj0LycG3AmjfrYs60KNV2gfafBsQLkVd7tOiboQ/MCmjxb31Cp0wvlop1BzKIT96mWqJNns1ls+SInmoSVnqy+uoxEU00TjA0QqCvNsJ8PBuoXOEqSFYoXItKUTeTIgan93O/GXXiEdd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ESVAccaZ; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ESVAccaZ"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6d54ab222fcso11426427b3.1
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 16:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307584; x=1727912384; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=extRuG4D1AdoHKvsMv2fLx/d2D/gEpHsXYLRVzC3Sa0=;
        b=ESVAccaZMo8sBMfsZ87yiogb5pfUlkD768stOKyfznlax0xv609i8nMB41LemlhnaB
         S6wlBDBLAlwkhPtJcohCbLPW4eGjexxzRPQYozzRVSt3T4yF1WgvvbF4lx420cAhZrSC
         5ybfWOLt5RjHArpeXDHm50b5arwwG+B7EU5e96yzIxFlWtiAmru0CfdvGBy0rhzraLGH
         cuqWhBv4SFK0ACYJ2cxlUd+Q6ONu1T8rzOKBxEUmGkZT9GxpvnlJFfPlBlKds4FCi4gf
         HdFIozTsbvPyZmhph9ZNw7xcvxmvc1njNBHoTqqYVy+RYzjEpz+HeYARn7yzcOoQRKzR
         aUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307584; x=1727912384;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=extRuG4D1AdoHKvsMv2fLx/d2D/gEpHsXYLRVzC3Sa0=;
        b=pRDgVmgy75226VRjqUDojhm/vbAPncsshiv/zpntOq4ScrVLf3z4c3re4ZgLpWl0It
         AZSV31PqMhIdzE4vnZkI81ImwTn9uB5hsPLZNih+KkQwvGzJ0OLCWd/V3WGHGJcv7kYN
         S0remcb6owq7zMuzlf3xirmZ6iXh41gT8Ozv1S8x+5IQ44Q2P/P+zw7kxKVXrIh8DgIb
         ZgpWx+g+EAULv5N5rAvaajQYcRNm5Sg3GRqBMtT5DIhBztM31hSycAYh+9/iyvvIGTRy
         C9MVgIcUiITVZhcW814gHxX2We0SQcU5l8W7YkJUvoXDyVRT5DYAFMrr1MlG/s8+kxwU
         BUKA==
X-Forwarded-Encrypted: i=1; AJvYcCWSEtdYFlOIPqrETF+tfnn/iMPTjYsRYK3lY14wYuY0rKeG4ejg+fjNzJma3B1bCHe8njzk2w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMoqHhoDCKog1Xsw2dd3gWFm+CKjeVzRpTBf4K3OjWkdiaguZP
	QaNkBX8X0OwTHVlyb4FKiLYOK0qzcS0tjFvKhh3zqE3FV0tOhfrlZNvYVZiHINaXuyPuAUN9xwX
	hFvn5eQ==
X-Google-Smtp-Source: AGHT+IHi0gSVKxF9796sY6n1cVcgNiz/fsNc836mupUZtqmyvJTlnsLOXeqwbXzuTlIf+2iUj78FZGeorFh0
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:2a92:b0:6e2:2600:ed65 with SMTP
 id 00721157ae682-6e22600f35dmr247467b3.1.1727307584197; Wed, 25 Sep 2024
 16:39:44 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:25 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-11-mmaurer@google.com>
Subject: [PATCH v5 10/16] module: Factor out elf_validity_cache_strtab
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

This patch only moves the existing strtab population to a function.
Validation comes in a following patch, this is split out to make the new
validation checks more clearly separated.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index e04a228c694a..c082d5d41a8d 100644
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
2.46.1.824.gd892dcdcdd-goog

