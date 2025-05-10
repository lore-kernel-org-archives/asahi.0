Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EA85103F;
	Sat, 10 May 2025 05:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746856729; cv=none; b=jw8GLb8n2AQvB+HTwDp6DAmFePdXuhx0R10k9j/J917cVpQm1CKyHJb3EpAIpZRgArVni6Dh4xCf/WpWkgWqlqXIno0Zgu8A9eeLeMgyo5dTG2hnJ8i2KRj0ArmJmesIEMP7+ARgS6mdENyc3Q+zm9EPGVdCvrt+teC6FlBgfLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746856729; c=relaxed/simple;
	bh=Ak/3kDW2H5mJRaqud3LnLTy7IPbuS4V++tfpvlmoDKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcuf29Vp0Lcn9Sp8Qb9y0WTIn1TyGQvbrtUiS+pN97pWKVCn7v7UOdfwlTxZWceBYjBttrHXIA8jLXe16kTDt1G+dfC6eT/Pf/j7k46U0kThEpoeWUpZv0gxV3RmvV2flv+Z+nIPtic0o+B1Q1OK2SV558nfn7krRkzqk8kJeDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8XciLIH; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8XciLIH"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e8e4423ecso26402155ad.0;
        Fri, 09 May 2025 22:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746856727; x=1747461527; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZvSrH0m4IUpU+lJMf9GPrH6cvsJ1xHIQMLaVbqpMvdE=;
        b=I8XciLIHQzewpnPGpHOzDK7tXr3hnYj9ouFg/4/jJrVgcvWPtCcv2leeKf6AeeOGTs
         LGUZIpVlKfJcBA3RcN4404f3FIiJcF2GNK3HryBZ5596zAHwxDpOXBoEsq6yhJuZLKuO
         tE9L5ShCc1pJfyQS1AehgoLByg8vzTz815O9VxhJf6lta3/GH0J2e9LKbV/QHdt0jdIb
         preMgYgloETLt8Awb6KFNuH6DK5JHEedCie3JCaJhbLiPQdPSzU4hemC1p93IT9+Gxf6
         fBEseSYtybreWyDPtJwfTasb2i8lfMZEAKsjbgIo0xES97VJyeRApjA4jVwjeZzYC6w1
         gAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746856727; x=1747461527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvSrH0m4IUpU+lJMf9GPrH6cvsJ1xHIQMLaVbqpMvdE=;
        b=SKKxEYafnbWW4YwFNP8qAMnzR0PxGBxIVMuunVM4I7ZSBdX2Snxc2urwH25B1oRF2S
         Wsr5AY4M3T8w+79Gqbyp8cyKkYlkXZJ9lIBMD7wTkcV29D3sHDv4lYTumqai6KMJPR8y
         q8vGvd4C76WRyD4x8rcS4NlARCyefgPXxHCjS4CfXIKRPVpkOG6K6FCyvBsYhxbYYpBm
         8Hx2aN7JgafS6CAOwnbDFPU3FSDTgTRhe60UJc5a6l/R4/SkB+ygqQXuAKx7TdABhYvB
         1iuVjEhPWSwrZz9GhAH/3+S6V2MCmgeQksOpQl3mrlq4EMH2IVvpVHkdG0pqx7gmd9uM
         We6w==
X-Forwarded-Encrypted: i=1; AJvYcCX79rx5EiW4kbOdazcZkqzGUh5Nl7OVSw4GrdNiNCqhAskrING910xJrapuVYioh0Xb9v1WlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0q4qiYtkJYLKYrsDi8XYcoJUdlPP9r6IAMx2o46WT+bL6s1Yp
	IP1sGZFkIdF3pQOelVFZvjbehv5ewBRQsXbTFWcwjz0ecvII+6io
X-Gm-Gg: ASbGncsKm7nuuIKrlMMSlGrTqfpu9aZzCuqFkaLFnwUVx1VVBmn13md6GuX6I5/upot
	KLy0ea48zTsZ07AMbu9jN9pjm5LMl9f5UM9z/sFTKhU1JCsH6ndEnm7f/ocTieMc/ZWNmDE4iwx
	QAT99joB6hlrmKh87OanxLpt7H6vLtAjCo0+AyMZK0bMffxKYEUUQpEZMvfxqUYx8d9Be9gt1FM
	DmPRp2ZkuZQDFFTayLIB5wIVEXHcYSjDS/AGHnHTeJfbh1T5655yrPN8fVX05odCPNERbR/OuMG
	wUe5FrR7qovu7HcV6nRNrXOuClGqLGZOw87LF9EDYDinzoHh8M92XBRoxReBB6o8mrkkBw==
X-Google-Smtp-Source: AGHT+IHszysuOKe+BXliXC54u04RRE82xYLl5n3Hlqtc4Nnx4bwzHJoObH1iIIdfyb0NhtdrtlIVMg==
X-Received: by 2002:a17:902:f612:b0:223:54aa:6d15 with SMTP id d9443c01a7336-22fc8b3b39fmr105809735ad.12.1746856726879;
        Fri, 09 May 2025 22:58:46 -0700 (PDT)
Received: from [192.168.0.121] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc77413besm26910865ad.84.2025.05.09.22.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 22:58:46 -0700 (PDT)
Message-ID: <fa4f46ef-0f86-41f8-afc2-afc8dd2704a1@gmail.com>
Date: Sat, 10 May 2025 13:58:41 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v6 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
To: kernel test robot <lkp@intel.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 devicetree@vger.kernel.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250429-apple-cpmu-v6-3-ed21815f0c3f@gmail.com>
 <202505071747.2b2WEajY-lkp@intel.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <202505071747.2b2WEajY-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


#syz test

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 365b4ecaedb1..81443e5158b2 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -1082,7 +1082,7 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
 
 static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
                                struct perf_event *event,
-                               const u16 event_affinities[M1_PMU_CFG_EVENT])
+                               const u16 event_affinities[])
 {
        unsigned long evtype = event->hw.config_base & M1_PMU_CFG_EVENT;
        unsigned long affinity = event_affinities[evtype];

