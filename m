Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ACE2FAC09
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 10:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325720; cv=none; b=ZGXL+lVo5yBgDphXFkLFpqoQIGvpzuutUUTGUh9TKA3POt3ElImi8FLMlfBWLGn7CMtEx4JUwDMyxzVtne0zQWlFOfit9ksgxMGcCB2cIsq3osJ6ooP4wEK32rZ7sGbr07w5oxrzJ5HtcqPHANj7Ap2GoUTK8OpfGSlJPzTgXiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325720; c=relaxed/simple;
	bh=KUmhbvVhE7a9qQQiOxTeh6fcRXxeiaIPFMb6Ibxmxag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/M+kxSHcyfu4g2lbrX17HZUD+HVqv2URtKE9ACa/v/CH0coNVynl0xgZ8u+vMljtc4aMC3tMeObzD4Wpzyl/uDx6+dG7F7FrpYwP03QMxCe1Olxco7IUkcnnVr0TWHclSgc7uyU7+kETNNBlpB6gkvorM+C0uBX5erCxoiKAns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gdz2RjRW; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gdz2RjRW"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2445806df50so35760145ad.1
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 03:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325718; x=1757930518; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKXUCmU9jFowxknRpXATBfrh5U5iaqmYG7UiFDMEOEw=;
        b=Gdz2RjRWpFqVtbiQxZR6p/5LTNDTTKtHg1bHdw2Mkt614QS41bnG2cvMYidk97vsEc
         jQhKohNf07vVdHNMR2NVXeH9A22UskIAIJSQJwAyrEprAlr1PmmBfHJweaWY5h65nziz
         hExAcc6avs2T/taIPDYz7egjniFOJYiMaGzgHTxe1auvxgBfRVBf5UbfYEXzP8vmn3og
         mh4D19keOd9I7V7fcsPW66gFih0xLoD1xPMhRUG4WHQBKWCyEYWERLIC41Q8Zd9ZzmXa
         HcfJYwp2sK3FL5mqs/QvAVHU4qiROEzmAF4dy+40DxoufOxFlU/ZWNsrAcKBQabN+DsL
         T6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325718; x=1757930518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKXUCmU9jFowxknRpXATBfrh5U5iaqmYG7UiFDMEOEw=;
        b=KjLzzxcb3Vo8q/oAumlthhzmYrnQbTEeKslAye3T67XNTvo9d1VuWwPjQLcEvXWyly
         Fqlz74pP+iK5Ec/V0UX3XZeREo724tz6c6YNKjp3anhLWCL9QzgyNFpAZRtGYFBHSDUX
         yF4AxMGrKQBtFfTXBoIta4qETniT+32Mj4OHrNJo9QOc0Bcksk9JV9bQbTusXrbrodvw
         XVFu1WNu3x430dJoG+EEcV9yrooUIdcn/7PIoTGZyc3pImtT9xShZK0ip/7Jqeuj45pm
         xOw55pKB2crHdMvqmCVdm3GFXV/FVMr+NMX8RUI1w8OGlhCvTdBHdGsKESyaGi1zqx5T
         /LTw==
X-Forwarded-Encrypted: i=1; AJvYcCUfRoiMmR+CV+X4RlAdNQeOyBVM9ZBZ9DhGQtcOrab+tS4RGqkqqS4sxaUfJohlIsZox2mQzA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLePknRA98ZZ0eAxIqxOTEJFtapDfx8z4hDFlqSELenRGKFu1H
	FoJxA19gvQVpniVlNVhARfypgKjXmFqQ/4wj5kxi8xMdbjk55PhBDafi
X-Gm-Gg: ASbGncthzmmC82jfq6DvV00PJUyuhR/s+VTwZC4ZCLzsvP5IiCwZ68zcU7Wgg/NQgIK
	PPx1/NxAgqpsDLFiNlJ8QsiBVMIsGO0+80pEavE/pDgMPIpyiopsX6Ypbk8+Z51+jwlZ2H+EyMF
	uEbEN349fUfWLVbUCY5RuRK+Bb+PALy+4o/jsRD/zij/9D4+vAdE15j5z6wbqrVvOYhw9Wg8F0Q
	QryIDE0WTb1LgyVMa3YMAG1A17snY38vHUUMYJnZIBrkiBmbULNE3mCWRfy8lwP/MORgDggRMne
	vJkUCd6UELgGxFFPGat4e0OziCg6x2rf+L9Dd00SFLpYvg+DY259aaoNpb33/HOaMaBx4XiUhS8
	CZOHPUa6dJK2sz70O6/j16qwAQ+yLUbDZ4OG6JQ==
X-Google-Smtp-Source: AGHT+IEm2+gAoGZa0cwwAA0rX20QtV+5UuqaUU6OUNEfKaf4rVPNAoZSA3dqhcwbE9x5WjVSv6TpXA==
X-Received: by 2002:a17:903:2a8e:b0:244:6a96:6912 with SMTP id d9443c01a7336-251701a644cmr93794865ad.20.1757325717942;
        Mon, 08 Sep 2025 03:01:57 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:01:57 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:40 +0800
Subject: [PATCH RESEND v8 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-16-d83b4544dc14@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=KUmhbvVhE7a9qQQiOxTeh6fcRXxeiaIPFMb6Ibxmxag=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlEC/KtUs5Hq0AV/39vKlCFghpi48YewdkJ6
 gXzM4aJxfGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRAAKCRABygi3psUI
 JMKaEACmwYGs3rD8OMLjnTxxlkBn7vmh9k5AUksNc30NWUwChqVZ7NxW1ETKBoRn2MDPZntSVZG
 j0Dz2kXqhCTBd/E+9WVvyXc/fiattQEENQs7w+p/Z8OaY7iaUtP/3BcK0FgrqndtaPHh1pEFYKL
 EWEd0EWPLLApygXTuouliEthc/QiDUCSZ/xzT8w5lYWTaO0snntMglcPEr2oYLBskg92OfkGT9U
 piHI2YiFc1FIbbkb20ajSus589Dce4xbTeujD8COJ9RNOUo0tqJ9GW8HY/IjjvFQWGillETAnAn
 Ctdovt8ZeVV9Gh+ofL/XZm4rkN9e11zNHqtZdmk8o7kiAmQXoNRVFlsLmg9OPhfJyOKjnH05r0D
 nvQVMeN7oxBVCgD+8moOWVzaHFWZKzTbbO4t91ILeWMAaBWim8mTLVkfjBziSP3toGH01PwARya
 3Fnq0lj+jZ3ARWTwJejMV9eQBJPMK9Tg0Wj63WiyOZyt7MuZD3J4DuNzc/Lu49pmn5HwdqIql11
 q7BYDQWDwh+yG+J0f/hwpblU40AzNT3kPezF10Oi4gUXadmzS853w7ic1Ht52JCSzDEaLSiOQ8D
 r1KrcLXmAgFbVMk301HYHnr7mJT4ua1cWxfCjQ5h8y68yru2FWF4y7TV2zazaXmqUhvDmBnNG01
 tY/GmJKgRZKwDTw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 09db4ed64054aefe5b8f8298553d87fe5514e81a..bdb66f7e0de43a6a751af37c9ceabba44ef907d6 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -180,6 +180,14 @@ timer {
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
2.51.0

