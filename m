Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C67E1F5837
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 12:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054173; cv=none; b=gf/yETNIiAraD5Sgfv1j/ZgUkDEsnDXKMEcuAcAIrQEFpnUbI1cIhQNkVUVk5rwi57z0NNSKShevVFbs1To1voI7xRq/LiwuiGezT9uRm/6CsRAXIfq5qQs+CxTyUJfefJmXh6Ag09kUoijGjIy9ip8izoI5szAVGFXwNgZggsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054173; c=relaxed/simple;
	bh=6VGsP5C1mUSlactoow//Nl59ChZ/SauVCkyBSv3d3Es=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8kxbcGzBaUoe+CZ1QVnt6ru149wWas2YgKMC5PdcKv1hP69Hii4RiKRmZb2GPNMephfnHuSzaNpymzahLc7ACIfn++YOEOcoTubwaibjREiepjVs1qwmgkK8psJzvJIVf/EdYkAWHYb/kQ7nIiUcUe+E/a1dcRFEI1B82J7ayc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F89LhcgH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F89LhcgH"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2212a930001so21229385ad.0
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 04:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054171; x=1740658971; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12zqbyR053JAU8mkDwPrvzWGvMGsApTV6DX35umkTV0=;
        b=F89LhcgH8+IDAPvKcAk0LVoK44OmOe9T+X2m2Ufyvz/tphrl6xRV9mBWDa/hGubdQb
         21cDBes8wg8UoWXcqCTqysk+N8DJgkWoAB+Q4EsHJ3WnqPxZxTy6utlAKwZEjvZrYr16
         ekXiBsdyOyieLdH2REhsZE+MNWmEmoxAQsQCGZ8iVYTAYqkrx9p9FoWDNhXlfa5BkdfV
         dbEPT8REQJfz3pQgjJF5HT8FkEelSpcUacrGEmwfgNhljL/iDelQGq81V3zISXJM+h4m
         3HaLfPXrVFZzatvEhbmu+lEtjfMIJd5NhghB3/MFfJElMp7yo0dYOdPFxbAzF96Ridsh
         +4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054171; x=1740658971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12zqbyR053JAU8mkDwPrvzWGvMGsApTV6DX35umkTV0=;
        b=v+D02hCFy3j0HwT7CEHA5FPP4Tu0bNmD09cmQ75wITabqmMrhqeMtpLZLe4LcTcvNz
         BRlWUSkdje2644J3ka+lv5tIhR+Q4sjLA/2XMzBNaoxvWwQ3JOms6q01WNe+ZUc2LTsN
         BxMkUy/PmugrhYmfDnFDDgGnDHXNBKyCTAtk8p2ykznBmWqAdeXk3HmEHpWY+zDi6DtX
         tjZM/8kMWrl8LxC9BKOap20uDYy5GzPpXCyqgE15tIVnhKvwdT1LHiAdfIZXm1AlqQex
         RmMtjkSaqzFAMRVVeNqA3pY3eaXhoJhnHJml8WOMTq0aPixfpHDpULOTNBdZpbBuXC3F
         ytqg==
X-Gm-Message-State: AOJu0YyAMmLDw+a9XweaksdwxTFxcFUX5jJDjVKyni7++q5+/yHMZdpl
	HQDm93Vodp02COgAZC9txJRjVxDBNdbtrKWaxUZP7iCgN2Korpkk
X-Gm-Gg: ASbGncuWl4tF1EFlcAxdmggIFF5oWRVC7uxRzeYVtxHZ3f56IwhNiHYxRNV41+DOzlC
	5TU8X4VjsedfOs61skcwNytuCgQvJFgwzWmUqhv94zzjH1TtU+VvfjrL2l1q1L4Yg0Kq1mNOq1E
	sv44XLk/f4szNoNPk7/Taj1eXgPvnc0sSfCzPLQzVsL7GCwTFgpgSivLTBfNoegW8m7uLkVft1/
	77iKcKpd5Ie3x4W1oJPy8AIgHmpS2VuCom+Nmjen5uS8VgEuytwsxZ/8cLYCacW16YNaEdmQtM0
	NF/xTO+q5voKaKkOeg==
