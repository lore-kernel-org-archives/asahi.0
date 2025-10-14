Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB042C15B5
	for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 15:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454268; cv=none; b=ZSKfQ6vxlPjLZZcWtP7VoDfaBo+Fr2fUNBHPuqihz4b5PUAfkULKIwgND+xQ+W2F1myOACs0oMOXvjKkikijHrVMsIDAxxbOlQonf5ZIjCY7d/GF5TeCAaBr4/gStmpyrjR94cYtMOTgifvEfHQy0Zs1sAmnowNp7I/ngGB8x48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454268; c=relaxed/simple;
	bh=LWdyJWF3F8SjS8P7dCHoXr3nix46HR/GnW+584oj+64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uuGol9zYXTfDDADvNAjw+kSCWwFNgGaEir44iFmzB7snI0S8zV9kG+UhYhph2uh6irWRAinxhpE3saM416dV4P3vtGdpQKTKrnDXVJDcMYcAHKUOCneexOG5yKdWXFYCVmHmdK/rin3E33175VpY5ycUeMy5iCc1gUKaf7+Oq94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MH1AoP7P; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MH1AoP7P"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33b8a8aa73bso1308216a91.0
        for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454266; x=1761059066; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQMq4XFtoATrbQB4MivFxur0yQnArRqt8i7j0LTryyU=;
        b=MH1AoP7PVlOxpFL83wKiDIBSAcbVuF+YvOnNUmkc5EqbIhn/xgPlJolQ67igIlcRaw
         pV9ESlmnmEbZOdeb+2kLsVjyk+DtmQ+JBjya02Z+ntd2gJbolinztya6PWYZNE38/Qy+
         NaBfkPHdK4utaGMLpEMYyBrHBOuxcMcnILUxomhI+diHwFknM0OsrSRBTLjZSI/fVduq
         H8qbPJLxgoOKSFFQ0VChF87frWqb61u1a+x3A9QFIac9078Yn1k0HosbQrexnm0mjoxl
         qFhLvikh6IHpdSPO2FMMmLY+Qf89QJpSHlEQnUuelCgYJEK13f7bsyFYIxmECwcYpv/T
         P/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454266; x=1761059066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQMq4XFtoATrbQB4MivFxur0yQnArRqt8i7j0LTryyU=;
        b=Xsn0QBMOpuRYflMjcDR6FlWZ8RfdzpHrpboVmtQGtBOy5QhZJkeD8/+pX/BCMsidnz
         cmwi2WTEHqc8K34H2W9nhS5t6DvDhYtvoMtWETzvmnCBFAvmUXcIrrvkD3diQ48Qbfiv
         9vysSOpFvun3UO+y2TVHcRduTXAFjuhLmjfSSP+ImkyIv3m+zyVgzU+1FuHt4CQTw2ZF
         NXlfnWN6HspGuC6uulzil3xI3LRch53Xj2OchEgSMlfAJ9YjO02h0+8M3Qw83mENbEx3
         GEnO5SD9regVXR2SXQHBtlVn/9YLS/pRptJw11V+TL6uUH8mSsrEQCBnenLj/gbzSD7H
         II/w==
X-Forwarded-Encrypted: i=1; AJvYcCXS7v+nGHzp+QXIozsepyX8t9mQNm4iztlLl8Q4QAbq1DZ+VeT4Sr63rQ5JNhOZDzSuzBF5mQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUOV+jxqRf4I/RaJyZgFEWNrtM7rn6JR1XfO79ATJW9VjjR0sL
	INuECYD+FVnJUFV/Ms3pwXgkrb7g2AApotIcVJcLjpknTSj226i6x1Np8qdieA==
