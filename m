Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F281303A1D
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325743; cv=none; b=Vl+fn4Ge8Qh7YP33FworatNrC+rEMs9SdtbIrU98Th2TlmYKNzGBZ+c5+E1rHXz+lLycmzDOEa+SZWqoRlVSh8/a9dH17xzNLeNvLKW4HeC8EGs1N2P9Tglzy9wOfeZ0yuVdHtfyjoOkQsVTEVywYKXD0RvF3h6w/6jU6IvNdRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325743; c=relaxed/simple;
	bh=NgiaadnBWzmQWHLVGXTkghr12q4e2Z2pGwu46CpKaLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mfeddLp6cedU+eWyfyW/MOGsp055erqq0IPZxxZNVYkDXSgoqLMbK7nDpinrTVNBNziHIgR6NJI4rzqScr3EdqJ6Sl5AUAQ0/4so68V9A6hcwEGqKMuiujbjIu0Fy1B33QBdCtbYFQ1t4BQXf7z4aBbGT5yuur4UAn+rQVygWME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgaNnqT3; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgaNnqT3"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b523fb676efso99596a12.3
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 03:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325741; x=1757930541; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kj7fG7XAER68na8hgLjfPolxfyD9eQkGEiz9N4R6m0U=;
        b=DgaNnqT3J4UcKtoUH7rlToK5G20oWbpKy8LX5OIjS170re16fZiL/G3kL9JoGTV2rN
         2il3TKGLeeMyfZ5VGjbnEOJzKfAZIySsfVOO/AVEU79GUgw4uVYay7bMIV7Ec3INpzyD
         edGFZ8pmGpNf2Lsj2O9tjsgD/xlRf1JtmsYuG74rodY1Eoi535cdFDR/PuVhOTjZo2VC
         SoAOziWhyRz405PYmuONaxm6drNp1yiK5x0KL/OHOfj0ijWL2Z+tf8h52UgGCgvOJ8Mz
         v6bVQRpQ+ZmMrQ8Q7ROUE9dUL1+J7fH1DPcICU2oP3VYt5t12GXY6nJGlDou9X86IWKY
         vyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325741; x=1757930541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kj7fG7XAER68na8hgLjfPolxfyD9eQkGEiz9N4R6m0U=;
        b=tD2jqdlg9VWTSJU8bLHGccmb0pZf33XKAoyXPl8HiLzQON5yFVGK2RH4wnOxvelP8D
         Oq8oYoqNA7SQ7L5xupdoA+bJ9U4dlYLFxw9vzBNq2C5h5Vpx/haLk/JmGYJ4BZX5qguF
         JQfxHawolLqCBIeVcdrbTjknnPYG/yVoqJliSizUBckPiYp5CCdYRnwZnqY1L+hw2DZc
         yz+tEOqOtHHvBoIBG/oi7UWgdmKPd0rABW9GDdHxo+zUCE3kAIfNJS2pqwf83IHFpLfS
         rxyMrnFfNiMK/ZeN9JYjNti6GRH1dCRIvdBf+kLF7+XiBhajC2JD7FN7GZIRaqcojJfe
         AWtA==
X-Forwarded-Encrypted: i=1; AJvYcCXJE+WSjC9NhhqRzIb59R5eY7uxV3Pv8qrIQPtvwltPpHNBUvm4y86bZgAlV4Rjxs9C7kTVTA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywdb95UbvH2us/vT0QRPYQg+6/paogNGS9hTqYgA43005i3pPTJ
	8xNvxxc3Y2f0C0HKs6lbo3eGsq9OqlV6+cbVuQOpIKRAwuetzYBdg/RX
X-Gm-Gg: ASbGnct/1QVRNi3EnMlXWwko39QzVUnBQRBa6ioUypWFP0LnkgH/9sfSZH+OVOb1S2B
	7Ei1b6ZPreQVvJwoR/5RAdqcjBSlSEYR75hxUWDSf2usprEfxyoqViQKCfcdWPpU5tWqW99++Xv
	LkX568Hkf8CC3cX1mRblG66G2sgKtNon6Q9mlbiOuUAGwvHcw94YVTG+SstH9Wix8IDgey37Xw+
	d9KPZPQrfH6LN7w7ni7JCl2AqCOADGnKexHrjIqtzbemMI40p8wGYXTmjYA3GiIexDVPp+TqmlY
	+OtblGB8jf+Rx2v+A/Mx+mx639GsMjOFp+/iXZ/zxjhPmk/zxrNc+nKRaNciB+IBlSJKl0ZcVtn
	nu4AtM37isGorZha2cOKb2RH6dpKtAzu4Mc1fn9e0I7LamV9J
X-Google-Smtp-Source: AGHT+IFzBnyCeoSUT4/jKqak6Ru0Kvj/hbUWjk5gn0379Y2ihPn96fH4hCkaATJ2yH9Os2NuxascEQ==
X-Received: by 2002:a17:903:1a26:b0:24d:4a96:7b30 with SMTP id d9443c01a7336-25170e41046mr103171265ad.35.1757325740700;
        Mon, 08 Sep 2025 03:02:20 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:02:20 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:45 +0800
Subject: [PATCH RESEND v8 21/21] arm64: dts: apple: t8015: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-21-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
 h=from:subject:message-id; bh=NgiaadnBWzmQWHLVGXTkghr12q4e2Z2pGwu46CpKaLI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlFI+V4GoFFzmg6iekYjO3wUQsQ2NoToVu02
 /eVS2sSy3OJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRQAKCRABygi3psUI
 JAaID/9rrnrkkgZNvzI0FIXkGSX4gBtvI+S+ZUhZpHoHLNx5mYa6SzSgxgGtFVh/RB3Ws6QCf2v
 QGDci6rsLtSmWAjeQ+uCoaMJcuSXbGTSiTxM2apn/N3Qa4oRhy96wHLRUCOq+zCdg9ST0POvKGD
 MU2QrOVTS/xAzulU2W6Veml9cV05aLbPnSgAdmlom+gXmZqWsicFUuun1bQzeP4YNj3tYfN85gL
 Kofv7w0kuwRAr6gePgu0je9RzyJZGzY8PhjJho1XYqKM2sboHNKtJOwjHQaOu9zKp1YysVomMA7
 a7x3EwE1STEqEZK3KFwIHFQvYNzVPSSbZJX2thGtvHTmjmdfgEJN3RoO+6YFRclhBoR3YY5l+Ez
 10S/GLNWdQ7MVEbO4C8mBHFrrc370ZfIoqyP3UgvZZFP5itHr/ByW8ENdblvZRvHL1WeCQKZGQE
 3UdpaW3pj2RP417YZdpur7CQmv8YdTxdj0v6EXOxqE+e+IZMp3Jda2PHs2jWOpFfT2QCRfFeQ/7
 RajECtYAJvCdQpNmkemfRYw+APevsJeyXEQhKifsPYISo2NkHZXg/lBZB7UQDBY5v2KPjf54Jk5
 a6R8wk8dredST8Wb+UBF5e028+i6SkVwrsnKOjn/zcu/fu42nEfKXCQJ4bEBlHwf6eIcMY4iqzH
 DF9ti+Uugiot7DA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..9bf5157f0e504b7394ef5354411d3d37e8d5760a 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -284,6 +284,18 @@ aic: interrupt-controller@232100000 {
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
@@ -412,6 +424,18 @@ timer {
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
2.51.0

