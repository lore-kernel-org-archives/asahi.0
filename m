Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B04024166A
	for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739457398; cv=none; b=ZsDiTlEErB+VikPaMmW+Cep4e9PJiD8DizQdhh8fTVeV/M/fANR7/wpoEw47pVU9K3aXGzw2Zj3i+KI8V+gwpOEDl8PLsdLWqdvFdL3XQ/m8O/3KFUYUhH2qrb3dKoJVsszE6nrCTaJC/MJ2FC758bu1y44j+nhuS4NX192kZq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739457398; c=relaxed/simple;
	bh=JtntoT+/7KJ8q2fmzw/EEFzk/pZROlC/KV344Upuyvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dq+OyQ4jH/HGDUyuJeBcPwbknc7YUP13zTNR3FcVHAocGiGTOH8u5NX3xkuyqLierd6tn7mkhvGXjcSDZzJI1t/YQ8WxMYuN3t1DBKQzxnk4d66iDfvyY+GUQZU9ijGbf/WXkUzOs5/GRvKxbxqt27UnIscOMB4LP3vxwSY2fm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vz/F/fTo; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vz/F/fTo"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fc0026eb79so1811932a91.0
        for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 06:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739457395; x=1740062195; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbWzWCt8OHucPUBoPro0Zk6O9SHBNwoLoq7UIHpho+o=;
        b=Vz/F/fToqFjwc50z1dRBxat36ZzKxOI5NKMzPYgZVMB1U9PZ3VeXxPe94iDWWlekHW
         4cgBZTJfgAskNcvsRWqeC/4KbAT5/kh27jGOY+ew51woWKJH6rYByN2PxuVSaM88j1jO
         e9Kq9+A2LJuhnrcA5bGxg+qWuNXdSqvNzgJKntMKck05IbJCWtRzAknQRCW39KG982U6
         ukJs6F9GjinWtZMjeTRKeZ1xLFooGTQgtS1vLny9cVlBvIzeCbkfDjLXBpkM5PaUAXW5
         CENB4BGa6poPk3+HfKQkNcQHri7M9leA6gWi6JQd48Bcc+/UoMiFTYXxXRKYoe/0xpPq
         QrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457395; x=1740062195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbWzWCt8OHucPUBoPro0Zk6O9SHBNwoLoq7UIHpho+o=;
        b=E0l/G/h+bb6pgY4g4vKupZQO/uFK0X0hbHikCnkIwvS8ZLiNaF+WpldzsY3GIgx6DI
         p0855x95jovywCIGaBqaJotXiNnIkIlvYoEz0jWqXCzxPCItA5HU6MIELvrUsyr853z+
         FmLHj5Rs7OCeXBHAHM/LUujXhvnLHBipAqlNdL5H30rrCRg+7iO4mTRMRW37n/bX8XCd
         FoAieIMUCg9aQ8tWmHtuG+3AljCb+VkmXNAD2zGxmOzwSLzCC+Rt4E18rqDZguARZ244
         UzYn5QZV3/Y1fmi5O+ynXfyABWMy5ReKSDrZxqVXWKydP60Wg+q3wOEHhgmRo2fGo+Cj
         Ptlg==
X-Forwarded-Encrypted: i=1; AJvYcCXdmp48Fecy5kqGyGFxGo+zXYnYCgfAlyrdKW1xCDQVpLu+ubbtBfr/qw6p52LzVIfrjY86nA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv0StSLEYVUTGL8cXukSy+Bw0PauV3O86LK4EI5UPMD/lZUQvh
	pROCy+nSAC6FbA5LqIHctcpVkK0vuUh0liQx+D3+H5vNRsW96/Lt
X-Gm-Gg: ASbGncuYWIBssVrE6J4H2bq+E3rBT1Zl4xFciuPe5CtkZvITHNvOGzlcwQeMBxlw/OC
	sekLJKkcsHDDen5ArBivEgsUbm4ANXlp8OUaSaSsI58lRsENxet6l3YDekvP0NTQknvNGnhEI0U
	OMg24PWyT4yZlA9aMqR1sgJb45arQT8QANfTKr6aHhsk57IOECKwk07Kk4OiMYIKdA2gCMK30i6
	1452mxHgxhDA9s7Urv2D6WuTtj/w/swF77hMlBoOdRqGnWN3em7beNeVfiyW1iRuWowvSKecJPC
	R6i96Q9I4beBTmtO7A==
X-Google-Smtp-Source: AGHT+IE+IzEmh99k8e5LtSg3CmKmVTOX8Nit3XAE4gsqDcdvOIrzDYawcvAU7K49o8FzFkBHNudGGw==
X-Received: by 2002:a17:90b:2549:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-2fbf5bc1e3dmr11295490a91.7.1739457395506;
        Thu, 13 Feb 2025 06:36:35 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b5b4sm3655165a91.30.2025.02.13.06.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:36:35 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 22:36:06 +0800
Subject: [PATCH v3 04/10] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v3-4-be7f8aded81f@gmail.com>
References: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
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
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrgNiS1k72FP5Vi8yzUaV70bEMzBky32iQouFq
 9hIdRhC1G2JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ64DYgAKCRABygi3psUI
 JJNxD/4kWh0+R/dtz0Y+C8oJSBVp90SpR2M0VAJxr71rhu3sK1EN1s+4tZ7KevDVNDQ2PmgkKNx
 jtMXSJu/Jr9pPTWJh5cEiHqAWGWgp8KmGK62WFx2oeCkh/d/CXC/8xqI2XMQcIVXpX+Kstxqxbb
 cua/JIbj78C290rvFDL/bc0EHI4WPZEw2+DMDfu9/CMw4QVrDAATi/VqJjZzJf1ybYLWio/zcRn
 5zUmEIal92DmFZDp493LGF6fUKudvEflb4e93F9Gd8gDm4r/Wk7HX1vaKpsQP1fTgy5NcaY5c5v
 1kZ1KNbcKbusKU+up33mSIkREg1HMJFvdCLBjaoPc0p4PJu+Limq6iRIVHfo3LI3ZsUwVL7XOsJ
 wowVAAk1uqzDEK/qw+JSQeD/+9+Csc3bNPleZeO45HMV0rWh+l1rORpabuqjRec5NKRIpfHq5mw
 sd5TZpWHA4neV5UW9gVZ+wKFD2EyyS2sObiLW+y25BWfFsakND0Qu7kzRXy43DahEEqFImgCPal
 DKVixg7rc7L9rj7L5fk0xpyoNafq8tjGM0BEx2aNWL892CnatL4iwVuvrDHV/JR0R48aVSAJmFy
 yC+3kcwoU19FkONVISknjxj+4HueXKjBYbC1YZ61drvdnxZa34HcHDiBVAzMUwPPOQV2UE4zAmo
 o4SfSN4Lti44YQQ==
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

