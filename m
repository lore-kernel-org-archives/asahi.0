Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1CF283CAF
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258179; cv=none; b=JqVnjQdvwYqHvu2A6qKRwp/lYmWCJ69a2qly2U43vAkTVu9negb2AL5GgtGg8hm3Djuz5R0sZLgsLoKqKzdpmQvUx9S+VN9jDVdxMgCd27PNHHPCFVaysdwyxZtmlQ75ZIEPz+idtJFW/rguiM+rO8jRwnDnkluOthFr/jxoaE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258179; c=relaxed/simple;
	bh=NU8ScGmoP75NTB+9OTDUGxz+f/5ItDBm5slDMiDdGlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mAzyMQIVg3/SYq/2sKYFFnTxrcGHgRCZIZ+WJoPkRYA6019nyuG3CfT4hmJVeqObQoU+MXV431+dYgs2C4K3/i0Se2s9ZHHrWsTUSbLt84otUR+OyxRI4yOUW1CFW1sA+4+bTln7ue7mQGjqQ/RJOazpUc/z7sZ33Y/o9cHiwM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6nRFPrH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6nRFPrH"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29f2676bb21so155326725ad.0
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258176; x=1767862976; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=562CWWEEZvkhVziZnN5oXKTCmOhNnY9tXruJsoQZ0p8=;
        b=f6nRFPrHHfR5O40VM3KM9KgV6NfR7jOcRJHy/EdtYsU2YILg7qVp76U7ypZRT8eGTM
         kCi/MReq0t4RpO39KZ055QRfYMncgUWVevM50xFVYVuof7fa9KaqpG4zBDqW1G4GcOts
         MzMHLEWwZ09tgYPhMUXr7NOZtGntZQqoh7O4mNvmed/38shRyZeZ2jyrgI3z+ZMUbMlr
         C2Gc8tiKtebCp5/1DyBUySi+GLZ2MxnRxU5cskRI6hmZXdhPUK3tzDCpeabLXppBFi8L
         USiVuaONDtaXw98RM9ZffbtCYPjwxwkSsdpaKp4tTzsuGnbSFw4X3Y37wLaefWahPd6s
         pcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258176; x=1767862976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=562CWWEEZvkhVziZnN5oXKTCmOhNnY9tXruJsoQZ0p8=;
        b=wzr3kF6xIgwqimsEs/54262vAvoPlESwW17QdgVOPn/aYP9jNjs28XjyodefBEUsYN
         05QFUvkkJBYTUqtyI7Nwko9/5erKC+oN7ztAt7Vn1nSBXmNWHMl7KOTAKAvDu9E/y9vZ
         DVOUw0J6GoIDfMkGrAKNHH7vAjob/utv4jTiMjzBPo7o4u1GJkS1StN8iW2y6TygBD+O
         CC9Oc20oMvMDuIin5EM9eT0CjCl0xrK2Q7OhOxq+lObIMbllJw0JxVdfzxYHeGD4TIC6
         vVi+L0uuS+iRqUM3ogucD2sz1UZm3qyZGXo+9UFPz0agmecU4E0UanvVYRi3uHPs1X9z
         2/yw==
X-Forwarded-Encrypted: i=1; AJvYcCUlpKuTr2DcAkysNfSAtt0R6aW8AQRp/Y/0ULRFg10bqxR7GveFBMaXa0ZbpVxJuQhAgQpKjg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5xFeDYwz/Ng+bOGasHEDAmaMR0HYT8C/krrbYJUeoEsFPItIy
	H+gqZuYlIxRYEX6ouhHrjwwA7QqHHzp3cE7fe818F8OYHEyERMHu5V6F
