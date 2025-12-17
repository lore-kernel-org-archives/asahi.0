Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B9F34D906
	for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988742; cv=none; b=SPkjthtdtHfXja00ZM57lxBffeUwyHCJ+FiBMFeYrNf1mKcVRf6nwRcjcIGghJ8XJD+g+FOF9Y9zW7aKyfw0dbGAn3BUn8S7AHaFGe8m8IpzWG1PtmveZg1WshSX1Bf4tGzZyR/0HobUDSyXUMl7th/K6VYzdqnOk1NuQNklM64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988742; c=relaxed/simple;
	bh=OX5KL+MG6sfpo1KjHjEhXoAalFtdpPr6gBFVJvOaFLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=odAy81mw1qlmSIR5/0GuwIGNQJYdZVRxSblEYsYwinVRtQqckaPBv/gjBOy5YNr4yYn0++o3inWoLd/q4Yu4l7KBQWuBAXk/hjferhZXfzEq6SAJ3Ruw92OO4mU0mJ6nePgjshhvU+cYkYdfD135CMIt+CFtZ73+SsCPrgNL5Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3m6+ogy; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3m6+ogy"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a137692691so25996405ad.0
        for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 08:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988740; x=1766593540; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NS7rXNvu/k+fb0x7YdnIE3Agpb80vBTRZvlvmIIsndw=;
        b=S3m6+ogy4j+94r5/EVHxNl5eN45+AYQOURdlEwnABLf7p5LN0VxHbMnEJyNcbONHoS
         HAclo7gVLqgXql0HMOByDgWMMwU4PIVHZShwrJnzA8SWSMirFr19FtwkLN2BaB3owzq+
         RVUdmoufF0r4g8X5JQCZd16w+m0e9JU60jUCJ1W69Gftcd9THckHjbTqVRnmd7eohdmH
         M5A22sh9ah3ymQ2TYN17W6hBTKJAyjSufI2p664e0ekqwZ2MA9A7yz4WzO4TPFkX+0+j
         AfTF2CRUjMiqcRjesOeEVqnKNVjSmpAbzkBh2avoFw7X2IyLbQYASkQrtPg0hfayWF+b
         qEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988740; x=1766593540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NS7rXNvu/k+fb0x7YdnIE3Agpb80vBTRZvlvmIIsndw=;
        b=n5jYDQXiXWCIqkCVUiDp2QlYHFtt3g9TQ9Zw7TuXWVqT8+2QlBF/1gBaxoJnlErs29
         l/o/IHapowQhggYIbNv+EKcprox9HQ3ny8FtiYN6lUMzFJyjiigrgLc1lnO474O4mofU
         Bta0hbSiUdTwKb45AqBtDsbgh6yUPUqa5wLBdsFkRZSh7v18vO92aL/EfWf+aCqVh/fq
         0ynCmaRJjrIeqxR3fpLhnpOTL7dY5FAq8kKRfyg8zc1Xsxu9kmMC0FVWfk00+hvQMm8G
         ogE8ltmZ4ZNUZAsSGwK79EHVylsA7bFpbnuAMHcRTnTIVUbgbxRInOnua8SSLnLwoRP1
         V0HA==
X-Forwarded-Encrypted: i=1; AJvYcCU723FWshbFijK9PVhTxyZKTBRWtjFIshbwqiQjovv6RaQOaVFfmb7GSayd9d+XCIZuAO61eg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKLqgSXMkkVofpiQ2MH6XumCNFLuXhqE7phOpUOeuXmx+e3GHJ
	o/jrHdqa4yadNTA2UOjEs99InSRtmd5dEkF44nVheSWmpQ33Ux6u8yhaKe54wFGS
X-Gm-Gg: AY/fxX5l8UlCMRen0/IK6YCB0qSD5RLxMuosmsbOjYj2PvldfXXHmynXPdUVqw17Obz
	21gS6Lb1ocTcTWpYNVLWKGmjq2JGwTL0eYPRtAyX/sEcNMDdWO5gmqBJqWzMQXeWAH5nMCQXHsm
	Nj3UjIWd5A7rgOscd9qCzK7bTSb+abWvqSs++9mlbBTJLCAO0ofRABGlZ30m68Y9elohptnq+1B
	mq/OAGLMavZDBAy6NFR/q9KwTDWaOdlir8Ddtf1KbIUYhpiO540yfwwWMpMCyJfiVQ3QHsGlH8j
	jum3Qkssy8Rad6HwcSEcdD4Hy5cvKbMsmQqHABy7d3n/GVmm5qTL454We8R+hxumJIyg8Ks5r8B
	TeNmULZS1rul4pvxQ72BiFe3Iw8bmt78FdkBXvcrikFDOLQ5/l4u+T33fDAfspZPh5ISj9u9I8Q
	hP7n0al6WCtKul
X-Google-Smtp-Source: AGHT+IGQGMr0AmGgbN4xg0sghCxcRIAwjDwaNdSGUd1h1vpKA5x1f2e8ppoipUpn3JG6UhCjVxeliw==
X-Received: by 2002:a17:903:244f:b0:29d:9755:9bd8 with SMTP id d9443c01a7336-29f23e6fa91mr197349105ad.22.1765988739788;
        Wed, 17 Dec 2025 08:25:39 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:39 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:32 +0800
Subject: [PATCH v9 19/21] arm64: dts: apple: t8011: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-19-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=OX5KL+MG6sfpo1KjHjEhXoAalFtdpPr6gBFVJvOaFLI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlCu5cj/TLrZWC6mrH7YYJbkqAiAC7pEfyDd
 Hj0f2vlWA6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQgAKCRABygi3psUI
 JM2jD/49XIhE+QSFJovMK9EioD8JZ2370zRmv2bettLyrYyNn0ozJMj8eqHpFbPUdAOJzworI53
 0pQpcWVYu1W21pzI01Ux5JtTxTozyJicMOWFMyQQNnKGK6bCr4id9v8mlTDLjOJgBXuVbxW28Qq
 eucnSDjLgwQqC6aMe3lftGDTSYaA0cz9o1BeAA1/vhrJjqUMYWxf19ZeQRqLOjn5lXaZT08K27p
 t1JB9P3kXgPlz5x0RX6Pkc3aVeS5XW42v9j4CEl+j70kYzdPLRBHarrvMSXua7Pi9sBkjzHtjhz
 3aCG0hVdDnKh+g9dhIZBiMptatnjb/1RQPFabtZgG34GtKUhbJQD2XiuoZx7IEwAokW6/KOhu7/
 ewMCbVe+Nk+mzlerzFzB3hktV7zUZfFaQXkFgtqAVpMgC4MQMyOATSP3K+/NyMIZ+prHnwJZyA6
 3VGKjR91dL3QVEjh4vDPbt2QUz1skKsPyR5NqhWCUf+USPuTNoIuDXzF31INwSNpEaX9ee4eXON
 hyK60T8cN+1zlC2BrwYKZYlGjiwQcut0Z5T0Le1NFCnxqGbTOTxWvl+QbtppK00jOHhIIl5D6Ts
 1pfTwx1wjiBZYCxLiEtmy9byA/NiDYMToyRt6eHVxMGwI2rfrw+Ki9SmrQxqYzQ7EDqYo+fc9y0
 s5uk4hc5IzzYy+w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodse for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 039aa4d1e887625e7b6ad789bfd9aa032dc58d01..7f7b0230cd648eba2533f860622f683771197bff 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -329,6 +329,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t8011-pmgr.dtsi"

-- 
2.52.0

