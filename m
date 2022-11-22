Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B88815CBB
	for <asahi@lists.linux.dev>; Tue, 22 Nov 2022 22:07:30 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id p141so11981985iod.6
        for <asahi@lists.linux.dev>; Tue, 22 Nov 2022 14:07:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9Nr6gPVOX/6LCyJBvLH9UJlV747BhwLKeGilJxI7hM=;
        b=IKRE80Yk7saa5j7vWyQheweAGE8z6HWe2vKcOyhnW9UpLtYwrC2hWrK+lohe/u+uCf
         B2k9ZC3BTYT6ii39meIFxal3upi1gL0soXbbLs8fGnqSnaom+46YK1r2HOB03gfIBbNj
         wONsgFPfgAneMUj4TwKCHZCW9Lk0NG9cjx633ZelCievDMrlKvbfgSBXAybhvMbbr/jw
         /fxujOuh+VP+y8OvYOluUMJkD81n3TrkRYEFRLIxwCMeIyMPu+Ku3NkV+p5t2VoHjRnv
         lB/qvZhI2NbyUzRPUHkcPX4IV0iu0PYH48kS3eEgiEKwhLCPLx/RPbrG2GGQ47BhWdYs
         Oo0w==
X-Gm-Message-State: ANoB5pnKoy9/GvESCqehEYsTiJYEKdu2FPfSi8V/9Pi59HJ77QpUlIh0
	lUPngmleTQ7vBq3BeKlWFQ==
X-Google-Smtp-Source: AA0mqf4V6ppRkdKRqtlLw69vA65riP97JWiM8WcMjwXpElslevptzfWytkuNVAbmbvpQ/TcmgGNdEw==
X-Received: by 2002:a02:6662:0:b0:363:69a0:837f with SMTP id l34-20020a026662000000b0036369a0837fmr4983635jaf.57.1669154849246;
        Tue, 22 Nov 2022 14:07:29 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id w11-20020a056638024b00b0037609ad8485sm5775812jaq.69.2022.11.22.14.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 14:07:28 -0800 (PST)
Received: (nullmailer pid 660771 invoked by uid 1000);
	Tue, 22 Nov 2022 22:07:30 -0000
From: Rob Herring <robh@kernel.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: apple: Add t600x L1/L2 cache properties and nodes
Date: Tue, 22 Nov 2022 16:06:20 -0600
Message-Id: <20221122220619.659174-1-robh@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The t600x CPU nodes are missing the cache hierarchy information. The
cache hierarchy on Arm can not be detected and needs to be described in
DT. The OS scheduler can make use of this information for scheduling
decisions.

The cache size information is based on various articles about the
processors. There's also an L3 system level cache (SLC). It's not
described here because SLCs typically have some MMIO interface which
would need to be described.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Based on apple dts changes in linux-next.

This fixes the warning: Unable to detect cache hierarchy for CPU %d
---
 arch/arm64/boot/dts/apple/t6002.dtsi        | 51 +++++++++++++++++++++
 arch/arm64/boot/dts/apple/t600x-common.dtsi | 51 +++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
