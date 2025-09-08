Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8AA2F9C38
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325668; cv=none; b=CLW4WOk+B5PdmXVHgqRFLx7uYWJUonI6NDncFDb8PyZUg/8bJz383yq5oV/rw3njGqY7R2ZHoj8Uz8STZhXz7eIo3hJNBsFs4NXedRnmeLbPmHiswuNslzClW3obKsg5bZ8u+sThg8Spt4H5esdCa9JDnFQqOwdObjWy0Dpf+u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325668; c=relaxed/simple;
	bh=C6Dad8JPpdCuqjz4s5GhSEa3XOS5lpXoC8lCTSueqRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OFX6Qc+FriRTHHCo87GC6OPMmYEOjvatJpfDq7BcS+dBNY6jtb7YiTjYzHs2yUNqZ3ngJc1fp0ifaJm9JOOxFpDjRtqpuEwNeaACYNW/xEJL/Mm1nGhzindHOZbN/4NhLiX9vhwRne/38AEA2ULzG50hPnjCoT7uTgK8oxfYnlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mur77dCy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mur77dCy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24b164146baso26831725ad.2
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 03:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325666; x=1757930466; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLtZQAdEAm9Qpl1KbOMuUjIonMp2MqyrH/XDjYnJ7DA=;
        b=mur77dCy/IZcn/uh93fX8cmJG+sH7NkCNtJeLvAkLg4pbG2lkkx3cbp0a3+J32G6x2
         V2+frGdeebEkKDGrDPZkzTHqFx+VmSJdVCfZyYgoJAqaZh/NhZjxeqcQD0JJIUX+8t0z
         0W8LxhtnIAZ/HFNYE54N/CKvfyETfOpef+N8+hu8ccjRuRq/vQ1WcAVbNpI41OnesJRG
         /xwA89E0j/5U80vZisfElP4mvmm21yXpSxKl3vslOEyXaDvS3PVX8dKEDs0yD5wY2aCu
         NTbxViEblSiOGlGLVfRcpsG8R3crRv2J6UHK/9Vkmg5SKa7srUupwudpi4/Xv6hr5sTw
         bbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325666; x=1757930466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLtZQAdEAm9Qpl1KbOMuUjIonMp2MqyrH/XDjYnJ7DA=;
        b=b5sNJjl1tg8kPo9zurSe1GvYS9/pCNIDW7m+aotF8rWssV4AwWO2INEHzLUGkz4tsV
         y1eHgR+jRI3fZW0XcRkbCzEkk2oyBaGj+SExOzfxfbiQiP44AVfxPPdCNaEZiLPKJgFq
         kNYIq0BowpcXf8h0U4Pe5Er9e4o+lmO/k/9GtGz2dcoIYhj71SIzTMRqaKYPFfHH5cdJ
         rmGxE6u8va34pTIYZsX38ydd28c0AHTlWw7YejoOgtTmymx7clQZfpEqSqSzzZdrj9E3
         1AP4QKCEMwgQOcRI496NyvLa+ujIGBajOhA/T64tigWqx5pvyJgWsrrqa6R5lvFCuuwK
         zhiA==
X-Forwarded-Encrypted: i=1; AJvYcCUIdCwnXUkPt6OYnA4dI1Jtbp2gjWCNJ2nKG748qzaR8zTpaPcGPIunbHS9vDBclt0ANdRgfg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6slu9TUdrWSQKw79VjuedX7VrM3IdyD7nEeeR5wXVkvC1pX9Q
	5HtdYL2VG3YMK9dgspwUNAbW9Y1C2udnOpCNtPgfGfid1k9WNY82gh1n
X-Gm-Gg: ASbGncsRaU43KuNzMs7z7sIVoH4EzTG3gmPrDXytk4KS0TbVIDSIZ8ppBX4V+TwXgwP
	achuJtSdeNaAaxHB9H6EvAIGRz1w6awYAahyloN9wEWcYqBnR1jbXyllXa3gdfPHZrhGASpFd8i
	LQm1XsXb5kkHOCxqGll+iQyPPy2e21EEHgjI2UDpHMFFrcLZj4xwE8mITqENGaB4SIkmjbLKktp
	dlnQeLH6mfx3c56GpLwNKg0sjze4LGvUtogoq4MWqXaWu9PMwBB4YhGNZhPU4pckodYS2VNWZ3O
	wSZ4I2WJJcdMVYx/Dztyz+SjGbkKFdd4AeetRHdi0uHAdoH4wiAEvHLrUHxF4YcuGqledSXSnAa
	y6oXaE3EG9ATNiluNQX86xhkeEjxw6WdjK+S80w==
