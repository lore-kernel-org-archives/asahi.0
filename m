Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CAD2E11A8
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920602; cv=none; b=ZkDsmenWWlbx+S2I0mn/NmKDMeUPe5jgoQpCNUHi2guwSkE+07WOkQmkFr43V1kHAlS5Dp0DgpryLTAY2yAuKZ0zgnCYYiv2ZcNvlSjeaIDbc42PRfkVB4i3sozU26KlDNu7qrdiUXQdr8PW/904ww39X1CygLGk699oDy6HWo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920602; c=relaxed/simple;
	bh=YgjiNgCKjs/DNwvy+UP2u58jMtjv8ObMOrXgHvX0nBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZYbaeokpdrLtrGH4sz48uepu7DUhsENGb4TRRbjTdknNJR2y+IRDfEi77DX4/YFNZmW0/b4DW0fg7W4NlPdIOQXg7ncgoSjDOAFXLuhMN5fedqGRupK1waLxCzjiIhlCuumxHP/OzaH5lAywbnypjtjre5riMTHJ6QMVSgmzB7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irJ4k7+t; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irJ4k7+t"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76be8e4b59aso3637943b3a.1
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920601; x=1755525401; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gawbbaq1cv3blqa0/+0uXm4lYK8e4F+yAa+5XRwJxFc=;
        b=irJ4k7+tE0DLavY4MReDZnShhfTZ6W6qO4k5G8cE3ciEH10Ih5xe+WFd4hY8Ox2XtZ
         6llR1G5qvjQXd3PPb81jC16NcwCkrEu8F1GekU1ORUwdJC9HrRoNhbNjLO5/2cTZRvh4
         57nKJ65yyE4Z5E8/NK9bmoF9aI1vsmAu2hZrLI4OFQZepCGedFQpKMJkVhzXfD3Q5gEX
         dMYmVNGrIhBhCVgc5f/CcUOG519TvSxw/fJPCy66IV7iAUlRbShBndoWqUYBPggfvON6
         dHpzB9QzjxD7gM0wLubhtEhIbekjQwxrY9pFzgua1Hjix8JXglUFX7Czm3l744vtKDRC
         25jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920601; x=1755525401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gawbbaq1cv3blqa0/+0uXm4lYK8e4F+yAa+5XRwJxFc=;
        b=gfzjt7OQ2gSLT5FUbPrtmqaH47I9j6CLtz1YSJGdOmWToW82jcJKz3ReW4mGvm+rzn
         D1ZlSdTuIASLx6YXKeQVGUInNlSgE66sjdJjot/WZCbnSbKYbty+pJr3d1JmnchxZc4R
         6ZE5PhV2gF97hJ+ZAlIWc0niCuHyR+Ni74FUdmvi2ZlVL2k1/3Trzk4IHNfL+DE9HQHA
         nOuAzd1aTUB56YSVufG5ONQZyNTLAvhvGNlYNLmkAW2E+6u3m9YW2707mJhHLt3Tczod
         yM5Yip+9QQ9ZQ6Ug6LZP0vx8C4bgPa4tMHZHBlzpesPeUIdvUYHTIi85Rn2p1toT+G6S
         R45g==
X-Forwarded-Encrypted: i=1; AJvYcCUsg33afNEmnEc9taOnWrF+XCqUxElUl2mHnhUJ83I3cyRpmuUn591aZW0JsJD5LO7i1Z7YLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnY6YzRF+ZN4b1GU5YM89LL6hwvKiL3y9JpwSruwfE1NTA78ye
	QluAfkaLsiZ3mVZJ+WPn9sXWLmeO3WsSd5347TXDgdYo/Yr3QB/5a4Fd
X-Gm-Gg: ASbGncsg7XOiRp26Ep1veYBv/K/kiA7VMLC7W27cuadOxsjLoeNnn449TywgvqmL9qN
	SbW8XxSyWHxFWy56DDuEc9rUQNvvefK3tx2p2PJHQVy5i8Lq7usbxH6wYWPqPNzGUbF4ByfIsbd
	s5q2nfvlr1agt8QOyiW262xeMfDoIPbrg6SAA6Us0Hfiea9+MLUbmzh1TXVPYL8i4w/vmGIZUEr
	MExE3EyYiI0Ej3CbGX2+4E64M271O7dlnp2QI3tOLLBNIzzM8tJTvHYo+i9ZJ9TAzo7IiTnI6aj
	bIOnRd9DF8+xW/zIylRxpojr6oxkx23R8yI3z4nwaNahiZASSbGiaW8kV3JE0gBJlarlHGIF/D1
	aK2NfrCi6vqlm6leM3jsOmWKicZJNUP0pU+KReIgofFPNftQfI+iZelXbww==
X-Google-Smtp-Source: AGHT+IH71WLPBpcxqK6NsHSxFwYjB3csw8AeRr5tJLBkY9NMtUFUY4SScFUChnqL7Q1DXY7ZMZtZXA==
X-Received: by 2002:a05:6a20:6a0c:b0:23d:e202:1abd with SMTP id adf61e73a8af0-240551c2f84mr20231912637.34.1754920600698;
        Mon, 11 Aug 2025 06:56:40 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:40 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:49 +0800
Subject: [PATCH v8 17/21] arm64: dts: apple: s8001: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-17-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=YgjiNgCKjs/DNwvy+UP2u58jMtjv8ObMOrXgHvX0nBo=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZDGjdP3nLNuLMmtNtY4KF8rbKUlqQRn7uah
 mWWRWk247KJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QwAKCRABygi3psUI
 JPvvEACaGJTqM3D81PYdorlbmquincQl3+rGkRN6249kEQQ/01LRXsYF+LdRGWlbDaIdCZUOW6j
 wgdVy7NERRJFznDF7WMuNSzXNpdm3ZmuE4yCOYiFXj8itnPZnNMdkOp+HMqag5vZmrkS2Uuc5Lg
 JDt5ITfLVaHXKUH0wsLAOCad0IL9z2TAElvw/eic/SXPHXScg0qVnIySzg+01Ae87scR/xNkty1
 C2HkZLMCIEtCcPE2xPgChQVvutiYeH2M6j7BHnKMQAHka+P98Sw0vZPsfb8uqupg1O+ssNc5Sbf
 /sR/zVsbpfBKmdaUKs2UlhUmgq9aXS7+t1Kv1P83DDVgC0Scgekdopb9KSf4ISJJMD/vAO4s2H3
 4n/A4Isdj/9SkBHvbLVURyPO+IpYQW8JGavxzUj4UKi0+oN2f9MFHhojN8YWfs80Zu6NZVjGRzv
 Cg+CROdzA62zhmiXDD1nAEaF15dJZRDFDbbcZt4JSMVx0ATTENqgIzwGBDWNpsGwS5EPQMCjBzg
 E8inRRuPSnWyYQECWJGSguoeVzFvQzhgwOvrNZ4ta1xxguac5s0vM0gJROqY5E8LsC4h4/iL2MP
 l0NjbWuirRTThHbxfeZ9xj4KuNQrkF6C//hQI0xFWkrjldsTAyDINANiyxleCZP62sJya23+s44
 MD24C9318a+OcrQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index fee3507658948a9b4db6a185665fdff9f5acc446..ee2702fc807b678023915f72b5276cc5a31e1222 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -222,6 +222,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s8001-pmgr.dtsi"

-- 
2.50.1

