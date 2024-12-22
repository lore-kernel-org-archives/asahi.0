Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B64F19CC21
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734890022; cv=none; b=sVVnNtnFIi1Azz/l9SpO/3+hFNu9Eu84Bauv2v8EH/OKPZNTEnVVy9UZ4TfkR3FoZn8tkELyvOJSFwCB7QUaod6/psHduBFDvVIuC1LJ6XkbFC9qeMum8JXk/KV0FAz1BxlQ1Mk3hee64QvPpfxzX6OM+bHjOrs8NgsVvAsFwU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734890022; c=relaxed/simple;
	bh=+bHLqQXShOcRgx5Srzyvr2O0yFSfPX+c22RLbLXLYqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lZs6m+xXnTqE2rJm8sOeMyfRmF0SE7PPr1AiUcpaXBsAWJrQxIvwt979duRTOyq3ORb7WJS9cWHiuGxPWM5YvAYcnufcqQ+Wd19cBwLSUg8zqYYCkbwzDGebdiZ9DSx6RILBMuoCZQcmqInbE4HQjGHygV2/XhfXO7IpK3f2quM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MG6vgXf8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MG6vgXf8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21680814d42so30343445ad.2
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890021; x=1735494821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N24iLfWKUlFKc1T6bkkvm11QnF/DJ7nQeOyrjdB7/0A=;
        b=MG6vgXf8Y+g0iYw4BgKYNaGHyenBtGUKfpXM+yyZZOE8T8mmsiNJ5zsmSVO1lYeMUq
         1fdW6xrNxDOjRCI7h9AKA9inDSL/pl0mUy5//pmO9SK/+IUhCuBt3vR6z3Saw0mwdybf
         qslMKe1jD3WZ6r6NJwkmHmkz8EJ4Y6zBcSSKmRYFQAPbNZfLIyVGl9TWgEQSecekJP3f
         XddNlAw1dwqvRgYZRXA9yOH2wkDswVK/u4hFVUXN1OUCvjIClEGPne3C5nVqE6j+O7MB
         znfVAt5QgOTi21x1I/ztc5CDlYoE6YQfNzAMmfHZEhY7rP1maWp5uepNopXP/nsaN4MW
         MaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890021; x=1735494821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N24iLfWKUlFKc1T6bkkvm11QnF/DJ7nQeOyrjdB7/0A=;
        b=l5SCIPNNB1gOw/yypLKDP/nrJnEMM/TBZKYqDJP6htPXdETmKDmjYwDR+NV4VIWXK5
         kCl0gTZB/VyW5IP8YrRmpW9ttHB4Wn3KNhu55cTHLA39NpzqUzVPR714S5iWXsCk6KVw
         0exdsTNS2MeoPWlFIfOU+h1HSDVPTVOOIWQLdh5MkquNq8G6YWaiHRiKlAnOBPJftC6u
         vOIhuoijmoh3wBw0BIh6PxxhNuDR+LNSO1739U7C6U1R55nrFZSXeSlWjn4Ji3xiUmnY
         gGLvLJ8NN0UxNRCb0wqu++Z3vd4v1kFs/eHxUTenziEPhR+Qfvdy9RrHBvejO2W5Ae0N
         WBTw==
X-Forwarded-Encrypted: i=1; AJvYcCVWz03wPO8qkz3IqKzI6HYS4txOsRFjzbHZWufK4NVV9zXZza9gWJXMmsKA6VYAuRb+Miy5AQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHlKPJVZpukg/EQSyUaI1R1mU2YweF2EikXfrKyOChFipoB36E
	kwb+BcoYyGltfxwTwKtUJxt5XLjNzkCxzAypjo7y+XMObm11c6Mlyg3QXWlf
X-Gm-Gg: ASbGncs9Lb82Px6v6pBDDvct44BlA38jjgn5e9wL3wbJvQ/HTMBOlGSO65KXlxalw2Q
	/Kk5wM7l8M1BDwEE4VWn4Dr+rMc5gju3ikSYtzSD0mJ1rpIR6cy59IQch7qqu2qv6RTruVO08nV
	FtwSDFApoPHYW2GaEGhAfEMZb5w1g37AI0uQ1++fuyl3RrenBxuQjRtfdwj2S2Uk+JeYPAazb7o
	m26tbbt/gPEmr2ZhdPk256d1ObpWvihZleyeTQfDM4+wjsL2kwAwjckEg==
X-Google-Smtp-Source: AGHT+IEfOwJ3U9W+UweF0jknq2Ss6l2OIz6iPXfOBXoRPosT9OX3PknrAeuTJncg0JkltpB5GeYkjw==
X-Received: by 2002:a17:902:f688:b0:215:a172:5fb9 with SMTP id d9443c01a7336-219e70dbe56mr133375005ad.48.1734890020756;
        Sun, 22 Dec 2024 09:53:40 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:40 -0800 (PST)
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
Subject: [PATCH 5/9] arm64: dts: apple: s8001: Add cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:05 +0800
Message-ID: <20241222175314.151437-6-towinchenmi@gmail.com>
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
2.47.1

