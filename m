Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C58A2E040C
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920588; cv=none; b=ayqV85l0/BqjEC2cZhAKiP6TnipqqGMKnXFcA9I1TQGxyLzQZr48dyLcNOq7cZHyNuT+gASqEzbH7CMieQ7CqaCMhuIAHYjbY6XGBr0xfQ0qEUxmwEYYUIpHMim4EEZ6VAH83pC1KXbG0z6/TEPoeX5YJ5z70+ODbiZz3ExMqhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920588; c=relaxed/simple;
	bh=41txjamnPbAh5QmdirJplHpDJAfdvJArnR9bCC9UlxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hm2Vf8jjXVxFoPAKIaDk0Gw19oQjLBrmw5KJabOjfUu5IYDevpkd9hQ2WoWZxezuPrSbhYFqu+0jNqhlNv7tl93kCe/mU/ihKPZXRn57JtxMcS9QuFcUjfdgf6VCv5mZgKac2NSrKf2+wuqUbWEZCpn8bSn3DALzMPnrBehRzKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8TwevUV; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8TwevUV"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76b6422756fso6116982b3a.2
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920587; x=1755525387; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzyO9TBVlHI2cPtgob1qEX4Sc7tYhu57JbOynAF1T00=;
        b=N8TwevUVWyp2PdbAkd3ytuTr9RFDjEZ1iotD3+v4xGwRDCoQl2MdO17Va7AYKghEiX
         KSoDw44REaiUY6tf9POesJmlt1B5b4o0uIQ0fpjgN2XWsY1ywXPGnRwk+guPhJ5MG4pA
         Knf40DA1eh2m2PYr2mxs5U+dqwAYBesJ+bOm9rUj6VAAKobx7qs9tbstKhECTNpHMUQm
         f7iLqeYPWSblDHY/IYzTQq5DLDlDhsqMlSnmdvHqRVN1yOW/OnaxlMkUmCcyLYpchHAa
         oHGs/58irUfaPaeNBHkWm0b+36kf7VouHs0rkHLOZ/Q5ENcA4nw7CBqP6M2DJo8tNPMO
         ndOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920587; x=1755525387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzyO9TBVlHI2cPtgob1qEX4Sc7tYhu57JbOynAF1T00=;
        b=eKNj10j+0SzxqQoQdvyxBNd2XRi7ywMT3IsVtvnVpNg8jyq72UmfQi248Ne1S7YNlt
         t0Om+ccZ48Alp7Dbz0Shm2Nf+vjbDdoujiw0O9kMzA2wYh369DsPDKSWV5T0OSavo2cw
         QE7dWkGQqFVrd1ZvVgo4YG1e07pPjwQX4qUjPNGyIH+qd+NXL8Ee50i22fJ7PCgTVtI8
         EBtXkGaqq26dRx0o1MA3H9bqSkSUQzOEfcs+g9699ZX+Xz7PKdxgYmmBh6E57SR6cZ37
         euXHOImRhXxMbr9mrHqZvHwf2lfE2xHrRHSjh9/eGppjR5OPLl/mZMqJzGZE19fJiZX8
         UbFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9ZDo3ItXvUEridEeSAvrCd147WkpSReBAdKfCh6YDgVjrnFIi4IuJIZhyQve25CFJPGR4ow==@lists.linux.dev
X-Gm-Message-State: AOJu0YxTkLp7G5L3rJMUj46DJE47ijrmMQN8BVuPqM/MMCnWxQpUSc/5
	qNmA85r/xXYW9DWuCKm0GmKIeb+uhBi7bABqiTR158cLyo0tNIFu6LB5
X-Gm-Gg: ASbGnctkprRd3bcwfuRiOnOmmGGAFAfduF6JSGx0Kn1bxj1xUSH09a8rPiVrRoH0yBr
	jTPIBlpYq3d+lqZkyhJeqZRHfOiwgANyAbtigtjhetddNCrJQIlQ0npLyCYrAICgTIrFauRVY5T
	8O1FQb5QNjvvCPOWcmBX40/VEy9hpbGgF+BXIPOk7JrgAg4188b5f172LN1GgSGF3mgRE2xgq0d
	0Z4yKxnVFb/xHwbrS/NG/sIKMZ6SFikKBFBCirDh//AhcrTYU5Z7QttXLNGEj8sxeVh5qpP0yFW
	3U2kP+E+N+E8NrNTSbJ34QMX9XMhsRMHh9iVGqe9ECLWesSfAdhGzYK2++e6s/OXdkb8BoGiOrO
	c3S+OjE7/WaPexseONXb34tiu3TDTePnBPuRLsw+mWBxPRJ4=
X-Google-Smtp-Source: AGHT+IE7wVIulw5MzW+7jFqgGJ0yHStIzq5ClP2ToPWDlVbvfo0lp387iCzjoEkRqhGR8ITPJDgzGQ==
X-Received: by 2002:a05:6a20:3d19:b0:21f:bdd5:d71b with SMTP id adf61e73a8af0-2405501aaa9mr19625402637.2.1754920586681;
        Mon, 11 Aug 2025 06:56:26 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:26 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:46 +0800
Subject: [PATCH v8 14/21] arm64: dts: apple: t7000: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-14-c560ebd9ca46@gmail.com>
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
 h=from:subject:message-id; bh=41txjamnPbAh5QmdirJplHpDJAfdvJArnR9bCC9UlxE=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZC6TjtYbWMvMGxoQaVIB/WaxX06xnDnzpev
 Unuhtp3YryJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QgAKCRABygi3psUI
 JKb8D/4hOvwHwoiF6SlzieHwZqka+hBILLsAnmopUlq94FibUzyOY4GVXOlX+aTz0GYmR50/VBY
 pqkCOCcRCjE7yrC4uSg87KWES4nN5pMt7iGMQyuGz2RZziMnPu9LFXy57ekbi9bQ1suG8icWe0X
 igbooTRnmvaWQcB2iLYlsKPVawrIjmkoaqyE3oWGwvwkDmqAZ5i5NKbVyBiYLPD1cHOtqxOPhwy
 wW1EAYmxk5XCjeNLOXzCTk8w9+TLgssDNbN5T3f4wunI/nL00uXEakkDxQbWzx/LScNCBg/t0ZS
 VZvZbpSvgLeyHgNje5hZX1tN92BC2CxFUP/olz1fQ6XW9oJDWvGdK5ezj8QDNK/o5/yEFQSrF/z
 Oz8rgBNjUi2gnAimdos5DxYO6O3xOEzwHyw+n4stMctffs9DiSBGxqBfrpCjU3npnsRURNlzTHS
 fu/q68vfn50UDAHz/XiRcl+Na71+JUzEE25BADPf6x5fXBUzl4ekPkcM3Hn3Lx5FhyuZoKwo9td
 B2cqNfK6p5X9q3JxSoVwE56I1QtBSNzKzGRmNl3sfz8s9xI+OW7Y/8tmWx1ODqs1fN0TkmzejPk
 AIOjAf3J9kqPky5MoJ3Fj6DN1oWiLtuwOmaW5VgKqGoUW4M8Jlt98+8vYbemNK3p+ybCtDMaNDN
 UkGuYLdY6CfB4uQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 52edc8d776a936ca5ba58537d4d68e153023f536..98c41473a84098bd70df86c2728a8080b05b41f4 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -206,6 +206,14 @@ timer {
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
2.50.1

