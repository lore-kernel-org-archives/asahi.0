Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283BF264A9F
	for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739543431; cv=none; b=RHcJelRjK15qorEeNS6bvaqP1M/vHCpUU3cHyODPPgAG5u2rBmK2kuQT0Mdlz+7HARRGE6/0zDffq6Ir/kXGWQ9y/G6Qp/G//NAWyYXsvuAQeXPLEiM/qUg+1kZpy5QD5kKihfeJcK+kmyXJLk8pP3Hy83v9LwhEO1H0z5pUzUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739543431; c=relaxed/simple;
	bh=gtQMWCY0nW0A18HtWxRoKoFtQ4tFPKmIdXgTS2ef1gY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nKUM8u1+ybyqe89weQ1AfUuq+QWaR6BCefUruSrb18nTpknVqjeo5dsgcWxY61pvJ9Eb+49NCJaPU132Ql/rbgXg8iBXMO81Vnpy2pkE2+FaLlch/WWso1+IVtWTmfU/MqOGqplg/SGtwsAdnJXe43aznGuNd0DSxMtOtMzSKJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXbDMmcE; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXbDMmcE"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fa4493a695so3181522a91.0
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 06:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543428; x=1740148228; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=35aTfl9eEGV17VrFB86CmV/usP3FQo76VFTBz22tACk=;
        b=ZXbDMmcE7U6M211rLH+Ao1Sowc8C6LWDgSzEY04GPVK90PY5XLZLEjOFlcGgXS+JXj
         5R083USvelYZ04MGoO0PaEFlcdRorYLxgi0YPan8XuHF2t+PxWbMmMk/0cMBWhCIDMow
         pEwQTnoM35qspL5uETfb+aqsIwb0p/SPyLBXheFhr3Vzk6AVvbhkPEV5kr5a4VYN6Kvg
         58w2FENmOVkk99jBul6bUyULYxBTB7CRpKUvYe9I6hku8e9AzqKTzH0zqbRh3I8GtmyH
         FllF2774Cgok/gNNdOoUF9jK3okw4LrnRW8zAxG0tGVQ1LKwbhvGjXRx+s2w2HoX18Na
         57Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543428; x=1740148228;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35aTfl9eEGV17VrFB86CmV/usP3FQo76VFTBz22tACk=;
        b=Z3El1Pcl8NpyreWTnXV4H+fdMqVB+l9I85TAROsPbYK51zF5GFEMT0fsEMEwA6dIfh
         8Rw0a6C9U+bUKtxh9a8YBaO7PCVbJXDBB8X5p3oedfXjtUonKAHEKIHw2p7lHSi0O0Jg
         5VDBLj83LVR0D8w3WuGEqNI8jAiom44EZCZO96LzY7VAef1HL0UeQlDvev+kKlmqXU3x
         lV1ke8AAzOVy+DmznClKkeeePYSMcC28/axbmJ4Zc6ffjW1Obsr6eiwFkq8vk64gviov
         yCHFe2AfZkKvF8X7ukrU3Gkj8RbTJusPtH3CqhohNTQ5HZ+eqtZHCSe39KWprcRErOeU
         fSqw==
X-Forwarded-Encrypted: i=1; AJvYcCXfbLlXH73hjkJTlB8S/1007VhJ9FegMJKSClLa1nCQoXNfjzY6a5W0+c1zUxno17cJXtJauQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXOu8NSbOlJgofDK5jv4nMftX9RFVALt5v1PenFfeovsok60T1
	IOjLr71xBscs9Tkbuzwep8dJ5GlBr31Y+BnoG6kG4kv4vWPmXnwqhiWCqA==
X-Gm-Gg: ASbGncvt9721ZlnpOgDLPfi4dmTQ7eZober7ktsGiAC46CM+yayMyXqE0lpwmQF+ceT
	vDbfX4N++guwC+mRcO32GsEVO7SD9BDzgZhJ2p0Lt0fHz2vXTsnKZKi9Q0RjFoxuUXewg91fs8I
	cJcuK4Hi3XhCwRfktEIljhRk3phLXpOkCw9xx+UBFD5PhZmYyPS1XUy8/yZuzdvg+bK74o1+wwm
	vCjiXiEiEP51CXA8itla4f6geWxbz+sgjhmxKnEo+64sRAZ3v4GvvSFg9iWZdaSXPcl/WnzvyHo
	csuLP4ixbrDaZNmCCg==
