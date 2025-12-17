Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F2434C83A
	for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988748; cv=none; b=XkhH45PJ7vq3kzHI87G+Opf/WTIsI56HnGwjiXPmgNDc/OHcHRblJP7DWZcJLHR/Zcxq+abvnnZQ4Tp1+uq8PVEDMSJykd8batJI82OJ6h1rDqIfvqR6pzOwJA4p/xg1A2iKbOMs/YAmudqRHG7MSV0kd59trp5LU8n+SiVCqqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988748; c=relaxed/simple;
	bh=trWVfDATm/MwjZ2+dtjuGYhC7m5DG/4DEiwR1Jy0uIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p+mymwMi9VhfZ3GiP/TYP4hxfUSG7W66+yTxkQw3TvhrlvDNRtY1NvzLBCnVfiRdatsNZVLtnb63QbjB8N23+U54pLw/G18VP7B8f1DdunArwu9hAF6jm/NYyn1lCwAfyg7nYJa+QDoANRnvZ5pPTo8upj6in2WlJR5p22YJFeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTkx2EoG; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTkx2EoG"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a137692691so25997665ad.0
        for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 08:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988746; x=1766593546; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tdOFnD1zwwXEjmETrN68s5mUpHoY1S7934/U4qRcoA=;
        b=aTkx2EoGoCS/92bruTZU8944PAm6Ni4qg7r5Iq1IkvCQDnmz41Lc0QC2MT1/wtf6Gh
         ILriD1sXknktOO3isWoYzy0CjeMhOQH3NgwhyyahmRt0el653zrOBWKMe3c42jjlku1h
         eXAMyT23+nlFN1FH7tLtlpv0hhUllj3VVDPc3vnGPHEviNEUxgzgASJm7nZ+UDDLsoYP
         sl6WJkZ3/yAa44BECkVQLuKuHPHbn2ozG55dH/r2uprgF+WqD877JC0wZOzLIkCdkiAI
         F43MjOHfA7j+Hntf/PnJw+OMDvydZPs1luLncOnRIbRzlmQ8bscr6tq3pBqN55JJ9sHa
         9vuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988746; x=1766593546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3tdOFnD1zwwXEjmETrN68s5mUpHoY1S7934/U4qRcoA=;
        b=pACGorgS8/6jFGmjdDUw9WnOd7YL7WWdA+u0yuGFhn6PMXiJHZ2PY5yQrwmS5swLyu
         85IkKmW/em1brEdqN+mvaDgTnCroX97by1LlUxOSCnD/jQ2EUQx0PBM+VyicmpQb5lxo
         tNSn/b4nzIqmtSfa0vDWV1zh8p/Rj34O2VCMA2Enj7vJCMKcx07IZF4TRuyNIDvMML2n
         nNGdPaj00dzY/FEuX7Lh+KBDNbYoLfW+e+8NwC0Qd6/cqCUPu3L6sexs0Eozug99H3Jt
         uh7GstmPSBRI4azHQMaiyPUdXf/7SyIroXEy951pjjgbAolZNfgc4Im5nkM201ulLcIY
         vFjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGjJjZjxeNefUREQWjRM1F0L1RqwWT0PFs44EIkrw/XPys7sOBH+vDtJ2cy62xccxTAOmegw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw3RAzEII4xOAXveJjTpB8OWbyZCLLpiZVLYX11sZgBry81dGf
	VLaAS5nqILFRSfkYCQxVt2m4A6B1jD9xlkz06lTni3ejNQ9a4xDUiI0ZL93GRxYy
