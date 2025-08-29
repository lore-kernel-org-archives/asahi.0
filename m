Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92A62D9484
	for <asahi@lists.linux.dev>; Fri, 29 Aug 2025 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457319; cv=none; b=tcKUwiMpkJDpfzU5JFfx1L1HMPV43jyHTHPF9d2/Jgj2X4he7NK0tb4ZyjnV5lyeUJTsrwVsIvqs/bELt9lQsfSyk87ROhDseniuREXWTAAqzjz8nLjq7bgObpUXJHTAISqIS8BS73UEe6afa2HQasEbwpqkPTM6td6Nqaa6l3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457319; c=relaxed/simple;
	bh=IXmE83WrLHoojz0Htjo2nqONfoaTszNCQ2HISt7DOmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M/cyFU0f83Tn7p1Obfe5U5ECmPsnYyDDswiFDNjcUUq8YKekSQu56g4jq8TXp9lKDeoBV7kbeSqaaPmo23HQeWE0HhhuFI2uzlQ8d4yCUXcZ5oNgankmIdI5XBqxBmTYWGYFFlo+gnTDLauxf5s+qfsKhWCK1mmJTg0Scw6S+yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c03RrVPM; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c03RrVPM"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-244580523a0so19342825ad.1
        for <asahi@lists.linux.dev>; Fri, 29 Aug 2025 01:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756457317; x=1757062117; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huo6UKRZvOysKzlKK029Ak+BDZSM4j9x9AL+B8QBDmg=;
        b=c03RrVPMTcx3T2n3JBZejuMYrFLUeK0h9CrKWzwlzdMYA3RMhTFhvNXza6iI72TN7z
         HqnaHWIBtHT+MqjbN7k1Qr8OjL7KkOu0aU+Mqo3iPzCyTdtGw3WCsSrX847Pvrbos8dx
         lmrjE+0Qz4ReqLcp+4mJbCZmG/S/K0K5PcBMl/Y6hZc+/yqOzxvMU4ijHI/1c7SyvnzF
         UBSlnCR5jBuTiMPp03SWN6swkMvQ2cN4kDfpNmiIaw9K2RJIen7wvliVQ4XxdvcLFUVQ
         CIWx2oyAqlUq1iQUsWXh+8HLgTvWTao+wGqRtzR6V96Ddc68E8/o0FxDx4iZ8Mqy6BDT
         pRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756457317; x=1757062117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huo6UKRZvOysKzlKK029Ak+BDZSM4j9x9AL+B8QBDmg=;
        b=j7PsXk28JL/8IHZXnhzKz/d7QxCbloiRaZVr/h29v+AofH6UQpWSViLDXG7jDEi/xU
         7bX4lCO9k/KFJKONyV1/JPxgB390RxqfA/DhkNzX0WJE7fowu9cWzjJ7yEonRJ9fhNk4
         OFNtvpAfI89rnaz0JFGo667Dx6zO6ZRjxSyZBuub1dflPULU9FJal9SX1HcDX12JDNSO
         KKCBmUCJ/k8WT05u74p57mDO64git1w7dVhdfKK0ozJlfqaSTo6em08/JmecyrS+ePWr
         GML0APY7qkit6FYkr5FL0+vKI/yc4zE5iBmf6di5GT0OZ4C1XLImU0XfGQzsM0EIgy3t
         jlkg==
X-Gm-Message-State: AOJu0YxX7IDGZb/UlLiGhW+GGhf2N/YVKi/LdccY5gE0cHd94wz7yDtF
	F+fHcRCTjZVxJ/0m6/0wF1aqj4hdiRjXLil3QoVyx6AQugvl0LUR6h2S
