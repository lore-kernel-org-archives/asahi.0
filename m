Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E683E2080EF
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586936; cv=none; b=kDkV9i7UnhJTd5r8pSlNVE6yAoUuvoCa/fo8TZwWkXbu8Yu5krem+X4K/F0OnpBTys9DqiTAkJIehnSVOF1trPtf8rHZmVl1G42/uLtoJalKDaGA5ZSfnSbwJwOmvdToYdGoRbM7VgsU01G5TMZyy7MgsNMcHfErE8/lUe1az1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586936; c=relaxed/simple;
	bh=iNsrx+A3S3Bq893uN45njkoolynKBqKNdOF8toIAJlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=du/20X/6eSvdsWt5dlxpmK01y9/xkew+IZ9jhkvTy9FtUdqViw4PpdQxxMDPagRCQoJnhQNP3bWpnv1StAbqE/QUHS5XLqBDUwe+xNnrbVjy85Jlr+a3hgQtRuFVz+Nd3PzQwHfYsdgGEpOuI3NgiLVwkziyMZjVj7yax3STvRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnHUpzO9; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnHUpzO9"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21670dce0a7so88589595ad.1
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 04:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586933; x=1739191733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJUClOvadSj6QX58oHurrlBpkJQ7IYPBO0FnNkQK6nA=;
        b=TnHUpzO9GcQ7o+QX4fW60oX8/dFmSbqGTdHcOlElQ+nekzZzlYIBgXwFdGDz6aktrJ
         /GGo7yEUqfuM4I8mrnxU7B0H6/QQ5s6hqTMq9RiLPO0YA5QP05Ir8gK18KGsUE8kEH0c
         OMpPwvqiBtySwZfnGSTKFfe5FbqioCLXP2Hg/hGQy0x/k05D+xpnuDuEDEPadCVAsCkn
         NupJPP1p47d+++Xr/3IaKzhHY/opsxZKqRXZnJfTZRIdiHunbjiDizhKVtzRnHiqLfQZ
         kQv6XqgK4bjssgbfidwmxOw/w2ve4yvs/rTKMkOV9DB9YpSKYc7WHltRG9p+HejxM/lT
         Wq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586933; x=1739191733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJUClOvadSj6QX58oHurrlBpkJQ7IYPBO0FnNkQK6nA=;
        b=N3xyy2evAaX0Cq+uorJvB6e3IMxpz5x4lMycUUB/6RPg8eKAzhXGc+cRggXe2A2jIa
         SBhPZZ8v9Nb2UGzTs1lM5MrFcTIubCvOq3dc2R4yHyPf6EtUb2p/dVcBV971P4/pbWCa
         EiUDmsN/t0WNBgJNb6D0VHHSim3DhAgveGYNz6IMC1MFhxYFSo40e5TB4dNVhAZpbsuU
         JxBpX0X9yg9cYq7AjkUsKodyp9SYIJdJtACd6d27j0Ikv+kBzR3IbgvqNhDHcPmudQGu
         3XF/Qy8gVMegDdXL+6U1UjW3eKtmS/HPYh14dao//y5byi0m57JrvbkbuTYV4rT5K0rf
         IMlw==
X-Forwarded-Encrypted: i=1; AJvYcCWF/j8kKCYmkzD9EsZ0MBkLm1cRvClD+CaGAOFucAwTNcROgOF/peHY0UOyYD9A4MEKEws6Tw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsLOF9ks/q0rNhiT56GRhBG+t3ugmGhcirOB8jW44tODKCM58i
	nLu354tLB1yn0gHH12mrqM8iCVqbxUZLtGzubCUsObPte5//DVJY
X-Gm-Gg: ASbGncvvrusCGqjxMiISBoVimMgkB4R6RxryH615ktzLml7tFTA114DL3l+1o+sU/Se
	hrEE6UcuB37BS9hir4xJCtb4SxclY58JyFJzxcUP2o49Nhl6g9ZsmvQ3gIzqFObSnkBQfE95qc0
	uy8BDc88oHRkTwdYNkYpN27ataqDTTFy4aYPAt2ev7ie0rr+ACLhjbE4bDJgRH5QYtj7ulcq43G
	Qui6iNLAwKnNd6EQhJE1fKrbAI45VjpC+VVTr0e1FLFoM3/b9Pu9TCjB6D0nuFcP13r+Xyf9IGh
	sXA3GTizwAgXu5O0
X-Google-Smtp-Source: AGHT+IHLS6dbll/fZOAVWOMkLyYlVa8KGHl3l8e4OXqDcFOAKzegus2Ld1uPVya/4zL+Xr1xYMnk0g==
X-Received: by 2002:a05:6a21:6d88:b0:1e1:ac4f:d322 with SMTP id adf61e73a8af0-1ed7a5f947dmr39422757637.14.1738586933175;
        Mon, 03 Feb 2025 04:48:53 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:52 -0800 (PST)
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
Subject: [PATCH RESEND 7/9] arm64: dts: apple: t8011: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:46 +0800
Message-ID: <20250203124747.41541-8-towinchenmi@gmail.com>
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
 arch/arm64/boot/dts/apple/t8011.dtsi | 79 ++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 6c4ed9dc4a50..3a3d5b615a6a 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@0 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,6 +42,8 @@ cpu1: cpu@1 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -48,11 +52,80 @@ cpu2: cpu@2 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x2>;
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
+		 * Apple Fusion Architecture: Hardwired big.LITTLE switcher
+		 * that use p-state transitions to switch between cores.
+		 *
+		 * The E-core frequencies are adjusted so performance scales
+		 * linearly with reported clock speed.
+		 */
+
+		opp01 {
+			opp-hz = /bits/ 64 <172000000>; /* 300 MHz, E-core */
+			opp-level = <1>;
+			clock-latency-ns = <12000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <230000000>; /* 396 MHz, E-core */
+			opp-level = <2>;
+			clock-latency-ns = <135000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <448000000>; /* 768 MHz, E-core */
+			opp-level = <3>;
+			clock-latency-ns = <105000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <662000000>; /* 1152 MHz, E-core */
+			opp-level = <4>;
+			clock-latency-ns = <115000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <804000000>;
+			opp-level = <5>;
+			clock-latency-ns = <122000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1140000000>;
+			opp-level = <6>;
+			clock-latency-ns = <120000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1548000000>;
+			opp-level = <7>;
+			clock-latency-ns = <125000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1956000000>;
+			opp-level = <8>;
+			clock-latency-ns = <135000>;
+		};
+		opp09 {
+			opp-hz = /bits/ 64 <2316000000>;
+			opp-level = <9>;
+			clock-latency-ns = <140000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp10 {
+			opp-hz = /bits/ 64 <2400000000>;
+			opp-level = <10>;
+			clock-latency-ns = <140000>;
+			turbo-mode;
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -60,6 +133,12 @@ soc {
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

