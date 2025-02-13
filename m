Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B47A281353
	for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739457385; cv=none; b=ZolaxakJzR0J6BndpNLEN1Pa+7yBAIvDLnTc2KTTSKTmxW8i3Z7BV4Uu8qaRWp+s/iUq4pjx6pIiL8BMLV8jlnPq7mjpj5MOynnGKtCTZ4jhielOCf20LX3HkE3vV6pjtiYqBSuQhN88JA008RjxrbXwvvMXBhfXLsjwzTCO20M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739457385; c=relaxed/simple;
	bh=HlJsqhb8XnHHNzy8AdqFixPhoif08uRtRpp/JRim2Eo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cv1dgR7coiO68F2CX49B+s5Mq5YDXQnroOFhg98UPwC+NQOVva4VfgTUktHsh0y+sE4T9z3PEjADjwSaM9pWNY9mDDhtntC7Fabljm4GBoerAZaO224BFe7vQr7LJzv+KP7a1NoI+y7bqo5HYMRmTNYPGB+VGdFcZ/i+7dvHOlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frIQEGa/; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frIQEGa/"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2fa40c0bab2so1888864a91.0
        for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 06:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739457383; x=1740062183; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7s1AnEsbDOxMifWlKKO96YvdNulNwpNMwNrlUq5WAgw=;
        b=frIQEGa/0ndrubK+yNiH8/doD03W5pfDZO6ROu7E3ucGn24vV3mjojJTMI27w3x202
         2DksLs4DI0+K9T+nq+YIaMTH6VXPpZtL/TROYJwpdzrXE+ByL53pAP3n+UI0MS7AjzBR
         0j/vEaC4Zk7YIjcTVHI3kL+B9LRVMKbhsk4Kpx6KiGA5d9o3z+DWQHzxIpmP5jRRBx2d
         eeY6f5N4T3esM621vBJNRJtMPPECeeWgg9Dt5JOg3KleA5eoNURXZ/ulR4Tal9bU0mJ1
         eEXs/4bkVBVnfOI9kKp9B2OJhGyNMqbRaQLGoIYLbMSQHbhjkJHZGy/TO1reKNAvHOdM
         Uf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457383; x=1740062183;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7s1AnEsbDOxMifWlKKO96YvdNulNwpNMwNrlUq5WAgw=;
        b=sHzXIBzV3IqSHvirSRYL6j5Wu9n6HlNnkKEglQL2HegiqcHOMQivFXYy+jYfzJIPas
         Jv3bQrzarzJseLjE7cdv/PegtBbrLUmGl+nvp1wtbHznZlhE55eYMD0bokxkBlyw/PKL
         89Q/HZhKj0R5xfRk5yE58Xiqud/js5DtNFMl025v9Bd6qOFfo9m9pEb8TPfBdTTRQUOb
         09AZ4yKC40jNPLE+KaFONek9GdWXevzQtCMw7RBEgvDO00bK+yVe58SJsiyq/Z076b8g
         pLLA2VUOoOUPtpBWxEWkGDe6dy94pChs6oii7xdSPlZPpvZTRyuABpEWrlwp25sRcfmo
         DVcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwJuwJ0hXWBWK1P+EzNDZRYypEmmIUas1jjpuCDfMt8pT6tSXHBYEChuGOZCPWELyVpMi3jA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnY8CqkTFto/mrumJ5rshY54b9go0Pya/uHcLtZx8BCaVj2L/a
	ZQRGoD75lGkuyAUEBMWQU+Ma+DeWOFYX4HvpJJlvPJ8g9zM7DDWo
X-Gm-Gg: ASbGncueqTafyZULiaVw5jagIDKlRGR+wRQb6Xrgku/0OZAU7N8TQX5AWW7UKFbP1NY
	9DVMRZ9aWy2aFlBfYhhSpOyqDOPXB4QQxXsbdixBAVhEsHt5DH0Pi5KKhSzF2+m+QULXZOk5Fkf
	37Xflf7Hq9XqVbjzFWwpSQa12sLk1Osg6oUHOtY8ScKRAPC71smD3wjhX0GPI5Dymbesq4t60km
	Po62aWu0I871Q3eCt+v+IOT7Vn4u9nSKITuMRwnIkYwmeBceHn4k6N8ELz7r80Pq/iWUQ25Jc1b
	Qyscc1Xq2faax4pkMQ==
