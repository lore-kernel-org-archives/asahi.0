Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFED1A0AF0
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734890025; cv=none; b=oIT/Uw6peNQ3bzvrMGQvBpOO3WeynSDOYNrdLKvuRYglJPPDJ/6SQVjKAsbP9NdpWiYeqNL9RwRDD0+nlfvGspFiwPLJOZn2QJMdsWQUOKhKWQCJOxaZ7DIuLWrm4Kke57IOdbMaNKyU4jske8U9rofLJ4leXFURmwlnBJiDOEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734890025; c=relaxed/simple;
	bh=aNVyNhmufGOOGpP5E/L6Pio6VeurXSd1E61mRhniR2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NBZa/0QBDsl4hjeIevtYnFKfgiYgtsVd4biS3IM6q2/RJEPKGmJSqhUa7JSYJ+bm3pLVkRIBaH21h2U4hClDGGUbga+nh3B/3exj5gAf+x3wVE66Xj9X2q1y0IK+UHwbeLWN1hg8dTA3r4gOonldwKGZ8TjGALt5AvaW3RJsIJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDQ8rlli; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDQ8rlli"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2167141dfa1so30782425ad.1
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890023; x=1735494823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8quqDbvIzDjRV3soAXIobPs9f6LGdQx6F8kthQIS+s=;
        b=VDQ8rlli+ImaTvH5SsHDBI2yjBkl0U3TYa9AED+7YrvPzVXKjjUwi2bQSAqlUmaS4B
         fv8MmbPDPvrulL+ptpuitUc6wjNgXvZ6joXRNvFTdr+ViGs+/lntrsPKMAkT0eKWXMZQ
         Y/Y2V14IE7cF/oaIP/8aYZdETNYRS8r5XVv6gzrtM6NF2N1IBDmaTRtwDnFXUW5GpdNi
         NNn3ePOz9iZ3O9FTGEaS7kkfngwOiYah2njxCB3RcH5Zy0MHchTB8zioiCOBRlowqPUa
         P5WEw8tELJSrt3CTJBmNm28PtroifwyZjsl3LCxLC7MS7jocF5JCZYW3NTDlCajO98/Z
         Ct/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890023; x=1735494823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8quqDbvIzDjRV3soAXIobPs9f6LGdQx6F8kthQIS+s=;
        b=AJVzpGdoSCJojogb+QSMgEzg9ZlznPkEUOn3tPrTmsH0EprbrjGalTxD4pATPS+0Gf
         n5TArNFA36Gl4h6CHpKmkQSzpESXjUn93rp58x5/ozy7JTGA0iBhRCWEVvEdBR+LCL3b
         n58GSkF+b0mLjnXfECMYnjGeHxaaeUa79nwMWtCbkbt0s7ohkWRs+lQ/pElRa5Tda2/u
         zlUVUYE8Eu7T8t3pxbp8e+MvcD65OJYFsASXNFdaXmC1QsD4cuVLdGTdarptnI4BxsNC
         yttgMa4eaGR8RfK+ePkpf+fyq25QR/AQrmr4GGDVNXTjvxeTWYa2s/ZUtJ/IohsDkM4e
         OUqw==
X-Forwarded-Encrypted: i=1; AJvYcCUz6IsfS7ApovaXEOvjzhaM29BJMwZCWGf9JPzSB/yXwb0UbUj8i4rqDDgGf29YsEMEaDuybA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+JsI5WpKP3c2vOs3KHsn4sTzhRMXjJB4l3ytuaJcev7DW2EyO
	QhOmGFaJ5ofSIr7RoVcSWi7+zsDplnaXZUPeIdqaWaQXbeKOW78o
X-Gm-Gg: ASbGncsw4urkCaWanOoJA/QxvFsoTHKGvsdxsQNCJNnge4aKvOqOhh8sM0CbafpEooQ
	gav5IPjliK1Lob4pQf6rzTlYyggiewe2lXFi0SxZaNtbVxyURF0eEGDiHXAoXOeikWGBEqocJCz
	+Cp+uIHfj75e6OTsPxYI5WzDvfwMhsDDC1unPko+TdKOO88gvTKOx4DIRo4molMp5yb1V920xp9
	X5vqkXCiCdif55gvhrOkWWd82XGSrF9e5tmOvI5gq7Xh5CfDtdkUBngvQ==
