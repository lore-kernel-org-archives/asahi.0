Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200742F6590
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325716; cv=none; b=VrJVKJCpm1MOrX4PdSOUkDXamUaIDYr4UArYdMxIsYNxzSMiZKzH3Jkwc8lXxD6uYSjMu24n5etsnRwuf/aLILjdvAGGtEvE8dnCnJBnjNWSJQ/CcztbR9sx4QTvdbCVaz2FHtzpJ35S1Qy/CaeJfh2jrnUmaWatrmgvyVk3YNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325716; c=relaxed/simple;
	bh=lnaE9Aql0p+zaBjSHyK2yyUlKYAm5n38nVhdpv7cd64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m2mKnnGhOs/pnyzZ/B3MIcuFBVOb0gHPW20qIdXMAyBRwrO6ZProIgSlZLtr4CO5LXldFUK6+89TBnP3GTtLa4F6I7RAPkZE/CFILXDXGMFS1PYD6VQHpurtwqw0suTEWnCUVcuJEP/KlIlN6d2Ci8VzLkPik/OT6PBFnIp++oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoNKKmoe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoNKKmoe"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-244580523a0so43500435ad.1
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 03:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325713; x=1757930513; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdXx5WHPadAVmQPefLqhuYKaW1K4eJN9K2RwteEElB0=;
        b=DoNKKmoeOZsMqY1fG4dkxgksyluABsrKODouic74z7GZIzOw0Ooyj9abUH3BjHFdPE
         4mjeQgqfLM3rI5zR1o/nnO8HwIyfWImL1k6FKlpMb3FJdYDYceB1a08Os9k67ug5mQQE
         MNbejmXD7h2vBVfNFbymdkVensXxPGbM+do7a35w5IVqYyGwnoyf7TX4m3uEUuW/ATFZ
         FUyeg5UnqOCDxvVvnJI0LwS9YQm37OGmBAKpi6paYKf5dq6+DTsxF0HfCXwPCWp8hyeF
         z+f6Kw+MkMSrll2xt4xxkpJ94HT7XLfFZJ2N8SeUgoveTuY3xJMCX7D7FU4qerwihMYV
         pnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325713; x=1757930513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdXx5WHPadAVmQPefLqhuYKaW1K4eJN9K2RwteEElB0=;
        b=fqv95WhgW/skIY328yicyu0By74X6kaZOyWzbeMpByiU6+NVnkp5YlMPEN8imG4+WK
         s6yL+Dea0QVTXdWo1UAlW9PFePnHdPMHKJBpxf4Yl/j4XhB3Yo8P7A/FtVKaKT2YikHX
         QJFsK4CU38bFvOsfY5a4wJ/QmFdErVF/BDPb2yqeHpQUDc4zVGBMYVfrjZJCCkj0jM1b
         uYw3+CrsgbLlXADub+LIaXSKvkztUQg2X/o7f2qq4LVRMNQel37/TzfVCWiTG2vKryN/
         sJ33IMVlosDgKFRgYl4+WmbGa+cgTEwBVxlGDAho83CjHrzK4Fk+nRxUh/3V83PstJbC
         0bsA==
X-Forwarded-Encrypted: i=1; AJvYcCViwSlvqErvbF8mRkbjuXg4dcGvFf3XImXJ/UUvWCR4CKF8uYt8IMUaU5yoZ0pxknGPGVI1dQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDihu6K87IxJHq1HeX4OlerkOiXSDI1YnL4p0bVpNfLM6upFAP
	TSQTB1JenIC0jWOoVtIEXC8X1aEE9Xm2FwHD52bd8gLrFeOqroY47nSQqIq13pEBiYQ=
X-Gm-Gg: ASbGncvnOx7mtKZzrPk4ducCRQmKlNOlxzHwTvKWPjfCRnTqDaKpBy/3JUsRJ+RRuEH
	alZNIc9hH8iwtlTEcwydpAhJFUiRLvZG88s47YxkLthDp1xZaIPQKkO8mCgByTC3bXUxiKIA7Sk
	Ft7p3clDXbysVmmYqYunRN8DpnJ8Rw+MXil7X0F2AUG0mNpGXUF2uwEJuwp0RkNoj+Efdvf5iH5
	h4UhLH4bzPIt0oKHQ9LlxXlYFzoPAQmtti7FHgRMlLsJqVwvFx6ctxwdW01O77s6gTo9Q16lyxz
	b4hvgLkdKUCyx2wbz/0W4KbfhO0/OqzZRZlkzjIa8uzEq/1SjxuvU0uh3TcC/itwMgh3fFlNMI8
	3/4MRDdarzzrXw16CKSK37kUKU5A=
X-Google-Smtp-Source: AGHT+IHVeB2ldGD9lByaVExSPq65coU5HN8zsO2WyV76Pj52Ray2lGVUsmxjkuZZ9lkMLPVGsDPzQw==
X-Received: by 2002:a17:902:d501:b0:24e:3cf2:2457 with SMTP id d9443c01a7336-2516e69aee6mr120267185ad.24.1757325713382;
        Mon, 08 Sep 2025 03:01:53 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:01:52 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:39 +0800
Subject: [PATCH RESEND v8 15/21] arm64: dts: apple: t7001: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-15-d83b4544dc14@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=lnaE9Aql0p+zaBjSHyK2yyUlKYAm5n38nVhdpv7cd64=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlEaG4dqRUS59rdWuvyoslW/xZbeU7W5FMYc
 Dv0BEFms4iJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRAAKCRABygi3psUI
 JG0WD/9LyMWx8U1EOfmaE1lMDGBv7OlkEKBgXAeGH0Y7oEuZJ1WCg276LK7MnLHTDx/B2PDzN6H
 Ui9mfg4uWgxb59NgvOupSiys1A/UpzaMZscIuweCw8NS/WwmX2vWankY56oPTRjUVxwaOW1bpby
 JBc+sslES3rlwzGOMxgbYWcShTQbGUTzfmo9r7wkvjvs1PK5vOIVgxzUMgw5TWK7on/MlooIkPA
 iuqEClLbdR7QQZ03wugZkXy0toHbKbwpUptvPTlCNRXk5YCATYtrNILgn5gWiEQ330eesscqEJ4
 mfkrYiPDqLn55d/TwShHBIUlwFpABFNHVuV58AS8uCiA0xV4fI3F9ST7nYCiFrrCcJX16I7+R9k
 qZZMbLlB3QYj/IhOrlnRLqmHPKGOaQAJlMUu9u5Fz72u7rmhZFRQCB5I7vaNzbWePXIB80qDwp4
 1dl20lRd+8VaF0oaf36IC5jNAdXVHeV6MJ4hL2He7cfRCMumxvpUzh273994aREZTPpGDHhVm7i
 VMKu3nCh6X1980fuZws8XwHpiZTCZHN/leOfWCOd6dCGx3xDnbTsTxmYjZlIGVBWxrYZaPgW1Ij
 fTD1pOsYviZFC65kZQSVzWi8W/Kes9/o0o4vOURRwhxRDdoU5oLYNnFWeEXw026GFqSNbShpPIh
 D0yR9laSIwEnzjA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index a2efa81305df47bdfea6bc2a4d6749719a6ee619..0e414018f5acbcdb10db92bec6e26ba32e53c781 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -199,6 +199,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 81 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t7001-pmgr.dtsi"

-- 
2.51.0

