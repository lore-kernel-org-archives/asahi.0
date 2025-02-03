Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86131204F86
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586931; cv=none; b=CJhJwAeZswN8oI1GPVqI9CpXEoZMbLOEAQ8LGwTQ+hLb48xf4NeJ1Tq4v+Aor800cVMeyKkkDhepRFbnO3hyUOU4u2kFza4iA5O0Yms84YDHWyx8snUfLTYBMFQgDLx/dAylMdIY4NsUhi3XVkjb5uQVzqPt74S9BnulZ7ivVFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586931; c=relaxed/simple;
	bh=B7mtf1DJcpu8B9/+6aUJjchV9QT2GOr7ITKAc6bZZAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4NHIiHvj5ifwwnB4lSdmeHE6p9EO8VLCpN8mp02zZnHpPcJcI+56ccqcua89LcBATcBq5dxFeWVppnYo2sFEfCVbP+ENLYozSCQdNo4n+rb9zADKHHvr1RQhdTB2LH+K+KkDx0icQ51KWAXOoTWIzKgSoauILblCGo5FLnrraw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+Dzg7Up; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+Dzg7Up"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21628b3fe7dso76577415ad.3
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 04:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586928; x=1739191728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wm1vaCLADXIw6mjVBCZqzL8tPcYfqeyXVx72+uvDa1M=;
        b=Z+Dzg7UpPqN54PXOCkMl0yHHm9/s/+N4lHNOj59N5ufLD0UWAeSytifmMt1a+5shbC
         vTkNOzHhYdlvF74JKzAXA0CDAUUnUezkJHKonu6SBfvQ+AOi9RwqnQyoJeQnBXzeXE4M
         mOk7n9xAgtlevbrKjmQIxhaa3C1vdQpwR17Dz6sv5rim1jD9zby71bK/ubn3T6Duk6zG
         weq3tju/TLv9F8AyRGk7kqXZZVyg6/x9Ids3j3lLvWm9GIpiAhRCSsr4U8PLR+ho7SFz
         Jgaaxhh8/I5+hFSrrUpZpfTpLsXnlMjo+SHUbSjB3G7VtHGsSLiwGm44ZYoEsB0bMaAG
         dXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586928; x=1739191728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wm1vaCLADXIw6mjVBCZqzL8tPcYfqeyXVx72+uvDa1M=;
        b=tcYWxRYrIm6N8Hq0wfP20ULx4eCuKFpU/oCiGkxkiIxyG/P1u/xYZWzeoawiSrClmC
         5srCllMnCf2EqBDUwBCAQV2NVF/XKGrQXkeDpRf58heolnS1LqRJkhvxuPjYTPRPr8np
         ixz11GgEtYybXeVBor/vPXr2RyB4K2rOIBpRkuQfN3x1DO6+skeAq8J2nWsCGU9Kur3U
         QgnvdEb1dncgF6wd2VGkmJyY+H0aCzOkIxPHuSzlBJYH4piL0Rd0CmjaD38L6uKS4751
         8G53YocrHnrlL8I12o98tYIAhCt4UQwnQ73QePQTF7FRa6662nDPtoRoad5zHPdWxOqA
         1iFw==
X-Forwarded-Encrypted: i=1; AJvYcCWb9EN56+rFykUv07gdg6Ttc/TJmXtHANrm/LCa4vOR+yp++Ikf+LtIlX6lnqu6Ls5rSRjkhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuYaXjJGc8aKjjQWeMjb8M/ZDXtvZjWsk8opRRKcMtBU19iRIc
	lC2rZBKqz21bvE3acoNeiARZga0CRNWrHivEZ5CFF6WsYBD72rNB
X-Gm-Gg: ASbGncvXw9wa+7mGKmI09Eeg0ArYh1cqu9Z3a+im5tyr2ZnA1xnRJcORE8MK6dkSBgw
	PFSPxR/Wlwp1o57dE64rsDvp/97cWmRg4fMcuB2m2Z4vSQRGHKjC6TLKnWuCRLQkq+N6Hlg4c1j
	wvkwSBamrhde+eXn5RMhPdtPxGGD5VpfTz6AC81bfCjM8kZ0S2l7vC96IzxUpmgqYFcFlYMOFwJ
	e8DXJt2q6MS5Tq/WvZsRENfETLRHkFQaltZmcKd3jGvQr8IDC/vSkKHK5TktGHkC5hmoDMgSRFE
	uJfa59UZf2dHqWkz
X-Google-Smtp-Source: AGHT+IE97aEIk8J5W1tlC12SvmYrsDcjP5pgG5OzlyrxMufGM7t3dgewYKr55GaKek+1e4q6nn56sw==
X-Received: by 2002:a05:6a21:4cc5:b0:1ea:f941:8da0 with SMTP id adf61e73a8af0-1ed7a640c2cmr37123084637.24.1738586927673;
        Mon, 03 Feb 2025 04:48:47 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:47 -0800 (PST)
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
Subject: [PATCH RESEND 5/9] arm64: dts: apple: s8001: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:44 +0800
Message-ID: <20250203124747.41541-6-towinchenmi@gmail.com>
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

Add cpufreq nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index 23ee3238844d..7f7cb8afd3d3 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@0 {
 			compatible = "apple,twister";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			operating-points-v2 = <&twister_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,11 +42,62 @@ cpu1: cpu@1 {
 			compatible = "apple,twister";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			operating-points-v2 = <&twister_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
 	};
 
+	twister_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <800>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <53000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <792000000>;
+			opp-level = <3>;
+			clock-latency-ns = <18000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1080000000>;
+			opp-level = <4>;
+			clock-latency-ns = <21000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1440000000>;
+			opp-level = <5>;
+			clock-latency-ns = <25000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-level = <6>;
+			clock-latency-ns = <33000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <2160000000>;
+			opp-level = <7>;
+			clock-latency-ns = <45000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp08 {
+			opp-hz = /bits/ 64 <2160000000>;
+			opp-level = <8>;
+			clock-latency-ns = <45000>;
+			turbo-mode;
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -52,6 +105,12 @@ soc {
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
-- 
2.48.1

