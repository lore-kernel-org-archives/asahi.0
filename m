Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977C0221F35
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 04:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001170; cv=none; b=fqfOD3EofppOmUPI/o8Y40q3tOlpgReF9ACoeeBerhI672lpg62Vpd16gjAamNDBGP/dckjlfWgwHLzH3hnrMTMV/C7d4PEOVkj2uHUiE/7x3GLbblGxuFc4gOEBeKiY1mhetB1/oqHIjK3v5ksIB8Z10n5t3u/iIB5DAXflJtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001170; c=relaxed/simple;
	bh=nvc6B3SNJrX+OFSnYkWwiXKVem6neRj112hzdXP5HLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gdhYWT488U+D0g4W1mlqRnMQCGKcHUXxJ7PHQ5x4pDfjiqAVp4Ui/aWdd/yHqbQh4pY4dk0ZgULXDslwsI9RmboeIJ8MTSW5ZMzOCGBVM9yUltTwHLHp1Z5xNdlpBWhgX6p3RQzVPayeG7SyAQMPOoRXNV4QUZMbARJPGtiftuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ca0y0AZ1; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ca0y0AZ1"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so5004143a91.1
        for <asahi@lists.linux.dev>; Sun, 06 Apr 2025 21:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001168; x=1744605968; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=;
        b=Ca0y0AZ1zRG3S28MB8o26mzhcbLZv88nNqJuGCvzb7u3HQMeEIO6ityZoN4bkMXbFL
         wDDknOCtvEqJrDInTwkKlBwA5bBKYPG/C0vWvN6vQ5UP+Ag8ymQlEYvn4i3wKK3lcHdF
         mVyHA1otZbtQ46VGfWu/sHcs6hBgG1EVPAs66aXC9/12tdkWknOjIc+EU4ogZpP4K9CY
         4T47cESu/3/rsc0rB56kBOQ/ETcn8yY2gFHVKUp8NNrf47InYN7zjZK9N+c0Pp96qLu4
         I8gLUh9GQcp095OPPY4mhOfcdtQXwdh+xNf0HfN+jo4QH5nqNTBPsfam10JFBRx9TUPr
         RfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001168; x=1744605968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=;
        b=tCNtSWJfIXwsMBq8LliRl4XGgWvcMWCKViZuoMDdKXjQEUl5FadEftC8YdFZ/qvUFg
         zVL1+Ms3CiQ5Oq2UL5Kcz4r//X1Ix+zfWG71eoilC0FMyGJtYTiyjShJ4zhGzkStABYo
         VeNa3ClUiYNdttXpsBf/GOou0kgLyKbT2mxZUHsIiIiRiyazzM10u/h6IJEtN5patF8+
         ZI4rGZ0/yluaDs5vsakWi4+MtMwR4KYFHJY55wlb+ZnmEn6Rw8vmOSiU/czr7xllHvis
         1idyZ69W4HL4rIYq9ahWVEVnq4lkw5ouxPllhVRT73Z9YCYLx+tr9I5CSoiZrHrPgzWI
         xQLg==
X-Forwarded-Encrypted: i=1; AJvYcCUedwWEggB4YN24REJHtfOWcZL2AQ4WJ2kvlV8rW5dDwst4CN0aaU13VfpwuVJwy4k8kOJwJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIbVf4lH5kKJcmaXV8ExJFbG17EJK1xosTVeQsLqg/+p8pjXYS
	tr4agT2QEgAJKxIU5GTvZRoCqNO9hPuMhq6EIdVr5wvrPM6iSGGz
X-Gm-Gg: ASbGncvakZrhWr7XJH0iwlkGzDRlq7KSjNzksiqk3GBAahbpAuQJ3jjzqjsiqsiFOhR
	uIEWjKw4bNCbxBQKnwNioR2xyR/Amy9cp010lP0HiEqGYJZJYzLTKCWSoSzOrN6SgT4bbHSlokJ
	6zXwMRWS9eLD59pErnWeW0fbMd7WibYsPEj+QU8LlyZ/OKBeRMXPjc76rA2svUOJDV4CmG1+CO9
	5v2KmG/CvJ2QksNomFx/fDV6YKnakqQlqNqra5oO30Pa8NuIAlQLU47M0653eZlqRMjFtSsNzik
	HZMx/mZMBI4qCMnCrfz+NS2zK/m9475lbXHzdAwdZnjdIzE=
X-Google-Smtp-Source: AGHT+IF1fu350WMzUZDgPUrlnEXOfKAvpN7C/Nc23rVrH915BK/JSrjVQxpreRgv9N+/+mDCPJ/kfQ==
X-Received: by 2002:a17:90b:498b:b0:2fa:1e56:5d82 with SMTP id 98e67ed59e1d1-306a4ec9210mr14199578a91.17.1744001167738;
        Sun, 06 Apr 2025 21:46:07 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:07 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:10 +0800
Subject: [PATCH v6 01/21] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-1-ae8c2f225c1f@gmail.com>
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
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=nvc6B3SNJrX+OFSnYkWwiXKVem6neRj112hzdXP5HLQ=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iF5N0lEK0tQxrovFdNs6/Non4nh/+bWpI/2
 VKz9Lmslc2JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhQAKCRABygi3psUI
 JMWXD/433zs8eXtVNbS+hSlKXj716ZiiEDJp1ttmVLgn1jlsjKilu6WTd5KwYcf8fTdw40qBb1r
 6me48cGkpO1Mma+WITNcvK4rF6CgPariDwIUFIp44h2BtVNWcD6++OvABYd5C208fV1vVceHNiJ
 LkOjfa8LFRfbgT7hmNwUJe4ckNgLdIoKS3fTRvOf5UYRrJFbgy43MVq7TMHDMK/y5tf38xd19kB
 uFQjsDoLf1JqIUczkQHRXwM4ICSSckRjlRHM0hWTKydW4mTkmnDiiqv8dOMYGtBADVqN3dOiKSa
 /y7NQeYudBCPFkHqVN8wbE7r49ZqdOhWSFA437faxXIRhNbSvKOLUW6xg4Io6M5WUxtXHwNGuz/
 PhQ0VSSWzfYsZaSc/ZSftBBIN3rR4lQCjcA0G0Gs5VcboSIdVn6mlPXwefQnb/LGqGOAGjCSGcF
 It/pYXIg2pxTRdAF6/djgHKjhszQY2eRwNL/TZyOLtLcRRCViqO7pgO5BUr2kzDmO90AQoCgTCd
 FbfJh9uY80jJ7cX+IYomb/uvd+3yRs7Ipozi3Wubbnp4o3R92epjynsmhZxUnOYhHotd+rq276K
 q23TiP33IPovipu7ho0nA0oSdagoxIhlnsVdtBPDkS+XzQkp52H6L0tOqezmzW6LVxvAU8GubYP
 x0wOe9TS7dlMmvw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 295963a3cae799a54560557137dd6b3cf4bd00f9..3726e1b78c42f150cf1dc68a6b3aa3541517c311 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,14 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,cyclone-pmu
           - apple,firestorm-pmu
+          - apple,fusion-pmu
           - apple,icestorm-pmu
+          - apple,monsoon-pmu
+          - apple,mistral-pmu
+          - apple,twister-pmu
+          - apple,typhoon-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.49.0

