Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8BE25C6F1
	for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 17:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380994; cv=none; b=sNyTHHQ18vjoHp2ROuaTvwv5LqZ94/9twd4TZY7bcU+N7OioBNr8pC8RJl/pPK9Jcr7IZvXdLz0adyqrQLUkuwof6/BiNiVZj7C5eckTq6ag53HwTl8kZGntVkqupxXF+YruRnuNX9JZ9vdj0mppmruShSETw2/Hui09mPiF9MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380994; c=relaxed/simple;
	bh=eNXZKKJOVES7/Y5XuX0Dnwa0JJ327tz8i8Lgu6wPJJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h18g5XMj9IEoeDS/Ir2IyaR3YFA0JQvpRnC1egeMH1iM8b6fH42y8iIZb/T2v7pIUJN8k6xfL7SsKz2fp3BX8K4X5vvba5RVduEkP0qPaNM3xVOafwVMT0kLA2csAmjAYd7CzbeQeg6qRL1PmvZoB1KttzzTiAa8vGRMWj6+5M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwX0l+EL; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwX0l+EL"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21c2f1b610dso171816795ad.0
        for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 09:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380992; x=1739985792; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/QZ9Cdu0zKxLgzr6zBi4dxJDTj6qdFAvLYx0NNIbaM=;
        b=RwX0l+ELk8jKfa5H8e6cT39qDHd3lIkai4pjGQ1NHLaUsvm5Amo/4vzOdsJHWTY0u4
         Nn0+Xbk8J3SpWCwWaECfThygtwZgVFQ0Y9g394dWvaFTGTKy+o5mouVFVMWXrS4KQlQC
         IwgV5E+35T7AaM3T4Fg2O33UYM1Ar4v+2H5eriA7hSGG4iTOFduF31fWZFB03akoG89j
         flxF8Miq0swHWlNB/GrE/7bkvRpj/0um38kq9he697N261+aJS3X1aLjW3NlOe935V45
         M+rG19WXSSM3VnJfHDa+C8nNxYjGvJbjW98qNB490qgek5XLzpMrwXhFX/ilxiy7vOWF
         Crsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380992; x=1739985792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/QZ9Cdu0zKxLgzr6zBi4dxJDTj6qdFAvLYx0NNIbaM=;
        b=tPBNcrLpt4MUu/+dSQYYgZBfVc0wE8hU804sMRsHOLPP9ru3m9oUtTXqoVg05wObkV
         s+OYwk3hpWAqqngY6DNSdD6dNZknY0IeWW3jvGMmE2+uVXorPY7GSTjF8TIn9xq3Od5R
         Us1ck9+lL/9krD9muX6xJD5nTOB30fe7fI0+LSg5nYjvBU2Fyys1da7PgQ6K3bDz8kmW
         BMAD86RQQxGLfpPQNQhUJVHo6oTidhJOV/CrMX4gf1Yc12YUkwmcvQcvKeNukSK2K4Uj
         Gcs6KPDUURjkNDRZptWql2J1LOdK3Hu+ip4YGFxFZfi9Jh8Zir2bzXbj4ZV4VTLMRuUZ
         Vdvg==
X-Forwarded-Encrypted: i=1; AJvYcCWPhBgBSBfpS2fQRd4RUFrZsRHti367iq9KCL/oWAESXo6E2r8Qtrtl7aZsIPY96c+5xAVM9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuRbnPqLlv0PtqKJUjAUOn15cnGpPYKfxANuihHuelCt8JYpdC
	q7CPXzIbFDnIicWzm7r1BT+JEK5fRqWoWv269MAx5kQLafgvgCJR8iNjXQ==
X-Gm-Gg: ASbGncu+6SVTGHnxIzmPIE2QxNogLOgV/Hal81eoAfu1fr98trmAoUhM7XTjpPQDQ9V
	yk19Q+DOj+entI5UEi8LcuxkhgLocvJ8WJT7QnXs1/ylB/anM5dcBvi7lqY6CgKkvrNuBT2o7lP
	pULNDgEar/yWSH8/U+SMMDuCPujF2/PBsvQG0BoTsEg4ZRBOYlIM3EvX4jmnnZWmB0uW9e5+iHK
	EvHG100ai/bKXMMEgXi9RrfJik/iUXaJ/HXNstrQp/Sttk0b7876kj4nr2ktmpQ8k7YiT8lXcHO
	lar3bF9ahm59RdQy6g==
X-Google-Smtp-Source: AGHT+IEQNqc0PtpBXRyDkY5pgMgEWMrDmrw+ZKbtGlw03mhdng3NDc681UXDqGWL92QJmsEpIhCbeQ==
X-Received: by 2002:a05:6a21:730a:b0:1ee:6af5:e4f1 with SMTP id adf61e73a8af0-1ee6b33e88emr573879637.13.1739380992047;
        Wed, 12 Feb 2025 09:23:12 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ad54f1691ddsm6001705a12.61.2025.02.12.09.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:23:11 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 01:22:27 +0800
