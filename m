Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4A4228CBE
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 04:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001232; cv=none; b=hJ+JhGvQJvwwFSMZfZqBySRfq/1WU0Pgdb6guO1vUTEmAohJj3H8libw9XWawKv3goM0f9dDxs/GfkB6j2Dy/G1nul9Nt7WClMshXCsfKJ1ILigyuWa/70Fg3xr6m34ERAYlf3vukflwSf8s6l/FbhVyEYfpeO9qBXPdeEkkLgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001232; c=relaxed/simple;
	bh=iSgQuvf9kmSTE4D2ckw53TzjQOR5RrwNb5r5c6wUTAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZOmId5lvystlQoogWBu5YZfqcGIiSX9eB/G6ZEsCmW+jFUklDnXGDVptcpZU338S3YC4VbmI/yp5PSO6X4KgrLrMQ38bT62pFEoIVAQzfmKCKnMQjONgN3zW8QhU8m2C6XaM9tXiOvjf9D/KcT//jxnbNKa/Y1cNsIJJooD5w/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LD7nXxIE; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LD7nXxIE"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3015001f862so2615151a91.3
        for <asahi@lists.linux.dev>; Sun, 06 Apr 2025 21:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001230; x=1744606030; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=LD7nXxIEIbNL12nnxDfNbnWfq8rnyxHcu/IqtB5j1XFpr+Ut8yOCc0TXSkgW3PXUxW
         uW4YPiDvs+IkH2mACQIx5pM4KtEZeCMjb/YhdLRIYNZFF310K4LULG9Mcmsi5JlbLPcI
         x6lYnbKGzGsKTecHifZbQ6Un+ZpYRPVczVbAWGU2vgfSyqQOX+UH1wiKFYjt7UxarbOj
         Xj18FdqmIgV7VW2i5iVk3ER0C/hvnu7g3dO8aqKbPuk5+KYQeUoClvhKe0dMXfI74jJH
         W9rbWc6q8y/jJLqxdihHvj3/R5I3KxDLDlxSF6JisnLt019Tehp4s0d11fkRPtJaj6Q/
         msxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001230; x=1744606030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=J9dPnRL1kQWvQlTjZcE0VifKvQSZVEvB/6V7ztHU8t4IWO5fGZXsWKMUiWQ5RTQ6ec
         txLhWDs7ienJoHP0/poTGHJpKht5eRLmBVc6C/JlaZJqL2dEby5CVvuuqsm0tWePoYUA
         0SyzLLgi5fyYBe9HSShLMCP8TNb6QtQhYZq3CJE7zkxYk2LvbXf+7CRNw4hZ/BfKarc2
         6lsQ6eJ6aIKoyaFESnP3j+Wpkdi48ROZd8kjpAUgPOnBEEz6RdaAac2vXhccL1rlXBZD
         tTpNoJnuOI/vXsRJO3QQeRg5wWqTigQm+4htnhUfH+ELCY7d9tlE4R9WnsSKvWiAwZ6L
         gMFg==
X-Forwarded-Encrypted: i=1; AJvYcCUUMFDkrnXnyQYwYoH4SFbV10a+gjvG+TjUMH4ebNDz26LcXlNtJRy0kFoI1I4f14E+rdkVGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeQWv0NvZN46AuCQzb8MTVdXhdqS8FmthsT2GMNeXbyZSwLTKK
	GnbZajizKkNroznheTI0iAH7LdzCvhRMCPiKwx+EDcOuk90N/1da
X-Gm-Gg: ASbGncsc1LweqYszzgK6z1UJjybM+LUTyc0Bu/x1MYdqVRGRbhjMJm35zr/jAvD9yCR
	n/zAqahMB1yfmH7rQh5k8eqlCI7eFD/t5bJkszIyu98nBM5k+xALOIvjva0AoPlx0ttcCZE2j5U
	+MtRlWJrFjQmJWzBw26sUnxDHbzGcYUFBPkrSsnZwcLbalUUmRu0T3KWVT1BBJMrY/femo7NUOF
	Vou7+RP3ft3fMeDrKZm93m6+GU1jM2l/EEimLxzoyI03SRBXVQBjVQBh0ldfYDTCd2UTAfu/cAK
	H1FEKc5+Ngv1pK9AcZwJPpISBgPVaKEZtcnoLilgq5esTvo=
X-Google-Smtp-Source: AGHT+IGqaSKJPQ3webd18v8phTfeS2RdyW8CSQ2+EERcN82F3onx63VuOVR+lqwdMYbgi6lgA/f3Dg==
X-Received: by 2002:a17:90b:4d0b:b0:2ff:6bd0:ff26 with SMTP id 98e67ed59e1d1-306af7b7889mr8138089a91.34.1744001230570;
        Sun, 06 Apr 2025 21:47:10 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:47:10 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:29 +0800
Subject: [PATCH v6 20/21] arm64: dts: apple: t8012: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-20-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=iSgQuvf9kmSTE4D2ckw53TzjQOR5RrwNb5r5c6wUTAU=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iI4yDZKAdu9wJhoMkGQMGWnvtViIIDchS6e
 YAYt2NUBtmJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYiAAKCRABygi3psUI
 JO3sEACc/heHWtuO02KNJ/05gdbCQFzrtSUeukVZSXbGO/W10Awaqv//7OOc70tBsW+S2sNMAh8
 JiV9R2J4VxHb/tUxCR/R9hfB60Iwz3atVzCHQqodUN9V3GseI1bu4MA3peFaw0zARzV0379/E/h
 GriUm024aqKYDcGmkbVPfJuY9lJQdSVlDkbpqVzwTi3l1N6x8f7JC7+r3bKKhdB3RO3TgKbYZER
 mSp5T6MN2kE40wxdj7y5bCEvar9cFI1Vrvebs19VR7wq5XHdGrzupDX6m9URm/zrrL8hzsJF/JD
 hyIo6tHq0OlhzsediNtFiDLJs5CXXF3/nVviFQAPywTv4BkHp+/F5P3GGhGylt8rgMvA6DbLhzB
 k2RsElsbCAUatMk+GcOpEk1JUQDkvJRjzr0ccipvON+GXDNiWnxlAaTQAL+kALXolG2O/STN+18
 cEm4dsBwJbNVi+dL88KkzoTQWlduxCrniu9GgKwzzeEfH6EvTTbdrPvSXTS/YoVAPHs0Sa0O4Pa
 NCBSnVwMXTg5xowCFEZ2dFahIM3ZzToiHMlk77gxYiv7xCaRPA7Oj6sGVtpTtIej9t3umPBdjEt
 NWHgc6pCumXxTjXuf2DtNMKYU5PdqKWGbetVl9xRpC1IK5H9iR6kZmm3nREfJrd0zmrG3dI22HC
 IDojzQ1B3jNzRJg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index 42df2f51ad7be4c4533e76d18e49a9a747b6b7a8..d79ed754c68dd89fc8c52887e6dcbbce04fe126b 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -276,6 +276,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8012-pmgr.dtsi"

-- 
2.49.0

