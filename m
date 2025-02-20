Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768881F5430
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054153; cv=none; b=dIGwj+RGkfwP2ioRrDiyaMKx+Q9rz7gaRkes9jU2/ioZDb2sOkUfEfT52itnZPJoTVe8gKDPL8zHXqG+Rbdr+/jpDpAHAPJk2d2DMiWr5ZQg4t2ivMv6plPR42DZ3ZxYCHIEPJzMSPZmhOp3gf7uxtNFJUzmiv9kWQoYl7UN2nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054153; c=relaxed/simple;
	bh=ZoFAboTTORCIiwfMRZBtk/4gIxbXbV5LowBP1mj/Ne0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJYRfmzeORav1GQNh+0C1yJICVIQGpcliIzpSx+OzO5FqAuoA0Mays0EJZTyol5rKMACTixKA250oKYebgRp8FrS8BniCsTGGEurQV1osiz5CCw+qpuNTW9uK4RHIjACtk5E8XgE//oeN6WBxh9H67t2Ch7yfGpl5WSasSt0vck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgVA6iKI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgVA6iKI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2210d92292eso22456055ad.1
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 04:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054152; x=1740658952; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTteZauPNy6vSlRahT0l3anygq+qMXyNmxkONLZYlOk=;
        b=TgVA6iKIndegnhzD3lcguJhNLZUILBPZCuN3CEipgbQrNnB2SBTUmqvzJtdABY0P8x
         W+wEO3KWpBz4SiYQsQzD16IM2FIj185fWVPrfltSoMjjKPw7gUZXUFh7K9PIYzqKyIvf
         o7okBl1D+RNU59eV05rrHvLMiS2+0jRL4brmdO7P7OLlEo2UV/+93wjA0qQ878FKR9Zi
         1No+q7BWFYN4sSczdi5kQJCHnW8kPqidCA7BwzMdU0R6XpUXWQIEL1FdVCrIhwPCosNz
         lM3A/FeZXgn+RdXu1msSf7w8tXyvEw3vSBqSfIiEf0eujaS1ZpIiyocHbHn9TbmbchYH
         7vuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054152; x=1740658952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTteZauPNy6vSlRahT0l3anygq+qMXyNmxkONLZYlOk=;
        b=kMSRx22zW5mxbQ/59+0jq1MjL2qcd+gc+wKUfpaTFArN5XNsOLxNgf3TWrgURXTQuw
         TrPjAIk+mRDIf5+TpSq+/U/T+RWQJlQNu2YPA52E3C6/8waQzn2ppXopmiuC8PacuWUM
         kNdE20CpyMcEvPkqe3wqFFWVQkkOoFXCEgtvoFkdZZ6QNwt+zrZXZPYAt2kO1iqW6drG
         ASqw8kItYbtYB0QLDXRvUwIPniF6NRYFi0sLi2LanCvPmb24AMh29WstLgImz9EnaGMY
         DTgPWAKMD/lgQ5I0lDZG4SUXOECQuR+VjkyhL5ZmbA5fOV/yiPfgeRDjvprCJQOnjmMK
         YlLQ==
X-Gm-Message-State: AOJu0YwSD77PIMD4+CUDKQGX6e3yymZYRxMzYEqir4QgjxZo4n4A/gCH
	IngA02o8w4KWIYe7T6xeyQGMtIGxVwligW1TI3+C5azWUz4rx0E8
X-Gm-Gg: ASbGncvqbyVf09NAwYGFK3DHUGcElTPn7pvUidHl+RopgbhZXlBNor8ZmEITPtdFcS3
	UJKtJGPCd0cgUNsVpTX/sIidulWhAKVt+gaMZE6zC+g2RPESIXasBoWFk5EtSher1QBYshX0VJf
	9vsMt9pShCLQ6jC+hQb9o1YdXu7Od13r+IxKWBc+xZc02W8o4DGyksjstFaBBwr3okge+A1xktb
	YFd4EflhHF82G/hWsS2joIOdLa+mYF3fxNSlAKi7KrKixhQNMiJlqRLw51+KaYIA9YPMlnUtT9o
	/VFqsGbjVBysyD2J4Q==
X-Google-Smtp-Source: AGHT+IHbidj5ZO18Td1QTyEmiRAdi45GlrXUu2QGtSYq+K2SCUDB/E/xSTypUJeAm5+h+BQ1uKj1Zg==
X-Received: by 2002:a05:6a00:3d0d:b0:730:9a85:c940 with SMTP id d2e1a72fcca58-7329df59b5fmr13027683b3a.20.1740054151736;
        Thu, 20 Feb 2025 04:22:31 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:31 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:43 +0800
Subject: [PATCH 2/9] arm64: dts: apple: t7000: Add CPU caches
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-2-2c7011097768@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZoFAboTTORCIiwfMRZBtk/4gIxbXbV5LowBP1mj/Ne0=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5+LCgvVTDgoUd0iBlRyUgpGAbBux2045I4f
 yesRBGCmreJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefgAKCRABygi3psUI
 JEF9D/kBf5LvSkslGuNWkshtevt+gtvr6PpA6VRTGq61xc8YW2hC1gZJ+Rn4wjN2tLU0eCAFZpz
 WO98sKNPxSTADYzQFT14pDlMM9lx50sXJcmES2LUOJQ6UOkE9daYhheIS1kC5L++RNy6E6IUZB2
 /JqxIUtYiJGjneJU4c2jrViqdEzIG2sgctmLjGoxoIjsh59sW3ZO5Q4Tawn92HakkLIW+rYOuE2
 sqWCs9IQlDssCcZ6LCAWKQbGo0CajB/axd4mfDrax7vwM6bZD8H9p6oIjEL9GgZv8bO98O9Z3bd
 /dmqLiDZzYxRDqvifYw596GiSPbo8T8bqkO/mkwIUmwGlx3rzDV3p8kjQzi2MeANS3dYF0jatR4
 BmCepz1bTt1gjVq+v2AZW8xx/OgpeoWlDRV1R+7azeqdqMZhc9ICHaYWepQKqDVGfvxJhN3BFMK
 I53O8lpFOf29VsO70pKUZLDhTAZrWjeQBqqxoRQL6QDBmIHnLXkopzos9VczWwLTFpgGezRturI
 k5l3fPHGzbm6aa71sIQIW3m+EbylfAtqO14xw2c+PH5S38fI5BWi9NOqgqh3vwIR0bbcmOBPnB9
 rm8oecdlwZ96L8wpnm4M+4RXVI7guU0mX2L1YjkEzyd0wiFSLCD1LklfeeOvWAnNfO8Tm/MtLuC
 6eRDePdEEAEhWRA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add information about CPU caches in Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 32cac8c30e62d657079dbf32aece8af0fd9cef38..229ebd78c9d14609c30cdd011d1ec59847c846f8 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -37,6 +37,9 @@ cpu0: cpu@0 {
 			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu1: cpu@1 {
@@ -47,6 +50,16 @@ cpu1: cpu@1 {
 			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x100000>;
 		};
 	};
 

-- 
2.48.1