Subject: [PATCH v2 04/10] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v2-4-87b361932e88@gmail.com>
References: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1826; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=eNXZKKJOVES7/Y5XuX0Dnwa0JJ327tz8i8Lgu6wPJJ8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrNjvIb/r8ezHFnAwCF3de3uLKdW1k7kFV54zH
 bkJcFnundmJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6zY7wAKCRABygi3psUI
 JAlrD/oDU3LI5XOuz2kAuUrzCCL7EuJrPUKPGH3a6pgI6lWbl55C/oFWyYH4L2aaToPl2s233nn
 nz1HO0vBiAKN6SrAD0N+VDLc9MagLJPU4AxWLGmQPpToGVQ2Cfggl3Yf42/xCiLhw3NZgKwSiys
 0ZxfhVoDX632zynf4Nbdb57UwIeVP7dxkl3Wzj/Z8fEpa1TUJvGvboe8QbIYuYsHVR51QVhUDrW
 ad92ICZ8m0XrvopqmwIlQyzZOsVrjoCwfWdajKfTPRJIBZeFXT1QcVTlf4K5XpNknTkMNzSxADZ
 AE6fEIV0mnElmoNML1efWjfttc4hho2Ynr9HGthMLDk0zv9+XGD0CrQb81S7spVmdaLvwhC+Lcj
 vTX/7v75j9UClPRkvxbw/0xGNq2MtRk1Ow5ye7FdgEXsCV7DiMnxNGbnfiUGOsNpyDF6fzp2f5a
 l1EqfbVYBB1Nzw2CiVqnk8njj6fA37mwo9t+uwtwYlNeSwqPH3Swm51GAy+3azCln/Dm1ba4eeT
 c839YOHRLbrxEOLJKgYKAjRhFoOfuEjDRQ5n1WyXTYxajbbK0snI4CDnfzTPTLk1JGVvIlRBvTA
 EM9LnBLU6w9crPfZu5PY4vSpps/UwCZUyUSYD4Lu3W/2jDKXt0j57uLvLXtnPSjrp+K3K9vLdjA
 griTJjfaIYv5MkQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add support for configuring counters for 32-bit EL0 to allow adding support
for implementations with 32-bit EL0.

For documentation purposes, also add the bitmask for configuring counters
for 64-bit EL3.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/include/asm/apple_m1_pmu.h | 2 ++
 drivers/perf/apple_m1_cpu_pmu.c       | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/include/asm/apple_m1_pmu.h b/arch/arm64/include/asm/apple_m1_pmu.h
index 99483b19b99fca38483faad443ad4bcf4b85ef63..835d602a9a33fc812982839799c0bbabef656078 100644
--- a/arch/arm64/include/asm/apple_m1_pmu.h
+++ b/arch/arm64/include/asm/apple_m1_pmu.h
@@ -37,8 +37,10 @@
 #define PMCR0_PMI_ENABLE_8_9	GENMASK(45, 44)
 
 #define SYS_IMP_APL_PMCR1_EL1	sys_reg(3, 1, 15, 1, 0)
+#define PMCR1_COUNT_A32_EL0_0_7	GENMASK(7, 0)
 #define PMCR1_COUNT_A64_EL0_0_7	GENMASK(15, 8)
 #define PMCR1_COUNT_A64_EL1_0_7	GENMASK(23, 16)
+#define PMCR1_COUNT_A64_EL3_0_7	GENMASK(31, 24)
 #define PMCR1_COUNT_A64_EL0_8_9	GENMASK(41, 40)
 #define PMCR1_COUNT_A64_EL1_8_9	GENMASK(49, 48)
 
diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 14e6fd0c2653912a6bbbcc31e6f4c54ee2d062a1..e7b898aef45e9e18899693774ad673fd370b19d7 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -335,6 +335,9 @@ static void m1_pmu_configure_counter(unsigned int index, u8 event,
 	case 0 ... 7:
 		user_bit = BIT(get_bit_offset(index, PMCR1_COUNT_A64_EL0_0_7));
 		kernel_bit = BIT(get_bit_offset(index, PMCR1_COUNT_A64_EL1_0_7));
+
+		if (system_supports_32bit_el0())
+			user_bit |= BIT(get_bit_offset(index, PMCR1_COUNT_A32_EL0_0_7));
 		break;
 	case 8 ... 9:
 		user_bit = BIT(get_bit_offset(index - 8, PMCR1_COUNT_A64_EL0_8_9));

-- 
2.48.1