index 3b1677ba5262..731d61fbb05f 100644
--- a/arch/arm64/boot/dts/apple/t6002.dtsi
+++ b/arch/arm64/boot/dts/apple/t6002.dtsi
@@ -29,6 +29,9 @@ cpu_e10: cpu@800 {
 			reg = <0x0 0x800>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_3>;
+			i-cache-size = <0x20000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu_e11: cpu@801 {
@@ -37,6 +40,9 @@ cpu_e11: cpu@801 {
 			reg = <0x0 0x801>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_3>;
+			i-cache-size = <0x20000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu_p20: cpu@10900 {
@@ -45,6 +51,9 @@ cpu_p20: cpu@10900 {
 			reg = <0x0 0x10900>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_4>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
 		};
 
 		cpu_p21: cpu@10901 {
@@ -53,6 +62,9 @@ cpu_p21: cpu@10901 {
 			reg = <0x0 0x10901>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_4>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
 		};
 
 		cpu_p22: cpu@10902 {
@@ -61,6 +73,9 @@ cpu_p22: cpu@10902 {
 			reg = <0x0 0x10902>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_4>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
 		};
 
 		cpu_p23: cpu@10903 {
@@ -69,6 +84,9 @@ cpu_p23: cpu@10903 {
 			reg = <0x0 0x10903>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_4>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
 		};
 
 		cpu_p30: cpu@10a00 {
@@ -77,6 +95,9 @@ cpu_p30: cpu@10a00 {
 			reg = <0x0 0x10a00>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_5>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
 		};
 
 		cpu_p31: cpu@10a01 {
@@ -85,6 +106,9 @@ cpu_p31: cpu@10a01 {
 			reg = <0x0 0x10a01>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_5>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
 		};
 
 		cpu_p32: cpu@10a02 {
@@ -93,6 +117,9 @@ cpu_p32: cpu@10a02 {
 			reg = <0x0 0x10a02>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_5>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
 		};
 
 		cpu_p33: cpu@10a03 {
@@ -101,6 +128,30 @@ cpu_p33: cpu@10a03 {
 			reg = <0x0 0x10a03>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_5>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
+		};
+
+		l2_cache_3: l2-cache-3 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x400000>;
+		};
+
+		l2_cache_4: l2-cache-4 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0xc00000>;
+		};
+
+		l2_cache_5: l2-cache-5 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0xc00000>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/apple/t600x-common.dtsi b/arch/arm64/boot/dts/apple/t600x-common.dtsi
index f5fac1926a25..e2568d914719 100644
--- a/arch/arm64/boot/dts/apple/t600x-common.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-common.dtsi
@@ -21,6 +21,9 @@ cpu_e00: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_0>;
+			i-cache-size = <0x20000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu_e01: cpu@1 {
@@ -29,6 +32,9 @@ cpu_e01: cpu@1 {
 			reg = <0x0 0x1>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_0>;
+			i-cache-size = <0x20000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu_p00: cpu@10100 {
@@ -37,6 +43,9 @@ cpu_p00: cpu@10100 {
 			reg = <0x0 0x10100>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_1>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
 		};
 
 		cpu_p01: cpu@10101 {
@@ -45,6 +54,9 @@ cpu_p01: cpu@10101 {
 			reg = <0x0 0x10101>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_1>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
 		};
 
 		cpu_p02: cpu@10102 {
@@ -53,6 +65,9 @@ cpu_p02: cpu@10102 {
 			reg = <0x0 0x10102>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_1>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
 		};
 
 		cpu_p03: cpu@10103 {
@@ -61,6 +76,9 @@ cpu_p03: cpu@10103 {
 			reg = <0x0 0x10103>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_1>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
 		};
 
 		cpu_p10: cpu@10200 {
@@ -69,6 +87,9 @@ cpu_p10: cpu@10200 {
 			reg = <0x0 0x10200>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_2>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
 		};
 
 		cpu_p11: cpu@10201 {
@@ -77,6 +98,9 @@ cpu_p11: cpu@10201 {
 			reg = <0x0 0x10201>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_2>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
 		};
 
 		cpu_p12: cpu@10202 {
@@ -85,6 +109,9 @@ cpu_p12: cpu@10202 {
 			reg = <0x0 0x10202>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_2>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
 		};
 
 		cpu_p13: cpu@10203 {
@@ -93,6 +120,30 @@ cpu_p13: cpu@10203 {
 			reg = <0x0 0x10203>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			next-level-cache = <&l2_cache_2>;
+			i-cache-size = <0x30000>;
+			d-cache-size = <0x20000>;
+		};
+
+		l2_cache_0: l2-cache-0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x400000>;
+		};
+
+		l2_cache_1: l2-cache-1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0xc00000>;
+		};
+
+		l2_cache_2: l2-cache-2 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0xc00000>;
 		};
 	};
 
-- 
2.35.1

