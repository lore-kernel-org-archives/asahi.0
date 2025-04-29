Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F692274FE6
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 03:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898243; cv=none; b=naE18ltFoQ/YJdP5XTT58CPXohaPIM9Ii7Ud4ld+ax/vdd9rJZCKneQvxx8n+dYphfwuHrJuCHRHA1p4SmeA2NCwGtGYeXMFaARjir0DvcKzb0lOsXKH3krvsCA1BLQFNIuBTG17P+jllx2gDvckk4tpKB/H7o78p+npJU7pW8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898243; c=relaxed/simple;
	bh=yx4ulzghzXPNnasdFXmt4DIvCjCuPnUboqBEbKM2bdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tS04Wqa9viOLF8j+OA/Njz9J5a2K+d3xVdDIHlbtOa0/Fkdax6yemcTLC+KGkigG13z3xcv3rKWppy2zsQADvVkeNBE6+bVO2p+BWJTx6JlrSWyf8n7XpIy/PVp+G7j91dJg+TcfZ7vDLAFfxHqSIC1Ra1pSZuGlzuAVWMoBCKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8DPuUx0; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8DPuUx0"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso6182750a91.3
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 20:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898242; x=1746503042; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFRFlIe7m8d6IQT5KN9JYG3eex35751hG/N5r2y+/nY=;
        b=C8DPuUx0fG2ATCKUNEr1mJnf0xDIcTJ5cHlubehEM/mIwti3wzTdSqC5tQ9gfJzVBz
         Nj6Zfem9vRpNYYSZ4eOolCe/4KC6/sNrzHD5TgryuC/0Pzw5Bf2Nn1Sjpu3ijBwX1XXQ
         8fRlCwB7c5X8gkpMNC3RafXmPI3RbT6t5uxY+TVO4G1PpsvAdtz5Jf5dXAXhcobEOwWU
         WwavHJooMzF5aF6Tso7RMUDcWMZ9EFyvWHIpggXsH0qesGhr15h14Hj4Fa5Z66G3OlSV
         DA2ZZlHBnXd/sgAWef2+6K4kfcuNy+1QMc7erxnUvYnr9xPbtdQPfp2Oyw/6wnsnR/p7
         LSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898242; x=1746503042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFRFlIe7m8d6IQT5KN9JYG3eex35751hG/N5r2y+/nY=;
        b=Xl7bzGpgUzbeKJIggznEyPF1BZ2IFIIv13vtzAGDgRoJQL0IIJO/kBn4QEblTrj4kw
         Lt3PCatv/YNx1X7i/fiE0QMD84J9ZoNp0qiv+yBbaew4iiUuaxhSsuP8nXqI3fEPTqe/
         5i+gOcfxxNWaVBn5G2Ztmd0v1OYY8on/NG6BQcRUF3v8f7q3svzA0wmGMTDa3/Emr7Uo
         2UejKNidr244LHdGtuZ1kqGVDfSr4obyHmcXw+oJOhvWIZ+16w0VPM36MK95JC8oBkxC
         9Fyj+eLPTJ0NtvUxlxrgz01fGUC6uRfGa4peCqVQFE9aMdHH+Y6u6s3FIoKP5M2IgJ6e
         nN2w==
X-Forwarded-Encrypted: i=1; AJvYcCUFtecghObeHwAmLE6VWg/4E66POns5yTaW5D7E3ZX7GPI5CU7tnI4SzL8k0rcKZX8/pdeqeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw/6rNJQhjx8rwYa+9QA0jCMarR/ii+tzjwoavHg7KYAkHqUe4
	V/S0lmV0n271eQL8OoTfikphSp8DBfVMozX9JpDBouw0RvgPS1ML
X-Gm-Gg: ASbGnctxwT16r7G+PBXg7c/b1JKTP90LG3f3bym01dExLLela56dOH/GlOorNQzCoS+
	6sdAmoZtlHA5SKE/7WZOCiMbPK7scBHr4jjVdze27wOJSScqB09ahIAxDHhl96Gr7wiTqnzvMiR
	Dvu4kgq5YRrR5AZQwgCgBvntVlyZup2bFvgAzUnJ9/o7n0JGGbmDe8v4qI8xWVZ3Ajjgn+AYijv
	iv9Y0RjUeXSLykePU/mexrbRLGYgX+fv15iuCEECwRVjZ3M0Ss63wekrYi/C0eex3+W6298CTSp
	6N8bhlswNP2gJx5o8k4bRj/cr2N9nVnGBkQ/ikPORhdXIm6iu9pFn9NVGQo2kieAGf/z
X-Google-Smtp-Source: AGHT+IHDwTFEW5fMEJMTCAe5bu1FvynuHvjqeFfz4UrKJrWoqpXUDYx0ood7wdnra56eD2L29EYWYg==
X-Received: by 2002:a17:90b:4fcd:b0:2ee:edae:75e with SMTP id 98e67ed59e1d1-30a215532a7mr3313636a91.13.1745898241653;
        Mon, 28 Apr 2025 20:44:01 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:01 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:31 +0800
Subject: [PATCH RESEND v6 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-7-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErkGoM2RWg0VDlbXiGWY/HfVc4yzBpXpB7XY
 woxK5/rLeOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5AAKCRABygi3psUI
 JMDrEACtYSUEFb/komcO9xfM4+iYf4PfbQ9GJmuP6RrVfz23Yo2dm29bjUoeAwfvld16KTouLrg
 DBM5vBZTQOhc8nVNTh9NRNMsYbn1Zffep0SeMhQUDEBNb6NIXhiOHrTY8Nc8KTew4jtAm/h5VmN
 q2t5U+9QXA8+oV6FpBgIEfM66Rli70AIGdTkcyzZsOSx+cPOdM3B3YPLWGCywlRky0nxD2sD6uc
 Sch4WVH6GF/vpAodNYpe8t/BxxKyR2RAz3l1bvf2EmjmrOzLRt9L/GfT/YAE91wWePlgA/rdDP9
 xpEWOJRDVCdXgBAGqVz8npNYMAxC4iCRNFS4g7zhHs8iswoYTYOA4teUDlsHmZKJ2fS4QfE5+d4
 IQc63gns7yaojgY8npYL6c0aK9ZmVkpAzLrrBe0RrR/Q0eedgs5BBDjRudO7l2Rk/hX+RkPrOWp
 5WaGpOv6mZQHQuAtb7+im0jH02X7gcRCZMOUxAFtMimUic5fFIl1yK43fT9sibB4yuh+QN2sAvk
 eEs5+Rxm/2Jl2VpRiTfLtYdwYvtHu8c+KywQyaVsSBaOHfIF4/TIoeijKvpiembgYXRyYm+nPlU
 9SL5FMHxGt40EVGE0RfF7IlfYbfCsTjHw2fs9g7LqaTGstLqxFBud1C3kRfxhtYthe5IR++rsCu
 VV1MRAyn8hGlwpg==
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

