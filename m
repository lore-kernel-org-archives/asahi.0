Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134091FAC5D
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 12:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054167; cv=none; b=lW0Atk0250OEjkrxmQdujJlBp8K69eMpuTj6+zalF4klD7nSGCm6iH09JP5lTzeR25Q6dFWvGvQuOuS5UeQp4i3WR8nNBXJlOiRIERPjOSuQBnoeX9RpUzh3PvtbTdPoTOBCdRhQp5QJHBamQE6F+u7B+26WVaxG6uBP8g7rmKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054167; c=relaxed/simple;
	bh=zI2mU3THGBI/qZwjr8HPXhOqtbnEjJ7My15CsvuB0w8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QyFlKnNslIT1fHJjIztYwrAXCnpQTsNu+cr+Vo260qqfWPuWosyIP3JaR4Fz9/7GoGU9QXykTskRHkqUMrvoEN/O9yBq3n6k1peO7l2ZRQVV73FpFsnta6INxCu7DyqxjVzkKF20QfAWVTlr+Za+7OgBOQbr4uKpTpS01Dfos44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJOZmU+D; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJOZmU+D"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220d39a5627so12217685ad.1
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 04:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054165; x=1740658965; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06j6RtBWf/SB9XKP5erUkzRtmNKED/ygWJtIdZVtIY8=;
        b=UJOZmU+D4RC1dYY8TrGyGS9Ui4q6qVjh6aZO2vjXaEJIVXqoJCXubydnBEM123rmhb
         gOBYWea7le+65PTaXiTBqLYLZgbz8+EwCyDCXzKVYogViRTQ9Vs/cgxH4/xuJuyFQQGX
         IW16X9T3iNY3sM5gWLvdy9CVBXALWLcJK61ek7Zvx0v1a7bxj/JVRY0BtU7QkW65ua7i
         E/l7YFUCTI0mrls1fKTLu77YwafxjRzZKZP3rCcGFyufX/aAB7HtoGZYvPCLNiax3VI4
         sFTiHbAVPRHQbBpyJhAiEmSXaiMrC3gHIWKagdesqMrTe+BQoIHE/OxPCSeEX+vcMhmD
         iJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054165; x=1740658965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06j6RtBWf/SB9XKP5erUkzRtmNKED/ygWJtIdZVtIY8=;
        b=KWACbUcJl+jorG4fZzcgbDqEOJ8D7NlOpfSprMCpd2QrB7xuf8laV3822zAhVmjhzL
         jAir2+5ZWmhUZGXFZsyWfGmITbAu8nARAKNGSRo22Do5KIB0z2eCFYKnY0CwIEXdEfb1
         J8t1UTkIC6npNfzbPSIdS7AMUhDukBp2te+EnbxgcUqZffUmkKoknQHjwN0eaRecL6Qs
         6/joD39ab+CYfcnu475jz6uGMxZhTYv2MrdsLRpcrcmr1orEJegTa+/HpV9pQl3duD0X
         0k6OXVBt9IrYsPoDQ+aCCWSLG3HUbHUZDkiUIxnDPTnq4yeMZQn01takz8qJa5EUjCM1
         HhYA==
X-Gm-Message-State: AOJu0YwXP5U6jf92s3NWMwlc962RCl1CidfEleAk35dPORU8L2EpSYOd
	c7VpT5KbGookbEmjXxoOTLEX45fSiCezcaCHP2L0khaHUMKN/pMJ
X-Gm-Gg: ASbGncutO9blj9g9E4pnCqY2fH/NZ/rDK+P/BJrEew7XLTqI88A2+xUbAOPQ4DjUj31
	JO6plXmmOXEBqDDeEvzOns7YEHzQz+lS/lUl8yP0mSdUQH1OYjaZkDAAHukHVsZR6PIiOlUCurj
	vCuWvL1UFHgurzbLerv9k2V+ArmXuSkAUyjUBWelu2dzJCfl0wLBCWuO/eBtcOEx4BH77dWc6VL
	g5+fjK1jpG8MS2VxRDf5aANyfbDwqKHxnuZQGM5oepMlid6Izqb6OHN5vu+M7hquzm2JnY8n8mx
	fv30Cy0uXfHTbj/jnA==
