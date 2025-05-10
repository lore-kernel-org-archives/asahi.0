Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FE4259C92
	for <asahi@lists.linux.dev>; Sat, 10 May 2025 15:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889939; cv=none; b=mxfGBFwfnOC2l4aE4LGbN9inZVygb01HpxdMiSSQ17/zRktjnNtf4CudkWO0QmG7Z8y1dnd6AH0vYL5gAXNVm5J3a6VQdiN3omv2YZEDLDZ+bFHAEsMZzi+J2NMUYDPF9SDNmEw+RjqQc8Pytqjllt1l+L6RNv0b6sed7WTQ8rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889939; c=relaxed/simple;
	bh=gOE3a46CDNX3yVDAoVpyrWK4j8QsbYn+HXz/rfkRHIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gezB/FpiPlsyIZbCRqAWHDj0ExnhbBX/CxmgTbIc7A5ejhA7Dl3cSYXOas0c5Ijk2ZzqoTmX8iwPHqyoD+K79WGeRmH/VuqB2uYEBwM7tIPJDePRpc1vZb6Gm/uEhOcpJBC5p4Ka+EoRB2QgKwG7mx07lWdmL27Oxa2tBjE5bxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBKR6HYs; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBKR6HYs"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ae727e87c26so2088774a12.0
        for <asahi@lists.linux.dev>; Sat, 10 May 2025 08:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889936; x=1747494736; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=aBKR6HYsJKtCIh/PVh48RecQ4f+DVYmCUUg+hzYXvGUy+8KZ/seNUs0eaJye1eimKN
         Q8DmtNN9/vQ9fEdsgMeLSMGf7M+nH2cCTCPebSvuDMmoX+ZBLEh3v1PkNyoU/xKJqyLz
         +1TU9ZMiI8IjFPpfrBAWD4TekVuiJOv4iJJxWWIhs9kKN0WzATIAAvlAvrSEdUViLNUm
         i34ryJJk1T96GM5orzT6D+4+Mm8sCxNGlkwI5BB0Pf7HtkkCfo0YTYJsDq7hX2cQZeGp
         QNYVqjvqzzXRAhVklxlxq1cf+i4qc4AQOgyjELrRaxwmwhicwN/pozvIC8sudtVd0/vk
         vEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889936; x=1747494736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=ZFri8skHbP8gDBVmOwQenRLY6t7qMylFHUu41mS1xCLteXvhP9pqsiqW5Y7JjGEEj5
         7lSbPeqNA+6fAl6F0fu1lzwC45Z9WqncxVxZZWP51NUNq3f5HefarSL/MpcTohj3fMj/
         NZM9etcfbPqh7IkuvmoKmGKQHt+6RDBzTFJ0A/TeGR1yduawuA7kp8sYSghmPG76N5tW
         bz4KrMalr3UmpMQHjp8Jk/3lgRF0wb/k/yekmjCzM08AyPL9U3bNrrzAYcz+1wKXdSjH
         qq0jc4oOlqow9lH0t/x+hFIeongslNCb0Hbixkdf1RYfmPhZu91l5Q8JpftA+YLMvt0T
         KMXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJDl7NIyat8kwmgdfWyxmk1PKZNVfcIj6T2BXLVK62vCgR1dnEW1NesE9DOXur872CTuJhAw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6/V9FBwwxj6X2P9FH3Fgdwv/WCgjmxkPQoFj9JUDq3RXCn+IB
	wQy9uWBtX762H7Carnt0wLntzuN//Zkcv1JsLn/Jo1VGvu0sguDZVoLJDQ==
X-Gm-Gg: ASbGncv9rylvN37AfQ4OVUVV1k6TJgymencXRl9qR+ew0uYfe5BGfT9YkagxNAThN9X
	CZJENHOqdvfG4xbwYz0rRvLxKZxWmsiu/ujYUYqRicwXR5eYRVSPGsWBZDu6aZcvhd3kXb5aRGC
	JYYkOJMBNETRq6M/AUUtO4R+OF2IqCbLkazFUjCUVJtPu+0qte641u9Lea0SYoFICT8TmxQAEtI
	NE9agn+EO1EEbCbcrPWdZAy9OAbBS/DlEMVDi1BAjVc7qsvu1H/lZcscaTyBhB9ygy8lZ2njUdx
	b+NNa/OlpuzS6Sqp7qoQXwKgc39Jbt8aZtwkCDyaz/TnkaWxkn4Elg==
X-Google-Smtp-Source: AGHT+IEFX2DqwxdNjmLY0TBMvhcn8rxV1W/2cg8dtnsnJo8cCkPubmci8tpWb2EV8Dq18hbWVPX+Mw==
X-Received: by 2002:a05:6a21:920b:b0:20d:5076:dd78 with SMTP id adf61e73a8af0-215abc78934mr10836620637.42.1746889935720;
        Sat, 10 May 2025 08:12:15 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:15 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:55 +0800
Subject: [PATCH v7 14/21] arm64: dts: apple: t7000: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-14-bd505cb6c520@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=gOE3a46CDNX3yVDAoVpyrWK4j8QsbYn+HXz/rfkRHIk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2ycOS1PSJO7bDASE4Z1GCvIbNEZdRdYcGnw/
 xFXUL+wJ7iJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9snAAKCRABygi3psUI
 JBSiD/4qe75dvVc4Aw8hNudfAwPjI1bmZ+dtl7+6KmhbrsxG8HVCuIUUtaTMrO18hBl2MzqRwlN
 Gsvc3t1A+/SVN6MqPXkBKdjW98xgBKaqvqydSFkDUuPoNWgVqbEzTBfYb/ZI27Z5YTkeTTiXJFS
 qikXFLANYPM1Cl3AurtLMxb++72gZVWawt0pLkAqhBZuQM+atr45CSntSH/1cidDRpVzAXCvqDd
 xboQrsmwXB4HxAe5JQhbR6qI+hGEncTrnzhKO/V9k4FEjLD9yJjd6yqszbPb5mpGjD0aiDSTdcx
 3ZsDRiLysIsLD1i+fVqDXSVuhLmAa0EPd+5Gb3DQQJT6lSpr5hhugPOFKbcUg92AU56GFxHZIJe
 Uf/l28LPkd7syoZxn2QJnMghBzBh2eC+93e0Qvp2LFL+KtLIuWE+GxeHLXXO/xFH0W2Lj/rKki+
 MiukYYBKsWSrcCvz8BFCNWaIUeMo3L6q1q8MjFvHt+tLtNtoIoK7Qgxv5fuTilqx9QG+aqaThw4
 ayW9KfspL09CYGa8Oe8HSMB3uoVfcz2hSdarxmHY4rUSYzDVyCRZCGPLy3aTF2tHAY6JFZgzMmn
 vKdD0Ub5doPjb1OTb4GXAh8/SUbdcDNOts6cF7fEPyUxDirlBHi6ICD4t4KyeYeHeeGzFakNz0Y
 GF+VOsk8tfi/sKA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 85a34dc7bc01088167d33d7b7e1cdb78161c46d8..f1415f50cb150ce1d33999c817243c3dc9184199 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -193,6 +193,14 @@ timer {
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
2.49.0

