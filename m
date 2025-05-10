Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C65425333F
	for <asahi@lists.linux.dev>; Sat, 10 May 2025 15:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889919; cv=none; b=fnCXJ65IRFZ28hBPChYSXtdxvWiUaYBta4NcrqyAqvBXgPENm0InyhJHITyNVIqmqrycVLPt8iHDa/K3uvwsUY9FJX6fOaNuKtThAsUCt7QLBTMb0T3qhgvt7ArbrtH8zCs/2IiLpUpUBaEtF7MYzOX2uxiIz+ELU9QTHLhZEB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889919; c=relaxed/simple;
	bh=4vsiGjbxOOsY3kUJRZG60u58GR8XjzbCD4n5XW1wFKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oeGtkzy08gmb8LGkPqh0BQv1cIYe1adasBHPS/Q38KXpCklRHOKloIjqeSKSoKPZzqSr3HuIwTxUXvMQKidmq7o8N2CRxDjEbHQNDEo9zHmTvXTL35FYPoWeeJFqWk9tpIed57CDjT3YzgAC7wvotYpiNdRnly+9uhd8QQVEMH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijTudV1v; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijTudV1v"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736e52948ebso3665138b3a.1
        for <asahi@lists.linux.dev>; Sat, 10 May 2025 08:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889916; x=1747494716; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYLyecdN8PG1dIKA7P3TjdSo4FSHEY1UF26fpLNtgEE=;
        b=ijTudV1vQA9NPZO6S/I7VXI2nCrKTWNDMlYUjPH4OcHRMqkrvTFvz/VRuJsYqmWtBi
         cOOjqt+h4ZxkWv+Y7wDWSp9NUG+Z3O/svrneUrHCvUxgzf+j0VC31hmKnah4vTk6LKHw
         2lMFFqE3PzwxsfgP2AJNXImZJxKonNMzbjhXyZpL0RQliFX6wZX9YQiafBDAo+AIpK2R
         qOFqvXxn0UKPm6RlDKd/v8SZAQ5nR+8SWbIukWEaStouIzoGRpCt+p8WdFZdKTDTLnG+
         YCPxijx9BRbA98VcNqWp69ckPEC34je6qRxKjYhE7FJdLySDM7WJu30PPGtqhWGhd1Fa
         chBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889916; x=1747494716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYLyecdN8PG1dIKA7P3TjdSo4FSHEY1UF26fpLNtgEE=;
        b=MP0UkX9ZkG1uYlIaJyGlkQXikgl56R77OTv9G/k9yJavQtMcUd/CyiqRrs+hQtMntT
         1sO68pf/3E0x30BXW8sB1uvvZJGSLN6+X1W07Fnqjl/RRNZ3rLuuEkF/l1GYGENrGabf
         2sVXFkSaTrmE1c3fVGDzK8G8d6Evys2YuHUKEIyPAips3jseUerZF417BX9XSrjWe9fT
         NVo5lYaEVkmsUoAyO0jqeXZLUgQackNpW5sWspfh2deGbwLNJ0g9xcotdvi1/1sT70K6
         e/LRQKy+vQvL3KsBjr1zWAOPOtveuNpvp48e8f4drNWxAr0XXWn5VELUPvRKyK72bwr3
         h86A==
X-Forwarded-Encrypted: i=1; AJvYcCW46Jpr8DGgDG1gdSskCOU64VDEJk+0q17kwKDEBBqUv5JafVLBXT5izCRblgzfo5FMZwqzJw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw70ls+cbWemyvVKpnpFtHjSyKhwnaJiSejjAFmm93+ZC9rIoJY
	EET8G2LbV9fGJ4yniiy39k7Sc0k31yCjBzRICpg7avsIpoeE4jAMb15Aag==
X-Gm-Gg: ASbGncsRHIP99rbaaelIbPBUXje23XdWqEGwOe3kJypQ0RFo4+cfCFBzw0c+QH+xiqO
	i+36xgkswli29PZgNNXd79IdfELZdn3/e61Dyyd90MWCJiFFL5rHIxErOUUiKFfN9TprlU4GIwH
	Xhszw1j7Y4G53FSOYJCCJP7kt0z8Fnv17sfM3dcGLPAGQQh8q2O+jiHC9//KYV3ABzV/FR6Z22G
	S7vNlExQLMkrUnokGsNOaK2LPUjVcVq6C4AdIi0QWV1D7A1EJMECfe+gsS2i/zaicDZxgmaAryH
	HCur+v5uJXVI/3p5W8Cd76V9fIco7krgYXVzGL6K7bnZ3nNgqENX1Q==
X-Google-Smtp-Source: AGHT+IHcSsJsPUQJf19qnL+lf/YcX8LuJ79ufQZ2jWGNDgK47ozv2MZuV1cSxeZMATMzYf7GqISabw==
X-Received: by 2002:a17:902:e751:b0:224:1c41:a4bc with SMTP id d9443c01a7336-22fc8b5fc4emr119601235ad.12.1746889905538;
        Sat, 10 May 2025 08:11:45 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:11:45 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:46 +0800
Subject: [PATCH v7 05/21] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-5-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=4vsiGjbxOOsY3kUJRZG60u58GR8XjzbCD4n5XW1wFKA=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2ya/JiyijSsDQMrBMPaDuhz7cPbb/hJgSRe/
 SxItRnIMquJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9smgAKCRABygi3psUI
 JDuED/48k5PDcjnT9sL1OYQWDPVIRxhEuQxRiOmqJbBxsSKMghmvGpumRcR5TboH5ts1z+zAG9F
 lfRhwbVySCEc6qd2KWhGPEP4XYrzVUwqG/PkDMLVVU6V7nMLy9m/ZRmFXaevGZ7+LTLSIUC75Ia
 kD5WK/gbm2c3xNlj+2+oTky2hsEW2aiO719Touqvan79rlqktfg84ylTbAQk4MRaJbaI8WDt3yq
 Jv6Pe/O/ceDRE1jIv75l8NhYtCh9Stgq+BGXHlZadrHSlnEOLlol+TWcGOE55xTOEaCa/wCCn4E
 lHOyIP8lGMcSsTigEcG1Me1c1y+ing5J1KrKW96HipdJUyWaO9i5OsFjRrqoE4PRSxy/Z9aXlhz
 SuY7qnQdOwh5bCWztB3ZiMVhcV8s8OI42jxzyZ99MkCYWkDh7HuzDeEokckyrniqziPm+Fp2Pna
 g2CNapN6sj84RnrGRiD2aK7ye1AlOi/t5O3T+WcAhA6bYBRXM8c/zoJIswM2n6lqlLg8ExZS6HE
 5uPzhINeXJaXLSfD08VlKs/d+QpdRESR9PJtbCQB2GXInxcAshAWlzhUstt/Yp8Ai4imMhsRtW1
 v0YBd3t/J9WtBhpP8+3F2fbrEDbZ3k3Q8KFg45drsPYHWAReG4LBB36ZdV7/mTwzAKcXjusRCtx
 5gZnszXtva9kUrg==
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

