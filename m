Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C824284B27
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 01:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037588; cv=none; b=Ap2wiC3L1jfKWwE7UIGpzv/oBIGUtH+R2xiJZF5kqwo7Vi/o/Y1kYTLFtKK+lkiHoZ/aPLA/H6MYm4ie5GsH+/KewHGGpZIxgDVFJS0s+Wi7Qhyh5KlhLtPg1NKutoK4SRGr5b8Nyy1QLaK4WNMMEQS+NEoy0hUFXciDAMm9+AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037588; c=relaxed/simple;
	bh=duxT7MNXJw4vPLeIH5239k3CmgZWAQGQK2kW07pl76w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VpM81Io3DXd3VpC/CBGgi6b/fWu3Vn8bezhlsP/KhmgoSQPCK30GVPPgllrtO4XvO/rmN+CXp7CzrT2hOTY3Daxwy9xN9kBl9fSo+oVjqOpZapLwhbMDWO1Mp3r1iluVj1tMqT2F2x7J8FxFfJlW9XoOMSWvIJ90RlLUrZS+UY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJTDq6uo; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJTDq6uo"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23636167afeso37156805ad.3
        for <asahi@lists.linux.dev>; Sun, 15 Jun 2025 18:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037587; x=1750642387; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=VJTDq6uopXcj4C9MXSJHgeM9K7nluz8rs7frTkk3b7adFqPwLhO3ixSpclXMCctX46
         S39jMTqljvrZoMkFDesAr5Q6CcBVlQNLB04+T1dYZvHw83MkGs5ldlVL41NKEiH1ikPU
         X9kDDiO9YcWHFzHrMSOS9xCzmNNQt4HQ31+FZLJJIG2g7P9NZbUYoQCC4Hxo0jb9//GA
         cvoDqZZQgdcUJCK+KkZk3+Sn4xLun7rhdnHyj7SZCKqNo/aeYx8dKFJq+XepxPKV5RXN
         /sOAZKH1YksR93ujkYRx7rtebVkvv4XDM+UiLeo36FSNRJGkgrHlD2hREiKcTF/lgrRw
         S/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037587; x=1750642387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=IkZ0ayfHWxLXUqCoBI+IsPo+gm4MUp/1v+32K1o3NkbvIYQqvMtSBsm6pycivt9grZ
         HB2eAjNKx0Ta5g4VvVZWCJE6tZMqVo0khQcY+Yhgjo1xr0dIB/3S/WYTpZpycWu5a3Ox
         nn/VxLrUfYNHRno4txw0iBz7oVxEbQi82bpkdrWONf6Aufh2o8oQCGthaQEc6KBtEoCP
         pGtyouCuBeeKP0FHQtomSSk56MCWFy1vw11CEdTvzXdirQ8wtueH9CLHMthePbZDLqNm
         /ViT0BQxh/+1lSjX1iKpjWkmVRg1dIiyb02JQ36SLSmmGEoHuNIzDiZL1Ed51F3ov/RF
         5KNA==
X-Forwarded-Encrypted: i=1; AJvYcCUEVdIKLDYk8gKqgoIvz2/Gk4y1Aip78WxwSkWa5DBLR4e7ad4tGjp2rDHKAKgeo4nRQ2teJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBpvX/YhRVjECgS/kuMWZ8qbSl4lPodnJ3hnPtNvas71rhRUSy
	4wdUH9jH0EOXdnYL4mNRada22AP8p68XcZRHLr319BcWg7TVYabAXTCT
X-Gm-Gg: ASbGncsGCoLCI3eIW4f1aQ0/05/+IHImUjkV/ElyZ3Tmjq2AsaV9Y+1vhky4jjzgI4k
	2+jIp67QyUY8UpIPqO7HZ/pLiBUMPQlSg2tmEabAUqZbvxioW8D5TOmuh0Db5o1pS8RHEPsz1IT
	l0DEiq/bbSRmVzu+2cq2BaMLW5XI1Sf99GJKwlO/WC+XRbrpiftjWKAZ1NeMCICsgC6ypJLlzrw
	JRdsHQTJeLUC0MWjFbATkQ5LMplmPQ4/PKbEkx4f/rGpOoZIQxzXNt/FXqq4RUc3qo3r1UWk7Zc
	PANvQKtJdijHzIc7dJxATbBI4LyR6VYvoeHpBokz8n1GNTypyVG1sHtri8PJw1CYcmUGvoyrdod
	CN5A=
X-Google-Smtp-Source: AGHT+IFpbr54K3SfdE93vU1A9Oail3ZLAXjkWYwnHo6reahgj/sU43SY534nUHgzqBMAkVdbvSdeYg==
X-Received: by 2002:a17:902:c404:b0:234:a139:1215 with SMTP id d9443c01a7336-2366b3c2d99mr114617475ad.35.1750037586747;
        Sun, 15 Jun 2025 18:33:06 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:33:06 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:05 +0800
Subject: [PATCH RESEND v7 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-16-df2778a44d5c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=duxT7MNXJw4vPLeIH5239k3CmgZWAQGQK2kW07pl76w=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QZtAIOFydNI0UsOg3Wz7XY2kVVbbfBFx8gW
 DWWfdoyWRSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GQAKCRABygi3psUI
 JIjFD/40KiOG42X4vGHbzrl1x6NHjCpJkBsofgm/VOP+pjivJpEKor59cT9VmSmAAOEfNvdHYV8
 WzGZd+Kbavq21FyX5zYGsiojNaSpnNempliFZb44Z0+jc3Hta6h4bFs+YEb6aF2hDUv5wx4tY25
 jOVp7WRjT+PNExOpKda1cfbw1ehdKXCtz/TD4gIIjDlR8dkGp7cOuwm0A1rNhTwNNKclttSU4Z6
 dvn2o7Vwg6v+GYgLsvtl6RojajsSAgF0D7reCZtCwJWpeciZB20XADA7NUywlgRXV+NXGgRqCMp
 CaKm7m+CJT7wAd68jxuwRpjVrzNmNt6UAX/3mpvs5moscr8ZOs8PpaOGfQ1aWBFGpjG3uTCI39I
 m2O9zrH7SDb4OhbPLMa21Bitr6hH1CgN4ibcchAwv3Erp8QDT32CbowiWMm3uAXolH8EhWt+UdB
 DNvwCgVlyZKX3qC6lcJZT7EUcWpR8qL/qJU5EYyXy2Uc83TPx/7eKIC5yEZbZbXHuI1nRgcIexI
 ymKcMR/3UFRSVxhGz4OH/bBpt3txEKV5KCPRo/Qhe5y40xpxm4ADYhf0MauI2pUDt3w02545205
 eGYsvKU4315MXpZNqdm2lMoPk5bE7W7+NA1A3ZyTGbItjZXzFcOSPrI9zfrGFECEKAPsSVfnIfX
 37XFEWHlYvooq8A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index c0e9ae45627c8150bc0ddcdc1e6ab65d52fa7219..56ac6e7f3803a16beacc74764262b02c75a96fce 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -167,6 +167,14 @@ timer {
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
2.49.0

