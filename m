Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F4E3DE451
	for <asahi@lists.linux.dev>; Tue, 14 Jul 2026 06:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010538; cv=none; b=Myq5akWTHj7er6M+SK6if5WCMB438T1py+1K/wqQLejVjbJhCmMe+982A1tCemtRIGT0XTXdSCxlb89khKwWxfLmwuYARvBnvhO65RRr1b43ZlcKhAz0cez04RglJ7VpP4T7J4y7km+U/rYVB5ffAaje3trfk6BDEtMtzi5rkMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010538; c=relaxed/simple;
	bh=HLHEl0SO/lEahgCGK95iQtDGGar7Zg/9GoIChI66pAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S7hEXKkNfaW5Uo455M386MZRThuSQLTU31PqVNUIS4EOZJcKOaXsHvjfuccUxyWmsBoSVrwOYhJdfMGBYWyNT1oli3yys4YarCHrvKiNEDd+vejkf5O3jC8KC5BUwF0tqat8jB5baC+AaPlWO02VUsHdKQNLBGxftaXQ651f2p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/Y+DoAs; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/Y+DoAs"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cca0c5799eso7146795ad.0
        for <asahi@lists.linux.dev>; Mon, 13 Jul 2026 23:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010536; x=1784615336; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsJLZhqOR3UbjWEM7x+FIdlo40Tmj4551WlKIRMpMPg=;
        b=D/Y+DoAsav2B8ze50qqkETKEYVY1ZGf4gYks/Lm1M+fwn5yKXYJf5mD1PZsVY/l8++
         odxFX92eVKK2ZtXROTRAVN+oHXmz2kywVPI/tYG5yupOaAM72eB+HV8s9bSeIPAIcG8x
         UHz6t5f0ffgTiGoBehDGDhj/3Mw6jAph0INpvYtDsIQPbt4JVyen99PP/y52koJ47ruU
         k9LMOhXv/vRP080hder6Y3h97I826aPhMjEV+hrApU/lXJVKsEmRX4D7PpXOtmQyvAFJ
         T/JlUwfR5ste2OE0R58Ql+c1g/dGNdpN1cXC4SBBOo1TDkiG/HkoX/CmWkLtk5YrbyUv
         PP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010536; x=1784615336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsJLZhqOR3UbjWEM7x+FIdlo40Tmj4551WlKIRMpMPg=;
        b=I5VfmB/ArWVjGBwjHfjjRAU8dqyAmuJ9WFMUBvg9r0XqUrgGk1MW+kSskDTwOlt72H
         IUR0i8RmQhCTT7J/tM6VlcUYfq6DDk9vnNLFOV6XWXigtBXkT87imTODner96945XdEW
         qUwzmyvWQHRdyNVHlbzPbnbV/YtMUhhtD+a6KCnLzX4VDrx9+mUChd+BZOHtPFsCsX7T
         93TuqhCzDdG1BeMvz1kh1TVVhP0RPrf0BC5jx6ttwOmsRG5oHj3pEVTn9LxRqvJWcInL
         PnwZjsvToIIOyJFB/X0mthxQm2P2vTN6fRfaMEgFEJtoG+3PESGpvJhD8xFjic++BnDT
         FdJQ==
X-Gm-Message-State: AOJu0YzZEjaJMzk0k1PubBa+eSAn2pc/W1Z0jP20xTCjzPv72zL/T29P
	XGRCZFA1TeHvo5iaG6HCN852p7u8n958GSA0YYigLgf5+d7gKGx9XwzB
X-Gm-Gg: AfdE7cm34CPDrF9yZ7A6EWx4wz/tzEWDx7cLkmmJiqBKtvkedLo6/0/0+/3L2+FiVqF
	YoSgC+96ZTOxufmkDVoTalrzUjv8jpXOqx/Xp/pdqSwrYvh1l8vI9UCdsDybxVPu47b3OPQKKTy
	liKx28YFu75gw7RF/iTFK63jF8RE9H550CO4RStYApoBnuc392PvrSSj1+7triY868Zx1U3rZXC
	HpFoazs4K0rRncQJli46XaCBvI7vZvh85xxBJsZnKEneOkHIkgOZny9wO23/iAFGxZX7pB2UCVD
	LK6BvualiAoDmzeS38cbC0vv8zu9zpsvs0kx8GzTA6TbG/gLGcehAt1uo+qJor6SvUZC+5ADfVV
	AqY8pXjioyKDExl36hMNq1/RUZ3eici6PWsj/prveu9FzXBX4GqhdeY6GYiwitigKMtjoxT62Yb
	PCVlVAlxScoSxznBiCUMGkMTET/5D8gJq9mAEcjdItb9lPX8p/T+FdcphZhXVi9bQiqsXgw+QOV
	aIbRpoU5IRLIo8pgrVyXwCVlG/pan6Az2nI4hLVn66JKuhKWENk5Oc/nQshiz8V
X-Received: by 2002:a17:903:b4f:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2ce9eae29c0mr123749945ad.9.1784010536065;
        Mon, 13 Jul 2026 23:28:56 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:55 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:15 +1000
Subject: [PATCH v2 08/12] arm64: dts: apple: t600x: Add common SMC hwmon
 sensors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-8-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=HLHEl0SO/lEahgCGK95iQtDGGar7Zg/9GoIChI66pAs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xlFnAxDa7pW5PYsjBK9Y2uTcDjovdya+zbN+YdXn
 Jbz/36yYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNU38xn+e674tCBa0vCiu9z24NabgidN4qQdXebeK3Dcqcm76vHPYIbfLCw/Orv
 eiW/nTDKRPZz8Nevu9TprtdDLvDzCr6ccVnFmBAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6002.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index 6dcb71a1d65a..4fb934d7e71f 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -67,3 +67,5 @@ p-core-pmu-affinity {
 &gpu {
 	compatible = "apple,agx-g13c", "apple,agx-g13s";
 };
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
index a532e5401c4e..0f81fc612a2a 100644
--- a/arch/arm64/boot/dts/apple/t6002.dtsi
+++ b/arch/arm64/boot/dts/apple/t6002.dtsi
@@ -305,3 +305,5 @@ &ps_gfx {
 &gpu {
 	compatible = "apple,agx-g13d", "apple,agx-g13s";
 };
+
+#include "hwmon-common.dtsi"

-- 
2.55.0

