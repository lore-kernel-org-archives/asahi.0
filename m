Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C911C207DFF
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 12:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586928; cv=none; b=FZ+XbK7lGoE2wmzov+ZJnxGBHGFdg2P1yISJrJmOUBnFkQjnUqgugcfod/4zzSoTb+lvVn9841wgV4WwKmTVcTQdjnW7/Hb5OTk8UONQwg0EXK7zvsmi6MD/882biyORs1h6qJsIKmK2pOfV2oI7Eh8HNFvHe+ODJT7RpJi6XOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586928; c=relaxed/simple;
	bh=/OXq3Zio4mXc4dUDr2Bq2h9ucUKYnTSScne/bn9s534=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UgSBOQA6VMnPeN9/T5k3C6s7bf9mULs/YbER7o5YM3xEWQfVgYqMPxrgJ3KKwLpc5+2QGAbp54IiBvAHOQeY+3d9SdZ8yMPSUMz6NFYagfq8vqduHPqw6I0+D9OBoBQTOF8SRgE/JKz1aAMDlZIUE+vm9lT4vOf9ZAeDpK7n0Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLxytUgq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLxytUgq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2163b0c09afso72771205ad.0
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 04:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586925; x=1739191725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pe3ZbblFRITfrVA5nsyP09ciBw9K7ZPZlBuPS3RmeY0=;
        b=PLxytUgqKQkmP1NwQNlYMS5adqbFASzVbOs8czf9F1vdo5bE1NUpNNg0cb31u9NyUC
         iQidoO9JbZhD/868QAsw01EoqrpjgtjLZ2TT2FChQ7Sr9DrJrNmzD6kjZ+Ogd3dJbthE
         ljkcgrKDk20+fNoBJKR2uV1kMwccyIEkOlsxA9qu6Qi6KdRzMG8CZfBPdqys1s+Av69I
         0yE/cbduotTwcxyNVsU4gtaGx1YrxumrxhxcaFk2qTjvYjoWbVJqoPRQ/C+oNGcZSY32
         X7FFwSCY2/ma2fotQrFqjaRuQCqMqz7uKAmXPp+3+SeulvQNIpUyE/PgZM+lPdElcecc
         SlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586925; x=1739191725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pe3ZbblFRITfrVA5nsyP09ciBw9K7ZPZlBuPS3RmeY0=;
        b=xB3ZRsZ2f85xTctxchcpGr7RaIVnHwRYdOGIJLIesl/RQlkqQt6CHdvJWgxlgbJlml
         pqHC53sG3ZWAArxbiuOzvDgKV3xS3E5ZJFemWjNOtxOIPNdSzUoIXMiuDWEC9a8aM7jE
         VWJvogSzFIjLkWTKx2U3+kAXJMzhmbTzmmSskGt+9PpSATrQC56KwSuNf/s+6/iGwwX3
         GNcCoGxTgYJEUP4Pw+9fLqu+GMwvbOJpvE0G0BMHylb2jFpjk0yTseVY7hp/JA2dfpb/
         vGOpWaBcCj9d8RZwytBz6V/KAZA9pN8bJaFp17bIJs7sb5+N+vMA0wY1SkxP4udqOVTw
         THdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL1kg/L4Rz7F1oJHU9uTGYvjvuKM+pSSi+vdpe1/Wfsz7q8cdzZ6BmOFjkFNZFnkprCfZEGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeB7c8roYGswO8fQqpYiuCApGxUGPCVllwH351zxkRzRlMs5g/
	ECU9JErnJgEvdkEs7JLmUgxgBpOWIEKPbCPlzH5428qyiclxbWYmt/rEqbQl
X-Gm-Gg: ASbGncuXOPSICzJptGe2FGw0T3xKg6brC0S2u5SiVpgoCUScBu3Um6eHLwxZwpUz/6u
	mEA0WQ1sYH3OTtMkhWM/08nPPHtNU0+8o1zomw3swtDOpkUJDMIvcE+49avX8Ykv/1HPo3j20XM
	TtRaka5f6lAngFP5GmuE9pogzcds/ztiqc8t7Ux3wyl+sDEYiCsusWVd8luSL18AP/V2tWv68EG
	MhAQ7/SIh9wp+vi/NftbbXwCFtz9W7e1PUZS1Y/YWRUv28FFIWEbFL0FBSHkK2AjUga+u9b/1kH
	cc9l/z9W0kId48Br
