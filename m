Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD6A27781A
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 03:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898267; cv=none; b=Tf+qpkbVMvsJOSsL+AQ44Axy+xgPsRKlqRrgLSktsiFaDrPYD4oegLQ0SpKdYratEZbINOA/Ljj9UKHF1Pvyi3wACVGDA/w6noco0Wi2hmxM7iG6VU1zGDE0V8XvimdHLOjyklmAFlaJx1c1ntOT1sCZCFki7PNeqJks3umJXBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898267; c=relaxed/simple;
	bh=gOE3a46CDNX3yVDAoVpyrWK4j8QsbYn+HXz/rfkRHIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jtvEsrl/4mQLWl4zvSB1aS+aZXPpjWkfC1d5dbNDmZdZYobYPROO19tmrrbB9BOt9oSXFG/+O2vU2KgxqhzfoFvmEUbkmmmoiLuuofwRGJfAkfhCJbAdMCPoMLZxJNXezDTmJM2VnYgAGWkR0hmwoaYBP7NT1SACLwSbG00pC5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6+WeHSP; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6+WeHSP"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af5085f7861so4089991a12.3
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 20:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898265; x=1746503065; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=I6+WeHSPMilzcWqw+/NUpPEPfA5BCx0mFl806xCSqQX5/+CSLUNn27axoux+XyQSvr
         ESPnqoDNY73hC5t5OqDSJreW1JO4l/oCkTQu8V0zntABlNqmGFzDBmxLyFHCTYYGpVNZ
         kgw29lF9uKFRifCbPyZmuG7yaCRHyNPADUFDSjGMqEO7g4YPuIh+y0SLvNTL4qnbcqcs
         a6Os8Ko5qIo71Sb1F6RGQOiFdDlChNPOQhdCltHIaA0gebp2jjqhOtLWbORGWbwpfZG1
         5FH9NpFppr18svSc4dFT4mtWxPQIb3MSyLhPiYv6hyMik56tNLYh1v2zElmJh8ZUbMig
         UaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898265; x=1746503065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=datXmMZPcx8JH99w0WDoI39HrA5xOnOKszTFG5IqZlDneMPpHJ8J9zZvsQyvPa+gT5
         /wMBXCT93mZD3uBV02ufPyKyRn9hcixdzdMcKmrHAlIpK46WwNZuIcA8IdxfCWx4Niw5
         T84A9kckVpyE9rB11bR8M88sPZLHjzZFq2gSEhIqr8xfp5iR1M9bZbiAgyewowHcUpCH
         xnCEvLzkY1zJHHALHnMl8gXJsqM29jbridHuY+uhkCbB+jLjFNQrpuWP465SIdKf5Yxm
         btTnERef2IBqPEnl4jvBFAyYbOIWP1er0EsMB4NnzFEJwLBdBAcy73OPVcg5ydZqAJF4
         Dx+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlQ/wBgaF/xsTA8AzxSugXfeBJO5WbBWPSoLUjCt0YdBmTn3X3yTQrS/X710jo02guArSEeg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+8uaNiicyDBzhBxYpCIrwk/SAhY5CopL6fiDMK9HpAsLFJHNd
	R7BXHXOa8HE3R3MNhmU5T1WtqptsF9Kz+nuU5pkW/Uc9kGuFziG5
X-Gm-Gg: ASbGncu90z4Xbr+8hUkBGPP5loLbmIgWMM+3S3+K0QDKig2GQhr1q7u0OrLFmFYRcTj
	vu0i5NNmn7XBGpPjm3VSanXR2yseqT0KbnO8gnOcoaKHQ96t4MwNWZwe949nn2EbeBn5ehuF2iy
	IkoGd4DfnPVC/Ttv/9ghdKjVsmVUACID3WE1lIogIyGWZGlHDNTJkNPtIirBMfonVS794+ICeax
	trCAj1ApO0kVAVBn6T5GN5xrBelMiv5dkN2MIfa8cZPoNnKSFTmard5YLp7t1Y72YtsJAOQPVNZ
	a4fBAB8KQ+znYzE1I/AdsjBq52uq1HFWGEJqyz/JyuXgWpy0a6jQRbbS6NZAvhcq6/gh
X-Google-Smtp-Source: AGHT+IFbQ5J8X9Uyjbt/tcsLIdvZTDaLR52CKOBn0GWmEL6qPYTK21ZRYjI9b02uRhJl5cb8jl39eg==
X-Received: by 2002:a17:90b:274d:b0:2ff:7ad4:77b1 with SMTP id 98e67ed59e1d1-30a012fd061mr15573483a91.2.1745898265248;
        Mon, 28 Apr 2025 20:44:25 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:24 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:38 +0800
Subject: [PATCH RESEND v6 14/21] arm64: dts: apple: t7000: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-14-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=gOE3a46CDNX3yVDAoVpyrWK4j8QsbYn+HXz/rfkRHIk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErliqShfLZtY6dCUCyfNgW7SwP+NXzdz/aBZ
 TZq7Ys0jLKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5QAKCRABygi3psUI
 JGhoD/0TNnuFZXjYLsyHlGSzH83pD51e/IIHTZF0h8zEZ6szGklAvPJ/SqCVelB9r/NiTpsxQz4
 Kntqe9FfHouFNxSbFtWnm6qQI+Ijp511HmdPDPPu0oKTtZKIh31XJ7iN0erIk/1O0XllijQBKJG
 ugs8UZsVqljduxJVWv7BtzEwD4oEeDJ1Emhy43mjZyngLY8LV4OkwbRUZxjSdz/iKi/yfA//Z0T
 rbrBnSIIdaUAaeVO2quUUc41ZRh+i5UMm/wUZj1CcRIprUskcPZ1cEgHgYRNEbUDUDD5VFdWJxW
 vyZcXWIW/Xibory1sDpxDgrjRzKHXLeawo1z7RnAsaEBfKZOsEwzwNt+0rQycpaniYlXJblC66U
 5XSyKhz/kuJ5PVTS2Bom37a+sLtd3x6LkjgP8dMdOT+ODWM73jWBFBFsmKUPOhMIOptOcVz4kpm
 sspCkZK+hAqTAtwuTIY9atL4H3785uGpjWxCWnd3/+GijKUf0acqdLCPe3ldJmbnCJhVvBMxZXc
 p4Cr7RmXgHTpj/AgVo72JM8NJnqyQEkPoJnSD+CwjIoiODUTDx7xsJLtFIenR0j56AZctExRHqL
 uk4dHGr4KLHVausx5xrQUdzyh7JcM3h0buPMA66jEmiO1iO359ZwnP+EGIjWHeWxeEnxpeG0uIm
 5gl71i8Q7tDCybA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 85a34dc7bc01088167d33d7b7e1cdb78161c46d8..f1415f50cb150ce1d33999c817243c3dc9184199 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -193,6 +193,14 @@ timer {
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
2.49.0