X-Gm-Gg: AY/fxX5HgvvNJcwBNZ2a1TwLs1CVw9T5O73n/Q46l4awaxL7FUxFeubqABBSf6Fs/Jj
	VQPskiiuJJh+hRok6Ua/JVyyjRhvmHSF3+6KK/+0apaIKkULbYRRUDuxaitDsUSYhQDV7XU1ynh
	iEyjL9sNJsA6V0SCIj75YPsraijYCNh7s/6vrg8NAlCde89w9FOSI+7qSohCFHg6M9yiSuqdoqk
	vQOmdHvaLv8yTKD6l9V0q4k7+2NYNxc+jL6t+LkbC75DjXm40LEtYVtIY/WQqar4BnDRjiGX2jo
	/9or0XxLsMb3M/3uAjw1UNqK56H2ukGlLZysnceIVskn1tspSUrKvis2LfV45Td3KuvnjOyNx0D
	MxkhVMWwbJGCKMMjzmKZ4Q/JgfVKic/NX8zOmQQFirNxpIeCTZ8pAb917MABVObyt1l+a6k4KEj
	iUhHSu5CeU/qDt
X-Google-Smtp-Source: AGHT+IFBX13bhHK6lVyBJcGkQoq1Msyy8h0DAZFFCMfV5WBxQlT2ggVro0V5kiEjXJT6j3aN8My8FA==
X-Received: by 2002:a17:902:e548:b0:2a1:243:94a5 with SMTP id d9443c01a7336-2a1024396f5mr116797365ad.47.1765988746077;
        Wed, 17 Dec 2025 08:25:46 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:45 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:34 +0800
Subject: [PATCH v9 21/21] arm64: dts: apple: t8015: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-21-4deadbe65d03@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=trWVfDATm/MwjZ2+dtjuGYhC7m5DG/4DEiwR1Jy0uIU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlDl3Gr08qJF2sX03JXifmuERFH4Oin2bn6V
 wXHH3PV7m+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQwAKCRABygi3psUI
 JNloEACKdtSR87e3pm0WecNFLB74uVTymD0eUkSwWkpCvJcS2bmrw6+uuPU5wdZQPIG+9akuhu8
 CSJdjD8jVGg8Fjx8u0Q2t38B9sCeW2heVblCjUOE9+tzx67P5DEBDaJPZxslQKpHGKRQcK7lx/b
 ETG3jDDCvTM8KV1iOT800Uxa1rRgm0hR0sP4tXTH/2Bxm6Xz/VWrDL13LcClv+e3eFOaOMZo7gy
 3wUoc4T1OypNKPayCDGbNzIcq9yeS94JpKxttdQefstDpXfzg5BFIE1kxXH5MZBu+axOLGVMyxR
 sMI8t4WLX27fYULPcY0/D0BiBKEranqFuWPcJMwOjpPNKBOc30qC9wdCrOME+gBLvHHPSek4SLJ
 lSPFwkKl7DNXVh92w84z3ehNHnzkl8rnJE0R2pMefLtxD0kThbHsSXuv1vKZW1WLvQZMhixc9+K
 xE4yQjIqVRkSD9/w+qLHbwuBNPD7gofTW4tzprVc3PwCLTbNEhBvAPdj6zPNJ/8UfXLn/bNmMaU
 ntJUB4NrWZjhG07Dxa0dGV2DnZVQjJNwYOqreNF64kxBrQWYEWnWs2oUB51xhyE0mHnh7BIp3I2
 cB/NB0PYZo/Y4WRfOLfYzXTHxkSOq8q0bsk4vnHJaGNFOmgN/QxF4N+iGs7LqUu0VE6lqPMMuUn
 A72HON61PR2Kjzg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 586d3cf1f3751d9ee23262e55fd692bfee86c13f..0c1ebab56d6b36ed5362a042ecb6cecef7c97f64 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -341,6 +341,18 @@ aic: interrupt-controller@232100000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			power-domains = <&ps_aic>;
+
+			affinities {
+				e-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_E>;
+					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
+				};
+
+				p-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_P>;
+					cpus = <&cpu_p0 &cpu_p1>;
+				};
+			};
 		};
 
 		pmgr: power-management@232000000 {
@@ -530,6 +542,18 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu-e {
+		compatible = "apple,mistral-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,monsoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
 };
 
 #include "t8015-pmgr.dtsi"

-- 
2.52.0

