Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8D62AE9A
	for <asahi@lists.linux.dev>; Sat, 10 May 2025 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889891; cv=none; b=D8iHI/lvno3CQe/8q9lC2vx1z1SjcC+JRfPhDZ4mIonK5i8XTqiM+YD2Rm6mJvRQYqQYs5He80/YR5jHDlajkmv2w/fhh12MiZ4qQSF0f/npORL/fAmCh0SQlvpGidQ9C+vx/ALtJm9h42hLGcxmBno1ZQnU0wGV4Y1Oz9R4whA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889891; c=relaxed/simple;
	bh=IImZvUkpMAnwhvmBNPBZuUuP3+ZC7bdMT4Tj48zkB6M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IK/zC+5vTqt7QYRUwxW+7whbQDkdkIOtBwFSt9jF5uE/2NsDDU4CR3pFk2y2zSU68U7JjYgwlij1QXALJtxBbwoNiJ/RwXzMagJpDwMuN51hn9mhr4YM407THmynWmGeu14+c47Tefehauybf1hFNmH9+uSL3NTTudMZXCSYryk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmIMaWAf; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmIMaWAf"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7394945d37eso2770300b3a.3
        for <asahi@lists.linux.dev>; Sat, 10 May 2025 08:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889889; x=1747494689; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sR6qkQWtty2THn9HV/oPVYY8q0oy4myszmIk0XskAD4=;
        b=OmIMaWAfO8OhQmMglsc+uz1zePslgTA7Q4GyOyCyiHTjnSlMNFnRXjCGeMCY4jI/J8
         x0dsuCnPKoBjmRs6n9Dx/ghlcG4UxX3TAr1uE7DFa7Z6ZkHmR35BCsHWqpLNRF5zrRCP
         kntXbO95RZde0HWQ7XFn1kYvivIZ676cpN2xYCi4/1zbb3fchTRjcKdi9qK0sLJUP20/
         T0iJsTJT03k958JUlfHeff27DjeZRM9aR5PX2kuoOy+txNiTBCfoVkjLDqr5Jrvm2t2j
         L9r2cB+jftkEJ3oXRzcMj60P5TRg2gth3+rBebBa05GyHOJjhQzLcy+AI31Q7Ewv1+ya
         37fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889889; x=1747494689;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sR6qkQWtty2THn9HV/oPVYY8q0oy4myszmIk0XskAD4=;
        b=J54mgtiRa83e6KGq0RLKsRbyaznVMzreIdpXdIYnuJ3kMX+nK656pADqyrTUkGrzKM
         /w1CQ4jMQ8VPvjoE73CtPVoWJBezEqzRkhO6zKM0fA8VmMKjeW/tMsEK++4ZLgEY4wpw
         zOKWkkfzjSTlSV9reCuaBXgqVegxXrR0Ogytd3NgdTi3r1kgRlk+foASfFlqpVGoxP2S
         FHlzRHBd1KR6IFXg5iCZyHY+hBcPMwq3sB2KPVcFQ0ke4gQJ064cZtsG7TklkPdcIswg
         rIhGZuy1hpD+stQw+bJRGx1Ru/+NFScPKrlt0qP2iOmVIpk3iKyZo98+egjXfBbmhlNK
         jVkA==
X-Forwarded-Encrypted: i=1; AJvYcCWkmo+vyMFhOiTmPLTiYPrhnUg7XtD9TEjPqtkWYb5WRahM/tVZNuiDmvdwT57OkoK0PzC7hg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+bCtbzKpz8HegbYqvxbUrxJSTcKeHM9Aw05dmRr9ExMDlqNXq
	CNpTLQ0LpKwuTSHBZEcsUld/lzIOJlS8iU/N4Fq/zE7pJfl0rEcLVZMyJQ==
