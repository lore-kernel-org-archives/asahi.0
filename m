Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FFA226CF1
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920462; cv=none; b=KYDzaHFEiBU5Z7scE2GOLJnHEv/VS1wmK3Q1aEoTRUb6t2D3swnaAnPL0CqAx216+zlbqveDqKIBjpzwqmjO4CJyvKwsWwsqzgB/6VuG8nEtobrTZ1QDWD/EvujQzFElZd/KgGa15KhypevwcQuetWpDx9q4UIeymCjyLmV+KJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920462; c=relaxed/simple;
	bh=6sIMtSPHhd2FTXHOBnTqWI7MAFm5VIlJ0J7eqlFrmr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lsr8qlIiJYWAT3FR33tRmeQsuypKdKwg51aEja/QEdkfLuTN0YIyQWVon7QoCUeIZB0xugAPnYiK3WSsX7EEcLN/DX9C+NfT34nadYOTaXCLMyjvDFlflIIi+hfBk9VdWhD5AKnydU6/dmhd49x4GAmBoO0yqmseY3E0ZWTWv3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wpr773MO; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wpr773MO"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23fe9a5e5e8so29351545ad.0
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920460; x=1755525260; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InBvecGhedFSGu5Dcom4sxZqi83xWaTBh5VQlTlnfP0=;
        b=Wpr773MO/o66UtvFpQ8dgdIsxUsoXXL1rKZALHuuEtRMiR87fULsO5rAXQQNcHjvuG
         jrEQCyL18YKGhxxgFQf9JR4YhAAEaNhR5sRyhXlj0eYdCaiYgcRROgmujaSXwobw9/px
         C8SWrOd1X9vq9qkvmwJxgidRVxbs+dTXoYHTsr4Dcnm5VoAyBBs6FUYR71eE+AM7/lNi
         L5kNqLSveklF8k247HE420FiOl7D5tQChN5sHZ6nWAYO75GjUaxX8Ibazizv6WD+P05C
         qM1i8fUN4cDM50z9lpAD+fgj+ObkRoSVZOMmP4mLKiq5Y2nHiR5O9vqT9D1CXgis3r8x
         pfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920460; x=1755525260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InBvecGhedFSGu5Dcom4sxZqi83xWaTBh5VQlTlnfP0=;
        b=bVFVAPpOF1zerPhjmWPNQ6HvA1N8mTu4R9Y6W2tt+TmpVSn5vUxwG4qi3evPMz4xLV
         Ab0WuD2ADl9x61mY9uG85mInlb08/4jhC8TR8dLv55HBFe2rzx7ajYd3eGMygmyoPcdc
         8BfHP7U/klVoo3uWuKd/YdOm/OL1dtdeSkqXdxBmEewW8+n/MCGy280sjeJeSb1atHpY
         PB5zSrKk6liU/x6TnXu0PaIrMsytP3YbNOkQM4DmN0Hkq127tl2iNxOX2jaZJXCDA+1B
         PFSnBfGi4zHDu0TM8nyJpfrV9Xam/M46KZI8SEypFS2cv0z5aamTjr/3DE5kvEi3qFob
         YYPw==
X-Gm-Message-State: AOJu0YywzFAmBRPZQQ7CMurE+8RgWPLd/zgXQSwJUk0/Ug3FeqqPc0TQ
	/xv2wnNHWPUf+pFXAvlKfdk2KyAc6asCxycLXQvEo2NTbWzmk63ruE0e
X-Gm-Gg: ASbGnctrIlAcCJQ7kBSi8wCdEYyD/rWP0le8gWdFG00yAWsmlGpMEc0ahYmAzBkBOsf
	Gd1e51kCV5fezeDuC/fEHvuFgxHHD/9rWjFYWYXnwesNFt7vEyIhP8CMCZUR0ccYsXkHpjybd3j
	tKb7USVjLvlk2q23o/U1S2caAmGtKaMWwnwv2Zs9gav1F97w+39pDfCdADidFnBcUfdOniZrJzW
	LVNZjnnxluy+fQbGkdoRhWwVshsDVU9cSNoK/9wPchix0d5WQu4a7JbgDON2MYs9uO9Pn+P5nqa
	IaP0iF+POBv9eHvwA2JuEWZA61NCafLQF5s/kc8aOZN98ARXPb56yp0vcVOsVZP3wHtPpsLm0o7
	8Ry0nyE3f7lmRVh1KgKeMiwmWy7OcULfLAz0n60jlRv4guek=
X-Google-Smtp-Source: AGHT+IHgqw9wE0vqk9PZuypkaZC6yHDvfMteYcqaUMA4xnpqeQP11i3EVr07/a/IvVKndMHAC1zZqQ==
X-Received: by 2002:a17:902:ef48:b0:240:640a:c560 with SMTP id d9443c01a7336-242c206b2d2mr204600595ad.24.1754920460174;
        Mon, 11 Aug 2025 06:54:20 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-241e899d272sm272976285ad.135.2025.08.11.06.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:54:19 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:53:57 +0800
Subject: [PATCH v2 3/3] arm64: dts: apple: t8015: Add SPMI node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-t8015-spmi-v2-3-a291acf0d469@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=6sIMtSPHhd2FTXHOBnTqWI7MAFm5VIlJ0J7eqlFrmr8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfX8sfXf48Z+wcbAk7YpYAspcIELf649xiWch
 cZHfEwROuKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn1/AAKCRABygi3psUI
 JKJ5D/9Y1nweI6YbiXz4vEhpuwsR1nPijEazr4bvFRnZa7AM5/JWnAyXvjTss6IEo4DvNWwOCiw
 oZJCdJLdJZFXtXSlIBbnHu+M3GmN0fyYz/Wk6vw6HPPykNNzsuXW/4V9DbMiahRr35U46zm3SOQ
 2+ijoFe/tbo+gExdIPybeYBE5OWq71rRwvWq05/jhxNRHq45Vrj5xW2TWUKHmETC8/2QH4KhSGv
 6ezyoEw3GEld9pI1g2LO/dWa84sQ+7Qj2ELQHcYzJEIah1mmxTksRhK3eHnwcRO7wboij93Nnfy
 bRKD333sg0NG0Qv6WrFR1i1csR97yL3/BnTG/8hYTrH3SqckRSl4R04IziE4SunVZPlNMtJ7VRu
 TC+JFS+SdYqFX6CvWG9LI97VeqGKmw8/6psttZpxeYjqZyVflbT1g3oY7lbicR2Ky7xoeSXsgw+
 ffI3JstSacuFTAitzHP2rkZj1JMxE9x9ggU4IpokQe1n37R7beeP5Aoj9LKWRSc37kig4YYV7R1
 CU8XP/L14mmhf/cKCdh57vLF7W6DByI0G1uQilwTupfL711HWBRyfVpd9Ub/hFFmE/ut7flSxih
 XdszsFkWHB46QlAkLdVKdrjsoKt0EzypgnTC5arXHK99rOXDr5aquDAXPQz/NdVhLLa6kucgGv+
 7WUw02KZDuxft9A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add SPMI node for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..2eb0d9092da3218f75e731e49132a9f8ae4d0c9f 100644
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
+			compatible = "apple,t8015-spmi", "apple,spmi";
+			reg = <0x2 0x35180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2351f0000 {
 			compatible = "apple,t8015-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x351f0000 0x0 0x4000>;

-- 
2.50.1

