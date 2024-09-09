Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04431B14FB
	for <asahi@lists.linux.dev>; Mon,  9 Sep 2024 09:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725873302; cv=none; b=RxOdbWoQQ4CJdQcUmHosBPtM+Jj7qx2EeYKnNQs2+X3tE57fzQViliTe9dkF0UPbEKGXBW4QAPyQ26wt2Pkx4BXgYz5k7mZHhSpUA5ST9+BAy8MKUrEVRwVOubgKVMMmgIGmksLEXkDmE/hWrTeEZbUz4gMzRsmUvVwvpqImelU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725873302; c=relaxed/simple;
	bh=AUGbskrmfvCbMRfyZwjHYJ134pupCetagT3UQ1uZq3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oloQPycGSM8/ATH9e1vizU3UhpAA0PZVQGl/RWPzr/dMsy26fNdAbUJmt7wcp4+nZKhlsaXoAZdIGULJb6J7MTAK3tzztq2RHz2pWFrzYfE+Zjs+GHTLo5R2oF/liyR9Op4cJVdLAwa+nTVrs2yjNvKVDSWjokC5jPjq5SmnS8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJsfc07d; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJsfc07d"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-710e1a48130so661295a34.1
        for <asahi@lists.linux.dev>; Mon, 09 Sep 2024 02:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725873300; x=1726478100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aY38wG8uRg5vqt8oTLPmwNTAVl1r38QXK8R8qBDLkRY=;
        b=CJsfc07dRcRhQCAi6GoD+S1U2HUYMdtTZEfFtngednajrlojuKgoLnpRd4g1sPmced
         53fQfxFHu6/x07/e8IU75+KIBg98Ij4NRa9fJy5bGPYohoD0ftl2Tr1uIT1zYvXjEMii
         4WVZyQvTtY9oEfxwnEqX3gJa1QnyEY3ELnUDpONi98qL+fOMMnxhg0kBXRaKCf1f0c/x
         /1OgWuDkGQqGep36FJ66U48HX+4VhzRd8f9A7tdVqT0kz9X/vi5s3nQVoCQnaHwkMOk3
         wyXPJJ9Vcwah5i7T0hp5iCCOkJYymn8V7SIstV0qa088EG37p+gp6zBkLJQ+ml4rfmLu
         Ef1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725873300; x=1726478100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aY38wG8uRg5vqt8oTLPmwNTAVl1r38QXK8R8qBDLkRY=;
        b=OyAnMsCaNGpe1cXWn5URx4UH6SpvJ3jQV+Y1KNZ5MVTAMQejEIu9EePXdkKUbL6L2E
         LhONJteCsbcnmtAuyXBpAb/GxxTpkBkHlLQfnt45tRn0eStaEzIu6PqclBkRbfONaf6B
         wNF943LkTM3taSjcnJWkaVfLq2Bp+S+JlPbaEujLywEj3kJyjpg8cj8Gmv2sLtPkF+P7
         rlXGN7O3eXihsxpXtkVkNljDZjDyCgv3koEb1YfIfyO0PqIvpUxH6gUgRv6d3a9DZZoj
         xslU/jM8jRj1xUAzZelzDHQhLF1f/0fl5HdkxN0s6ifhBbHv6FivbAYPFwgnaCdyElKi
         1Q8w==
X-Gm-Message-State: AOJu0YwEc6rn3pq6PaxrFyO31/DryKoG9JUMBm5bNM0l8G+7cTueqCaP
	LmPcIFDifaqCt7sEPNxShKf49kmnUca8p5wyD3BHnanfoTmrvcLm
X-Google-Smtp-Source: AGHT+IFQNtSa0KUHq0nxQ/Ce96vx5AH5SGtYdj0R/UvOyMgidrZ+WR4/FRxpx0xbeZ8BW/Ye2Atm5w==
X-Received: by 2002:a05:6830:6c17:b0:710:f223:3e32 with SMTP id 46e09a7af769-710f223411bmr466258a34.10.1725873299751;
        Mon, 09 Sep 2024 02:14:59 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-718e596882esm3120689b3a.135.2024.09.09.02.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 02:14:59 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: asahi@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 0/2] Disable 32-bit EL0 for Apple A10(X), T2
Date: Mon,  9 Sep 2024 17:09:58 +0800
Message-ID: <20240909091425.16258-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Changes since v1:
  - Drop #ifdef CONFIG_ARCH_APPLE, the code to disable NV1 on M2 does
    not use it either.

  - Added comment to explain why 32-bit EL0 have to be disabled.

v1: https://lore.kernel.org/asahi/20240906171449.324354-1-towinchenmi@gmail.com

Nick Chan
---

Nick Chan (2):
  arm64: cputype: Add CPU types for A7-A11, T2 SoCs
  arm64: cpufeature: Pretend that Apple A10 family does not support
    32-bit EL0

 arch/arm64/include/asm/cputype.h | 42 +++++++++++++++++++++++---------
 arch/arm64/kernel/cpufeature.c   | 27 ++++++++++++++++++++
 2 files changed, 57 insertions(+), 12 deletions(-)


base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
-- 
2.46.0

