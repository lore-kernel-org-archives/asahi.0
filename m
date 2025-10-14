Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374492FFFA6
	for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 15:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454279; cv=none; b=nbgFWl7mZH9SvvkDNMrFZNBAzBCuYHVB8eT+zCrRTLxxX41dEEcdHhqN+ZfolOWjnKVY+tBJY09HnUSJ1Y2pbA/KzSLArtlpzu8oem4VcbIMQyKuXU6NcdJ3RrJCg0CNNDgUL0QTae3TbS8ovDIwMI71Mdcuzt82YhhlUF75CHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454279; c=relaxed/simple;
	bh=C6Dad8JPpdCuqjz4s5GhSEa3XOS5lpXoC8lCTSueqRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KDgjv7gQ5T48k1RaFFXeT+H+cCeNrdNrMftjipfmLJySl6FkkFW+UXFmBopzlquT1NzZvnptV4sECbMwlvDGdJhNZL0+SoSxJvKJ2zrEMx6gMgUDRJKaprLkjApMAh32dObaItTv4JWZCjt/pmCsvb7wW+oa3YMqc/RWJcfPGT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMepe0D3; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMepe0D3"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-339d53f4960so5720314a91.3
        for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 08:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454277; x=1761059077; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLtZQAdEAm9Qpl1KbOMuUjIonMp2MqyrH/XDjYnJ7DA=;
        b=jMepe0D3EmC0gsc6nBgslpWdkkmvkluaGl8k9ClqWIacAVHPhDID97z8OdnCGsXT19
         ihBx+eDtuKbIou5ZbJcL+VgxQHleKptytXVzzSuj3U1zp3fR5qGZWQXst59vLEd8ngp2
         kg3yqwtrvzLcsiuu2t333ms8nwk2vppytj/ZoH8Yxhx/3oMGhSW0Ct2R7tzkmPI3O+7A
         QewQSLDC3itEIslBZHD1S80YM0uHH+PVC4uXQftwBDMNNrKjXNhAkpL/oGvP6+LjoXhL
         RJbHIXYSpodpzRGXZjVICJ4ImxYMw181D2Nvs8BFyBZRPTDK116YDiGanznO8T9wdiqF
         Nkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454277; x=1761059077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLtZQAdEAm9Qpl1KbOMuUjIonMp2MqyrH/XDjYnJ7DA=;
        b=itnAvrIUmGLzcMDvUujcUoJXOfajHsZe+K8VjKDKhZmTHDDUyi4kWDUsF8J4W31Lvg
         UvMm0PMyH52TiydfDK9dD61Pb8WtdiHx8lcQBbgw37xFERYRKbPps/2ZKH4JJXCVA1Ki
         jItpAVy1/o1dHsjVCgNmRWf92E3iategKaEDmDhoEsO+rX+NddLRN4ExK4wUAxQ3u7Zy
         TvBiXY9NtK9f6P2KpBZ6+GmhK41I/ZbZaJViCVasOPfnEdtHwcQq71OA3VlHDAKi8yec
         8YuPG0lTzJTPg0tTjF5+IcnBJSGwMkN9K0L74YZUJe0akAg2u3fR7nA4SfzV/vc+tCWC
         rO1g==
X-Forwarded-Encrypted: i=1; AJvYcCUncbvVOUdesNDuVL8uktIec5aUoZoy6Hpl+LUXudEzrYS7iguRRewPSVwKmYC1r5xMKcjF2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEMujOmLmIW0pDS9yUyWcoiWzNHhXMOnhD+heYtJEng7pu2DDI
	bAICiaPbg2ixuwaei17cviDWqdYHvCAqIgO4FAMSnMY8SfIMgLlEfi8p
X-Gm-Gg: ASbGncsNNf65WgEnxhEBqtoA5mEL0S9jLzvgAefQuPm8hdFR+nvq3ygrEj8p8szcDXo
	gmfu2QFFHqP/Cmiw7yBNzvd1RxfOp863L7AmPvEH+0xkFPqkebQQafss+2UOh/7TzX7smLENU0T
	tvkvM+YpUydLakjNmtCUizrAzTCkc3a6Dys+FiV6M6lVcOl+cFHJ7IuDbWgk6NVVWKQzjKv4Ee2
	ep20KZri7LEiXEiesDWHjLXN27x10eNhVSrYL+DyhEaaKR53PTJWTFPl5VzEyjBU6BUiFdMGUrS
	KF54B/B5gCkpjJn8G+9MNyJT+qC2/R73O2xrB1d+FchGAuWl/JsGk5N0pgMY8Z/qD8rxq8Qrble
	K5RVmwg2sytvPRQcuAak+tXfmMP+r+p9L6i7dqhZ+ew5isXqDZRGvCw==
X-Google-Smtp-Source: AGHT+IHOP13PRRe4fGKU2dX23aWl9ytYNiSEVee2M+QWQRc3N0N3lx+44qmDmxKAuSsya1+ebXRuBg==
X-Received: by 2002:a17:90b:1e0c:b0:32e:87fa:d975 with SMTP id 98e67ed59e1d1-33b513ebbedmr32981127a91.34.1760454277165;
        Tue, 14 Oct 2025 08:04:37 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:04:36 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:38 +0800
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
Message-Id: <20251014-apple-cpmu-v8-5-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZtj5N/ZWQEde4e5ZFUO3AlX4qFFD8lhBDKy
 EoZXWDxP9yJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbQAKCRABygi3psUI
 JG4BEACXO8SeA3FJFQKbiTtnTJEBCSvQBz+ZfDqNYwU0oRv29B4KlTl2p+d4t5UTnHnfWgMqObs
 bkqHaEX/JgaUrBV2p3EF4JiZuTzDM9CSxpmhMX78n3PBWBy8eEiYI3dnXWyVW+kO82Aift2PjhJ
 On99dgGH/wkolrZE9y5qo7X4YCBQ2s9BeaPSnqmH71jKw/IEc+pGDvAaZqQyx3/7A41BXBRBgeU
 x9oNiTPEw3rmIoTtkb2V2125TXN8qJNdiuYLNJrTALHCJ69Fk2T4oYy9HIbRnK3s34PZh0Nh9IT
 cSokHqlhB9GMMWwsyBnHu5PTPME6609MNPNZNrQ8kjBWbXrJiZoWzX9x1wJDmUz5csPVa/Io34Z
 7dMfpQTdGa6ihQARW5mJvso13v9zKBeEvZUi4LjnLZ0xtv7rX759VWCnEKRpdLUdXECWI3FHbEj
 IHSQLtDohunqO6ZqtI+I4y3rSqxYhSOKSkqMWtU7lOlNjcB4PUpn62xKm09AknM5UGAwhwO5KGb
 R3gW+qMf/ZxKw4hat16SIjSQq7JlO2jcgviXIEYRO2k6lWtHYivbJKTJ3bS2sOJJXHr0ME80/Tk
 bd0GUypd7crXvpMhwfv59mKAtj9WrEUsPNIKVbZMZ/dympBIbjomJCSo09nTQShOGWVi1PBN4cF
 X5JBu3phEhVYSCQ==
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