X-Gm-Gg: AY/fxX5tqg++kOpmWgvBcaWgASMrr9WsedIEWIUa7oGmemwcMiD2A/YO08Snz5m8n25
	Jod8hMM4ELpJS/3N3fuPPDjju31blcbCAoATGdvjzSuiOKCguSu4EZUljOAqwGCK88gRXdsLSjQ
	DkeqAHKKsAY9GSF/k+h6dceBipFxNPK0krfAsdnrUn5o9sRvjNyORO+C6SwXFkirTh8y9s+5KG1
	g7TGHWaC6s2Kc8PKE8MJUCYkntQfSoNylNodN0ZsXvvi6xMpweE7U7UQaZKNhA157ogxcKYoFKL
	zstH4GDSavtz/0UUcUKb7Pi3GdJfgpAyW5k/q7xrHUbVdzhynBSmvSx95xBc/w0xTCTA6otr2Qn
	7zVO5lw/zxV7SdAxBRAvrsrwUkMQHDr7zOpwtW1zWQND0QGR4kaIQ5LfC1HmKGODMq3F7xsjYZf
	ssU8zWVgDnvyFO
X-Google-Smtp-Source: AGHT+IGvF03jWexAPJyhOO/i64xBB7TgDY1P/zTwtuv+fTjh6qLFIzbXX3lAjmk4xMTgxWdhAdn6GQ==
X-Received: by 2002:a17:903:40d1:b0:2a0:8972:d8ca with SMTP id d9443c01a7336-2a2f28367f5mr416747135ad.35.1767258175996;
        Thu, 01 Jan 2026 01:02:55 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:02:55 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:42 +0800
Subject: [PATCH v10 06/21] drivers/perf: apple_m1: Support
 per-implementation PMU startup
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-6-48812c529ffc@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2181; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=NU8ScGmoP75NTB+9OTDUGxz+f/5ItDBm5slDMiDdGlc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgn4+BbzPzmvWZ//5Po4M/zFrkKjQT2wI+O8
 wgEahlzfFqJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4JwAKCRABygi3psUI
 JEPmD/sFiwZMs7NQhuYcsTtLBMmLLgeraA1aRrIEksKSz/7IB3rYXDcntcSrfcGLZTTIgwqsm4N
 /pMVUnhEYu6wCag9SPwikW+oLIyA+dkw8vIrhEdmF8ZmoNpliYBe707KXo0pjkUQuxkjFJrdPYJ
 EYJftIe0s9FQYrwhNFqlFr8w4kpQKiHWzQ7E+IxntmQsWQdPYlsQVgkPSTIxjAJdeGrbWtO2daO
 Kl0ops2XzNpwhDlZAZFJ+38pctInGZQ7Jr/Z1U90efBoaPnrOjghj4Gk7MqL7KvHQ+DCl7PRP1o
 IqOYRKw30cZGMJBkcle5sj+k1b/EjDkURtWBt9EGr1d3vYSgsgPDsJ0quEYC4B7LFD/4kpySjiP
 CD46EcVx/ZclAF4SbtmmRrhCWr3ThPeTgKlNFRAtwQwbtcFfz8yBlJJ8GlARzEh/UrgFpJxpcbq
 h/oTeLN35rWdc32FeOephqdk7YbqymuBwWEUEjc+wpGZBN3ysz4t3XJNx2o1Mo0sscPobAehXPJ
 uMX5mrVQ1SRxeK1D/FfGxHfFMKc1TxqUrlyCwEVNAe449Wbn0Yl/XTpnJk95QTG9DcsuNd/h0Hf
 5dimwO6+AvzmtPzXO3o/i9jPLCE3sT8ezpasjGmTq+UEYimtNEaGgfWEZIIecV75BS6RXVnIC/n
 pdtZ725SgGg3DNw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support for implementations that deliver its interrupts in ways other than
FIQ will be added, which requires a per-implementation startup function.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 6340ff7d3b75d7f0c7ab159e4114d49cf031daca..0655eeaea96b46d638b0998944c30a07f3273c2b 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -661,7 +661,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 nr_counters)
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -683,6 +682,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -692,6 +692,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -701,6 +702,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -710,6 +712,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.52.0

