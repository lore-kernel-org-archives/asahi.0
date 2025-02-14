Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E25F266593
	for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739543444; cv=none; b=Nh1FRvJwoAfmyARA5M+FI+9XTq2rK/mHv+/nQpiSNndfqR4Xd3/sL8zJmQyWogv46SVaBD28UsUn8QPBBWhinmLV4Qo+C0ekRRxXWXGiK5b6e1Q+7Y4Kp7YtoSe4tZFpsLWBu29vrJTc4R4mYdKQEcu54Fvn4UhuY8EuRNHv31Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739543444; c=relaxed/simple;
	bh=JtntoT+/7KJ8q2fmzw/EEFzk/pZROlC/KV344Upuyvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nsYV+GFWdFx6JPaSKlYHPf1xylOMh1SlgVttW8bwtIuE1aDc9Qx5t8HwjQz5sWKCE0Lkl8AJqwu3UtB6dKhm503pRtYXR28DDzmLtR24+l9fe7+2XIZDM1V8XWlNYqt8pzP+DcdB8jCpQxt9BXj1Yuabq8VLzQ24XcJ1XIp2toU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiRa9F1d; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiRa9F1d"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220d601886fso27781575ad.1
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 06:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543441; x=1740148241; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbWzWCt8OHucPUBoPro0Zk6O9SHBNwoLoq7UIHpho+o=;
        b=BiRa9F1dlemofHs6sDh84RqUTLCZ+rn1lAUWyMWFwCPYW6pUAqvlUngKMD99V12/Wf
         hnL11cBQDIGA+Dpp4QlenCetJH5+23meTG522xN5VwtHfkNWUkgBt0/KWSj8b+d79vGw
         I9LdDM5EuY4N/QqmXQ217USN5cPCVudcHEF2LI9jBuSD5wSeImfMJanfkQ8IeQgLXqD+
         Gwv+yJ+R/0+UGxGVB2yQSq1j58NOVoj7Ukgx8bqNvgCAP0p9wO29VB2n6QCyKKMH8Wd5
         VVPiS99XIHnDB9ZGRp6XNhUtngLRshEOwCa2FlMYyBbKp2dOgWjnthos35OTXk7Ei9gd
         ND0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543441; x=1740148241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbWzWCt8OHucPUBoPro0Zk6O9SHBNwoLoq7UIHpho+o=;
        b=KxoFQbTU6YYcJCKrEmTw8hH3hya/atyiO/7ugDAN4cTkgOCqQcs0tMagTRXRDVy3F3
         VzgjnkJDK8ckSkkYvbYqxnRu+MsWBMgWXwKhw51fCsinqpThKSpy6QdGZBC85h4EIJJK
         rcjQmXDDddDO7uGXNb9hyUDAFxJt/Gyo2lRAaggll+9Q6rCU6CApC+MW87BEXkmGuk5d
         G13AilbWOMCQJoEApdhyTxeE/t9eiKUNuAym1p33elDW7GRkgDXTA/znnTBF4kITAJ/T
         kOlSfHaiZRc9B5wS0vQy1bdQsGbe539cGfD/4sFCl6LGnGP1mw3XyRVMpR6J/Z/vjpGD
         sqnw==
X-Forwarded-Encrypted: i=1; AJvYcCW9UJzqeteeTwyNfbCUKW5ED7nxZqyUPrlRCu6PeFDnKg7YheV7mwGSt4UrxTZuSe/ozyxCRw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4a9+x4eC1PNNFsbdf3cPbMhTONFX6S1s2Zp5TnBc3T4Qb1p2k
	Pm54cRGGQk2Kc+jEil95EQwQrMWPyy7jf68bZlJnogHDw/Wix6ob1iBk4Q==
X-Gm-Gg: ASbGnctfehfTA3ziKaOQad8xIotioKpLCbGGaVzFoozO/3p6/re8TLTdU97tU8NKJmb
	v00k1wWK8rnfP0PbrBouF2KfKzMMJ70XrzcoaOj/FrwW2/UruUgPET8RWdFx02NYqo9dgKxyRNj
	8OvJcix3fGhsbSsD3He1wNpUy978wNApuZYv8IR03Nlt5dJfOcVCzZtRQdTSdBa0x9sF4l1snAK
	r9XJbP18mzB1JxHLYC2U5esLOWq/hmev6rXP948rLFsm9BtkQro8Fg9lYm9+RdFJM4iwWFlw7a0
	mLg+C8dtwhWaHqaigg==
X-Google-Smtp-Source: AGHT+IHItG+fJEC1v2jw86RiUwqBiXRX/eR8U/klOPF6QDGyKbVKG1IeHvzHzNB21irjeh1NLw3AzQ==
X-Received: by 2002:a17:902:ecd2:b0:220:e04e:7213 with SMTP id d9443c01a7336-220e04e74a5mr92641655ad.25.1739543441461;
        Fri, 14 Feb 2025 06:30:41 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d545c8d1sm29490315ad.113.2025.02.14.06.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:30:40 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 14 Feb 2025 22:28:30 +0800