X-Google-Smtp-Source: AGHT+IGWWHiKtpsu2QdAXRL82r5j04D9+oNux4leyEfdfdI4Mn5W+IrDB1mcVdqQVYqmtjY+ExOHSQ==
X-Received: by 2002:a17:903:234a:b0:24b:e55:34b with SMTP id d9443c01a7336-251722922c1mr123807425ad.31.1757325665919;
        Mon, 08 Sep 2025 03:01:05 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:01:05 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:29 +0800
Subject: [PATCH RESEND v8 05/21] drivers/perf: apple_m1: Support
 configuring counters for 32-bit EL0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-5-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=C6Dad8JPpdCuqjz4s5GhSEa3XOS5lpXoC8lCTSueqRM=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlD3N+SiZMRkNdtDE0OP5I9wS4J2cex7dpSE
 Foy/InTsRKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pQwAKCRABygi3psUI
 JCWjD/wKCDBrxnc0BnXSw+ySFzk06gEQT9Hag4HuvuMWKisRlL5pPvn9ri0BwkHcfdJ5TlgE2GU
 MFmEaXtrAXUNG8jL3DDiyBpeZWjLiQZo7G5ckwlKp7S6WDdPhzwFlb5TOsHjg8VUWIcf9wJUm6S
 7wwzd23QfpnMP7k7xvALkJ4klG4koXG7ANuGbnSav7Y3cYEF/MgPaTUm4QyZt9pk0S4JZnZkN3d
 x+8UrV/pvBaSa7osMjj1RTU9ZCiQeGrlmfBo94vzdLy0i4oKzEb8RbkqXObHRaU8jc/9wR9a+YD
 y0SIRETKPpwYOxgkDBvhouVh2PSdEdO8DOEMsj7CNCdrdHmKVrzCDPNiAh8rsuZr9Oy/FcYBHDW
 3KQ70JA0oB9I4xFyNBLviFDzWpHAgYqoo5DWGICYAXBRTsx+uGIP+GwKt/PfTrz7qPAhhkRREvr
 lYvPajB2umqznZFQZY8R1bGCnJEyO1qf0JAmj3zOhY/536/hZFcKZfuUvIlQvtBt42g5pExCIB/
 nEMdo5Jbd3O6KU03jndXs5JNcJMKVRaZz2embvJlhy7ksrmAbb3R7MNKnLwAchDndToqG39uxjv
 zQbZ7WCDnPuMTJFCmmoIZ35OhcLCLNBtRcw/T9YbsCXG5QfVcyn8KAhmau/+NxwegBZPke0tG+n
 Ko3+GvN1XAO8cZg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add support for configuring counters for 32-bit EL0 to allow adding support
for implementations with 32-bit EL0.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/include/asm/apple_m1_pmu.h | 2 ++
 drivers/perf/apple_m1_cpu_pmu.c       | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/include/asm/apple_m1_pmu.h b/arch/arm64/include/asm/apple_m1_pmu.h
index 02e05d05851f739b985bf416f1aa3baeafd691dc..8a667e7f07a517419c22a4f930947347be8546f7 100644
--- a/arch/arm64/include/asm/apple_m1_pmu.h
+++ b/arch/arm64/include/asm/apple_m1_pmu.h
@@ -38,8 +38,10 @@
 
 #define SYS_IMP_APL_PMCR1_EL1	sys_reg(3, 1, 15, 1, 0)
 #define SYS_IMP_APL_PMCR1_EL12	sys_reg(3, 1, 15, 7, 2)
+#define PMCR1_COUNT_A32_EL0_0_7	GENMASK(7, 0)
 #define PMCR1_COUNT_A64_EL0_0_7	GENMASK(15, 8)
 #define PMCR1_COUNT_A64_EL1_0_7	GENMASK(23, 16)
+#define PMCR1_COUNT_A32_EL0_8_9	GENMASK(33, 32)
 #define PMCR1_COUNT_A64_EL0_8_9	GENMASK(41, 40)
 #define PMCR1_COUNT_A64_EL1_8_9	GENMASK(49, 48)
 
diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index b5fe04ef186f04b4af32524fe433afb79979b791..fb2759069fe9e47146f0342fa46e40f3ab836926 100644
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
2.51.0

