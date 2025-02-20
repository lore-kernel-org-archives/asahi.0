Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510171F75A6
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 12:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054156; cv=none; b=smiMWgCFa/LTwK/gRIAoKQIxBw209ooLwnEmLcqFM2MgxSvIKhI1YrZc44C/+Rv4doQIwUuz+Tq8MQW2+5Ok759MCvRI08jl3KVGIYGfJE7BiGfgPUNSa80W198yFfYzj9NSXWhbzAuKaAIx3JO9wRDUIai0BMcuMGUK2aIQ7cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054156; c=relaxed/simple;
	bh=3dP0oDAIN/InBoJgIEEqaYRol8BwNynu3ip0BA5Xbxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B3XcmLOGU2gPGLaYegqIViXqOsEldZwlO+Ura43Amf7+U0CO8QrczC1Y9d+hemn7RdqiJ99D6uf5K/2lofLlA4IygLT/eQh1vPbEXdtR6pSb96hDrDWXJ7jDaGlJxE3rjgStikMTP4aYGRgIWg1d+FjFEB8//veJg0ceH8/m2WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jq/CfjtU; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jq/CfjtU"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220c4159f87so10940525ad.0
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 04:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054154; x=1740658954; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBuJnAWVhO28mlOCOrO1xk7g+eWQaeRbOJaWHDeNHoM=;
        b=Jq/CfjtUFGQDzmE/sBogmLaZLj5oht4MIxb/hZtzoY7C0Q9zcIIIbwbWk0r3n2sirY
         vQeJt9Do1AxFZdZAvlKrcZtBnYWKFWFWo+d8jT5XDsgy6dLsBn6EsbZ4lUdEkAPGRXZ1
         7wYAOod5fU2VYPZXqHODgo+QxteASC8kYyCbxIPyhEPUH19vAGNowZUits6/xd752t2G
         hTQrXDNqXuGriRVKakcnSlyOIvVFycPlJ3ax9f9StT6LyuwJKt0FtllwJY6txaILWKd7
         xi3RFAI8J7EQIGS3tLXRueDKG+A51eqCR4NyBu7B8SEe3m+7w/89m8QpXAbiVev0znpP
         Oafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054154; x=1740658954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBuJnAWVhO28mlOCOrO1xk7g+eWQaeRbOJaWHDeNHoM=;
        b=f+5mEGcx0LRukJ7doM/z1TBUqrYUk6J0yFflNyf/p1vlSGB74Uf/htG5w3zyWnQa/p
         SZVu/Al+4aHtVx2WVRhZCxND+o6z9lu3EvnbHJABfanQfqweQSLs7tysX0Z04z51IeIa
         y1nZCplFuQD3lMxIKjTEgStz4eXupfh8Ne2KFb+TVOK3LWDZV7NIO6tZHHtlq/xCAhAL
         OB8z4vki8o7/okVSviaw+ZVsOFgK2Y2D/rFw+5EimoQ7lchAx452YCtxEbb9KqjzfzGX
         +JtK3J7lrAX0m4Lnr8YKxQvv2AA/JwHMdzOmmbs9UfPou5qGyyKP3IZXnls6ZXK8hfUU
         6OnA==
X-Gm-Message-State: AOJu0Yzqvuwe//BM3kAdZK8uguSKSF5WqfaX5z+s2rK/ju4EM4bS1RR7
	sbemKjB1x8d7ZpnbgT26GCnWbZX3G7bLAqS+QcR/iB2iAIzcdBgqVIzp3g==
X-Gm-Gg: ASbGncuRfsUWe1nS+FJY08ofnDNJeIN4xuPcC3OZAF8y1NRJ7vzHH3T988ZyZefXLVQ
	z3LGmfV0kFiT4yFc6wk78h34rWBJlPPrUlMbJgpMpsPilGsYa971NJ2dYNmBkggpsCkn1gwnsGF
	c5OrVu/ZELzBZo4m1KHq4IM7VLbZPgum4hZKx5b+n5DpEcO+qJkVb2tIl7HYZO2HeZTrEVeTxVC
	nzswLhO/+oyXpmcL+LqK2mXdxIJN4wanGg5g/L9sWb1CSeVPJZfegxG0TUGtmG6yYmXCVDfgvEb
	9Fkh3+aDUhQBHUGh+g==
X-Google-Smtp-Source: AGHT+IH65NfsjOzwTpqmb7nGlYrkljWx2zuSmpAI4ns0SFN1VCagsWWVvimBp2kuvzzwPZxNgSongA==
X-Received: by 2002:a05:6a00:3e0c:b0:730:75b1:7218 with SMTP id d2e1a72fcca58-732618c1ec6mr35494739b3a.16.1740054154443;
        Thu, 20 Feb 2025 04:22:34 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:34 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:44 +0800
Subject: [PATCH 3/9] arm64: dts: apple: t7001: Add CPU caches
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-3-2c7011097768@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=3dP0oDAIN/InBoJgIEEqaYRol8BwNynu3ip0BA5Xbxw=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5+6R8kl4XjwXno6F3R1YST47PDcS75fBq9D
 rJWwg4NDTyJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefgAKCRABygi3psUI
 JH6bD/4+Uuk91oX9dOv7aKSCauwvonXydDd98FtccI7OIe68dRR3+FUfJTG8uyXR+pYU/mNKFzR
 ZZUoH0VGqFto509TYITNK/SpkOdFyiXL6HeAwk7qJOfsPMRc3sigral9s7lvLIbUdtUiz6HnDCf
 fBBBbikZwjRa+DD+uJaQlRC1w1anizTEWrGL6t64YZfOSj2AbeJL7Zstv6NQPVhGPkcYfTZdtwL
 81ZYUXPCHpSPuqWPS4QOYAsJUQU42XHCq/bti9nI3Tck9VSZ1nKy+re7Qn6os6ONPaZB78/FNHS
 5e3wazbFon98qhpKB9zaR386r5uHoVcCidjHi2FW3s/zL/3XFOifV7QNwf0EpJRJFGrh7unBGsY
 21iPBE1hav7RAnWirgmnQJELJ2Wb0M54976wFqtSC/DLGK8+v4Ly//P7s2z8tWESSKshNVpqNzi
 l6V1S2D3hp5E6xIh9l9Z3YuOPdqotRyTUZmjoAnJpl4zG97rdRDqpynbdwTyGmNncZGeo4ipggQ
 COriGrhTb6WgOIDPzd2Uu+uesy0JCbkMnrTyc8npg7Xo86G/lCxfhS/8BT03so0KmwrYgr4OcSW
 sKQGasFL7wwrZv3Ru2IDH9jP+tpRlD1CVdwZLJWbPXioIlq2obTiTytTwZ+4bG9TdjEYKMzoCva
 HsyzDzgsE+iB+/Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add information about CPU caches in Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index 8e2c67e19c4167fc6639458ce79588e153336603..a2efa81305df47bdfea6bc2a4d6749719a6ee619 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -39,6 +39,9 @@ cpu0: cpu@0 {
 			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu1: cpu@1 {
@@ -49,6 +52,9 @@ cpu1: cpu@1 {
 			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu2: cpu@2 {
@@ -59,6 +65,16 @@ cpu2: cpu@2 {
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
+			cache-size = <0x200000>;
 		};
 	};
 

-- 
2.48.1

