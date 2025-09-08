Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF983019C4
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 10:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325725; cv=none; b=PFbwhExlpvyED5n71xK+BpUNT23canAumbK/VCfcydAn8CsyFlJmsM9m5XX1xARoCh+4bmdRmtLne/FKdoAu4e0NUTjFcMyTh55uCoYtSOaquoDtZ289q7TbZtn5aNQ8fjDPZNnwKYoX4i+WONbDmo5tz7bymjpCm41gsmjX7qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325725; c=relaxed/simple;
	bh=q41LAG04mQN+h/yjsDMGUnk4+iW5c6zrOTH+jcEbjrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cz8orb3Cy4EBXfZUjKXTyhueU4V1Z/HtU8OMsgCkGaiJx5Tij3Vfh2TuUmdODSWn6AwvRAMx8gvK4Q8DYKdqs8kW+AOHiPtfBb8gcmVQ3txue3pfGPKfhJHSqhe2Uz7wORpjHADuPJVab868pTk9HV0SNXnAxzyDd+4IXYSxl8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KpDyyO9E; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpDyyO9E"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-251ace3e7caso21645975ad.2
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 03:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325723; x=1757930523; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1i7iqUxmgg/DXwXQpNr1KmCqr3Rj4mhCflPyxgc9Us=;
        b=KpDyyO9EAIXFMh282a/+L2p3FC4vLYu8ivR+mNZ7UpTbH1XgzEKLqFc056Rrf9qvKZ
         Q7J9uJroTVD/gye71/iRjqrexxaDrkyZV+XMdmXfOBANgLNRBGygPBHZ5iongQ5aNmRZ
         Sa4HMx1n/H+1AyS60Yi57s+hg04NKVXpiGcep3u7GNY9eGyI7D5fAy0VQ1mFdUXxpdhU
         dajaEDxZK6dmxsIjCbes6e//LhT9YDQftbDa6Z/1GCvYH4fQd6Gn9tdtfheSVD5qkVwB
         3xwgQ2e+U4U13bPLCBgVFFDZz3SGnItiqC12zIt9YuC++/d+Kg7M95MAp0xwmt1tHlV/
         a9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325723; x=1757930523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1i7iqUxmgg/DXwXQpNr1KmCqr3Rj4mhCflPyxgc9Us=;
        b=fAkGZj086z4wNR+O5ssHO6FP0lnFiaPrHU+majUm+oCnbLIHpPNswfuL5gkCSLS+hd
         u4VqxfKLanhqWr2g7Elpby5nbJafGDOQYWFmahchtgBLRncT0aEjhwbCXfOQlpSKdYd4
         3q5FRLo+5KzMpcxIHIbD3dQhh+xh3NapvvdjaY6bL9XiDmtXXFTBrKYFcOy+d6P+Yc/B
         LXjjE9ylWQ8Shbjn7Vbn6pGhWgACYyduY+yF2Ky9KnrPAUqaJhG+xN9e/IhImEI8rifJ
         IQjzGvKCmm29zVp5yuOYd4Hatfrv2t+Bi2vTGSRXavJR98gsgS0uy7mvq2gkjfYHn6BG
         VLwA==
X-Forwarded-Encrypted: i=1; AJvYcCWnuu9nXEure1WVyHfizKeybHgaAVhjJd6vtDg+65d2XpCI9NlfjH/35QaieohH+ybyTU0e/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuuH7CCxoDjqNJmiokuGFxuFpGD2Z6nwXDDOX6IhAkzz4wvOEy
	oAlHAbtngaio4EZU4NNaSCovOSEpJSwH3QQzizIyeuOrBxFpSIsqUxq46Q4SVld4Xfg=
X-Gm-Gg: ASbGncv99Y7tUu9I7awvHQAJ9KqnpAE8gc9m4G7hMpQFNlrkxo9JOD6XJvbXVqt0cdv
	AAnWaheUQL/njEOKST0xy+3aLFjqVWn+uhQ4OEHgMCDi508LC9y9NHwIHAODDZvTQ6W0mfoYKRx
	bK8l/8ZTTLb26R/E0Thydfzyxs5RmIituf73P/EhW+Gkeh3lQIPBQOZxUwDupWBKwn6rmaDPSEI
	FHdkU9wjbDtLbsb47615/5LIDoe4hTwBwQ28WMZU2+p9MRdBHQBY2PRO5CbqN6QeB8cMGdnnRhL
	VtLxVg6uvEMLGZE8r5LHXOo8uGyqQurC9BAviMlJOLEfxx19Y021lLFACcyjhpOinFxciIoZIqU
	Z5SiVnfA+YPtrk7MSPlqGWTnwPjQ=
X-Google-Smtp-Source: AGHT+IEephzG6wPv+SDfh/QNJZfyYYZEGiN9nvrRGlXcpvwgSrHUd5DTgv1ApG48nCxk+8qMKPMzuQ==
X-Received: by 2002:a17:902:ea11:b0:246:e230:a99c with SMTP id d9443c01a7336-2516e97e544mr97305725ad.20.1757325722576;
        Mon, 08 Sep 2025 03:02:02 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:02:02 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:41 +0800
Subject: [PATCH RESEND v8 17/21] arm64: dts: apple: s8001: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-17-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=q41LAG04mQN+h/yjsDMGUnk4+iW5c6zrOTH+jcEbjrs=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlFdIPv4SPsQfS6q50PvS6+jpXMZuVxHeFTQ
 rKoKjDWLbiJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRQAKCRABygi3psUI
 JD1XEACgJgkU1uz5AspTlaQ/vskTVHNVVJbTFwN29DKlUvF5uCFpzsIXD83ZajprFY2ZgAlL2Ds
 CZmwmM8JvwbHtT0IMBZYLkMj4V2j8k2fQYv+HoThtLD7q5t6xkkqIHkGQsth8Kp9bnTsbjwAy2N
 eXy8BKTMHlHMbBVNsFgws/1FSIeQgDTSquG7I21zxR8dZe0tIZQMy4q7b5QqLPEY7pKgGzBCORA
 /hfEtDf6TrAIHmSbfDL/aJXylc0IXCHZATjd6jj4OWhEVO2vSO7jBJ7niapmSoMPyDSN0ISzfd4
 wtD7pmHaw/ojoSYcDzYQJQDtCraK5PX6C4DHS2cdGbAmJo/iSbGs/NfLfGA1VU6FVqJUzPHW8vF
 HGrDmpPQ3r7BlfFbYq+hvw1SaEAKFAKCUwoxd5qNXnw32G/uSwnNJ01tsAFvPrs47+mN7fX1Owy
 ai1rjW+8cJKEx5rscsq4BER7DcBLTUUffna70buak+VESiKYCrU1UgejvJob/E8BEN6oHkY9kHQ
 sNvmWfYy2wAQkEGYzDSpACkEW/32J28diUq7GoWhZk2ka3Wqo2xnKx/PnW62VNpIMaxHOwoR/52
 yA5zRmSLUR6W9+oY3gNkgF2YS1F+5tcG4P4o/DUztQZPQR2SNHj4nu1HPzOX4LpvVWVWR3aYWiv
 lV/Nos227stGHUA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index fee3507658948a9b4db6a185665fdff9f5acc446..ee2702fc807b678023915f72b5276cc5a31e1222 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -222,6 +222,14 @@ timer {
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
2.51.0

