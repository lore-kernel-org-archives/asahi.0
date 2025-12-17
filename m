Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BC434F47B
	for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 16:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988730; cv=none; b=uUmpNFnGcV+iaUo+CSzkXv+lHFw5lp/D+2OgsIewxxegukvNjSP/5a/4KdI7PCYILnwHbKmPwUPtS7SanvQl1BzxZskZc3d3HsJCnYby6ETqZPOnJ15z0UsJgb/6Qu9bp4N08BOAKlhQSG57WvmOn89wOq3bG8lLfQDx7rY91/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988730; c=relaxed/simple;
	bh=8i2WC0AFNRoAyJx9LwHHLdlMc3fQP5/vwmujapLLxro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SkC4nR/RwVnyYIrxB/sDfzKPy3zu+nrNTQfOYTUUOEkjBgl1m+VutTucNWFfC0WKGfPgg9TI3ja/2MbEL2sIHEgkuGw7doLzpvVCZDJT3ogS8D0rY4FX9VsMiLJlIgDSIP8nc205/KXeSG+4p1dI+oSa6N7u7vpSukvKrl9BH6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsF0c3oM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsF0c3oM"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0d6f647e2so58575205ad.1
        for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 08:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988727; x=1766593527; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgzrS6iAvFIUlLKBejM9CRNPYbscxZNKJWP8/12+9Yg=;
        b=OsF0c3oMa6ga50jOVe7PA7V52eBKObNV7aN7gq56ACskYszrS1A/3wysJgTg713CUy
         MihMsnglmdb49YJFj6wHg2h6H9yyGtQP1j7Noo/vZkK1JSlVi090MMSnjlfA3nXG/foo
         6qEZ+XbDxfpCpNviivWJjAa2Gfn5+M7DjYbGTfNglDJx9ElU7G6cjn6R362q6hNjQLE9
         3P1brWyl4v4gdy6kgaZQCKhG1NiNmILGcMap3uXc0CUuSFj3PJ3iC8iOlqpRIifz4RiQ
         qWsNTfhYp00HDIWHUgmuY42+FYzYQ+EyVokaA1yxdrygcnUMQ5ZIQv+8XQHOwaGYOn2Y
         TRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988727; x=1766593527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vgzrS6iAvFIUlLKBejM9CRNPYbscxZNKJWP8/12+9Yg=;
        b=nXTICR52YK1vwqgff0iaaTBiF6Hm808Qlr1CtaMdH3fgK26LPyAhTvVsA8AkFp5aTn
         Dt+938Za/Bu5QXMrH1BweSMGrxYsuVlK/pwXo285jwmLfKWkF3c1bq1pyNiGaKT2sZ8X
         VKdLNVj+oc0D3rxKZKCDiAsoBDBlbVkvQCJOt422y+2CKAecI9pSfbzluf0kFnxdR4wt
         JLC5M9cAmXrCS4wLCtXF0pvyNOeAopazVQPDI0oqcVrVlmXDJvpZFmTuG97/gY4D8Epv
         1w/JtxoBbeFIdmcFjUrj7gemjKxs8uZfq9R4ICQlg/a5Z7PJY+C5qbVsiElssU0LD3o0
         Xwog==
X-Forwarded-Encrypted: i=1; AJvYcCWSDB4DMw51/RAxBpC6r5ZbkPBg0Ja+ejOwhheQDoO1dD3E6xwGbI8NbdkxvKe49f4WAgj4/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDE2KRQ/S6S8H64jJh+ZJkHDwic/kO2sC9t8LCB2iVbw1mEZpy
	+/DQP4kT8FgRHKvxw6dXgS5agPuV9uAuTPMzeg8mnLHLOmWVaoUqRrHlEHFwHFYm
X-Gm-Gg: AY/fxX6r1hcys5wbgQJktVmxstxZ38zAqKWKW+GpClRGqINnow0/vLzALMTgpqkF+Dt
	xS9shHtcQoWZVO4tQFWzzP1q8p4BKeEsDBpOEpeN5rOhgA8XTlsGENMSTf5ERVo8U6ykYqV6B8m
	3hYJ62X3vUkd60lbG0xtCN0Dbj/km3OEJx6ofm59UY3stUgS1a+GB3+aHSoBzTayigMv6yHt6R0
	nLVMDPWTrqqICV5Pd6Ncp4QJ0AQcgzcvfdN6t+ia5rH3rySJWHweqJKZ8aqK361L0C76cy+W4SM
	orOq/HfDC2z5b+RacPpS0AKpdIV4Muee6QZbbJJLdnL1jPeMuXLAAlkfNmaSLEkugVyFP9GdzZD
	tHb4M9v6jAUePn9cnsFLNSN8teYeBaqYgCr/SMdYcXIJrN1yUSSqri4Tp14hoY8ygfsbvUXuBb2
	uNDMe6MBBSLcBA
X-Google-Smtp-Source: AGHT+IFB6PeNIWSqXJ8An32WcsBQUhlnoYA7ieWW12lMPDU6l82Gj5e6zJ8t+G04ZDznqk99I6dBvw==
X-Received: by 2002:a17:903:19e4:b0:2a0:c954:3bc6 with SMTP id d9443c01a7336-2a0c9544164mr151113495ad.22.1765988726996;
        Wed, 17 Dec 2025 08:25:26 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:26 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:28 +0800
Subject: [PATCH v9 15/21] arm64: dts: apple: t7001: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-15-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=8i2WC0AFNRoAyJx9LwHHLdlMc3fQP5/vwmujapLLxro=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlCclmzbQYq5sEToSOjMcDoblZHJnC01GxIz
 CCAYu6+ojqJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQgAKCRABygi3psUI
 JGC0EACgymanFylRFBZHGTD7TCucUXoM2oI8p5ZphAfJg5I8FzyKa+0UsRzIXvnt500vL+7/kVt
 S9c6jH6VokeA1GsxoMbft5KZGBkAqyk2zxOi12WMdNh4VCpBa77YtUhb60CzzoqWyf1xk/ddauw
 d4CuGVUSnE+vZhQhJHAfPiAiUvBIw4PDCQWGCSP0Cu2IHUkaZ1SC2ffq9dqXoBec7k50ltQmPax
 KN4WBAdaGiFMDKJh6UOxuNBtJFBkk2R0wclmF3+6XtsRJt0sW5je1KEGd+PAWPC574I9+//NH3q
 3NlmsUACZhKn/yQ4vc1O6gglLRYlvUpkahnHJCmgNWZe21O5js3uU2nmCAEDCOT0ac4nwozVL5m
 ZuBT6EMaf5LR22QDSRzGe2f7YFJltRNGMiVvJDu4azur+7pRxSuAohTKdMkKpQkmX82rh6qYPck
 e9H7MTwvGdRcjH1LkVKu+od7f31DxZr2xB/gRdlb3p1DVJvz3JocH4yk5IBU1sGR94tml8M6X2n
 t5grzoPFUrJLMu9YhCQ+8q8sEVbRINq9DlVPgkVzN9ZGFqB65jkc/A4jQzhBsEISF01jFTh0laq
 ooL8MG1kkdo/6ftO4VYZsYcDOyRDyp2STNTew0w9oozyoRZGsIYMGk1R+z+AiD0qE542KmWILHk
 atO4PaZduvUvvKg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index e1afb05423698223ebc15f2ae347e73fb46c7c24..b62122ea40f00a54ae42dc3cd0f864f25888489c 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -275,6 +275,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 81 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t7001-pmgr.dtsi"

-- 
2.52.0

