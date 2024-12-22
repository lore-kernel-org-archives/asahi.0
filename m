Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2281A8F7A
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734890030; cv=none; b=NqwO3eP/2lQsU1Nlit8fOkT3FktL2N6RIv3vxNW+1hNDDIX527gtO1eQXg39/QwJvHoprq1omdt9nFtNJQj5V1VxpfL5CFA4Ln/AzOYwbjVqBQc0g6fiYZ2qFjbOtColRelX/eeBhi14+ZCbVPbRik9FEEoZsRa9b1bOh1QaPX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734890030; c=relaxed/simple;
	bh=Ox8qD8dsQr6LHvbVDRuYA4SaFUKAM5Kc9GXxKuEAUEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uKU34QgZoFSVS7Ga69ovonysWPsV/3jgvd7qc+pJer2alPtsx6Ru12CSEOhxkxj9ImJ8P7RSJbU4kd9a4UdX6tJpCasVn484BV0xClAvAt0OI0WsOHP8u7Ue9/RN1mL57taqbFrykVs5CV5awGgb3U8ZANSA6apKpsnwGjIyFxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a70vj35r; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a70vj35r"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2efded08c79so2428894a91.0
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890028; x=1735494828; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXwxIenSzuIpC+GwkdjqUR2DofzaS4fQGLg3IB5+muY=;
        b=a70vj35rRDOVgzud+2PY4zx8yqah5pTJifN6BnyHYDH1ZDPm/3rUOYfvuIXVserley
         7jtAmiy6FIqMxod/u5TdJ4Q7O6GuzglZULLB3bGlkEXO9djAwc5t0Cq73dZxEckBjlWo
         jbkbZqySBx+nJV1xXEhL52d/mHE/NU9V50N6Cclhj09SZORvE8DS1UvDH6ZeXTnPxDFr
         oSGTx1R/BS9VV2gYuGwc85wX6bqC8nXz/iiLRKdVAX5BILLuo1+xeHvjVQvF4g5q3p+v
         sgjH8KFJOYRn0SxI6wr5ityQrriYHBFIXpCNuZvj0dlf0GAmCu9r77KpNCXE1KebVpd/
         ZcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890028; x=1735494828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXwxIenSzuIpC+GwkdjqUR2DofzaS4fQGLg3IB5+muY=;
        b=D0HT6OQ08ezgZ5/ZthogfOzrB5v39zcp3tVJlu5EndJhziAElTbWnu2TucigQECDlE
         oaiOFSWT1yBlFxNPRRLgYhIAZ8gxmSEl+YD3p4OyROakqH9zlfiMTL1xqcv+OYgkci8l
         skPXcngdJieEs26PNGEa08PWUInZ2vs+lnWk34WpqEwmIMS0gbApYbT9adqUTEDtBHSk
         6EtDgLylEdaXuejnioegJ4sI7feohTpbnZ8R7ZEbrwns/xlusLobK4J/1Fit8dQu4sMI
         OkF0vc9gxUKZwQ2YW1+aurN+sjvSyKJWNuSIL+AA32AEi5Ay/r/x7n2ahiUuR+iv9TWM
         q4NQ==
X-Forwarded-Encrypted: i=1; AJvYcCW76xFQ44rs6yEMSR7ruucqEJMw43OOYYnVX1s7xk0awvG/XqRNGLDDSUS4/dXnP8wbB45ifw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHk3pL0/Ma17rQ/AN7sFdTfi6pjydETETp/5Bp7o5pTQ9gdv1D
	HkfHFWCnYIDbwMz777Wbt+dKuBH95Mep64nCy1gSmNV3vkwNaBlL
X-Gm-Gg: ASbGncuhVhs0WPEk/IqMT4qCvUMd801ESrkOVQbq7RzZGZYi0JjqSwJsvkxkENl8BCN
	yOQT1ZhP4aoPOuL+Y5+iUbdg61JPUzpnJj+XjIy4c14wn0W9YUUpm4c/po5kLnMv5TV5FJ1OKno
	61U+FiVFeMa/nn1szCB2cktfQJD99cpkeWhApJozE1Ygv/4QdqmWiRCXsTLzcP9EW8yDZAkpkku
	HGIfWwPiLuNiYcH6dzPYZFCz8uBqdbD7qfdF7I0/vawGVE/ziFyZuTf5w==
X-Google-Smtp-Source: AGHT+IHSDfGeiVEQElB/fENv7ebMVITS5qMf817Q635jJxGYv5q8M2DnvFHYEvP8UOy+HWtj+qGhtw==
X-Received: by 2002:a17:90a:dfcd:b0:2ee:964e:67ce with SMTP id 98e67ed59e1d1-2f452dee953mr13986009a91.3.1734890028231;
        Sun, 22 Dec 2024 09:53:48 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:47 -0800 (PST)
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
Subject: [PATCH 8/9] arm64: dts: apple: t8012: Add cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:08 +0800
Message-ID: <20241222175314.151437-9-towinchenmi@gmail.com>
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

Add cpufreq nodes for Apple A10 SoC. There is a transparent hardware
big.LITTLE switcher in this SoC. Spoof E-core p-state frequencies such
that CPU capacity does not appear to change when switching between core
types.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 83 ++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index 45d24ca091b0..0a3d5a6bd047 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@10000 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x10000>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,11 +42,86 @@ cpu1: cpu@10001 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x10001>;
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
+			clock-latency-ns = <140000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <425000000>; /* 732 MHz, E-core */
+			opp-level = <3>;
+			clock-latency-ns = <110000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <637000000>; /* 1092 MHz, E-core */
+			opp-level = <4>;
+			clock-latency-ns = <130000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <756000000>;
+			opp-level = <5>;
+			clock-latency-ns = <130000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-level = <6>;
+			clock-latency-ns = <130000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1356000000>;
+			opp-level = <7>;
+			clock-latency-ns = <130000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1644000000>;
+			opp-level = <8>;
+			clock-latency-ns = <135000>;
+		};
+		opp09 {
+			opp-hz = /bits/ 64 <1944000000>;
+			opp-level = <9>;
+			clock-latency-ns = <140000>;
+		};
+		opp10 {
+			opp-hz = /bits/ 64 <2244000000>;
+			opp-level = <10>;
+			clock-latency-ns = <150000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp11 {
+			opp-hz = /bits/ 64 <2340000000>;
+			opp-level = <11>;
+			clock-latency-ns = <150000>;
+			turbo-mode;
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -52,6 +129,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202f20000 {
+			compatible = "apple,t8010-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x02f20000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a600000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a600000 0x0 0x4000>;
-- 
2.47.1

