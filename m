Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC82027FD68
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258160; cv=none; b=kOflMxnv8dMN5MC2Hh0m/2E9xsqtAycYvwn8/W+/1JoF2SPVBDn6oAsSm4VhDmthwv+8Mqeh2EhK9kQ/56ehHj8djUK4U1VEd71rFUwp3FPUR3d3vykTahlYaR70Bbl+lSCijqJSeDQWGN2FgxYDTuv1STHWh/2kiLqJmyTIOSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258160; c=relaxed/simple;
	bh=EQFY3VpkRGJAmRC+3usD9WjCbbVU82Myoged0+CY6HY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mu/6KZpZvxuLibobq75D+ofMj8ssOKee3Jb3RyiO+w232aJg0/y/KDK5fH5t/t+wU/OOkqd0f0HrCKoBQyTuU1g5unvbpL7aKl/4yPRFCLAapDh5NwhiEo/1L/NFHsGFjSiSqheMzhEoTAln5WZWGTegM+v7421eEkSPIuhz+mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWFma+uw; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWFma+uw"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso11690531b3a.3
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258157; x=1767862957; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hihZBSA6ypcKPzQIvhGDpg48Y7yieDYcaYuDOCtFxfc=;
        b=iWFma+uw9gMSHw8PqNKiyjMzw4uGgpSqhmnhNJZYW8rSA7BZyc0UPHAytkcofWhPZ3
         4gtfLnszSe3fWNE/cyJnq73Mv6sh3yyELy9bm914I+AqiLbS95D7BYLsUbw3ugHJyxsN
         il4MIwPfiRQV/UXavvCUzc5tNrc8RUFOY0Vsae76yH3MjB/eXT6wnLAxt1o7iTq8iXXD
         TLTq6+h1kcc3yasRO5zlp4thiJrk5VhRo83HJpnFUjXqOuVf278+7aj7Ltu7587kRgCL
         cAIzlv25bG35vXktNea/Wm4lKe4EznmV4wLLel5X672Ma1l13gRqmmpXa0qlqmwYdlXQ
         OnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258157; x=1767862957;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hihZBSA6ypcKPzQIvhGDpg48Y7yieDYcaYuDOCtFxfc=;
        b=naswb9jtlS7TalaNAAkk4UOh+mjJEADINyXNHfBDDf8PAcQg3cFPXTrNpoNo6/CeJp
         PXwrXF1QafOyqGNOlG7SfZrV/nYQMI/rqRl+ctt/SGfvWNqyWf0FXHU38KWOvw8DP+qj
         AbKO4zyLXFN+EIXaKVv2nOh9BMtO7Gezjfn+cRRyd0nJnQeMltmT8a9M8pkzX4pr28rF
         3pLXf4fEEdV8iUL7Tju5xEm3G088DcF++WTKKvvjW1G3pZqwNREI3CzBUX7h6z8Ts1on
         Q/bAC0zQud938OH6/OaoQeFeMI7pzP9f4SlP+RV4sSnLm7kH9ztvlp8hJX9HPM/o+bvA
         /31g==
X-Forwarded-Encrypted: i=1; AJvYcCVj4Vyj5D6FP07mgKLij62zWK9bmv/l9H1mv9EVlGm2rAcaN8WFds1oTuWzlZhJrZ1kubbS3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZeexsk5LyflJMMWEzlp1PUHcstAoy5ywJCGwsaqWCiikhgLrU
	hmmoICKFFr3qMUWdh3+CtjE9IJgeQx1rGWgvEX5DNgOzUXyEmx+WvqIJ
X-Gm-Gg: AY/fxX7rfql9Y69OaFGqCskjSqvmU+h1PfDMfk82pcrQtbz97fcWn22FRlqmtmlVm8I
	k0Wqr8HeXzEu7QVbdN9lZ0mwIjVcHkoi+yv2XKmN3I3DOQ1SLTfnMyJ+v9Z9qrPiwQy54s4pizl
	IiDtJyLVP04ViGPe97PDufoPp3aE84Ozt3/cTyO7r0Qlb+rHNKMoP/H1kN5xrM+tuRuzrFXDdCA
	nK4nRKyWHgOmtYFGPelT/Z2Ao2G9WVm5Bf2ech4FoPOWGRdKGbAG6owUCxgXqmiQ7d8cmYqCTR1
	kEOFUpnskvzOvm7y8uA3IMbwBvpY3PVb+ZAanhJ1gxpQLvDcbJRxsyemqNvMzIhtHz0EdnK7VBr
	kjtDVAI+f2rrtpT1Et+hm06DiyAtg6pcKCRdkqB1WjGzp2vaPX8JtxcEIJQ/ZZnSStgmPKVpEz5
	FJ5EqMsL281KO2
