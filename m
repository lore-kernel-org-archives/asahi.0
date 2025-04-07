Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91542222A1
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 04:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001183; cv=none; b=Qf2FEIK5RNH5EO2dKnIcxXawMqkiET7SHticgKAR6opb+U06TJegw/kUzwdcVxN1eVpVVxmgHjVLH5QEbql2K+4WRIQdAbpDe7Yt+qVNXRIdVAfUW3Ry0/F2YoPTE5RAIXavMdCCOdAGZ7zVSmoCFQA0SWpqyob2o1jrM82gFVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001183; c=relaxed/simple;
	bh=ow2nagzt8cdbi88jV06ZnLC5cMis8xMzKWgyHSgosSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZ0pMnMYkWw/KjPlhLCYj/EeEY4IUR+eG/kAZhhwlpZobvMjk8bQri38osRQ4jDmbzxgSV6ZJfKxJ3hsaLogGKLZVyRebShP5qfCYv2Tlr0GwDGBXVH8Dgxe9HsTdeCgQEp/kTFUR9UsDx9+ekqEunXqEuLT472wtl6zlX45Srk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2xtixfQ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2xtixfQ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3031354f134so2883696a91.3
        for <asahi@lists.linux.dev>; Sun, 06 Apr 2025 21:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001181; x=1744605981; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJlZQxAuIqr1JT83/pU2DIYPeCs7+afDmDUJaJYT1ts=;
        b=B2xtixfQfo0xc2B1V1qrNtDcZiaSAPLYwybmVH2fmfw9oQjYTQEIyBnfuypJInD81+
         1FoN/A4bDzZ3pfAjl9dw/+0nbsiAHIdHNGS/xTu7Ye7YI4OcMd6H0IB4ZNg0MPb88SxK
         nckuEtW8/Vsp8SrlDw6IF/M4n2qK36zkWIDXUmjAZfUMu6IRt8zmpZ82AAsMJJm7ew0o
         +rlk5fvH5NmqdeKJb42ffAT5bqP9Qbr66PXqt//Dchmp8ihtcxecBcYcdxja56ELXyWU
         RoVw2vkPO+xSJIoNQ5fE9Ca+llqkNOWglTVTTj1p9EbUlbS2MQaZ6dTeKR7676TEQA60
         TXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001181; x=1744605981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJlZQxAuIqr1JT83/pU2DIYPeCs7+afDmDUJaJYT1ts=;
        b=DSGHBOBRvh7RUKxHd2T5tSE+y4DVAEd+gmd/D7Ec7ciBgh7dRH/CjKNebUONpe8QN3
         aZmXme3NBFQd/uiYWqReEW/+/d3+GSDq7I2P5QHxatZ5hVecvcoqRAw/kJOyECGZlXcm
         2YsdeazeRIGTzkhcq8zOWVfIHe7WJ1zHBmILeFs1e5vPQ8BBwZkDp2o9hL2LuqqGTj+f
         OfhbanXlB1vaWxhXocpvxubQth99+FsrMwsx9wyHamZT+DJkbclgfYcCANssp+LWUkSf
         xkd4V2hGZqemF1+FUmBWfsZ/OvjcSc/2H2KuA1xD0jj2PkSMCXOfEheq2ckaNspq5WYc
         5n9w==
X-Forwarded-Encrypted: i=1; AJvYcCV8Rf7vVQKZFzN3G7DnkjSNXZQDO/gHviMtGsYBTti5bl5CAbIlrT9RrggV2U5qJZfsA1SOPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYuZlCVeHMHHtHPFeHvgXnDMegtgvx4wHSsIp9txEmdDkhlfmL
	LRtm1BE10tV/EJTEB9Z59+fTrWSo+uprU3KqKYdFmcq1IixNptmb
X-Gm-Gg: ASbGncvw86Moifbt7OASSweKd5OjIRVgAkKkwfg4GJPIMFSQKtcUVMil3XAXgRTQvmU
	+vuaQqHnK0PdrFbhp3TPBW8ChYM97mwLphO+tkrUeZlfxO/ErI0PnjPmHNjVbKvvjFhkEzud/u1
	uBzUZkz2pL05wpXXvqGNj/tlrwc1Kc9AjmBcw3/j5FSKGES/WOV4UEkN1k8tDsfNrg7XGG7h45T
	uKiR/2s5BP27qKrdZUIwnN2dwnodkEcnAGAdkv0VGdVZLb70ys6UL2v/h7kMPbDzv1amZMoh6jw
	6YBkUiGfaNKyN6qgRzqql+i7AiviFa9aRaZv8HkZfNa/oe8=
X-Google-Smtp-Source: AGHT+IE3UsvEN8B/jPJeK2nWJ2V478sYP9gTu+9N0iXdhKlIqPB6z7Iq+TIo5yM0yYIrGGZUAhTo7w==
X-Received: by 2002:a17:90b:5247:b0:301:98fc:9b2f with SMTP id 98e67ed59e1d1-306a60e4ad6mr13274073a91.1.1744001180978;
        Sun, 06 Apr 2025 21:46:20 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:20 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:14 +0800
Subject: [PATCH v6 05/21] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-5-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
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
 h=from:subject:message-id; bh=ow2nagzt8cdbi88jV06ZnLC5cMis8xMzKWgyHSgosSQ=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iGwNe6cSPZDJeV+M3GsJYDoPDTRilFEHJMm
 2rQGNvdL0uJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhgAKCRABygi3psUI
 JFdaD/40iSJYdfx9SHyamIEddVIar+7DkYWcqtkWkzzjdFjSq6Ak3TgXq+p2CjsWVzYpv6vrMqN
 wkUbLR01ADbBmEykVR9Y0QtU5S9VAFqQX5Vfn+TFbFhK6Uuh+8mC5RllY0pIqQoEThDegeWYpSJ
 JhR3g8h8WP4XRZjuiw1nH0e8Ps6434D5kLgPRftpB5o5q0jFjc0D9TZ3G5GFT9Ff6sXVwqLPO7Q
 /Iusv7lYcBaKt4e1jwlmjSSrjMXq2V0KxFOobVCOVtVsl83igP38QkOUf/HeHnwyOMgKsyYZ4EF
 afHMqCOs31GPtvVmDFnKC96tFnzbu+VPFp4cXVqpMUzNM5P8JvjzR7Y9U73PGwoKNs3He827Gv6
 5zsgxG3OFOlqcpg6IaDXEDBdwnlNUpCgQyn0mBUv0ENcHpQk0PDzzOmnucKmD5OJ2pQVQeb0sJ/
 XQoTupZGYQLxBm1DDMIJgmNlbehuTD26BIMJ/XSHL0bUy/CMmJ2NULPB3O9qWM0TF9JJcmrMDfp
 ty1aG3m3O6fAFdDxu4mfj4AxNr7OgDg1jhorFf1h6HerMlSE8yj5Q9+ZI2sgZhFbP6moM+/aNa2
 YEqfWn4n4QY8GvOq/ro6MkZ5LexuutJd+d2HYVvjqSyaBJTyBwVo/SzYJMLc4DBigaFHI7R5XSW
 h1HMGgKlDZVP8ZA==
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
index c03eb7acbb66790e17967d570c71746f72e40867..f2566a0f8d330fdc0d71ae298f16ee9700a13c23 100644
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

