Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7180B223714
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 04:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001189; cv=none; b=kcVceMNosNGe+w4ql/ZNVeu4IB1YHWxGfujeAoXW8Cm7tCt0/zMenr7LOuMErEwb1MyLcRZzVzxZPNhQXULeGUZwEqD26AdKGQQN02OVFY5sEhqxmWxYFweatVNIvODyx5JcDfOI0ioFOJuCfZ+p1bSLkfV9wo6XpVwrU7iqWkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001189; c=relaxed/simple;
	bh=yx4ulzghzXPNnasdFXmt4DIvCjCuPnUboqBEbKM2bdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/7l+pwP/m0SDBSwUP1FDdzZiL5JG6YE+MaPaa7Anu9n3fVToLThWyzWWhe+gzNjNnWaqsQrfG0Z1qVj6SrRW41KnWYZ9/He1s9vFaYP0ibr+/k43bfbDlEmm0LZ0j+H+BrcrilYkNCymAHnwhlvxleBsrwPC1VPCEnvUTumoLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gS2f203b; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gS2f203b"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso4322597a91.0
        for <asahi@lists.linux.dev>; Sun, 06 Apr 2025 21:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001187; x=1744605987; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFRFlIe7m8d6IQT5KN9JYG3eex35751hG/N5r2y+/nY=;
        b=gS2f203bRtu/d7YOdwKJaEbMjZc0YnAtoUn0y2hvrjT4XBF7BbPN414ZEIqVypqz7R
         IfFtig/Icgd9XrTE5PKsXqY+oIKpZ4Bi8q+zEXOC+2xX7WKc3Mc+r62RL7FctuqnZ/ic
         izrPgB3caSLXK4dgAl7KRGk5o4+xmacp8op38amfptnRbrIBDwhnROVluWFt+P0mh1r7
         vePhwq18YbllUyzCtiGyTY5QVK7Qt2ayFY0ysWNAArpOaVRREdcKMjiKotieN+I8WkDc
         cVkGSZexN8OU28JKBaUwLG62UUsBUiVTPj3htnWdAhnqnDhji6u25jSRTtdIUuElky+Z
         KOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001187; x=1744605987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFRFlIe7m8d6IQT5KN9JYG3eex35751hG/N5r2y+/nY=;
        b=wHAmLLhkhBNyl46vXSMPluKSZS9Orq1bg0OqSG5UA9su2e7WUeooTK8i7wB60gXXaj
         88++T8U9Bmh5KtwJEPlvBfcxL9pSwyIM94/Iye9ro2gWLE8rhukAbPf6iitVkdISWpjM
         dkniZMitWykjKA4360yZMhDbbgrwEN67VRHmzZPggoWgx0LReDpi7AgLzVnK8qgrgrmT
         M+szfiVVY3yYL1urqqyL1mmJEceigr0VskbXdbKXMWtQEJ/bikDXNi2gDZw0UolnA29a
         EcUJH1d0wBx9VSkBY5d2zIhUinW9yB31zNQ3z7kqE0EaVgn/a5tBpG3zAWCQQawuOoCm
         fMKw==
X-Forwarded-Encrypted: i=1; AJvYcCWeYDmMekX5TY+zM70oohZXZR2amnBkOulDdsMx9+qfjeZg58ePxpm6KwsD968Wp1yUBBorBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXv8tjaASo2hNFQAQQnV4BtSXt2PCc+136/VwnEd8vUaNEJ6XJ
	IPjlFP3E0Thktb9t5fNyri7liRhNTGrkf+PYE7oTXAO1gfDznWrz
X-Gm-Gg: ASbGncsuFd57WG5wft7bdnpUAHvaof1D8k6iqcnf5VwH8o82xY4bRDXVTac+qIfuRv9
	gH5mqSVk+v9glKve48anxLEP7nDaXKaUNjd6qJ6RNL+KT2pGG8JuUmVZpdqpaGJuqXJ4/0G4Wo8
	zZwFfMaLv4Z6Fr0FhCS4rz7LIi8NHK64Iu/M9/3LaHBGM4+K2xd1pyhDtqPig075IKRz5dKuzj8
	o4kM2bfZUx0Hcfyu3rbhQaFchwPbVYB+Fdnn8cWz9nhPL09Bh4Q2BKtBzbp96VP2Clg7fHYHA3c
	Oq8aWAZW11eDJK34AVvnM8mmNT9Drnt8Zhd6dwaypv4V7Yo=
X-Google-Smtp-Source: AGHT+IFtOzYQwCPnZ2zUn89rY14sYabFBGbtV8W7FYB2zj8vZDYi8rLaZzpBoEuRbxFF4E3itRzQ7Q==
X-Received: by 2002:a17:90b:5690:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-306a4dad016mr16981125a91.0.1744001187582;
        Sun, 06 Apr 2025 21:46:27 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:27 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:16 +0800
Subject: [PATCH v6 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-7-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=yx4ulzghzXPNnasdFXmt4DIvCjCuPnUboqBEbKM2bdE=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iG2cjlECAVc2xh3RvoP5G4JQxHopLKpmx5g
 EZq58CWMdSJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhgAKCRABygi3psUI
 JI48D/9yWpErN8+SzWqorucLiJZD4IWKvA3WTpOs9IDbnYncSBqRyTdCI8cEz9NTaiqmK9rkzyT
 eOs3LOoSZ+zDpwZUisCRnHzpnEWpG12m0U7QT6Dz5T9jxospC7BWtE7jR6erW8qaVl1cyQCLgU+
 iRTqhFHDQzEj+MgveAygx9JOuBbKhhUWEC+7JgLvc5Ilb1JhhUPeK5klyL3Wd1gRW2egeEj1EHU
 GNYLKC2XQGV4qSlT2eJ6e+2eInE2J/JunpGTlzByHG4YtNmtR6dwXnS+qibbxXRM1OkzmZPuL/l
 +1vKcfM163wH1eWvbfOBT65Lnl1eH9AN2uQyNqIvReOdjpybQNNmBmzzczAMoqElZ/Mpj5pd4Ns
 XnBarMiJi9UNyUFDMIKPcTrbPtF1prH8uIgkRAdC+j/7vsrNEiGIgmUIkXdtLHRID+fX4PYEo+d
 ZeVjdI7h4YzfhPLU2EtpmSMbDj++A/3/9wOFmJzyENVyXbWMS4qHd59WSks887yNBrwCo2gtOh2
 Tc1wh4/AliOJ4HOPCFBIvF3IeqZNDSbcHobgfWRRvIsSCIt7wCjIkKveq4uXZy8K5t3HWGhoIrE
 +bxFXCHXYH2UGWPzro+sNN00HB/IYyK4O3EMHdCNHZyzxaOpJlBimgGfysoV046rU0NyzpwHbzV
 hwi9OqF/hPlp6kA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

To support implementations with different event numbers for cycles or
instruction events, event attr groups needs to be per-implementation.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 38fb9200369c11d0d7674bec4f350915c67352b9..523ad37a07521692206cc438b8d777f505506c7e 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -669,7 +669,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
 }
@@ -682,6 +681,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -692,6 +692,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -702,6 +703,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -712,6 +714,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.49.0