X-Gm-Gg: ASbGncvSpjjj1trFAXJ+jopwID2203ri8VKzLXogdmQCX/q6I6yCfkvtozJF/3IwEw+
	QffO2Mcp1ywGkso4xqcCXECbD1X9XlwnSpf40dfq4tDRffomd1iZKIt8Lr1J5/aFzdYOrJpfRjh
	FSrPEF9F6D5doTIEhuL/qbbhuIChItnDaPyHbdfsr6pBtY5vsECJMEdNzMcOLlls5gCcyjFGx19
	Lg26sMyJxJDfg9fZcb5xrOrbT5AHuOL7DMp59XJyTfjQxkPGuryym1dBzBaJhCXZRS1l2PwThw5
	ZGUCJ5P4wWBRt7c7ogbvakI4IXdHnN06l2UwmsjroWexODmCy7dir1E6hX6VqA2kj2OApBVu2bD
	lrrbYhcrv2kFQTPpVUA2MDO+xscsx9quiYicDNA==
X-Google-Smtp-Source: AGHT+IHNprSHX/gtqW7mH6PGrQAeU90URpR1MuRLk66CvGwjz133vsdLxYv6Yhkc0Ldb3CFt1gYuaA==
X-Received: by 2002:a17:902:e891:b0:234:cc7c:d2e2 with SMTP id d9443c01a7336-2462edc4507mr413113905ad.1.1756457317009;
        Fri, 29 Aug 2025 01:48:37 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249066e042asm18162565ad.146.2025.08.29.01.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:48:36 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 29 Aug 2025 16:47:02 +0800
Subject: [PATCH v3 3/3] arm64: dts: apple: t8015: Add SPMI node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-t8015-spmi-v3-3-58b15ee2c825@gmail.com>
References: <20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com>
In-Reply-To: <20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=IXmE83WrLHoojz0Htjo2nqONfoaTszNCQ2HISt7DOmU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBosWlVRHFdQdeFy3aisUkxWV9ZA27SfibYMoV0R
 fxOZJPauX6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaLFpVQAKCRABygi3psUI
 JDzFEACGVhhRSiF4ZqOskPQJhky+N+NRBdF+sbQNrZ+xlazYZfV2JNJ2y0VtjSDu5Dm7ebqPDh6
 K3uh1eeiv92PqwLIYi4IpoSgzjhikJ8OXjyley21JBEF/Wy6q5rTHI5ds5weqL51AArgrWeN3gb
 k5k+6Ty2fGtOomkCh3vwYerV/0Oiv17108XRCEC9T/o8W9Xejkd7zBc2VwThLm61BOLZT2sCq9N
 t6cvJP/WY2a58Trz713eLyMZOGwXSdBNS3WOk3qwEgB6heQ6LA8NVFjR5sMWXwa0dVZ5OhPZJZ9
 En+FX7fPu7zpic7sg+LkHvtc+PYVLa4gDFO7WV725avPvD/9BZbo59h0dR/hhSAJ+J9ToxClanp
 J8uYbnDZgDUPpBwy7YOlcPkaEOocxaD62ooIgZpETZWQBj/R+d/hNzLnnxHR/1/ILwXB1kMvY/z
 3bJeoBmON9pWo9EoOVImUQ2jh6trqcYepOCv+J3sV/UmYFfRC5H6mBjTknBEZlecV94khWSWYcI
 1bRZPAQLDGYfZci20++ga3iSQHDIh3q35iWUsZS00LDSnx2hzhG6V6lIdiu7xzPaWy8t5YDnCVv
 dSKXupFEeHCIsB1VK0lfdOiA0Bmn7vEtzgr/fGR+h+ll3/qIv+L6JEs390S5NzId4lUOeRN0cnE
 uaXN/vJs2ZicH6g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add SPMI node for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..63b2a1ddaf44012a03bbbe3d7ebbba91becda015 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/pinctrl/apple.h>
 
 / {
@@ -344,6 +345,13 @@ pinctrl_aop: pinctrl@2340f0000 {
 				     <AIC_IRQ 141 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spmi: spmi@235180700 {
+			compatible = "apple,t8015-spmi", "apple,t8103-spmi";
+			reg = <0x2 0x35180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2351f0000 {
 			compatible = "apple,t8015-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x351f0000 0x0 0x4000>;

-- 
2.51.0