X-Google-Smtp-Source: AGHT+IHecW5Y8kLOhZQX6jvzcxU97SSW2l2zlY2HIPmfrm2xzYaS1crMHnLcc7ZONqRqQQAfBj/B6Q==
X-Received: by 2002:a05:6a00:2195:b0:730:8f7a:27f4 with SMTP id d2e1a72fcca58-732617a4a79mr30414248b3a.9.1740054170797;
        Thu, 20 Feb 2025 04:22:50 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:50 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:50 +0800
Subject: [PATCH 9/9] arm64: dts: apple: t8015: Add CPU caches
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-9-2c7011097768@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2355; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=6VGsP5C1mUSlactoow//Nl59ChZ/SauVCkyBSv3d3Es=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5/a+YVG+deJ0Nr2fwotL1kKLBzPkzU5tQy/
 qTpx6SuLeiJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefwAKCRABygi3psUI
 JJ4HD/90gXqkkbacSqy5KnE+w1N1e31n0JOSxIazQ6ex4qCut08tkl4/4KKfQDTqLWx1bRmC6Ro
 BmJ72nqMXNsP6M12MwndhaKXtHVKtcsIWpufScOZGpnV7BK4MvF/fM1E+EomxRJJ95oDr705j3v
 JSsQCHYKgbBOoZnFdvrwIOLAZPgnEsGptOFsYmC1cqvi5OiLLs1woYnHJxahOGmEFZzXvTUBxby
 /PrxQp1Hbu0gW6U9zfU5a6QXh89b0uhBcZ5zeHN7jv3ndXBZzLYsyhGk8Ic0+qXtJ95VxPuZ4u1
 1rJPybeizYGSW+ST6G2QZ2hV/5bExjrdN/nBMlqX0oU+xpLNyzXiGJEvgtR0UzmIq37wYsk9MWn
 3s3N1AP6X7EDFTHNzyB2ighs9yEbCw/eLU0bMnD1xBZmE2OhDPETVqR7bqRRXuSPdLaOMRA6pgf
 HXT5FXDhki0kb2nNMQ84RNR2sBzxpkmWz4uHGC/uoHN/49fVrNU6x3f41xvxD6Gy38vbVZNkEQN
 ocUA/F3Ij1urqV8xYarinY23Z6KMcUjrAn8WYHP/GkoXI8j0fCUBalljbFeRg7tVdrgeXokUbRp
 3BJpcctT9Pv3GSoINdIB6YMreZMtr/3S1Svw+v3/a9y5CtF+IOViydTL+qlyZwgu1AB4RXYUNJJ
 tnjIMwLFCCG3Zgg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add information about CPU caches in Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index b68647bebd20782ba7a125e670b3264c184b62cd..138073dbac3c5a3ec495b078b3714cf800b471dd 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -63,6 +63,9 @@ cpu_e0: cpu@0 {
 			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache_0>;
+			i-cache-size = <0x8000>;
+			d-cache-size = <0x8000>;
 		};
 
 		cpu_e1: cpu@1 {
@@ -74,6 +77,9 @@ cpu_e1: cpu@1 {
 			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache_0>;
+			i-cache-size = <0x8000>;
+			d-cache-size = <0x8000>;
 		};
 
 		cpu_e2: cpu@2 {
@@ -85,6 +91,9 @@ cpu_e2: cpu@2 {
 			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache_0>;
+			i-cache-size = <0x8000>;
+			d-cache-size = <0x8000>;
 		};
 
 		cpu_e3: cpu@3 {
@@ -96,6 +105,9 @@ cpu_e3: cpu@3 {
 			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache_0>;
+			i-cache-size = <0x8000>;
+			d-cache-size = <0x8000>;
 		};
 
 		cpu_p0: cpu@10004 {
@@ -107,6 +119,9 @@ cpu_p0: cpu@10004 {
 			capacity-dmips-mhz = <1024>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache_1>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu_p1: cpu@10005 {
@@ -118,6 +133,23 @@ cpu_p1: cpu@10005 {
 			capacity-dmips-mhz = <1024>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache_1>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
+		};
+
+		l2_cache_0: l2-cache-0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x100000>;
+		};
+
+		l2_cache_1: l2-cache-1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x800000>;
 		};
 	};
 

-- 
2.48.1