X-Gm-Gg: ASbGncu9FmNYajQg6kgKuwp4JhFzvIqVHYOTH67sOZXH2/Ds1I5BNOdSkfhkcglbt5M
	TqYNGuyNCUZiei4m620aOQp01iG2AjHqTbBamTgmTItAxwatLqD0Vq79q9Gn/x5FAnh16lo5eOV
	93eP3pb9BM4Eh467M4rkN5ASJEi+7y1Q79eT4IVoT/PjnSKAW26vgiE6M+SV1I1qSyl88x5W+jC
	HqE7lkdpeloVg5h0rKEPu4L06pP6k1F4fnMYj6yNXk5oK1UewAHdaBgkRKiQGBjNlwXtwThaWgz
	4R93wH76m3wecj3jSz/taGUdW3npMrefS/gtZpfgaMy45Uq9aG2R78e04spMrFdmE0OddRoKWxp
	+spmrlrF98YaYcRTKddE4Ru7gK1zRVk4Yp90YXsNbh7U=
X-Google-Smtp-Source: AGHT+IHH//oGG+duDcarvnMpMCx+s6l5ttFKPXRC9yiM8WYuLiLPNBvTpEmaQ3ZPfrfAhgmB0mtrKA==
X-Received: by 2002:a17:90b:3812:b0:32e:1ff5:5af4 with SMTP id 98e67ed59e1d1-33b51399fd8mr39464227a91.35.1760454266031;
        Tue, 14 Oct 2025 08:04:26 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:04:25 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:35 +0800
Subject: [PATCH RESEND v8 02/21] drivers/perf: apple_m1: Only init PMUv3
 remap when EL2 is available
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-2-3f94d4a2a285@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=LWdyJWF3F8SjS8P7dCHoXr3nix46HR/GnW+584oj+64=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZs9VdcsiLU/uSNPQdxREbNvTvb8kWSvNL59
 LtT9fudemKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbAAKCRABygi3psUI
 JKDcD/0b0EZQZCeoY92NSoIoBkRH/0fDA8xMHVxYUbUWvKC6BcMtgc6zs/pA/xvkRD7bikc77mR
 VN4XBPEtMvJptsrMqhUyZgZECmFqTIDFUhkX70YTbOlS4wO2Zgji2nmPi5KDfRhPPxuhLJ1ENmc
 VxKSNvir1mUHLXjcIdUczGpI/zJbWoXe0qkAXJSfeebBYqLrqy6648LbmiHe75hFC9x/sdcuOs4
 Xc8kbYTBWEltzNCdwZxlUcOfCkncmP8MeDceDdERNCvr/4gMVafJDN2LKFHFtOCJzPO6d9eqB5U
 kt9EO7uANvrWPdbEzwhfKpna75FRKRM9W29DRg+UiebgNWkjvYmIeSWltMzCxKpmh+z1c9hmmJs
 vBThwOE4m9hj9OpGeG/U3CDC7kQTQwSni+zjScWl+Vh87lSgtDMsAGGfNB6EmOFeWjv6iAqiF56
 FGgmENFXuXwkJIo/oZqxLQQoBI14djgjy4CXCkLzNw+cMZ1C/6Mlo7Mbx/6QrTV509IHIAe/Xjl
 jk4uAnqz3ZF/m2MQCJDVGfUwvcx+Stst8urbES5JHS1VEvDNQnCGDqjwwznZIdLEOjfQJMlAANn
 DMZpgx/jNhgPayfdDeWO4nppPt0oJWaqMAWDLpAjF8EPq3QnYJoVhnDN5nqePga6IYsXCiPwuIh
 iNGhEoD3WwLdm2A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

The events in the Apple A7 PMU is very different from the ones in M1, and
EL2 is not available on Apple A7. Instead of assigning the wrong PMUv3
remap on A7 or declaring a new PMUv3 remap that would never be used in
practice, skip initializing PMUv3 remap altogther when EL2 is unavailable.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 81b6f1a623499566ef04d04075752f34e2cb6a92..f3948528e28e0189efd0f17fde0d808930d936af 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -645,8 +645,10 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
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
2.51.0

