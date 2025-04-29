Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937D3277031
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 03:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898264; cv=none; b=nvIIue2lrL6TsuosZqepf4gUJM4X7AgYrUUx8vOr1n3wTZK7whofBYHNvRshjA1pb+HAUhc3sccZiHaeEgumabvSXhWxa/ApEimlLCKXX55yFvDrJna9yPWrY0YdMlzxPXdAyYnH6AJOr+s8MpiMlx3bOv+0PMcLPzj9LPSVIME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898264; c=relaxed/simple;
	bh=LZ5pN5iqWz3OCuzIiw27nZWBzYhm/oPtBhWwt5qbJRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbm1HsT0HOZGdtLQMeyc36uKK4uEEi70nbkSOYlwPMoJZM/XsG0GBAXMKCTB927RMyiFU5jNYHUFIugBq8i00WIsVRLtZWrPN3X+P7JWnZIjs7NhXiD9oRjcSWfKkuFjjzI23coWK1hYdAJy99+GAeOvJke0h+Vtxyg2i920+Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDxSlUtQ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDxSlUtQ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-739be717eddso4567523b3a.2
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 20:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898262; x=1746503062; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=;
        b=JDxSlUtQTXL1/2g+0ExAyILBYzJXU1XWrek56yUt2MdV2+xhawsyXNiON8zqxeB6qs
         XJygx3XGvEmLi3gzZNgc589rjJws3Lv2rb3qwRc4fBtscr0+4xDgvgOIekJB2J/O7cgT
         KhtznTqIuzNY90MxJZY/mgsqbopHS8DBfVuaExHr53c57wSY9GqDk70uf1DJL1OKxoAM
         zcTxZ3cHKMo93crssBFHliRoG+/gkMeLHsJpYNwPufUr4+FWK3NNMcfOmva6bslyBYEj
         u3ledvTKerYU/gYJERJ6libsYyBOw8IzLpwY8/GOGyZJBptS4+ScfE+o1mjS4F463TJX
         750Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898262; x=1746503062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=;
        b=aqghFo5dmkm1s/45yH3ogDEcKxip4Igy9Q6d14JDzMcUrzC9dzswf04SHzKeVfPXd5
         8sJD1NLME04UVeL6vS/weCxngIR9sNZeOjVunwd7MPLdGnJp7k3CItOqX8QhUIumAUb5
         +XZsWDCOLgPr7OkLq0v92ghMFl4yLhnciEYlSfBzj4VaTi/9SfiZf85rkN8D1IIScczk
         1mMnS/atkX3Uqnj9Sawy4IXFv8Pi2/ENmdz51TkEbRayEGMpKZSEOG5H3fbqGezLpAbx
         R3vYaQXUOPZoARv549XS/yeshs0XNOsZb3A+OFGU/pHtM3QotpWxBxF8vWvtJRmPjl8H
         WIEg==
X-Forwarded-Encrypted: i=1; AJvYcCUmRQ/SQxR+WaVWsM3412Td1DZlTa7UW7W9q4tlqfKKL3i2iKVlpm3XP5yiBTsck8uf3+DqMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsdsAAccVoRp04DGdO7FI20g7AUU30LVeeFUZRHGxtZhf3Uwiu
	Imj7R4Usc+jpT8VGHYKE80axtzzRJI6a406r/dsZTmSUfr55C0Ap
X-Gm-Gg: ASbGnctEPYidR6/Mt+GC8QRQyQaheDoosz7EVZdXAGdIJYSWXdPy+uxK2r02hvhEJ1/
	43t972NJxusosWPkrWRt42spT9A/Ph7uOt0p3rJPggDg+5oXeQ3ow6UATpJH24dn5JS1fKmxhJf
	kDK5AzROrfC5iGjn/xsWhwW36b7PR72knH+0JS/R0Cdx2rlXSmSD5S+UB+NKqve0u/adFzUf/HK
	7u8BoLoUABq1l6NhuiXyHzYo4VzH5ZVj5MqvKJoHkM80K3he9uSTj00DkNr24GkYlFpuqv5ssuY
	UcSNqxceMcUR3+M695VrqS/Pt39N7Hs2Y4zFocUmqNDQPCmYI6UUla7fGw==
X-Google-Smtp-Source: AGHT+IETjuI0siCRS9u2pXvps9EUIDQ4wR7KluYQHkBdrJXS9KMX45n+wsExNcKlbrDR5a+B01PX7w==
X-Received: by 2002:a17:90b:2750:b0:2ff:7ad4:77af with SMTP id 98e67ed59e1d1-30a23de91d4mr1580390a91.20.1745898261883;
        Mon, 28 Apr 2025 20:44:21 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:21 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:37 +0800
Subject: [PATCH RESEND v6 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-13-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErlfTyUVAy1ePsjHsSm1CJiFAxVuwctbhmdB
 xH4ukXVRrmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5QAKCRABygi3psUI
 JEouEACzAD0sTgca0HLK6vqrrH2FMirQbIejbUzE91zU8/GE8ilbJPoJabc4+Yqgc20c44LHZ0A
 Ak/TsqoF6C9ppinHmYUuu7YiRF1vsG0DOgF+Ge0crlrxgwNyh5bk9tBPKkSjXMZ5glfwNI2i5tl
 h2ylYSy9PLj5CrKZJ+QQ1Lw8a+1qokfSHdzYMAxURp4fxyScyjNFCUN/ptIMaSbZAf7D/64EJOy
 BNH4hiqY4W9d94cr58UUxO7ZPxPQIDfKEJEhpPuHMix3Q+nBcAB5wUZEY1x6BGR1lYyzLrSqCW5
 aV75k4SHDC4dfLA/2QH549hkVWy48rSYfcpuVhdsLl3Q7NjJobWlZ/GP7/6lt1e0fZ1elGXxKRj
 ET+Y6WzpGhTmloIPF/Eci/U77IVneCcuO/DzHCXFtWCjJwBSMvnsV2mbnUNf09Vsg/sVVNxbcsJ
 0ngrGAEc0KcbN26+f71/VO6bMG0l96zXAm16BTklsWaFQ7kZ+M7wMg1L+vghuFFRnrFdM5kgOIQ
 FmsrgdzyVDo4B+buorhmXNlsICqKg5iHCYFhWPvHwXpqoTXVVvJSYa/K0R/y9+4xLXaw25929o2
 WvZbnvYdNrSeyq2nXtwnvBzrNP3QpY7YFMZCrtDNf9xAYBheq0y1XIn0UKHKPvR4FGy24DH9KLR
 i3JkZ6ljQoCI1qg==
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

