Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F5B227BA9
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 04:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001222; cv=none; b=EHq1xz2bjdeQeOBbAVsSyJqNrmedG22N6PxrxLZOwkl79TgdtO3kj3ZJe6jX9bnRMPBpyTcRbg4Wh5Y45DBmMmbHnvWBsClfPbvbVSBZh4u1FYIQ8yl2ZR3jgy2yvgBQDlN2gzvyG9Ie7EOV0Alo0VoLYh70alURxRuqNxsv4tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001222; c=relaxed/simple;
	bh=umS18Mpui1EoUACcGD+WdVdka5VgnqwULsO8fA+OvnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qrk+Z+xrMWkDMpJiAOX/Y/uNTSvw4xEgMddHFgdY4D94ijmgYfEUf3PjbS1efp96xvMK3llTjPjqoiyRVWDBv0oSzr9WvL0fvNeQZdfm7Z9C+suau79CjkbdDsDCpbh7jiSqxuCioOHhS3HjU8d1YMbrWa3EegwUnn3s7UaUFrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3hBLfXr; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3hBLfXr"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso3187309a91.0
        for <asahi@lists.linux.dev>; Sun, 06 Apr 2025 21:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001221; x=1744606021; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=E3hBLfXrIDsCdo67bedSTBDoHmyM7waYqDuTRAepnaQmVkHwmMTBFgAKyVZFtgU6rt
         qpnIGnowKrtHFv7hds5z+Ci2SwK9pnVpRqrex6UUCT+klFEmKCVkv6grbp0T3jYBMED+
         Lmd8jmQz4aYE3irTDJDptqD68kWHUEucpO5nNEeDB5cCrtndNeRjRF6zqegwxtrCTLnr
         SNOSuvKpyFbwKfsDxGOy3/cNxTpMW0CRIV2pLWMggOVVZyv7nMLl1V4vTmtznvIJsFha
         wgvNfAwweId8afx9Cf/Kpb+O8d4+GxVYjdqYknjmgdExbb9BqjTDHakGMj77ehxNKTEr
         kxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001221; x=1744606021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=GjUNtzV0/cz9VXHxjC4PxBaiZrKQfzeLS/3KlOwyS+bJMeRZX/Rmadc1rLMYuD0Aiy
         L+s0AX3eIOkjncVlgLbGUvUYPbcDBTh7byrXxSNx4LU3non1mGj9eu1ReLl43dMxqFTl
         JKmEnprauPh9dpZeggCVD5EfY/MME058mRV21rMBQ73J9rdl49O+kKGupF5W49ryrwTU
         WNZ9s3kYWhPm4ZnAxLeEPBYQrp4yBGpIOQf44tIx21oAV8fOqgtAA9I6zCWGJMJ78BiF
         gI1VdaEiKgd8iH8yIcPkfvU7hVQP6M83QIVYZDkNkbHkJYqVYiYyCbpFJeBl5UDvAiU6
         4+fw==
X-Forwarded-Encrypted: i=1; AJvYcCUaFPyNzr3zx13zVetKW3M9thJQkAzB1TnRVksXN9NkG2aIPksR2FYTmQXcCfoK9G6vWsbXlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBYvadlyw34sh5L7r/dBeRasEhGThPYosDKLKXbrwwqlFrjW6M
	jFc6NLBMAKLXHUiK1dnS4RKp9PaPtxthswEsSj5LwOjfvC5G65bo
X-Gm-Gg: ASbGncvVwdBtlcmblutXU9CSqp3grxmglQ2LaiW4H2Bw39DSyodtRdBqYapc8M34fy7
	ssxEe/NJ7Q873aqpvhGN5lFZ8VmevlwBMzGfchyr2jch9LS5PVAq5zag5D7q+RBg8vUMv0rEdOR
	hRTt1yG2TrO2/KLmsB8yAYF6y3fmIFM/2GulFRRvVQX6CPAOLWo/x0Is/vp+rvcuvPLimy7Gpaz
	jfOCo6CQRQz3VOdrb5HahizzgdaRtKGjH/qhFZ6L7J6Zg3JKzBqE/sKA3swlXeJou6AtcrmJSIQ
	eNKL96ppIk/QDPl58ykiaClwUDLkIfqkgDUIIuz73Da9jMI=
X-Google-Smtp-Source: AGHT+IF6VKTVoaa2v7ROypT3rc33cr4X74TarWm5WZaI/cJLc+61XLoqRW6SGcjhOzMHytKH8/7lPg==
X-Received: by 2002:a17:90a:fc4d:b0:2fe:80cb:ac05 with SMTP id 98e67ed59e1d1-306a612a138mr15716200a91.9.1744001220725;
        Sun, 06 Apr 2025 21:47:00 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:47:00 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:26 +0800
Subject: [PATCH v6 17/21] arm64: dts: apple: s8001: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-17-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=umS18Mpui1EoUACcGD+WdVdka5VgnqwULsO8fA+OvnQ=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iIqdXyLmDtBvsESjN7HS2mBfSWCzi936p7V
 fm0906jqguJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYiAAKCRABygi3psUI
 JO4FD/9tOpeq8/h2OPsPrKBHo/X0tvi7bpPuEBKJm8FiP6qNhpcV00eoB04+3MvO4h5Jc1j80iS
 4J8r8owDxAdaurNMGOEPAuqW4QQlNf9ohTJLVCWlhqxmCTDqfEFWO/laqWUe4gaXsTR0Xe5/zBH
 T3skkVKBOMvyujzaCXiESZyYAO+Myg7UcLgizWstY5E114QwW8WmOP0ASvkmVJvj+SfF2Ms/QoP
 mRQCoWoD9DznWery8KoU66fDtlZisCtN93RZfsUFOknoXTkjlOzMEu+hdlc64s5OEt3P994g4tL
 sHSft2GGuuLYTb9LtaPmxKaXaoKF9bTdBdeweJwXt8L7fcUltOBUPluwF16yEJjmbDEctKB6cPe
 zOi8Q59y2z+tOYXbkSj0CUoN7PQXReakggUmmyk/95GwRqUmDNs5UkBnZRugIswRfcxV7YcvC2n
 hl9D1OkpKBtoeV5wGt+LgNYOy2pBbBPO2AFarPxYIH5SGOgD650hAS52FkDdVEmXHOlfv6Wf79t
 epTjMl8qohJhPbPts0iX8J5tNJZ+i6S/UZBsIiT9B0+TJdGl8JpduIGlnjb7lCQTnUfeacEM3ax
 t4bZKn55++Qs2SowQB88diB19ByR3RLNJ3PJCRhft1jY1pOWME02FAZcfTRzgbZ93qpLD/UDqA9
 7VwDTC6CBdvKzyw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index d56d49c048bbf55e5f2edf40f6fd1fcff6342a9f..33760c60a9189df5491256f81db7f413cada27a7 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -209,6 +209,14 @@ timer {
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
2.49.0

