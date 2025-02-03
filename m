Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4080B2080D7
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586932; cv=none; b=kUpFVndi3okt9DgPd0301v0GQIDRVcCLri2pWjDIelK0vWCO0qpTUgHfiLCwWidXV6dQTqsIOz5/EDClhbGUsje14yMGPXv+kENSc5jA5eFiLMpskJ9L994EjK+9kRnseQM8NZ+2WwnfR1Yx+fDdzglxhGIujNnH2zuBOlxlZH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586932; c=relaxed/simple;
	bh=ds0Jl3iw+VLntIg0GvIupnbswiEsCAWcMzpKzMkYSQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXmWiM/4dgDzvJn8lVd3LtlEra5K6KIHPy/wqsYG86xtG4KWHTWXIVyKYz/XXZq1hn8gG7TfdfDF44F+NBjcA9j7FJFGwpKGudvmPqmrO1AG6uoF99oUwGA4EPdvb1dK2mO07gLExeJ+SV/36oaUR6Z6hGCcQKaUIhcxhSstmzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXapk4SX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXapk4SX"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-216395e151bso50993455ad.0
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 04:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586930; x=1739191730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjLsQQnQgoiVkYb0Cm8bLRBPR+XW6bRhPpST0RE8duM=;
        b=BXapk4SXEpONT55w23pUdeNkF3SlGS4lAC8Dn7FFLk+YmNmgcTvOPqA8eCT5sEbCUD
         V4L6MNYD1Zc78vkvirJ5naEP7m19HsyRJNMvkzkriH80hMxp6gRqWmRCKlssUvzBNBb4
         hWC1iC80GbbDiIK2g6XoeXHZiasVtKP95Q9NDxuENvR6DDkIVVMCQj/E4aDTcwBTYY30
         ZlKxSdDdbPFI61knh4ptg2hsSewqUHn6RSlV78ZJbTJLa2ZGq7Tj2ptnPMDg+FjwrkiR
         ar8TwIga8npna7QAc5w2WHtBE5Y8lARAk0K+UhmVyVj6OD5XiiMfCNs+b81a2E5ea9uT
         3XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586930; x=1739191730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjLsQQnQgoiVkYb0Cm8bLRBPR+XW6bRhPpST0RE8duM=;
        b=n/Hfou5/8vuTXgsY/QXqakOviac2FmChPSWQzCpSDI00BHrj/09QQPT5a4Z50fKyLk
         bfq6uxb5TlZ1r9Rtc8rqFWCT+tRNHzL1D4sf3EbQ56njN4BEPpDM+aykxSSSCc73qW6W
         CWbJN6+knrro/hBv269qDN9aV84W24qnOc9H/mYlPQBMZAeleHykmSIVHObc+kEFyaWM
         nHaXEOtdmuklV+dwiJoY8OaY8xo/5yNoBlB4C5j21/pJ5kFdrIyFYQ7X9WhMthS3ZQkI
         H54bPcueZHwNj6ofbNUZcAmfxy4vV367gTdt0diCiU9w7WjcIpdcbcL5j3HZg8cJ7EbV
         2e0w==
X-Forwarded-Encrypted: i=1; AJvYcCUpNL53eNEaz3R0zvn2It4exx2wofGff7+tY/TMVn6+NvLzIQwv15GNTxyDUrAZsSej70ubbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGrjZ0z0Fbh3VKWrl/jFnfTTR5gavuiqrd33BBaDYFNKHzCeBS
	cUym6nZcM/KwfsRZ37rcLCyurBM8YrokbR8YTh9K3ZTYxwglNMlm
X-Gm-Gg: ASbGncvefVz3uzg/jKwNRuug1YbDZAlmswcm4KKPYgklaMFv5W/+G5j6/4wSuFN7guD
	WFHeXmTyVBNVGYOzKeflYnaCr0RgnNOiYtoqfrgGSXjHbb/UUfZrch1SBXM/Ce4+csvwXpiMWuo
	Ba5aNR1fHFu0s7SDIIexEj3+pj0hZJjImpMCchLqezQAGBdZX+oDsDoL1rRISyuKIcVnpbsTlpX
	e6V7joKcS6CZDDwChnrVAA9h+FXNy0CPt6ftnEmc0bICTSGUMOx3pVCjfjYdWpsvVwWUyrmpqXM
	xk/HXv+nvwRNbokj
X-Google-Smtp-Source: AGHT+IG2gJDQV9ByXKH3jCoAUfKcG9AffDalAhNUFxq2O5PchU6Ikr4yuxy3gHVej9DOE0y0Nn8ySA==
X-Received: by 2002:a05:6a20:12d2:b0:1ed:d35e:b6d7 with SMTP id adf61e73a8af0-1edd35eb796mr845104637.5.1738586930412;
        Mon, 03 Feb 2025 04:48:50 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:50 -0800 (PST)
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
Subject: [PATCH RESEND 6/9] arm64: dts: apple: t8010: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:45 +0800
Message-ID: <20250203124747.41541-7-towinchenmi@gmail.com>
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
2.48.1

