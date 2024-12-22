Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C3B1AA7A2
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734890032; cv=none; b=pug7bdP7Qj28FKV1FTs4MqGBSPcng1do9ClOEIg7a+6XfqO1/+H/zmGkrrtKDCiCbNsNBZ4tGK6WE+ykJYqlZhelm9USgdTPR8XjM0zrrfG9U3CilweUfs3Wy/QD8xENzuK0j8mnKUxTRagQ7/jagLyKfXtrZDfDhIzVq1NgQfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734890032; c=relaxed/simple;
	bh=FDt1FqU/zIoFTXuzxOz4REOMI6cmEaiKw/gsPCp8HkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIqkiOssBB4aFP0uMtSqwlpixDUzN4gfC/u2aOj0Zp5OdshEq/fVR+aqsCf8qlBVRviC1ADga1G0TacvNRQqB42DWird58oDI7DZrVjFl3BfTWAF5zMsQYdROxI9zcvAGoToXLrN8DbKL6mw1zGKCX/Q6CUv/hWJsb7W8iOtuWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mt5DLWLs; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mt5DLWLs"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2165448243fso37065835ad.1
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890031; x=1735494831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/0ozbwgqLpSEC7BNfh+14HxpMViab/4nt5SwTR3z10=;
        b=Mt5DLWLsfGdHGJULdU/vfjilaGysFDjIKimHD9t+FUSyGFHGiSO0nKTZdbNH/G7Hmt
         x3R209HQsuheaRPFe3w/kOrjNJbVJYCljaNGWTSzZRqpUB1MGXbrl4/uaN8o1/aUZgDB
         1zmOb2I7EvLpFwFZzSZWNOCvF9bLHd9AC5bI3sR8ZhMN+OaXjhuZO02QQCXQvAr8VINF
         NthKQfUR+mIp5AarRT+g48aLKLNDt8b8Zx7wE7QBekTiMo+oVb3l2+lLnEiEmrjRUUIg
         v2ZF7gP3Y48unL38P9Cpxr1VwEsBlVjo93BQ5YryHRkNEUvCYd1hbkBnPVqVCKAi1ZDS
         kEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890031; x=1735494831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/0ozbwgqLpSEC7BNfh+14HxpMViab/4nt5SwTR3z10=;
        b=gE0d6AhQEi77kVA7fFTPFHl3l0KOktj3hKiysxtMKkt7BFPUmGXkQpCvEY/V2xhViw
         8KcURO3+2yDTD5cgI+unLpkYB71vs78eAVCzo700jI7Je+42Lmto2GnGXaBZEg3JNNVo
         m7r4v30H6aID01up2OF/fg1CMXXyfIwelrx9lPcmQ4515b2FP+YFPmcSB0W/Hy1rWbxd
         neXWt/2ToVXCIEwT4kHw32SjlpSHbYPKNScZLSjjx+E1/mBL7ctjZiNAwx8M5JoRu8Mm
         N4u+i9gkAaYJv1fi1VnUMxUe+MFSQv9UUlkMBPKc3T75/HcLb7/601w6ZTd6RcWGuH4Z
         CvCA==
X-Forwarded-Encrypted: i=1; AJvYcCVZzLYfFRrxkiNEa8SpyBvJ7rvBH7XjuBTH4LkbMvllaiDcpbW+myRN8+YGjslLFIdTrkpM6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhiGZV5trmHUAm9C9LSYvPz4YWWWzL8eyQTxP7NjRi61Q7YFJc
	EV/XE8ISuJivnWFdpGMoBVij4tFzbn3nct4UqqN/rcO0occ9ylcf
X-Gm-Gg: ASbGnctnoikg5Og03EYf7T9DFHf+uru71TJXK5+39Oo3llJQ+XKt5aOXLLL9ouTE9J+
	z4cpa54XhClwePApk/nkv96JfifdY0xhfGp12Rrij7++5sBztrAiB2mzSJhnJvppvJLLYpq+wIP
	mz/T6nNH+5khDpIKeCKWL3B344Me2eDhmMFFeNLcm2u0c9PQ//uwULKTyrqrHouMvfo+LBnOWBe
	NZGPC978uq/cie2au4zSOvJcdcxJ/V22W58w1V4agWvlFagkhpAk+sCEw==
X-Google-Smtp-Source: AGHT+IH9Z25ox7c01rsb5rHxjzRde+7TgfHUfkTa1aO2FEH4mP2CeHiSwbC1+asK4GfWKXt5+iT0qg==
X-Received: by 2002:a17:902:da81:b0:216:61d2:46b8 with SMTP id d9443c01a7336-219e6ea1c0cmr148322515ad.23.1734890030784;
        Sun, 22 Dec 2024 09:53:50 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:50 -0800 (PST)
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
Subject: [PATCH 9/9] arm64: dts: apple: t8015: Add cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:09 +0800
Message-ID: <20241222175314.151437-10-towinchenmi@gmail.com>
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
2.47.1

