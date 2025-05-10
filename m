Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698882AE9A
	for <asahi@lists.linux.dev>; Sat, 10 May 2025 15:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889934; cv=none; b=FJ0RxVQiBJ37Hc0ztzUvMsMIOulGyWRLiLfBcYrHnqImZq4qwKXMWD5CWeZz9Ja3trZiIKrCtlZT0XBivME7QCheIR5TF3ZvPfY+VOFAeWCWf6JhQExKYU79043UjlarisyvFd8WRSneKOOOyWK7HiO270OaMHcQIufYhKoa5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889934; c=relaxed/simple;
	bh=LZ5pN5iqWz3OCuzIiw27nZWBzYhm/oPtBhWwt5qbJRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kf5I6zSVW7GGpuidVcvrjcLoX43hPgNdHmwfxnmnN3pctVe685v9n/cztlkwjoY2+jLb9pIUi17EUZr9CDSKMtySw+fB0gUS1eS1+6+h7wiCQc7Thaa0Q52FsKorTWllSduK8tbmoQbJFoFkYNURdoID3d/V8cn7dMzAj4csp0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsanbexf; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsanbexf"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3081f72c271so2969093a91.0
        for <asahi@lists.linux.dev>; Sat, 10 May 2025 08:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889932; x=1747494732; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=;
        b=fsanbexfAqQZDch+fosiSKbI4hu45mCJKCKubIUUPMw4lJeIFzZEoGvb/MSQRRyAGj
         mFF4b99BkP0Tfve0zZgv0tW2K2cCCo4+L6FeZvLAt6LGtBKYG4TJ/Y353QlHIfgdq682
         x+z/XykwmePI/jHmWztYjea++lIBgBXEc5Jb5Tn/hCEoIloJazH1IoZZ3Ltw+etWr7nK
         K5dDIPSyBBAPzsLr3PIgAYs5p5a+I1MMqxlxjtbCfWjjHPhihlPnzD9ezU6xNQb0BlPc
         xelRp7Ef6QRxDC66v2IQDJVRFrkyDAltyyS3eN3xPE2MzBQcx/BlR3xk00LKw8L1+4UA
         tnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889932; x=1747494732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=;
        b=tzWtLeklYFJiuUapdF0bC9GzHyOrOR5CjJG0GatEMbtsyVdEBMDQe3bm6QAUVueYW4
         omtNG0h87eMMMNwGiGE+x9cKlWhg+OdGzIERoLadtQNb0XlyepRHyGTyYBQxOwvJGQ8m
         tQqJf5RSScAB0scD7uQNlCzec9HEobR8pfWgCKH8+QyI4f3VhZKTUz8pUm40hJtdqU+O
         uq1Iib9qQkGKxIN/WIQPQ13iqqgLclFn0xpc1A9HEzxSFopTkCm3n5HTNHZA+GnqrX1H
         JbsymoaSbSCs/EyIzWdUSN1qruKlfEQejA8QD2qLVL7LkTI4FFIsP9chbHx8eU7L8dfj
         SRTw==
X-Forwarded-Encrypted: i=1; AJvYcCWEiNVjI3yLD9boHzegrMcfvgp3rQuTRCogX+/QvPzXlkRqceGDwIcR3lpeHQYNXYsddU9RYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXALPaa1LG8C74SXImIdAPMu7+bNlkAtHJ9SY9VACwjG7kn9p1
	diwdf08/gwLOzmqf5V/UFmuRx/6Pq2h88US+iKn6cQ3a2mrljUqD6x4eOA==
X-Gm-Gg: ASbGncuJpcKQn88LlRAnfMFihaWyyRm0PCRMIdG58D4fSJZEZPYDYSYyOD2+Ar5+lS8
	+84uRgIP72YwuuJxPZpmoye2v2J8PQ3bYFChGyGCcM/PcprNMqkmqxeq6wUwxRZD0zGR0vAwRqQ
	5vYx+a3Kiv/aTH8f7HHV/D6tt8qP4kyxyH+Z5FKdYeKC5vsnCamhW6jh/JYFY9vFLJl1xZjj1k4
	hofgerMPupeOLkxu8iepx8iqgVKx/KgFYksVv0kSSyZK1gU9mNNKkm71i9A6H8Ni786rIkvFfIi
	VzX363YzurLQPieByr2nmNBUnn1LPf5psppm2Fyi99MS/+/M2XtRrw==
X-Google-Smtp-Source: AGHT+IF6SK68sLmJtQC8ae8t2fY32cS0CBR0w+qieqNRm3VrN23qLRaQmpfkG9X/qBR6YMGEaFOk/g==
X-Received: by 2002:a17:90b:1b4a:b0:2ff:4f04:4266 with SMTP id 98e67ed59e1d1-30c3d6442c9mr9677158a91.23.1746889932396;
        Sat, 10 May 2025 08:12:12 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:12 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:54 +0800
Subject: [PATCH v7 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-13-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=LZ5pN5iqWz3OCuzIiw27nZWBzYhm/oPtBhWwt5qbJRc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yb5y2fqoC/fdcSp3Ef1ys5pQjLi/c/28MOY
 hzwkrGe63KJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9smwAKCRABygi3psUI
 JLtJEACGtvi7PRtgcZg5JXXQY5yb0eNp6s2gfhYT6L/7fV2P/+UfVvZzFMvdkZ8QX6Yt1RDSdCJ
 m3zmx9qHc0lIC5S/Yb5DdJ3yZo8KS4X63zfaxl1ILugx807I8wstIDyITdkEwSVxE7FUnD16kNC
 pjnrT0sEXbc/4fXECpJ/fvsV88zM+Vez/8dz3KpxhUtuPjumhUIHQzJSoxOeHPpD6DUnvzGD6nn
 qKxBaLRvpfgr83d2xzwtgUzY467Z3UBjlQQ3CYn5hk9qiLlLDxsIVB6l/88RELYFq1955W+98t1
 SP92R6N073rRUgLu4nG0mkx32PI8izDVwTXIKmMAFpXH4RGKITl1DhcLHrwxdHPf8y5SwurJAw8
 XswTwtH7IJF6S5sLwVpLZFz6wWG/4aKPIv1IhIr+si9NuXL+o0/3lNyQrZ11r7xH4lwPM/tp7yK
 HmBeGF6Ibk/rNrqBxiM/H3glFCDyB71T2uWbq2NqIMvgx2ClHHbmCYU4ZxE3wX15bquXLuvKyTQ
 o9d+ft6xPzsWioVouaQomogVD48C+p25kFknFSTqr9/DugRje3mjGDP6+ra2+7P9ecB+PRC0GF1
 lmK4xL44CvKzgIXtMBwK91lNfTlyhef4w4x7Y0D5waN1zWzhthMuN3f8SVph03902ui7vYmJtE5
 ZQJZUsxKzzLKljg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index d820b0e430507f681a5f2aa13a498be98080e1db..62d528d4b7204af28b66a90d68e27e1c78e2df26 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -138,6 +138,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,cyclone-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 178 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 181 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s5l8960x-pmgr.dtsi"

-- 
2.49.0

