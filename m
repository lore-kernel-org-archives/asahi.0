Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1C20C00D
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 01:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037559; cv=none; b=M1/zSyp5TQ3JoaU6meJ7NutdT3YuoAkSTHq+m9944Z+YYQQHmLk92L02y+EQDnzEoLeUeyxWfe7jjATodfehWbxSpLam1BNTW3K99110u7lkivDciVW/QBrz8DuJ1iq3rZwasJ0yB4hq3XFO1Udzn/AIWgoghUn2zlzLTQTrUP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037559; c=relaxed/simple;
	bh=rgncqluFC8hqHT0y83Q4VleXE9Vishjne/f3KrvYdxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yop0G8BHHPNEMIuhQYc7Nlumjmb9cFMb3jeWKAbQbeBeTjOJZWF8rndJ2h8K8CD6TBNjmhf4/Z4DiEtW/MLesan6h6ZoliaqMd73GJrhJXfBp9mdLF7DNvwP5r+ST5TQC49/asoy+32U0Gfxv9T7pZwBKENOmHd6mXE28pKTP5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4741a2P; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4741a2P"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23526264386so37776135ad.2
        for <asahi@lists.linux.dev>; Sun, 15 Jun 2025 18:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037557; x=1750642357; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHnX3hiTgygahZWce81xiavlKw/l1jLJfkiYMRd1Pzk=;
        b=O4741a2PvzHvSXSMk/kRFUeJhtK+tIK/kBWflF7rgos7+68cVvDuiteWuYoJ3FSy7j
         nECsroSaTaIHcEHHpbd9R1yinqo8MgP6JdB2NPXma4tzTV4r1ySJ9odR+m2NyIP0JHwb
         ZZazZYQev7u4LY+jKOJ4haX6uyLaFP06T52+a+uMNwkDMfrHNvypifPSFe18q+XJtRh6
         aQHibUpi7qb1eguUllvGW4vbU5NfhhB9UnvCf42BHndim44TBLFGsLHT1OdflXCvCY1/
         Wp5NWecor63KxVGvCxEzFJSFDHuF8QM4+2WTW37iv8EVc52sip5W4hI0J6fEBM2/tO22
         FZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037557; x=1750642357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHnX3hiTgygahZWce81xiavlKw/l1jLJfkiYMRd1Pzk=;
        b=ZKyO1esoe83HVYg/42s5mUuH/QXQDDcsWVhaZDMbCgTZFdMFQmgT+TSxnzTVoSQ7VZ
         kvjmESsq22f1rkytrALVvgGf/xdFugqohAB2N5/npeJ2Ry2wSP0Gl0PaSBFogJtIwBb8
         3XmB6ktUdBRoV38+yn36N2mmmReRswbvIxYBRGBfo6feR7iSZbFMbpe+QVPKkNt3niVm
         KlB/cHbBAI6Ix+XdJouo0COxcYWWBKf0+ww0GCtbavFPQtuHLhzIiJDtl9fmyyYprSzh
         Eg/KdFMijgLjXEllkSA90+KjbdCxIMZ4kDP2c2iD9kP9pm1Py9GjCWB0AUZBa/QLvZ1Y
         fz8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWccTEESEG/xHZLMKec4Wqsz+Rp2xRcKdR7b/AcZHqycII9RjRs4ZZLXM9bvm7ZtgytnuXNvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxU7CcdaxF5vIBPteUx79JR+hOdLbTvk9Rcd5KyhlKCTeUKRwbs
	bbDLAkcspHIFteYGzhgW7JDpjKGbpxYBJPcW11CUA5QZL+C83knBvPYa
X-Gm-Gg: ASbGncuyPKPtqUT0WIoqQcljyLTijYBsfBdidjeWCeNOqxjBQlOoHR9vxAdBQ4/GVL3
	k9WNM9suMwRdxoKFi6RfEyScwdqrrlLfi4dP6E8BSfhINk1vpneNWEPI6AKsl7hLnmP+i+JzPO1
	oOjCui4At+DISsas1y3Mnf5Qy+ztmMLL1HpigfpIJf9iESsPKj2os+Gms0KiG8wPXs0XSYNaSvA
	KJSD8/4rFKc92v+Kgw9j/bHJk6ZdAMGf9zkCpOILJXS2TNFpEGUfZ0eoD3AaScamCpcNOszVuVE
	8No64cPo6Z4m7DoHREDN2xGUy+srEc2DZsvaHCcj7mHjP9kSK0nxMBaeFZSYpREkMuVZre9Cwa+
	/GRM=
X-Google-Smtp-Source: AGHT+IFudX6EFzo3QF4r2jcIfH6UCpGNE340PBewbeY6d/vvXtFcKmgg2EvJTzMAhvkSU20ywHPdBg==
X-Received: by 2002:a17:903:8c8:b0:234:ed31:fca8 with SMTP id d9443c01a7336-2366b3ac384mr110047745ad.27.1750037556953;
        Sun, 15 Jun 2025 18:32:36 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:36 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:31:56 +0800
Subject: [PATCH RESEND v7 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-7-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=rgncqluFC8hqHT0y83Q4VleXE9Vishjne/f3KrvYdxI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QXGctIy8HTZc6FMgHV1/cuW5JYoDcpgdCzh
 hOQjXH5VvaJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90FwAKCRABygi3psUI
 JCIHD/4jagi5xi8pwdOPV2nlS/vBxkQU9xSTwWSEW9TBVL0HG3+EnbuoWhb/YT39DKjLMeLVGRg
 K83Kdh0wt2khtxKo/eTJqmF0T3G+tOfxnH7DGm+Agr2XA/QwaBk5WV0XqqmnS8wPRAJhAq9LCrO
 mBUFtdHGe2mN0BrmOPyQuDBxegFHJWsm3xYn7F/X9HuddmCYqqRMUoIHOAjfodZ5ajyNLCQomCH
 l8X6T9mECLvhSwp2naJZ3xcrneHmu8CgczyJLojrNoYsGAcZzTFNHjs9spge8O7wzlW36qlzc5k
 Z9JT1yjGopSGnhjSlhhSWVum10qD4ECi8rk9mT8gtGoo2Plj4b1MPQ5XTTwdpd5YhBdYgTV3GcQ
 LHfNEh+t2JroObT7XvHDyoO7SngbK2GJdrh2thXIducD4oeE7b2n+evuUJ4Y0qGdBqe+T8FW7Ci
 2kfWdvYWNFI5S41H8zHM4hJ0sBSU52bF4JHbzH18j7HJd1AgpTeYCzYf8hJebMmblLTRdEiHnQE
 CZHancEpcgYQfI49EFQArnhzS17oVmmciEVZq/H4N1lFwoVXOBMJfb5aXl8rkM8mWcbP5NjnGov
 VWnRv+R3ckH0KWKcXxbGB5pdC5TfT7k3f/MdSFfipW1OXPaOEA65RGpzE2U7YrHIZ+BXyxnVXYs
 jk404JLt7UMwLgw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

To support implementations with different event numbers for cycles or
instruction events, event attr groups needs to be per-implementation.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index f4d8da4a8aa0c197cd16af422b33f4cd943d379d..74e9e643cef7f9a3c9ed599da36cf9b04b124810 100644
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

