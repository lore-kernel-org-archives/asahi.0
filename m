Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB2439B959
	for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 09:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849491; cv=none; b=lYvSgzpujan7XlWWhcb6+vxrE8QRv6qPFrUgkyp0WQe14eo8IEhxIKHiKg9x9bR40be8OWXqs6ASJT6G0S6y84ad6SMjFIceOZ94xg2xjlLG7rJxPxIGb5f9Ubbv89Trk9tVGnT5RoZk0dkP+HAxZURBuQLRQWIIR9Vk14CokdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849491; c=relaxed/simple;
	bh=IymUvUUOlIyUk7vYIWm4si7rSp3+FNzQ5/l7gdZ5Phw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DyoQOiQ8Ucf80ywhgRBXcqpnMh22BOYWfA2j8ED6KmOUw5bkWPu31y54+MYYVZ2sm++L3R5fte2E5xTc4//SWJ9AHF1n8cNEy7zVGFqGEPqIEUHH+0gM3axytKnhO0crW9DxTo3APirC7HDykVVrsKxP8Yuz9OJwAWbApq7JK8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsMfPp9Y; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsMfPp9Y"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1846710a91.1
        for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849490; x=1784454290; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaLKWhSSM63KZpE/iwvlyOdiJ0F5jeAA8qCl6yAcCfI=;
        b=YsMfPp9YwLGVG3HghhnAYAMZKRdn0hF3QzHyt8GIxmOUWYnqEMzwJ2ZWhzovY4hp+/
         vCiN4fW9itR4Lcvmn8/U783Okv2WkWLALDmvUThY+rFtHlS0lu54FVYIAUmHxho5Ue9F
         V0t0mHITz4XzTwvc3kHLxLpNiXx/hsb6AEVPioMTvVstAHxi6gANzez2ANVmy+z9uu2Q
         Q78jCJRUm+tU/CEkrUPNAg9B3Tby3PQGmvKdRzmHOaVVwaSQulrd0uhHQ7QxdxBfBAt5
         7N9cAnOsS6XpsrSuSC7XQn7DyWxt3ekPwTNdoWCn2osl5t6lZyFYjlgARc1tM7NWVOZV
         K8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849490; x=1784454290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oaLKWhSSM63KZpE/iwvlyOdiJ0F5jeAA8qCl6yAcCfI=;
        b=O/TN014wUS2FYSJVzrvWzmMFy/5ITDXuhOsEXbcygvR7NLOcew2xSVVcDct+tm+CQn
         OIk3MUxe9BJscNPqaD5vSCA3FsW/JgpIxFhWFcaBcitYgpq2D8UrbpRFcqnG/3VWX92P
         SiotD+DcpzKrXHRHcNMngEi9QQj7IU8C4lDertk13Bu8skcrD1FVY4ULoS7KqJOR56QK
         e30oeQCIndCJ8RZ3WBycZmyFpGjPlGOi0coccSFptZEqKEy0wtQMlLtAFT0VUZmNmQSD
         qvhZCFJPPm9ay+7JICOFLXhdFJcBIAtywbT1pztCbYuFx5woPrSNYHimVJjpsQACptmr
         cdoA==
X-Gm-Message-State: AOJu0YzLYw6te7kHakOL0hk7yZyLPIbiSWXN4kJLuoC2XZt17aHs75QY
	Wn1hUbM0auQ2VNzvrzmNcRL80DhD8Ari1SLSZOtoHX+6Wgu9pAepEppT
X-Gm-Gg: AfdE7ckfd5q2l8Q6eDhky4vs4Fukyrr0edkxiSasHQGJeh69edrKwTRMbNbh9V+6r7L
	fh4LlAhxOW7croYfnfnEVYIfIJNSqyQXgFn9bFjD2pbPcQyWuWHt58DXQc9E8noIkuRFq5VMnmA
	X69b9ZC7AlMokkQwUVjRaiqirnRFd11bgB59Y86QEWGqPBN2k+h1FpQUI//fuSO/Hwv25+zmzAJ
	nPJW5MvR5P8ic8WQomsPyX+YuwaMYlCPWjInnB2fNAuXw3PsjHatjzvZ5wlMB1gasDqWfS6Oi4D
	zIoVYiz0LlPSrSVa4Q/p1tZX/a9RNffXbCu0xZ3sk3b9C+B5CMPIf0PahRf5EEy/v4c5eMvZr9Q
	esaY1WIT9bcdx4Za4VHXBvgwK9WRxyfJIc1X/OJf6Og8lSRVJwzwy/+somrmsJpwuJpvQkfvGqv
	KNO06uMvbV4TBcdCYB74L6EH+GP2AefSWIplFWw0xHyayezDVivemk/3JgMXQlw3oc9RY0eNMKp
	TFYWzJt3wP07CHYJy2LLCHsJhqK8bQ1xYHY4u9G5N6wxiQDMdRVSXAHEAd/zC/P
X-Received: by 2002:a17:90b:184d:b0:37f:9ce1:736a with SMTP id 98e67ed59e1d1-38dc77759a8mr5253734a91.32.1783849490211;
        Sun, 12 Jul 2026 02:44:50 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:49 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:28 +1000
Subject: [PATCH 09/12] arm64: dts: apple: t602x: Add common SMC hwmon
 sensors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-9-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
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
 bh=IymUvUUOlIyUk7vYIWm4si7rSp3+FNzQ5/l7gdZ5Phw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU8TKxXf35MvkalK6o9K21j6o2hri+zsdi739T66n
 gVl/Vs6JrIwiHExWIopsmxoEvKYbcR2s1+kci/MHFYmkCHSIg0MQMDCwJebmFdqpGOkZ6ptqGdo
 pGOsY8TAxSkAU73mGcP/6g7/K1G3BJf84hN0Dj9n3f7JvSm3bfVEBzG/sKObqph/M/yv6OBu21D
 FyLQ8yndOkFnH5fQwsTVZeY93/Tr60nQP+x1GAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6021.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6022.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6021.dtsi b/arch/arm64/boot/dts/apple/t6021.dtsi
index 62907ad6a546..5175797baf62 100644
--- a/arch/arm64/boot/dts/apple/t6021.dtsi
+++ b/arch/arm64/boot/dts/apple/t6021.dtsi
@@ -67,3 +67,5 @@ p-core-pmu-affinity {
 &gpu {
 	compatible = "apple,agx-g14c", "apple,agx-g14s";
 };
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022.dtsi b/arch/arm64/boot/dts/apple/t6022.dtsi
index e73bf2f7510a..7585fd609d34 100644
--- a/arch/arm64/boot/dts/apple/t6022.dtsi
+++ b/arch/arm64/boot/dts/apple/t6022.dtsi
@@ -347,3 +347,5 @@ &ps_gfx {
 &gpu {
 	compatible = "apple,agx-g14d", "apple,agx-g14s";
 };
+
+#include "hwmon-common.dtsi"

-- 
2.55.0