X-Google-Smtp-Source: AGHT+IHX6zQc8fZnaNaePdFLlfV/v0LorrLqzr3llooSCuG/RxxUTULc9mi7JINEeUMKLM90DGF+1w==
X-Received: by 2002:a05:6a00:190e:b0:730:79bf:c893 with SMTP id d2e1a72fcca58-73417248c3emr3713491b3a.4.1740054165339;
        Thu, 20 Feb 2025 04:22:45 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:44 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:48 +0800
Subject: [PATCH 7/9] arm64: dts: apple: t8011: Add CPU caches
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-7-2c7011097768@gmail.com>
References: <20250220-caches-v1-0-2c7011097768@gmail.com>
In-Reply-To: <20250220-caches-v1-0-2c7011097768@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=zI2mU3THGBI/qZwjr8HPXhOqtbnEjJ7My15CsvuB0w8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5/AKj5vauHYhz3DfFfIX2pH9PD+H337k4Uk
 5uSEa5+wZqJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefwAKCRABygi3psUI
 JLuhD/wM4qvX5zEl3VWs0aFrwG2bhjCQ4fsHzRIbMX4t/QUJiSFPMj4aZzuijF356s9GNDgoDKn
 EZ5g9VoT8Dg+98rBT6uqeHXj2L6bHTcyTiy9t4xY/NhaGE4ypIyshyoNL7DiUsC6fy1YGWi5rcV
 McmYeWDyZo5ViKj7VYF30kYsHNSUTArkp7AdtInWMs5AKNbryuLtLsqDAQhDxVV7r5/IKlDHWB7
 7502iVR24IfrXOjvIhvCn07cvdTVFMXOtXWTkO8KwI7BagcMRBp+R5mSjvD5n3kadAe1KM5CoZk
 LdlYuMnzi2WEJ2SD8ITlgPNpmxbRMGtn6UDc7zAUn0WehYWBKImzKTbfha7a5140/utSUhgl9Zp
 ctahKcWyNgZcP2i15R6XNk+K98qnNc6Fq+QGlv0g4RsgLyQPPZt7WGdgMxTuNiRxkYvlkLt8r4m
 JiNtxJ2Tiy24xVvz00Av9kuXL5prj87h0s+4jqVB6ipQYpbyK/PlgfISQwBkZmxB1n1pYktm8Ck
 K1/1xOEE+YEDxlu/nDUXDQwjsi/KMePbGRLq31s8deKjKMxTm+zYyCyQbpFVj9DEh/2XoUXVo3k
 1xwujG1l5vIIYbNrqcVuuqRLTs0pBohjQbv0NPnsJad4wv/9+zN1NwWxsAZsfj4MeK1pF4xY6Ob
 Q7UxJoG4IhI/Q5Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add information about CPU caches in the P-cluster of Apple A10X SoC. Due to
"Apple Fusion Architecture" big.LITTLE switcher, only caches from one of
the clusters can be used at any given moment.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 5b280c896b760dc8b759bf38dae79060e34dfc19..974f78cc77cfe28d3c26a52a292b643172d8f5bd 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -36,6 +36,9 @@ cpu0: cpu@0 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>; /* P-core */
+			d-cache-size = <0x10000>; /* P-core */
 		};
 
 		cpu1: cpu@1 {
@@ -46,6 +49,9 @@ cpu1: cpu@1 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>; /* P-core */
+			d-cache-size = <0x10000>; /* P-core */
 		};
 
 		cpu2: cpu@2 {
@@ -56,6 +62,16 @@ cpu2: cpu@2 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>; /* P-core */
+			d-cache-size = <0x10000>; /* P-core */
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x800000>; /* P-cluster */
 		};
 	};
 

-- 
2.48.1

