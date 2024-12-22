Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7B4143759
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734890020; cv=none; b=d4YseIIxZBalz8xOcoFK8Rxr5jbXDiu06Y9wqGOJYeSGHOQTc4sSdMdIAV+fNBmTzH0pEH5RRDAVTCPUWcWkF9zuCbFn8HFkomDKcFgO3b0utnLLs2TxT9NlDy1vRGhgygBKh2/E6bZZdVW/ZgYgCQuPx6yMWyUHS1gsiyKDmKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734890020; c=relaxed/simple;
	bh=2vkVOlA6yZGay51SznQ0EJpwIFuqxMY1bzPE6/AMxt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQGNWVJT2wXsR4++1cZpR9K9p1FvaP0mHcDFZ5BI50Avfp3tMusQ7W1clscDbY1g3FbPQ0dxRXsLvZghChm3mtZ6RC/8nQAdw6GJh/M03qjZDs0lL6ffTIZLuhntPOIOr234D8NYCucDy6ggdOO1RKqbBKYBxguejRfe7Fxt1ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0H5rbEM; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0H5rbEM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2164b662090so28218275ad.1
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890018; x=1735494818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPevbon6m/T00pf3vYuYkO653KRfOrsNDd02bFq47S4=;
        b=V0H5rbEM+ZDfT3kITYvmdV7lPDIGJYZ4zPqFVEICzQYAsazMUxFf1qRNvFF5kZtEZn
         Tc+wpJ5nVK82vX2y9lEIy3f1s3dx/D9sJeGMI06UA99HaoqKE1dbfFWyhUWcXEJM18vG
         V/w7KKQRAeTZeQi15yM8Ba4OHv+Y096fP12XombYwQ1wYOx+0TLSAWnjqIV/ALalc7cw
         mKqpdzicwRfYBPfjEomdDlrN9f2khURSBGQfmK/5jvt9wRGalslLauXBt+l2xRPTzJU1
         T6pfFmW8GnQVEEAFtqTzOLY422swmraPq0CQ7DqtEU1rxax5s5tGrWlLYinAjvoIJnJg
         HKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890018; x=1735494818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPevbon6m/T00pf3vYuYkO653KRfOrsNDd02bFq47S4=;
        b=KIeC/eQwPzqE9+neoYuIKVIJ9x2S8mdqDh8HhCvMQC2tsa9i6wJaN9QN41xV21Y5ex
         LrUum9T4xVapz4WH18Ml6clJ8jIbzd46esoz3Bkp5JEf7OReLFx395Y3b+9DPlUjwN/X
         1bF1m8nJfUE6weKt9RnUMx2QW6YGiiDxDn2gaq4XBy8gC65Z7J0aFJ5raF2rYbZtE8CA
         NIuyXc3r6HmGgQ37+0CdNnJ/z8G+g+e2kZ4EqWTYaUdvTwWCA8Naz0a1ynpSdwYkxu7V
         fkK/Yx3KKKgAVKUzSJIz+uU2HntyQtOgmlfc4FYt9TjJMMZHrErM2BpeeKqCy0haloQC
         f/yg==
X-Forwarded-Encrypted: i=1; AJvYcCVa7Nm2jNiSwhy3Qidu26nyoxTyaDgD2qshhgC9h8ckTq3wonF4swn19k0JlgXvloXh4MVE5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzWa8ogNCRRDGJDETj009R199ob+dPP/oNC7FEm2Mc0DqFdSSd
	rxf2XOv7xcAJZ16/ymYWMHZuLX+ffJR2yxHS1/jsoo4FpmpMU3rV
X-Gm-Gg: ASbGncuvM45hfN0MSp2tdSiGzahA+xhO93esuDLnUnj3LNrAbYBdsx8RFrJFxFusS3o
	OFdUlqQkh2Bcs/809su29cU+zkBrNemX1pt3PyHl8BuqMLqOlTISLy/GUmTLDt9/uvuSCDlhCtD
	358fKgzoX7TUGBlpZCJitijObyknabV0w0Lts12UZkMGHAh/rmz6QW4m8U8rfmMmWfErBMR1VVe
	smfu42+JsSGrC/eAXA3ZMWZOHHmxTyQgD5gkHzUP4kWx0sIjeyKTTYQ9A==
X-Google-Smtp-Source: AGHT+IE7f2w+pW5eXG5g7QIlLGxjJq2YFC2yMAhiVeASPpXTfKK7ET7lE8ZEKwanTLgnFmV/NW71uQ==
X-Received: by 2002:a17:903:94d:b0:216:46f4:7e30 with SMTP id d9443c01a7336-219e6f11764mr154607305ad.43.1734890018302;
        Sun, 22 Dec 2024 09:53:38 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:37 -0800 (PST)
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
Subject: [PATCH 4/9] arm64: dts: apple: Add cpufreq nodes for S8000/S8003
Date: Mon, 23 Dec 2024 01:52:04 +0800
Message-ID: <20241222175314.151437-5-towinchenmi@gmail.com>
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
2.47.1

