Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DD5227586
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 04:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001219; cv=none; b=VV/CjZAasW2KmhDHzYzQ8BR5lYn6NpxZfjLlR6N/Bv5w2J2Bl5G/qkaiLm8/J2CaACk1oIqNvKG7yP6DEpa/rggfZgEGGT+wfjuMq5stXTID/+YKOiUuhB/2AU3ds8XR+pTH3ZPXqtrzHS1WnfOyUjYXHH9703SBvXusu/Dq19M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001219; c=relaxed/simple;
	bh=duxT7MNXJw4vPLeIH5239k3CmgZWAQGQK2kW07pl76w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sqnFFcBGuCRB21+aymkFgQeJ3Y3wxPggqAdnTUPfckjNDlKkNKSSLQjTwo1feCZzsE+qB1cYHCfoOaY5YW3tgp6a/i74KBPpmerRi/qax5g5zgZO1puWHE0/lZKayy05+Bgz1O2PzdFzscOS80YRcTqCwpedlknRrM8jYHi/W+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNeGksBP; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNeGksBP"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so5004525a91.1
        for <asahi@lists.linux.dev>; Sun, 06 Apr 2025 21:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001217; x=1744606017; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=kNeGksBP1YG/YN153vTas/SSbHOkqE4g5upulMvpiQLIGAzn4TADAClzbAMX50O+Rv
         bJh+veNzU/QfiPEDAobKOcQftAHb9iGi5jyuz2zOLskFQ1IsyVITwdUqNkwZmm3uZpzW
         UmUg0hyiOVyQ8fi+ENxiNVAdDLC3F/GwqphO3gWCM35i4mmwfHcGPcMBjnM6S+ZrdiOT
         vDCYRHu+GOa5f67uz7agv38xEldtDH6s/LfLvqbDcBMFR2Ka6Q7Vl8CndDC7T3Bhe2rv
         4kxWwQ3ETtj/F2ga5d0fOwj7Glluy5jNHYi9rGPXcjSobBbcfb46rjYRttFZ+8lDLbaV
         zmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001217; x=1744606017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=FlJaiJeeGtxLnvyaqBEg1xUxkzhO5XproS3BEUh0byFLDH2Q4dxudbTsf6yJSEtPEE
         dlE4sVVUm5b9mpqr4DlTor53m5eUQrZ+x2vXzyw5IolllSnjSVCub6TN8AGuJnZuuOI2
         cPmSCEV6bW3nMVNQTJtcNq1jHuV1Jw+L2FVujZmvi5ka9RM2XeHM8+vcqpC3e7EPdR3Z
         YwWt+Bloh0CDep9JYOSQZKABC5Us21/uyVdMRA6z8yJ3F/mgqL0k1DaqAICRyzAv4sT2
         +WDAmNLOky2f8lTeKXDab1IZjMOmQmGcNzypYFO7mZU48Huf6NIJp7WDgiq/q3JmSJPm
         HrgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvwG3BZ89EslF1pJ4uJSDp791U3MuwtuKkM1I5MGAiu7bDpLtCGjP58lesnNezB27p5lcd9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhhuzYBQzUHGzVvXL/lR/OzdU2SBnjNHV4jRui2BCoBU2GQbCj
	h2JdCV91K99p5hyod1z/mlM9mv4MNIrjEj3mMo7tVJFtSl4d5cMT
X-Gm-Gg: ASbGncsGu5eZcM8D6b6T/kD18nRrcKQOWQoJPXDbO0er3ZQ6bZCsTUKZ8wFmZKhgpHM
	2sgH5hfecEE4TkLQA2MB/bz/WlYcPrOe4MGoXQAtDfjel7z6FxTNal5kvbQ8mEtKTM4BZr5yGjf
	iwC0pSERGs3/2doudBSeO+Kb+DZ7RZwv9V/zYI/1WzuN7PKPCm4q0Zp6+h5w0e5SDpD9eAxTCX0
	inAfCmzv2u97XzcelO/UpJebEM9jF9i30gxYoo+9FvzuBm9jfIOWShtwBzrzHmBrIhamB/HtpvK
	EAydVmb2zjZJh/CqYcZjOa9kCZpzbxAyn6E3tzvggOXoeaQ=
X-Google-Smtp-Source: AGHT+IFp1o6jGnfgrWBgWwZCg12gAuSqGW7BBd8Tj07WjPky9rEWHsz3tgzeJQgC9fscCCvAKkH7og==
X-Received: by 2002:a17:90b:544e:b0:2fa:30e9:2051 with SMTP id 98e67ed59e1d1-3057a5bf0b4mr20505582a91.5.1744001217377;
        Sun, 06 Apr 2025 21:46:57 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:56 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:25 +0800
Subject: [PATCH v6 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-16-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
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
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iHn/Y14SjkGwKn8A7kTk3bx4cArLbVYEHup
 S3DW2jHrfqJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhwAKCRABygi3psUI
 JCMWD/9GZvoif5wFE9u7k5VLtRXa7bx03z/aftHbvMECDAdgV57PlyAlHnJqn2iZ0Vo8etfl3jO
 2UK57oGCoI8AEo6xeducqncsZ+ok8PNklu1uKutNYxcdlvBQOgJnl37DKm7uJ0SqfwnOiq1FNaD
 aCA9cm0EfH4/PnkMNc8UIniEHVG5En7VkQ9dywMsbSMw+03vXp95JCOtgAgpmUchmvXp/1dn8ir
 ZTtGxKmJjZ/ag5+93yFED4w1QaHJJsQttD16NEWPXjlhZ2IkZzU8mhsjoe2hDqDbj2V9tZ77QpF
 EQnNvq5kCMe1bQLWljMIGMwT7mbSc+PaQomyZFNIYE4b3sZiW1C2RJvqOi4y4MAaOcGfDf/o362
 jiSxnhxJmRO9qh+NF7/+YTI09ejh/ruGFHTIKc841iF9dRLgYu/SvQZ/N45sezzp5DeN46VkwKW
 z9VwoWf2mzT9QzDD99HE1SYp9Ym0N9W0Qr5fLd7nhWUPVy3uTsH51CcZoApxpwiFaiuGjWTdKeF
 Sg6snS5A0AtUgEr9R0SzxmM74UR+XryNNGGcbXwQeob3TWDEqbX5H7Cmgli7mJ32N0SqPK/dsGR
 8Cnqe/8ike3/pwrtHIGJ6mhCzYIIz+60ZRVXuHZp8SSX8KElbKRQWwLYj2AKZdCH4CksAC8SMVo
 jcnReLZ7raZBYsg==
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

