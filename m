Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EE824BC00
	for <asahi@lists.linux.dev>; Sat, 10 May 2025 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889955; cv=none; b=KFBKMb17J9eMEo9lH4lm7aqWKqXpLhriNOFO5Ov1hsH8X95JWF3+QTtPaTiOJRWZcIgs7MM69IOzRG6gZHmV7J/1bmgNzWq6ExVI8mJ9mM67s4R+Pv4DOmwKFNHqs+IBKgDnvxuCu+kW0P9K6tJ34jV8QPseZj4CyyrS0uHlDg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889955; c=relaxed/simple;
	bh=ZNIQgw4HnW0u/JgkpB+HMZ3DOfGGfZVMtPocokF3spo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KBUZMUC7EqVwCF4vzrLFsU+htHkX/ZIb4XJVOgubc/WXISdwxXEDqLuvz5ivuiQX2tU/ugr7HUK+X0ONkz6lyf1z24nt77nolrFzk0XBXk4+Hjbl4ydd5IKRdA/SSWpOXYE5pUBNdjOCmm+hKPGLWKW0zR2ArRHOXms/7a1RXPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHEaDT1k; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHEaDT1k"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b170c99aa49so2065522a12.1
        for <asahi@lists.linux.dev>; Sat, 10 May 2025 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889952; x=1747494752; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=EHEaDT1kRfisyERMMlXf7R2gBGZ4jr8S6J/v+N4Ab7RLVLSTgcYJHs4Nt9n3bGKVGj
         aJVu0bmuRALqLROVwAzpqqmNeUMOP378ozCt3S/12Nsn9naxFlhq0igjR3FA9P94sAz8
         xlUrLUgCTwa0BvRxwT4vDA5EcsEqke8lza2CPLG6uS8NH+2R/tjeyI+E7A9RLNlNaW0B
         uYy3/t0nSD7BCiXaNJ2invu/cYq+DClRcwWFt3BFYwEFO0O5m1mYCgqdH/zqBmWAwA2B
         HBZhQpga2QZzsfgl52eOuuTH++mAYIRtRWmZ4ID/Q9pJIsG2OCk346v6Ti40jvuCN059
         XoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889952; x=1747494752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=oFUgGh6EpDdw/4mEWMX/Js6gI2kq3bllvRf6hYTqqiRUWMHFnOSiMNWI6hzmdEZzrP
         OGzUgmcmpE2qWuy0DFEJ9AXZxAGUWF91IT1POsFtJpIydA0axqUMx39mR9kfTnhyxlSt
         jcbEDmhZHr/dyXKqTIf6eL1U4ExrTE7ySUj0RA4Z9Oy1NTahR8Zed5QCO+Vn1AN2Sk2f
         MpdTg0fIOCAG7VxlPS/7vrAQlZgTEbUupM15FVajoql0Ijz5iuJiD42nFMVr+v0PuJ5F
         cA8WVpx9qUumTxrYQBwt/6RV9uibip6iBCDF507U43fwNR434nO5bcvTwG4x3VPHtFjr
         OAFA==
X-Forwarded-Encrypted: i=1; AJvYcCVLjgS1uhn93K1IKPmbPqu1VivrckM/Dy6FmLm/Nr+th4EAyeeduJ3C2f6eaAcY1zqf/QRmJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyqkyv9+WMoa10zZ0x3F7uf7Wtf8hlXzSfFPPgufvVlw8Ve7LS
	VJjKc8HNHzxHmoDceDeFfu384zHITgoecRQmzC8IzKOieUzUj9QAgLExuA==
X-Gm-Gg: ASbGncsQxmNtiWV3ekVTKRzTgllH2yk5WEj5VMBQ0lieJd8R7GJQOkzz4NhYYxIUol+
	Rm9JrHZXXPEWAQT0Wbu4+pr9dsYnuXn4a8LrI7fQtpF/XMeUIIyhQkuTHy7WnJG618niamEI0d8
	fysE7zL2rINA3MpWt10KqcNSN/tP8lUaPVmp5+rcd19SEUlZsSJl7Mz4NDe0LUxCATQh8+QBjw3
	WGpQrAH3pHLdcUIqfaJF+Fjsz+Al/xLSARL9CdsXr2Tm+DtncPCVXioX8M9IBB2yEdtAjqRlwNv
	mrttf/kUAy+/Y91AfrqsvTqsflVvZS3p0wH7+VRgPdHrISx0rM7NGA==
X-Google-Smtp-Source: AGHT+IEMFhh+q+cJHPupM8+Z7cVVNi9EWGiLspkGttGc0HUI16zP77d/SoHDXw1/U1p5cJlCY2G+4A==
X-Received: by 2002:a05:6a20:9f43:b0:1ee:d8c8:4b82 with SMTP id adf61e73a8af0-215abd22329mr10897841637.31.1746889952306;
        Sat, 10 May 2025 08:12:32 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:31 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:11:00 +0800
Subject: [PATCH v7 19/21] arm64: dts: apple: t8011: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-19-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZNIQgw4HnW0u/JgkpB+HMZ3DOfGGfZVMtPocokF3spo=;
 b=kA0DAAoBAcoIt6bFCCQByyZiAGgfbJyjeBZn2zZv9hz7wHCcGAs9PvoObq3TMDO8MNjzkgG2+
 IkCMwQAAQoAHRYhBEtSeHhcl6z3nDxogwHKCLemxQgkBQJoH2ycAAoJEAHKCLemxQgkszAQAJF3
 v5zffv7gXhNtsc6WJ8tUdwVX3TGkTdLQDgyh8tX3ZN7c1t2OBUMFu0Q8CsuaQA8KbRRGWk3rH/+
 pEU7U4qPvi3Mpe51F6c4RUqrFK74mknjMGH0PA9pHXi845AzNa557Q+E9mrIR5Bxe0At32R/o5H
 cEXGq6n8yUS3VV+S24Aqovu488Qe+M9IrjbyqG2B4X5dOvwbUpfHE39mQdv8NSnKmL8AF58N/gf
 vChkPFsFsmAL70gYkcmdrNFPiUhmXyVVyQtcx1aA/FaPo1FwNDG4mX1LAc+okj0adNG/gHH8ITH
 RRGZPIkl9nqHq4Bvda7bT0omcDiaZlOvjWb14bKbQEcHrc4CfMuqHs6FaEhRRcPbGBrLN0P9HVi
 uScyYRlK/emBxSg5UhQLxSqqoW5CH3eC/SLDLvdutTLBWaseyUczdqbm3KwCCG3o6+EbvbxzMbj
 /OSpSYrGNW/0w/GFWSUeZYSw7rEXQ/mgFVKDUvyYr/v1IZVjI5nWkNpEbqu8Bd1ZvThNatdmQgK
 TqYBy5ywI0/hk76w3cMUmxJ6Ow4DqrCqdYr8z32uapfeZ/o2eXidBPP0OGWLk9nb8NUaDsNUypu
 HoPKdfQoPYa6Lv9J6rkdo7wzUtDu0/ylWoxTZdpk58zxmgWn31G6kxNmqNjN7T/zMgL9MTXHD/H
 ohKGe
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodse for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 5b280c896b760dc8b759bf38dae79060e34dfc19..7fb3ab738f67583d9a19a542bf36ab2806268d55 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -237,6 +237,15 @@ timer {
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
2.49.0

