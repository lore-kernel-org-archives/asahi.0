Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1669820298E
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 01:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037552; cv=none; b=ortW5K7xmmZFCjzBfckHlSarV+T8FW5bVzoJte/59SZ0p14byQBt7mO9ObXRanw92ybpbaK9ClcAvzFA89om8mcIupjr0eiz0qMoej8oWbb97VPwgSXYDyARWLA62V62pm+Oj/iHDntUd3fvhys++jBs2ihhY6AShhUzdLSYh18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037552; c=relaxed/simple;
	bh=4vsiGjbxOOsY3kUJRZG60u58GR8XjzbCD4n5XW1wFKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lmNNuh9eXCWd8unyHK1DXqj/xY4mpvTHlkDg7rmLZuKJUR622SWg+M43wx43qmbBxTw5kZ+q1FmMnVJyBBGctrlNGDAPz0fZy3wEn6nE4eZhz1N4OWwjNBFEn04XFTu8yyuuPfqKEHljAJR8bprTIxcM3Jd7Bx88d/U/FSsS+n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tucbn4M1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tucbn4M1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234b9dfb842so35478795ad.1
        for <asahi@lists.linux.dev>; Sun, 15 Jun 2025 18:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037550; x=1750642350; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYLyecdN8PG1dIKA7P3TjdSo4FSHEY1UF26fpLNtgEE=;
        b=Tucbn4M1OeqU/cCPcGB783L8m4+CSVLC33wYcvepjvOu8l3pjDC/U8lmE6SSzvX+zl
         bVMsvEQqUHchYb2BIVUP9IxKUwFqCaqA5c83Htj6Hlt4oPlJ48zjxp8aNnhWAhqtr3jC
         7VISg89gsoNH8Lyjr2ceA3JTLq3e4/aXcHfq5uv5j0ZXKfGe9NerF6dCGA5xvOWf8MLU
         GrGc4tsEIBDb9oeimTHxa7eUmXQn9nkOo2imFOtK1IszGbl1vEQ3RWsvtZTkP/7S4OF4
         yFMww02IfX7rmrgZw1sgYTVgfVCdPADcuGU+NeaJ/HJZLq0VbiLHdizOcudnO5gxBLHf
         fA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037550; x=1750642350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYLyecdN8PG1dIKA7P3TjdSo4FSHEY1UF26fpLNtgEE=;
        b=oyzm+nyYX7qkPrwJOzHzU4WqkKCvdPBvCq9nygNiIaeUwOV7kqza/nRGLWGTc/q1ld
         8nNJfMbNO9DRVfSqNwRvcmKcfItBLL5i0JFcqKOkev9hf7q7n8BOJ5D04S5S+itN+QZX
         nF20zjuPOrk41VZgolY2JUSDS00cN4ASU9SXUTdmgaMRUKw0y7pe6kzHsI7agvmvmU/E
         UFM1hYtzt4mvK8BdUSFHdTUBCV2ncRWvc4Nky9Gkd/EXXObj+hLvLQrGSE1S5qzw+Bl5
         a0TTrwe3HWrbo0RMDiKkdoQsFvrmHujMD+gfXyRfGRy+EZPUVQkUf+nSz4JH4loAjfwO
         uSMg==
X-Forwarded-Encrypted: i=1; AJvYcCU9zUVqR6UVBqj3hkUSf5s75KbTFpbdswt9pERUfMhnXkObrQpxQweYfBO/Wkc612fio1Wb/w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+kRiC+l4LXgQfUnxiMl+4c0FjYDiATFT2KTAv2887zYRbcV8l
	dcnScw4nyIxyOWGlvZ2Q5ojpf4jof3IiVQ0PjI0l4APgSxmanlwoj92U
X-Gm-Gg: ASbGncu+UVoX/zD4edvGPP6jVgI5PBp3ihCmj+HV9guAX5ThiiXkRJjlHVK1gIR6iAP
	B7KKzyaiQOw3PauqHAz6IcGM4hZn/63Z2quSgLQqlilngXUSatT0aV/aRTFJqyZ69mDmH/m4/Lb
	bQr6aiLxGKYP/v033e+aQRkEnjVal72WVqWouFK6dPk46J9LB2fpynTWJXkC0aYylF8iowMFDgk
	92dFtevijk2PbBLPDq+oBdBTNGpYeSAmkN0m4HroFN+MKaPxxcKX1XuZk20TWq5W2OYSEYR3wla
	2gblYfm20zN9kcRpwEMGbBV9XE0jK0P8ZwXTrpmAlpOkOtdUN9LDA00gjDuX2PK83qV1hvcVBAz
	yobw=