X-Google-Smtp-Source: AGHT+IGaOzY6wshAcbbeVkzC3Qr2Y9GtbIIPSO/l6MCiYeY7h9AAOipH+K9CNz+QNORa7BFGihwSWw==
X-Received: by 2002:a05:6a00:b902:b0:7b8:9d86:6d44 with SMTP id d2e1a72fcca58-7ff644012e2mr30833268b3a.9.1767258156940;
        Thu, 01 Jan 2026 01:02:36 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:02:36 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v10 00/21] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Thu, 01 Jan 2026 17:01:36 +0800
Message-Id: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPA3VmkC/3XR3WrDMAwF4Fcpvl6GJf+mV3uPsQtHlltD24RkC
 xul7z6nsDXO2KUOfAcJXcXEY+ZJ7HdXMfKcp9xfygDyaSfoGC4HbnIsgUCJRiJAE4bhxA0N54/
 GBBNUDKrVXokChpFT/ry3vb6V+Zin9378upfPsKQ/NbiumaGRTfLkEgYCp9XL4Rzy6Zn6s1hqZ
 lxTVVEs1LtOWWgVsvdbqv6nqtCOXfIhcvSQtlSvqa6oXhZOFCRrA9rxlpoVRV9RU2jLgJoieo5
 6S+2DaukqagsN7AkToqG/C7sHNSAr6pZbY8mps2RQbql/UF//ePaFkrGSu9hS0HZL218KCPWtb
 aE6cogdWxNl9dfb7fYNUba2qn0CAAA=
X-Change-ID: 20250211-apple-cpmu-5a5a3da39483
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5031; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=EQFY3VpkRGJAmRC+3usD9WjCbbVU82Myoged0+CY6HY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgDKe7KDF0MQ7xXnBNenpOX0XfR5VF7q+6wr
 B1bkRk3I4mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4AwAKCRABygi3psUI
 JJxQD/9ZOl2Lpn7EgE7JzPylfWJeOYnwx5opMAFwVgmFgdtoDeWwW17v48KMrfWxcJtVncwBHzX
 UmpwvnLyBO7v/+5gK/RVnES48YNgw0WtURWsUrFddKU/qDw6UnS8Oz+xkr1ra0tNFN2pB0TdkF+
 FqnsDx5Sej3oQ6I/Gw08urmNSS92o3+Oe7I9G/qhHUNrK3mSJ507iMFqFRCWyGx/OR1L0lBKQ9k
 MLzPIlTtgzV2h0tT0463MzrZgRtwUCv5bqsNG5ycPo6DTOntQ+MfxRXkufG28XDbPkza4KGQVhF
 7uq5eGKFh0x5zZIH/v23EgI/MpowpeiSBopKQ58tr8Q0grmR99E2J5zHqlro6G4RA38FhokG5W2
 Rtoei/rcwg6PV756cdTeumCXm9HXEtdOwupUJBT2aZ0qB7nr13gTnCZRRvjBoF1va0AvP3v3dmV
 qmWlFdtIegWoNnLfgK4d+yEAMZne/+miJO0+H4vAixZG9ErDl3HiogEjc9JHSi97ej2QUYpTv/7
 50CqRe03HpCcwtD7bBf04BaPbz5ht2u54EAUoZ2xI2QYQXsGCKRUAy67sbNS/Xy46ybi24YnWUu
 /OHGVhQdypJby7Dz+PK4mHIYRJ3dRjIHztVFESW5boTVRNsW2DnPGUuoovJ7AharLoCHIPXfTWh
 mdNeBUHo0XlxYew==
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

Happy new year 2026!

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v10:
- Modify apple_pmu_get_event_idx() to take the number of counters supported
  on the current PMU, which allows `perf record` to work correctly on A7-A9
  with 8 counters in the PMU.
- Rename the added counters to nr_counters in apple_pmu_init()
- Link to v9: https://lore.kernel.org/r/20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com

Changes in v9:
- Rebased on top of v6.19-rc1
- Removed non-existent "INST_A32" and "INST_T32" events from Apple A11
- Added "INST_A32" and "INST_T32" event affinities for A9 and A10
- Link to v8: https://lore.kernel.org/r/20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com

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
 drivers/perf/apple_m1_cpu_pmu.c                | 820 +++++++++++++++++++++++--
 12 files changed, 883 insertions(+), 35 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