X-Google-Smtp-Source: AGHT+IE6PRgepwkrjqG2OmOZ+7qNJydgJxtUoZkQAYGjXgBZv3DVPV0sBMuXLvPIDiaVI0vvtHLMCg==
X-Received: by 2002:a05:6a21:6d88:b0:1e1:a75a:c452 with SMTP id adf61e73a8af0-1ed7a63866cmr37247460637.19.1738586924881;
        Mon, 03 Feb 2025 04:48:44 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:44 -0800 (PST)
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
Subject: [PATCH RESEND 4/9] arm64: dts: apple: Add cpufreq nodes for S8000/S8003
Date: Mon,  3 Feb 2025 20:43:43 +0800
Message-ID: <20250203124747.41541-5-towinchenmi@gmail.com>
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

Add cpufreq nodes for the two variants of Apple A9 SoC. The difference is
that S8000 is slower than S8003 in state transitions.

Change the copyright information in s8000.dtsi and s8003.dtsi as well
since these are now essentially new files with the original content now
being in s800-0-3.dtsi.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 10 +++++
 arch/arm64/boot/dts/apple/s8000.dtsi    | 53 ++++++++++++++++++++++++-
 arch/arm64/boot/dts/apple/s8003.dtsi    | 53 ++++++++++++++++++++++++-
 3 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 082e5b1733d0..382d7be3f8ce 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@0 {
 			compatible = "apple,twister";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			operating-points-v2 = <&twister_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,6 +42,8 @@ cpu1: cpu@1 {
 			compatible = "apple,twister";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			operating-points-v2 = <&twister_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -52,6 +56,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202220000 {
+			compatible = "apple,s8000-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x02220000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0c0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0c0000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/s8000.dtsi b/arch/arm64/boot/dts/apple/s8000.dtsi
index c7e39abda7e1..72322f5677ab 100644
--- a/arch/arm64/boot/dts/apple/s8000.dtsi
+++ b/arch/arm64/boot/dts/apple/s8000.dtsi
@@ -4,11 +4,62 @@
  *
  * Other names: H8P, "Maui"
  *
- * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
  */
 
 #include "s800-0-3.dtsi"
 
+/ {
+	twister_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <650>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <75000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <3>;
+			clock-latency-ns = <27000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <912000000>;
+			opp-level = <4>;
+			clock-latency-ns = <32000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-level = <5>;
+			clock-latency-ns = <35000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-level = <6>;
+			clock-latency-ns = <45000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-level = <7>;
+			clock-latency-ns = <58000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp08 {
+			opp-hz = /bits/ 64 <1844000000>;
+			opp-level = <8>;
+			clock-latency-ns = <58000>;
+			turbo-mode;
+		};
+#endif
+	};
+};
+
 /*
  * The A9 was made by two separate fabs on two different process
  * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
diff --git a/arch/arm64/boot/dts/apple/s8003.dtsi b/arch/arm64/boot/dts/apple/s8003.dtsi
index 807e3452f8a7..79df5c783260 100644
--- a/arch/arm64/boot/dts/apple/s8003.dtsi
+++ b/arch/arm64/boot/dts/apple/s8003.dtsi
@@ -4,11 +4,62 @@
  *
  * Other names: H8P, "Malta"
  *
- * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
  */
 
 #include "s800-0-3.dtsi"
 
+/ {
+	twister_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <500>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <45000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <3>;
+			clock-latency-ns = <22000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <912000000>;
+			opp-level = <4>;
+			clock-latency-ns = <25000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-level = <5>;
+			clock-latency-ns = <28000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-level = <6>;
+			clock-latency-ns = <35000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-level = <7>;
+			clock-latency-ns = <38000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp08 {
+			opp-hz = /bits/ 64 <1844000000>;
+			opp-level = <8>;
+			clock-latency-ns = <38000>;
+			turbo-mode;
+		};
+#endif
+	};
+};
+
 /*
  * The A9 was made by two separate fabs on two different process
  * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
-- 
2.48.1

