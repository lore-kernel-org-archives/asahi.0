Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655C730216D
	for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 15:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454322; cv=none; b=tcNbudod4D1NMIrE9mP7vzKryfqBIJ0bwOaHN5nP8IfDnTiDMRlL+jGgT5VWuZWMsaiBnnqOnSepsklGXuI8yS6O21xwPAQsp7UJMQ7WIxwjUzn7jROcWL92I1XRByo883jDVwxBqo0Jjp30bpNObOSCFeQvpnyl8G5g+81ltPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454322; c=relaxed/simple;
	bh=q41LAG04mQN+h/yjsDMGUnk4+iW5c6zrOTH+jcEbjrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NFNxTqvta2RJj8yxxzZhdKkPZmBjHvTD58qwwWh4BBsDPUuG305nvnCp3DELTEhycNfvyehpvPIoWfXK8ApDmZbOTxdJzqYSwKEX+J5zDC/gIVbGRIERAmC/Z0pMLnWlL+JNwNKe7NkH6F/p53q8Txo7dlIfftvBXmkQjduU3WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mf8GVv71; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mf8GVv71"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3306d3ab2e4so5517256a91.3
        for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 08:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454319; x=1761059119; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1i7iqUxmgg/DXwXQpNr1KmCqr3Rj4mhCflPyxgc9Us=;
        b=mf8GVv71Q0qAkBob1AucpIJMP9fSRO9+YXRfM6K8ViLZxoq0wLegsGisISbRm3GP0W
         Dk0F7x/wVo1fTJznX6NPiPuCXiiVeslu+MuIAkSkKqN2sE7uOPSx8mCVKY7VhewjHg1/
         uVgNVPGytkon1QEVeupKuDuwv7L592cIOoe50QdSvDrAPZFTGGdProwfEOL/gafrSCxS
         ms2Ttzg+phVUeJhMMLe3AvnVdvz8euNyfhZVRA4cXk4k2nsgMW0ORKfUElvopnekUdOI
         Py7ATvO/p04xyPDEJqTPGJeFSqvx5JjuoRgo2k89KWBouKofOjMq3DO7XmWoDtcPsy/8
         pTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454319; x=1761059119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1i7iqUxmgg/DXwXQpNr1KmCqr3Rj4mhCflPyxgc9Us=;
        b=IkFlj5SaAbuIAcFK7r2XjLB4//7pHdQedB4faLYzBqdboWvOkg/+7CdJfGkxVB+jai
         aYYNhZhtGnFORAXEhdheu3IGfMxpVYNnJpqMb5n4+D2WpMNhL1vblDuz2C7m8EobUr9b
         P83E2/3kcNSDSb+5112uxD287lKSsu8QACORPzmsGvhHW9rxgDRnVcZeqJ3vQ8LdMm19
         x6lC36p+JchQBvSS2ztrTXxRwZg0+pAmiyqsS/Tgm42H6zvIaWfydQ5IQFkm/KJwq9YG
         Z5GzxwTE8gleXyRWs3kGeH00O0uZws64VJxvilQMnfQ6miMQxTPyjUZAjJ47wgvYZ6z8
         BKpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnalhyy8mblRc0v+5mZV/fQEfTSUfJq4EML//jJl6vLuYEdbskBWVSbsIdoIRoSyqCj2UQZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwkNoixPgrXcba4/N3gwqsxZtUH4Lyhv6fa8z/+LeoW5Rwyuda0
	ukJIzl5mxXBXRh165oOOzyAzKK279LZxDKex3MrU+b1UTY10S7DxK2ka
X-Gm-Gg: ASbGnctczoUEH0a3YC7ca9LFFZ/qmaV9IwfK/c/zXog8yjzKIaKQmqW/Lj2kMJuhAcD
	3WiO2Cx0+xmNMCznPw+llOmdt4h7skE+pc7ADzrS2rYHBeYh1ElyHAdC51hNnTt/3F1jcHrqhfc
	AXfc5yPG1VGysK3FlCho/HJr1kYNFGs1dPwjfzaSJMD/l6eXOgKiRK/rjdEniAvtgBEZvFlaqiM
	jt8xQru3xgllWNTJcuk+GQ+c9pZ2cZ5wHtfu8Uj6ABHKuGXZYklXACIA+e+Az4qkhzqRcyl/YJN
	OuqLHSZaJLw1w26JL+wyz2l7dQ3JJrEq69wgGpzRdxDX5wGd9d0CNEBUs6nxkWgabjqGUHMb2Cz
	BKFCgEwQr6/YqQVdPhcFtvUfgadJ96kUuE1syDTc7SL/8ByPQqNxpzg==
X-Google-Smtp-Source: AGHT+IGxU1aUYANixpQW6+RfJwrDQsy0lpaNBp+StZI5SmcT71Y9IkZbC/eBjms/hpV0Ia1TiVCOIQ==
X-Received: by 2002:a17:90b:1c81:b0:330:7a11:f111 with SMTP id 98e67ed59e1d1-33b513be2c9mr33511721a91.35.1760454319490;
        Tue, 14 Oct 2025 08:05:19 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:19 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:50 +0800
Subject: [PATCH RESEND v8 17/21] arm64: dts: apple: s8001: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-17-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=q41LAG04mQN+h/yjsDMGUnk4+iW5c6zrOTH+jcEbjrs=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZuq26ljD+z+Y6MIqkOiTRV6L4Hn+JOROQ9G
 KHaTtZDhTiJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbgAKCRABygi3psUI
 JAyjD/wPsIPDTqdU23/DJv1noYw4bjYDPRNP+6mTAR6BfTFdSrVMb87GTXJiFVLJA/BdtCdKYUE
 G7yhhrNCrXaschGxzuQ8ryViFpkYgEEZvKlUWMpqBfhaoK0OO66J+qne8ZNvAShnVwoXXLZauBx
 rajcv0TGz6krDyTimriCyB4cbKzvB4Q7pgyz0MdtaH0JTRWxODkrZh//gPjVdYy4TNPmnlSGsEf
 WVYVHhLdKOQZAXRDXqRwIJWugYgYKodtn7P+0aEYAUBv8sTQ8MqprSnglNZBfnNHhxp2hTE5id2
 PeuQQ+nV2v05y5J3A20srKU1MBsNZzXCq3zKuSUzlPQADPsNJXSdLOmfBF7qhDKJjaDRMpu7VMc
 cHZJnplzhOz4tRc3u39wPE4Uby3q8ks/mDy4s1HzaGwkFt0IQeXIdWe/pwuK3s0gnEtFkkGZboI
 ZPRpXp3D27UByUNRylPxQ6mcnqFIKExaekyf+oL30EpcEruYJif8e0jpYzxWVg5kg4je0eMs/Ms
 EcMDV2RTzujgVfyFjFZkL8uFEEdwNaLEFB7semPfrdcEUKE71Un8A+qjevZfDxfV3Xpw/XVQL9S
 IJRRkb1FohBVPqW0Hz0odA6o7Owk8RluXHygcYYAr3Wnxq3Z7dlrHRP/vBjweGnxtwBWToOGDm9
 R0So6USZLiD2QLQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index fee3507658948a9b4db6a185665fdff9f5acc446..ee2702fc807b678023915f72b5276cc5a31e1222 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -222,6 +222,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s8001-pmgr.dtsi"

-- 
2.51.0

