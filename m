Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529041A315E
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 04:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740715941; cv=none; b=nS8iV4sNy0U8USckDEebe+R9M+JKpD/QRVpvtd5AKGqw/XaColqSv4VZrPmcNIdgtCuMl+bYRvU7jnyMrLjtvTQhzc16B5+uQt+YzDO/6TCGle4HURw4h46iI5OuDn4ubtFgZ4HprusZygoPNlYCUvC4+LEMp2POXy90Orc9p6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740715941; c=relaxed/simple;
	bh=JtntoT+/7KJ8q2fmzw/EEFzk/pZROlC/KV344Upuyvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ns6yDApAFbXoTjn9u8vB9zkaIPBIt02RWzITFsct9ZLl8M9uYlo7AmEsSCwptQZ8PZ0S56Cop59FS81AY0LhLyhkmmsiM6eryHtwKZpD6HEZVqAtWe1+jNlHj1M/Usdy8Vt3SePGeGPujslce/z33zkVUWuAXvLb4Wa/2vXl9ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdmxBpNm; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdmxBpNm"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fec3176ef3so113467a91.1
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 20:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740715938; x=1741320738; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbWzWCt8OHucPUBoPro0Zk6O9SHBNwoLoq7UIHpho+o=;
        b=KdmxBpNmE+MpV9pZ3hzxvXkSdczPjQQA9FOv0UjfATNxsb3XY654qgJ8xTLdQZpGvi
         rLWjfosLWB6ja8+cZ+3vJP400fqNALIKRhq1XDZ0Jf2r76mzemxO9KD4Rt1Ncu5TDSHd
         8H+UUukieuROyGVG3PPwXhC3ti8hbuEEWAr0Cf1oSibNl0IZ8kZACAm9CPK06/2vTS08
         uRT7eb1X/P1HgOljfoGF++Zl3mcM4W/aXVLr7fVHAEiyhl2Wt4dhDTnV6ZOyLrFfzSZY
         auG5I/z+ggW0L6q7Js/htLqOMG433m2WD1Y6lvJbfzGmoOs+OdrZekkv1VZ+J9VWb9l2
         YhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715938; x=1741320738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbWzWCt8OHucPUBoPro0Zk6O9SHBNwoLoq7UIHpho+o=;
        b=EFuMJO9bGLe7AimWYY7PpacgRR3EV50tNkCOSRKPXIRx/cZvo40a0te1qX1Jp0yvM+
         YkqgIvzVHU7gYwcgpBfwSDjXNiBsmBt3Roe+zI8welWNZWJsmpTVEUMjz/WvBzQr2sL7
         nh4YYHzUu6TaUDWAehjvZH+pyfad0D7c25PSly2Dyigt2rP8C+z0I7S4gLg/1nB/S166
         JOmlr3BeMb0J6/DxtZ0VnDf9zjiQWvrBupcts/aDVjX8p0L4eSgOcWhjA5g9MDkOz0go
         zMVSqtm7htnB0bJkUET+GQ0IJkDAfpI8MeOkm1JdfPo3X3D97GRl5ggjRxaDic5qLuHg
         b10Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPaND9TJOlI3QS6hOTIJqmP4TiNmI10+kPj2JW53LSVl/AY6D5fceU7Z4FASmsJKHj2J142A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3yUwUKZ6kbQBwtZtiUAOBXHCSWoEo0hdkKuolq04mkMZod9RU
	KLT7TnwkKSTzIj2DNP7gea57wjZN0/kAZP42nVyWvaR6U0bd6jpu
X-Gm-Gg: ASbGncvKBSodS7iFUZzHBoM0Y40O90l6oQU9YeCri/Vj/ovRptjmZ32HGhO99qOaZee
	Gyj2a/g5awHjSEF+xMpf+syhok1BAh6gscUMNa2OYxj+r6kYA6gF1AINY6d/MpoR1UP5tudft30
	DMKkax4PyqShzTdRZGRoCRjrbbjAYE5L2LsK9KwyQrR0GXLsBh2QsnL2zqcvHW5IGNwg/RwIqwy
	Opp4eHxcdQL2NSp4g5uKQ+nIkVrqfBEhpD2BWCkKZq2ifKvCPIEybgtT33/6o7gbN5FtCxDIdNj
	EFLTAv0NdjnyEXX4C4Vb32Snc0Q=
X-Google-Smtp-Source: AGHT+IERIaw8yIvvI33eg2OCDKzSmy+Yox7h4/BTE5+0YIEmIign94Y8U4E/+SpJ6o86g3lwvdcsDg==
X-Received: by 2002:a05:6a20:431d:b0:1ee:8c93:c90e with SMTP id adf61e73a8af0-1f2f4cc0cf1mr3018964637.17.1740715938561;
        Thu, 27 Feb 2025 20:12:18 -0800 (PST)
Received: from [127.0.1.1] ([49.130.74.133])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-aee7dec4114sm2387856a12.57.2025.02.27.20.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:12:18 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:06:44 +0800
Subject: [PATCH v5 04/11] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-apple-cpmu-v5-4-9e124cd28ed4@gmail.com>
References: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
In-Reply-To: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
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
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTeI2VdJZOOjTGE9uIIIQVxJ8i1GHE0hgd69/
 jSxub+VqWKJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E3iAAKCRABygi3psUI
 JKhsD/4/WmSMYbZ81VnJK3jgPs6enyxsl/w/5aDOv3Ne9UxU/40ChBvI3uieXq584y5AYzgd58p
 nz/L4FqUSQnWi+PC4lXn/kAENM+8nz8GsanCS1KiSBbfAfdjGJz9crz5LhFqgbwOLw/Txm/zQBn
 EvOIuSVo1pTEFRASfM46dpZ1j+YmGiCcsU4U6lwjUkEg4dr6h3Pf0D9iXlA5+FB0iLrzmIrRODX
 qI5pJUPnuarEf8eLXUa1Lrup+oxmy08SrY70DOZkGlr1qma0idQJ8JgLb9dD3mnRvVnKxGuSnhh
 6JDUAenQXIMo5EtmFtLlNvVDVH0Jgk8xZcSzbgHYIMO9UUTv/KW9ju9+fR7eeYsmcAHzRozhBEM
 OOySpBt+OVu6XbNIjGfvJV/odKS4BuWTuLDiwvutUjpqhhluRPE70rmQepFNmOs1GY3JBrBmi9g
 wmXQy5IIfaY8okhNXAlDvncOgmzwkK760qhTRc9zH0Q/t3Zb4VVR9PMBOeo+vnvoLnfv3TrUQmo
 0hQ57nUydTqyOq79T5v4FmwggG//1S16qtkxAGpHcG38X3OSh2g6x6wUY7e3sCEYKf9JNSdjfnI
 vYd5sJEt3ogAIIoQkOjsNujN8XNZow+rldB6wrwglmZPJxfNIaHn9cUL9yhQt/MShu3NA3QiUip
 SRpeluoRzf9LJmA==
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

