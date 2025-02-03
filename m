Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C77F20898C
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 12:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586941; cv=none; b=LjMBmzmuI8azMBNIVzskb4+IDIZIonPFEjs2Td0T5Hm0yJPK2rPB6DzGdPDY+Rq/9J0rs9p4wAB4fSDwFpCbtN1e76Jp8fYVjp5Q8xYvFIHYYJaFZGnPI3gPLmHy21eAKpfeIrnMqlf/jENgQOopOiUHLzkyxwbjeuLVR8DPq+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586941; c=relaxed/simple;
	bh=VwogZdnPvxjvw4Pe6gN0bLmVoEtz9/Qo7ziG/XQPnfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CGJXZ+jiw1SMiw4T5TFNSBXWicoxnaTmCXuEbzYcMqZmZ/SzK3XLVLz7beuMOJhuUFdaf0ZaETDrZJKdcEBs+bV2gZxsaq/8uNLea4oeJXFB67RGdCcGfBFWllGdiTp/pI+PDfel2Mwr8T9X3tRoFvM94Jci3yrguqrEipLK9tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3MeZ/G9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3MeZ/G9"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21628b3fe7dso76581035ad.3
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 04:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586939; x=1739191739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByLWdj9po7I8QCmIxQThyezzisERxr+NIkivv2+pP3U=;
        b=I3MeZ/G97eZfmlRqFIbVgYIo9I1C11I7xsB4tKqV/fFeB6H4/FprcTYxh5X1XVvWDR
         yqxqwfmCJhMcGEwjfanCbhcJ/NA2unEZUjLc3TgLcskMb3ilX9jm2xV78GOzb8RL97oZ
         T8fwBQxKuZHW0om4UKFJQvsBNaE3LpUxdVFenXGJ6SqQ0+wMHleTyIjFDt1Xzai0rw1+
         T8nWYfHH7FamwYx/SP2N/rcz5k2JJmzcaeRtry59ulIwyin8dvefrv3otuQqj7WT55XL
         Mp3cm+k7aH7zd6NakY8QdL6ZIrNyMkMP725m0DAMAKbUWZLDPZVAlBtkeVqudtY8ByL2
         4/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586939; x=1739191739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByLWdj9po7I8QCmIxQThyezzisERxr+NIkivv2+pP3U=;
        b=JnrV235dU+HE868j/FAR+S1GpGe79eb0yFIY0Di4V7Qsy2terizi9DEriAzgM37DyI
         qeD9wHXoTrgOHhoPPNTYoQ7AOApzKFGC9M7jD6zPZroQq5FMlTqzF6oad4sP96mhQBGD
         VmYH0Q0zZB5FbMJPN6igyj5+TmhL7mc1KjJjZ8ttyg+eWYIYwLOV61Py9oHDoEUG7svu
         iPEVHf4dWPaig5AoIdqIbwjZxJMpDw7EEBW0Zkp44AsNb3oN1VPRpvpNX0cGF9xXsuX/
         8eI/Uji9WnuW4YMb3LUJqDiwfjIYubkj/gLuLDJKe94+rVczv/qqvIk0cJqVHtwetLEv
         cjoA==
X-Forwarded-Encrypted: i=1; AJvYcCU4+sFVhlf7rxkd8hwK+Eab53v9sW1lVIULshB33RATI2UI81UVQAVhYmopQ0J9kfFDNIfUZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPfc3hjcZ2HiLbD+GNbKDfQd+b0eSEMnTgjJG448UGc+3w5Ijt
	staFSkaXJc0UsOPDSSEWueh3wgE0uUf3vIZS07bPyJZEW98PnQmE
X-Gm-Gg: ASbGncuC/mo6NrGO3Sytg7+GMXSZoohTRgcBpcAbs0hzt07HQdAChtyAzbIuGV6PD+o
	iO0D+xRblx/U1u3aT+vCP5ZzbvHEK62V/o/rvTi4msNjbVJPfYclWs8e4jOw1f6e3A68E9O/tAe
	A+KT5JRNpywIlLkj4ft8VddC5NB0DrN0W3Vm+PueDpMeiR1yAeyg3Tg+1ex3sw8YD8EKYihShPI
	8ewUZJLgMOCVqyuJRmuiHtzsuY+6ssWmNWbicAbsCzDE8hP8xj+oUtO9ih4rARVhcMQ7M4QXQAq
	y7IzXxRDPhUvEPSa