X-Google-Smtp-Source: AGHT+IGJJ404MdhopvAsklaW2cdxTGKo+Ijhaz9bo4QVbFD74MouB0Uh+CgOTxR63fmMk/rMOpxDPQ==
X-Received: by 2002:a17:903:40d2:b0:234:b41e:378f with SMTP id d9443c01a7336-2366b32ce2emr119407695ad.15.1750037550343;
        Sun, 15 Jun 2025 18:32:30 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:30 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:31:54 +0800
Subject: [PATCH RESEND v7 05/21] drivers/perf: apple_m1: Support
 configuring counters for 32-bit EL0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-5-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=4vsiGjbxOOsY3kUJRZG60u58GR8XjzbCD4n5XW1wFKA=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QXpl0G9A8y6Clm896pAqkSYfH2CNDTrdpBa
 6NDMkfcay+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90FwAKCRABygi3psUI
 JFJQD/9lj2VhihWbCDTG7QEYwecH/qMCAlVbYPTHDaCCsRIM/0V2cdwEPObj9l5MTiRZEBHn3XO
 8EzB0wArSxElfGNXA06UML/X48GClRu7iJ85hcHhuIx16Va8AmRiivOG2aerFJtJeEPWt2QSy8z
 9qZ89fT6D9reastcBEaUAK1fhzZShJFvC14d6oXF3+6vtv42eUNO6fuXa6kqkoJ2AnV7iZANrhw
 TwhduTT5F+LVZ+SRUtgeh8RDt3RY07TY/z9XskHku1dQ+1d4w/+3IqtyM1LpdoodMtTy8PB+bzw
 JjhluCWSaCEvRT+4YOXTaTEHLmZkwWeLbgvo198EVSeg1MGCjyWuf7WcbQ7Ml4f7eUvcEcpYNt8
 6QOLDFMNiYWNZUBjjneIkjovBVves5XZaJtorPv180klZaJtw1uANhAayh0ZvtZYB4alYHigNjs
 dhGl5mhUuUrIwt+TRsj1dxMXI4w/FunF1Cn2C3Hu93iqTVRMCOGQyDkgI3jL1BYQMaU/PFKvCsi
 Injkb/kfVNODwy8gAEs4Cas6gJxsTY4XPVrVQyLWO7WvDS90GkHuHRqIrF4P1xqr+LLrWaLVgIj
 zf2+nFLaEEcMLy1R4gIlpLEtrVEBUBNkYmhXVez8l5zL2nyeLLFMeJ994BsTfdtyW6ukC6SByjl
 cwB4rQU7i8OYMTw==
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
index 02e05d05851f739b985bf416f1aa3baeafd691dc..6e238043e0dc2360c4fd507dc6a0eb7e055d2d6f 100644
--- a/arch/arm64/include/asm/apple_m1_pmu.h
+++ b/arch/arm64/include/asm/apple_m1_pmu.h
@@ -38,8 +38,11 @@
 
 #define SYS_IMP_APL_PMCR1_EL1	sys_reg(3, 1, 15, 1, 0)
 #define SYS_IMP_APL_PMCR1_EL12	sys_reg(3, 1, 15, 7, 2)
+#define PMCR1_COUNT_A32_EL0_0_7	GENMASK(7, 0)
 #define PMCR1_COUNT_A64_EL0_0_7	GENMASK(15, 8)
 #define PMCR1_COUNT_A64_EL1_0_7	GENMASK(23, 16)
+#define PMCR1_COUNT_A64_EL3_0_7	GENMASK(31, 24)
+#define PMCR1_COUNT_A32_EL0_8_9	GENMASK(33, 32)
 #define PMCR1_COUNT_A64_EL0_8_9	GENMASK(41, 40)
 #define PMCR1_COUNT_A64_EL1_8_9	GENMASK(49, 48)
 
diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 35a34eca403384c4908c2bba2f8186ea854d63bf..6736909a7df672a08938a392d450dc9b5b7bce9e 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -348,10 +348,16 @@ static void __m1_pmu_configure_event_filter(unsigned int index, bool user,
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
2.49.0

