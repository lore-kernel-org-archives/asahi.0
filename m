Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389D2286416
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258205; cv=none; b=Zc6rFt4rF7QIvLvqvKNBKeOz6PfLCkwIMP/V9kfZ+zirI0hV677cg3Fd9dZXxc4cva07gD5qk0L+C5IhoroJoGkywwICcRLe6kvrlcV/rqeprno4fKloWi8PuuTVcE4GHpEkCI4Q9ZAgJfkgxz2sOGnSmfEj5oICIaRb3wg9mHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258205; c=relaxed/simple;
	bh=xASpZevNHcaVzYbv63kfOr+Ypk6TFwui56ogxDHDMcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PrF5T1fOWnMRJ0ozmCpm5P1iTRkzQB1WiTMopBba/AIVUrkyp9fv7Nyh/GghEwasR2JNLDkblh3Zom7zhkFpiON2HbVQWCTMYm7rSjqohzdz6LK8O3O758lIAyhI8cuPxkNbydg0Z2ATcYwriLdE8HXs6GOsVSfiQXxXIKKRdI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cH7iKxqz; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cH7iKxqz"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7fbbb84f034so7636844b3a.0
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258202; x=1767863002; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5cND4kPk2t5DX6paIOqq4zpW3qf1DLe+UW4i1yJRWA=;
        b=cH7iKxqzAAUAslr7pEZg7DOeFpyT+inIxVxF0/NIuKPySIto/BjLAbT/3aMDOwHNoW
         i30Jc4DN56lByicZ9k9xArmthZMPIV4ilT3NnWssbVJJz5hnzxbmHBKfKvtpMn2CibJP
         DF3SR7Kbdw2MBIbwjKxo/QwNJX0XtdEZIJob6p8BKHE5Uz9YlkI7khzTLqTlGc46cTld
         lhTRVv00Q4FWzwICnpT0X/o9vO0yVD/l+pIL5egHSYHz9pulKN3AYRh597UtPbYmpqjP
         JL/OeFlNiqBBHwEKWMG5PZNqp/bBH4CfDUci6PEbrJBVG9oHVcpxEqygJme5xgC9UWEB
         LYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258202; x=1767863002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G5cND4kPk2t5DX6paIOqq4zpW3qf1DLe+UW4i1yJRWA=;
        b=CD55iNFDC64uuAnGtbDC4ZeiLFrGVe/0m6eGtOBgr3/Frl1WwtmXS1bfnwvnBtvhym
         PHfuly+rDCcTZupegp6wcLyzuCh8PYny2KuSCDE7GuMjpaeJLVIkkNdVYwXK2JIgnFwA
         37XkfE0GiQjujO172I0qoksthj3mX80M02MUDAIe9rQX7pd1SiWdpaFBwcPJ7w8TEezO
         6TfJyJCX71KvMIoNxyzmCz03nWDOZo1YuvjOVGWRW9PvGdWB/vo4oHm5/U0HqQSBG3ur
         YLLMWrs4UX8H4h3RiAl/wZkzzW3xomtsAwmNyAIna3mvOm6v5K1wkV54omnBAfF/CJDz
         ETAA==
X-Forwarded-Encrypted: i=1; AJvYcCWafZVOexfcXO279fN7+lLIio5jol3nfIDbKcqxIsZjFRfIPmcveP0fzobLNvSwGGxXfkPbfg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz29huGhPPngS+UVG7KiHQVVUNg2WBrfWwtay3HGg4IwkWsqeBM
	MVnMG14/BvC8sgvY91JWX/1cqnlKFBWkmUdTklBMmmuid+Ai8GjaS4Zt
X-Gm-Gg: AY/fxX7Mu+urDQoLTqNnWzP+0a0NYOp5r+vY5NVomb2ypsWP8S6pcoztnNGUJYSwVWr
	azqVCjnrajA0Sk/mXOcNok1AZXaOLzdFM0+qQlQdHFTtimnDGaIpHso90TK8nwHs+7uwsd/M1nB
	AUm/o1WdQQ0TrSIy1YOa7Cpz7VNzdAJpH0mohJmAVbvFZ2iQN89YhkgALGJjvLPE75EHxcG2aEt
	hB3k3rzdMPov4xb8iLnyDe7rfp8phXnuRPlPW7MrDxFeZ5r2Bd2UrrDyytM+C50LZpkOMHAhPD/
	eUGBNuNlxocAML0c0xCPsXDRrsNmiUbV8FehPfuLU41McbjRZc/srWoSIn3uRdhmt0RI1P54WCL
	pAUlTy5Q7x+VVhVKSx240A5cx2T/JtRxxrfSBh7KgkJBkLgECqTuWLCFrLvIbSaDGjeD++82orL
	UtQLvG91TV+uRb
X-Google-Smtp-Source: AGHT+IEmHAcWqnpliva3OuZtHZc4HbdIYtIJNUaBfJ0BdwokwtWmkHAr4ksqGBIwXlgYOW6W79PJfg==
X-Received: by 2002:a05:6a00:6087:b0:7e8:4471:8d4 with SMTP id d2e1a72fcca58-7ff66872056mr35885583b3a.53.1767258202305;
        Thu, 01 Jan 2026 01:03:22 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:21 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:50 +0800
Subject: [PATCH v10 14/21] arm64: dts: apple: t7000: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-14-48812c529ffc@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=xASpZevNHcaVzYbv63kfOr+Ypk6TFwui56ogxDHDMcc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgo4ZMseGjapzGmuJSYJ6+DsYX+adysnVIeG
 8wqHU2nL5qJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KAAKCRABygi3psUI
 JJQXD/9S0XPtF0kKMXxI/Q1LjACD3cbRZIY7t5AFolcJGp/jRItTNlBaDdLEbVOMPeEFRwkfZGl
 y/Gcp7mY/nlXElyZHrT1KIq9A1lQCQV8VF77jZIa9dmR7iWIhHdRr9WWzwi2ytX/T6NrdIkXCaf
 5wK9E3IFiaKNVRy2AYIw9dqbHy4DSuf8t8KYgAgnpdxis7MXLLas2ticMEGBg7lM4t9exuez/e5
 SmwiDxEYrhDAeaAkX66as039lAo8P8cCJovbLlbl9ULGIFN4HsyF2I/x/oKKRCgO+ZynQqASVEg
 AXYs/6qVorx1emzksduBpbNOZIcDHf6HhlVJyO6IGpzzs/F2rACsyObHX+Ik3vZx/3m8JvVetYz
 YLYTpgt12HqC3lVj+XUT774nqmD4uaaZ6uMf+e+hr8oasL+GEoGEQurvFGRTSLGCwjFiMT4X66u
 pgZo5c/rAwrji+CTfKCNIat6nwvXSfTI7Nvu5+IgTtsvodPxxKms27+eHFGr0AF0rsmQqgaHFul
 KHvqbOoCCgHYB+8vlmkBkmhHRIHZTLuxcpMHILBivcAs1Hmo5BY+csQwIVjxe3czOQZ/S/Z4Ruw
 H/OAgJskUPMX0VsiGeshmsFY9tTD+sn1qy5A8Ej/EFUxBmoIssfosdl2t1tbREfK0fSg+46FP0T
 iTyEsqwcmghVyLQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 0342455d344474d34f7924a089bf5f5915e68d55..a416cf8204173d4e45eb7baab42302eefd0e55ab 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -282,6 +282,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t7000-pmgr.dtsi"

-- 
2.52.0