X-Google-Smtp-Source: AGHT+IE+t0KDXYMwTSpBWi+pdAH/0ma6AXc8iXrbj2Cn/KnYaFBskDaPtkynAvbjwmSIRdQbgXHSCg==
X-Received: by 2002:a05:6a20:6a1a:b0:1e3:e6f3:6372 with SMTP id adf61e73a8af0-1ed7a6b78a2mr35007064637.27.1738586938754;
        Mon, 03 Feb 2025 04:48:58 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:58 -0800 (PST)
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
Subject: [PATCH RESEND 9/9] arm64: dts: apple: t8015: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:48 +0800
Message-ID: <20250203124747.41541-10-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
References: <20250203124747.41541-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add cpufreq nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 123 +++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 8828d830e5be..f93ce2c8b251 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -58,6 +58,9 @@ cpu_e0: cpu@0 {
 			compatible = "apple,mistral";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			performance-domains = <&cpufreq_e>;
+			operating-points-v2 = <&mistral_opp>;
+			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -66,6 +69,9 @@ cpu_e1: cpu@1 {
 			compatible = "apple,mistral";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			performance-domains = <&cpufreq_e>;
+			operating-points-v2 = <&mistral_opp>;
+			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -74,6 +80,9 @@ cpu_e2: cpu@2 {
 			compatible = "apple,mistral";
 			reg = <0x0 0x2>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			performance-domains = <&cpufreq_e>;
+			operating-points-v2 = <&mistral_opp>;
+			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -82,6 +91,9 @@ cpu_e3: cpu@3 {
 			compatible = "apple,mistral";
 			reg = <0x0 0x3>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			performance-domains = <&cpufreq_e>;
+			operating-points-v2 = <&mistral_opp>;
+			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -90,6 +102,9 @@ cpu_p0: cpu@10004 {
 			compatible = "apple,monsoon";
 			reg = <0x0 0x10004>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			performance-domains = <&cpufreq_p>;
+			operating-points-v2 = <&monsoon_opp>;
+			capacity-dmips-mhz = <1024>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -98,11 +113,107 @@ cpu_p1: cpu@10005 {
 			compatible = "apple,monsoon";
 			reg = <0x0 0x10005>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			performance-domains = <&cpufreq_p>;
+			operating-points-v2 = <&monsoon_opp>;
+			capacity-dmips-mhz = <1024>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
 	};
 
+	mistral_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <1800>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <453000000>;
+			opp-level = <2>;
+			clock-latency-ns = <140000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <672000000>;
+			opp-level = <3>;
+			clock-latency-ns = <105000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <972000000>;
+			opp-level = <4>;
+			clock-latency-ns = <115000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1272000000>;
+			opp-level = <5>;
+			clock-latency-ns = <125000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1572000000>;
+			opp-level = <6>;
+			clock-latency-ns = <135000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp07 {
+			opp-hz = /bits/ 64 <1680000000>;
+			opp-level = <7>;
+			clock-latency-ns = <135000>;
+			turbo-mode;
+		};
+#endif
+	};
+
+	monsoon_opp: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <1400>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <453000000>;
+			opp-level = <2>;
+			clock-latency-ns = <140000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <853000000>;
+			opp-level = <3>;
+			clock-latency-ns = <110000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1332000000>;
+			opp-level = <4>;
+			clock-latency-ns = <110000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1812000000>;
+			opp-level = <5>;
+			clock-latency-ns = <125000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <2064000000>;
+			opp-level = <6>;
+			clock-latency-ns = <130000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <2304000000>;
+			opp-level = <7>;
+			clock-latency-ns = <140000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp08 {
+			opp-hz = /bits/ 64 <2376000000>;
+			opp-level = <8>;
+			clock-latency-ns = <140000>;
+			turbo-mode;
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -110,6 +221,18 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq_e: performance-controller@208e20000 {
+			compatible = "apple,t8015-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x08e20000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
+		cpufreq_p: performance-controller@208ea0000 {
+			compatible = "apple,t8015-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x08ea0000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@22e600000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x2e600000 0x0 0x4000>;
-- 
2.48.1

