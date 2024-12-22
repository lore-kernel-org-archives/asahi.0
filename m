Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68591917D2
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734890012; cv=none; b=rsWVSVJkH2laLe+gJFMj9CcYr9hMuwuvyOJ7FgTDzW1ksxnG4VZniz+hG2FAB3ZATON9OVE/NdsgbkujZ6elSjqUIpAnaCA8mQtr7R8gzf+yerBXYxX5suO+kyb39Towl1mUE1ip0SXr1SfpPfvPt97GZPziY28Lr4zAJ5aPSIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734890012; c=relaxed/simple;
	bh=2/EWb2y9vaOjsRj9KCGDfkcMC2KEIFfMdArb73Is9hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FwCFhZ9dHKhea0pLYYBaszbSefcgdjB4g/v/lvh8bPzjz9bLhjE67oE4PK3xv0ZeRdtffnWv7xd4B/9zrgsmt1fs1vhzofzMGdW+53qSjAYJxfTMrVTu/mrScPKOrWf0sbB0HpNP6a6Qd1wmet2DhRrHe7JJI0GGA7oxXDvIEI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmMUOWhj; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmMUOWhj"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so2780206a91.0
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890010; x=1735494810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7D2M/MnbL5flgWw2rKwlq0CEQX5AIdMs90nrhL6FHw=;
        b=fmMUOWhjxKWTIMeNQU6Us6SML45vBccNCxhCfME2nYx7hvZSO8Co4/mYNzDEKHKy6M
         6KS9aNa+zHx4D6eGak/9Rj9U3hDKGaQ15e6ER8v1Ph3tUWnA4brK3pYFA4vbJnzBnddm
         diyiOOPk2z1Z97xBcFuzIqHKNYXHZPh+2MUX9urlEX+RSMfK13JBC0UUoYG6/Qal1U5D
         al/Uuj4COa+q/wqKw3EwkUomhmiwHOzL7AkByqyAUqwBurD7zKHvb8R9kcopuyO7i6Do
         VXqgKjhzJU4Y845b37yduHfVtUnUtSC6pTP41mbE3MoP+Pg01T0AuPchIng6NDBbe2J1
         n+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890010; x=1735494810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7D2M/MnbL5flgWw2rKwlq0CEQX5AIdMs90nrhL6FHw=;
        b=VHZVfqAB+C1xjgNJcasoftDzXw4JZUxgtTHNtnNfpOSxWE1PaEP+hrd5Kil6fC9DJ/
         pi8i9dRBZ8omCmPIXKQkbhOBmsbDJM36jvUTH/h6yI4m0LS3mv9N+26Y560gKhK9yPjE
         TF4oKtrbT5Uru1eU1xrZb1tiNItv32YDe4OFOg5Xli+lq0b5yZ+LgZrQx0Xx+BnKy2T2
         ONGUsxeSVjnwID6I4c/0JCdpz3N7wPXzNU7/3r3Ae1yUCYY5C05G9xbFFZjwu7j7Z9C1
         F19zE10qHAoh2chrRSetlXvLewgIyOHbUeYFxi5KtL46hmbWlYUbqwm2GQEwl67z2woz
         wo2w==
X-Forwarded-Encrypted: i=1; AJvYcCXLMNCrNoZK2fVxCRmrUMCSntUK/DPUQZDuXWBu/MkB6mTXiUWfTGx96Az+nGEp4QbqrLIKfg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw58Icq6G0vkHjTLLn8405FBMoZX2E1fEVwAj/CdLpKfwXrYuYR
	eigdWkkE28Ej/GMfhfcoRqnv3SLWjpvSdFeUUtn/do80j0KCijBS1B2j3zKi
