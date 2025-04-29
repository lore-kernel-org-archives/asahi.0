Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350B029E07E
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 03:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898290; cv=none; b=c2f2Jiu12lb+ISCvP+0E+7EU1d6AAy9XTP8NulLQW4ngHNZrRzs/+V4KyV4bOlsmSMHvyMlGsqoLVCVlIeG2cCeJ48d06hWfqE/rz7YqukhBXTf0c9OEayJ5QFEGifW6AGwL1ElhRtbBPYBsoOV6phUFsrqbW249tea8fkVT6BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898290; c=relaxed/simple;
	bh=ZHoXysjC3tKjwBhupXya9t0tvevKJFeLclU2Q2P4acg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AC8Jw1nqG2/07/wGkeMk/2AhMOhpXydZbJkUde3rIOizZDY3N0Ia/BUZPHP7nMg7Rh4Y9l1I/b2cIHu+Vb/TJQXYOWDTZi7gdElP6+r16P16qQ3sbNTvnwy2bj3zfs1pGEfngSHRGpKzJz162nfghWp9Qj51xeIQ32E7R2R6LrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltL4cQYM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltL4cQYM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2295d78b45cso79039065ad.0
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 20:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898288; x=1746503088; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=;
        b=ltL4cQYM5+3saT6fLnnJ+XUFuh4ieGYhiPjwBn00ED0X69PI7ss15TQG/nSzK7VQTR
         FpzyWYqC3cANxNC9l4qrOoFAgveSYo6HC4vEdJH3GSjfgsWByjzlUYPhBjduDWeRpAaw
         lHw+1tt5fzoE9l3nFzoQnfBxeH0FyDgjF8Qo0M11Umk6T/Uf3g8WBZIUuLjY/BDzbrht
         KcrkpBJmPMDLyhFOEkvx7zT/NEdIlCyiswDQhxi1/ccRxCXGUN6ootIYzvrCbugWe6P4
         zgeJEqLSOLan0x+TOXJ1EILNF8xJ1yjzzPUYBMUwJYWn//erTHuTImn08pqRTYwTv9ih
         pvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898288; x=1746503088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=;
        b=AKo8470mmSb6a5LZ9zrQMzalL7XeFb7BGC8gqnVvuWl0VxV7ubZra57BjizqLj8jVu
         g4hm9b66PdKr97TuIf4pmV36QeKN+hvl+L8S/fXJ0MhSVSpysJd3m3wujyVX2jtna4vT
         vz2hH0hrqiR22u6yw+A6eZE94NkFm1bShuKIi0TuszJrSqM73LtCIRsuVMSVkDykzxmS
         3b6ZfCTECaxgBSYG6dC24xH3juyCcB2/MsHge89smCcUa5iPhuvj0cUPaxCk3LJ5zSvq
         0tWoGwsW+f8+guEOR21xThwxOUe0gQZv6kSmrKH4gytMHBOtANNQnCco7SQkaqVTFPy8
         6K4w==
X-Forwarded-Encrypted: i=1; AJvYcCUtiw8LT3531te2B9MC7GIXL3QqM5qclkvePv7ZKcfUkVxk6g10UK6SyDISxQdN17s4e9B0pA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy0wSJhU5ofODL1tmyYiYCQhfAuGR9ShCO+Ojf6qrWThHuBPe0
	ABJHp6DmYQBJQitO2KdQX4TE7S0EnfXDojpAKyFV+R+AJG0oBAvT
X-Gm-Gg: ASbGncsLfE+Nd0C7jX34NBrGnH7CWUapenrjTtzoXQ7vUh1cbYu1gJJUOb2ZTxdL0x9
	p3gs2daJ+dZHHU6IJ5RU1SE7ddT7c2yo0o8hTEWUcxyaDLkHATHZFRY5JRuF+ElPbWUeF/Ymt5y
	QbqwWhW/6pVsePc/DWwB7sMrxdqWN+JpJ0zzRpiNBcya8MfiKym40X0XvK4tFk+/RNK6D/w+9ld
	/a49dbyg3nD4iSScA9Vomum5i/efCiL9eGiOXNTjFdwvQdGxhpLwN1SCjfhtHBopFLzcYNLV6+e
	TcUsiJo8DZgJmilJB3Tpk/t0vI3o1xbJsWaiPs/U18ZoNRvlxtuc2jQeHNnMKzkG4DpU
X-Google-Smtp-Source: AGHT+IG+mbGfHby4oN4mif/0xWyzRBGUvzT/O7NjVxUxLjebSyALlk4r0nPv9AAtoDtPEV0kMXU5LA==
X-Received: by 2002:a17:903:24e:b0:220:e023:8fa6 with SMTP id d9443c01a7336-22dc6a87a3bmr149376745ad.50.1745898288540;
        Mon, 28 Apr 2025 20:44:48 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:48 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:45 +0800
Subject: [PATCH RESEND v6 21/21] arm64: dts: apple: t8015: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-21-ed21815f0c3f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZHoXysjC3tKjwBhupXya9t0tvevKJFeLclU2Q2P4acg=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErmS1j7IbxLQZFLwnkOWnyGSToxunf+XJVbp
 2Po03ztjQmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5gAKCRABygi3psUI
 JEnzD/4oHcDES/A3PK30mbJojwRLni5u89YxyaUUXYibt356GrRUeaB9TaCO01jQtOCbCyLwdng
 YYLhyzjLX5WGz+LVCOpox/FejgYqaGmOs48zTsdrza7jrrcapf4Gm3y4u9LGy1oivwzW4eSvHqe
 BclP4UmTlBVeLCZgD5Lpdx1Y7gGcA/kE0oKbae+SCi23mdmVMa6uVCUd0YrwMGRwglDR/DNE33E
 v8Pk7JisxFreQLuncLRqBJXpYzB5lDbB3XxsnmuZqNuT1SDyjwK+EHMGuNIsXLBLF+FjFwQJ4dC
 NKmL4l+qJPyZJ2badP5lsPMumOQ4E882OtRIGWLojoc2W7DzjrPbPSrZ8FzILxZtDwxyLqHALf5
 rOlZ/n4kepyshmCA1terQLnhNH66s4MEPKSTRqIdbOmpaOJAmQr0q7xehYOTcQtkOxik80Dizob
 5UAtpDS+m2hl3rgIk/L4thrBIfq5YVY+5kPuZ77KP9UEJoxKoopvnY8AedI6CZ8Kj4Vk496/r7k
 bIw0zf4Dv76CCEY/S9EJdSOe1UG0VMQEbYtoarAGR3tYr8skigSk++wEkiMdMIAddQ+ryWvepQS
 dNNrxD1hBKlDuXAs4WdEvD7FLxKx9p3JaA56Abb1PxNiE8S85h95aE0WQHyuIURre8/c7Wb3kcv
 wjboZ0P2NAD9FNg==
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

