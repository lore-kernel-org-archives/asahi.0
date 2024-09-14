Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6638A13FD83
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291610; cv=none; b=qlZ/BPRZ0UcqjWsYwdMOp7Y7JzSmg0cMh1O0NgRv5VkynxnV0tHzPtitFlJN/vmnQ2bI6iKkoi7tcFiGFgi6FUKnh8ySFxo0Xu0G+S/UaKOZvTT3o3cI1POfPaF5Pqn9iT1pVNUFTPsr35scHGc2dGf5LQ90uv5fxOGgn0PlD2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291610; c=relaxed/simple;
	bh=O9df5+TSRybPNiuNQanFRa62ra8ncH90COzkNiwx+1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VoYx3QDv/Qti5RbKeTEWhH3wsKs2NZS2UxmY4K9z8NU2SM/PPbfeIuIGNaOG8rA3PUhpFy+dNt/sdAwY4ikP9SzAheDE2QQbSL2yZpySIeX0nPIFoSNMrk2oPUoMeg+fLMDqO35PJiRFahrPL9Jl8faAkBracvgaGs37g4mOxeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAwyvAbj; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAwyvAbj"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-718d704704aso2632301b3a.3
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291609; x=1726896409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AQMnRi88w3YJGkg7kJQI9DF/T3uyFlZ2NbTuH1k+hk=;
        b=LAwyvAbjdQrKlUbA5SiMLZ/eRCyi3lTO2fO2BosIUHQDNTZyo0D5DAioIs3uOZY/bU
         qyO4JTZm2zVzYQJvxyPAa9Jd0sIFjJ/nKaQWRcp//hPe0dINOyeLI+jDaIsrXXEgAWST
         V2Qv/5tKX+/0BKr7Uxw6og5vScBEzhdxyz7UZoEedjOm73iPGPAK9pSfmXIPMESJnpi8
         q1//8IR06aUx4mJvyS3dETyHUFsCOQZNv2m0KW9dabPqrtucA/E6vwbH0sSWDgPmS9ts
         OUYwG8cpkmn6Nicv3lNmUzGUbe7taE8Ni3rxVM8NDdf14rwemZN8zUTnqQBU5KwcBuI1
         chTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291609; x=1726896409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AQMnRi88w3YJGkg7kJQI9DF/T3uyFlZ2NbTuH1k+hk=;
        b=t15586lm6estu2gZ8tESslQNaV0kkFW4CWOpo1XAYB8k8uYhjex5GllJ6F+ggJa/kw
         mroKA1DJUGGGtj8svtJ+ZEePLeYFuRsn30vHhkt6/n0MVE46A7y5A+6rXm7h/2LBd9CS
         p/hJh+uORPuIWm2xhDmX5hG13mnhbP0MuWs57+cyu8/i7ErPc6L1sFg/J5OZxIHl3Lq9
         w9Ibj5xKQPvjU6cXH7Eb/SiuCJO68gUGCO7YdjOWHNRFNAPvedmHmUK5xbHBntES9oXz
         AjaJdBrmW2XjiPq+09IGmMYNOt0QGfBhO/BgppNmc7Sm/SCRNYq7VHZEFai34G1gYUq3
         eFlA==
X-Forwarded-Encrypted: i=1; AJvYcCXSggW4WUOT7Qy2/yqgHIz8StN+RvkcbEKLYlVbSlNokazHEAPLOMldh/gv5kx54yd7FfPq3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHnSfp/Qt7uuDveggbAxQv8g/MN0iQmHiObuNZuKMKr/o2ZCYi
	ZZnEhSg8CpnZBLw2QtX7CbgYhLaVPgHPBnM9oPzehRXrPPgjk1ss
