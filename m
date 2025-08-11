Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1642229B13
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920612; cv=none; b=c1h/ICFfqhvkHEkoAqKkQt2hwlbyIBJSWnDA9PY2zBDKbpk1ezk2L5d3NV4nW48KksEqMat31YBxqvTym9dVggSV02duv+tPeAcFixWXLRGNstjBtWZal94pRaEVGn1KKHnSlQFhxa6Me2PeB5eT3aYj1+FPNjonHOmVoFLUFLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920612; c=relaxed/simple;
	bh=+6Hv7wN45RYOvBgi9TpvNQIVfDT+M+Oqum7pRXh6aLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BSOIu+fr1y2UqmvncKKW9QOAo4gKieBmkosn3qxWfFaTyTRZXQ6vVydSvXqtuLTTlDwscA0tuLd6QI1vrgqgipPbkMlVn1/oOdGYJQctj/dXMUsmt8maayqGaCDo4pHo/jrrqMxBUppEo6knGN6r0ZGhzx5vcvwfxif9J+USRRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwpDQlBr; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwpDQlBr"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-31f02b6cd37so4556513a91.1
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920610; x=1755525410; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/1HJxrOXMdUlBGAfuEOyATY8C4K1iwqLWBzaFNxg8Y=;
        b=TwpDQlBrLxYHEpBDrm9e4oC7AMiKm+A1vp6GagQYCXRUGAWpsOyMVY8/h6zJgbYYnY
         XYxPwnlM/7WMe9aJ3eIriO4bVRd26hz1W9a52DpwD7Lm+pfD/X6jtZm2GQPJS20rcLX1
         uPJ1oO9yaEOAh1ZSDPCtxyQhss5z/fdsPjuQReaWqJV1BtmcWfJV2aX4KQTZs02cc+/W
         IAq5iSh65Gr2kvAw9Sfy2khrQs3M8/cdZZa2GmGD1CHCl4j/rO8GEwHDawc9w29GQd23
         NAPB7IUI9znzMThLo8LrtnPQOCqtrYzNi1MOkW3P58pjnwzOhOB8gAFdKHlk0CLOrlGl
         zJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920610; x=1755525410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/1HJxrOXMdUlBGAfuEOyATY8C4K1iwqLWBzaFNxg8Y=;
        b=mMirye4T2Kr4nNXLL9nTWOZWdr44jnOWGGyFYkgtx1dqnQTnbl2n8KCCyUrjegyVaY
         zlTeBoA1JtDSnGTbwk6xGHYOv1k6EA249i5ajz7GnWK2oW+a+WTVQNy0tJv1y4vBqzTX
         0dLULr5piN35Md7QAmxteNHtj0t4fG9T8z9qWMeJzusd34fz0Lvz9vdVCEoF8F7Jj5HR
         rTbVSVjmECsZxbTcJv8hBssfguBicDlBUrAXYRTbs0qilHip7OC9Eiyl1I5cXWnS7MNL
         1EvrvcPqUqKV8ZUsfq8FaOgPRBOdNm8B7mOUBw/I8hzC9SIgcX5VZ3MdoF8UmHJyDA2o
         oImw==
X-Forwarded-Encrypted: i=1; AJvYcCXSkAx/36diHAp3+CQdhuOOSATF2j6T0DXJgEQWwqXvm0rUhn0GB10o9GG100KjRHHU7z82tw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/nkmnz8nl7krGEz9oCmuNsr5HsbHw2tSHvLLhpHULVZPALNO1
	ibD8EFGW+waigD40ruG6k1Y+jjFdXAhkt1RcnbvHyCvXCOCzt1oHJvdL
X-Gm-Gg: ASbGncsl2PHJQIlO5az+N50Kuz52ggBhQSF3Aaxtlq4tjoIGUyrz0xvRgouQzHpjiHN
	ZbsKxL/I/lT36MWOeoI5p70LMXRlbVzKsubtOs/QT81/R3EYuW0TSeNEzVsd3rlvON93r6BgqJK
	WuyluMsQ1g+7jYbwIu/3Idmhe6bpI04SfkjdeAOiIj1ieUXVIve11N/2g3oostPn0L4KO+DvFG8
	WFXq5xAy9SoS+WkhjZO5aHJ+UzCwHSp9g2WORp7iUQ1Q1t4zFZRUc+nmwbCnO0yzmH9dahd2Nh1
	7Dvx8qhCxqquT/nnBpJ7YqM0Qx3EHzxEPM9tTLUKH0KB+LoxxReHzBR79SDiTrTD49ApZlRS+cL
	fpSw5yUDY/XUl9nfTeeuInoXXaoHwDdczMk8bHMkA9REymrQ=
X-Google-Smtp-Source: AGHT+IG28jhCE0GuPPilcApK0/tx2rGtBIczrbc72FzxigaZhu5XM+av2qEg1gdd/Cahah4fn8leOQ==
X-Received: by 2002:a17:90b:3e4b:b0:321:6e1a:1b70 with SMTP id 98e67ed59e1d1-321838a62aemr21627006a91.0.1754920610197;
        Mon, 11 Aug 2025 06:56:50 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:49 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:51 +0800
Subject: [PATCH v8 19/21] arm64: dts: apple: t8011: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-19-c560ebd9ca46@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=+6Hv7wN45RYOvBgi9TpvNQIVfDT+M+Oqum7pRXh6aLo=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZD8saXseFrgg36l8r0liIuixczX7zmShEZR
 G/KHq9APyyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QwAKCRABygi3psUI
 JA9CD/0XlE56mqo5MzkghwtKswzQ0DKTDGT/gnsr2ijcJkqCMePQyQZFJoCEzQe0+/vG2dprTsV
 7WkJEG72CHqP7C/Dg+rS3WQUhyi/22FJVNgYcT6ih5sQloxEXk+x3O316c36pthdLxFLlvV+JS5
 vXdgilEDGOckwu6hW5+f+i8uSv6t1o2CBM3g2EJP3sSQlvJlKLLvWQdfSmf3fSkSr3UaeckjTYJ
 C5Pi46Ozg4YF91hOK+GOaOxIQye6ENEhPALGK4W7j3t3UAt05nqlmfnc7+P+nUara0ZB4o08A1R
 ppeGjHv5Q4u4ijpXvNGJ/wAZnOBOTAsRfRzSSWX9sfpku3ahCpR356NcAo6SeNVFIkb4aheU8iz
 ySsmkjcSjl4/C2/F0euDY9nXNPQMmJdZW2o9UDU1IZHpQZBSdxHdr9PzJfknai/VcFV0AWLEXJr
 MlMp3/i1jjhO5OWWap9UP7QhBHA+vZVCm6mdclc4egYhSjqC1WWJkyNj+nH4W0aI89Y9VQT3YXI
 iGvDUTC12auwLKVbIOjX3g4d5Rm4YQec+Nr1wT+RdiP5UXuTDa5ikHQwHRRnkePLQwyZg8TLcF7
 aXWJtcCeeT3/i5aUyXwfhR5QDmIG6+//W8d+JvCiWjDVT3XWmOJDDvfGZ17ulLBP0am7RBTKnwG
 WI2+zEi64sbSYTA==
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
2.50.1

