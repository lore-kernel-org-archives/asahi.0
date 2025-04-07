Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210221392
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 04:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001166; cv=none; b=i5NhboYwkA56J+nwxNPglCFdGv5+JF2FEqqjj3Ro8DGHtQa3skHpUXb8IDkqJnHN3cIFcpTzDuwLGc6RY/JbcK7p2P4J4yVyt0oJfi+3lJw4Wh4mDqDWBxue1i6WJWetkg1f/KSGT2rWnzKsbLc7NzXn0zZLyXWgOHs3/zBLVTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001166; c=relaxed/simple;
	bh=A/h8OXs8Wekr7gbuWaO+81ojzwQgObVHH0lNAKAIdNU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FsJ+/mTE5llsa4PTv2U73bDD61tfaY+18jyS5V3RnNSB1WFn12TYVAt/73uyLOcfcYEH23LHJD1EkQaw/DAFf/xj6Cp4fF6UBNBJ2soN/M3AkqDgLYJC+7f0IfJZ3RNPJNrLSpkkBUckKZHmZz8G9RcYerB3C5GZLl2Fdu05S5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5ZsHxPR; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5ZsHxPR"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so3267685a91.1
        for <asahi@lists.linux.dev>; Sun, 06 Apr 2025 21:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001164; x=1744605964; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3EuDa5MdYzDvx9phCQyiyQIJ/EzyBR8j5u1DkbRAKbc=;
        b=f5ZsHxPRZv9V1SSkw9uVMY4sTMJM4faO8NOThERre8DNdXdEwZSSOrjkebmyzlSghF
         rLK0zs5DcpLEsgYpHKTOUZeQAvPViXcOGvWWi4Q+6BnT7O8BVBgRTqu9omY5o3jsVs5w
         JCnKN0k+rNGK4JXqb92Ux/3QjWJeyhPHpReHh2aY4KOuYDXHCUFbJs3bF7fjtqPmBYl/
         fyLbSd2hzsn7notghAqXxlHl5F/U/rz86Ai9mOkRGFTVbekK8gLDq1wsOZqCpZe4Tbsn
         vJbvJUZ3wDk83fZfMqhlsfGc4xSVLjDr4DnrrdDhdPRrVxQA0s5fdaSqg60cDk2WsMEZ
         8ZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001164; x=1744605964;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EuDa5MdYzDvx9phCQyiyQIJ/EzyBR8j5u1DkbRAKbc=;
        b=MyxscGlMPoBo7K4NmMXYDh10SD1o23pu+5Tj9f5TwR2HXh0xdM050jsDC7x0C40JY7
         NQ1KLJ7aCtSUE/u/KOr5xlY/pmgRZPzIt4BQU7RHpc7se1ARvtXbrT09EddLpVMdqX8x
         g4ARMr+CzOVw2GLrpkpvlbiIytqNcDcq4/WtITDjb4HTi4EfpusAXrPXU2Y5XgtognQi
         1kET1KEXGZ3biLq/xUcC8HpqPbXyDLM0qU6mPDrCEs+HhCZTGX3sKKrpo4MPDX7qSQtC
         qieL/tV/K1R77iSY16bvefXtfA1Cv0hLo3ZrupoxsoWZGNrtePCHfTdIiu44f52gDGV1
         R42w==
X-Forwarded-Encrypted: i=1; AJvYcCWqxzafLA6NviboK7vrAMtMerzJCLJykBV8NbZtw5YFMi52hz97st37m1PDeZkgHcYhQ04+sA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwaBadIOcxehMGmVZChm/9xRWdSAg+ymYDzVM8JWKOa4+VVxDI
	2UzwZy5I1K/AZA/1z4CnhVCCSeqW79jeOmyDdA/W8hdKHtSn3N0b
