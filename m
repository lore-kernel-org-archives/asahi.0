Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAC8279356
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 03:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898274; cv=none; b=C2AY3r0zI7nka+KJ9ohovuTVtn6/T4tFxQzOhdqLR+vvEycvcZL2qcrLjCgZS0qdtONw4CEWjcuS7HSUTqZIKDxY30K+lLljZKObIAWnVAeeTJ/bFzTOWGtjmqSkTcywyWUahg4vOHg0Y64YWZgzWHZQ9Uh67d07NanTEe8MYpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898274; c=relaxed/simple;
	bh=duxT7MNXJw4vPLeIH5239k3CmgZWAQGQK2kW07pl76w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CRHg381HfQEtCG7OHfRnfcSAlOJ7GThDCYCy2qbSb1fkE4WhA0IeXz/bjiPhwTE+IUUz+NdeTwNr6sPPWVCpeqISl8lXbvEp7/bS2oOXMwldSb5GnFf867o2m5Fc+IUcFRCRMnm3OE15d9Qf32te6SxWE2lp4BKvKEia6O5QYZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmpGA/0s; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmpGA/0s"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224171d6826so82700365ad.3
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 20:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898272; x=1746503072; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=SmpGA/0s8TnkLOvkE39jvGLVjlCfoKpNYCJHSgsIFM/xs9VlFVYkv8fAfmbt5u5Epl
         urvMvSfqQXn6F+MmqrN9BGGhMZQFUWJSMAY1Z7/4mIuP4PbYam0RBA0xKPBkIS5LjDFH
         5atVuJUXlHghZbxLBLH4G5LatK/P1nv8WbsiXzGts8ZMIhTLD5+9elWJs9aOBkhKjcC1
         oRv48hHUHEBQhz3UihDmHoJuz6zdoFWGxkhXEuj+KipZak9MNRKIguZbWM7wUcaaNzw2
         Vjj7OsZxiHgKP0roWyeRibcQ9i5RaCjJWfK+3xvr/LsT8QXdqtbVLvlUzoUIL7Mdm7I+
         340w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898272; x=1746503072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=ncyUUlwLAPB0CNkX5YZP1DKwx+swV5ACOQ2H8IuwiH6E2EkrBqzzMgVZ5sUkltYPQA
         +QGSt2CBqshesiEEbA3xjQz5YYXljv4K+b9r3tcVWhOTERexLxDqpfvjInIgKEuzb0nR
         ecwK3MgOVapYrUNJN18Aj17W/Bm1M3Lw5lIIkftaStML4Ejy7DQGxPwTntk1Odzhhova
         dMsPpt1M0hTeKmhcObI/vbCjh65FrRhxSLQaI+VUiWxsP3TS0Q9nLsqeQnyA0IRpnXGA
         QSmKSQuBbecqi4DJFJd/dhD0GAUbriJXU4tV/JrogVdmDHq+6EbzJ6O2YPr5yCBINxUq
         EGZw==
X-Forwarded-Encrypted: i=1; AJvYcCUnleLJoWsPB0pgZ//fg3jDGka+RQs3+Wb5EMkf1Tayj01ZVa54Rm6Qi8yjHPysNNE9PGHF4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQToirsuy08ly91lUAQnH91uZyid1fRQiKSavP26rinl8JW+/0
	1JG/uD+Ft+p1Wd9UTvspQ1h7N5N/ZIRBP5+AYVFDyY1mSvfoKDlE
X-Gm-Gg: ASbGncsAFoLE/VYQph9g5syslm/eE2yHKyLx89wRVvftto4BkRr63unTsvYaZcsZZ54
	xpAIv0gwV+QnS3pf0cQEQ03gWO8mwZvwwLkmz+b2Wa/F2US1olxh5ONtJ2vzgoVUJTK9EerooXu
	MiNSCF7kZiaxlrtLLODWJZFPefZi9vW2G+L7NSHUaxSoWaiyNaCXrit+ifbvV6pSimOginx7wd4
	z7vDGXlljt2p4Gv+v83l4Ce4e9rSNtyf5wifmpxs32NCuLFh9gceLeEd5irTUVV9pXsou9n9B0C
	dRqGtwLuagFy584tRoLCAUKjGyv90PkuhzQhakA0jEKwkogBDtzJLzZwbg==
X-Google-Smtp-Source: AGHT+IGccqGZ3Xia9Ch8eVE4eB5PhOyKHbvEUCPfUez9ylO+fo9l2C2+BFOaam1hQjLiZd/TEJp4xw==
X-Received: by 2002:a17:902:ec8e:b0:224:1001:677c with SMTP id d9443c01a7336-22dc69f8997mr153751925ad.9.1745898271905;
        Mon, 28 Apr 2025 20:44:31 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:31 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:40 +0800
Subject: [PATCH RESEND v6 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-16-ed21815f0c3f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=duxT7MNXJw4vPLeIH5239k3CmgZWAQGQK2kW07pl76w=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErl5A1ECOtTNng0tLnKXDnvyb07KxJIcMC+5
 SNjbIZmLoGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5QAKCRABygi3psUI
 JHMXD/wJ6027IA1eE+iO9JomMzvUWoHwbUr0+PEnx4lRmEjmaW1Cy/p3GmMkYOUOt3Gcwwu644A
 iNFNEx5jt1OcJmtvU2r6dYE1oLH6JNXzNhVYQ/SJ1KMOakb9dQVKLWxIr/Syd1CuC73eekq6BRp
 VpfU5lr5PHujOxFpXOWHzW8jFShJ47f8Kg9ciBdXAJpI9wSpPDYHkpJwLn8W3TxL91+PKm0x+8p
 vx2C9ZstLrvj6vVpCvxgyCmReBs8Ka6OPrdjSWGiUqb9PJUUWcBKImifiIHMeCqJ3tOIj86nIna
 z26bosC1lp3M1qNqPWMlalzRh3AmVmukfJc0q9DEo5jClErJtsgAgqDn8oEB66/bFGh3XZLf13W
 XaI45hBeIziEk0fxxNCJ1zbNekMrbaM/FLxZx3IxEg1W1MKq26Ff6CwQZ5DXxz3Bghj4x+eCeaZ
 RYTzDjq2Xg4jJ1bTDu1gy4dBfBENStVrKQ9vkA3S3QxhcE3hg07lIz6l7HYyLweU0586d6h9btO
 kRNHxM+bxtOB6uDX6fUEppO2faEgybt87tVfjbOVB1Ioou5Ai707ssBB9+VFQLWFDI1sXzT3GUh
 487zF6FZlcwJPioCb+vP/Ahj9r3VnIewLB0VEgRzvIBrUeDyJKQum4/tIiML9A46Fo2rUEiKzxu
 g1NClcHh8mdaObw==
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

