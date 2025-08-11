Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1101F9A89
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920523; cv=none; b=KQ87M4vWGJKf+/anlRFA43xYG77i9d2IKxW7OSfzjXgmN47G4Oc5euvfiPoK9+JWIJ4ulmSnph61NIl52r4SeO4wqwBWjirkExhetx0fjET3rOdYV19AGS6Pj+mD90BpYjorp5dE+HP2sR0pcFpEd2/6V/A92ZwALFuow02snqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920523; c=relaxed/simple;
	bh=+LAKu174f1xhSbC2VdiHkWIZYXz3wYKQPJAQC4FzNig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XV0oMZvpfpXwJIInLTbwlAT621k6AV7XgczjJOtAHqd4nCVdEQa+Hp1/tfH/DMU3bsBbUOYKV5t5vj9dG9tK/2rJ9dfY6uOflNzwHvrrSqA4uwKrukIp7e8TVE9zjyhe0zLVJ+qsTYJ+l3tHl7gSc5L4ZlPH9agfPHz2AWa9h0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khn+gqm7; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khn+gqm7"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76bc68cc9e4so4442583b3a.2
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920521; x=1755525321; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8imCO2VyYcb1j5phQLrLVVRIepCgCLAAPrEPMDTG34Y=;
        b=khn+gqm7IFU1z3sz+G0llqo8SBaWKmCvzsko3HT2mU2Yx0KNNFYjhsNcDfGi4Oxl4s
         5BblJNA6b1SbQh74tMd7FGS/5lKDuH3ut4WRsax1jy334/yLsjl3XYTgbjlhn9/qKbnN
         cLz/PFEuOy2TRP0dNmbp1QgaH2qj0mN4/hGq5Ob+O57ZBcQogU6WZUKd4XEKxLyHCTdy
         T49h9nxUwsJ322k5Ywvdz6YuyKR2F/iEsXwaZLMZdMq2jVTAwLnvpc8QNbMY+6aKu0L7
         62FlRB1J4dUgWCF76x9oTFNQVKhMx+YaxVFdut6OUFOPDs/mMq5VGDKFiR2En3+YJ2Ld
         1gsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920521; x=1755525321;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8imCO2VyYcb1j5phQLrLVVRIepCgCLAAPrEPMDTG34Y=;
        b=ppo0K3c3Ath0SmOkkEx60JQZbYEfDd/LIkMij3raHN2HzUwrz1RgZFVP9yOLQY27uN
         n33Yj2nipekIDFekIVe4sUeMSJLqi6zNcDUQ5dRl4N+OlT/ixzcCu3D3YwP3rL8RLEwC
         8/GEOn9b3KgcLBhk9Vj7DtqKpcLd+jlACixyhZGjsyu6CWt6d0uv5siqDsEDvhdP6jha
         N9tko9e9k7Tx12veb5WMqQ7gnFK/BUfuK7q5JL6D0xEL8TQJOxMVovnsVqqLemXLoFOs
         U1JHlLbSiaVzkWIweDeWcfUpDX9oFSXhKLCV9m6Vl4YvI+37I8jSECQWfuyHXdEn9t+5
         WF5A==
X-Forwarded-Encrypted: i=1; AJvYcCXoCWgy1IPXoRGioIJ2VBXe+1gzB+giMcwSwSGBTNxEf6Wjar6TTey8pH8y1jXjId/xWt5OeA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPNND8PUJtx02R9p2Q7YDLheldOKYP4VYpRAIzEI5ail/PjHBW
	BgoQz9maycKVcv6+26uqFxBZLF28vYK874YBjxkneWKyIFU93dzbdhjK
X-Gm-Gg: ASbGncvkWwmAZtb9fm2rJM28tkbH02bdyeO4kZJ51/qEQquys62+gaxSJzsunlekEjH
	KQL4cMVUWAu2NHLjQXZRTbscqjuMzKpTUQ3DkoHk3Uo/D61+JJZ17t8ig1/2mHMARjLXAcYXJ4l
	jIy9R/m1zpA6RAmx2kcV75UnJ8EU+Q5G7hRKcjHerw6bCzQSEbrzyD/84H+pDiK4qKDi5TPEBcU
	EGY1L+CwwDosQuug+ePXhnmYinSLMTN7xu3pLE5PmuiX59Gn49MVQ12F5cqruyDXFC7VlKTQOmQ
	iWQLXw6alUaSOY6C9jE8pAepiR6NtnqjIuAjDFi4e2CfuIuwlmrTfOHXCq77mXj8cKS8zMbaWU0
	nT9MvBoM6quujXViwgPqGrQaK+djtDB9Q3BTUjBMb/8umPT5J9ajNTdf2wA==
