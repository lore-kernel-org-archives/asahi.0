Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D6D2FFFBC
	for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 15:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454328; cv=none; b=cSFIAxvtoC83d6s4DJCPvOrM5qNsx88GEBFBnpD2CTEu3CuOY79Z4AqQGzm1WIIUO3XJ0oG6OcDJX0QaGaZXz9rxvrwID+Tjdu+XtvrV1UN9YXOM3XvYylxXAysILJ7nBXxc3P+8WmQtGUVKmN1ukuE3ONiooFO7JZZDl1tkWI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454328; c=relaxed/simple;
	bh=K4a8tKqeVL9BaqFzY33bqex26zqvwpxkE6HkJdl3Qlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JgGQOMra9N3e5Ig5rD6byXJrQwb7oR5deBiXYBPp8ukX1wdjRxei6ujb7WqII/Sk74NNVU33z3dVCfMUmdTCvHyUL2FosBi4lwt2q6VS9l7UgHfD8e0iSp1SD3bggVJkQ0xJ31XDtOU+gY1Ez1C002oeiEb+WTQ59jXDgUEDzq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vd+InIX9; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vd+InIX9"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7930132f59aso7317594b3a.0
        for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 08:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454326; x=1761059126; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7llkAP8rKH/Oo92VHhR1v/h5PxCOy9CRKJV3/2nzc+0=;
        b=Vd+InIX9EB/aW4OXQjBfao81J+jAj15bQUMzZH0YGlsPd7StTdo0EtZcbvGbGW+GAi
         vGzOWLnYlcJQFYrxLxI7nXvic+jmz3qFha+b0LeWrOPHmZuBm5ax+Q+QTkfurWqVyLY9
         pPeugSq5aFleB+8S4z7PYlVur8+cJBMY76wXFgH8w0QO/5vxQkiBwBQGHEumEdpCKX2v
         NkU/8WIw08X1NISA443c7q61BYV6z+MMcsKzI9dyGJG9QmD3IVZKkK/DeSR8ktQO114U
         1yb8khw42zz/zyaOmzM45sYGSPse/cWWaXPj6JneEJW8fZodVNzEFGvTGmi15I5dNZbx
         v2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454326; x=1761059126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7llkAP8rKH/Oo92VHhR1v/h5PxCOy9CRKJV3/2nzc+0=;
        b=RC5sacI3rjG1vxRFGZ1W6odLgANbx3vQ+5xcuN1VwiC+NkUOWjCNu8ZF2yqIHwWmdO
         17a5+2zOUwjyY1/WaAGBOAaZ5pf+3vg+KDPlC5uZF4HWr9BltW6oPaB4eY5f25MtJIuo
         V5AU6o/Xw9yKno/iHUrHdX2L7jv2ycWDJtHXmoMI4GeT+ggDdRZpDFPEyyT96Unk62PP
         bua2+5KNx9ME2Q4OpYbnt674R2eKKs714Oo+wbP+urNmFTLIeAMfjeg/BYs+zLLTApyw
         Fpo5dHnGauvm7tAz8bf2ojf7O86KJNrGsFCAraqF83N85/Hb18gBCVFfGw5qK7YKvtis
         XJEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp3IsvDArGRAZt6lbGICv2Y9nZsuSpa30oahvZKnkvDXhxVolqBgw410XiuOMzhd9Gb4cC1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKV2sppG9WwRo7HuANhA/e2b8C3zVIqlOL4yFEKHewTl4CIye+
	A40HvzeLBKw8DmTz7ZhliZQvmSeG7y6R+ApQ/W+xLpJEOavh+n5NUJbv
X-Gm-Gg: ASbGncuwO7IEpK/5L5sIKN6XTsy7Hb7aJjJ5EAMumYa8y7BJ7D0wtO8mvsbe+nYmQhl
	e1VqqAaCuVWFNjaaC9TWOlM3MbYSd0yRcyoBnD/qUDHwdGdO6fkdstJUoqKYpWlfN1HAi8Sdmqs
	i8JCNRUpg++zDBGpjO2wYqJP7kRCqfMRrNlKuWRgQ81CTOtU0PhRwYvS+rgAN8Y3DroamdRy52B
	0N9n7FGTaYi/v4un8PsAAra5YMGOUXB2qPRLMZQXa88VrVAIPzeRoQ0A0UWWUX/1vWhl2GnZaC6
	V3lwHDSJWFJt0yIZHbVJc4yrdmyd30pGivRfK4xeCvBYpKgDHm8ne16X4rtUILR2WLFfgADii5h
	HbFmlQv60I91/9WEOolzWyMZR8GTLp+ZpjeTgslgkp44=
X-Google-Smtp-Source: AGHT+IE3NxAaEns2gk2qdEx9c+kwoggzTSTvFkrcp8epRBoP1K1fTKpenPt9+hbz3q8VSwNcOXWsnw==
X-Received: by 2002:a05:6a21:6da1:b0:2fb:4ac6:6662 with SMTP id adf61e73a8af0-32da8139364mr35196981637.13.1760454326327;
        Tue, 14 Oct 2025 08:05:26 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:25 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:52 +0800
Subject: [PATCH RESEND v8 19/21] arm64: dts: apple: t8011: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-19-3f94d4a2a285@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=K4a8tKqeVL9BaqFzY33bqex26zqvwpxkE6HkJdl3Qlk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZv94ncF/y/perEeYBY8+y70nwkVMNq1VRMG
 6Ac1teUQH6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbwAKCRABygi3psUI
 JNd1EACsHjSDCSxZDW6ph7m64UGBZOj0NCWE4q8pP2G2+ojKWdMmmM2B+m+uPXfdxyQBGim6jbX
 ef/OEysjJkFl1lD7pueuCDnH/yOyiOAJtf/Ew5BJVSqRc0pJZKj9HW1vAcjuBO7s/aokKO2NdbD
 d4PFX5dhOZS6dY6dZddHT32Q/r2Uwa//W5LyquKm14YpY2pS/7IEg7wYeyuHCjrVPTQflRtBL6E
 2ZobaDsC2cMVo9qt/PTqF/EzIV0p5A8i4DLHNdckv+R2mivu7oUEXlJPeAygORYT5jYE2jc4sns
 5TS4B2SjwWkf0qppUxUXj7X15U8BXGdkC5M85omLBRiXmFCf2vuvLBuWQ4LhS4CKpi3tXo4HQ3p
 VJyhn/yxyHfr9ZSbO2a3GAvmPf3AIAEInCD3wSdk1ovr9s/g+gGuc5g6ElVy+Gtzm+gR8pWvl9i
 A4bEcW2QSi3HRMk31eW7VKeCYW7p8FwRpb4YrQCo0u8Spfl1gzXrcC2oh7Ar7L0shlvfydUb/XV
 sWSMDoN5aeGNmjzkfeM/zmfDchwwRt+w3Wy9TYdY/PNvY+x2qkul2dVhGhw9kla/78WbO4R88Nh
 vaDg3NFpU7aOxG+r47otn04n+jaa3zgkV40PVqL6zg/mfJZzQ0VJMXs5lD4tG5HvZs7uLmAnvf0
 SkiHDA6Dxhfn4Dg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodse for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 974f78cc77cfe28d3c26a52a292b643172d8f5bd..ac203ac4d6eca75655cd590deba5c361accf2375 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -253,6 +253,15 @@ timer {
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
2.51.0

