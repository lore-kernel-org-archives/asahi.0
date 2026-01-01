Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C5E28CF56
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258216; cv=none; b=GfmMA816DVMosn/OjJfZK4y7z0ucldv/btr2qZcPkckIM6ymJgk7YI+G8lKdeTwGLlPyOvXFcSifnkNoM7ucLJqVM85CkgXLuD19ZrxJp/mzujM/agfekuE6HRTwDKocPC+DEeuqZJmOLF7YZYcMlFAdQ/nZNxehjC9T10efuCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258216; c=relaxed/simple;
	bh=PzJR4btrOIgWAbbA9/PgDRkfL56Q2zFHfShoVsaxiHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tdkO5cCkR2VdSEDehVEIYcRThYiF6AzFLgsa0BBv8rm1RKYKvhvMlc66Fqwgyrg8LgsB/xG2255MQ1Z7jvUHxwg0d2sIk5nlv/cQNaGcqcsLlyH25/WlCVzJKjUD5VupghtK6K3lFJ4eARUQfn4y42PoGnhVbT+GHGBjmuCnKAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6EnKzUt; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6EnKzUt"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso13359142b3a.2
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258213; x=1767863013; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XIbviOhDk9tWhSGjjMU+OiN82Iat2rqIxD675mZ2oo=;
        b=I6EnKzUtAq0aWXgSiOzChCLTQLqLd0E4cauPYpGLDvOK20uNOEZguF0kptqdbf0lmM
         FJaTr1X8gBwEsOv9o72rXiBTECGoKmzLm/G5O2dGr/clwBRHDFziInWakw/wSoQaW2v3
         1JtloBReGvwwuHzrBX0Nl842vNactobi2NQUfn1h1PV0ElpMLyPyT72jeoD3SrWvktWq
         v2mm7xH+mfdWcJMWng/Uy1sw1BhTMSR//dwU6EHJFjaJH1HjfZuCnLmYhGMVRRnNGvqs
         X5vlh7+YmmgvDniXfmvBOQH23QKspQv5ENVErauw224NjFzhZQiq/cZsVlf5nJBvHgbZ
         cU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258213; x=1767863013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0XIbviOhDk9tWhSGjjMU+OiN82Iat2rqIxD675mZ2oo=;
        b=tJW8oOOdaYnepc8mBfsfxWXKeupP+nO/zBM7705yjcqPuoo0tFTpPg/1yBByM8De46
         n83pL3uZFSmjrXG3DYqvFYzROvES62gK/TJKnyN/YYcFAFYzEvVpzbMaR02n9lyIMnXE
         ThrDt1KZoScxyx4T5LB7BhUWJdobB6/s3ioRYZFgiHgBxDsCtibfD+WYXIsm8rE60USO
         2EchaTOoXtDOiP1a0TRwFG+/BUcgGXCD/pnMdJWk391NYB2DkeMJ6M5wsNjSkYim42gl
         ceTK2s9fHFZB3JvGAf1PZG1huzWPt8P8kCenfB9AAuWadeCyTrEQRZ4QWfSu+Gh3tOeo
         XyIg==
X-Forwarded-Encrypted: i=1; AJvYcCUXkK2RYK9dnKv2JotTFDPpRKB+16lb+pgDZtc8hylQwpYGtTYRGDpSelMM9D+l1qIYAddYhw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfh0H6YFiGdy04CDnNDRT8i4XrgvA1/3UZv4gYoB1ItO0xg/ow
	DSbx82bvLFl1hsMOKQmR+pWGYao4pSSfDXR0HkpkAU2PD+DV1Q+TM7Sy
X-Gm-Gg: AY/fxX68Pqbw+huGVUQCngkZDTWqpLw1LwVIoubFWccFavLNHoU5JCxT51zDtoURl02
	OotKE18cXtZfFwMOtLyVmeemTxEbXrbeVczogCaCERdcaM9UvscWS4C4cCkFF34kqt7N9VdhKrZ
	zWW0SoEiW+8p7LMy+GB18jZe/faRTb/7Ro3wXZasM3DLBp6z5sChpA1zvNSrMWuOyq32m8IULmH
	E6ua/kR+6o02reQNqfzcH6FqZIoDe3DfCLXqq66fizdWkMPdvhyt7gd+rUzLGdq9EE8NLN1c0IM
	xvW+xUURDpRFBhT8I31Gt4Fi6WpFPBTToa2x9d/U53mqYZpjfQZCJMuUfSXBgcqlN467dSy4Rzy
	/MtGq2je7ORWybSba41tsxyQ+TY5z+DTAWJ968tiUavLUClGJ/sC9z3AnSMQi3fWyZn80HKyW1e
	VqWpDGoBfG+JR0
X-Google-Smtp-Source: AGHT+IH4BL4lHRkhONes0fdA+rHZZ+C01+zvYr+yNbWzj90rU1liW8WFWGCqkV1LgfbNxTjIvc81bg==
X-Received: by 2002:a05:6a00:ab0d:b0:7fc:da5:f849 with SMTP id d2e1a72fcca58-7ff6607b356mr29575181b3a.39.1767258212664;
        Thu, 01 Jan 2026 01:03:32 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:32 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:53 +0800
Subject: [PATCH v10 17/21] arm64: dts: apple: s8001: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-17-48812c529ffc@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=PzJR4btrOIgWAbbA9/PgDRkfL56Q2zFHfShoVsaxiHQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgoK+DoXHphAWKwsrnBV7SEEWyskBmkLmcO0
 34oC6Ola+mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KAAKCRABygi3psUI
 JJlMD/4j+35bm1G+5hjgR8AIua2VY6BzbY7LRgxLVyF+dm2Vb2IetnHbkgyrOHUXp0nZuKUSEzC
 +RVJwzOuM3ayrzUaXl5OmNSiKnLtz67LQA2nKMnITYzfyO1wXuEIcJTqpk9qacP4miFMGeCL4Nb
 LOUwcoH/MqvbQA6VAuYB4tWCSviHOisxqRjv+nS+JUkvBw6ePeF7sjHvOEpdvgNjYpR0JFUs+p1
 yem2nsi+rRGV2z9nBqLu7Os+0IK2Y2QCkTkbTTsfKYMXdqcqGr+E7+Fn8DxOaGEdYg1FF1i4R/p
 Y+z1hpbC3jxKS61EKRrrzztRqYabktsMdcSJRgPuygZfbGabjjjy21gnXDcQqOya8dTEb3Apwun
 4PWNA6mJz1vmDQGwjW4X3oe62Dn92c8TTdz4EUgFNyp9t2VHbyL7KSXlZ6PYBXeXr+ULKXnG1ql
 jXugAiTWcwNkAIIVzFuEXAc/1G7/fQd3RzIedO6pkFEdG3hy/zS932un24FA969+xAYb1vF+vh7
 WAd4R6ByIczyEgvTyOmq4rQq6Z2RV8Q9iLaYsRV4ZciimE0h6eJw5MPy6QjbYQTql0sKttYgAH7
 s94Blmnncp05d2unlK1gK4b04CMteufpf6uOrTLbDQDmnGw0n+tDJm0Na4S7qTWu2XTw9mcwRqZ
 vqTHTsH5+i6w+1w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index b5b00dca6ffa4caa1d504860693da001a8ced80e..83c5c479c87fc1ae1bb7c6889aed9a71fb55d29c 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -298,6 +298,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s8001-pmgr.dtsi"

-- 
2.52.0

