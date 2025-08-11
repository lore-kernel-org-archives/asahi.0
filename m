Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09294218AD1
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920593; cv=none; b=Nkt7q9DSxBw1fGQbM7plsX3a1u5FYJN5J7DvyE8lDFLHsBUdME0I78A24hpNbXT155ao+LJ9Y7mTJyqJxAC8mTAyOxiWPq0uNM8YqokeUz0ypKLkzbgG4nHoMrMh1vRJaz64EGVVeoxEGKC11rnUB8C6elYXYvwOjRrUuL0rcog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920593; c=relaxed/simple;
	bh=iQOR0q5XQVT28sD6ndbFpIVd6zE5nRLSJJDlvhWOuPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lth8IdvDg6PCVaT7rca0/XzmWuGMEHA0rWQIhrEDSVl9b6/doMP2lE9yAjjn1EsK7m/qcLxX8odVhOYwK1/PGBwZIKc2wegEq7Nqdl4Jv3oZaDRGDbAykNdy/C3eR6MsRpRbGX+GFD54LtMfOHqkKtB79Z/kqVTRP3N2FJFC0Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WM+J7mkC; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WM+J7mkC"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7698e914cd2so5483909b3a.3
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920591; x=1755525391; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6IrqtgdxmO+5NxhFJl5j4k2CHU9lAmIsv7IgP3iuNM=;
        b=WM+J7mkChhTHf/CzkTQ7BI90rNy4WefYgGvparv7EhX2RYyNMtFVjZLZwnQkpzDPxZ
         p/bjLbDP6NuFloWlLCQP6z08UehEHImk2rcpSuBA83xucFitRqVd7rtfqoFciQknqKwo
         cyiNZWvDuwDJ6Q8m7YAgQ8UThVt+CdTOgf8QU/ptYw2ioO7fjHxqAc9DDhWJVGEgj47C
         0N7pgUQLeS7e6fs3Aer+aNiXI5aMskwGCVxyGxgv9UDSxnWVDRqaTJDdOaSJl1hkjTQ5
         U0yHzAT53z/0OeiGmAF4tVxx8BTM2M/jDCBuE1Q5/OR/qH2voODpeUE4PIKZFn7JfOM4
         AY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920591; x=1755525391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6IrqtgdxmO+5NxhFJl5j4k2CHU9lAmIsv7IgP3iuNM=;
        b=HAMO433RIIf5DPJKYQuMbnVwJKBF05uWOgCR/jrcOgDe/9Z4RWso+JIg8ARUeZ/q1O
         s3g0CXeJVLD+3yUtrc+IkiGH5Fp6m1PMeFm/Zeos2qEW/BQjAUbbDndKF+7nW5FmHxu1
         QrSuv4sA+Pew881Ci5ed7of7JxsazTQLbdnbDOBC85mSMicByY2WA4H5aMm5PHayymUe
         Fc7jKgRzAO9I+karxmt5l0Hj+eYYUB4I3rZS+pqxwksbwb9WT2k+wroqcV8YXgdiJFfq
         gkfTnAyn08mqFx1oCxODA9kiIRpf2JARVA/hNDnLxWT4SjoiEsHYz3YB8scmNxkkZ+ip
         RONw==
X-Forwarded-Encrypted: i=1; AJvYcCU7uYPTgm48ZSvV+Dy/gnKqCX7BVdygtv4uG17+VUQUEA93GTDBkwa88gQ3Ku77j3VjHEAW7w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0K7OO76G0cLZJMm99Vlk31+uAADFcEQEHjbKYOlhp5p2X5snG
	sJipyCOYIkz+ZWyycMKrkvFX78CG5O12f5kSn+MOcqXl1+5iUf2IvMp1
X-Gm-Gg: ASbGncu0O9UdB7B5FwsywoW/uvh4v24VS9Lfk8o58jL2UEr4vb8Mm2ntJ2Ygv6TrfTq
	RS0+a4BBYf51WoF4Bhy+r8d9LdJzKBj/ShbrwrFVYocOuq7OrEhYnRuLQR72Gt6uwUFBNGbuqJu
	SM5QVEh4Kj8K1Cs5X4fcS4n+aFytV5JOavHcCpmaZw7zxm9Pj/4tyPX+0fyIsmw9RKN60diDjFO
	awQLVSF0D3APxgnwurOGW4KqbLUKrMGlYLoyHH8hoHhZ6Y7bW4uK4oBXg1AyCfyENL7c+I2cyYz
	e5YHKinoBwbAVtkK5HeIb2FXoqCM6Sa7gcbfKe0LkU41WDPSPbDpXvYURDq4gKa4QqQC+ZbIsNc
	v1Ml9F9n8JiubonkeIw9dhznm3tUwhK2dYaeVqzAHP5MKyBA=
X-Google-Smtp-Source: AGHT+IHjAtQwP+aWp0amp2HAfxxavIx04Q6gDYhnOvqodiiQYDQ+FqB1PnB8IQF25ASHJIttNYsq/w==
X-Received: by 2002:a05:6a20:5491:b0:240:196f:35e5 with SMTP id adf61e73a8af0-240551d6df4mr18725211637.36.1754920591372;
        Mon, 11 Aug 2025 06:56:31 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:30 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:47 +0800
Subject: [PATCH v8 15/21] arm64: dts: apple: t7001: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-15-c560ebd9ca46@gmail.com>
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
 h=from:subject:message-id; bh=iQOR0q5XQVT28sD6ndbFpIVd6zE5nRLSJJDlvhWOuPc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZCBfFOvSHEgUCXK88RXHenFtgNmRrppMrfN
 axZ2It8yUyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QgAKCRABygi3psUI
 JNI+EACRW8glfUF5YaGdOU0n3JljQH8oNkDc1zs0oE7c3+E9uNoYX9UiFiQlZ0GCHMCUZD6MFU0
 kgcgj/RKc/AspzvWwaG4Xi2rpJwIS+tLbtxZVemfotAixGxWxkzKQda7pC6UOqCAEebmOUIgAiw
 FlSRcJG9ancMD4ntZCi3pDqxbnqSEA9Rw6+IQDDMta+uRW8cFr1gL8fu1rf3ApyzJQrTd9aYDh1
 DFU6jSC4vvaMAOsezhn6RYD7wTo+nlVeQCPJgnXUtua8WlgLfWsWJmMkJrqv3PpGCwi0s11MdRX
 Vhz/+Uolqp1/GUcv3Jo6+37Od6QTKHD0nF3helJ8w+FdhdMJZXkG+UE0g6kqjWrNun35MzRUsGL
 p+7iAuLWmqLEXdikvzGmaD6SMeLLRiXYi9lG9EFXf/MAV3+vqye7a6kGq3CuLbyoCWg10SkTWA1
 eyKTs7X2axjRpX7RZUeYzBDQTefqqXDNtRDV/7VMw4+rykJ2z0ka2HAhlnzjUdPcKolIm6XA+BW
 MKyNmxUDIT7Jqe8YnBplsrMEMKN4kTYfhzv4pex0KucNLoQEInD5ntYuMG4UN51e9bNY682VtyO
 xfdkoBYhD+aXT+94+IdUpJxTCTyjhClJivuWi7F9Q/gXR/InabhRixJ4cU+fPWKC+A/4w0oHXBJ
 gjhLIu4GUWeu0ag==
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
2.50.1

