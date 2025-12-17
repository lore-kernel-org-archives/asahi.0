Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48D434B678
	for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988733; cv=none; b=h1dVXU5GfcIRtNcVZW3oTAN/uFsMyTi12v/gbIkyxPGYihGw2EYiR++ZvVgmQDCksP7NTYot34jvyvG3M+6opd2htrtBjhzKD5NRBsQsdmnwG3vNpSvQAyHAEMh+SOY6RTGsZyS3N2ezTnGLyQc0KTLlDCzQTS8bTKBGaF+vbsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988733; c=relaxed/simple;
	bh=3omd0YVrSktNDZ3RXrP0xc/+wVtkaIIz0927w9SxlCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f7x36c6s0NmGEiUYSiSRlqGaH8PQ1GKQhWIj5YsjSYJr3g9P2M+K6co4HsB0itGKefA0dc7z8u3BWEDePM6zv9iH0DUuvM6jxagAsgR6fnO6jxSbQCvG3PpIzCvtEAQL8LKdO8dVveIiKTjlNI1EX/xIzceqMg5A3tZlsB+VMCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xju7k6/B; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xju7k6/B"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0833b5aeeso67305295ad.1
        for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 08:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988730; x=1766593530; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOOkO0Y8d9P2yswmxe69xUL0YHF0SsjJE29vdXLnWdM=;
        b=Xju7k6/BUh0j6dqlPy4nHPnzuNd5W1bv5+bT0Cbx+8bpQxYYphl+3fB6aOI82U1Div
         Hu5NMIkaGjdHmJBZDIH5q/UFUDDGlR8rkHR2M5JORdfBMQ0+ooPyiBLWrZtceOWqYl5h
         lp80NbvCt+Eq1FL47RkhIEQJtdSv2MruhE7OC6bRNF2ssl7K/3IlXmMT+F4a8dROYX3r
         oRHwBEMAAg1Ti3HYOU+F/rP161Ee2vqozQImyp6by/jDXU7olZB0u/YLN/uwEvW7wBBS
         s5OBtHtafYLIsNRyW2eJ6hbgu2+56XjWhLRuqmQoUgvq1HVI+3ziCXZY/DMSeAfN6f2c
         mN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988730; x=1766593530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VOOkO0Y8d9P2yswmxe69xUL0YHF0SsjJE29vdXLnWdM=;
        b=pSyrHHmCLSKN3CgDqz+4QeuN5/nXFOwn5V+tBTdzbFW+DzxMxoMey8Ym/NvI7QeEkK
         y9HbcgPFSLoytNnZvxDXhQxIhYCF45V3/0QIBRgUKcl8RGpWtEtrfpcBazRdgLaFUFpT
         13eBkr72m/zEdB9jue0J88YZJjKRVcBpuMdsD58IVnR9OqBuuE96SrDb6hXhcW0dN86i
         7JZd5CrSU6yi4eJeHWyiW6aCvb50u/VdgdcO16yM0LGq58gBgzPdxCjyhGidYNvGOg2i
         DD6nR81zg/xNGlil8nLqe/GlpsQL0tClY53B4103MUDdCQ1DhN6UfuS9yIsyZ8U3sNhg
         4GmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqSctAwCOKbr4ojbT1unA1w2xPrVSXiPnfy8oz7YeIg8AhorPJe2i3Afgo3fASrJJtwzSW+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyO6i3/IidEMOPlq1oAIyR1md1dJZHpjIn1xDeyFTvUQ9xY/o/B
	fDzz9YYcReXzET87nFUwmNLVXKvUG72/TKvCxw577Z/k5EDgXyxxj/SwVTbCXIHH
X-Gm-Gg: AY/fxX5FXoGD40z9CvQcjCF4736RFyIU4ruw6JdlOrMpgHQJ85/Nj233DlnADGVFy8v
	XmMVpsKEtCiOb+bWSW/R055dAJjQJwuIQP41Cdu9KFpkVasvVAMxMcKIOAUr7nEygd6rGPJWdkz
	fyVffDQxPRWtwj/QO+QaPv2e81Y4TkEomQ4hTXYiLKYuqT4rnnLFu2t8nVdej7XPBWN8Zu7F3nr
	Z5xzOKWNK/cw36W943ndU5N83jfqBe+DUwN+UJP1LB1Bho/32jOXbkhCUobynPGRE6H4bAKxOV4
	lacititGjniWLCyE4D2tpzK39TgP2UXX2u/p2I3FAYGZ4LqumNrfiJQ0AitHp8O8gFMaJgBTno6
	3c0zQi+yKQCLBixerY9gfHIiZ05GxfBNf9XV0Sjegz2y+vr4lXkMofz/KMOYb8mqfNnIEj/e89I
	MCCDGZzSJjbhQ+rsM68LAj+jo=
X-Google-Smtp-Source: AGHT+IF6ow4wM+ihwNVaBoZq+Y9IX9FSX51mWNjkFJ+2+D3BETqFbQhQb2Jfop/GosxjpA/TwOzvUw==
X-Received: by 2002:a17:903:1aa8:b0:29e:9387:f2b7 with SMTP id d9443c01a7336-29f23de5f93mr181949755ad.11.1765988730144;
        Wed, 17 Dec 2025 08:25:30 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:29 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:29 +0800
Subject: [PATCH v9 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-16-4deadbe65d03@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=3omd0YVrSktNDZ3RXrP0xc/+wVtkaIIz0927w9SxlCU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlCB346IsdcVZWXTm/5JORDgBo7bwjFJDgeM
 zWBIZvfxx+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQgAKCRABygi3psUI
 JJLMEACQhaV1MhO1B/LjaWCuuOUK8Z9B/Tp8bKAXeKgalnLI5wj6oMui4wEpfArfgB8lTIRQrO9
 UV5FEEAn2agoE2wiyqvQRKHtr36OpQ6Ar6qtePa5JXqtxs60+sEiVPztGxzkqnzdNJyH2fkuE0a
 MLOubat3v7BqjhL7W0/JzQvYuS1vnJUGf4SK0Kisv1mLU1u+GX6sGbICXBgJFGxVHKSdprVotko
 CU09T5grM/pEXc9Ev+zrinCWwSmkhrnZu1G/xGhabIYSKeh6BJZGBM7ygk8LrYyHeb/ovpMYpYd
 d2w8rS4jyc54qCaEkCcYl/CQfD6pJ6aP5rP634SV7WRy5dNYUCZ8YO8o/Ow0OfdmcRm7BWeQsas
 i4H00nfNyTUQUl+yVCHELn5SGm/gF2o04juTPH/W0ms7xjsoLhsuoh5SaX4aS719xiJMp/+Pssu
 m3e46KArILkJFwgqZXfEt1Y+bOV0YmnbnjopMfMkr1HcFma4Gh1p5fD6WHfMFbfU6+XKqi6D3y6
 ofBub9RizWdbcMsvA/wQ35r0y4dxdhof8NQXtyNeZFwloExmFjZyXGuvt/KasWFFu6Q+NSVAfup
 j82TnsuUAk1rzK9d1Sw8uXf8KTt9JcNmWTLE/z8YgZRC0s+JX1FfXn9SVlz/rGucHvLnWBcEKM6
 Tb5yLn/WFD/Xq+w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index bb38662b7d2e0b70e18b6870b706789b1cb242af..aa372aefc995334b1489953c16251c8ff9b94d98 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -237,6 +237,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 76 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 79 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s800-0-3-pmgr.dtsi"

-- 
2.52.0