X-Google-Smtp-Source: AGHT+IGs2oJbWsBd2mmLA46RkL5aQhsZza/epKIJ6zzfwAjcLXEGBDxv7SMnURG3VhsbOrnsni1MWg==
X-Received: by 2002:a17:90b:3904:b0:2f9:cf97:56ac with SMTP id 98e67ed59e1d1-2fc0dbbcdbfmr13243789a91.0.1739543428566;
        Fri, 14 Feb 2025 06:30:28 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d545c8d1sm29490315ad.113.2025.02.14.06.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:30:28 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v4 00/11] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Fri, 14 Feb 2025 22:28:26 +0800
Message-Id: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAApTr2cC/3XM3QrCIBjG8VsZHmdM3625jrqP6MDp6ybsQ7SkG
 Lv33CBYQYfPA7//TAJ6i4Gcs5l4jDbYaUyjOGREdXJskVqdNuE5L3POGJXO9UiVGx60lKUELaE
 uBJAEnEdjn1vseku7s+E++dfWjmx9Pxm+z0RGc2qEqgyXilUFXNpB2v6opoGsmcj3FL4oT1RUD
 ZxYDRyF+KXwn0KiDVZGSI1aMLOny7K8AfzAuRoaAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2253; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=gtQMWCY0nW0A18HtWxRoKoFtQ4tFPKmIdXgTS2ef1gY=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnr1N7RBkPZAp85QlcDJZT0ti1VtbqLJHg+lrbB
 gcL1iCD6yyJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ69TewAKCRABygi3psUI
 JHZaD/4ydiNHvX1RevtAsKyPrnxMj4JKddZn5+JxVXazvY3+KP9r8pJOqofBxsasQb7jSUqyRRY
 MrC784SMe8P123v4vCmDG5/ODIBVWrXZdAq+08Pu0luK6K8FJF8bBLItkkeGSTjyS1e5ifGdGvX
 /PHxGeTI4/temzJKL9GcnxE7f4vAf9qMDqglc8vuDoX4I6zHb2KnbbcHkrnNXwNkSB/wHO4l95d
 Ly5ltUSUXNusvz/EmijnAZWFq3O9XiVd72hvGMHhFjNPxtIsbMPOOY4jiWHmrAPWQTgaK/1dJLL
 4/W3fBB8EgAMEcWFJrB6cFEn8fsuCaWZJcIHQgD6UlInDmV2xn0tMbVpvCPH9rdpXDsMwwdoEZ7
 IU8BV48qsuI+YHwATC8UGwxJd6GOI3bKGMIyqXEvKCH4wm+vapFJZV43cYmxoJW1HqmzqgEcrBr
 hLEBAu3v39zQS7JLx3XZv1Vf6ikmO9d1neUJFN0XJjItRx2OMGM8W1madyswXX34dWtQBenkHh4
 zHyYtkM+DWO9MMhAKjHItA9UZrmA8HfiF5r+lQcZ8q5PiEE43dXOc0ydKb9zR8fPJ86r2iRBB5t
 aSV11KZKbnHBqhsuN43t0j3L4t31QzdrMs0FZiii9nXLZqyO8+Ac/ggcKKmntMI1QAOBU8TPJA8
 LndGEHDir7iZk/A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

This series adds support for the CPU PMU in the older Apple A7-A11, T2
SoCs. These PMUs may have a different event layout, less counters, or
deliver their interrupts via IRQ instead of a FIQ. Since some of those
older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
be enabled by the driver where applicable.

Patch 1 adds the DT bindings.
Patch 2-6 prepares the driver to allow adding support for those 
older SoCs.
Patch 7-11 adds support for the older SoCs.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
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
Nick Chan (11):
      dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU compatibles
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

 Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
 arch/arm64/include/asm/apple_m1_pmu.h          |   3 +
 drivers/perf/apple_m1_cpu_pmu.c                | 801 ++++++++++++++++++++++++-
 3 files changed, 777 insertions(+), 33 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

