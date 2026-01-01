Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F24F2820A9
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258166; cv=none; b=gT6/GvqAkNCt6e/2PZ9pzNiys2LR1n8GKPQ4sgSd8nas4LeKtIfqZgbn03Ttr8cpmBmOFdWxpYKECtDaE6rqfTmAPnAl3Hobesjy9ZcRbWqydaMg3Hi8/CyyZO64+seYugmMfhF4B8zA9OgsmEbgaNYykYSG2dYEuigqtiPqf1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258166; c=relaxed/simple;
	bh=T7VIuEp6hEe3RkCETbS7KqP+//z7d2ZDmQMS7i30tSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbQS6KQICEP+4nmxfp6CXDJ/SD7Ft4ENQu+4thltWtwEdC4GoauxwlSvhE8eoOy4exGh6trlROYefYU9qEv0zGuCuKIrDJWOZDJ7yMHd8swRRxewBclglKAD7+3LFzqTv9TT6AJJk8/5cEz9FlkNoVb1GWJVe666OYZ6V+uJNaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Za5X3LZ/; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Za5X3LZ/"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7f1243792f2so7606003b3a.1
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258163; x=1767862963; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnmU0etDq0lcWJuNgsoBFmFUTXG/dt5JQHfVECxG+u0=;
        b=Za5X3LZ/7sLeczIiGJAa+D5QvIT2z6BOcgyIoT7c0AEMvaJP8CE8GXhgezqY2dMEmx
         KOkQy5CGXKCRZz4xe5CaB3FVCT+zb61/yQ/PRDYN15LgvJNvGeDUcnoJVvw80+Qq24OV
         S7DvctA8Y/ZvtZhNclpVuaTbMICyKsPI2pN582yz+dW0dfWvE7MOAQj2DHgfA/AezHO3
         Ps9fGh1FD2LxrVIOEZXpHbCUJHVgr8VhntU/c4HpAHDpn6sR6rlBFhNBSBHSKwXIjg9W
         hTELkt1u03nhPeenVHAPwFKPghAzyMOM6UA+t5ILokOsWBgam4wnjCXZJRebwhPTyeYK
         xHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258163; x=1767862963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gnmU0etDq0lcWJuNgsoBFmFUTXG/dt5JQHfVECxG+u0=;
        b=EyKEQMSSND+RwLYro5W8Cd3BpmJ0bwEB6eJeFMz7yUQhEnpERPeFOMIE0m5lgeEpI2
         iayH/gYzEENGj3BRxE/NYWDBK06GYSBGYvfJ60cYvAFc62y3SORpXT1muDoi1NB1l4/j
         8l3KlGR0MVT2iLn27jsACxZcd9cQaKL/KexWudGLRIQkhnzO59glpx25avmNwsRPaUTp
         TWyYErksD4PT2KInFeJhkhYXMXAgYAadkA/AjNO0zkVxTm9iNfRM2JDZe+wqszMBlxGZ
         gQGy21kqAOH5f7/G3A4fZWDdtXnjLj3o1lmGrNS4P+nTIqb8x2WKrEM8fDFszBSZNfgi
         Mkzw==
X-Forwarded-Encrypted: i=1; AJvYcCUglTb8tg54KBBexajuUFNJZ4pRVgeTT4n7hGgl8bDm4C6D5ZLmyqM0pTt+PHGjlAm9bR941A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg47vU9n8n1YgbH+VmLRhw5ORiTEVKOr48e8jV0wqpkoZNhmOv
	Rp/HpbBvJ0wPBbGmS9bIvEjNKYNuw4752EoRmTFDKtknAFv/xH7gNCsK
X-Gm-Gg: AY/fxX6lUGh0iuZudiGnUddp7okMq20qYYd9VSIj+peItbcetkQD/72QpGaAXDzQRsO
	FK7jBuVBp7BWfFb3DKwH0MA7IhrxgLRpNNzBduYnOrxSuBSkbFhPhuunP5bE/j/3e2Ml9D1JdYF
	jjPv68WF3z1kjyDnEX8TjmAagtygkGVNU+oAs82ZBqFF6iGDGJtdGcpI8dSm856RaCwpWxqjjGU
	aPaHSYcOHxEaRXUI+OsbaZSVDJe6zxd5V5jUxG30VCwbR0J33Js2Ovik99uF3mpJK81E0ihRuh1
	7UqaqgHGDiUhTbscr8onIQmbA1HnwEW/1/hHylZTkZV0tf3A03UMQgBPjaGssyGGJamBbg20Skj
	YuwakFi2BnVFUL4kvDTa1XSV216iYZf8wObb+kiYGEsTGT4gI8DsnIJC2UbPBhOojvDFSaV/mlG
	mFkqOwlvMDuHa5
X-Google-Smtp-Source: AGHT+IFmkrWKS/7FmmxYOa2Rc6IAdldSe0vW+VCQopk2Z3V5RjuuRrxz6yRgFXBslyCW8xVE0ysndA==
X-Received: by 2002:a05:6a20:9389:b0:35f:fafa:a198 with SMTP id adf61e73a8af0-376a75e8a87mr34983779637.10.1767258163369;
        Thu, 01 Jan 2026 01:02:43 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:02:43 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:38 +0800
Subject: [PATCH v10 02/21] drivers/perf: apple_m1: Only init PMUv3 remap
 when EL2 is available
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-2-48812c529ffc@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=T7VIuEp6hEe3RkCETbS7KqP+//z7d2ZDmQMS7i30tSU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgmcioDFW/cgCyqzljV2Zk1HIbx3mEdkkvCz
 qn5UQHjIACJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4JgAKCRABygi3psUI
 JGHYEACifxfNp4MaPvu9Ha3yNIOsVV8p76VKZFaIJFNpIC2Zg32i/Ut43TnFCiS8KNa/Z1lMnvH
 qO2YUVuRgPglNl5teGrwBILvKrc+4Mfr5cz/z0PM3SwzzZfU6ErE0gSfIjTjLF/garU0bJFiww5
 AhIKOOKrQg0sSuyk0+5/j7fdr23No9zE0cUYiaPyyZ6PsapXl7uZScKxqxv0UJ6otVAjdwDyK7Z
 yF5hb+lc24Ty3SeSNKwx++AeHURmH1I1f4lAGa3bMtyLrhd+xISa+eAMvPlWBSmp/c7B/ag0KDJ
 newogHd+vtN2SwJWTwHI/w3yoSRAuqh19czHPd+V73lGBQnJxVWHXrDFKPoGbHvoBPfQYkuTTwI
 nmwi3Eta7gpDcEOhBcX8n0fNpkM/6vliM3cEK0ZTsZQ61/eUZdrpJogIPCB43iLAkFJX0Y8pKkE
 Sri65VYBlADVMF9l/fcPp4Y37troNgDsNsiLhpRF+kZe+2UmxnE+TbkKd23JKopNYQ4blJUZmz5
 y+M7KTk69CdhgQp9fD1LmQ+8PpIcOf/qFrUr33awtQ26sF5F8l1Wlm7zDriYpBRjPvpw1d86YqU
 uWW180xDiOmD258mV0eFbE34YjS0MTPFY+HNJc7O7QiVi3C1S5D7b87hGnIlnFPSp8hLGbzajf4
 8iYG31jc9OUZNiw==
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
2.52.0