X-Gm-Gg: ASbGnctVdIuS+AgUTOoO2jIShyWRzeXWykNDxucsgfPwJSDFhB6Kx6nNYmE8s9lhyTC
	CZf5Lct2epMWg1wweQ7pLlDUiZ6pdCvBXVnXas/1Jlfg24UNaOimxCLyPfktPiDetk721BFVzK5
	8wNZ67WpgQk1r19m/knm9c/Mq6VAK3ynCGLnjlN7ea5FpVyIDhkEMt6GQJm5wYLPsnpKwukBYM8
	0PgK1kDKgLd3tW7/fRqjj1UbOGD6HzNH/KNqP49OZqCVwtkosbd5bnSHsFAcYr68vPhvHRs479Z
	QqHWkxnekIQB6UNVn+YwFHKql6XqBSXvzs9TKrNbaMiypXgKO5XmWk1FqA==
X-Google-Smtp-Source: AGHT+IGnnwu3PoUM04kNoMa5q/pPcTApIutUUP6YpURP7hymSf7y+lisKuwk4Y0t7sbuK5dmWNv2yw==
X-Received: by 2002:a17:90b:2d4e:b0:2fe:b77a:2eab with SMTP id 98e67ed59e1d1-306af7b37b5mr8196187a91.32.1744001164238;
        Sun, 06 Apr 2025 21:46:04 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:03 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v6 00/21] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Mon, 07 Apr 2025 12:45:09 +0800
Message-Id: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVY82cC/3XOwWrDMAzG8VcpPs8jluRa6WnvMXZwbbk1NE1It
 rBR8u5zCgMnsOMn+P3RQ00yZpnU6fBQo8x5yv29jOPLQYWrv19E51i2ggZsA8ZoPww30WHovrT
 11mP02BKjKmAYJeXvZ+z9o+xrnj778efZns16/ctAnZmNbnTi4BL4YBzh26Xz+fYa+k6tmRlqi
 hsKhbI749G0CMK8p/g/xULP4hL7KJFN2lOqKW0orQ+n4Bsha8jJntqKAm+oLbQVAxQisESq6bI
 sv1hkktWQAQAA
X-Change-ID: 20250211-apple-cpmu-5a5a3da39483
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3865; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=A/h8OXs8Wekr7gbuWaO+81ojzwQgObVHH0lNAKAIdNU=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iAz4hLMliudNCLKDZSI8+c8gq5cO4dSJTrj
 JFIwGCrcXWJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYgAAKCRABygi3psUI
 JDkcD/9GRYoFGfptUaxyUh/OHaFxIDxYKvUhITxgKDs0lKXNXU6O4QG/aPDi+rBHqKlgfw+pv5G
 4JKAvs+uN4L1tBkI2q1v4dYPEzoNO3qODNIRRY6/5oavcmq8u0ADZdvg/as/W0cdeiSFqCrHaIT
 O1WBwqwyBztXKw2IktrdwOeeeVnYdfbSUpX/0fQiBCBPmo6/p6Whg9isPpwUFYga+/BveBaPvvI
 tXzDs9Pb2XbKiSBWcqMOqeS5KGEaiBPgxtIR5xrGpazJVM7FrkzDpAcd//+XYTHvpkvb9jBG0d4
 Sncjv5mBK/ruyOB7UpE3VDKSvcFaTJlci3mIjAVCQLztuwbm9L8ukjEjD9DanUzwvokko0HfQxi
 O+YlR69WiTUEVWK/USWOP2GHFtJ+GVXREztk1LbpjknwtY7D96IGHtrpZbE+S34ZrKKkfk9ETZo
 g0dUflMQqVk8dx4nUUyfdZmnxno3cJWMlX8Rk/wM6WoS2B/RR9NbHWjyVUM2Mb/MCy+t/38EnAG
 FDHVytWAunHr8k7H51yMp/hWPWRgGbm67QkMQGcRXSc3DMlIdiYXR3mvzy/S3XXYq5fGuCZNxM8
 nP8Im3Bp43WHdCaqvqJXebZipW0WDhDzFvnlnumZsT8UeqNKr+GRrPUsANaw/fJRYj9haTvRuTn
 rVjO4qNRP4w9eMg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

