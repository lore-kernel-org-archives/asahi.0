Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BC51DF980
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 01:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037542; cv=none; b=oPXiGZT8yCyfKlmfY7rkHULV4gj2EiO18djTITFrBWPqS0H6ss9VoI1bdtTghFEYckkNsRZg4TO5HoNhux2+8cKDQjI0xvTNzJWeLmiXjRcqLrSGPvuxoElY/pHK9Ebgbf9PpAwZczuHXXsTTb2nwx4E3E3yGB2lwPrh6wZLzp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037542; c=relaxed/simple;
	bh=Qn+UBxFKpVtKUsbAnfhiKrUYfNaGPfBOlGOEhF8eJS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S2/Kd7bt9PqpA0Tdh+ckvAT/LM2YGyJvCq2r6FB9g7AGIPxqx96L0TOjsgBBXSi3hcZc1R0Lyif3iI12SIDf+1W6XeM5HGOEMWWbkV3byl7ffhuOtXrWsCcE29pAzBaerXhJAVete0FdSlFXZAU69FoWlnkVQYUSJvzSqSfCKBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P63jwXtu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P63jwXtu"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-236377f00easo52637105ad.1
        for <asahi@lists.linux.dev>; Sun, 15 Jun 2025 18:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037541; x=1750642341; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=;
        b=P63jwXtuPSewsC8WQv62S4bOBE3ZE/mQ7Zv+e9n2V2hrNR6v3n5IU6hIBAS1MjGf6a
         eKIGnHbYBEPGklg39FnJvr5oPLdFrPITmnTywHhONk+4nYqYL0f8bsSHqFmE4VqAeVbX
         1WSzWKADt7hcXRNfRAdgZg6PaCpYpCkCr5iiHNSScr3iKYTIjwz98/CGX5+m38/nsVPP
         e273CRfIoHxCSAHrxhogm+lzyb9zI49qus87EG+/4dxQEqpwFLgtVuZJ4pJWYy2gPYPi
         9HbLI/3OfceqDoJY8AL7oMyWd/Grn7t9ZtOnneG4FLijqpmqNXmSw1a5OpfZvzj092WH
         zZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037541; x=1750642341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=;
        b=vTGnEH8c8uK+C8XRevW+e9r9i6YoUE++xN1wgHY8flzp30Ew53n1CCd5x91aafr26h
         C0Fw5IQjHOt+XIyo/DWJJkW6s41UPd3LIOdyDHdaC6hFqkMmLrmuZY2LHKnrjBYDyEOL
         QtPeO+OQ/hvOgvsnDAqJG25tjFg/v+1wOLGAyjVbsavqTvFsb87o2bJHufT4UkfK2VrM
         kMEuEGxl1lwZdwieeoU+GteEjm9JRDVgJRayUoQuOdJRv+O9vH2tHLSX/i4bSvOfHxhv
         /jwkFOgUZLOTULDxjaP9eGuxfKHm+JzwUXdXBGXk/hxE6YgAI99pwxhcRb0nOVnGTwUj
         1qnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9wyAUDGxHT8kMp4zzFUMetAqj3dWheTF7xim+GpAvg4jgPzqZY0IEvgZihcpinRJg8HalIA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl1m7NGkesNv5uT6Yqh69UGrUfLE9KsUrN3zjT4Bvn7o36ZgQi
	RRvk1ZlWHdq0Rjezy5trG3SI8lHFWrJW1LdrLC4lpM95SCDb0q+H0SrR
X-Gm-Gg: ASbGncucqC6w77VxZ+e8C6jFMd92ci1TeCG0LlqxcB75ingNQF8KHMtjEzg1zmA6ADP
	yhb6eJqVV3XDGBzOKOq+UNvM8tcM0L88piuaWRaeGBdK7sDWQ224xZ+o2qluIYsfz7qRpjs1Wtp
	fWUWsa/C29dkvo2fY2f0JjE3I6xIaJx0oE5uiIzzfCfh6/f5q3gIPb3klJxUvybSCsuztskqaf3
	IgNKVEOzIqgMRJHnyArx1GkdLUW29CDLFGbC4k1Pfg36hHfEVGZI+CGPvfq49chGspnTrX4WqXT
	dPYkYazlTWGnb/bJXN0ef5EO9twaVYzR3AP72rOVoQXDQXsn8to4B9JjW/LxWiCQEzrGPWHOv+R
	Y7W0=
X-Google-Smtp-Source: AGHT+IFISDWBL7BPw8cSUkGaFEbifD6DnUVRGFGlmdHKDSr0FEa14n0OgyU9SWJHrR71gKoWz7K7Ng==
X-Received: by 2002:a17:902:ea03:b0:235:ef67:b595 with SMTP id d9443c01a7336-2366b14954fmr120715055ad.35.1750037540464;
        Sun, 15 Jun 2025 18:32:20 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:20 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:31:51 +0800
Subject: [PATCH RESEND v7 02/21] drivers/perf: apple_m1: Only init PMUv3
 remap when EL2 is available
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-2-df2778a44d5c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=Qn+UBxFKpVtKUsbAnfhiKrUYfNaGPfBOlGOEhF8eJS8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QW0RWxD6BW94sGBJvu3l9l41lpp6YjR6y5b
 L13ka+GzEuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90FgAKCRABygi3psUI
 JLfyD/47l3DoVLnVWlN7rfaCtVBAT7NOIUMhhRoueqjpsc5Nr7uxPFgcQBPxEwuCd9zKs5y+z2Y
 urnBCkgvo/EwrfF9IsTpLy+eIvH93tKRmc6mONfBTE5Tg1cQW8MyGVQ6VcTiArNIZ2PKmNz5bh0
 DbUCg3dtH61/hoQqSQQ0lxv8jaFZ6v8/d4bXmXbzpVCTI5EOQDSRxeJYUvBOFGnnDv9e2ZQ+Hjm
 t443NbhyFB/p6afW2FOXWq/SaNW8IJednDByrfUtIG5TMLixf+c+H6bo4/LX7XgDmVdmMkGPWaz
 VsXtP5B1xvdMxv3PXc8YoSvg+pwwQ8T9IVFN56OQ4vIdG0asSJa7FaYclMa27dR1pzMVRmYbQu2
 9/7q4g3pXyesglP+GFSANYVT5nR71/eGDq2nUU2pwv/LDX0hdlkNbdZifAOvXIm67ktwre5sohp
 LW1l226gL8XQhoUBCxyKI9alERX8/tEkwnxOkWB4sbico/dLFXR9KkyQZkkCtOCwzE/394jPeK3
 11AgrKtTjvADhxLX9CTVYrYw1PM280pMU7KwG3xYhnBWAUuojdfdVSXD8MCg/C04kpNidgWGSgj
 86nZPOmShxVZyMmX/7F1dtmlCZnCrZp8BmO8IYjj7Hoqd0tKahjHA/kQIZ9QiF6wSv23fvFrNiW
 9C8DWiYD+nqNMuA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Skip initialization of PMUv3 remap when EL2 is not available.
Initialization is harmless in EL1 but it is still a weird thing to do.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index df9a28ba69dcfad6f33a0d18b620276b910a36ca..b800da3f7f61ffa972fcab5f24b42127f2c55ac6 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -646,8 +646,10 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-	m1_pmu_init_pmceid(cpu_pmu);
+	if (is_hyp_mode_available()) {
+		cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
+		m1_pmu_init_pmceid(cpu_pmu);
+	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;

-- 
2.49.0

