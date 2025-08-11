Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7B92E1723
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920607; cv=none; b=j3V9tmoeCJBQ9HM2talWAH2zrTFDwsf8RZ7ihwSXZC4rMldWMoPwwm8SFiKoJw9w4uIoWRbqH53mFV2q6sPU1Am9hjR9Hz9HvGdU0WhZp/boh4xE0Jy7/11tBViYC0xUhkOvbmraY08spHO7yQUFx6A2CuGAR+jWfc27V8PCmbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920607; c=relaxed/simple;
	bh=q+65zojFG1TGAHucNLr5jhX152q/m6db3+pGwZ+9s8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MCSWvj+fLkpbXGdANWnUzhylVkUTT2GJ9iHCwUOWTDMjm4jFZIpe+oZIMi8O445XPiMJq0eWDznthsfn/fOrJgU425Hc0qSo6wcAE0ajLb3SXZSVCHqjH91HBcSPLDBLMnHZ4sz5E8klQQ5ENYOrj5xiAauf6jU2Ju9O7UjT6l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKiN+uCf; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKiN+uCf"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76b6422756fso6117581b3a.2
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920605; x=1755525405; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STrbsxYWItkqEzAymOvwmHkPYbP8QDJrOdPBgIyV3j8=;
        b=bKiN+uCfS/JUEMkXjnRJe8auqNSkJdSr6I+IlFF3Z8945RX/MpobQjqe9NTd+xeE8i
         Zj1TJ5qMwPOZusemyacj6BY8wLBsXxxV/7wbDDR8XxN6ngzQN5Ii4cSwEraxfbH1JFeU
         VzzrSH+ldgfk8fdw0lgyvQFOsTLChWSrGHnuuQpxCo60GlxkfyyPWrGjJEft+rknKlgp
         kqpGHC5xqPoR+pwGY0zmG/fYab0+oxuASoqM0GAJRJG8/YXIeaLzM9S2u+/y3EaM11YO
         1yYtKIuB/3pnwuYVxfBmwYOAkXTEZLeVdAXrS8vnzPiJYzzCAT/HK34tVRsILnbuuWSM
         NVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920605; x=1755525405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STrbsxYWItkqEzAymOvwmHkPYbP8QDJrOdPBgIyV3j8=;
        b=Wb8NQm8P28F9k0B2rrbKh8ihVyf6CB77H9MT/bc9f3e1KNBcAuXrDRrskWP+BZ21DN
         bUI0Z76D7QY89R27hN1gdLLfqfL+xx3MgqmZL1uQhSsO7uyKOX9CdxPIDrOyhdqQxpi+
         f2AstKOxXGa65dUgw59y1hcxn1YELnan4di26cwVzlcf29cxY73QxqSQZDiLImlSVXfe
         TjbnqAteiN9QiUhphuzKBOj5nr80HhVQRQ9RexumAi3PrIcPtZNbKBw0ZoK4D4auSkHo
         O8fBax5zDhNAJhETMrV14Lbcy1SO7GmErk/IxsWiq8DjH1xkHJOyPWLB6QRDw+yXNCOt
         Pk1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUt+PuwOE9h5xEypzDI+IwH4YlQOEe9IMtlap4PF8qjBEw5dNQ+4PfyDoyb5Fxc6DU9BHn40A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxK3tezl1kMMRLySArAHG8dRiQdk/jIiHgyoMRhZZAp5E8XiMFk
	6426L92DqcCVqvvIC6PrI0rjozX2pobVeCrZdEsfhUIOj3FoiLYeSO91
X-Gm-Gg: ASbGnctc/dmRsnVlD757YYjUc4HSJrxiXSRDJMY5BQd59bQyYHi3jol/XipvlxuiPv6
	6tOLtrxsWb8c4A6GEk8NLon0MR28cxyMyTOzOLoG5KmqT1NwHCSvtfycLCwyhidQhDvq1rA4Yy4
	ODtZMelkEuEvFZtvTPxX3QBjKXorZT5IasucNFjjRGHTaG7WAkKj0JSuS7WzFteDjjkmuMRyCQQ
	JbimhqvHSiXU4KisZ8/QvwPXTHo5DNKYGmqeuktoG4Fk7RhsQ2U6MqS0HYtVJuSxCJIf2Xo4WuL
	d9GA62CnUjat0D3lVB2kPIW7K0/K7wL3grvJPvlfF9TVN15X534WIN1E9xDti1TiIDTI90SdLcw
	2NhP3CUAWpZerjLHgPo9WLFzSnjM6Cw4DLpvrMUJDiWWwEWTqW5cdEaG67w==
X-Google-Smtp-Source: AGHT+IHBD2IYxmueKQyOcCYzWNBHtwL3jKLlI0OgxIqBd6mjfZItD3c3k99yQtX3GF1PY8NI7NniFg==
X-Received: by 2002:a05:6a20:9389:b0:220:94b1:f1b8 with SMTP id adf61e73a8af0-24054d84f37mr17824995637.0.1754920605437;
        Mon, 11 Aug 2025 06:56:45 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:45 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:50 +0800
Subject: [PATCH v8 18/21] arm64: dts: apple: t8010: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-18-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=q+65zojFG1TGAHucNLr5jhX152q/m6db3+pGwZ+9s8E=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZDWavEb9dp72TKegs9MzgJCqQuluiaAYYYK
 25PHqyXvMOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QwAKCRABygi3psUI
 JGe/D/4+2TtPJxUdQMwe6Rx0KfNo3BxF4xi01/ODm0qd/4YMWc4Wk3g5FY7fiHbSmurf3T0uO9N
 T/6P6vFc49AerjPlmWzR2hq65X9QTq6PY9uom5cQTp8R2vc/vbg3ZhzWL/2m9O66imp8jsvz/Pi
 x9eTivGP5M7JVpUBqJ9LoTMl7AF/nGy1RqMaiD03iFaJhKjuu3/W/L3NvrXAkU39V/a424tks5E
 cWQYFJ4gz+XpEa3Osfp4PKRjqxlOxfHYLMRMLbpwsHAogQ0Z8k64jr6mMGlnyKOdfkn2EV3aOxW
 s18L8MWW5S9JggQoyWcbhloriXjVsN26+i1+cFTADNZo8/1xRbOdNEeZvJ5taWuyeYTZ2b3h1KU
 QBXsNb8prJIG4LCSLCIllDIsAzTNPkaNtaq+pMWZJOTt9nO0HpMDC/eZQ8tTD+cpoucPp6Q7o+e
 ED2ucW+2gAjmbiWm+HCmJ8DfXMll0rBgy/f/9B3u3ccDaduTz/CTgKK42CWMpQXi2GKdiO7Nxse
 uUQRsN6gkvsmvDBJHQPck10E77oNcK7BquLod1zMRCxqRswJTY3QbhBMc5XVkIG03seXm71w6T2
 lYs5Q/+sTtzmZRkYPE7pHyEj7kW6bKCmfD36y7cmX+OezPXuGNRUF5fzt0l6zW6bZ0dVL/6pgFY
 DM5T++v71Ulj5yg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index b961d4f65bc379da3b215ca76d5f68691df06f4d..d187fbf7e7a214cbbc1027034efd0724ef7f8b83 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -256,6 +256,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8010-pmgr.dtsi"

-- 
2.50.1