This series adds support for the CPU PMU in the older Apple A7-A11, T2
SoCs. These PMUs may have a different event layout, less counters, or
deliver their interrupts via IRQ instead of a FIQ. Since some of those
older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
be enabled by the driver where applicable.

Patch 1 adds the DT bindings.
Patch 2-7 prepares the driver to allow adding support for those
older SoCs.
Patch 8-12 adds support for the older SoCs.
Patch 13-21 are the DT changes.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v6:
- Rebased on top of v6.15-rc1 (Conflict with FEAT_PMUv3 support for KVM on Apple Hardware)
- Add patch to skip initialization of PMUv3 remap in EL1 even though not strictly needed
- Include DT patches
- Link to v5: https://lore.kernel.org/r/20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com

Changes in v5:
- Slightly change "drivers/perf: apple_m1: Add Apple A11 Support", to keep things in
chronological order.
- Link to v4: https://lore.kernel.org/r/20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com

Changes in v4:
- Support per-implementation event attr group
- Fix Apple A7 event attr groups
- Link to v3: https://lore.kernel.org/r/20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com

Changes in v3:
- Configure PMC8 and PMC9 for 32-bit EL0
- Remove redundant _common suffix from shared functions
- Link to v2: https://lore.kernel.org/r/20250213-apple-cpmu-v2-0-87b361932e88@gmail.com

Changes in v2:
- Remove unused flags parameter from apple_pmu_init_common()
- Link to v1: https://lore.kernel.org/r/20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com

---
Nick Chan (21):
      dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU compatibles
      drivers/perf: apple_m1: Only init PMUv3 remap when EL2 is available
      drivers/perf: apple_m1: Support per-implementation event tables
      drivers/perf: apple_m1: Support a per-implementation number of counters
      drivers/perf: apple_m1: Support configuring counters for 32-bit EL0
      drivers/perf: apple_m1: Support per-implementation PMU startup
      drivers/perf: apple_m1: Support per-implementation event attr group
      drivers/perf: apple_m1: Add Apple A7 support
      drivers/perf: apple_m1: Add Apple A8/A8X support
      drivers/perf: apple_m1: Add A9/A9X support
      drivers/perf: apple_m1: Add Apple A10/A10X/T2 Support
      drivers/perf: apple_m1: Add Apple A11 Support
      arm64: dts: apple: s5l8960x: Add CPU PMU nodes
      arm64: dts: apple: t7000: Add CPU PMU nodes
      arm64: dts: apple: t7001: Add CPU PMU nodes
      arm64: dts: apple: s800-0-3: Add CPU PMU nodes
      arm64: dts: apple: s8001: Add CPU PMU nodes
      arm64: dts: apple: t8010: Add CPU PMU nodes
      arm64: dts: apple: t8011: Add CPU PMU nodes
      arm64: dts: apple: t8012: Add CPU PMU nodes
      arm64: dts: apple: t8015: Add CPU PMU nodes

 Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
 arch/arm64/boot/dts/apple/s5l8960x.dtsi        |   8 +
 arch/arm64/boot/dts/apple/s800-0-3.dtsi        |   8 +
 arch/arm64/boot/dts/apple/s8001.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t7000.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t7001.dtsi           |   9 +
 arch/arm64/boot/dts/apple/t8010.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t8011.dtsi           |   9 +
 arch/arm64/boot/dts/apple/t8012.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t8015.dtsi           |  24 +
 arch/arm64/include/asm/apple_m1_pmu.h          |   3 +
 drivers/perf/apple_m1_cpu_pmu.c                | 807 +++++++++++++++++++++++--
 12 files changed, 871 insertions(+), 35 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

