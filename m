Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE714281523
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 01:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037582; cv=none; b=mdXjneuYoCgMKsXHyEFFywoifxmcraYnhEvXdoz3YiwiLM0XYrzCU5TW3sZJ6BEG8t4v8iDtblPqRFgprLyeOdYYLVk/tVbitiQ8WkQ+un4ZLRWUag8enlSxJpz8qFvtJZZO5fKQUV1ji7kLZPIGu6imAfVubheCDyZSqaeNpnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037582; c=relaxed/simple;
	bh=gOE3a46CDNX3yVDAoVpyrWK4j8QsbYn+HXz/rfkRHIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C1Mk03pZlNdAqaJWK17RRT34nBhP0P5FUEiNc7+iDZyhdBromlkWBw0+maX1m5nmtaglNiXpsE0K6YwWGeyy8psab5DlduY8zZ23ztN6xBQHWeF3LVPGXnV5Qu4ZeoCeC21Qv7a7gtQb+FbhRREc+Yzs6ZZfECJwN5pDF5OmFvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECIKVkUr; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECIKVkUr"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234bfe37cccso49168165ad.0
        for <asahi@lists.linux.dev>; Sun, 15 Jun 2025 18:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037580; x=1750642380; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=ECIKVkUrQ7zcuCUtr/C+p4YixUw3heZjHBzfVmEak5i4BLyjw0pN/oCLc7iS11M/+E
         E2vvomQ9blOZZPECmMyLM9CVT94JeDEhHhQJewYv4Jd56heao0CUo0+EBm0+LMdEfALU
         sfnRsS8X1oCBQB2w8ic3i6cQESVYJ6bz8rUP1DoTZynVZpjz8TQrd9qrKqrlRTiuXA8k
         YDFjySQeD80t2iY93vfV81joQ4+AVMmx+jxEAfc87bAWKPI7+M795ofDj6divc12CtMT
         lUA8QXtj5QbxppZk0+/ulsCDbaw9Cj0CnKGkJIH3krwpvKJ3vcKMRf2TfVDLNkEe+SKO
         qhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037580; x=1750642380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=pSngxV987EgmUHLFu7AX5A8jQCw6Ph03dr4LR/PaTOGObbNS0nLqv7/b7G7nLilV7g
         Vqtfuo48gdr+mEQw6gNuWCoFCQysoTtboIyP07bYyMFfDhUyDSKx6lObicF3QuNpCNKa
         FWZCUzSoLEb3oQrizC5ENErlI3WGFDo+CV/JhWA6H3P4aQuc4qw29tmXWbcvxEKR3gx1
         lnEdpq+jIJsmFXr6qiseeEirrWVOblpNeC2AsjVg9C5jN3nwCxnt03IkC+xziuwaRbzD
         2oOjpMCsjLkyraDOe8QqD9jy/LkHWDBZQoqRaZCnIASS7kAKP6UBLQbSCdu1VVW2X6KR
         LTQA==
X-Forwarded-Encrypted: i=1; AJvYcCUC6EK+VGqb9Bdn/hf2VP7DFxuRmIy8I/NszZRMpmd6mvRnpCzunZEKiEp6bDqQfsDDufJYSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ/kmPbf/s2gNg5K5ny4irYXcZP9JjmiH/YQcWD2+UJlJRvz39
	cEwc4YozAr13Yh7ZRSfP4ABmiAJN2/k9MI/A8NfDtrZq+gwQqPueTsB4
X-Gm-Gg: ASbGnct8S9RFLPGQGxO/OiOmOYq+nymGqwnbjZdvUtdFEiUzIfxUWeBMTG6l9PFyFIa
	HecMHLHkdh4ZV89xoTun3dkpY9HpqWx7xjce7Cg8GSWNJL/Sp+7JWQYvBsS3WXqiqHfPNlBP+59
	+YvfD+dvUFEuc2wFICO1SnuSMVMzxEWHLvwmYWYydQ2wJ36KmEGOUOxlByz7df/W68vosE/gNQj
	cgXSqKGbeaW68tIbbOplPXeM/IzVPnaET4YlYcqLe6wYuMIo0crWUqwjNhmH0EDc00w+/n4JRdt
	gUdWDouoHxiruWc9NnaqEGoTzlPFrZ++sKoGHECtsgLlxAXvzCKTXXNI6UvPcBZFaZb/LWJVyX6
	hD5g=
X-Google-Smtp-Source: AGHT+IGgk+UDqjGBXQ/jAlFUVtNuJ28xq8CqF7zuw/GIVK0covhXtNdMSPcYwH3H5HMFOq3rIKm2Dw==
X-Received: by 2002:a17:903:ac8:b0:234:909b:3da9 with SMTP id d9443c01a7336-2366b14d30cmr105655215ad.27.1750037580157;
        Sun, 15 Jun 2025 18:33:00 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:59 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:03 +0800
Subject: [PATCH RESEND v7 14/21] arm64: dts: apple: t7000: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-14-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
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
 h=from:subject:message-id; bh=gOE3a46CDNX3yVDAoVpyrWK4j8QsbYn+HXz/rfkRHIk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QZEW1fC8sK/zRP5v9tHDE78di18+WRlDWek
 8rJMpr5rlqJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GQAKCRABygi3psUI
 JOBxD/42w9CY3rh2s/hF+0SwApMmvqGWI9Zb94hNeuEMx30t1pV0FOug7/1+RcLNSNw6faVlCY6
 PmZu4VjpZSq7S1wJytSvk+X8/WwjvkEeUIQD20i1XFH++kNKH5Hz7o8jiIw2Hy98JO2Bm1GF8pO
 7OAu1fmNopUdue7TTnNyAT/psmj4YRgF6U+g9f3muDHqaVi4QQhkcqElY2h6/nBBt2LP1kwa/pN
 Q8YMH9Szg6a9drSDq0GuVKAHLNBk2olT3LBVuuE8nJ9JURZYIm03Ql7fBTGdq2DSvFu0Yxs9gkt
 E+2TeS+yoVaKI6Nwicdz++kTytPjWyyYnnp+jq+p/szMSaJJkIjO4MmYBAY5wRCAjswDFEv5NXu
 gHC9B7VHEqwWdKv6M1ZG5i0sYq02PFaQtuFU5pWLGsumM96/HMDXjTW9K0CMPcCQEEXIjV8L9tp
 sP8QCN6NxIeW6ugXkbBvzNbQ1yE+m2QL1aS8KlKN3hZbonCkSQclAtEHD6UpIFDI7m0quUOLdDe
 tdFG0GzOgcShiymHZdgxnbdgZiSv1eU++hR4kXnEix7dr5NDhN64vvF5xCfh+PqnW6HkZ4/h+Ce
 Wkj9YEzlaGHAeaw3+CbpFfAYjO8bkZm5LbSkuxzFcUfTuXV+M4t58UEZLtaD+6yUPfF2f3Q+HJU
 yejpG1ouBFAW4IQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 85a34dc7bc01088167d33d7b7e1cdb78161c46d8..f1415f50cb150ce1d33999c817243c3dc9184199 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -193,6 +193,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t7000-pmgr.dtsi"

-- 
2.49.0

