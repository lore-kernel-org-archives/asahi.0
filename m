Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA03217F31
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920458; cv=none; b=Zobhdy1nEfeKiQrKpxjTSLxoN74ibyxsopXJf5HeEMH07dYjmO9d6/UQvhu1lRogr9HHkVVcdL8EEMzlIyvh6ExFfTArESxQiJvR6xk1gcW+jTQnWVvWKqoRM5B7HJUD6qgyanQfYkAfhe5CYik789bmbKTWBG68lvcxqi0mz04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920458; c=relaxed/simple;
	bh=RyAP4l/zPWmcwBSNE2d6uKakntoPAmdHkSji5mOR/zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BkTj6Dlpj4kd7UbwXRttCuDmTuQNva9LK6f88Z3Le9GRDYlnz5B8DgeG2jtRs45Trhs5P7hCPjU1E5RedcnbRc8fKj1jGtdTjD44xa/UYwSYmZzzVnS5Euz7mGThwWZAoEVmUyHiAdDvEYlRvv6MQaGWziTOyfqV1wU5ckv58jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edXkJmc+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edXkJmc+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2402bbb4bf3so47472295ad.2
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920456; x=1755525256; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njXuK3euMe/kZMogavF3/6ffW6FWMiYEAwe6fdu8xrI=;
        b=edXkJmc+ulaEdfj2rKQecMBNzZwaBzywNEce1+1CXkfuAK6qnsfUuO+WDghjcq+TtH
         rHcoI/z+5vUvxhgwylkjICiy1+N0Ju4ycjbqFfgfovtFCLFgLywqLlDVdo24WZg5mZc1
         etBVTQSlurAHBTsTWkPX5c4Gjiqy2tAjb8plUNwoBOaojZAO1i95wNZDx/P2nAExRrDU
         cyj7RiHzM0PKvzgT42rtVSSIWeRwUBsPjQHex8GPUmT8YmOZYrE7J7ACVBsJkz6r+pZf
         a2+iOTOo+M/esI3TB54UFoeYqdULam9KCqTcCDweXfxuDXy2p3ode5NxFGC+kjpexKz6
         cVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920456; x=1755525256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njXuK3euMe/kZMogavF3/6ffW6FWMiYEAwe6fdu8xrI=;
        b=K+1rardH63BxG6U48qddrqMChoLYV7nkbVmc2y0GwEhi+GIuz/wjQKezyw1d6oF8WK
         oNRjT1SkI+87SnAhK+OOtzcUcyvXI03+hDixj3c97ymMe9uLHfh2dXj+mkHjyOIIWuj3
         W3l1V/2PMygHGZ1CU0aKUlKY0LAiZRsNTKS6EUdLm6sg8U7gPNIdquCmOzAdAEEcz2w9
         OH1BXd/QsmLJNleHhxqgjUjtlFLp4fjm8QIiNcn7352Kr2cvwFyRLF70SI2bPb7pj2uo
         e3O6vx74lF0vscBFZ6Vco3g79nO7syYKf/zA6t07H02VHLDHwNulaNKSJu6voMTGIdTk
         hbKw==
X-Gm-Message-State: AOJu0Ywiq+HL/HwaKtUlFZwubICYYnGr2mjRRjr2CEgJvSXcPzdlDAHr
	pXhDp8WO6cMVBhTxe2Kzf4ruolzTXwPpzdtySQE3Yk5CtNgGMB6brejB
