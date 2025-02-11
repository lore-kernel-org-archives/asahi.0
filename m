Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6757E1EF088
	for <asahi@lists.linux.dev>; Tue, 11 Feb 2025 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290093; cv=none; b=CZOiKZzZLl+6+8EVCP8ROzPhOTs0/rrHmywwjx06nY/C34OdmougU7WbIYJ46j2v77uKmDHYAAtr4+xh5SI6VIznXo8CeGjvBl2mt1f34TzuHPHZOszSkXe937b0arZ61xUQC+Pz47bkdYtkPFMfzRDoA8rL91FdKMmOKdNASnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290093; c=relaxed/simple;
	bh=LhWKPpTipmLEivaGN54U0rIDOOw1aCiRMd+yRoDvpMg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I4KmLIj0oD0JCl5b7I9zcoEL4ooz9BbW9mLedHO1tYYHQkBO6ekZCLv1V+J69Ior3JaUvaT6uvPuLyEPgeV4kJYS0S0k7Ovvhkn9A0aZgQjOYfqUB7KKVFfqS5LWAZbowiLKEUWhKgFLMtnOYZ9TFr6+Rctd+IumvoPA/A7EvnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APiYYkRm; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APiYYkRm"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fa40c0bab2so6539650a91.0
        for <asahi@lists.linux.dev>; Tue, 11 Feb 2025 08:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739290092; x=1739894892; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ixc1THfJdnAMw/BKiEzGtjmAxEFef8cRNT447pbK/8=;
        b=APiYYkRmNg1vaUy97BF2RVf8eW/BVGT/CDVwbQwUGEZNcR70SMuDk2QfKOxjcQDFYv
         CPz9RLbE93S44D6IZBSM+VdiRQ6/GCgD9Om8mK7B7XdiKT7vIQXVpcm6IPUplqCqIrLR
         gRgdbHN005Zb8ecafq0q/HYA5fybeLIkFNrtU/nExqEylZo4JyWksAghBJy/slwbep/8
         kJ0s7JOjyi59G0L69BkRlmjjpYmOJ/2yQRaU6LBjsT/x9FXNyLaL1IsvhPjYAG2Z/62c
         7mIRSZKIrru0CxThgU+vRgB4/WdKDOuAi9UysEp3sEbcBio3ws/otPgZfotl1A6Jw0aL
         m9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290092; x=1739894892;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ixc1THfJdnAMw/BKiEzGtjmAxEFef8cRNT447pbK/8=;
        b=rbwMc/CHFTpvLrDJxP1ikHjOaF9l+xRjvHLXl4qS+g+gEm49QN0Ta7NkT9no1gj1MJ
         ykYHdpkJQPhrQuGyApSAz9PekA8R0gO9XJ8soY1JFH+/x7fNxGR54ae7YZlXS4dykvxE
         5MscQMijtmPKH9vhXT0BDoyH6HGooIiavH4ymq5pkwiKemmLSEIO4LdrpHzIW17zYR5n
         1Etx/zWwZhjqNOLfl3libLc9ERwiYDA1LL0hvqVkScy2Jrdfe1zZnqwcRQxwbXT98hlv
         ygzkCIZ7Z3L91pEKfEokGOm0PkO1reseWXSMUe7YJ7hVz869A2BxkFuyrRK4tKXy5fc1
         wpdA==
X-Forwarded-Encrypted: i=1; AJvYcCXH5fa239pM4GCjcdJ85I0jrzdVdC4BrkwTR8ueqsUmwTpkY/CgNhiRL/OdQROwx9vWgx/AFg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5TJLeaehZplWkkrLve69z+IyqQRhfBTFv2keaTd4/49Bj+nHm
	KCRIcoGy+RUB/y8Rc2Hy1P+VUTBkWbFrdI+punB+xBKHuntP+KyX
X-Gm-Gg: ASbGncsmS+eJQW+FA0bLk0oWZFvIfisw9GNYSidP0fs7RxWoDPM0IGYpdR0vD0ixkI5
	dPbS5bsPHIDBTRc47+SUdjOd9J82y+ik404oeJUXmI+0b0aLJPcnhQKRX1Ion8besh+W7vuEwRZ
	3clr9HXa4+hxiWcHGPpyDfemhpfuaI0ceSBlJQtFWSFV/ii8S6Zpx3vUwagGv/vL+owlW62yhKz
	w9YKML25LCzBBrffqUCnZ797sW2FXr9wj/tQuL4q7eOIF8tiMv2sLsuGkzRk2yubwVaJTjzGLpn
	Eg08yvETc+dDeZ+fYg==
