Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D711B4154
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 04:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740715944; cv=none; b=gMWkhlBjyZ+ipyx9Gy8Wa6rQMs9mnwoNb0RlYt1bPAg8M1zMZL4J2lQoQXm0V/uFjeWT1upKkOrLFtnS51Qym4+0rFXIXit853SOV7iQyewV8L2An136qRldn1Yr1w10z7Qv0AcR24KlomZwvI91LtIPXglXQcFGdUEQrmEDwxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740715944; c=relaxed/simple;
	bh=6YoEPxJ23tlB05Hr5lEn9IwiUxu3JyxaBoeQXV7L+7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SXdJq16C7QwLqvUvjY1VgDzncXftoFkJmgZQKYaOtZz8bk56tj3i0TR8rcryCq8hvSPsSby67ucHa7SlQnlkTkDzUbDDz62XloDxzswIHxZDE8w9J/SsLGGzK8X57IgozFIpgbwQcIXjeVuTccYsktVFIn3dsuyfEFcTDhetS+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VULdnBoP; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VULdnBoP"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2230c74c8b6so47851115ad.0
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 20:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740715942; x=1741320742; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EN+eZpJ9eIG68InE3GWCQVcY+xomBgCqyQkRTUGWCeg=;
        b=VULdnBoPmzpaT//2ymk2TFnVGIHUU0yzf+Ur1m5LSyGYcd5qtBD/z0Ze5z1AVF+Bq9
         EyRbYOpJsFPUzVETNKt3yS/flybhQ87KM1KS9vWUy/OclfDEL1qxNP+VlawvyXiD96bW
         fMb03s1TH8jXvsqC4sdZ3X36kSlFjQOMdDeFruG9H28rWsAGDVdF4+tknvwLmow1qroD
         CyyI0nwdA9yp1wMIqrWkZhcVNH4PeRqbGpiNvamVsqJZRbFoAhsZzJ8/+CxckGqSQtVr
         9gsV1gFuLzSJyDIpElF1Ru4VzTdbQ31JhDvhMg3MuFh4yDTEJOuV6nB2DXYBHhHL8v+/
         lSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715942; x=1741320742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EN+eZpJ9eIG68InE3GWCQVcY+xomBgCqyQkRTUGWCeg=;
        b=asn4fcXxe2JXZdJDs0EndyZIfX1jPvC7BmM0F7poNoou96DJP1N1lbJFDzrnf5o47n
         eqjwhuQdZm10RooPxN/gnV1T6HZ6DnATQCnVdBCLbioOctWfZY7TWn5Ii2dckbgL1lce
         bnDv401wN/AdfMYl7+/MG+8O3X4HSbRoM74eEiP03XKuoVb+4KK2aptvyIgiqxIhvEUb
         kbQ0Luuu9Cc7Zx1tZYMnBIQHMA+P49N6z9A596esP2L4kQz/T8dcV4b/Y5xU804Q0669
         LjZ8ji3lQXrCSKDOQJ/lRk+2YdD+I0iI/bZuHNyUiDQCI4cd+Rwuw2jUYZb/HMuji5pZ
         KnXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKiCu/xVB4mq11IZHV/jQmmpWg64wuXOA5LI7f0mf2qgFVNn9F54o4gOpgPD01NqrdpgB51g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXbAK4Nuryu4RPJ2cftd9ozPxxorTdjzXmE77hzP1rV7d/YJ4s
	YIy/Z3RZI1sKMkUMJMuKOSerJsK/jIWjdCw8SHGwL/VLF+eTkTL9
X-Gm-Gg: ASbGncsiBtGnDieLyQc/7kOq2zAreKfue8c1PACCIybX4OBaHJnrg/cd9mGyot45Kne
	/6cE7oPYVPHPXSe4re9sg+OnWBQ/Jj9UzW7GBC6UTJHV90G6ilfroiMWVPHzJfqjZ9g6VAfZ2gm
	BiABgrgCH3Z2chygO4XRvwegLOuFSku93gkAsVq3PH9KBdnPseAM/DNbq+SgIABk+wTDfSzBIRj
	/Si6A3aJcUSJcm9KBVDwZZCmv1JdCx27DrAGJmt009CTt7Fq/+hj4p55U/aIHLi31oCKkqBgzFl
	D0Ms+7sJ65IeyteKHuQrxgDr0UM=
X-Google-Smtp-Source: AGHT+IGQdF6ah7D8WVtQqj5tlB8T681HfUUtCnXKbIkwtEbPe096u1zDzUDD1CQAFOKPJ1x9jbndsQ==
X-Received: by 2002:a05:6a21:600f:b0:1f2:e31c:527e with SMTP id adf61e73a8af0-1f2f4ddb787mr3214705637.34.1740715942338;
        Thu, 27 Feb 2025 20:12:22 -0800 (PST)
Received: from [127.0.1.1] ([49.130.74.133])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-aee7dec4114sm2387856a12.57.2025.02.27.20.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:12:21 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:06:45 +0800
Subject: [PATCH v5 05/11] drivers/perf: apple_m1: Support
 per-implementation PMU startup
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-apple-cpmu-v5-5-9e124cd28ed4@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=6YoEPxJ23tlB05Hr5lEn9IwiUxu3JyxaBoeQXV7L+7o=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTeIR+A7oyzynRaKo2M82R3bzQoc3Ggu14u3u
 zrqtHcCrbSJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E3iAAKCRABygi3psUI
 JDNpEACnujBcz8W76KNJTc0D/JzlK3t8TEZg0aeoZGLcmlkABBd0w8zO0HMby2QqTon3hXWcGUe
 fsd4HCdSenkuFlu3mS+Sh7moZT6CzOFYAzTA60Ltt6/Bte2kaN/SCDABXf6ga/pbxt8I0DNnF9y
 JvNha9yZ28xLrBaTSyUaVsAmR0ACZJXAJrbvMiyO4RpIMT/zoYjNmJadrTb3+WaFLnEi2yxIJIJ
 mQ7cbjVF2Gnf1jI4zM09YTGOrVH18fumF0/HDbfF+RUEYtKKBdsMdQaTQ1UN4XgoWeiRusdu9h/
 mGQlPUqJh98gPeoHSZTlvZONKsopGoZxpngCebQOjpoH5RXFJnm/K7AqWPHKSLPablaeR3KXlEU
 xNxBykfAX1om8ceJa2QydGO6IhkuH1flBWV4nzmdpZQeYdJdR45c0+QilOFfTKx0PuswdGxl8II
 4YbZKPmzhg/mCpl2a3vHBSmutsC/WxFjg7RP7RmJY0fu4FHSRkPe4hEq45Hp2XOqwxBAAVvRL9E
 n3mUulLJW5pRGT2y6vRzEU727ryGX3+GzyPqhGRAOndGTfUKREl4iIGQuu5DWiFJG4m/x1cDbie
 CtkVTL7XGxpL57bm7/uyR+3YK/QdONoVo8UL81RV+nYvsCY6T/XYRX95GI8ofPO5tWalAJFT26Q
 ZJmByVzMquGTX6g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support for implementations that deliver its interrupts in ways other than
FIQ will be added, which requires a per-implementation startup function.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 73ba9861a15ff931b5e388b6d809dedb140e2292..b601d585d204f9e59ad7f5216679b97852a46a04 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -608,7 +608,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -625,6 +624,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -634,6 +634,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -643,6 +644,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -652,6 +654,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.48.1

