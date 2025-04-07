Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDAD227EA7
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 04:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001226; cv=none; b=hM6qc4cYqcB/22fClxPQtJ0TPgiwYVIl+bTAXuRjMx6rc07IlcG9tqHlMZBaAtEGGvqFX7L5tbsMtx4aBk34nQwwd/ToxSrY+okFfE2LElIm1gcTOPF2nup0U5/iC3Gdu50v487reCAxQv+yVCkkERzQexNfZj7pvJz7Fz3AK+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001226; c=relaxed/simple;
	bh=kZviMfYtRCR7gR5VoFkDRwcKeTgAqfWp35C3egDQLf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOISyeBft3FZuWGc+aCwaxV5Xgs11QWdANaRwWzsfE8XZ+XPTG0JkC4SQqgeK8PV5yRkOseV0POj1WjpwdDdEtS3aKeS7reLaNReiMKc5l+Yho0BBwliaDxnetfbwbYyGakDjAXGBuRerxDRvDzNaAEP5+eN+G5lXOHeGG+ed5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfOmFIJV; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfOmFIJV"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3054ef26da3so3001007a91.3
        for <asahi@lists.linux.dev>; Sun, 06 Apr 2025 21:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001224; x=1744606024; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=RfOmFIJVicu5m0ZgiFEavPtkgmLWVFUQoKGUd11ayQE8FYBxsl7YwjFXZVbN6dWeN6
         mkjqQM85YxKhOne7FPmFhMKFYBloHyGTD5OtKw5/KjQrDg/lf3WKRFmtfHBFwomCsqLK
         tDa8PhRK+ddDIE/7hVT2tp3oBPbFYAUFPCX8E1Z7IzkT0dxzMGyMU4GIrTGgLs0lFz3z
         2Six/cARRQYmVpSDRIFgDUF12bsJkis1xffD7wBqnh7JWGkdu1H1Rjw5x0+bCUqX5fER
         07ZKL4JK0IUU7BZhN0VHX0eZ/FQ9QxiGxW+j8kPQLpvhrj7QpsTF5iRGyTNiKjNwhhZS
         U5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001224; x=1744606024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=v+lwN5YcdR1ucrYI53ZtYbI3hfNyo5NqElI71JuJxQ9Y0linpDgkomFcgQ2fuiAkQD
         UKRQKpsRZa5fwqhK+qFxL4J/Ob5m8cVy/oGYmKGvznys/JtsWYoIFBVXVOB3tMf+uCNA
         SEF6risCa7h/99FJXQ7gISJBJKSYBnrRH8fNPs35PyeyEcs78AGfF0jwkU2VbUbaPMkT
         AyL5I/SOI2SUogB82x4MxrpEr9tBRx+hhilJNJb8D7RyCTzR7trxgk79ZMmVUrXDgaK3
         LwtaMbsNQcfrMS11SOPCwcYp2HnKS6FgIZzHgiUPmHQ0M9AL81/xJZzcbCjq4foMOz4D
         vohw==
X-Forwarded-Encrypted: i=1; AJvYcCWXlktzTXwQAzMsNUhMyEyg3hWBp5O+ysJAUwQqjPZ0FpYhcwZYbanlZg/D/IDMlt6psdtMig==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeQfXOpIrz7TCY0HWuD/95a/zftal5Idfd/6/Em02jPTK7BNAf
	wRp+jOtz412BjSOVOAgfUb1KS9GhJLge9y+WcVYZwFwgKyhnl1pr
X-Gm-Gg: ASbGncuiKRs6foIRCQSYhPIRmtmAV1fKHfIrcUx0rMgBRtSW6vMNrwH7jygHDPrTb7y
	SlsoghTDUvjirw81tldtf7E58hvuw4EzFTXO92TBA+RegSAbMsboapWGKoHKmKJzE7BS3KHanZR
	k1Fi49gDhnNGrwkZOmGGMuB5JEAwGhqrAoXPNRorNAgcfQz8wxJFMILihHWikn17dvxnIuHtPBq
	tUL39lLs8iU/OG6sSg+SAJLMYNBnJJYL5gU06gY0+n/HzJ5acpbM5op8/TqXMp1HBVO2IUztIcJ
	LLgrIvVJW4gUW5QOdGuJFbl8v6uyHqrb8dbmpXbjiJJj0L0=
X-Google-Smtp-Source: AGHT+IE0r8ZCa3wPwQVT2JXNI8jjTdmqctdoQ9nSxWYmL0fJFs8RNi2jnGeP8GXAxNy75fDe1TLsxg==
X-Received: by 2002:a17:90b:2e42:b0:2fe:99cf:f579 with SMTP id 98e67ed59e1d1-306a4823704mr15643498a91.4.1744001224016;
        Sun, 06 Apr 2025 21:47:04 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:47:03 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:27 +0800
Subject: [PATCH v6 18/21] arm64: dts: apple: t8010: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-18-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=kZviMfYtRCR7gR5VoFkDRwcKeTgAqfWp35C3egDQLf8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iIkXiBrt3zrY3WJU1Kcvs+HkHwDmKaSnZQu
 kGBfrQgRP+JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYiAAKCRABygi3psUI
 JCG3D/9wNW8HJ5mruLZkPUoQshdnt8LlV1N3TSdbYEVZCHi+53035DIKB6OeCqrhv87BUBlo/Gf
 AabxUgFWRTwl+r+1x7kZ7KjaJbol//DjdhwBPICwk5pVuOTgU56S6jAQjOWh3/6gkMcQ/k378Qn
 E8x21FUSanhbMKKyz8QYeJ4O5IhJ3hL2FPcjug/0fwnDei4SnN6VdEpnorjm7mTKVHqlEWKaHDQ
 Wzeaw8FAVWM50hZYfJvf3et9/hSiBBsq+0P9UALilKn0r1RVboM/DZYz2BEoOFAoUxPUaE81mr9
 /Olcp7mpDuO3E/AqhyobaKSIavT6HPajfQmbe9w8z0o+3es/jad5zxM4H52KANmZZeSrmx4gvR8
 7qK9i8er7GwPSxfLjpUsc0jLEJcP4VkxiqyRFH/+R+ROGoQjZPIqH7UaRhO4z9XsCSDoonxCbUr
 OpDOi5YgL3okxqO4Vsn+k2oGCLuXbfQn6D7EnZEkBYLook0JMWkBAqSApzY3W+JCpz+idbbUvUU
 b/7T+dmzJ1LxHgtt4hu5SlyVR6X5aH3M8ToxUqY5ZJVDXPFf0ht5Y0BMujay7mnERFbMcCul53r
 CaSZIJRO2fuQ3nfgy9IPC4lArYJVBgCyN51pcA4b8jfZqXHrAU08ArLGkVi80thybNCAG61qmRI
 javzEDOo8L9iMaA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index 17e294bd7c44c7961cc3ba0ec5f4178840d5b9c6..cbffc84480379cb476d5caaecce91f746e862354 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -243,6 +243,14 @@ timer {
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
2.49.0

