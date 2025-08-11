Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDC523B60B
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920546; cv=none; b=pV6Xxyul+MlwPlYfYatX9OnhQ12i4F8NolVrF/a1G9hn276ozHtoQjCfvpXMMmpcTqoJ61KCw0ZoWofWybvY52c309LWGhU8l8SH2/Cx6B3WLb1eq2s231VobTGO0FjdVL4bVOT9e73OUC4tADYUZinPmEPQwOd4iFDJIiAIr6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920546; c=relaxed/simple;
	bh=xtnMIatmASrpTNqfCZXR2dLamBkEP1A2TcLh/eTOrpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKUHpJA52aeAQi7XrTK+jxNWXgwaRTzj6unh4cU7VJDB+ZBeO4ySNUuZkVLHBAzkbmAoHEBetCQovq5/oUmac3HeKBVrcZvJebzyCxeaZ+qcbSKSSVqf6ntyyDdiNFk7Ra+lwW300dXDWHCA3myc68Gtw8amn5GQyHTUbzdcSK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZPclbGs; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZPclbGs"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76be8e4b59aso3636451b3a.1
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920544; x=1755525344; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWF3GSE/4dfsA89aZ5XCm2eNtW6YZVBNZAI7dFS5mHs=;
        b=lZPclbGsqAbIsezcJvvaiAgGKhsGl+8/9ps7HUDPyoOXRhzct0YvZ5ZFpmFM/wUsxL
         l5KeLaYY20As8QSTKbvwqTCsoApG23RJGH0k4hqw1wH86G0yoLA0UrTv2PBCIrKvFnwz
         i3dLnm2x/IsDKw0ldHdrr0YXsUeBqBHom+jThbkg/JlCat4gcYE6Moc15abNyXgQOANw
         GE0J3bbrDNz2I1tyxSlQ8pGC/oK0QnrU7Y7uPK4FOENd9+44GbhNIbQulYKIX56UG/4d
         Do+O8tFWamU4NXZAbYmquYmvkGh3yDMmd2WoiwXI9owGGdxuTXom2oqafeXUKW2wjonN
         uegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920544; x=1755525344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWF3GSE/4dfsA89aZ5XCm2eNtW6YZVBNZAI7dFS5mHs=;
        b=BZcNhKIcPRzmkK7NjyK9X+hCuw3JYIhBeApPZqPuwePXfwBHVyExDZKfVnQ6ELPHFt
         9k50GiuVjiHzpetLhhUlKW9NYMN2PFfgvczDbjlmocd58O5OiEPYIuwYnzPu/fkEUBwk
         zXlQ+ftHblnWLs9UkTEvuhXgAo3cakqnoi6/rYzFlr17dsz0UkbCCtd5FRbZ8g2uNvVM
         8OUxV5aVk71AEg68qsuxjIy/CRILa2jRvAW2l8WCuc+7EoHJQ4p5oPSVdwQuuCgtt/jO
         Kuf+IaEEYeAArkWeJ1sIIUBw4Tv0GCQy5wehX4clO6tGjXo5NzDSgWv1B23HOijLQO1I
         aPxA==
X-Forwarded-Encrypted: i=1; AJvYcCV170NfNeArUzCv/DOXfLOptjnOBT29rCGCfTRMgztkd/IFK7rSyjlZicpSK+GZrSdMgksS1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi5JQ9Z19+PEYQjAa7LqI11I+UsLJcC7mvF8Cl4xqQoNTDjNxm
	92/tookrdi/35y+0xiwJ3nnEUTwjtY25Kve0XV3Yf2ho1X4rZAkd6mKy
X-Gm-Gg: ASbGncu7qx0yjjPfM3LAZccWvmrsBkDPAMVbh1N3T23Lv18qIC6wQwXFTu62E73qJvS
	cTV1YcfvvDgaU7mHH9eKLO/4blLby5kSlk/5kJk/LNZGi0Ww3Xm+79qGO17R7IE+ujxpGhPq2D9
	cEq2AhB9say2Zs4vk/2GfFqS9c+Icx8UKWLmmN0Nz2u6fUal4/OqO5iICF1CR/9gGnuDmpD2mtk
	AtGT51pz4oql6mcWUrn8uRMCdEkb9y5yeeCTRiiB4J0pV22WG9Qs5EJ/G6xObVqkCC2wCkFM7e7
	zD7GDtUlhOwZ05opLLSxcWl6mcXfdn/jio033X2OKVSPChsREmLeKh/0ehMMBj0mwBAJ+v+wW4g
	ZSXBVrJPdPrXNfTQYibY4lzlAIDZmovXBqwOdUxHecnmSEu3ie0T4qR7gmw==
X-Google-Smtp-Source: AGHT+IHBmVFZyoKMG8Wg6h8Jh5M6Q67rGKi2jNKuxRjU+SqT99Vf6o2r/iuoEW/+nJNGDHEjArMQgg==
X-Received: by 2002:a05:6a21:6daa:b0:220:78b9:f849 with SMTP id adf61e73a8af0-240551603eemr19802309637.24.1754920544346;
        Mon, 11 Aug 2025 06:55:44 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:55:44 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:37 +0800
Subject: [PATCH v8 05/21] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-5-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
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
 h=from:subject:message-id; bh=xtnMIatmASrpTNqfCZXR2dLamBkEP1A2TcLh/eTOrpY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZB/dg/RHdFjAxNBqXHOldYRPqycv+vcx/Ez
 XyK2llBy8eJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QQAKCRABygi3psUI
 JMVfD/45BRjXAHLm5YqyfCfUhQP2PwOD1WRl56SyuyNQv36fUcBNpM/ERYzgfNT1UoLpos1chxh
 lehGTKQAJUZY2OwIs279qILgKGXBRqlpaXQVsUcnNsm5TAagvITimAxTIRnwC4YF0mLRO9cN0wz
 ZzOxVaSGztxeVB2IKT40AR+3Gwomx6rg4ZSM49NzkdPuRx/2D64MUlpC8Jpa+zIr3IbAiZfzP/O
 gLAAJ2BwnTemgwz8++KFJw60xaIOm3hNJZW1clw2oFwlehs/UU+XrFwddK5Dq1hnGk45x4Yqhc7
 8481K4CeD/pSxQqthFg08WziwUIk8oTznh6O02NpE1iZgbKHzEelS4vOC5OEPbLvfOIGP+5h34O
 GhLRGVDu4unyIjoGtzBNpsEgt2VA8+zrAz5vGhudSimkZM8UF3Lt11vY9IQyLpaq7H3oEjc3RiR
 X1juNO7oCnP59Zve63U2bqa9Tro0OSb4msi6e3XiOrV/czprHQA1EFGQ3F7skVOBstcKajJwN8n
 lQowfiEbdPqonyh0h8MUvtwSSifc9K7P9078aHUlOtztScyZK30Q9hvHsY7xi2nMe85sm1FRGZ/
 GQwV1HuOs8Jw1AJpX9L7jXM9qXFEZZfIP75Nc+UcGIahVsjtB18Vw6EFwVWQopg9EKMpvaTZp6i
 YSGO4GAp69cwg7A==
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
2.50.1

