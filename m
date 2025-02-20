Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106BA1F8BA4
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 12:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054159; cv=none; b=iaPWvOqv/9gvpEBJOJ9ZTZzZ4Zj/nydQpIyp9d9s2iXLo8CYF93jER/4MvY6pkgO2tGT6xNSPsUPM1aRJ6qCuqVVqp6EuJRioLseQp7Jx7D0StnZUSxH06G2gLQ0KSaSqQSJNnXvcaWP6XkBZtwWlTHdVXRPcJMkjEABhj4AAdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054159; c=relaxed/simple;
	bh=m8DIH1oz0BOQsGMq/uy1lhJh09Sh6/MpdSkzvHXLM/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dl6CI2VERvp2l+JhNz8bzwMJMtAcbzJ/e64gVZvYVFzrUAUAFL0+LU++f/h4EXya41jzB8aVX66CaxfqW6KKdCnVrBGqDubrzMs61AFYezz8Fel00X6vOSD1hq6NKGxUfnw+FVSob/rv7G4pG3RQ5Rdvls/R6n5p80PtT1/tG7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6oV6mV/; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6oV6mV/"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220e6028214so16603765ad.0
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 04:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054157; x=1740658957; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p88Xq7CcIbv//pK/8o6xWNFNp8G6hvFjdYWZku59rLg=;
        b=K6oV6mV/jf1GLPCIaFuwJd0NHcqB93aUlPcfNp/whrLMA1ThpRYiVtZHrIFOSq/Ubw
         nAf0mZzlJcCPtrsZ7ljMHiQgdo1BnyPBWDy5+cMEFX5zPu90vbicJ1rcq+p24K7Nv89+
         MOb80X4AxWW3Nb/U/haw8zTsLgfjgRa8ZqmJJvXo7UQvNeOzQ+Gt6mBrLtb1uOtPgE/9
         R0sJcumxuA0Afki7O0kl8scgNVbQXggBIMn2hxzieKUeue5NyLI5qNdluaUJ7QbpBSWg
         c0oQwyK2+zqP/8Pqk6ToJpklHZ+sHUKK8UBe2h8RlnNF553kppn+1ej4VaAREBeVzseS
         02/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054157; x=1740658957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p88Xq7CcIbv//pK/8o6xWNFNp8G6hvFjdYWZku59rLg=;
        b=vaX71Q/yHKDnhm7+fChYRzPDGPjTGdFlx18myfic3x5ALfUCjMzgCFNWrrJHs67t5i
         9cAK97Ssb4Ky8LIvGx8rqNeyBfquueai1fnnyuPcT+XpNMMfbkmBcllEQQiPlB/V3l5C
         0KWcAbDQvz7cG+QB7O33ohk+LmljQkvzqyF8/hxvZy2KhE5aMwvTPBoyxDm3/vuBOt6G
         QpNAst2tbHMaomBZEUTNvDX43AWCA78Qwz5PAOevP2pgy4047mxaZ3iJyrLSVsk4wT93
         KOq1G3LaHh0yckSNwzQSXFfmOgU5pP0ghi85/cXnKZxzRUOb+cSxdYj/DixfHEG9QebE
         82HQ==
X-Gm-Message-State: AOJu0Yz5fImF7y4dupJo1ClbXUrzPCCW7y/hFrNWe3RAM8+/RMTHzQCy
	fz/MAD1gsADb+C4MlfUD+XmOj6LZxLHKVGhWVuJ/g7MncKh42flq
X-Gm-Gg: ASbGncv58BS9DJ5KophBtcEQDgLZq5bMZcEfg4xAlPtxybdTsJd0BeNP8bWrjKZYTo3
	IFwDfGdEo1M9nKt1W3YAZ+8Ne3gaTMzfvUi3q0Hpr/MBw511ymtmzCdXhv6bmLMqTs8kyJg+UhE
	n7XLPpg/dAebfKJlMoMCbHDSwVfI/Da/7sIqLwPMtjnpzrqojJi49WifFDzD5TBqwnrstu+L3vm
	lCbUd1OLedWUDYSjzPUDMDiQyAy1fhk8Qhd4jhq3NwO8Ojr29S0LVC4QvPZ1RwMEPtQLQRKvdJE
	m/hW3i4BYKVN94TlEA==
X-Google-Smtp-Source: AGHT+IGKi0OwABJ8OazdgI/qPfei2Zb/m9/WRKpTHFBhVpsI8ngWlD5vkXqc6qhKnNsHJhG3sucPtg==
X-Received: by 2002:a05:6a00:1812:b0:732:5a0c:c1b9 with SMTP id d2e1a72fcca58-7341728035fmr3827536b3a.13.1740054157213;
        Thu, 20 Feb 2025 04:22:37 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:36 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:45 +0800
Subject: [PATCH 4/9] arm64: dts: apple: s800-0-3: Add CPU caches
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-4-2c7011097768@gmail.com>
References: <20250220-caches-v1-0-2c7011097768@gmail.com>
In-Reply-To: <20250220-caches-v1-0-2c7011097768@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=m8DIH1oz0BOQsGMq/uy1lhJh09Sh6/MpdSkzvHXLM/M=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5+sEdIUrj9lyDp6bgq8zlC6AYKb0UbErd1T
 DYTpg9Lra+JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefgAKCRABygi3psUI
 JO5mD/9x7g3XxV7Y3A3h/VxuTLsbrjRrQv3LRwbIsIbWfDt+fgtSq+UFYHXekbz3pvRmSIviTSy
 +wsG8YF/8dYtAxg7o3Et6LqUv4l0G1mf4a/cBhn+Rppu1yfPWvO8bZEPNJYG03DmR7ToCc4gJ6g
 /wm3uATeXQPckGvaofJkQN5uGpFRLiySrQC/N+XEL2686uDqnlyCH53RxoyOwtSJ5p9goKJTAqE
 +ZGlDvmsl3k5FiDxTcHI3wq/WG4zduPSAv0H7gxtDU1iyUHXqdJaVSEjc6f/WOV3/KsnVfrEjcQ
 12reV8t4YosYLLPS/YiadOV4p8LTJvHB/3VIFt+jGpuH5v3fZMNZKgp0wqHeRghQdWTkF4LvNS+
 W5SByHg0WBmdlQtLm6kHPqPaWtczr+TwcaS1FaFyUB6xLYKyn2RbFE7oAqF2yBeiZp6bqdnx3eE
 7T/cz5e4X04sLtIy5c0vosTkak8bKw6jwdcIPc/9SyO+EwcqNhd7E3kJUfpaMH31SnIzSVS8cZO
 rF5gnUkBIGD+m+YBTWf3SgF3fHIYNuVzB0wluTT3AaRglIGO+59ZCkip5EAMM5kFZ2EBRYCF2T2
 S27ln4iXKhHHCC5zuxGsLhM/QjEaZ/CZ22xjB0kC+nLzrp+JGOkkKLem4UZ9h9pGWNy0SN7F8bs
 VOJ7GCRceKh7oRw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add information about CPU caches in both variants of Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 2aec49f0da6467519aeb2561d00b14f46fe216fb..e56697689d953fdb0da9d23b57fd92b6f8eb5756 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -36,6 +36,9 @@ cpu0: cpu@0 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu1: cpu@1 {
@@ -46,6 +49,16 @@ cpu1: cpu@1 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x300000>;
 		};
 	};
 

-- 
2.48.1

