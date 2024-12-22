Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45682192D87
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734890014; cv=none; b=nloTBd4CEiZgHMPT1DMtZGqUgbRWrth6nf/u2ly6MulkehUHFRwPvBHGZFcaNWzq11eiBQDi9VuFVFnhLLUk7JzaDPw2nhVR2x0OdqhQ2BbeN4CeUK4giUZ0yYQ8xkfb+qOGIbad1ibnUQzUjoppfZ05YH0YehB+uE5cJ7Z46Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734890014; c=relaxed/simple;
	bh=0Cq+UU767vBhrCOrurBWHzG95rj5medVh11tERdyEPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X16HhlOS04ujlnMgQy27CIEciQEkSOeq5+xEaUw602b48TuG1l+tVHAURqIEbq/6Eb1xiEJGp8J3ap5M5X3/hTHisCadnA0DyWtQ2W+vftb8vQMTwueGmiKG/2ttVVRgjL1SNfOk0wtE4g4VNlFFfjktFKsAxwB2FXElBKRJ1mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbN9s/N9; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbN9s/N9"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so2285255a91.1
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890012; x=1735494812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtAevhAcl5mLOcbysjZVxoXh3giA/+VpnoU+zggYcjc=;
        b=CbN9s/N9Xxa95CKspQRLOLvcIrrpv7KeVF/taNtTeBw8hn0G3RX6A1r5iZ1/T6wO1Y
         hmFWZm3Nu122mEyDquxZ4MceetrogrSTaASDuSK7H+lim255JlZnf6Pnz4Tmjg/o5eg1
         r9i7Qt2whJq/VcPVEt2vFz/4Gpz1C2poHoIvn1sKybLFvWfnKr3AmkVFU1HuTTKJVTO9
         EnYiVCd+5W6tadls0xX7lCYebdiuXgLjxtu4cFSyR+5YxhPNua+myBpOtMmzV7+qNT33
         qvtV8qD0pXnfjWh2biO3gOregyl4azic9njhWwBhR14r5d2CXlRgJYgCTqaUAZIn1wIh
         64+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890012; x=1735494812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtAevhAcl5mLOcbysjZVxoXh3giA/+VpnoU+zggYcjc=;
        b=UgwfAGOiomQMDpUkh2c7ilFqNy5eBzZAYKWUp3xdymu9gTARo0RgP9v3tb06u63m+D
         4o9YtCBIoTuNOYfkVBrSjvCdb3LgQbvUjZisFca0FDVY0K+zfTROFDdVrzONG4BpyH2G
         r+Mk+Fprmz/AyCDlL3VVlp0ni+l/ZaJAzFQz6vUIY+ifet/aO7FA7NdV4eFjScC5ldNW
         Q8EOODqJvWJFH+9ZVN++Y6pstopS2C1e1uTzpMYbghMrC9Fvy6+rNIC46gEBHGD45lc3
         1gI7upMBjW6pjg0rEejKObeUN7LIGTV6IB11vE3XH8SazywOsxOTX6MvEbuz7gAgukuO
         6puQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6pBOpIrdk8nusjbxikN2lh4nLywawNtl02JmqHYobirm3JjBVuDcWDT5wRooZ7xDW7bpFoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjTVWe2mTALiCl9Cl+Vhtnl61Dhw5GLEesN34M0kcSQm6ZZ9C0
	kd+pq+hDcvhjptcjT00CQDZ9U+aXsk51bRJW2JzoG/v3uj9pUwRS
X-Gm-Gg: ASbGncuI+X1tWTRIoarBdzOucairK8I8LgdMZyhX2ufdMFHsFueloblMG3OoC+BxADu
	VAzOcZqJ2iJtH1fyCw7SkXbkLDP5Z4rgfhZZb8BwJUuBX3DIsGi+ztuSgRVW/R3Z0k6eawZgZ8j
	5az8IJDySgNreOMoHlm4IRWTy3ZE7aMR8wRvarLHvxSaJ3eIoHCj6hfR/d47G1YK/CBp1P9U2Nk
	yOBmqsJfa/g0RdIbQripMytyLTLIaPDZaFaiFx/RzlDDl2lyHINDuSUEg==
X-Google-Smtp-Source: AGHT+IF2KoPvt/ETH1hPxEDJoTm61CI8csX/SPatjjjJtYa8dbIbPi5ngLMR/RAK693YnfRC+n3frg==
X-Received: by 2002:a17:90b:548e:b0:2ee:741c:e9f4 with SMTP id 98e67ed59e1d1-2f452e220c3mr14926747a91.11.1734890012557;
        Sun, 22 Dec 2024 09:53:32 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:32 -0800 (PST)
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
Subject: [PATCH 2/9] arm64: dts: apple: t7000: Add cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:02 +0800
Message-ID: <20241222175314.151437-3-towinchenmi@gmail.com>
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

Add cpufreq nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000-6.dtsi     |  4 ++
 arch/arm64/boot/dts/apple/t7000-j42d.dts   |  4 ++
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi |  4 ++
 arch/arm64/boot/dts/apple/t7000.dtsi       | 46 ++++++++++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000-6.dtsi b/arch/arm64/boot/dts/apple/t7000-6.dtsi
index f60ea4a4a387..0d08e2589449 100644
--- a/arch/arm64/boot/dts/apple/t7000-6.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000-6.dtsi
@@ -48,3 +48,7 @@ switch-mute {
 		};
 	};
 };
+
+&typhoon_opp06 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-j42d.dts b/arch/arm64/boot/dts/apple/t7000-j42d.dts
index 2231db6a739d..24fe5a99f3ab 100644
--- a/arch/arm64/boot/dts/apple/t7000-j42d.dts
+++ b/arch/arm64/boot/dts/apple/t7000-j42d.dts
@@ -29,3 +29,7 @@ framebuffer0: framebuffer@0 {
 &serial6 {
 	status = "okay";
 };
+
+&typhoon_opp06 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-mini4.dtsi b/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
index c64ddc402fda..773c69449902 100644
--- a/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
@@ -49,3 +49,7 @@ switch-mute {
 		};
 	};
 };
+
+&typhoon_opp06 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index a7cc29e84c84..4105cf70391b 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -33,6 +33,8 @@ cpu0: cpu@0 {
 			compatible = "apple,typhoon";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			performance-domains = <&cpufreq>;
+			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -41,11 +43,49 @@ cpu1: cpu@1 {
 			compatible = "apple,typhoon";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			performance-domains = <&cpufreq>;
+			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
 	};
 
+	typhoon_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <300>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <50000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <3>;
+			clock-latency-ns = <29000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <840000000>;
+			opp-level = <4>;
+			clock-latency-ns = <29000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1128000000>;
+			opp-level = <5>;
+			clock-latency-ns = <36000>;
+		};
+		typhoon_opp06: opp06 {
+			opp-hz = /bits/ 64 <1392000000>;
+			opp-level = <6>;
+			clock-latency-ns = <42000>;
+			status = "disabled"; /* Not available on N102 */
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -53,6 +93,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202220000 {
+			compatible = "apple,t7000-cluster-cpufreq", "apple,s5l8960x-cluster-cpufreq";
+			reg = <0x2 0x02220000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0c0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0c0000 0x0 0x4000>;
-- 
2.47.1

