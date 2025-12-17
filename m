Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE4023D7EE
	for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 16:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988727; cv=none; b=HMc9xxo9bXjIMpnnEQYwjDYpX6dclRswzd/AgN7npiE45vzO9RqQ4u0ezo19bM81BCSY4GpYQ9tqUHBChHTwHbFd5y2+UUQ9qUry4wRMHVuo0BFgHvs7yEfUg1T7z8+6DMp/CDtBvzXP+Jb1nZoxV+sWdttK8imWZTiZ7a8cNn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988727; c=relaxed/simple;
	bh=xASpZevNHcaVzYbv63kfOr+Ypk6TFwui56ogxDHDMcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Snc1I4oLR8Eg0isNLFhKgiBy5NnRJHYq94zZWejI6pDFUstgrkydlrX3tU21ZROfv0L3Njb4aDE6W+qo1uOtzSoo8H0ss220QD/3z9RYA+EhQqZNT3rhiVOj+kfNJ7FzXfqaiKtSy0NW/6CxaDXfnogayJW1JfOBY/7BD8GncMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2TUCBCr; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2TUCBCr"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a110548cdeso39968595ad.0
        for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 08:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988724; x=1766593524; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5cND4kPk2t5DX6paIOqq4zpW3qf1DLe+UW4i1yJRWA=;
        b=B2TUCBCrCErtdVh/lkcD8Inaru1AVgZQK4o2THMyzqfqzPl5xY749tOYja5O2cB3Sd
         loiFp8Kq9Ooc4T4R8REJ5/QaQ28UHs+JxSIyaAO7q8Lm1Ke/tM5ekS+15CXlbfEDBCvf
         DQqOYlJ1u6KTrQSft4j4a+10KrnIKGqWSaowuGpnQ/CBR7Yhfa9A/EDZcbQb7PNLtTrn
         W2kclbJ/JzkJiUybSnh5g/Vy8cjteXUC/x1W8cTusonr9FFfUvaYVpmBIYyVHGWpek++
         aRMhzxmXDWNTFeRlTM1FMIXJWYlH6ZaWiGk6o1MYngymFU8IaJq984gV24BqnO+vo663
         uzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988724; x=1766593524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G5cND4kPk2t5DX6paIOqq4zpW3qf1DLe+UW4i1yJRWA=;
        b=o0l/1+xtIjLNENGUqaT5hqOvJjno8bjizc0/3rWLSuTqN5yTIJqpQnWF/qCkTXdxtH
         9ohvGJqQ93F89GLmiDoCNRLI39JgF5pp4KGIo5hLIEPdoHc5xSSOeVgWTIlOo9FGL5Di
         Ga6wvUfIqFfbPmqqB7WHULQEjRws4p79vVzS7opNeznRRrPs5j6md9woBdGlIM/Fsah4
         rmK0y4lBNjLS05kpdX6ifAxDZR+xPp66TRKY4wl9fmPBxH9wt0dJO/JEKCwOjfDbOf7F
         Tdz2dDiO81ulTaDRINxXMXax0UBLaET9NDzEOcCCixB3rshA7TQ6x2VvDcUW6cML8kPu
         hUaw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ1/MO0eDRjSWok5zX8yMiLsyUuwz/Dt73RJrFo0jP1WL5vga8w9urOojVgOVWqhwa5pbIUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpPChyvnZ9pYsnCWB47VYLsD0f70UAkDP/6xvc4pCi8REk4bp5
	olHuflQ+F0vcS1l3CWTPsHyRFgsgTBFfv2KqJXrJM1plVggFLsCLEWW5ABMEsMH+
X-Gm-Gg: AY/fxX5d+wXl9J9sbAFrMzsIC3M7xB19dMQd2pHMskHZlemabfnv8+fONra2Rhsw/Ae
	dL2SvcfkWuiSJhL9yGMWAstUR2zwulfrSSJBfok1l+RXy0a/Mwj5kFLx6IZuD9bgOsFA+/qPgve
	5xNHy9sx/G1bOnjatohtKoOk+xGJAWVg/AqCsP5J2Nh5XPCC3x2HU+N3NEnilQeSw8aEYTz/IT6
	mgnQimHG/nEu+3xhxk1bfw6cs+zMMRX5sDimW2WhD+GpS/W5Gs3Jrjor7nCkvknugNai/FfBgIw
	fhN7WDT850hw15o3NQZrsiQHwMLVnV5kMaGIfZBT8HbkDtbKp9HqJFz0MrydbC8Lywpo4p3Bvlj
	/FbDy9Ubk66GE9/UDh94bWfbV0ajs8ywQMoJg8lnPDWZyYMhqjEM+hLRPQl3nU12nBtn1MkUxr/
	KG64qEbCnf3efo
X-Google-Smtp-Source: AGHT+IFZoc6y1b1pXP5cQ0PFfnGzbWz6vwnhHPvENZwP09tZuV+Gdcyz37t9lePCfwf5hB/837//4w==
X-Received: by 2002:a17:902:ef07:b0:29f:1fb:730d with SMTP id d9443c01a7336-29f26d2fb39mr203552795ad.25.1765988723895;
        Wed, 17 Dec 2025 08:25:23 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:23 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:27 +0800
Subject: [PATCH v9 14/21] arm64: dts: apple: t7000: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-14-4deadbe65d03@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=xASpZevNHcaVzYbv63kfOr+Ypk6TFwui56ogxDHDMcc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlCfqtnj3K7LLG1583f9fJoNwcOfr9dxkt87
 NMURcTfSY6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQgAKCRABygi3psUI
 JJ4oD/9wGXL0RPwz7RwA+udXKga6NOZMvPE6AWK2GLo+Q54NI8kf4ppSwtCkcXeBXP11SmVFDi1
 VHlNNMEA+MMbnwVnX++oHN7jkn2Ag0KGIPzLKzRiFBMID/Hz3XAN0qSstl+LGSIAQZWfa5JG9hW
 aDby8qRg8x0AvST6KJdgK6thxZbTponO5XTFoH4+kdU7YsPKN7paZodsc8aB3zi4rIeuLNejFFU
 OwNTRNwa6KaRFg/VbEnIswe14p06hGMqczn+pdw0KaSOVNFfUApQC6Ts6yOY6mhL4xU+jIJCLV8
 KEXN936EuEJUIjwaCizOwol06/GXwPQ32GGcN3HXdljSy1YDYgrVc+MCLQnWmJ+C0E4SvPLl9+G
 1kd4HV8OzPLcYpDEAJLsa3pBMXtF2pqLC4KuFIK4rzo+tifUWci3D6ugxXzYCe1uoTndGmf81Ia
 XNCc8TKqz2yueBPl08DjmJWWKCQ20tIthfhmegmGvFn6a990QC3VsGqU9mmlmpwytBr4KiRrRN/
 CC9Gy1T4CBSASNdHO+WyV/Wa8WhtFliLJ2kASnpd5rbGLk8qVIqRvV24wf8IGt4l4r6k2bzc2Mc
 rKENc69LVKhwX/UMU9aNd+zFdWv2nE4jclbhgNQK6Jjsr0Ol7B2MZlAoaBvM53PrteYke4CSfra
 nWAG6vi3ijyme7A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 0342455d344474d34f7924a089bf5f5915e68d55..a416cf8204173d4e45eb7baab42302eefd0e55ab 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -282,6 +282,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t7000-pmgr.dtsi"

-- 
2.52.0