Subject: [PATCH v4 04/11] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-apple-cpmu-v4-4-ffca0e45147e@gmail.com>
References: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
In-Reply-To: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2104; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=JtntoT+/7KJ8q2fmzw/EEFzk/pZROlC/KV344Upuyvg=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnr1OAVGEnzQZGgBLLYROuakeok8cZ6GoDeANer
 886jpv7ZkmJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ69TgAAKCRABygi3psUI
 JNQrD/9f269MjZYrwrUDFvUQJBrF2mmUvB+bgJ2lDAEEgy0lfcigPi/R5ir83D7epKRHh1as4PO
 3fNnv7iguos1pG5k7ymSqV1wn45aTo1XwJwt23CmijRdhuZoytqDk9VoC7EcYF07Iqo12PaTbuh
 6to9jSyEgfsw32TzrO3eousDXWR8Sl2w4tx8ejVqwqBnLFcuzm/NEIwcAsPZjdU1nikKTMK+2GJ
 NXQ4lngoEJKdNnbi6kIdFos+BRDe/5T8iWq/juGbhxMWwfWeMzpBFFMybJrxiIDi4sZgQQyRFvU
 moSHV8rLeYaSwvYovYJsTDnZvqk78Ig5tCPnZ0fRkJHrg+3TtYdIvtSu5kygB17dWg8CHO32ZPW
 pyuIwcbTRShMMEcr4U5RKjbi7xchiiP8PLcdUZ3/F3iQe69QEkwGh9BOeMLOXVrU7GfAlvN9OT7
 e3HhlsfI3/h12xxUUX2Ws2AUBufWGAX312kaBzw75olaqaI31x6vaQGreCawbR32c1qqBK3e+xF
 pNCYzioKnd9Mv2SvsLc8xNFiIWNYN7d5fUOjnhT5oElfeY+aKcfRTpDqq071JkeqRPpIRDiMlpD
 FUsXRsY2iYVOJzcYH3b1E955q0IT1/RNf3HGaFBAfDmLzfMDMLe8PdGAvE4HSsEbtrx/yFTwFR+
 1PXCB7zP7CCaCyA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add support for configuring counters for 32-bit EL0 to allow adding support
for implementations with 32-bit EL0.

For documentation purposes, also add the bitmask for configuring counters
for 64-bit EL3.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/include/asm/apple_m1_pmu.h | 3 +++
 drivers/perf/apple_m1_cpu_pmu.c       | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/include/asm/apple_m1_pmu.h b/arch/arm64/include/asm/apple_m1_pmu.h
index 99483b19b99fca38483faad443ad4bcf4b85ef63..75be4b4c71f167a6874e22b38dc7c0bf30d25a47 100644
--- a/arch/arm64/include/asm/apple_m1_pmu.h
+++ b/arch/arm64/include/asm/apple_m1_pmu.h
@@ -37,8 +37,11 @@
 #define PMCR0_PMI_ENABLE_8_9	GENMASK(45, 44)
 
 #define SYS_IMP_APL_PMCR1_EL1	sys_reg(3, 1, 15, 1, 0)
+#define PMCR1_COUNT_A32_EL0_0_7	GENMASK(7, 0)
 #define PMCR1_COUNT_A64_EL0_0_7	GENMASK(15, 8)
 #define PMCR1_COUNT_A64_EL1_0_7	GENMASK(23, 16)
+#define PMCR1_COUNT_A64_EL3_0_7	GENMASK(31, 24)
+#define PMCR1_COUNT_A32_EL0_8_9	GENMASK(33, 32)
 #define PMCR1_COUNT_A64_EL0_8_9	GENMASK(41, 40)
 #define PMCR1_COUNT_A64_EL1_8_9	GENMASK(49, 48)
 
diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index bf397fd81230007dcf52888f148e3158dc02e29d..73ba9861a15ff931b5e388b6d809dedb140e2292 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -335,10 +335,16 @@ static void m1_pmu_configure_counter(unsigned int index, u8 event,
 	case 0 ... 7:
 		user_bit = BIT(get_bit_offset(index, PMCR1_COUNT_A64_EL0_0_7));
 		kernel_bit = BIT(get_bit_offset(index, PMCR1_COUNT_A64_EL1_0_7));
+
+		if (system_supports_32bit_el0())
+			user_bit |= BIT(get_bit_offset(index, PMCR1_COUNT_A32_EL0_0_7));
 		break;
 	case 8 ... 9:
 		user_bit = BIT(get_bit_offset(index - 8, PMCR1_COUNT_A64_EL0_8_9));
 		kernel_bit = BIT(get_bit_offset(index - 8, PMCR1_COUNT_A64_EL1_8_9));
+
+		if (system_supports_32bit_el0())
+			user_bit |= BIT(get_bit_offset(index - 8, PMCR1_COUNT_A32_EL0_8_9));
 		break;
 	default:
 		BUG();

-- 
2.48.1