X-Google-Smtp-Source: AGHT+IFMRPU/3Z90LPpdnqu9q34twD0zYSR3G2hw/Ma3NwF31nSjcXiEJ15u+KKYtsfVxWPwtkotag==
X-Received: by 2002:aa7:888e:0:b0:717:8aaf:43be with SMTP id d2e1a72fcca58-71925fa9081mr16090951b3a.0.1726291608743;
        Fri, 13 Sep 2024 22:26:48 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:26:48 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 21/22] arm64: dts: apple: t8010: Add cpufreq nodes
Date: Sat, 14 Sep 2024 13:17:30 +0800
Message-ID: <20240914052413.68177-25-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240914052413.68177-1-towinchenmi@gmail.com>
References: <20240914052413.68177-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add cpufreq nodes for the A10 SoC.

The Apple iPod touch 7 can only go up to 1.64 GHz, so the higher operating
points are in t8010-fast.dtsi.

A10 consists of logical cores that switches between E-mode and P-mode
depending on the current p-state. Each mode have different capacities so
the E-mode frequencies are adjusted to make performance scale linearly
with clock speed.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010-fast.dtsi | 22 ++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi      | 67 +++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010-fast.dtsi b/arch/arm64/boot/dts/apple/t8010-fast.dtsi
index 4bdf1c3eccfe..b5a2c78ca9e9 100644
--- a/arch/arm64/boot/dts/apple/t8010-fast.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010-fast.dtsi
@@ -6,3 +6,25 @@
  */
 
 #include "t8010.dtsi"
+
+/ {
+	opp: opp-table {
+		opp08 {
+			opp-hz = /bits/ 64 <1944000000>;
+			opp-level = <8>;
+			opp-microvolt = <816000>;
+		};
+
+		opp09 {
+			opp-hz = /bits/ 64 <2244000000>;
+			opp-level = <9>;
+			opp-microvolt = <922000>;
+		};
+
+		opp10 {
+			opp-hz = /bits/ 64 <2340000000>;
+			opp-level = <10>;
+			opp-microvolt = <922000>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index 926a0f501477..e27d2b5e3df1 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -50,6 +50,8 @@ cpu0: cpu@0 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -58,11 +60,70 @@ cpu1: cpu@1 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
 	};
 
+	opp: opp-table {
+		compatible = "operating-points-v2";
+
+		/*
+		 * The E-core frequencies are adjusted so performance scales
+		 * linearly with reported clock speed.
+		 */
+
+		opp01 {
+			opp-hz = /bits/ 64 <149000000>; /* 396 MHz, E-core */
+			opp-level = <1>;
+			opp-microvolt = <525000>;
+		};
+
+		opp02 {
+			opp-hz = /bits/ 64 <275000000>; /* 732 MHz, E-core */
+			opp-level = <2>;
+			opp-microvolt = <541000>;
+		};
+
+		opp03 {
+			opp-hz = /bits/ 64 <410000000>; /* 1092 MHz, E-core */
+			opp-level = <3>;
+			opp-microvolt = <603000>;
+		};
+
+		/* The following operating points are handled by the P-cores */
+		opp04 {
+			opp-hz = /bits/ 64 <756000000>;
+			opp-level = <4>;
+			opp-microvolt = <559000>;
+		};
+
+		opp05 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-level = <5>;
+			opp-microvolt = <609000>;
+		};
+
+		opp06 {
+			opp-hz = /bits/ 64 <1356000000>;
+			opp-level = <6>;
+			opp-microvolt = <650000>;
+		};
+
+		opp07 {
+			opp-hz = /bits/ 64 <1644000000>;
+			opp-level = <7>;
+			opp-microvolt = <725000>;
+		};
+
+		/*
+		 * The iPod touch 7 supports up to 1.6 GHz, faster operating
+		 * points for other devices are in t8010-fast.dtsi
+		 */
+	};
+
 	memory@800000000 {
 		device_type = "memory";
 		reg = <0x8 0 0 0>; /* To be filled by loader */
@@ -86,6 +147,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202f20000 {
+			compatible = "apple,t8010-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x2f20000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0c0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0c0000 0x0 0x4000>;
-- 
2.46.0

