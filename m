Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BB71FBEA9
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054169; cv=none; b=HXN6OIGQADO63Oi71Dcy1ctrekpV2HkeSjYMX2O7NEe0WyQOQPRghKOmY7WvHrOctn9/LYueDkRxd/GuUjstxPB0Y1QZdCsZ0DchBURgAeLftswjFHBnOSLpPn4n3qWU8pgEN98EVF4OxHHowYGR5oHxAb3DucDu+Dqg+QZGAHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054169; c=relaxed/simple;
	bh=G+mx3kaje+P3ZyUO/ditIxszcN7HViLpZE3JAiY3KS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tSeBNV+9Mm7a7/9cFJY0lNiB3I8bS7VuLRzVMYMHIUbcsjzSmZQpgUWGN0SAG/ULpDOvVFv0NmrDWAHSxxErEdMM+g9OJ7NrWyZKbvtc/WR/1u18OM1d0O2wXScPypjnzBwlBbFOgSMA5SKTW15USInNdjy7BAOFoFWz7GPuDjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g72j8iOX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g72j8iOX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220d39a5627so12218505ad.1
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 04:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054168; x=1740658968; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pPkPkgzwh7OR3QLmRpEkbwB8adYmbJspMBYICok07c=;
        b=g72j8iOXBMm8w3wXHhbHQ5X+N49wR8cDdmlXcqCaZldyp55rNwOfNfEixD0CSQ2BX/
         I1kybGnN1uHYpoU3/5EiK7BYQSkQcjSzfO6Q8c4u+4M7dh76UuFQJ2RJdtQ+8zAko2aj
         Ym1yBy6K+olE8TRjeND9Aj+God4JSsXkl0ydgAFlakV0Qi6F0L9rYyjWMJX6xlH5mmO7
         mhIMF2tSeN3JiyEnSzaEZ8dXZeGCVGvxrnzRbJWCx77km0HXkh8PKVAfSpfzflS9a/FU
         K5KGiDFMU1Y6Zp1s4k5YJjW9ZBR0PHMz5Gdgs4nxoJ929zw2nMyUGcn5fIPThEBEbFbD
         AJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054168; x=1740658968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pPkPkgzwh7OR3QLmRpEkbwB8adYmbJspMBYICok07c=;
        b=Zv8IhzykEZYDUWqbygxxxPayJDAb0/Xp5XIITVUVK8XUC391gtxD002/swN9yzenbL
         opa9J3Fz+zTiFheSgzaMKGVbb7Sa13w6DTHGV3wy3tX60Pt+jWJxMPNAw9uRrRlNG3zy
         LClcQwU6EAdyoUPPa7jfpGqhmOB/W6xK76or+CPFdnvIuxkLE9n2MqRx6f5ewnXx3/nB
         3RR49tXEucX4MSfuJeiUymdCWpUXuUlJrJFUIXwkxjcdorb2AzxfpcG0+DrT+vjtd2Fj
         SsYv4dvn+E2MhpOIixLjhR9NyCrp9e0nJ9qyvY6kMER4sJ2mUBCoSlzq1puD7woJU5+o
         VdDA==
X-Gm-Message-State: AOJu0YwNehIGrOgYPDjmEuk3D0H/aNy770DfUzVW6xcTCYZGYL/vwhZH
	9vKtDLLRGUPVTYwc/7S9tMD9kcGyaMJfAHWyidl1Nb612X8mmNMtDYycXw==
X-Gm-Gg: ASbGnctTCHPryQm2fkaIpMnY9RrbD/z8H2+vWSljCiRVqTeqJ/3DgaQQK48EJ8Y5wa6
	4n6wQ4FQkynaG07rTx0zKcKCExnsYNA77SkOoktAtJGdndw4/sDP7xe+RD49Vc6bTVasQOS8yHq
	Y2n7JTAbTsy159KNrZG0eggsNN3W10JQklbWF5KeNIhH3+bnjRujmqNq7MCFILWYTx9Q80yJIAF
	YLD08MPwmnBK5ZLWIK2cgaJAkOyoacehamn3FVLphZibj35nPvptaV3eDvW2LkQGJRhMoLJRKUE
	V0Lhx7MlEB83UNvS0g==
X-Google-Smtp-Source: AGHT+IG85l5eWD/ehvahhU8yOCbGoLnCSNPdVSu3+J6g3K5WKnhM9iZZ/yg1bN3TtK4C9Qa6bRevFQ==
X-Received: by 2002:a05:6a20:2d23:b0:1ee:e439:1929 with SMTP id adf61e73a8af0-1eee5d68e2amr4689789637.30.1740054168046;
        Thu, 20 Feb 2025 04:22:48 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:47 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:49 +0800
Subject: [PATCH 8/9] arm64: dts: apple: t8012: Add CPU caches
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-8-2c7011097768@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1363; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=G+mx3kaje+P3ZyUO/ditIxszcN7HViLpZE3JAiY3KS8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5/L3429r7pYcCYbI4Ok83LdV+FbS1dAwtua
 kdgMttCz3+JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefwAKCRABygi3psUI
 JPnTD/99BMzSdUN1zSDmpMt9J6sLssoVIIAofLDDFZqY3AmmImgCPmW7/4gTCH+RCSjCoA1unC/
 DqcO8Lnz0OgD26lYrPdJeRc6O6lUVNP+YQSD1P9HN6VLxf5X5sP2F4mCKCG5HOCmcziKY8VeuHh
 oPT/rwbRPyLePLHNW2jmRFlIIq8c1o23oYqeyONp8lGuorFuR8ePgu+hZfnEh+mBM1LazZXZbVE
 uR7mJURz+Lf0DS+EjKq08ORExS+L5PBtDq5OpSzhiPAB/A2iOTHBeDqfYBhDHz17WIU8IvjNj9O
 siP8Gjd9U3HyM6r2268VUNM1KrXIh+HCXi2LjCLdLrBLQfTTKRg1PBGY5JthVAP9W047OGdVc9X
 SIotScz2fOpfG9KFcAwnHzVnTtO5gHClX/afXr0VVceter2NR7O0vuMsGcgHGYbPKdeJUAmr/ZD
 wCKG0+RtsFRIy3Voil3yojqW6mAsamyzGLvS9h/FYwy+B9fANXJ0/vQW2kvZesQ8AZqiuRvQnJD
 pV6p3042PGur6NR4zljlyXgnPXJOI511rlsZTYRgP9ZCzghQnV60fJ1TIY8r91EErCrLtjBfIE6
 xoaqB9RrVcULQ9AgtHxxIgo6Du6gjBHBcsq1quAwEWei9SNEE2KB+ttkBl0ChRhuKmrMhBd9uTW
 FBcsHjWvsE5DOVQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add information about CPU caches in the P-cluster of Apple T2 SoC. Due to
"Apple Fusion Architecture" big.LITTLE switcher, only caches from one of
the clusters can be used at any given moment.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index 42df2f51ad7be4c4533e76d18e49a9a747b6b7a8..a259e5735d938cfa5b29cee6c754c7a3c0aaae08 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -36,6 +36,9 @@ cpu0: cpu@10000 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>; /* P-core */
+			d-cache-size = <0x10000>; /* P-core */
 		};
 
 		cpu1: cpu@10001 {
@@ -46,6 +49,16 @@ cpu1: cpu@10001 {
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
+			cache-size = <0x300000>; /* P-cluster */
 		};
 	};
 

-- 
2.48.1

