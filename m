Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07405302156
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325729; cv=none; b=DaFaOW3p6PgxZCHHNfwQqhZU9f3svQKOyHwZ2qLZAvqlcYcvLfazpl4XNIjGSUmBgCDcyxYcCtH7Z7S4e/YjVNReJohh6cp5uNNf7sRKc53BKlpS7t4TWeW8QrZFJBUh9zQvsk5JrgzAw1X4F84LlXCoPe6uxh8+3/LDsvmyVG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325729; c=relaxed/simple;
	bh=I5bmZCvx8lSOgqzXisEWeIL6b++oNn2j9gQ7uou5JZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HCuVw3R9FrguxCyzOnAFhmYcjvVbFTlXJ1SEdsP7O3b8ZipJIlT7GpXC+d79ymXy66bsnNlTW7W1eWkMLbmTkZOqqpXdLkcXpoW5i1YteVt4x1kSF+aUXz6M9IjxSAodq21e1erexMULmQ0jabxj1XVJ8nthrLn+RS0IGXUbrxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icGSlVLM; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icGSlVLM"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7723f0924a3so5587454b3a.2
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 03:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325727; x=1757930527; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7UzRpURIuRgTvljraCf/vxpCIMLGtFavfo4dJ3/GB8=;
        b=icGSlVLMqg9oNn3hj+niZQdQViHfwNCMQhiU3SocimJ7GTICK5Y33CIPSRbwx2shyG
         JqHlk1zzXaGZagppQi23JNLZslLk6jcmIQFkMJP+MmTJ5af+UD43H0h9fLeEea5LzOAa
         4SySEaCoMNYvH6UURY47Exm3TT66MIWg0E/5uRRXbUSgXClTGlMbPYI3BqWDyZjGvX6/
         kM4hK5Ad51qd0eE3A7jydIXOOhZoEM86xbOwdiThMX9fJaCk9pTpSDN3j6WypXg/NfKZ
         rWcpqKHOu2+CTiOCaiDuChza2RAUNuKVs7JFp07g2RNNZtkdF8GYg1ZRv9JJnEp4Bd2L
         mUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325727; x=1757930527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7UzRpURIuRgTvljraCf/vxpCIMLGtFavfo4dJ3/GB8=;
        b=dWqE3q9FZQGh9ZAJ6HFg80fvgDPUyPwJtlB75ga7+UYTinOsHmwzdEf6lhkPH09H3E
         r8+Xi3QcRo72Pepu0u7nYLG0Ara3ihL7iKEZQdY54B+CnyMFp6dMrobvS6KilqqLPsni
         d6NUEfiDq+52b0q9Z66O08EPacGLbqi1wYxge0LfNMBbFe7aZ4g6xzOlrA68z9MXmUaT
         NFwdaEK9l2yrA6yVfpUuaCpqPn50XKRPcz1qfm33WVe6D3tL3FtR9LpL9RnLhby/AoBx
         RaA30Gga9nEUOusKUZTiARXBOOaPsnWhGzXdcqKxmUoZSvqQzJuR/keCKpN3ZTUO/hLN
         nCdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmBuA39X3UNHWB7ae1apnDI04Ld2oy7yQc2oQmBBgowyPaN/4/7rRHDTNjzqp1/mUdRa0dxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YziswEn8iISyEC9XtHkQCttwJKqTdAReYpLFGXjX5RiDfq4MFNu
	PyvS6WfdOP4ITm5QP33mM6MC+r/Pye77Kp+R5r5JzNDNrKO/MrVWTbjf
X-Gm-Gg: ASbGncsOvBq6jK68VaZuPzC2YASlx41uRQlvv5tVRkYDyKRSWWxXOoRSiG1RjcIQ32g
	Q+iRfL1nNSaTgnIpYQ/0YDDb/3IngAiITKsy9w98eAZFIv2hVC4cY0UDlu6tCaLbWxkRMyTaD41
	fcmXRqP2fRBcTJegAJhlUS13zdUaYnpTzJqzgP9SANDceTYVslmYfbpqENWI7QIkP9fPtEwhuYC
	o/bvR666vAnV5gn49zCu5Qf5MZZrz245Rxx8X9deMoV43wsj5Bq+xdknKlAC92MaHsSF7AFUnhX
	p/TOy2Bqt2JU3eZiQ05RxIkpkFGz7IojKYg8VJPMzpDjjweHBr9oIQ6OqnK+WAxJgV4tuUhRSkB
	qQfrOa+dbA+QjTbwLO4bVllwtoTrg1rOBCyjqsw==
X-Google-Smtp-Source: AGHT+IF8LpVXd+WGZEtF1C2T+vTa9TSDeVl3CnSVMFCq8UOb/1o28OdTA4U/neCjSXbyvg/fcm5TvQ==
X-Received: by 2002:a17:903:90e:b0:24b:1785:6753 with SMTP id d9443c01a7336-251734f3e0cmr81802185ad.53.1757325727130;
        Mon, 08 Sep 2025 03:02:07 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:02:06 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:42 +0800
Subject: [PATCH RESEND v8 18/21] arm64: dts: apple: t8010: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-18-d83b4544dc14@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=I5bmZCvx8lSOgqzXisEWeIL6b++oNn2j9gQ7uou5JZQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlFQ0cZrZzPeRGtCygbH95UuIjln1JvwKkJN
 24hE/EOxKuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRQAKCRABygi3psUI
 JJaBD/oD5cXvCu2sBW1J09kC3JBBl28CAnlGWlecEz3qWOCDCR4tZ1cxWW3m2tnll3CaC7xlGu7
 PFTC5tfA8pMiz/mJCb/XZcqIg4WEU7QCxjbRE5azyf2ruTRo84eQxpT/JULcO6OxcY59PmSA7HQ
 BzlzXWiIngPq5ex4K5CwtOZNREQDsqY27ECGJUmuiH1Fetnhf7unUNbE/o6bX0hg48FO1SnotwT
 +Idf0JNbMEDMHrAzWwrnhZwSmQJ9tk1ED+AQo+idFCmgESTsdjfi2UXO858CcCvwxkdfcf+t5Ot
 hpAHc9BVLzeCaGhbZdG56La/B3tTDcWJmF8atVIdQYKq9bsveCRrPVi9GxNQVEovMhrlRJi4jte
 IVnYVenLFmtKcVrDBD9xKwLszBmrM/pYHON27u5fOh22I0D+YYEmirFLX55eMQWupggKY69Ww9u
 fvSuxrIQW1u7lI99XVZMQzL9T1CuVYHyBVgthtKBSTigZc9kUkWefEvHjF33M5gkgjqp8nki9il
 81mag0B5orFM3nSHKMtPkFv+Nn8RtQUxRtJEsk2ipOWtI7ckgSATmjLK1Gh1fwlTBV8NMhMRCNR
 CWBSJkIvuNSzwzpDZmCOGfhnPwdzrANKt1UgaZPuz8SecA/Fl+X6/JsAdk/83DLWwtEowYsw6gn
 x35Sp1wBumOXpyg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index b961d4f65bc379da3b215ca76d5f68691df06f4d..d187fbf7e7a214cbbc1027034efd0724ef7f8b83 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -256,6 +256,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8010-pmgr.dtsi"

-- 
2.51.0

