Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820CF2820C6
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258176; cv=none; b=HS2bRiuEuvptmy1nBOJcnMxftkUaiy9fYnJJZcose7y/VKEec2QUxnhe2uhcgZ9mkdAivCZ4QchtlJooouSN75oOQNtwShGGaCAplw6FMRrr+P3qo5M9OB6ohO5MAvQaPqf9+DwqSACk4s1P7wIa82icEFytmmfDd6sN7dAHGyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258176; c=relaxed/simple;
	bh=HP3+BRpxCk9vu8k0Gmg3N76nZU0a4qyvZesmM5VNmx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JpSGmJjPd3qbY66SO1ATXcrVxsNTwa4WSLGdjUwh0o/lR6Tc3VZlJnZwwmENbgyW3DM11IMWzgsIHsQ5/YrghQhAsgDKlkDODW6Y/C1rfcTMIYnlT2utGkuuoR20/Ick+5gNrvqCf/pnt+Q9ih6jUnoMRj606YNLPPv+HuBDI1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVqyIe8B; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVqyIe8B"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29f2676bb21so155326435ad.0
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258173; x=1767862973; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYhLngMqNJ6OldqM8uri9fztTRs+E1nPGgcMJFZEiIY=;
        b=eVqyIe8Bw3Mga4K8QwzQG3XGhU88LPPY/puA99osNr6EpmdcCCjdI7miJTE2+xDcK3
         WkqlJqR5bOViOFolctURz0O1hNk/1VZEoR0TY/Cqr7Ag/G7DbhwaecRHph7lNyVPoqbC
         fP0mn5HyJLedkk4RDvOfQaDJaX572GMdnVItOhsKTYQWIW8UL5lm+mbVyjCDYHsePYAD
         rG/fONVdzZIgFBhIM+xYHHWHz+WPZolMfC/cahamPve3vXmProAigk4ukfdg9/tg7+tE
         tZ7FSRmMVxa8GMVpRUqtX2FsJFNF5uK1fdddMF29dtUNhcbE5tjTnDtf/JoE0ZAbNrhK
         +08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258173; x=1767862973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LYhLngMqNJ6OldqM8uri9fztTRs+E1nPGgcMJFZEiIY=;
        b=rW1ygc5Y1euNE2bbg7ueM7zNlnljoAGriV5u7sV9JfqTiusnvWbjIWwiycDfAE/GeH
         TApWi3EUIrpQ6+Y3nwubV0aCoFZJRcpDodEVAC9r3jvi8TNfCabNPEuE7IzcV7+oRrjO
         D39R7swavmjFdl7ECSW04dJQ8+m4tXVnchvlXhPaDynpKXytdsihCXWpU1YuwMm/2nuG
         IJ4VmcyTls4VbXf1RLZ/N37tONQva+L+FgAqlsNLbu/xM0hnMnRPB/FUNPggKFo6eS3K
         bJmZTuAH6NhaRbW25/OySi4zIrlyWgqZ29zUrpQ4Ek9SvGlEvFIKAWKeMc4FB0ra91sM
         s7mg==
X-Forwarded-Encrypted: i=1; AJvYcCVKnNobAskMgWfnPuKC7el48jAvOjYef1qv3w2KDHovieSABCtxZwFXeG8EV0haU7C9UzJO1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWkyir9yyLH6Db7exAadrgl9Q729GGWExy/h/LZED1Fm371itB
	GV+AF7gbLta4K4DOejUmzpANolX0dyuZ8E/S5jCdDoZl50/bshfPOiWN
X-Gm-Gg: AY/fxX7KXJRcUS6kiJU/aLAg3t7Ol7RnOEa8pToL4l5yo/EZaJwfQ6NK77gs2PrDEEy
	Njr/cI0LWkukK+JyQmQl//YEIri7O/mlMxVDcIbp66QO79Uu/peYWtF4CN9P+ywuXX2Sb/DaAmX
	7xtgURtqwHWOuXI67tSY9yb+vxzbYfyuxKEnKkmhxmAgjVyQtd9BTKDd9zvsI3hODpV0O2xFvuP
	Dd7E6sfkuApIGXiuVH2gNWW+BoHx0DRiBs/pblI6IItDmlZNyWoeRX9Bzu1CEKR1MKwOLtSLK7I
	bIj8GdaZzaZgz0AyUFSEBEhj5HKrq95OTA/A+fJ/cSvF3+CW5gYbJF4ICLlQ/tIuXl8qn0Blu4p
	elyx5oo8xUd3rmjZSC6cZy8UgsTs5tjaxHWXA2LLyjfBXkPl1SDm4thPnX6TudUAHejUrNPx47s
	pN92wh5bhUUgqP
X-Google-Smtp-Source: AGHT+IF2DK/wudcCjuHS9KGm1WeGhjtlIUvpoPE63sH8WHjKNF73liEZe8dOYBfzDMRjLKw9kdzJgw==
X-Received: by 2002:a17:903:1cd:b0:258:f033:3ff9 with SMTP id d9443c01a7336-2a2f2a4f072mr340888935ad.48.1767258172838;
        Thu, 01 Jan 2026 01:02:52 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:02:52 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:41 +0800
Subject: [PATCH v10 05/21] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-5-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
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
 h=from:subject:message-id; bh=HP3+BRpxCk9vu8k0Gmg3N76nZU0a4qyvZesmM5VNmx4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgn0cIO4FislP7e3t8nidSA1+CQMnbCNH3pF
 h1xmqm6xcyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4JwAKCRABygi3psUI
 JDnRD/9gYiOUD+XFPH6CuOvFxz6OirPhj00mypSpKS6xPDABNlbRm6Gpq2c8l/14xhRKhcTEFWE
 wppVRTTwtKjb2bicRv0dx7ReyAY6SSGq9rLxVnWb85qXeNrxKut2up5+QYJr0v6L6X/wqF1IGIa
 UgQ24vn4LdN+SCNi59WaZ7X0QJRb3w93mznF6mCQJXYRiTIDWifB/sQteUprkUHxzlwT3ID2lvp
 hx8f3tl24RDYGH2qccljtXnVWrHO8tYZl35zov2s1cjkwQdINF4UO9UxGjo+GCHj/xTETx1atcF
 /SvGj0u91ifTnPB/j7/nizOSZh1JifhmoQO4kNd7acRZivFtzu036oKoIernRQvQsnWDsTrfvxg
 eYPZkSaFQL5eC259rFHjkJoVX7dsPExFJMEvkbbu9uhtJeYp7O2vji09NAFqiGRCOdBU4dkO1b0
 CmIzcWKl6BvlzTKm8G5LJgm5XPtyWtdjddecvLRsDKkQC6Iy/vckYLjUj1eA3HOBWDp69NmyNeE
 n+vS1Z0/35HwheeHocy1/vDnuQXu2J8NfoLYa57FjXj1yJkQjZldfjGQ/O0e+I4vpf+MN0MchKs
 WYScYjbtt2U34OzHdfHxOhsSm4cQYiyHqCLm11bS+UoqE7qkQDzL+Llk7V3vajXFNv3myxXuNfV
 5n2Iqm3zjmofrnA==
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
index 0b0ee2b9ad4b555f66b9b478055a420b7eec8f3c..6340ff7d3b75d7f0c7ab159e4114d49cf031daca 100644
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

