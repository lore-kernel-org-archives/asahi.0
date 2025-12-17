Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2E6352FB1
	for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 16:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988745; cv=none; b=U+tItcrf0VbAR0JHAc7CvseQxj4IIKy01yxOAqtdEqivNwnP5bZ6yK/rhAfeDROQLuy7zIx+NDFm+PdHrp91VtA/ZxQie7CT4xkL3CpcUYpCOG/X3LkIdBqoGUTLD2z0ubGjkPmuJ/dSeOYsQJguLVp/gcWVtN/X/0faGy0oFVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988745; c=relaxed/simple;
	bh=2e/a3Ds8H9o2DJDRhuOCh9X1vWNSB/53Pgczil0A+/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PQkm5547GEXX53Vfq+nF2E8NigtEdo35k9ML/cfbTwCPSFvY8YFgFWY5ATDyxHZuZq3Kvkv5+NzVwi/VnYzoYEWedSDL5vxWJ9tpXnB0Z+zVUcwzPUFOvdUZB1c4tbUl6ZqvrtksfgGA/W4fSajiM2UDzz4vJ+WgU7oaH2uemQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wwu80YV6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wwu80YV6"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0bb2f093aso42555175ad.3
        for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 08:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988743; x=1766593543; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XtdvBMU0gKAhP5ZVoa0pl/xHY6lC0zNp+vmjfClAxY=;
        b=Wwu80YV6UpLerFSg5rL249eQzkjl5FR7u4THRIEOp3zGfJlv0GVCWDc5uUsOtZWBuf
         kUrJvl/koIo4u/gBE8CT2qQB4EtBGOrmNDW+fjFbl2rUCAmVk0TTbRdLH0KRfUbwaNkH
         g9AxFYiH4CfsRy/+2rDdW1uAZ2eBfaUzxMPxlr3hh7FhLmp4cVlvWYNroB7RpnMx2tUH
         My1HhQs77g4tGdNz+jjxiJO4I4PJoXKtQkjzfN0Vs3QSzYmvQ/yFOoTlqekjScUOwF9I
         dXb/HPjlvQidHHnZPbwFOi2gThxa+xULb61tQDPAQkAM7imWNU9NAz1fu+slEC4yoP5N
         B7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988743; x=1766593543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9XtdvBMU0gKAhP5ZVoa0pl/xHY6lC0zNp+vmjfClAxY=;
        b=j3OVdaxwQ0teFfTabnYXeGxp+ZlijXSpef1PYctc/wPiLecFuda1uo8NB+2VCaWWwp
         KcDtXY6EVEa3a0Iz3abvv4E55mULnJudVpV+7gbbyRJ2kltudXoA7eUgLajCCRZje2Bm
         WN3isMsvjFUhDMIJcBoMHllANe2oXo6s/mJWTpOSSQ3I0Be9YmbqpwqMFHUvZesdRNM0
         MwNaE4GFwb9o8Zcukt50WhukZiVjK1eq8l+NQET7Nlw6BO2tSYeIf/hc3xPoK+gELx7H
         LOM2gPBcV9YeNFlynrZCA76Rjrrs+FXTwUnHFiA0l2EAwdRuGfwsq0jHHqmujkmbqIc3
         jmyw==
X-Forwarded-Encrypted: i=1; AJvYcCUb5qesO4z4etz72Rb3KRqtlaVYGV6DnSnf0D9qOSLCrqz0Su1dKGu//inNbuR+WioEbTiuCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCLStvRDBCZD5m4JSpga+zfupvL3aEhCW2uNL8zM5NTXNE+jPb
	3lbE+AJY8xhB+FPa8Wc4wUt2nY5KfnXa+aCulB6PGdVS23BcRIzSE9tFwke9/caJ
X-Gm-Gg: AY/fxX4tXl0NgjNBRtIDfL4AdtpuBgZ91pZUOzZSCehNgp5J5Npu1GGmcWqyhpIDORJ
	l1PMzkBMr8PUuzkeXNfw4rBXOhB8tBOEylqtMyIdvStgwgrJheTExVjNdtYcbskyLNyU4to4KbP
	zfdTt1b80272wytVNo+Xkb8X6+fMt08YIET7Uq9xgbuBCpI6v4EtTzKxxTszIBdzDE/lNWkdcYM
	raLhNi1l2akSwrb4OWRn7qdI3wdiXCprJre/YDec/nC447avgoQxI2YLJkgcIdsfK6m9lYzu4SC
	Mu+aRQtzCGqEX91YLhDY9w3E8/E0/NjHYTzmOF+/vbM5W66n2FXuExN+GWeoBgXw9bTyNAjZiaN
	J/BUWd/KSktoORx4lSLnhHt3Cds17rmtvcBxznbP7WN+fY/hjGshSqh5p/o3Xj/B39kJ8Q/6Y3j
	oUE12xLI1DXho/
X-Google-Smtp-Source: AGHT+IGO53/Yde+EULUy0CNKhxCD9bgpjG2XsOvrAfTxxOPHWVYlfkkjFQH0s9aKhDolD5l/kE5sWQ==
X-Received: by 2002:a17:902:f705:b0:2a0:906b:ac43 with SMTP id d9443c01a7336-2a0906bb2cbmr170716235ad.47.1765988742938;
        Wed, 17 Dec 2025 08:25:42 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:42 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:33 +0800
Subject: [PATCH v9 20/21] arm64: dts: apple: t8012: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-20-4deadbe65d03@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=2e/a3Ds8H9o2DJDRhuOCh9X1vWNSB/53Pgczil0A+/g=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlDCKyhlXQXgNMXNa02YnhpfcEZU+abnr76R
 Lfq5Gk/hKOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQwAKCRABygi3psUI
 JGdMEACWPGZUb8/3oKcm69SV5cFomSKZhj8IC0dUHaIPLUMSKrAiD2MohXMCY0rIBNmWfOGjtLA
 SbU1OdD0sj0VyfUFiwY512qW9/79M0x16Xop/VlCjK8mfhOGw2EaM3uW8G+8x2aJYE12WDClY7g
 kBYhIm82Yb4hZL6DFXXjvpWgWz7Ngmj9KJsprwXwl3JDnTQGLM5g5N7VY74KOBGNmmss2MZIEyP
 5I5ClG/JV/Uol3mOyMq4pSH1nubehREwDcnXwLP0qI7CjaZYvC1GTPCBxhfMLzCVpEyI+VyGdz5
 ljxDMtvnHQ4eJcSK3VPNO+3CVYrQtvgIM/bcVSoVc/gxUCeYLTopBkdK/Bzpfr+x/Aw23sV3vr0
 ByNgTOshc3xOtiaaA4PvMbdDA0fUIYKUeyfvKrcnlOBiacHLEBDUYdX87oG3vPvkDK4HSPvW2eO
 q1EZC2/08JEFb/jnkYbcIMIoXI+pISyfsKGcMNUh9Fv7iK4NS5mZHp2YI6qm+SjrsR+nRj8U/lU
 bQKHsbW03QjvEQNfrfTCEd4Iib0TNTnxyQ19J/sGWcheJ4Iiqdstw4uNz7YAKIrZnIgvMUa2sao
 2+km29FDFP+Y71uXLEskWQim5f8Kq3PP3u5ZW8zEWudpMCQOexstUtROXpSBVOm3KmTbo20gXCq
 8gztCEyvl+Q8Bog==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index e7923814169bd4060706945561910ed1d5c2e0c8..579560de1aef8c311cbf66c60a2111e2d5ac37c5 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -297,6 +297,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8012-pmgr.dtsi"

-- 
2.52.0