X-Gm-Gg: ASbGncvjG59x7P6RaJvuf81NPssNF7fHFv63hhR192m7AtaPXlMgL4Q5g4tbdaq9Mwc
	jSvVz4kp/UDzo8ywUcVopsS9g/9S0scACUgaN2BQdZpqVBAld8CVGusuV6As/RXoDY15FOOHEtf
	k1EuGEgxoNoxAFXyss4lPIEpYVByWfgf9ScsTW4lRbbBJS9svWq+6vqJp6sncbTp5yoBJqf/zCP
	AlmpukpFoPC/cWLNSJnMklO7U836lmtGJM1u6v+AFSp5okYT4w+tx3Y8d/7xXUqYrAYM1gMJnFk
	5MPiLEEqjCEgFO5rD02uWiJGGjiGplJ+b78VvYsf9xEB+rlUxJXIMw==
X-Google-Smtp-Source: AGHT+IFqdmSlPKPteFj6aFoaXv53VGI6hMJqHMy/+z2wasnrmqyzjdM63pzuW5ZpYok0awQTBpZ+xg==
X-Received: by 2002:a05:6a20:c6c8:b0:1f5:7873:304f with SMTP id adf61e73a8af0-215abcb169cmr11920239637.37.1746889888698;
        Sat, 10 May 2025 08:11:28 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:11:28 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Sat, 10 May 2025 23:10:41 +0800
Message-Id: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHFsH2gC/3XOQWrDMBCF4asErasijSRr3FXvEbqYSKNEEMfGb
 k1K8N0rB0otQ5dv4PuZh5h4zDyJt8NDjDznKfe3MvzLQYQL3c4scyxbgAKnQGtJw3BlGYbuSzp
 yZCKZ1qIRBQwjp3x/xo4fZV/y9NmP38/2rNfrbwa2mVlLJRMGn4CC9ta8nzvK19fQd2LNzLClp
 qJQKPqTaXRrgBH31PxPTaEn9gkpckSd9tRuqa2oXR9OgRRbp63nPXUbClhRV2jLGmyIgBztnjZ
 /1Cpf0aZQYgyQAFyoH16W5QdDpCuiywEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4111; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=IImZvUkpMAnwhvmBNPBZuUuP3+ZC7bdMT4Tj48zkB6M=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yHw4CuFivJusE7hlGbbgqG9szRqZ0CujA+7
 0Cf7L4U69mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9shwAKCRABygi3psUI
 JPFFEACjXZ1zkTpXhVHIBbRagB67W1YYYd1s69NMFjN6J086u6h0kJPWk9bwFUXgVaemwUZMZBV
 AEcyPcPPaSI0suoozIWe4JQb2Gg/dp/m+/T2XApZGAZRiilFi+QNnKOO0Sobgkt6iXvrRZ3KRXp
 u9FXdsXxxoabckir6nvpH72iE9f3W0V0Z9Hn5wdmVExSPtq0eudWTMEtH3VkncU/4kD96uK2hrn
 hAe+BpWQQZt+AOiqa6fRgtcuWWLt+sYGQgidT2zXWXFiYmZ+gPGH2SqqqEbk1vpm+QsrGXsmL/J
 MGjgXR4ziP4qsoW5Ma3cdKfrpP21hcmqIDh1cKCCsX6ZlJtpwhjrTjKu6s/+o4FrWdRBirggO3A
 whENu/e8sEX/EcwzwYamt0bNQuweGptXfB4nAope7nVo0O7NrtYDoVSotGgxMYnyK1dzGkUPDNc
 N4I6veIVcn+MsiERtigpbeBLW33lmJvcEqcQ3NQXuO7j3al91tbABzQ2LC8KMYUgKoeYj+4bqiN
 HKkOk0fQonVU5JVruGDE4BlJQNHWlfPen+44A2ioNGQPJ4B2lB5f7rK/I2iOM6PLf6Tn49CHs0E
 g4q9XSgp5Cs4gc7Uz7+wkflr+ceIg2xQLFKZwp2Vvzy7Mc3L2gULSGdYjxRNqXV1X7iJsBtIpxO
 Vpaaq8ZLrM/OYFA==
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
 arch/arm64/include/asm/apple_m1_pmu.h          |   3 +
 drivers/perf/apple_m1_cpu_pmu.c                | 807 +++++++++++++++++++++++--
 12 files changed, 871 insertions(+), 35 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

