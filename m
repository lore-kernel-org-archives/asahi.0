Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68DC1C0DF2
	for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 17:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743588; cv=none; b=PjjF4O/wB5iynI5p73u92Hw2h8XC1pfqp5lKs5c1PxE3DCBiiKvoUUymlqcIO6S1cuPy8Imtvra3LsM52leYgk43cMAhV/4O9GxVgmCIMhWe/EfvbKcaJRaN08gg6wodtEvCwyWLsHl37qM0o0XuWoxLbJ3zaVDhHvz6YRZmOZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743588; c=relaxed/simple;
	bh=JdHnM47y3DGHzd+8iOwDpRmp/jKwcxYBnVNDUzIM1Ts=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FEQTRkg6DA4ki4dbdz7q6xHxFO2W2P/lxLS1Grq5qNXdC1IGtMUjO2QiSD9NfrkLEM9iVOyNDFmWckDX1iEopsUPfGCmyelTBgs3Zn3bPMYSZGZQtr09GmrKoT7PVO1yvMEPulRmavDYWXPvlKsYXDNn25Dx2R/WM9TIazG+o6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RZAVkNcP; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RZAVkNcP"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-688777c95c4so20472957b3.1
        for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 10:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743586; x=1724348386; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nzfrcr5/2Jg+dBktFb/j3BHPnQVbNwPzVAym41fmhTI=;
        b=RZAVkNcPGnZiFPSyxmpVHJIGUEsZNOmxuioKhg1vkKKLWr14CDy7vaQIfcyPwPhe8v
         49p2STgiO1l7IEttLInUz6tNqEITxRMQcP/I32ySBOjZhyejFCuCuZQqvo3/G0D2p4AL
         8+cgEXX2rOuXLzRCQyQT0uo4PYZQAKIillHqyo9AtbXkLt5q9yiUZS1NylOVpAr/2HcP
         sw6ordUnB/Q297BQ+4rDEJwKSWPOuIRss3l1HDtDKBXYIZGHriFbg5Of6idqz1YiZPdD
         9Mw/LcsN5G+gOiZ+5aRxPR723H3UC+E/wWmYAQlpIZGYD0h5OEm/uBXdghRWmNzYQ7TK
         gvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743586; x=1724348386;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nzfrcr5/2Jg+dBktFb/j3BHPnQVbNwPzVAym41fmhTI=;
        b=qiyF//S7swcEmLnxR3eKHYBb+pi2QvFnPq8Y1WU7faTjHcPLSLOyQauH2LOyqLvpE0
         ODCQ9ci3vf1kOf9n25fa7Kad0H6drkPHki5tOR/Zspj8J+UnfcpYU7TYm7BXgO44HdEu
         hP21rdrKnmSO7W8eWrFOyt+8iAXKye3PbUimAWURkq1EarFj4fZFctW9ApnyTnnS3muV
         KZbmheEelvD1XLIjxObPWNNFR9+Q4b7ZoQMKgn8LQxScE1NBUjkneLfrbVzgWkV4sxL2
         GhXKYNK5yDEhQ4fkr734fZ9DGg7M+76VeHUXy0MzojDXMuNaokuOo5Ps0cANeA02r2t6
         i8CA==
X-Forwarded-Encrypted: i=1; AJvYcCWOSYyTsMlmQ/D7T/frqApYZL/ko54vfqtGQgMniglOC/dwjpUIl1FjttfjpXZ2cxZFdyyIW4hz+q2mfj07CGwAT63NYik=
X-Gm-Message-State: AOJu0Ywbc7WN9JJs5E6cqsdmvLR1MohARZBXttf31b8FpBLlrqpu58A2
	n1Q+55ZD7Rp/h8x8OX0wXUaJcq55V9XBo7gDcIrAE6U7tNHLHg1j0J4KCoUZN1wmHbl78TJ3jT6
	1fflXqsFQLfAUMyXk0b8PFUL9Hw==
X-Google-Smtp-Source: AGHT+IEyPYGVIGctM8flGqu9QR91NaZgOu+gmaEjFyDcEPukNhfYOFghBSH/3RMkvc9pPV1ROu/JBf6StL4PXETlzNk=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:aad0:0:b0:e0b:ab63:b9c8 with SMTP
 id 3f1490d57ef6-e1180fa06d5mr496276.11.1723743585775; Thu, 15 Aug 2024
 10:39:45 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:22 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=635; i=samitolvanen@google.com;
 h=from:subject; bh=JdHnM47y3DGHzd+8iOwDpRmp/jKwcxYBnVNDUzIM1Ts=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj06AdeqULMg79EuNtCXP+0M0mvzmV7eGmEL1
 TuO+ezyrdOJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49OgAKCRBMtfaEi7xW
 7lvXC/9FcJ2/EUgwUrKKscdKY50Al5IkUmE5/+LjfwqoQUfzZ3RY4s6dV6KbAcj4/Bhr2Xb4dt/
 2e9OMOyAkxPtsaxq2meNZWjTCOs5B1S9dt4YHoHFuFH7zcjd6gWIMJI8k1mlaXiZlcaS4yy3/fU
 3JI5uzSOu/9bidigVxQV1rgTfC5cAw8PKaMpTuiZ1mgPWAUrADAZMBpdO8sSULOKFzef1yk32ya
 89z7CW/fL0vwVz+9RZktwxObxSFIvAgmq5UkMp/Q0PS/lsj6kCbKsje6YaKlpgZys5otmjCXA47
 cwLMLAhG/Yr79l5URg1O0tiij11q9zeoKn+2tGUH/qOls7UpOgHzoGaqcBaQBhLm7heKDc4DG+Y
 ZT0AQdp9myWj0erPLfH9Slv3EbXdbYBX1fN1lQvOb2LGm0vExdj1vlXX2J5PPetMZ9f9eSKN21G bKZcAaEPBGqMik8HlMXvCBOIAs2VM0OkWTxp3tQE5pgq0BPWeb8KEp9M9H3mEzX8UeiQs=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-39-samitolvanen@google.com>
Subject: [PATCH v2 18/19] x86/asm-prototypes: Include <asm/ptrace.h>
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

<asm/ftrace.h> refers to struct pt_regs, make sure it's visible.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/x86/include/asm/asm-prototypes.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/asm-prototypes.h b/arch/x86/include/asm/asm-prototypes.h
index 25466c4d2134..c82e68c8b7c2 100644
--- a/arch/x86/include/asm/asm-prototypes.h
+++ b/arch/x86/include/asm/asm-prototypes.h
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/ptrace.h>
 #include <asm/ftrace.h>
 #include <linux/uaccess.h>
 #include <linux/pgtable.h>
-- 
2.46.0.184.g6999bdac58-goog

