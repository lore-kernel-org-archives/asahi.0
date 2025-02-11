Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BCF253F38
	for <asahi@lists.linux.dev>; Tue, 11 Feb 2025 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290106; cv=none; b=QS7BMSwJd4ZyKdsgbRGam1nbz8Z0K8A9KXK+xv/zthXL+dc7t6mvv2P1ZdezdH0p7O4xdLbMhxAcHXZGH/KqRXApdFs1WtzUfgt6QgIwihhmp+x9nRao/0Telu/uCxJ1TU7LLXus1Qji3M8e5VbaB3ga3HLnNlERhP3oa9bv9j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290106; c=relaxed/simple;
	bh=gQs9caovUGQok2nCifAixdGJFEgkZT2VLjuftKNGAZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cH4VwIAoHGdeq4vuS+BYdN4DEGUhl/Bxnx411cPztZpNu4rEw6Fk1+X8T1GrVCLUMAcbmbfQYx7+h/OfCquBUfrIeYvHOGVNEZhJLqkCX0QCl2d8Ec02IXYyp1LVMQgXmKsnaMSFXHTAWmxeQNY3iurn/pvtCfaeLIhud+V31FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6ZsDn05; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6ZsDn05"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fa0f222530so10522314a91.0
        for <asahi@lists.linux.dev>; Tue, 11 Feb 2025 08:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739290104; x=1739894904; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEntLtHz4WyreVvdYG90vu3xiJUwTFLXejk99s9G7I8=;
        b=Y6ZsDn05py9rNiGLZL0yws3RilYAV3vjycR+fK1manrBbkjn/8/hBn4mO8L02QjKmC
         GbYEBfZVdGxjKZIZl+hZf7bdlPX0LOrxAVFbECmDwkOpkkznIiBL4KpdB+xYoPyBK8N6
         EyKnrhtbhJ2DDMyscdOLIgWhLVZXnO5F9JFZIdCD4WT+YcFuyL+uclIlDUw3Txe4BxES
         bFSM+BMZtMeZ0u2b+NElhrDOTScTGF5HQw8xcH7b6P1wKdWGthpENKROgM7WmfbCGpzl
         GLZABR/u+8lPh6ViOpwoj29YZN0k+XWNO0SLbydJ5RN+OyMue4deFsC5ZR4+4uTckKPM
         KgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290104; x=1739894904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEntLtHz4WyreVvdYG90vu3xiJUwTFLXejk99s9G7I8=;
        b=puUdHqVN3sUho/ZObUPpQWIRTdin8uH6+5k50pvlJ9hahBL+t6A5ExfAi/RtX+VT8H
         tYt0P/IhHMY+ZT+C34r9ffizM9DjxMguLtu+TwEQGnHCJVodTxknZZsuth8We99yJlGE
         Sub9FxUisnx0znmHeEiQ+uE3rK0t4LHAXyXkLnzhJPDVLvghcKIG5Mf5dcU4IFsBFqh9
         3q6IF3D0WaMROsAqRsr7A2rF5WKSttuz0QgcoEheurgfYvgidnOkmhJU39jVSB5JFtO3
         TCxTUf2B9oRQMa3OqlsIp3FTG/OKzXQkzRgcG9ri0BefQLkEgSWRqqkWb0ZT51/CdFUr
         Fj9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEC1jgO1fLqh1y/A+reo1+77+Lxgo/WJvEm0k3hWrgaYUHrDgLrS6bx6iAu70Oz6oUwLddQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkA3lVYNWwOSOAA8D5H9/AEj+oXFG3kaIbqTo/TzkVpYYN7bxa
	JHmi3tO5JWP/r4E8abwsBVMx6St0wpwTIUDJ2weogrKPkDm/sojD
X-Gm-Gg: ASbGncue2TGeTsOkf4xRTzhOWT9dzXgi6/jVapcnPbTEJdmJO7qcOiSAnEMJ9hGYjeH
	7eRTFiyX59MSYYfGejTi6EWJRucwyu8N/etZl0UnQQI7Wvc8e8wTdHshffQe09tDVtio9jmrfTG
	2bUETd8lQOxbKybi0LApPmmt9zqedUGMXhFs0qCOMrAHTyUG9H25BrlfmxbJk3I+7N5IEB8DyrG
	g8YnqIp218omSzhhhGg5KYNP0hDmnjcj4FSL1nnm4Evpj+uqRiAD2RtIMsdwzWmmr1kCNH1rHDG
	i8ho0pTsFjMj7PATPA==
X-Google-Smtp-Source: AGHT+IEMlQ8kqWyBtETjcYInexsO3wrAznZUhzIxMTN/xckLpbtrZpA4GAT8HBvg6O+adCuJbKKOBA==
X-Received: by 2002:a17:90b:1e4e:b0:2ee:45fd:34f2 with SMTP id 98e67ed59e1d1-2fa23f565d8mr23851683a91.6.1739290104015;
        Tue, 11 Feb 2025 08:08:24 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fa618e5e18sm6040478a91.41.2025.02.11.08.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:08:23 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Wed, 12 Feb 2025 00:07:25 +0800
Subject: [PATCH 04/10] drivers/perf: apple_m1: Support configuring counters
 for 32-bit EL0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-apple-cpmu-v1-4-f8c7f2ac1743@gmail.com>
References: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
In-Reply-To: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
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
 h=from:subject:message-id; bh=gQs9caovUGQok2nCifAixdGJFEgkZT2VLjuftKNGAZk=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnq3XnrvthgwukKuQgQqkT+wKNLkCh7f6Uj8zfB
 3RsovLrxOSJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6t15wAKCRABygi3psUI
 JJcDD/9Xa3lG9+foU72POXq17q9s3tzKS7KN12596keegPogu+bO2b/Hxb/kdQUrKeU2Cid3aWM
 QDJ7quwXGR8GjRg/3YQqvhZPjOIzqknyV5sD7UJsR5IFEtVYX/TkVZOEnyNVRT8QKiqT90CBlT9
 WyVpnSymp04tTfQUR+7Af9p3T6pfIJHFoUQeqq7+eaCNRziy9WH5wcaPpgvaGm3GpnGuhye8nB8
 uIzx4rEnbHXIdC15u6zs/GXkMJT8J6HRUwmS7UUL9VjS3VxGSSu/bi99MsU/ksd7Qyy6Y0ImnNq
 3eOHrZaEy1NvtZfGh9R05MLvj2hq+RY8pMO2x/od/HvyN+9XvZ+Aoy1HVaHCS2c8l7lBRAaDVo6
 z/sdKOrFSdaWkLkO27gb9eb5xzXt1LPTLyCBxBwRE+m78V7ncXWlhfgXtQ7XO67ZNIYKAhJpZr/
 8cJtR0oEr+Md874UgXV4rCeeoHvF7nu3405cKLidESyW5XW3/HNuLnaPzHNwsnUeg6zkicA5xbD
 LeenyCVjjkudXVnenBL7HuL2df34xtCuLxVLG+cUUWfgyDf0GfYbZAhQQpbJcDgrDDnzXA9tpl+
 0rfTDIIYo7lz8SNfMXpWn/F9mkJbPTMTCc96K4gYM+mXqPDSo7vdSIXA4FV/Z7sBHrVeqqZAyuA
 kBY4khho2yLIlPA==
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
index ae91848bcd828be197fc21bb2195f3e2460edc65..06ae20332e79f7dfa819f764a3752fefe53bf5b8 100644
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