X-Google-Smtp-Source: AGHT+IGpgvTOHhq2hImZ/rSPNRXBsdgUbRBZyxdR2JAx10GDpZz4KoEJX4OK0tyh8MQs0GsB982i4g==
X-Received: by 2002:a17:902:d50c:b0:215:9c06:272a with SMTP id d9443c01a7336-219da7ff40bmr204906785ad.24.1734890023267;
        Sun, 22 Dec 2024 09:53:43 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:42 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 6/9] arm64: dts: apple: t8010: Add cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:06 +0800
Message-ID: <20241222175314.151437-7-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222175314.151437-1-towinchenmi@gmail.com>
References: <20241222175314.151437-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add cpufreq nodes for Apple A10 SoC. There is a transparent hardware
big.LITTLE switcher in this SoC. Spoof E-core p-state frequencies such
that CPU capacity does not appear to change when switching between core
types.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010-7.dtsi     |  8 ++
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi |  8 ++
 arch/arm64/boot/dts/apple/t8010.dtsi       | 86 ++++++++++++++++++++++
 3 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010-7.dtsi b/arch/arm64/boot/dts/apple/t8010-7.dtsi
index 1332fd73f50f..919e067ef073 100644
--- a/arch/arm64/boot/dts/apple/t8010-7.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010-7.dtsi
@@ -41,3 +41,11 @@ switch-mute {
 		};
 	};
 };
+
+&hurricane_opp09 {
+	status = "okay";
+};
+
+&hurricane_opp10 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi b/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
index 81696c6e302c..4ea8cf12e430 100644
--- a/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
@@ -42,3 +42,11 @@ button-volup {
 		};
 	};
 };
+
+&hurricane_opp09 {
+	status = "okay";
+};
+
+&hurricane_opp10 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index e3d6a8354103..2547e8c60cad 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@0 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,11 +42,89 @@ cpu1: cpu@1 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
 	};
 
+	fusion_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		/*
+		 * Apple Fusion Architecture: Hardware big.LITTLE switcher
+		 * that use p-state transitions to switch between cores.
+		 * Only one type of core can be active at a given time.
+		 *
+		 * The E-core frequencies are adjusted so performance scales
+		 * linearly with reported clock speed.
+		 */
+
+		opp01 {
+			opp-hz = /bits/ 64 <172000000>; /* 300 MHz, E-core */
+			opp-level = <1>;
+			clock-latency-ns = <11000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <230000000>; /* 396 MHz, E-core */
+			opp-level = <2>;
+			clock-latency-ns = <49000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <425000000>; /* 732 MHz, E-core */
+			opp-level = <3>;
+			clock-latency-ns = <13000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <637000000>; /* 1092 MHz, E-core */
+			opp-level = <4>;
+			clock-latency-ns = <18000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <756000000>;
+			opp-level = <5>;
+			clock-latency-ns = <35000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-level = <6>;
+			clock-latency-ns = <31000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1356000000>;
+			opp-level = <7>;
+			clock-latency-ns = <37000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1644000000>;
+			opp-level = <8>;
+			clock-latency-ns = <39500>;
+		};
+		hurricane_opp09: opp09 {
+			opp-hz = /bits/ 64 <1944000000>;
+			opp-level = <9>;
+			clock-latency-ns = <46000>;
+			status = "disabled"; /* Not available on N112 */
+		};
+		hurricane_opp10: opp10 {
+			opp-hz = /bits/ 64 <2244000000>;
+			opp-level = <10>;
+			clock-latency-ns = <56000>;
+			status = "disabled"; /* Not available on N112 */
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		hurricane_opp11: opp11 {
+			opp-hz = /bits/ 64 <2340000000>;
+			opp-level = <11>;
+			clock-latency-ns = <56000>;
+			turbo-mode;
+			status = "disabled"; /* Not available on N112 */
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -52,6 +132,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202f20000 {
+			compatible = "apple,t8010-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x02f20000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0c0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0c0000 0x0 0x4000>;
-- 
2.47.1

