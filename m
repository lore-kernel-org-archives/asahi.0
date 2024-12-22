Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0FD194A65
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734890017; cv=none; b=M4kuPJpxT9ZyXihDyj4hOax1HuKAnAAskvmyU1dEzjHFVVcw3Qs6/qh0tUBbA8ADRc4FktvNKOFdeD7poJrcldyxd2hDhzF7B7QCAmcTPVHqNyPBdEclIJTzhQ46+xkS7rMsVXoYM6ZPb35Xe2ea9Be23xEsIqYPLw4dozgKegI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734890017; c=relaxed/simple;
	bh=yD4NluViPi33804MB+GB0u81CO6sSfmO04g6wGG65KI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqeKmyhkFlxq24X+VOABzdr9POIYBIScandhdZ4nWcmdj/ql9a1QN90P7WFuY88HBtyV1SFNBKgkXHo07qoXmokHghcNTRZhk5AY6Ix9NJbRnFWW4xcOf9VzBjHWGcV03iHDpwx6AdRcLCCo26XxmIKA0EQI1CB1z09VUYpn9cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHZ3SS+8; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHZ3SS+8"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2162c0f6a39so40016805ad.0
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890015; x=1735494815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/H34LBUZjUXTz+iaRY9rMjPwJeFD2H83GIWRwt32m0=;
        b=nHZ3SS+8aU4Otd2ls5kzLqJ8l3Gvlh3pwY5rhsp0H/JVqDrBLO2e8zOeR6a0bsNcy1
         Yeh2IV9YwwbkonYMH15frDZWQXRwkf1EzbSOE95bobJ0tTVDkzs9qsat7LU1A7hum02d
         xhjPbP5vBxzlq8Z/K+y1zmzoAJdOyZ6Vz0QMvkz/4P900LKZwDD8V+V2fGYJ8dPTVnK+
         9ktarmlMAjvoNbNXsHrbKSo0yENgSWtbVUd/Or9fXaWlQdWSAC7spECdpJ6EHT26HRlQ
         uhyQvPmJf3TAA/7vBVW5Y0Vjh6R5ZN5/0IOyorwSpHkiQo5t1ogVowseQa+YU2V/+PY3
         HIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890015; x=1735494815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/H34LBUZjUXTz+iaRY9rMjPwJeFD2H83GIWRwt32m0=;
        b=Jh4PMnL/t+30I2NQCHo7QzV3D8wiD4NlO2dyx/oKFadJP3BmPSMPEK7Z/fx5u/BUt0
         YBf8RZHdm28iI3/RpvBzdLBhztPw/1u3JJWiT/Iw9nfiElSp04g2MDJaTCY7epSxKf3Q
         CTmehIFUKzAA+W5Mit3V0+26NRFFHyCS1cOf2Sb2lpdwrUNKWQbJVI+ihao2hhvVH9Lw
         XcfLYdukWfcnOyT104M5jtYT9OirQPB4xHg4CUyp1PbJ0XFQXBZe1ocXCcSpwmD9F9HA
         chsELoRw+02YqD8AXINy3BFPc4B0udMcc7PBzuHJdcIaOOVEPTEmM6BrHsDLtOJMUMlZ
         ddCw==
X-Forwarded-Encrypted: i=1; AJvYcCX7B/wjKZ5PbVDRDAfdw/3NE59g1tVD5muJqJc9ASYrDJbiAWt8R0OPgF4plFv599YuCdb7Gw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0YBcjxkjdc+RvZ3e2yPjVohKk+ZM0Ce/QU3+YgUpM+uVbLReh
	MrGrmv1JDRk1af2FgIQ1OEhm5hsCbHZDuwsoS4Wf7Jaa8jntWJXOD0Kq9n6R
X-Gm-Gg: ASbGnculxv0Q5obzN9F7HFqOMYfLrGjChWSaDp7gf6utooW0ujLdpKBfFvTyKsM2ZL9
	Thcrgl8l8McHGN1qgS7QM563iLg3kfIzzrd9edc1/bbEWUP+RlnhvRR7gQzzgnimwvc7CefRqY2
	UWDVMATD7ZxMendYsKFG0d+NP/vWWy6l4l/cv7fMDnLX82ElfublsydIi/uYMArGo8Gkfz+/rOQ
	0qWcBa+Xa0kPNj1EoGASEAlnpGqXj7zy2zlS3GA6dPTe/eYZrcHhznriQ==
X-Google-Smtp-Source: AGHT+IHvFpLLRyzoQQ5tNKeb07qfw06v3MtCIVEteo/HrQ0DzX1pSwNVX59T/cnT26GV4sClW+vrcA==
X-Received: by 2002:a17:902:da8f:b0:215:98e7:9b1 with SMTP id d9443c01a7336-219e6ca6e4amr133258395ad.5.1734890015061;
        Sun, 22 Dec 2024 09:53:35 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:34 -0800 (PST)
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
Subject: [PATCH 3/9] arm64: dts: apple: t7001: Add cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:03 +0800
Message-ID: <20241222175314.151437-4-towinchenmi@gmail.com>
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

Add the cpufreq nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 52 ++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index a76e034c85e3..15fd91d12f30 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -35,6 +35,8 @@ cpu0: cpu@0 {
 			compatible = "apple,typhoon";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			performance-domains = <&cpufreq>;
+			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -43,6 +45,8 @@ cpu1: cpu@1 {
 			compatible = "apple,typhoon";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			performance-domains = <&cpufreq>;
+			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -51,11 +55,53 @@ cpu2: cpu@2 {
 			compatible = "apple,typhoon";
 			reg = <0x0 0x2>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
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
+			clock-latency-ns = <49000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <3>;
+			clock-latency-ns = <31000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <840000000>;
+			opp-level = <4>;
+			clock-latency-ns = <32000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1128000000>;
+			opp-level = <5>;
+			clock-latency-ns = <32000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1392000000>;
+			opp-level = <6>;
+			clock-latency-ns = <37000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-level = <7>;
+			clock-latency-ns = <41000>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -63,6 +109,12 @@ soc {
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

