Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8B72288D5
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 04:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001229; cv=none; b=UNdehpRPsOYbMb4zyr4F+IPVMNmpsaLwUwNirIkIfwzDgJ22L0Dl+QN3KZTp9BgOEciotuBUEN4wGlnkQEp3kFgnstgd97HuCAgTjhrCb/9lRRLrMgVckHAuwLmYt8WGqah+FKb+GRidapAzrN6Xyhb8gV49I8FSR13v2zYbahk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001229; c=relaxed/simple;
	bh=ZNIQgw4HnW0u/JgkpB+HMZ3DOfGGfZVMtPocokF3spo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OG7R7MDeY0Vm4avUsBPc4IWNEaDCLSldcwz35C3TOwG0XsPid5xXqgL9ayrtqi6Fcug/RmRdjBs5iw/Oyyc67tJ59B/D/ianmKDr+nYwTBpFBNRvtulMAAM73M6rijfXSNIhz7oMbGkjZzguSu4Y8cdh3cDg/9KnLPtEgbjtwrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+R+l8xH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+R+l8xH"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223fd89d036so43190325ad.1
        for <asahi@lists.linux.dev>; Sun, 06 Apr 2025 21:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001227; x=1744606027; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=F+R+l8xHnT202N0YpmseXfhJ8DNUH+YyLc370jNYJgWD7Be9CGYvwP61LK/tzDTWAj
         hzSUr7fZkWksRMLH+O4Xlg5yszXkllALeeC0sk9vVGe+7kf3ZEIG28UQN6XatTwHKSJM
         gIl/G7v7Yh5EySrD8t3F0DcqDSDtFv5WIHVTKUY3jwLXyZo0tovRX/kGMvsEi4wXX8nc
         AK7Ic6eaV4QY4lZef5MXF4oZtYaK7eT4AuwpAtqOsU9eoESCNme50yd7aW+9sU+/K5cu
         UvzyqllCURQ4n2sH++BUkY2++/NuS2w8YocEqotz7orpIVgiltOJJJUIQMrI7CQ9E6Qo
         k+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001227; x=1744606027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=lhdLOvR5r6CRUxSP6LzpKH00dw/2T750iSvXobbjhjUrAgdS6Jdy1+YEHzJx0Ri40e
         0Cmc6eEoMK+oZJjZWVjaClPhx7XyJaXkyS8KhObxyh8ncBVHX+Fpa6yVnANbvnyO232E
         5bHoCvgTg+9quFJYDufVbthcrNnZhAM1CL4JCj8tNxEkDMI8vGasxyFBm2TS+cszIv5j
         f4K072GSQ1FvUUoDslfIXGWMT/DfczAFUXX6qDoOM243Xrhd4cea+PcM6F+9eU44XmrK
         TsXFJ1bxSY61T+YkMkO9sXaB55VTAVkLpc8nQJDjAAPVZT/Zz8Owvhn7skgvCIoC6Ech
         xUfg==
X-Forwarded-Encrypted: i=1; AJvYcCXwP7pm69S5WSGPSw2geC5YYbgcy4c4wIyRbkNAizGImn3IXzGOyYSY7GQt5ilKcUMWGGkrxg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRLLa1sZmlfpWMcGOQbXBIgbm087xx+RSfBvYeqObMj8cY9NfA
	7A7gChXI4ENz0cYdtKcm+ytsnFX1Ed49zsDq7MiV2bTsDHgK8/tQW2W5uA==
X-Gm-Gg: ASbGnctzlEfJASRnLWKEZ4ZkacixRcaJhy/vDgfdMFT1H5tUqHcIie3B5IcXjkLQnpY
	v5Q5sDNMd5gTSOaaTefFyophNyhGSl9tQEdO463i8USZxsaphTzmZQRxwWp88k7ZybEBw1d6u2b
	uC45jeu9BqlAVq3Z9+TAQOX1izspXA8qiiVI7nys8dd8iFDyizZBAhMv6aZT8s0yQF1SkVfMpcD
	piQjKctxBo5i7uAxEWMwrN8FZQA9bGaMQS75lrxRqrELPQ/BVFC7I1BsfFyJM/oUVGxxq12z5Ln
	gdx5nyeWjHw90s8Ev49fkmiPex44EqEUQYc7MJ90JaQOXuM=
X-Google-Smtp-Source: AGHT+IE+DE3EWv1aKlh94Bz8JA4seu3KmM9WM0s08sjhFrEsGSmGeJUNiSmwpLsmoUUQY8pv5LSvsw==
X-Received: by 2002:a17:902:d489:b0:223:4341:a994 with SMTP id d9443c01a7336-22a8a045de7mr125661005ad.9.1744001227288;
        Sun, 06 Apr 2025 21:47:07 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:47:06 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:28 +0800
Subject: [PATCH v6 19/21] arm64: dts: apple: t8011: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-19-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZNIQgw4HnW0u/JgkpB+HMZ3DOfGGfZVMtPocokF3spo=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iIDBYKpxvsCOwL2YFra0cWiIJPhOHO7+VIH
 kzb6LTpKzuJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYiAAKCRABygi3psUI
 JA7ED/4qJeX7OAK2IxaDn3lKAvbwATBH3e9eb6/T4aEt3yPf2dphL2hEPRe308zOPQgjxDdRwgu
 VTbRUMG44ch6lWi1op3uRNWG5Hz+C1dfV/gPmJ5PcBJEIup+xYIgSQSV/v6I11H7oODuzcnwFSU
 p2SrthI0VbLdpX0U2QevBc/Q4NYvFtcijRssy6a+MaBIW1WeoPBm2QUDj/H4rlKLJQ607KSwIaP
 uNdX+P2cXjJj0wErJyWbSEQqgm+MWYiOS6TGIZSn3YaS4Kw8yTG3wlQIF6+Ei9E6hulkfzabyrl
 Co0dT0cXQXCfLI1vmpGLgbUohPBf3EOTmJe/6dUfWTmdrf06Vh5lCAzLU1Ks+EHDSk92ayMh4tJ
 STPc0re8YtkTUPG6N3tYltGJTWJPS5gUniPl6qugSHTXJF4eEvj443FAqNVrKVy8N6PJIVvFkox
 jWa04QGoA9EKGADBWqNfe1K92iCaTeMfXHoucWH1Dd7qKZ3dnCXzspLX5Eo2gszqq2ffsDqHZnw
 9jOhf7wJVt+OJEguvxiRMZ+kMeVSKIrjTlkQmTY3J1B6vxr/Iz+zZn8pJkA1DSSfbzMXRWhm+bj
 BSeIWwWnW5nonD49y54h1L1tjgV2r01C6ZxqsCSlCnlqtWFgM33gsodoOgIfl00spTbTaKNamdu
 kvcREvQW2nhXT/w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodse for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 5b280c896b760dc8b759bf38dae79060e34dfc19..7fb3ab738f67583d9a19a542bf36ab2806268d55 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -237,6 +237,15 @@ timer {
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
2.49.0

