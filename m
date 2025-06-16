Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222C61F1315
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 01:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037605; cv=none; b=PpSJa0L5mUwk2vogUUq3dXVmALv8VLc9hq0bkeRQ2H1xv4p90DhV8jvdjhcl25zAxxYtz/zBOFq9H4DB7ALSo0+X5EhIRGo0ZzS3ytRJsEbTGlGYEVe+Lq2FAlYz808pa8LRP5WzRyowwQvmm4lL3BZ7aQl8rYzwUrrq7Y17OCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037605; c=relaxed/simple;
	bh=ZHoXysjC3tKjwBhupXya9t0tvevKJFeLclU2Q2P4acg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dix7ekz8rS6lC58qhf+6561+zkfFndSVTI8dHL9ndaSvDXMMWZs3x+1MNtMqQXdYnxPLJeiyyp34wcEJdyNqp5rsIyfxg5qc3tDsQnH4i0ndUqwe8brG5PCv9tb48L2kHdrANDIt4ygJdvMxeqXp4//sc/U+IpcqeYGlFBEn7hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uws6TbJ4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uws6TbJ4"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2350fc2591dso35520785ad.1
        for <asahi@lists.linux.dev>; Sun, 15 Jun 2025 18:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037603; x=1750642403; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=;
        b=Uws6TbJ44a2U5SCVwbhLBKAvsKqR26S3BSJC2QF8ZJ7rDrcrMZpj8FrSRdcsP0AryI
         8LXIIrUyYrQ9I2VItwQRHeksGpEg1+D4dzNyn4tGAXwWBj6q6XgmN/MSvNn76rklOvHx
         eSiNarOcQvQUyf2Ta2qTqcoAMLFCU62rZEyIcxv1jJPEWW2k5HG2uzw8CRfDpYOaFVQw
         fXGxq4knVp9rXDoeBn6F8I0cRHMgKF+aIRINMa1SZ17X96ClMX7fFDVeb2Pz7CmaHBmH
         tl7MYbFrQz5sePHn5hoqvqcs9+wIvsVp9ZFAUdCK2yPZ2bBbw32poTNz+nX9WqbXgqTV
         fewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037603; x=1750642403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=;
        b=dG6tmT+kxK3bvO+C1FQTinG+iF/vQcNODr4dvuVN7zk41VicwBql8gUx3B4AEjzeZi
         sApObCEh1VjcwBXE1zblCF9cNV3tG/x96HKhf+WA3b2jsbX+jnBIpIrPMnvRPdqg6ZAW
         YgrBJ+HT2i4RywxyQYa7IZc+3VahM1hg4Y7BI1fUhXYiXWXBJC9dIH4WoHLX14Wx/qAf
         epsD8rKlyktLe7rXlHfJIh7iM3eXNUcTppRdEKz4MWbF/CCmnlsWQsjUHCxvXytiuYNn
         r4zGJCwYukYV9Yyh+nghynFkivGajfn8AvUoH9CXHPRZGiUXRPPH1XPElI3fNFXSbPBL
         HMVw==
X-Forwarded-Encrypted: i=1; AJvYcCVSJM9znWaVKk1aKkokxXoxC+QwCQ/uvY+Lv8nYCDE3mmsVlDRyQ0RV/eElKBEr+KC7GBqBwg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKUJpsw9ILoX9fZj6DCHbH8fGG7dZX6cDPN0XiapkQncNXTI2j
	oJggRojpyalq5xzXOjy+k8NPP47CYp8DbgEwkw3Y84T6MlBYZFHTm2zP
X-Gm-Gg: ASbGnctulcTPeYyxHWNRfnSgQE6Zj//erUQPDTf1FqFK6SDTam13ibTPJoFzLIWzAhm
	LKVQnHoial3AEYVxX83vair7doTqZI8aJO4lCNzRHCOIXEF0G5G2mpJDAPoM7srGinq4zx1H0NO
	tqs/PBYbYWx+H+w4VMAtBoR6UnkI3YTc78OWoGp0ysU3mP5xCzL9CmzL83RMXJ19EMbsTCJScC8
	JoG/E0chPSuF+uCBIvOHvLX7wrOFkoC8fT3UdF8K5KqLc20b92sQucvkLuwzHp7jlTRAqwBvXzx
	5zHOAWNWQvHt1vT7FxVggS/ELzAYIWvaaPAXWgEl/+Jw+MNx8EaxcekslmdD+wHh67bhH/bXGHI
	Ur7o=
X-Google-Smtp-Source: AGHT+IGUNE394ORxjIh9GhaDQ4I3KqTxb9FUPwuTUfcms2kv5CaO57PXeF2Ec3A96Ssb2JDXBhtDnA==
X-Received: by 2002:a17:902:ec8b:b0:215:b1e3:c051 with SMTP id d9443c01a7336-2366ae0ddedmr101009925ad.11.1750037603347;
        Sun, 15 Jun 2025 18:33:23 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:33:23 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:10 +0800
Subject: [PATCH RESEND v7 21/21] arm64: dts: apple: t8015: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-21-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZHoXysjC3tKjwBhupXya9t0tvevKJFeLclU2Q2P4acg=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QaSXqCudX2xRA+ssME3ry+rfSTxP+sC1MrC
 ixnxG3HfLWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GgAKCRABygi3psUI
 JADEEAC3bkcdx2hB1A0jAuE+jQT0MTVLry1QJzypyt7uDz/cbauH5T0Flh6NufBZjPuPF/Sv2Mb
 rD4RMil6Ax3YXWBc1aL+j8zwQdq8wRFn1XvphQyCVzPcG7GEckhipulqj7Okfn9ORpTNI9VZNY/
 geWfae2fnK0yc5UUtGz50C6/QAysifrAjrAefbV9XGSW6b7sYyXXlISwB6nqfCt8A/c5y9Kpk6Y
 BXEgeqiP1Sb4UYQXBBIxj2ycsYYbRr7pWWsmqVrk9CGOEmYKZ79qQG4uYjzZNI2/GPFkMTzaeSF
 GWbX51uX2Y8WGyzuqHJrUGRMHx0cvSK/YUUuNW1RppphZPWHTYGOEDFfw1gPod3NPjMueLg739Y
 6rXnPWEEXwdfMluXd/qpa/ZS5pDnDnMNnjqZep2Ya3LNOyvnhBCBqIoL4mOF1NAQiAhtTrOvVtf
 Z1TgtrYc8zZoa+1NgT21fugtO25LVSxXRbtPBP3E6hGz2BhG1AtqgpFfAsm/ZapQhomR+vxAkcx
 mhk50zGnK45EUy5twAajaN1i9FyMw91eWP/zsdue2J9ILg4FYTZ90km9mi5Ln7268c0vR2fThMU
 L5ayeXeJbFaFMHgMkyBWIdNe5fJDPc8e12T+KwnErz7hevAZknTP+1m2G0FYXTVn5z4M0RmiaB0
 BbO6+1HlUNipYpg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 4d54afcecd50b50ed1fd386ccfc46c373e190e6b..e838b65ea63eef9c198032ee87e63dae282141dc 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -252,6 +252,18 @@ aic: interrupt-controller@232100000 {
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
@@ -380,6 +392,18 @@ timer {
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
2.49.0