X-Gm-Gg: ASbGncs8dePjL4aeFKLRzFzhQkVMJQ3FVwoq3DktvAVPvDkROZjDITQAh4KldgiVMq4
	njS9oubLjWr+Q7BNUocLe7icy6kIouwQY6WNlotrl6hesHNOtCKYL0pQx0uXao91wEsqBhZSh/V
	hP8XOly467nfz2XdBTRgqo9CgZs5rqo4z5ECwHD3kV2bBygC8+BuWKPO8IleVo6WRlZMYbTew6x
	GVGjM3yHzqQdHabdNLnuvAhU2JwPOVhwU2uIccP1qm2iCpeKntVpCEfVQ==
X-Google-Smtp-Source: AGHT+IGNjqPGyp34z6F4Pa36n3bRrRA3pu+NGo6p5zJv9wwviF9JJ8DZZK9qBdjxFH57nOXjguVXYQ==
X-Received: by 2002:a17:90b:528a:b0:2ee:8619:210b with SMTP id 98e67ed59e1d1-2f452ec3589mr15457101a91.29.1734890010048;
        Sun, 22 Dec 2024 09:53:30 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:29 -0800 (PST)
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
Subject: [PATCH 1/9] arm64: dts: apple: s5l8960x: Add cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:01 +0800
Message-ID: <20241222175314.151437-2-towinchenmi@gmail.com>
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

Add cpufreq nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |  1 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |  1 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |  1 +
 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi   | 45 +++++++++++++++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       | 10 +++++
 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi   | 45 +++++++++++++++++++
 6 files changed, 103 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi

diff --git a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
index 0b16adf07f79..83c0a4deb5ba 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
@@ -8,6 +8,7 @@
 
 #include "s5l8960x.dtsi"
 #include "s5l8960x-common.dtsi"
+#include "s5l8960x-opp.dtsi"
 #include <dt-bindings/input/input.h>
 
 / {
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
index 741c5a9f21dd..d88894e0fce7 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
@@ -8,6 +8,7 @@
 
 #include "s5l8960x.dtsi"
 #include "s5l8960x-common.dtsi"
+#include "s5l8965x-opp.dtsi"
 #include <dt-bindings/input/input.h>
 
 / {
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
index b27ef5680626..261b5008a6b4 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
@@ -8,6 +8,7 @@
 
 #include "s5l8960x.dtsi"
 #include "s5l8960x-common.dtsi"
+#include "s5l8960x-opp.dtsi"
 #include <dt-bindings/input/input.h>
 
 / {
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
new file mode 100644
index 000000000000..e4d568c4a119
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Operating points for Apple S5L8960X "A7" SoC, Up to 1296 MHz
+ *
+ * target-type: N51, N53, J85, J86. J87, J85m, J86m, J87m
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/ {
+	cyclone_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <15500>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <43000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <3>;
+			clock-latency-ns = <26000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <840000000>;
+			opp-level = <4>;
+			clock-latency-ns = <30000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1128000000>;
+			opp-level = <5>;
+			clock-latency-ns = <39500>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1296000000>;
+			opp-level = <6>;
+			clock-latency-ns = <45500>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 0218ecac1d83..449c69d0d92f 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -33,6 +33,8 @@ cpu0: cpu@0 {
 			compatible = "apple,cyclone";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&cyclone_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -41,6 +43,8 @@ cpu1: cpu@1 {
 			compatible = "apple,cyclone";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&cyclone_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -53,6 +57,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202220000 {
+			compatible = "apple,s5l8960x-cluster-cpufreq";
+			reg = <0x2 0x02220000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0a0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0a0000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi b/arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi
new file mode 100644
index 000000000000..d34dae74a90c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Operating points for Apple S5L8965X "A7" Rev A SoC, Up to 1392 MHz
+ *
+ * target-type: J71, J72, J73
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/ {
+	cyclone_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <10000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <2>;
+			clock-latency-ns = <49000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <840000000>;
+			opp-level = <3>;
+			clock-latency-ns = <30000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1128000000>;
+			opp-level = <4>;
+			clock-latency-ns = <39500>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1296000000>;
+			opp-level = <5>;
+			clock-latency-ns = <45500>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1392000000>;
+			opp-level = <6>;
+			clock-latency-ns = <46500>;
+		};
+	};
+};
-- 
2.47.1

