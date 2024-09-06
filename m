Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30AC482C1
	for <asahi@lists.linux.dev>; Fri,  6 Sep 2024 17:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725642918; cv=none; b=GuwGFMoqraNzOKIkm/jYjvTofOTa3X47vLsqpOE6j3g+rTFge+FuWNHDrCfbw7KsFZjQkkF8wFvdJpg+vhCldlcBNnGj6tgIHu9OF3wKyKKfwf0hh20Yt2TI8HpfSAjk1ZKnQFmShS3g68NUYj650md3RWpdHPRMhudSrjJwWQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725642918; c=relaxed/simple;
	bh=Jmls5nUdyMOsBAiBg7TTSU9JfIxxrNVlDj4mecc/yoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BILsqD+FP+xpJFPNSXcOtGmI5MQQUhi8lvx9hmmTHgBIrB4HuYbbOPdJzdLuxvwrNpGhOTQdILXLTX4B//3C3ArDKrXbSX4VrB9L52IvIXABIFq29xhe7peZJ0CGwSF26TPtTyLNjOXFnPo/PXf4A9XxIP9ZY/GQ5qo19raTDnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOBVi7SV; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOBVi7SV"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2d89dbb60bdso1641159a91.1
        for <asahi@lists.linux.dev>; Fri, 06 Sep 2024 10:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725642916; x=1726247716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SaVByIt9eCypiDOxTfs1PccVcQTRV63Fz457LfGw/wY=;
        b=JOBVi7SVnMS07gJWqOmMnAmxA5yEwoSLM1IcPWNc7QlsfpnDEk/7mTRZ+wPSN9S8WB
         FKRLTarw9CjWIv4uylX4x+o4z51A9Cmc18lmomhxiEdWhK/I4eNtiIQ/c4W718Fz62/6
         zYNCphRyTlrjYh5l/N1IXwOqQHgv459WIu1AKbXzle/7M5iik5SX3wanbV/TZEFtywxV
         v3BAnCDJcNe2Kcm22/2cd/hWNdBjZa3vU6+b+56lxNOfYaJmWQekT8a5JuTPvJg9kgnC
         SK1BpVSVkjMVol3skGGCc9S+2spH2Uh5+qQMncxbTUHs023Ubke3FZCj/pvoblnqLrYS
         6SUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725642916; x=1726247716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SaVByIt9eCypiDOxTfs1PccVcQTRV63Fz457LfGw/wY=;
        b=YdZihyb9LEXHMXPKselkIn29ATGZg6eS9U3KSiFF0T1sJ6i0G9N9WP06xkxlNjG242
         Sm3mgZKBI9r6a+decJLBgrMpOOiB2T5jwHn0jBcdABJrKGDcdQBoN89XvN7J6nXzuIYP
         GFCzaeY3/1AJSIov6Rw3EIuKJm5RKLk+FCSrfcpl3oSRe2qTtXwlhn/LrpChmSR8JMaP
         NeIT9JoP3wosN+JUlw2EQNCFGUuR1HzC06vBxAGJ5Bm1L1yOJtdI3mUQ006cNSDoLZu7
         G83rHuMUyuwREXAMR9ZmB81aKnTrVvHbjalWk7TKpBTKb75jP9uzsShJIyRzGKM6J32c
         bfvg==
X-Gm-Message-State: AOJu0YxQkDIvrh6/118X3iTCin1lrSJgpFUSIn+JzwMnabcCgNk85L1N
	i1NIH5TRX2d2I/zHyomX/iQE59DZVzSlndaZcXDEHlgu++olGT9g
X-Google-Smtp-Source: AGHT+IFBQV45Sa0tIy43N8zFjBdNAf25uRTNT11vv0asg76rfVvFBpgpxA3E1uE3Z4F+20X1KKpO2g==
X-Received: by 2002:a17:90a:be10:b0:2d8:e3f3:fd66 with SMTP id 98e67ed59e1d1-2d8e3f3ff0fmr19353405a91.34.1725642915887;
        Fri, 06 Sep 2024 10:15:15 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dadc10fa99sm1841519a91.39.2024.09.06.10.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 10:15:15 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: asahi@lists.linux.dev,
	~postmarketos/upstreaming@lists.sr.ht,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND 0/2] Disable 32-bit EL0 for Apple A10(X), T2
Date: Sat,  7 Sep 2024 01:13:23 +0800
Message-ID: <20240906171449.324354-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resending as the cc list was messed up.

Hi,

Apple's A10(X), T2 SoCs consists of pairs of performance and efficiency
cores. However, only one of the core types may be active at a given time,
and to software, it appears as logical cores that could switch between
P-mode and E-mode, depending on the p-state.

Unforunately, only the performance cores can execute 32-bit EL0. To
software, this results in logical cores that lose ability to execute
32-bit EL0 when the p-state is below a certain value.

Since these CPU cores only supported 16K pages, many AArch32
executables will not run anyways. This series disables 32-bit EL0 for
these SoCs.

Nick Chan

---

Nick Chan (2):
  arm64: cputype: Add CPU types for A7-A11, T2 SoCs
  arm64: cpufeature: Pretend that Apple A10(X), T2 does not support
    32-bit EL0

 arch/arm64/include/asm/cputype.h | 42 +++++++++++++++++++++++---------
 arch/arm64/kernel/cpufeature.c   | 25 +++++++++++++++++++
 2 files changed, 55 insertions(+), 12 deletions(-)


base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
-- 
2.46.0