X-Google-Smtp-Source: AGHT+IFhfs9TjAcjn/ErTnxMN1WJfk7JOQCk0pFIocG3OaK+NCISwQFpuudm6tJWQ1iLr3j32Tlxow==
X-Received: by 2002:a17:90b:2c8e:b0:2ea:712d:9a82 with SMTP id 98e67ed59e1d1-2fbf5c71357mr11037562a91.29.1739457383189;
        Thu, 13 Feb 2025 06:36:23 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b5b4sm3655165a91.30.2025.02.13.06.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:36:22 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 00/10] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Thu, 13 Feb 2025 22:36:02 +0800
Message-Id: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFIDrmcC/1XMywrCMBCF4VcpWRtpZlobXfke4mJM03agl5BoU
 Erf3bQg1OU58H+zCNazDeKSzcLbyIGnMQ08ZMJ0NLZWcp22gBzKHJSS5FxvpXHDS5ZUEtaE50K
 jSIHztuH3ht3uaXccnpP/bHZU6/tjYM9EJXPZaFM1QEZVBV7bgbg/mmkQKxNhn+JfCinV1QNP6
 oxgtd6ny7J8AfHpc4DfAAAA
X-Change-ID: 20250211-apple-cpmu-5a5a3da39483
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1988; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=HlJsqhb8XnHHNzy8AdqFixPhoif08uRtRpp/JRim2Eo=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrgNiM5TkmibLzic5zEE81YsjeEvk1L/dOVFUD
 dU7mRTs/A2JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ64DYgAKCRABygi3psUI
 JKjfD/9mscaarB494OgyW4uYq1QJXorP6V5eRfYcimmfTN9369PcFCxeFReuiEaPK98qUT+2YF/
 CBI/e3iAMHFZI3YcOgVE7ZNjBuYvLxxaqFPqhxYQRcJPG6MZZnZFDuT3tdL62Ue4NEGdDYeShaC
 Er7IK91opJjC6qqaNrprt2d2GkuStvOK9TbZLJh+/OCVJSXzp+TsSzLurHBWHm/Bo4lpPf5RVhJ
 oqXinanCkSZbovdZUJlPb+q6bpge/+kNpLSsc3/Zl2tfnz8zNXpr8MpPj8MRKYrwITwRKFnvDSp
 uFNecTEscCTbURrjoFq34VMUYACEheQlq2v4AkOTA5jLpMWp3zmcayTEKsQuY98vBAvcoGeixiP
 dhxsIKSMTSmEKPwNssoRtrdKMJCGKVSNlZP46Uxp3A18p6W0VOvQ7IMhvQBZG/B1px6CcXxD/di
 rmCB3ispE2rueghdb1CgBCIK8UVdXYY6HCtFoUtKQBs+o6BXPBMMr2sPLIyeKQ49hs8fj9vH+FF
 DsAn8Sqdm6Uyj0aUIxXA4eoiuOuc3C16QyvsL6IG427z/oEyGqEr4z/K10gkY5ZtWHKjfm1wTjX
 3M/d+NQZ8VCscIuB52fHn2zrHmsx3o9RdOLquraPTzyiKMto9DQiU2D7HV02uq2wKe6INiUl3vu
 hC1DzYdr7M/KW5A==
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
Changes in v3:
- Configure PMC8 and PMC9 for 32-bit EL0
- Remove redundant _common suffix from shared functions
- Link to v2: https://lore.kernel.org/r/20250213-apple-cpmu-v2-0-87b361932e88@gmail.com

Changes in v2:
- Remove unused flags parameter from apple_pmu_init_common()
- Link to v1: https://lore.kernel.org/r/20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com

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
 arch/arm64/include/asm/apple_m1_pmu.h          |   3 +
 drivers/perf/apple_m1_cpu_pmu.c                | 779 ++++++++++++++++++++++++-
 3 files changed, 756 insertions(+), 32 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