X-Google-Smtp-Source: AGHT+IENxJyKg8e2tAP2l4pvGlyIwFK3L3UGuIA5zM1QHUrPj8V2EFyRgxWPSC9CGd+swIwok6HwCQ==
X-Received: by 2002:a05:6a20:6a0a:b0:23d:cf88:e31e with SMTP id adf61e73a8af0-2405500e280mr21954086637.8.1754920520924;
        Mon, 11 Aug 2025 06:55:20 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:55:20 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v8 00/21] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Mon, 11 Aug 2025 21:54:32 +0800
Message-Id: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABj2mWgC/3XPQWrDMBAF0KsErasijSRr3FXvEbqQR6NEEMfGb
 k1K8N0rB0psly7/wPv8uYuRh8yjeDvcxcBTHnN3LQFfDoLO4XpimWPJAhQ4BVrL0PcXltS3X9I
 FF0wMprZoRAH9wCnfHmXHj5LPefzshu9H96SX628NrGsmLZVMSD5BIO2teT+1IV9eqWvFUjPBm
 poNhULRN6bStQFG3FPzPzWFNuwThsgRddpTu6Z2Q+0yOFFQbJ22nvfUrSjghrpCa9ZgKQJytHt
 aPalVfkOrQgMjQQJw9Hewf1Kn1Yb65ddY7tRU5ECt6TzPP8dqajwGAgAA
X-Change-ID: 20250211-apple-cpmu-5a5a3da39483
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=+LAKu174f1xhSbC2VdiHkWIZYXz3wYKQPJAQC4FzNig=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZAzeYECu3q9NXPYbpcYcvwUCODSxZ5a4119
 wtG+Jdk0MSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QAAKCRABygi3psUI
 JIh2EACPm7iZczQOtNsl2grpezfen4As7n0d//LN0qy3Ld3fMEkyBoW9c5vVIsSm7X03a35pPtq
 3a3dIbo5xCsN61OmqliYDNotIpnMXzslz+7jtgdfTdM/qygjXB0q/ZEUQpSUO/Eg/G1JeV5QsAI
 iBdrY0BaokZnPbg13soaR9dO9r8rWlEpHkzj4XOwiD3gvZ/sFjKSJGnMEsm0MQgxpFVc7cty2sz
 9C2QXBvMXSUjFVzQCIPsrj50Y08lfpL72kadxbGolxpe2x4/zfTIGS7oJhz4smU54IMakcwznjl
 VebELeykl8bm4BDv/m/RPz9KgebuabPPi4/WyQGYkMfj2WTY8RObTmg9l8gbneuM2D132ZruiON
 QxNcXSlseDl5TBIWRcXkrw0DlHvxAsw+OTqIY/EOV0+ih81PSQHtVxx1IfgKPY7P/U/v0M1GioU
 FG6UxNVff6odUQu7OLONzY0Twmc7tCgOiwm2BQDHnDLmSgsxHeeVbPmLKrxmQ0mg6QAfNLT1Hcu
 TEPOsKAm8CR5EO6d6ERkN1hYsrWGOqOR3dPU4fINpCdEkBbt+CouNYtPkdZE5SSL5KKYezyDaOb
 XPUA3ZpMxMKYaAD7FZEHxwj3kOf39SJxxZ/KMsSRn+T1WkXqR4hZ65wmcz5W4894H9poMX4T6sV
 aiBYe2hh5qgTWXw==
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
Changes in v8:
- Rebased on top of v6.17-rc1
- Collect Ivaylo's Tested-by
- Drop #define PMCR1_COUNT_A64_EL3_0_7
- Reword reason to not initialize PMUv3 remap in EL1
- Link to v7: https://lore.kernel.org/r/20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com

Changes in v7:
- Fix a W=1 compile warning in apple_pmu_get_event_idx() as appearently using GENMASK()
in a function prototype causes a warning in GCC.
- Link to v6: https://lore.kernel.org/r/20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com

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
 arch/arm64/include/asm/apple_m1_pmu.h          |   2 +
 drivers/perf/apple_m1_cpu_pmu.c                | 807 +++++++++++++++++++++++--
 12 files changed, 870 insertions(+), 35 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