X-Google-Smtp-Source: AGHT+IGUgRw95Xr5p5dnLjRuf5lW7GFqBihDMP62NQd8lMGS3/Oqusjqad+1bvDfuQDFoX5VFLQOqw==
X-Received: by 2002:a17:90b:4f87:b0:2ee:d63f:d71 with SMTP id 98e67ed59e1d1-2fb63d16655mr547999a91.14.1739290091498;
        Tue, 11 Feb 2025 08:08:11 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fa618e5e18sm6040478a91.41.2025.02.11.08.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:08:11 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 00/10] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Wed, 12 Feb 2025 00:07:21 +0800
Message-Id: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALl1q2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0ND3cSCgpxU3eSC3FJd00TTROOURGNLEwtjJaCGgqLUtMwKsGHRsbW
 1APVHuVJcAAAA
X-Change-ID: 20250211-apple-cpmu-5a5a3da39483
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=LhWKPpTipmLEivaGN54U0rIDOOw1aCiRMd+yRoDvpMg=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnq3Xhx5X5ZyZ9c0S7S8AqLAss0fNOYSurIR8iI
 1MgMsTYRqiJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6t14QAKCRABygi3psUI
 JKa9D/0ZvnMJNLT9eidZ6vnHegswqc6/yypIZuzVV8rtSBXxbRzjGJ2KkBj/IQj+mPZZxNMjee3
 K6y3uflppl6Qk0nqnxz3f33yIT2zHfqbaAoupm9PZNcL2dKtKSgxv39VlhPOhXK7jzEtI9Hojro
 iFBcgFdET7U18wHHHaQsOZLO/t73mlZ9i3rCY+vOnSj2KH3rA/r47XNRvLhWy1YUuqPsYAwXFHU
 domqHN9pWbmcGQ/LEmW5vGmUUNXGT7YWhw7Sqy0/QK+i9LkI98ZeGFuQq0ux7JdXgtnFjzWcxJ5
 J58yhkWb6iKAztnK4Ize+k7BvofuhKI9r+8FjGtWz3VMkGESsOyDGA/RHLoBYQUj39dzm0aRU0m
 0dYlnRE68z7spsqs6d1kNelPcwraWYZY89hSEsN3KSHtAlVzJ+DTWrjzHBNvTbflHW+69I0qE8U
 FANVs+jYI7ZHnYrQdoEElMUCGWDDMWPymyYkeoD5YMauWBY7jc9I1jlJwIf8LeAabu+g3fgynFE
 soGVzcH9PLSSs/lMTJ6pY0enYGl1MabEouv0/Y4yX802RgdNm3laJTYQQclq2YHgx+r65IgGj3R
 +uzd+B2sylPAb5mKouwjhM8X0UXGxCRjiZArrhYKU8rz6lPdWhJmt7NUjTrlJUKiPGOPLvrSK7r
 fnhYnkPHdiYs23g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

This series adds support for the CPU PMU in the older Apple A7-A11, T2
SoCs. These PMUs may have a different event layout, less counters, or
deliver their interrupts via IRQ instead of a FIQ. Since some of those
older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
be enabled by the driver where applicable.

Patch 1 adds the DT bindings.
Patch 2-5 prepares the driver to allow adding support for those 
older SoCs.
Patch 6-10 adds support for the older SoCs.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (10):
      dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU compatibles
      drivers/perf: apple_m1: Support per-implementation event tables
      drivers/perf: apple_m1: Support a per-implementation number of counters
      drivers/perf: apple_m1: Support configuring counters for 32-bit EL0
      drivers/perf: apple_m1: Support per-implementation PMU start
      drivers/perf: apple_m1: Add Apple A7 support
      drivers/perf: apple_m1: Add Apple A8/A8X support
      drivers/perf: apple_m1: Add A9/A9X support
      drivers/perf: apple_m1: Add Apple A10/A10X/T2 Support
      drivers/perf: apple_m1: Add Apple A11 Support

 Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
 arch/arm64/include/asm/apple_m1_pmu.h          |   2 +
 drivers/perf/apple_m1_cpu_pmu.c                | 776 ++++++++++++++++++++++++-
 3 files changed, 752 insertions(+), 32 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