X-Gm-Gg: ASbGncv/R+eMOZsSvlgb2Bavrr4MEpx661IDuWKooBXf3hJY2OZxcssf8Ny3lP4x3al
	M2t3e/DfefEzEBYK3ai2q8e3WkY5VDcMR122+SLpW61aXJtijFq3+xiWmYzYohG4K0/YFjZy8Tu
	387W1ikEs/J4B0yOpg1Pr5n92vG7jqXaRcvNVoalilm8XKFC55vf8zYcuOGCPHrpsh4PRHIndu0
	Sxs4izX+5Il+t3ebmaf19TCWmUS3H3YtQ2kutsAXE4TbD4Pdcl1YZUNvvNVvlI9oKypAxUazH1G
	eyqv19e8BDNFt6JtA3UfUZ7dPikDY5YL+UNmeN1WvIwxqaairBnZUC65cUwVSNe+oDtyq/kdTfV
	m/PE4BVbWn//JSyAVGm1Lq7zLLWxVYG4RSqOFKWQIn7aZeqkUXqEEJpGWIw==
X-Google-Smtp-Source: AGHT+IGrScjZxGAQoVeES5vrMAAEiXvuJkpocuymu0hQtDgdymNeonp6DcM+OcVkEjVZPGfSG1hQvQ==
X-Received: by 2002:a17:902:d481:b0:223:619e:71da with SMTP id d9443c01a7336-242c225767emr203264025ad.49.1754920456171;
        Mon, 11 Aug 2025 06:54:16 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-241e899d272sm272976285ad.135.2025.08.11.06.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:54:15 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:53:56 +0800
Subject: [PATCH v2 2/3] arm64: dts: apple: t8012: Add SPMI node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-t8015-spmi-v2-2-a291acf0d469@gmail.com>
References: <20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com>
In-Reply-To: <20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=RyAP4l/zPWmcwBSNE2d6uKakntoPAmdHkSji5mOR/zw=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfX87iL2CjHFNJCuJQ9I4roFaqK+UKkKCXZJx
 eKPQUxmTHaJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn1/AAKCRABygi3psUI
 JP1TD/9HPeYKU524PqwiZmBwkDCq4p3VGO0Y7feNyOfszAdgTCzHKMFxXVxNIbjTE2PyoF5ugYd
 Nss2mwVjRBWFrg98bGdvqfnGKoPzsHoujiO7GqB7kfaXEy5wWrvc5dvZTEnfTWnA4UX3waSf3bG
 JG3+/Pnj86EBtI3d3EVScr00gzR2GfHcnQ+ehDSJGAN/vIitchqqXFA2yzve3RrcVFT8+iGRJNV
 tFSRdwXoTHO/92gWj/aqc1DSRJIh45dp8NG1NgqARmagCTv/L5Jt0d3kuhE9xLRi6bo58k2ovPQ
 iUWCm1ip7nLi1qMIQ3yGbBOeLxowWukg4I0JMf42tft7Ag0mjcDj36eHhCG+RsTVHFoCats4bsA
 eGaVPIugyMROrTHnY+ZIcN/LhEmF6hZabljg/2mbGOaAEnJqadlpfdgcYXWZyf0eTuS8iQo3I8f
 PaYmpt8XhCFtxklZb3Gsv9Pcmu5RxCnuJrVwNGvrmWryUVNoTfciFPPHVXqoxONZR3R9ZPFp2WP
 /sfAOHjRL8atEQLJ3eExfTopY55aU/GKORZqDRSMs5b/eVPw9AEXOUc1M7D+claCAT0XW3Xd2/f
 FaZxUUMiXmaEFe3mqMR1HO4Xuoqwd789Da8hqwgG+d1R5oknCUERY1dQK6WnnqtK1DTSn2fZuWy
 VULoEGS7qpip35g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add SPMI node for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index a259e5735d938cfa5b29cee6c754c7a3c0aaae08..60e73a0401a80abd03f82d24845dfc12d8770ebf 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/pinctrl/apple.h>
 
 / {
@@ -220,6 +221,13 @@ pinctrl_aop: pinctrl@2100f0000 {
 				     <AIC_IRQ 137 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spmi: spmi@211180700 {
+			compatible = "apple,t8012-spmi", "apple,spmi";
+			reg = <0x2 0x11180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2111f0000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x111f0000 0x0 0x1000>;

-- 
2.50.1

