Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D334D4E7
	for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988698; cv=none; b=hpz5OkEMFtE/RBerMfOUIv21rWHuqbYHp4lBLPfnXihVE8Ri8R6rIthFdbPGfobQGgePBal32zRG4QS5LZtrxNAXW4eB4ELZS7gEzKpyrE3Bp6VTBbKG5WePLSxwKSnKsMc/AzvlXQgenMZYC2+99F7F1QUv5JAc9cFYFM14mXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988698; c=relaxed/simple;
	bh=7bXhbqBuf3L7P8BkQE01YWRVlFsdM2eh/RfdYjmLgaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jeuks98T5PWGkAp+9eXKCcWkpKxW/1Wm0QXGgmBDBcx70O7FnU7alx7KuyrauIb8Eq2TOcJ0+l0DigKAMjN2G4B0pVbSkTg3Ezon6Juu0xP2XAYmqclfyWwHGhSrXG69kj3aUg4tXB83t6v4F+Zie/kZ70SSPdqnCNp1PPQ9lAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQXZhE/H; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQXZhE/H"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a1022dda33so30704085ad.2
        for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 08:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988695; x=1766593495; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEO9StCrTxXvNpc0CG6gz+jT3FNQyYyGTLdJvKY2VFA=;
        b=KQXZhE/HgK/lrg87UrqezTwlpPu5V6ZFcpg0qr1WgQ+rD7ae7QdGxvZ4h1uTbBrAoD
         DXMfEmM79cb53uTD6mNajH7UXwo17pkhoSQc+VsvaqdfP0mzgmyLYMurrxGTjkPyXOT5
         stbnmi1CIbR8YOiaVOeiKaF5L2mkTYeOeVsKADE9BIePMhsUvKnxvgegrHxnO7zPeB3Y
         upEzP/Bi0vHSvM9bDK9mWlzocsBmVTPcoJGi61DFFp3yTIVjBE/tY+bR1bUM7um8Q9C7
         2vzQsWwHFvt/Q406LCiLnHH9M0YzL36lP1vlwCUgNSVxO9U+i9BgSlNc+/q4I1T9Dmbq
         xEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988695; x=1766593495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZEO9StCrTxXvNpc0CG6gz+jT3FNQyYyGTLdJvKY2VFA=;
        b=RP//tHQWspq9wr7bLZASDnacJvH0zwh87n+HiP9nb1xqf42QCJQHnXc5qi9rKw8FPB
         oKyXr1qYkLlxxX5/WrygV/BFJWcN6o3uOxir8ezcoLJ4s3Gf9MpxaqHnR2fU/hMP2TW5
         8h4aZuB7hp8rkrEPnCT5jL0uFAN37rr8btfLtf7b2lc2zhWZAeJf4IhdZKvkBgQN1Pik
         NhODllU0CTExNZvpPVQaoqxXfi0WqDmlVYNQe36lRCZgFDQO5G8r2I+t+MSLYxoXHfOi
         3IGsfx472fex/JqNImOvV57ceASTO3t+rbfkhD/ZfLuMZKv7Tl9+umR6cA+q/8k47BnN
         wE4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSApvfnk06VHZgCj6uosMJUq5Pqpl4RlnYZYaw0MNYHsjNOhJzQPpNP4ntz12lksvPmTvlxA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/WGjKRzFrqkUqmcoI+7KFY2gvukX86S3WpLzNTuioHZOFmh4I
	LZF0k1a99mcpebPGG5x8FG07Lc9VNNPIFKcNp5wmUwr630OVCo6MhgLVJfd0qOhP
X-Gm-Gg: AY/fxX6mA6+D2hcF4CNSK8Ah2sNh4S0fADz6BHuj0mJdetyaDqybavr3NU0yA+1PawV
	naG8F7ssYpQ80G+0zg1aYI224nJ40rEj3l1rPGyd2T90Ozl4Nlgom35IGO/mIK1esHAibQON++a
	pqobwAcbfelYf330+hWD364ztw1HqpAkMarAHfn0SmYQ8Yyrnq2De3CuLnCBmdSOTGlJ9fxVshr
	xUFncAdXQxRZ68F3mDzoubZfHpeDLa8IegLBu5HptYTBfGOuhjm9vOJfJyq28ybiHl4qibottQN
	zF49FkE9K6WpcCzam9mkpaNcWBFl01/euoVQk/AgRvDGs5KTmoUyoXRTYZdhIYWZmIL2esbOECF
	JQ95hYPxrKeYGRPvzZlcR+ps6E5PQvRpWbLBniSMFCifYtud7PtQfmSE2QmdJyxz0c/Tk+jFekU
	+e5JY6z4Vx2N1T
X-Google-Smtp-Source: AGHT+IFmpldl2EnfdJLLNFecnxN4BEn3qLT3U4ZtBOkfTCMmNYM64weQR42jpdgzZIVEBX+DVu2log==
X-Received: by 2002:a17:902:ce87:b0:2a1:c72:a41d with SMTP id d9443c01a7336-2a10c72a703mr119320995ad.40.1765988695124;
        Wed, 17 Dec 2025 08:24:55 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:24:54 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:18 +0800
Subject: [PATCH v9 05/21] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-5-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=7bXhbqBuf3L7P8BkQE01YWRVlFsdM2eh/RfdYjmLgaA=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlAef+nJhReDRN+pVlLcv8GiPeEbu1GXItBX
 8NUJwhDxyuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQAAKCRABygi3psUI
 JJnYEACaUligWBNlh+4Cyx5bBd2haSpcf1uv8Iyz9L80+F6mnLCgzV4ucw5xjJPPSAtsm+v9Dc7
 y26/bEmsMHPW+MH6e3CUZCdt6N5juF9tPbRZ5G24neEkbHqq5crgYKZAuv5xmavOxSnzk+fkAiy
 Ud9v5zCtRqxzrnpiFvPLKE1CmccaHrLi4cM/C+yfeFq8YN5Dp3Nw7xFciXBONr8SUMvErVbRTOg
 UGTSOuZSsHUH5ZIVzo01laxXoE1ALejU7nDN56soAPhmfI0YwRFZ+Mblz8ncNx51KeSE2QnQFIN
 vkWiooyVaJFc/NnDqevFvaP7FJ7yyeXs7ZvEVB5J+r5IA4u3YdxnssUbYGiOgPoObRorWtmQVdj
 IHRC+TT+JBOVs8KYGWv3smgwegxMzqCaRgzSJ4FfezmgUDvocsUL3X/4TSkhl+ZMVjPZm/NTrRQ
 yAb7ATWidvyGDNSoU87pS+qjW//P4dizYcH1lukjGyUZbgY9M8bOBCuxMKfhwjdcrU24oisCG1Z
 0yC0mOJFPzVeBc854OPDSicZ3QnUvkQ/5XhNTln/oTScT6A9/q8rIDNothx5ALBCDqDN86G8KWI
 2Q2ZQovR9cQkc1+cxFWZQ4aHYzFuHEdyUv3KVIBR8J9fpuIrmbQESOt/L/oXk/HnE5aQ8CfVTvh
 QVwkpRwPTp3jEQQ==
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
2.52.0

